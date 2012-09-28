Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THd6V-0003k6-To for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 18:07:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SFsmv2012682;
	Fri, 28 Sep 2012 16:54:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12304-04; Fri, 28 Sep 2012 16:54:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SFseW8012676
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 16:54:41 +0100
Message-ID: <1348847682.15753.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Garman <scott.a.garman@intel.com>
Date: Fri, 28 Sep 2012 16:54:42 +0100
In-Reply-To: <cover.1348532322.git.scott.a.garman@intel.com>
References: <cover.1348532322.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/58] denzil pull request 2
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
X-List-Received-Date: Fri, 28 Sep 2012 16:07:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 17:24 -0700, Scott Garman wrote:
> Hello,
> 
> If this works I'll hopefully be submitting the cover letter only,
> this patchset is pretty big. 
> 
> I've got a lot of patches for denzil now that I'd like to get merged
> before they get too out of hand, so here is my pull request for it,
> along with autobuilder output and explanation.
> 
> Note, the autobuilder run was done with my poky-based branch.
> 
> nightly-x86:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/729
> 
> All builds green except for atom-pc, which fails during build_hddimg of
> do_bootimg due to the kernel image file not being found in the target
> sysroot.
> 
> nightly-x86-lsb:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-lsb/builds/61
> 
> Same status as nightly-x86.
> 
> nightly-x86-64:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64/builds/658
> 
> 100% Green
> 
> nightly-x86-64-lsb:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64-lsb/builds/59
> 
> 100% Green
> 
> nightly-arm:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/658
> 
> 100% Green
> 
> nightly-arm-lsb:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm-lsb/builds/57
> 
> 100% Green
> 
> nightly-mips:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/631
> 
> 100% Green
> 
> nightly-mips-lsb:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips-lsb/builds/56
> 
> 100% Green
> 
> nightly-ppc:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/612
> 
> 100% Green
> 
> nightly-ppc-lsb:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc-lsb/builds/58
> 
> 100% Green
> 
> nightly-non-gpl3:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/285
> 
> 100% Green
> 
> nightly-multilib:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-multilib/builds/286
> 
> 100% Green
> 
> nightly-tiny:
> http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/265
> 
> 100% Green
> 
> The following changes since commit 95756cfbb7a9348b23cb46a49a5509e57e973faf:
> 
>   valgrind: fix default.supp missing issue (2012-08-21 11:19:26 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next-pull2
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next-pull2
> 
> Bruce Ashfield (4):
>   linux-yocto: allow do_validate_branches to handle all branches
>   kernel-yocto: set master branch to a defined SRCREV
>   kernel: save $kerndir/tools and $kerndir/lib from pruning
>   kernel.bbclass: add non-santized kernel provides
> 
> Constantin Musca (1):
>   pulseaudio: upgrade to 2.1
> 
> Cristian Iorga (4):
>   gst-plugin-bluetooth: update to ver. 4.101
>   bluez4: update to ver. 4.101
>   pulseaudio: upgrade to 2.0
>   libcanberra: upgrade to 0.29
> 
> Darren Hart (1):
>   kernel: Add kernel headers to kernel-dev package
> 
> Denys Dmytriyenko (1):
>   pulseaudio: fix typo in the patch name, pulseaudo -> pulseaudio
> 
> Dongxiao Xu (1):
>   bluez-hcidump: upgrade to version 2.4
> 
> Franklin S Cooper Jr (1):
>   psplash: LIC_CHKSUM Tweak
> 
> Franklin S. Cooper Jr (1):
>   u-boot: Use fw_env.config if avaliable
> 
> Jeff Polk (1):
>   recipes-core/eglibc-2.13: Patch for locale-base-tt-ru packaging
> 
> Jonas Danielsson (1):
>   bluez4: make alsa support conditional upon DISTRO_FEATURES
> 
> Kang Kai (1):
>   ltp_20120104: add rdepends
> 
> Khem Raj (3):
>   kernel.bbclass: Dont package kxgettext.o
>   libatomics-ops: Make it build for SH4
>   pulseaudio: Always enable NLS
> 
> Koen Kooi (2):
>   man: fix RDEPENDS and reformat recipe
>   man: make man actually work by installing custom man.config
> 
> Marcin Juszkiewicz (1):
>   libpam: disable NIS to not link with libtirpc when it is available
> 
> Martin Jansa (5):
>   package.bbclass: fix TypeError in runstrip
>   opkg-utils: bump SRCREV for Packages cache fix and other fixes
>   opkg-utils: bump SRCREV
>   kernel.bbclass: pass KERNEL_VERSION to depmod calls in postinst
>   pulseaudio: fix pulseaudio-server RDEPENDS
> 
> Matthew McClintock (8):
>   dbus.inc: disable selinux for native builds
>   glib.inc: disable selinux for native builds
>   eglibc/gcc: add patches to fix eglibc 2.15 build
>   distutils.bbclass: fix libdir for 64-bit python modules built with
>     distutils
>   distutils.bblass: change order of args to install step
>   eglibc_2.15: make patch only for Freescale machines
>   valgrind_3.7.0.bb: fix missing leading space on _append
>   sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we
>     have items to check
> 
> Paul Eggleton (2):
>   classes/mirrors: remove bogus gnutls mirror
>   dhcp: remove dependency of dev/staticdev packages on main package
> 
> Radu Moisan (1):
>   dbus: include dbus-launch in the main dbus package
> 
> Richard Purdie (5):
>   distutils/steuptools: Fix files layout and unbreak builds
>   opkg-utils: UPdate to version with python 2.6 fix
>   autotools.bbclass: Add functionality to force a clean of ${B} when
>     reconfiguring (and ${S} != ${B})
>   dbus: Ensure dbus-nativesdk doesn't RPROVIDE dbus-x11
>   texi2html: Fix perl location on recent distros
> 
> Ross Burton (1):
>   pulseaudio: remove ConsoleKit dependency
> 
> Saul Wold (7):
>   build-appliance-image: Update SRCREV to Denzil 1.2.1
>   build-appliance-image: Add vmx* files and build zip file
>   build-appliance: add zip-native, which is needed to build the final
>     zip bundle
>   python-pygtk: Upgrade to 2.24
>   kernel: Fix packaging issue
>   bluez4: fix packaging issue after update
>   pulseaudio: disable tcpwrap by default
> 
> Scott Garman (2):
>   relocatable.bbclass: Account for case when ORIGIN is in RPATH
>   kernel.bbclass: put perf .debug dir in -dbg package
> 
> Valentin Popa (2):
>   build-appliance-image: rename from self-hosted-image
>   xz: updated to version 5.1.1alpha
> 
> Xin Ouyang (1):
>   libatomics-ops: update to the latest version 7.2
> 
> Zhenhua Luo (1):
>   valgrind: fix debug info reading error when do memcheck on ppc
>     targets

I've merged this, thanks. I did pull in the fix I mentioned since
without it, any bootimg.bbclass based images would fail and I'm
confident its the right fix.

Cheers,

Richard



