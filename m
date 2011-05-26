Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPXpf-0004ub-8R for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 12:30:23 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QPXmd-0005UZ-8A; Thu, 26 May 2011 12:27:15 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306342881.2525.258.camel@phil-desktop>
References: <1306342881.2525.258.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 26 May 2011 11:27:12 +0100
Message-ID: <1306405632.2525.306.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: RDEPENDS_${PN} and virtclass-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 May 2011 10:30:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 18:01 +0100, Phil Blundell wrote:
> Now, leaving aside the question of whether it is reasonable for prelink
> to be depending on transfig,

This also seemed worthy of a bit of further investigation.  Here's what
I found out:

The dependency on transfig-native was added by commit
2fbcf1419909cf2840d56bf461ab04f8298f14c6, on the grounds that fig2dev is
needed to build the prelink documentation.  Which seems reasonable
enough on the face of it, except that (a) we probably don't want to
build documentation (or depend on transfig-native) for the -native
package; and (b) the documentation build had already been disabled, for
both native and non-native prelink, three days previously by commit
66e6a9798e5462a6cd8dce22a400b81f1dcae88b.

So, right now, it seems that the dependency on transfig-native is
entirely redundant and I think commit
66e6a9798e5462a6cd8dce22a400b81f1dcae88b can/should be reverted.  In the
longer term it seems like switching the documentation back on for the
non-native prelink would be a good thing to do.

p.




