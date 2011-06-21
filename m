Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZ2Oh-0004ox-Pn for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 16:57:47 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZ2LH-0002hX-TU
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 16:54:16 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110621140419.GA8589@raven.pace.internal>
References: <20110621140419.GA8589@raven.pace.internal>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 21 Jun 2011 15:54:07 +0100
Message-ID: <1308668047.21613.30.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Using TCLIBC = "uclibc" in oe-core
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
X-List-Received-Date: Tue, 21 Jun 2011 14:57:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 15:04 +0100, Tom Parkin wrote:
> The attached patch allows me to (at least) assemble the bitbake task
> list when TCLIBC = "uclibc".  I'm not sure whether this is the correct
> approach, though.

Do you know why glib-2.0.inc is doing this crazy thing in the first
place?  If we're going to have code in the config files to effectively
make it think that USE_NLS is always on, maybe that check should just be
removed.

You're right though that the current line in tclibc-uclibc.inc is
clearly just wrong and should be either fixed or deleted.

p.




