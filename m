Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QRNuQ-0001II-G5; Tue, 31 May 2011 14:18:54 +0200
Received: by gyf1 with SMTP id 1so1870183gyf.6
	for <multiple recipients>; Tue, 31 May 2011 05:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=7E/JlBVOgGScvksi/lqZuX3ZAGj172GlAS11FyTa91s=;
	b=mGK6Ti2vbHCsw90G590kjFZ9rl2+WswHjcsjlUatzu/Pj/LlJ6tUyQExRmEeTYcxT1
	s3nGPKzciTsmyVp1/HQamBy3q2zKu/J11b3UQzr33HmypVa/O7AeC2tksYQCdeB32XPi
	JCgrXpa8az49QG8tmA0ZxYqm+FsLIYMSgcb0s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RXimV4BnwjnWtT0glhsF99B/rpX83YsZSGednxqd/qLeLb6U0yql4S/PJUyPh01oLJ
	EAW2B03gQCOocXOP2LmIlaL9qPKKGrTCygpotKrqOHSjgpuYrwgIktADflHUHJNx/0KF
	LTcyYhKgbBpQmYrhUkbAoKB7hlsUbyk3qJJnU=
MIME-Version: 1.0
Received: by 10.236.181.163 with SMTP id l23mr5265313yhm.206.1306844144007;
	Tue, 31 May 2011 05:15:44 -0700 (PDT)
Received: by 10.236.109.161 with HTTP; Tue, 31 May 2011 05:15:43 -0700 (PDT)
In-Reply-To: <E1QRNcD-0000dn-ME@happy.bec-systems.com>
References: <E1QRNcD-0000dn-ME@happy.bec-systems.com>
Date: Tue, 31 May 2011 08:15:43 -0400
Message-ID: <BANLkTimx91VF8TLXsTOmHFZnvGUwZG8hsw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org, 
	angstrom-distro-devel@linuxtogo.org
Subject: Re: [oe] OE Changelog for 2011-05-23 to 2011-05-30
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
X-List-Received-Date: Tue, 31 May 2011 12:18:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OK, I think I have included everyone's requests for the weekly
changelog -- please let me know if I missed anything, or if there are
additional ideas.  It might be useful to include the yocto/poky repos,
but I'm not sure yet which ones are relevant.

The tools that generate this are located in the oe-admin repo:

http://cgit.openembedded.org/cgit.cgi/openembedded-admin/

Thanks,
Cliff

On Tue, May 31, 2011 at 8:00 AM,  <cliff.brake@gmail.com> wrote:
> Changelog for 2011-05-23 to 2011-05-30. =A0Projects included in this repo=
rt:
>
> openembedded-core: git://git.openembedded.org/openembedded-core
> meta-openembedded: git://git.openembedded.org/meta-openembedded
> meta-angstrom: git://git.angstrom-distribution.org/meta-angstrom
> meta-texasinstruments: git://git.angstrom-distribution.org/meta-texasinst=
ruments
> meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
> meta-micro: git://git.openembedded.org/meta-micro
> meta-slugos: git://github.com/kraj/meta-slugos
> meta-nslu2: git://github.com/kraj/meta-nslu2
> meta-intel: git://git.yoctoproject.org/meta-intel
> openembedded: git://git.openembedded.org/openembedded
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for openembedded-core:
>
> Beth Flanagan (4):
> =A0common-licenses: Adding new licenses and renaming
> =A0License Field Cleanup: Non-standard field names
> =A0license.bbclass: Sane Parsing of licenses
> =A0license.bbclass: Infinite recursion of or nodes
>
> Cliff Brake (1):
> =A0test commit
>
> Darren Hart (4):
> =A0create-pull-request: generalize the repository URL parsing
> =A0u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
> =A0u-boot: rename u-boot_git.bb to u-boot_${PV}.bb
> =A0utils.bbclass: make FILESEXTRAPATHS colon delimited
>
> Kang Kai (1):
> =A0ghostscript: fix run failure on mpc8315e
>
> Khem Raj (11):
> =A0opkg_svn.bb: Install rcS.d into $D instead of $IMAGE_ROOTFS
> =A0distcc_2.18.3.bb: Fix compilation on uclibc
> =A0uclibc: Upgrade to 0.9.32-rc3
> =A0elfutils_0.148.bb: Fix compilation on uclibc
> =A0eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
> =A0uclibc_git.bb: Fix compilation on arm when using thumb instruction set
> =A0uclibc.inc: Set COMPILE_IN_THUMB_MODE in .config if ARM_INSTRUCTION_SE=
T !=3D a
> =A0shared-mime-info_0.90.bb: Fix more parallel build issues
> =A0uclibc_git.bb: Fix patch path in SRC_URI
> =A0uclibc: Add disabled COMPILE_IN_THUMB_MODE to uClibc.machine for all A=
RM con
> =A0package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"
>
> Koen Kooi (11):
> =A0qemu machines: drop MACHINE_ESSENTIAL_EXTRA_RDEPENDS =3D "qemu-config"
> =A0pulseaudio: package udev rules
> =A0dbus: split X11 dependant dbus-launch into its own subpackage
> =A0qemu-config: add runtime dep on dbus-x11
> =A0x11-common 0.1: add runtime dep on dbus-x11
> =A0dbus 1.4.1: enable systemd support, but package systemd files seperate=
ly
> =A0dbus: clean up dbus-x11 packaging
> =A0x11-common: fix dbus-launch RDEPENDS
> =A0avahi: enable systemd support, but package systemd files seperately
> =A0dbus 1.4.1: create UUIDDIR in postinst
> =A0bitbake.conf: make OVERRIDES match what people expect
>
> Lianhao Lu (3):
> =A0conf/bitbake.conf: Added variables for PR service.
> =A0classes/package(prserv).bbclass: Get PRAUTO and use PKGV/PKGR.
> =A0classes/package_xxx.class: Use PKGE/PKGV/PKGR.
>
> Martin Jansa (4):
> =A0python-2.6.6: py_package_preprocess should change Makefile only in PKG=
D not
> =A0console-tools: use u-a also for fgconsole otherwise it collides with b=
usybox
> =A0rm_work: keep all sigdata files in stamps dir
> =A0libcap: add native BBCLASSEXTEND to fix gnutls-native after ffc32d6436=
bcd11b
>
> Nitin A Kamble (9):
> =A0tcmode-default: switch to eglibc 2.13 from 2.12
> =A0tcmode-default: switch to gcc 4.6.0 for ppc & mips also
> =A0gplv2 recipes update upstream status of patches
> =A0git: upgrade from 1.7.4.3 to 1.7.5.1
> =A0libpcre: upgrade from 8.10 to 8.12
> =A0byacc: upgrade from 20101127 to 20101229
> =A0python-pygpbject: upgrade from 2.27 to 2.27.91
> =A0distro-tracking: update toolchain recipe fields
> =A0tcmode-default: workaround for gcc 4.6.0 failure on beagleboard
>
> Otavio Salvador (2):
> =A0send-pull-request: drop sendemail checks
> =A0syslinux: rdepends on mtools
>
> Phil Blundell (1):
> =A0rootfs_ipk: issue a diagnostic if rootfs is declared read-only and not=
 all m
>
> Qing He (1):
> =A0rpm: fix fprint pointer issue
>
> Richard Purdie (4):
> =A0binutils: Add missing dependency on zlib-native
> =A0dbus: Fix commit typo, I mixed the patch versions up
> =A0gcc-cross-csl-2008q1: Drop last remaining fail-fast override use and m=
ake it
>
> Saul Wold (10):
> =A0puzzles: update to r9173
> =A0gail: update gail to 1.20.2
> =A0update-alternatives-dpkg: Update to dpkg base 1.15.8.7
> =A0gst-plugins-base: Add tremor to DEPENDS
> =A0IMAGE_ROOTFS_SIZE Cleanup
> =A0image_types: add IMAGE_ROOTFS_EXTRA_SPACE
> =A0bitbake.conf: change IMAGE_ROOTFS_EXTRA_SPACE to soft (?=3D) default
> =A0gnutls: Add libcap to DEPENDS
> =A0Revert "createrepo: Update to 0.9.9"
> =A0gupnp-tools: Add gupnp-av to DEPENDS
>
> Yu Ke (2):
> =A0xorg.conf: update keyboard config with evdev
> =A0site/powerpc-common: remove the incorrect dlopen default setting
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-openembedded:
>
> Khem Raj (2):
> =A0gcc-4.6.inc: Always build runtime in ARM mode.
> =A0gcc-4.6: Update with patches from gcc-4_6-branch and linaro 2011.05 re=
lease
>
> Koen Kooi (29):
> =A0gpe-scap: import from OE rev aae5b51e4a8dd57b28a6f91e6c14a5311aadbdae
> =A0task-boot: bump PR for MACHINE_ESSENTIAL_EXTRA_RDEPENDS =A0change in O=
E-core
> =A0mesa: makedepend-native is needed by every mesa, not just the DRI one
> =A0bluez4: update to 4.93
> =A0bluez4 4.93: add missing udev dep
> =A0mesa-common.inc: fix make-depend typo
> =A0xserver-xorg: add missing mesa-dri dependency
> =A0yavta: add git version of v4l2 test tool
> =A0media-ctl: add git version for MCF controller app
> =A0machine includes: remove from layer
> =A0libcap2: import for OE rev 01d461a53cec16ddec29b996896839a17c51a74
> =A0libcgroups: import from OE rev 01d461a53cec16ddec29b996896839a17c51a74=
a
> =A0kbd: add 1.15.2
> =A0dbus: drop from meta-oe
> =A0systemd: import from OE rev 84696f215bbf81cb3def7e03e45dd66b0a85b1bb
> =A0udev 168: enable systemd support, but package systemd files seperately
> =A0systemd: drag in new {udev,dbus}-systemd packages
> =A0systemd: update to v28
> =A0uclibc: moved into OE-core, delete from meta-oe
> =A0systemd: add hack to fix parsing for machines without SERIAL_CONSOLE s=
et
> =A0connman: fix systemd packaging
> =A0systemd: fix "double getty" problem on serial console with recent kern=
els
> =A0systemd: use PKGV and create 'lock' group in postinst
> =A0systemd: add u-a entries for reboot, halt and friends
> =A0systemd: expand RRECOMMENDS with kernel modules recommended by INSTALL
> =A0udev 171: add recipe with DP =3D -1
> =A0udev-extra-rules: recipe with extra rules previously provided by udev
> =A0udev 171: cleanup duplicated rules some more
> =A0udev: drop 168 and associated files
>
> Martin Jansa (34):
> =A0xserver-xorg: upgrade to 1.10.1.901 and return randr-support patch
> =A0xf86-video-glamo: fix build with gcc-4.6
> =A0connman: add gnutls to depends and move iptables dependency also to in=
c fil
> =A0gconf: depend on polkit not policykit
> =A0policykit: drop recipes, oe-core has newer versions named right polkit
> =A0farsight2: fix LICENSE and add LIC_FILES_CHKSUM
> =A0libnice: improve LICENSE and add LIC_FILES_CHKSUM
> =A0tangogps: add LIC_FILES_CHKSUM and drop distro override
> =A0pidgin: add LIC_FILES_CHKSUM
> =A0evtest: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0gpsd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0foxtrotgps: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392=
d
> =A0tiff: add bbappned with native BBCLASSEXTEND
> =A0gd: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0librsvg: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0imagemagick: import from OE rev d4f0211e2078d5033ae0dee74664de5520d839=
2d
> =A0portaudio: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0alsa-oss: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0flite-alsa: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392=
d
> =A0espeak: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0navit: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0devmem2: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0dbus-daemon-proxy: add LIC_FILES_CHKSUM and disable as-needed
> =A0s3c24xx-gpio,s3c64xx-gpio: add LIC_FILES_CHKSUM
> =A0socat: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0mbuffer: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0nmon: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0ltrace: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0pxaregs: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0serial-utils: import from OE rev d4f0211e2078d5033ae0dee74664de5520d83=
92d
> =A0tcp-wrappers: import from OE rev d4f0211e2078d5033ae0dee74664de5520d83=
92d
> =A0nfs-utils: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0i2c-tools: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
> =A0tcpdump: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
>
> Otavio Salvador (4):
> =A0udev: fix init script indenting
> =A0udev: fix action used during startup
> =A0udev: remove udev.inc since it was not being in use
> =A0udev: move ConsoleKit files to udev-consolekit
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-angstrom:
>
> Koen Kooi (9):
> =A0upload-packages: don't fail is there are no morgue/ directories
> =A0drop dbus pinning
> =A0base-files 3.0.14: override fstab
> =A0systemd-image: image to test systemd integration into angstrom
> =A0base-files 3.0.14: stage one of volatiles overhaul
> =A0base-files: also remove /var/tmp from volatiles
> =A0angstrom: bump mesa version
> =A0angstrom: fix QT version
> =A0base-files: add sysvinit compat
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-texasinstruments:
>
> Khem Raj (1):
> =A0conf/layer.conf: Document the operation on BBPATH correctly in the com=
ment
>
> Koen Kooi (11):
> =A0linux-omap 2.6.39: refresh patchset
> =A0linux-omap 2.6.39: add base PM set back in
> =A0x-load: bump SRCREV for OMAP4 fixes
> =A0linux-omap 2.6.39: add cpuidle patchset
> =A0linux-omap 2.6.39: add sensor driver for aptina 5MP and 1GHz hack for =
beagle
> =A0machine includes: move from meta-oe
> =A0linux-omap 2.6.39: update to latest beagle patchset
> =A0beagleboard: move console from ttyS2 to ttyO2
> =A0omap3-sgx-modules: add 1.6.16.3977 version
> =A0libgles-omap3: add 4.03.00.02
> =A0linux-omap 2.6.39: switch to 'userspace' governor on beagle
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-smartphone:
>
> Denis 'GNUtoo' Carikli (1):
> =A0shr-image.inc: migrate nokia900 to devtmpfs
>
> Martin Jansa (14):
> =A0libphone-utils: bump SRCREV to fix build with gcc-4.6
> =A0qi: fix build with gcc-4.6
> =A0libphone-ui-shr: fix build with gcc-4.6
> =A0libphone-ui-shr: bump SRCREV to fix build with gcc-4.6
> =A0linux-openmoko: search for mtdutils in sbinding
> =A0freesmartphone: bump SRCREVs
> =A0fso-specs: older SRCREV because HEAD causes libfreesmartphone-glib to =
fail
> =A0linux-openmoko: sync with oe.dev and add 2.6.39, remove old
> =A0linux-nokia: merge changes from oe.dev
> =A0linux-openmoko: fix om-gta01 SRC_URI and defconfig
> =A0task-shr: drop few apps in order to make this parseble
> =A0navit: add bbappend with our stuff
> =A0meta-fso: add LIC_FILES_CHKSUM for tools
> =A0shr: drop qt and strace bindings
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-micro:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-slugos:
>
> Khem Raj (1):
> =A0slugos.conf: Switch to using gcc 4.6
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-nslu2:
>
> Khem Raj (5):
> =A0kexec-tools-2.0.2: Fix compilation with gcc 4.6
> =A0linux-ixp4xx_2.6.37.bb: Make it compile with gcc 4.6
> =A0linux-ixp4xx: Fix missing 4.6 warnings resulting in errors
> =A0nslu2-image.bbclass: Use STAGING_FIRMWARE_DIR to locale firmware
> =A0ixp4xx-npe: Package firmware into /lib/firmware on target rfs
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-intel:
>
> Darren Hart (1):
> =A0linux-yocto*: correct FILESEXTRAPATHS assignment in all layers
>
> Tom Zanussi (3):
> =A0meta-intel: fix BBFILE_COLLECTIONS overrides
> =A0meta-sugarbay: Change build instructions in README to use BSP tarball
> =A0meta-intel: Change build instructions in README to use BSP tarball
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for openembedded:
>
> Anand Balagopalakrishnan (2):
> =A0libgles-omap3: Add wsegl.h to the destination include directory
> =A0qt4: Fix the include path for SGX PowerVR drivers
>
> Andrea Adami (6):
> =A0linux: add remaining 2.6.39 defconfigs for Zaurus devices
> =A0linux-kexecboot: add remaining 2.6.39 defconfigs for Zaurus devices.
> =A0linux-kexecboot: sync Zaurus _git defconfigs with 2.6.39 ones.
> =A0linux: : sync Zaurus _git defconfigs with 2.6.39 ones.
> =A0linux-kexecboot: set DEFAULT_PREFERENCE =3D "1" for 2.6.39 on Zaurus.
> =A0linux: set DEFAULT_PREFERENCE =3D "1" for 2.6.39 on Zaurus.
>
> Andreas Oberritter (3):
> =A0kernel.bbclass: pass KERNEL_VERSION through legitimize_package_name
> =A0lib/oe/unpack.py: unpack rar archives
> =A0kernel.bbclass: pass AR, NM and OBJCOPY to make
>
> Benjamin Deering (1):
> =A0xserver-xorg-1.10.1.901: fix screen rotation
>
> Bernhard Guillon (1):
> =A0opkg-utils: port arfile.py patch to opkg-utils, bump PR
>
> Denis 'GNUtoo' Carikli (1):
> =A0nokia900: move more kernel drivers that were built in the kernel(=3Dy)=
 to modu
>
> Denis Carikli (1):
> =A0bug20.conf: override the omap3 kernel PR and bump PR
>
> Henning Heinold (3):
> =A0opie-image: revert part of my bogus commit 2a1c9e1ee5eb8067592d26100b5=
63dd2a
> =A0opencv-dsp-acceleration: revert part of my bogus commit 2a1c9e1ee5eb80=
67592d
> =A0firefox: DEPENDENCY on libintl is only needed for uclibc
>
> Holger Hans Peter Freyther (1):
> =A0dvnixload: The directory structure was changed upstream, update.
>
> Koen Kooi (15):
> =A0x-load git: bump SRCREV
> =A0mango-lassi: add missing xtst to DEPENDS
> =A0avahi-ui: update to 0.6.30, improve packaging a bit
> =A0avahi-ui 0.6.30: improve packaging some more
> =A0gnome-bluetooth 2.32.0: package gconf files
> =A0linux-omap 2.6.39: sync with meta-texasinstruments
> =A0angstrom 2010.x: use 2.6.39 for beagleboard
> =A0yavta: import from meta-oe
> =A0media-ctl: import from meta-oe
> =A0udev git: check if systemd files are present before symlinking
> =A0udev git: bump SRCREV for systemd fixes
> =A0systemd: bump to a rev where hwclock isn't needed anymore
> =A0qt4: bump PR for wsegl header change
> =A0angstrom: prefer the git version of tslib
> =A0linux-omap 2.6.39: sync with meta-texasinstruments
>
> Martin Jansa (11):
> =A0freesmartphone: bump SRCREVs
> =A0fso-specs: older SRCREV because HEAD causes libfreesmartphone-glib to =
fail
> =A0linux-2.6.39: sync om-gta02 defconfig with defconfig from larsc a bit
> =A0linux_2.6.39: revert MMC changes from openmoko.patch in shr.patch
> =A0xserver-xorg: upgrade from 1.10.1.901 to 1.10.1.902
> =A0linux-openmoko-2.6.3[79]: fix nand with badblocks
> =A0linux: add new kernel task savedefconfig
> =A0om-gta01: minimize 2.6.37 defconfig with savedefconfig
> =A0linux-nokia900-meego: minimize defconfig with savedefconfig
> =A0linux-2.6.39: add defconfig for om-gta01
> =A0qt4: remove qte.sh from shared SRC_URI and PACKAGE_ARCH_palmpre
>
> Paul Eggleton (3):
> =A0qte: enable 18bpp support
> =A0qte: revert changes from 2a1c9e1ee5eb8067592d26100b563dd2ae7be00d
> =A0manufacturers: define a SRCREV to fix package build
>
> Paul Menzel (2):
> =A0avahi-ui: add `libglade` to `DEPENDS`
> =A0mango-lassi: add `scrollkeeper-native` to `DEPENDS`
>
> Simon Busch (5):
> =A0aurora: use qte.sh script at bootup to get the correct touchscreen con=
figura
> =A0python-2.6.6: backport pkgconfig support from version 2.7.1 and bump P=
R
> =A0aurora: update recipe for latest changes to aurora and bump PR
> =A0libshiboken: fixup several issues with the generated pkgconfig file an=
d bump
> =A0python-pyside-embedded: update patch for qws support and bump PR
>
> Stanislav Brabec (7):
> =A0crda: Fix build by disabling of make environment overrides.
> =A0crda: Upgrade regulatory database to 2011.04.28.
> =A0gnome-desktop: Disable doc build - XSL processing depends on /usr/shar=
e/xml
> =A0mavit-svn: Upgrade to SVN snapshot 4495. Changed SVN URI to http (http=
s does
> =A0bluez-hcidump: Fix declaration clash (remove definition of ntoh64() al=
ready
> =A0balsa: Fix DEPENDS. Disable doc build - XSL processing is dependent on=
 host
> =A0mumpot: Upgrade to version 0.6.
>
> Steffen Sledz (1):
> =A0apr-util: disable odbc support to avoid QA error
>
> Thomas Zimmermann (1):
> =A0sflphone-common: Update to 0.9.13 and remove sflphone-pjproject
>
> Tom Rini (4):
> =A0sysvinit: Upstream patch for newer libcs
> =A0openssl.inc: Fix PowerPC64 builds
> =A0boa: Add bison-native to DEPENDS
> =A0boa: Also flex-native
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


