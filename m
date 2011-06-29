Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qbssl-0000qZ-RI for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 13:24:35 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QbspD-00015A-Sg
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 13:20:55 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309346415.2551.14.camel@phil-desktop>
References: <cover.1309311666.git.mark.hatle@windriver.com>
	<c2e9613af3f240b6310bc596d06a199dd9e2bcef.1309311666.git.mark.hatle@windriver.com>
	<1309346415.2551.14.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 12:20:54 +0100
Message-ID: <1309346454.2551.15.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/2] prelink_git.bb: Only block the postinst script when no image-prelink
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
X-List-Received-Date: Wed, 29 Jun 2011 11:24:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 12:20 +0100, Phil Blundell wrote:
> On Tue, 2011-06-28 at 20:42 -0500, Mark Hatle wrote:
> > +# If we're using mklibs-prelink, we want to skip this on the host side
> 
> Is it really "mklibs-prelink"?  I thought those were two different
> things.

Ah, nevermind, I see you changed this in v2.

p.




