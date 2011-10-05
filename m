Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RBWLz-0005mP-2W
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 20:38:03 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RBWGc-00022M-FG
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 20:32:30 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1317814555.14671.137.camel@ted>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-5-git-send-email-msm@freescale.com>
	<4E8B9F2C.5030706@gmail.com>  <1317814555.14671.137.camel@ted>
Date: Wed, 05 Oct 2011 19:30:45 +0100
Message-ID: <1317839445.2979.0.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 5/6] Fix sysprof for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 18:38:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 12:35 +0100, Richard Purdie wrote:
> On Tue, 2011-10-04 at 17:05 -0700, Khem Raj wrote:
> > On 10/4/2011 3:03 PM, Matthew McClintock wrote:
> > > sysprof will not build properly without this defined
> > >
> > > Signed-off-by: Matthew McClintock<msm@freescale.com>
> > > ---
> > > No comments on original patch sent
> > >
> > >   meta/recipes-kernel/sysprof/sysprof_git.bb |    2 ++
> > >   1 files changed, 2 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
> > > index 10bde04..271b5d8 100644
> > > --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
> > > +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
> > > @@ -16,6 +16,8 @@ SRC_URI_append_arm  = " file://rmb-arm.patch"
> > >   SRC_URI_append_mips = " file://rmb-mips.patch"
> > >   SRC_URI_append_powerpc = " file://ppc-macro-fix.patch"
> > >
> > > +export CFLAGS_append_powerpc64 = " -D__ppc64__"
> > > +
> > 
> > this is a gcc built-in define I wonder why you need to add it explicitly
> 
> Are you sure? Is the built-in define not __powerpc64__ ?

Yes, __powerpc64__ is the generic one.  I think __ppc64__ is only a
predefine on Darwin.

p.




