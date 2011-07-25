Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlP48-0002UP-SG
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 19:35:40 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlP06-0000xE-My
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 19:31:31 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <lyvcuqi8we.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1311603506-14101-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1311612593.30326.256.camel@phil-desktop>
	<lyvcuqi8we.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Mon, 25 Jul 2011 18:31:25 +0100
Message-ID: <1311615085.3098.0.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] ncurses: enforce creation of pkg-config files
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
X-List-Received-Date: Mon, 25 Jul 2011 17:35:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 19:10 +0200, Enrico Scholz wrote:
> Phil Blundell <philb-mXXj517/zsQ@public.gmane.org> writes:
> 
> >> +-	if test -n "$PKG_CONFIG_LIBDIR" && test -d "$PKG_CONFIG_LIBDIR" ; then
> >> ++	if test -n "$PKG_CONFIG_LIBDIR" ; then
> >
> > I wonder if it would be easier to just create the directory in
> > do_configure() 
> 
> This directory is in the staged sysroot
> (e.g. ${TMPDIR}/sysroots/kk-trizeps6//usr/lib/pkgconfig). Is it really
> permitted to touch this area outside of the normal staging?

Oh, yeah, maybe not.  In that case I guess your patch probably is the
best answer.

p.




