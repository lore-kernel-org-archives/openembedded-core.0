Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TJ34K-0002fj-Ms
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 16:03:28 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TJ2ro-0003zV-GE; Tue, 02 Oct 2012 15:50:32 +0200
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 02 Oct 2012 14:50:31 +0100
In-Reply-To: <1349177925.15753.140.camel@ted>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349185832.32611.86.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 14:03:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-02 at 12:38 +0100, Richard Purdie wrote:
> On Tue, 2012-10-02 at 12:15 +0100, Phil Blundell wrote:
> > On Tue, 2012-10-02 at 12:12 +0100, Richard Purdie wrote:
> > > Hasn't Paul added a general mechanism for doing this so we could add
> > > this feature a level higher so that it could be used by all packaging
> > > formats?
> > 
> > Ah, possibly.  I'll have a look.  Can you give me a pointer to the
> > mechanism you were thinking of?
> 
> Something like IMAGE_FEATURES += "dbg-pkgs" should trigger the addition
> of dbg packages.

Ah yes, I see it.  It looks like that will cause the debug packages to
go into the rootfs itself, rather than a parallel tree, but I guess I
can probably arrange to fish them back out again before the image is
built.

thanks

p.




