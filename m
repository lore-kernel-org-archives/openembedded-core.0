Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8rzD-0002jx-A5 for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 13:07:35 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SB8Rt1000654; Wed, 28 Sep 2011 12:08:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DvMQkU9iznky; Wed, 28 Sep 2011 12:08:27 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SB8Ncv000644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 28 Sep 2011 12:08:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 12:01:58 +0100
In-Reply-To: <CAMKF1soGHw1bVLuSr5ObW1JdBLsdpr+jcHCn8ziyJUYS-bHZkw@mail.gmail.com>
References: <fd038ffaa07466c14dc983049a9a99989d33be9b.1317094542.git.raj.khem@gmail.com>
	<2d1632c2b19963e3dc625522d1284ce6262c2492.1317094542.git.raj.khem@gmail.com>
	<4E825740.4080609@intel.com>
	<CAMKF1sonKcofEmxWGdY7cS5gPyYMCTKG9q9CE9siCEY=ae9S+g@mail.gmail.com>
	<4E827242.2030703@intel.com>
	<CAMKF1soGHw1bVLuSr5ObW1JdBLsdpr+jcHCn8ziyJUYS-bHZkw@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317207726.26109.239.camel@ted>
Mime-Version: 1.0
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 3/4] eglibc: Add recipes for 2.14
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
X-List-Received-Date: Wed, 28 Sep 2011 11:07:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-27 at 18:13 -0700, Khem Raj wrote:
> On Tue, Sep 27, 2011 at 6:02 PM, Saul Wold <saul.wold@intel.com> wrote:
> > On 09/27/2011 05:17 PM, Khem Raj wrote:
> >>
> >> On Tue, Sep 27, 2011 at 4:07 PM, Saul Wold<saul.wold@intel.com>  wrote:
> >>>
> >>> On 09/26/2011 08:39 PM, Khem Raj wrote:
> >>>>
> >>>> Backport Fedora patch to enable sunrpc as it was in 2.13
> >>>> Fix cross-localedef-native to be able to build from eglibc 2.14 branch
> >>>>
> >>>> Tested builds/boot of angstrom/console-image on qemu for
> >>>> arm,mips,ppc,i386,x86_64
> >>>>
> >>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> >>>> ---
> >>>>  .../eglibc/cross-localedef-native_2.14.bb          |   44 ++
> >>>>  .../eglibc/eglibc-2.14/IO-acquire-lock-fix.patch   |   17 +
> >>>>  .../eglibc-2.14/armv4-eabi-compile-fix.patch       |   25 +
> >>>>  .../eglibc-2.14/eglibc-rpc-export-again.patch      |   69 +++
> >>>>  .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
> >>>>  .../eglibc/eglibc-2.14/generate-supported.mk       |   11 +
> >>>>  .../eglibc/eglibc-2.14/ld-search-order.patch       |   56 ++
> >>>>  .../eglibc/eglibc-2.14/mips-rld-map-check.patch    |   26 +
> >>>>  .../eglibc/eglibc-2.14/multilib_readlib.patch      |   17 +
> >>>>  .../recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch |  538
> >>>> ++++++++++++++++++++
> >>>>  .../eglibc-2.14/shorten-build-commands.patch       |   82 +++
> >>>>  .../eglibc/eglibc-2.14/stack-protector-test.patch  |   35 ++
> >>>>  meta/recipes-core/eglibc/eglibc-initial_2.14.bb    |    6 +
> >>>>  meta/recipes-core/eglibc/eglibc-locale_2.14.bb     |    1 +
> >>>>  meta/recipes-core/eglibc/eglibc_2.14.bb            |  219 ++++++++
> >>>>  15 files changed, 1167 insertions(+), 0 deletions(-)
> >>>>  create mode 100644
> >>>> meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
> >>>>  create mode 100644
> >>>> meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-fix.patch
> >>>>  create mode 100644
> >>>> meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-compile-fix.patch
> >>>>  create mode 100644
> >>>> meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again.patch
> >>>>  create mode 100644
> >>>>
> >>>> meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-lowlevellock-include-tls.patch
> >>>>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
> >>>>  create mode 100644
> >>>> meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk
> >>>>  create mode 100644
> >>>> meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch
> >>>>  create mode 100644
> >>>> meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-check.patch
> >>>>  create mode 100644
> >>>> meta/recipes-core/eglibc/eglibc-2.14/multilib_readlib.patch
> >>>>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch
> >>>>  create mode 100644
> >>>> meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
> >>>>  create mode 100644
> >>>> meta/recipes-core/eglibc/eglibc-2.14/stack-protector-test.patch
> >>>>  create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.14.bb
> >>>>  create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.14.bb
> >>>>  create mode 100644 meta/recipes-core/eglibc/eglibc_2.14.bb
> >>>>
> >>>
> >>> Khem,
> >>>
> >>> This one seems to have had a problem on mips, when I built it on the
> >>> Autobuilder, I get the following failure:
> >>> checking for ld --version-script... no
> >>> | *** WARNING: You should not compile GNU libc without versioning. Not
> >>> using
> >>> | *** versioning will introduce incompatibilities so that old binaries
> >>> | *** will not run anymore.
> >>> | *** For versioning you need recent binutils (binutils-2.8.1.0.23 or
> >>> newer).
> >>> | checking for .previous assembler directive... yes
> >>> | checking for .protected and .hidden assembler directive... yes
> >>> | checking whether __attribute__((visibility())) is supported... yes
> >>> | checking for broken __attribute__((visibility()))... no
> >>> | checking for broken __attribute__((alias()))... no
> >>> | checking whethERROR: Function 'do_configure' failed (see
> >>>
> >>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips-poky-linux/eglibc-2.13-r17+svnr14157/temp/log.do_configure.1476
> >>
> >> this here tells me that its compiling eglibc 2.13 not 2.14
> >> did you change EGLIBCVERSION to 2.14 in
> >> meta/conf/distro/include/tcmode-default.inc ?
> >>
> > Nope, that might be my problem, so something is getting hosed around for
> > mips because everything else is building OK.  Maybe it's one of the compiler
> > changes or does that need tcmode changes also?
> 
> compiler does not need version change. I am not sure whats going on there
> its cross binutils thats not installed properly and thats why the test
> is failing
> 
> Did u try a build from scratch ?

I'm pretty sure this would be a build from scratch.

In an effort to pin down the problem, I've not taken the gcc update yet,
just to be sure we can rule that out. I'm not sure how this could be
eglibc since we've not enabled the new version yet. I did therefore take
that patch.

Cheers,

Richard



