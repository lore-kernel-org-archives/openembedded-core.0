Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoGvO-0003qn-DR for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:35:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69GNrvm008870
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 17:23:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08270-05 for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 17:23:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69GNliu008864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 17:23:47 +0100
Message-ID: <1341851027.8066.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 09 Jul 2012 17:23:47 +0100
In-Reply-To: <20120709095616.GC6308@jama.jama.net>
References: <cover.1341763345.git.raj.khem@gmail.com>
	<CAMKF1soHqgDKwCFBhJm62JhYK56eie2VzGFRt3p7WGeGHVHJ1A@mail.gmail.com>
	<20120709095616.GC6308@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2 00/14] eglibc 2.16
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
X-List-Received-Date: Mon, 09 Jul 2012 16:35:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-09 at 11:56 +0200, Martin Jansa wrote:
> On Sun, Jul 08, 2012 at 09:26:12PM -0700, Khem Raj wrote:
> > On Sun, Jul 8, 2012 at 9:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > > V2:
> > >
> > > Additionally, changed gcc to use git fetcher
> > > update E5500/E6500 patches for gcc and binutils (backported from mainline)
> > > images form p5020ds 32/64 bit built fine. (btw. it does not build with eglibc-2.15)
> > > Updated eglibc rpc patch needed for cross build from scratch
> > > Updates the gets patch for busybox now its a backport instead of
> > > home grown.
> > >
> > > bitbake world works clean for ppc/x86/x86_64 , for mips and arm
> > > the failures are prexisting.
> > > mips - webkit and pseudo fail to build
> > > arm - guile-2.0 and pseudo fail to build
> > >
> > > V1:
> > > This patch adds eglibc 2.16 recipes. I was able to build world
> > > on x86 except perf which was failing with 2.15 as well.
> > >
> > > I have also build and run core-image-sato on all qemus
> > >
> > > I did not remove 2.15 to allow some soak in time.
> > >
> > > The following changes since commit 8f16811a8d51982a8b3d70e6087aef4a41926840:
> > >
> > >   bootimg: Use STAGING_KERNEL_DIR (2012-07-06 09:38:17 +0100)
> > >
> > > are available in the git repository at:
> > >
> > >   git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.16
> > >   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.16
> > >
> > > Khem Raj (19):
> > >   mirrors: Add debian archive snapshot mirrors to search list
> > >   gdb: Replace struct siginfo with proper siginfo_t
> > >   busybox: Include sys/resource.h for rusage definition
> > >   coreutils: Fix build with eglibc 2.16
> > >   diffutils: Fix build with eglibc 2.16
> > >   udev: Fix build with eglibc 2.16
> > >   gettext,m4,augeas,gnutls: Account for removal of gets in eglibc 2.16
> > >   bison: Fix for gets being removed from eglibc 2.16
> > >   grub,guile,cpio,tar,wget: Fix gnulib for absense of gets in eglibc
> > >   boost: Upgrade recipe to 1.50.0
> > >   puzzles: Fix checksums
> > >   valgrind: Fix build with eglibc 2.16
> > >   libpam: Fix build with eglibc 2.16
> > >   gcc-cross-initial.inc: Use BFD ld as default always
> > >   gcc: Switch to git SRC_URI
> > 
> > more testing shows that switching to git is causing do_unpack tasks
> > from various gcc recipes to have
> > different checksums and that triggers rerun of do_patch do_unpack
> > tasks in shared workdir and does not
> > go well. so I pulled the above commit out for now until we sort the
> > real reason why this is happening by just switching the fetcher
> > 
> > second problem is that it messed the upgrade path since 's'vn sorts
> > after 'g'it and they appear in PV
> 
> yes wait with svn->git switch for 4.7.2 release and corresponding SRCREV
> bump
> 
> or bump PE in gcc recipes
> 
> or bump PR in a lot of packages which has runtime dependency on
> libstdc++ or libgcc, but this doesn't fix upgrade path for gcc recipes
> already installed on target :/.

How about updating to 4.7.1.0 in PV to let us avoid this issue and then
this will automatically resolve itself come 4.7.2?

Cheers,

Richard





