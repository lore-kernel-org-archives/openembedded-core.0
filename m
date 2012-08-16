Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1T221e-0003mL-33; Thu, 16 Aug 2012 17:30:22 +0200
Received: by lban1 with SMTP id n1so1461462lba.6
	for <multiple recipients>; Thu, 16 Aug 2012 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ZfURvxRHpCRTDRYh8HpwQLRTWGH3vStrLd/HU/UMRZg=;
	b=OQGFuLbcFbsbw+O6LNn1A6LhaipHPS44H19rIJBxrXjF2oYpHVjHZmM3C/Bzu+nW57
	GCBgg3Sqy0LhI+AkyQIYQaJyIemPjNSl3bzGRrSPXDADuyDw5vprAxS39KT/ifrmTmF7
	Ex3Vi+Qk5IwSOXirTDlyAPG08U07AvXYzg5rXPOx5nK/pFP12zxQoXQkX3uaNLCl30Lv
	T/m02JZKBfg9x9y8OuHKAT4LCTunJtn3B7dNjulacfY3izMLCM/EGvHY73CZY4+x2kmL
	ocuVn84egGahEOhK9uOyJy8bxqDf9kqlu/bkmMbrjGhdG/U2jK2328EYsLfhuFsehrgx
	4i4Q==
MIME-Version: 1.0
Received: by 10.152.102.137 with SMTP id fo9mr1628118lab.35.1345130303391;
	Thu, 16 Aug 2012 08:18:23 -0700 (PDT)
Received: by 10.112.85.196 with HTTP; Thu, 16 Aug 2012 08:18:23 -0700 (PDT)
In-Reply-To: <1345129661832.d55ecfab@Nodemailer>
References: <1345129661832.d55ecfab@Nodemailer>
Date: Thu, 16 Aug 2012 11:18:23 -0400
Message-ID: <CAOd_LFwYFHxUti-vX+QambR1y4MM++ohDCDNtUT9ZLH5woDWkg@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org, 
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: Re: [meta-ti] OE Changelog since 2012-08-05 until 2012-08-12
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
X-List-Received-Date: Thu, 16 Aug 2012 15:30:22 -0000
Content-Type: multipart/alternative; boundary=f46d0407160be907bb04c7638db7

--f46d0407160be907bb04c7638db7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The OE Changelog is back.  Some time ago, I got several reports that the
changelog was missing entries.  I have since revamped the way dates are
handled and may have made things better (or worse).  The tool simply runs
git shortlog --since <date> --until <date> with the dates referenced.  This
should capture changes from Mon through Sun of that week.  The git shortlog
--since/until uses the commit dates, not the author date, so that may
explain some of the missing entries.  git log --format=3Dfuller can be used
to view commit dates.

If you still see missing entries, please send me the changeset hash and
repo, and I'll debug it.  If there are additional repos to include, please
let me know.

Thanks,
Cliff

On Thu, Aug 16, 2012 at 11:07 AM, <cliff.brake@gmail.com> wrote:

> Changelog since 2012-08-05 until 2012-08-12.  Projects included in this
> report:
>
> bitbake: git://git.openembedded.org/bitbake
> openembedded-core: git://git.openembedded.org/openembedded-core
> meta-openembedded: git://git.openembedded.org/meta-openembedded
> meta-yocto: git://git.yoctoproject.org/poky
> meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
> meta-micro: git://git.openembedded.org/meta-micro
> meta-slugos: git://github.com/kraj/meta-slugos
> meta-nslu2: git://github.com/kraj/meta-nslu2
> meta-intel: git://git.yoctoproject.org/meta-intel
> meta-handheld: git://git.openembedded.org/meta-handheld
> meta-opie: git://git.openembedded.org/meta-opie
> openembedded: git://git.openembedded.org/openembedded
> meta-bug: git://github.com/buglabs/meta-bug.git
> meta-efikamx: git://github.com/kraj/meta-efikamx.git
> meta-gumstix: git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix.git
> meta-ettus: http://github.com/koenkooi/meta-ettus.git
> meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
> meta-igep: http://github.com/ebutera/meta-igep.git
> meta-netbookpro: git://github.com/tworaz/meta-netbookpro
> meta-xilinx: git://git.yoctoproject.org/meta-xilinx
> meta-chicken: git://github.com/OSSystems/meta-chicken
> meta-java: git://github.com/woglinde/meta-java
> meta-qt3: git://git.yoctoproject.org/meta-qt3
> meta-telephony: git://
> gitorious.org/sysmocom-openembedded/meta-telephony.git
> meta-eldk: git://git.denx.de/eldk.git
> meta-ti: git://git.yoctoproject.org/meta-ti
> meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
> meta-browser: git://github.com/OSSystems/meta-browser.git
> meta-mono: git://git.yoctoproject.org/meta-mono.git
> meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
> meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for bitbake:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for openembedded-core:
>
> Andy Ross (1):
>   iputils: Break libsysfs dependency
>
> Bogdan Marinescu (2):
>   bison: updated to 2.5.1
>   subversion: Add missing build dependency on sqlite3
>
> Damien Lespiau (2):
>   mesa: Update to 8.0.4 (latest stable version)
>   mesa: Use 'require' instead of 'include'
>
> Darren Hart (1):
>   linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE
>
> Franklin S Cooper Jr (1):
>   psplash: Update to latest psplash version
>
> Jackie Huang (2):
>   tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage
>   python: Fix to support the python module _bsddb built with db 5.3
>
> Javier Martinez Canillas (25):
>   xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc
>   alsa-state: use ${sbindir} instead of /usr/sbin for packaging
>   lsbsetup: use ${bindir} instead of /usr/bin for packaging
>   sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc
>   lsbtest: use ${bindir} instead of /usr/bin for packaging
>   cronie: use variables instead of hardcoded paths
>   useradd-example: use ${datadir} instead of /usr/share for packaging
>   ubootchart: use variables instead of hardcoded paths
>   xkeyboard-config: use ${datadir} instead of /usr/share for packaging
>   systemtap: use ${datadir} instead of /usr/share for packaging
>   mingetty: use ${base_sbindir} instead of /sbin for packaging
>   openssh: use ${localstatedir} instead of /var for packaging
>   libpam: use ${localstatedir} and ${sysconfdir} instead of /var and /etc
>   x11-common: use ${sysconfdir} instead of /etc for packaging
>   builder: use ${sysconfdir} instead of /etc for packaging
>   xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging
>   qemu-config: use ${sysconfdir} instead of /etc for packaging
>   chkconfig: use ${sysconfdir} instead of /etc for packaging
>   man: use ${sysconfdir} instead of /etc for packaging
>   rsync: use ${sysconfdir} instead of /etc for packaging
>   lsbinitscripts: use ${sysconfdir} instead of /etc for packaging
>   usbinit: use ${sysconfdir} instead of /etc for packaging
>   lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc
>   kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib an=
d
> /et
>   linux-firware: use ${base_libdir} instead of /lib for packaging
>
> Jesse Zhang (1):
>   image-mklibs: pass correct libdir to mklibs
>
> Khem Raj (3):
>   populate_sdk_rpm.bbclass: Depend do_populate_sdk task on
> createrepo-native
>   glib-2.0-nativesdk: Add dependency on glib-2.0-native
>   binutils: Enable threaded linking with gold
>
> Marcin Juszkiewicz (1):
>   libpam: disable NIS to not link with libtirpc when it is available
>
> Martin Jansa (4):
>   qt4-native: fix creating /include directory in build host root
>   bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
>   eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4
>   curl: disable ldap/ldaps explicitly
>
> Paul Eggleton (9):
>   classes/buildhistory: remove obsolete flat package history feature
>   classes/buildhistory: ensure old package info is removed
>   classes/buildhistory: remove unused functions
>   classes/buildhistory: save preinst/postinst/prerm/postrm
>   classes/buildhistory: record PKG/PKGE/PKGV/PKGR
>   buildhistory_analysis: tidy up duplicate split_version function
>   buildhistory_analysis: ignore removal of self-dependencies
>   classes/buildhistory: save metadata revisions
>   classes/package: don't make locale pkgs depend on PN pkg if not in
> PACKAGES
>
> Radu Moisan (2):
>   atk: package update 2.2 -> 2.4
>   babeltrace: Update to upstream stable versrion 0.12
>
> Richard Purdie (14):
>   gcc-cross-initial: Ensure it uses an isolated sysroot
>   at: Use variables from the environment to override the makefile default=
s
>   gdb-cross: Explicitly disable python
>   kernelshark: Inherit pythonnative
>   kernel.bbclass: Revert ${base_libdir} change
>   Revert "linux-firware: use ${base_libdir} instead of /lib for packaging=
"
>   linux-firmware: Ensure PR goes forward, not backwards after the revert
>   linux-yocto-3.4: Disable extra slang header search path
>   python: Fix RPATH QA issue on non-gplv3 builds
>   gcc: Disable use of sdt.h header
>   package-index: Remove the python hack, its not needed after the
> pythonnative
>   linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0
> kernels to
>   linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2
> kernels to
>   automake: Fix version reference in path substitutions
>
> Ross Burton (8):
>   mesa: no need to depend on python-native, the class does that
>   mesa: format the packages list nicely
>   mesa: move glu.pc to libglu-dev
>   mesa: add --enable-shared-glapi, and package it in libglapi
>   mesa: enable the Graphic Buffer Manager library
>   gthumb: fix parallel build problems
>   buildhistory: correctly handle reductions of numeric fields
>   buildhistory: reduce the numeric delta to 10%
>
> Roy.Li (1):
>   busybox: fix du-k-works test case
>
> Saul Wold (1):
>   foomatic: fix perl path for target
>
> Wenzong Fan (1):
>   gdk-pixbuf: fix parallel install issue
>
> Xin Ouyang (1):
>   findutils-4.4.2: add bison-native to DEPENDS
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-openembedded:
>
> Andreas M=FCller (2):
>   systemd-systemctl-native: handle ALIAS tag
>   gdm: replace 'WantedBy=3Dgraphical.target' by
> 'Alias=3Ddisplay-manager.service'
>
> Franklin Cooper Jr (1):
>   ltrace: Fix make error
>
> Gary Thomas (2):
>   media-ctl: Fix build with latest automake
>   libxml++: New recipe - C++ bindings for libxml
>
> Horia Geanta (1):
>   strongswan: upgrade to version 5.0.0
>
> Khem Raj (6):
>   gitpkgv.bbclass: Add a symlink from meta-oe
>   testlab.bbclass: Delete
>   systemd: Upgrade to 187 tag
>   busybox: stopping systemd-kmsg-syslogd is not needed
>   busybox-syslog.service.in: Create alias for syslog.service
>   systemd: Use cross cpp
>
> Koen Kooi (4):
>   orc: update to 0.4.16
>   nodejs: update to 0.6.20
>   fuse: update to 2.9.1
>   sox: add 14.4.0
>
> Martin Ertsaas (1):
>   cpufrequtils: Use CC, LD etc. that comes from OE.
>
> Martin Jansa (14):
>   fbreader: drop machine overrides
>   emacs: rename TUTORIAL.ko to TUTORIAL.KO so it's not picked by
> package.bbcla
>   emacs: copy only needed stuff to qemu-treedir, not whole sysroot
>   phonet-utils: simplify with inherit autotools
>   sip: import from oe-classic and upgrade to latest
>   python-sip: import from oe-classic and upgrade to latest
>   python-pyqt: import from oe-classic
>   anki: import from oe-classic
>   systemd-compat-units: move list of disabled services to variable, fix
> hwcloc
>   mplayer2: enable speex
>   php: inherit pythonnative
>   php: add build-defs.h to SSTATE_SCAN_FILES it defines path to sysroot
> where
>   systemd-compat-units: use systemctl mask
>   systemd-systemctl-native: extend systemctl wrapper to support mask acti=
on
>
> Otavio Salvador (4):
>   libxaw: Fix libxaw-dev to not depends on non-existent libxaw package
>   tiobench: fix aligned allocation method clash with newer glibc
>   postgresql: Fix redundant rpath for '/usr/lib'
>   postgresql: Fix packaging of static libraries
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-yocto:
>
> Andy Ross (1):
>   iputils: Break libsysfs dependency
>
> Bogdan Marinescu (2):
>   bison: updated to 2.5.1
>   subversion: Add missing build dependency on sqlite3
>
> Damien Lespiau (2):
>   mesa: Update to 8.0.4 (latest stable version)
>   mesa: Use 'require' instead of 'include'
>
> Darren Hart (1):
>   linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE
>
> Franklin S Cooper Jr (1):
>   psplash: Update to latest psplash version
>
> Jackie Huang (2):
>   tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage
>   python: Fix to support the python module _bsddb built with db 5.3
>
> Javier Martinez Canillas (25):
>   xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc
>   alsa-state: use ${sbindir} instead of /usr/sbin for packaging
>   lsbsetup: use ${bindir} instead of /usr/bin for packaging
>   sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc
>   lsbtest: use ${bindir} instead of /usr/bin for packaging
>   cronie: use variables instead of hardcoded paths
>   useradd-example: use ${datadir} instead of /usr/share for packaging
>   ubootchart: use variables instead of hardcoded paths
>   xkeyboard-config: use ${datadir} instead of /usr/share for packaging
>   systemtap: use ${datadir} instead of /usr/share for packaging
>   mingetty: use ${base_sbindir} instead of /sbin for packaging
>   openssh: use ${localstatedir} instead of /var for packaging
>   libpam: use ${localstatedir} and ${sysconfdir} instead of /var and /etc
>   x11-common: use ${sysconfdir} instead of /etc for packaging
>   builder: use ${sysconfdir} instead of /etc for packaging
>   xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging
>   qemu-config: use ${sysconfdir} instead of /etc for packaging
>   chkconfig: use ${sysconfdir} instead of /etc for packaging
>   man: use ${sysconfdir} instead of /etc for packaging
>   rsync: use ${sysconfdir} instead of /etc for packaging
>   lsbinitscripts: use ${sysconfdir} instead of /etc for packaging
>   usbinit: use ${sysconfdir} instead of /etc for packaging
>   lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc
>   kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib an=
d
> /et
>   linux-firware: use ${base_libdir} instead of /lib for packaging
>
> Jesse Zhang (1):
>   image-mklibs: pass correct libdir to mklibs
>
> Khem Raj (3):
>   populate_sdk_rpm.bbclass: Depend do_populate_sdk task on
> createrepo-native
>   glib-2.0-nativesdk: Add dependency on glib-2.0-native
>   binutils: Enable threaded linking with gold
>
> Marcin Juszkiewicz (1):
>   libpam: disable NIS to not link with libtirpc when it is available
>
> Martin Jansa (4):
>   qt4-native: fix creating /include directory in build host root
>   bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
>   eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4
>   curl: disable ldap/ldaps explicitly
>
> Paul Eggleton (9):
>   classes/buildhistory: remove obsolete flat package history feature
>   classes/buildhistory: ensure old package info is removed
>   classes/buildhistory: remove unused functions
>   classes/buildhistory: save preinst/postinst/prerm/postrm
>   classes/buildhistory: record PKG/PKGE/PKGV/PKGR
>   buildhistory_analysis: tidy up duplicate split_version function
>   buildhistory_analysis: ignore removal of self-dependencies
>   classes/buildhistory: save metadata revisions
>   classes/package: don't make locale pkgs depend on PN pkg if not in
> PACKAGES
>
> Radu Moisan (2):
>   atk: package update 2.2 -> 2.4
>   babeltrace: Update to upstream stable versrion 0.12
>
> Richard Purdie (15):
>   gcc-cross-initial: Ensure it uses an isolated sysroot
>   at: Use variables from the environment to override the makefile default=
s
>   mesa: 7.11 -> 8.0.4
>   gdb-cross: Explicitly disable python
>   kernelshark: Inherit pythonnative
>   kernel.bbclass: Revert ${base_libdir} change
>   Revert "linux-firware: use ${base_libdir} instead of /lib for packaging=
"
>   linux-firmware: Ensure PR goes forward, not backwards after the revert
>   linux-yocto-3.4: Disable extra slang header search path
>   python: Fix RPATH QA issue on non-gplv3 builds
>   gcc: Disable use of sdt.h header
>   package-index: Remove the python hack, its not needed after the
> pythonnative
>   linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0
> kernels to
>   linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2
> kernels to
>   automake: Fix version reference in path substitutions
>
> Ross Burton (8):
>   mesa: no need to depend on python-native, the class does that
>   mesa: format the packages list nicely
>   mesa: move glu.pc to libglu-dev
>   mesa: add --enable-shared-glapi, and package it in libglapi
>   mesa: enable the Graphic Buffer Manager library
>   gthumb: fix parallel build problems
>   buildhistory: correctly handle reductions of numeric fields
>   buildhistory: reduce the numeric delta to 10%
>
> Roy.Li (1):
>   busybox: fix du-k-works test case
>
> Saul Wold (1):
>   foomatic: fix perl path for target
>
> Wenzong Fan (1):
>   gdk-pixbuf: fix parallel install issue
>
> Xin Ouyang (1):
>   findutils-4.4.2: add bison-native to DEPENDS
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-smartphone:
>
> Denis 'GNUtoo' Carikli (1):
>   meta-shr: 3rdparty: add ubx-utils uttilites for the om-gta02 machine.
>
> Martin Jansa (14):
>   meta-shr: systemd-compat-units: simplify
>   mesa: drop glamo patch
>   meta-smartphone: kernel recipes using MACHINE_KERNEL_PR now need to
> inherith
>   meta-shr, meta-openmoko: rename gpsd bbappends
>   shr-e-gadgets: bump PR after enlightenment upgrade
>   libphone-ui-shr: update for new elm APIs
>   shr-wizard: bump SRCREV to fix compatibility with python-elementary
> r71083 a
>   shr-wizard: bump SRCREV to fix compatibility with python-elementary
> r65604 a
>   shr-settings: bump SRCREV for newer EFL and remove now unneeded
> do_configure
>   meta-shr: libphone-ui-shr: fix runtime issues in phoneuid after
> EFL_SRCREV r
>   elsa: rename to entrance
>   libphone-ui-shr: bump SRCREV and drop local patches
>
> Simon Busch (5):
>   meta-samsung: samsung-modem-mgr: add initial recipe
>   meta-samsung: netbase: add specific network interface configuration for
> cres
>   Initial creation of the meta-android layer
>   Move all android specific recipes from meta-fso to meta-android
>   meta-fso: drop android utilities from fso-autorev.inc
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
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-nslu2:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-intel:
>
> Kishore Bodke (3):
>   meta-romley: Move Matrox MGA Xorg driver to meta-intel/common
>   meta-intel:Add a MATROX MGA variable to ia32-base.inc
>   meta-romley: Add Matrox MGA variable to romley.conf
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-handheld:
>
> Andrea Adami (1):
>   zaurus: fix jffs2 and ubifs images for collie
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-opie:
>
> Paul Eggleton (9):
>   snes9x: remove X11-based recipe
>   snes9x-sdl-qpe: use FILESEXTRAPATHS instead of FILESPATHPKG
>   kaffe: add missing patch from OE-Classic
>   libsdl-qpe: add missing patches from OE-Classic
>   gnuplot: remove
>   opie-taskbar-images: allow re-exec of do_install
>   libetpan: remove
>   opie-sysinfo: split out machine-specific images
>   task-opie-16mb: use 240x320 not 320x240 images
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for openembedded:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-bug:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-efikamx:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-gumstix:
>
> Andreas M=FCller (4):
>   linux-omap: defonfig add WLAN USB chips and add debug for libertas
>   linux-omap: defconfig compile UBIFS into kernel
>   linux-omap: fix ADS7846 init fault
>   linux-omap: update to v3.5
>
> Samuel Stirtzel (1):
>   overo.inc: Use the linux-firmware-sd8686 instead of
> marvell-sdio-fw_9.70.3-p
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-ettus:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-fsl-ppc:
>
> Matthew McClintock (2):
>   u-boot: change UBOOT_MACHINES to use ?=3D so they can be overridden
>   update preferred version for linux kernel
>
> Zhenhua Luo (2):
>   fsl-image-lsb-sdk.bb: replace POKY_BASE_INSTALL with
> CORE_IMAGE_BASE_INSTALL
>   add NOR u-boot into the default build list of p1010rdb
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-igep:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-netbookpro:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-xilinx:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-chicken:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-java:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-qt3:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-telephony:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-eldk:
>
> Andy Ross (1):
>   iputils: Break libsysfs dependency
>
> Bogdan Marinescu (2):
>   bison: updated to 2.5.1
>   subversion: Add missing build dependency on sqlite3
>
> Damien Lespiau (2):
>   mesa: Update to 8.0.4 (latest stable version)
>   mesa: Use 'require' instead of 'include'
>
> Darren Hart (1):
>   linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE
>
> Franklin S Cooper Jr (1):
>   psplash: Update to latest psplash version
>
> Jackie Huang (2):
>   tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage
>   python: Fix to support the python module _bsddb built with db 5.3
>
> Javier Martinez Canillas (25):
>   xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc
>   alsa-state: use ${sbindir} instead of /usr/sbin for packaging
>   lsbsetup: use ${bindir} instead of /usr/bin for packaging
>   sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc
>   lsbtest: use ${bindir} instead of /usr/bin for packaging
>   cronie: use variables instead of hardcoded paths
>   useradd-example: use ${datadir} instead of /usr/share for packaging
>   ubootchart: use variables instead of hardcoded paths
>   xkeyboard-config: use ${datadir} instead of /usr/share for packaging
>   systemtap: use ${datadir} instead of /usr/share for packaging
>   mingetty: use ${base_sbindir} instead of /sbin for packaging
>   openssh: use ${localstatedir} instead of /var for packaging
>   libpam: use ${localstatedir} and ${sysconfdir} instead of /var and /etc
>   x11-common: use ${sysconfdir} instead of /etc for packaging
>   builder: use ${sysconfdir} instead of /etc for packaging
>   xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging
>   qemu-config: use ${sysconfdir} instead of /etc for packaging
>   chkconfig: use ${sysconfdir} instead of /etc for packaging
>   man: use ${sysconfdir} instead of /etc for packaging
>   rsync: use ${sysconfdir} instead of /etc for packaging
>   lsbinitscripts: use ${sysconfdir} instead of /etc for packaging
>   usbinit: use ${sysconfdir} instead of /etc for packaging
>   lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc
>   kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib an=
d
> /et
>   linux-firware: use ${base_libdir} instead of /lib for packaging
>
> Jesse Zhang (1):
>   image-mklibs: pass correct libdir to mklibs
>
> Khem Raj (3):
>   populate_sdk_rpm.bbclass: Depend do_populate_sdk task on
> createrepo-native
>   glib-2.0-nativesdk: Add dependency on glib-2.0-native
>   binutils: Enable threaded linking with gold
>
> Marcin Juszkiewicz (1):
>   libpam: disable NIS to not link with libtirpc when it is available
>
> Martin Jansa (4):
>   qt4-native: fix creating /include directory in build host root
>   bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
>   eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4
>   curl: disable ldap/ldaps explicitly
>
> Paul Eggleton (9):
>   classes/buildhistory: remove obsolete flat package history feature
>   classes/buildhistory: ensure old package info is removed
>   classes/buildhistory: remove unused functions
>   classes/buildhistory: save preinst/postinst/prerm/postrm
>   classes/buildhistory: record PKG/PKGE/PKGV/PKGR
>   buildhistory_analysis: tidy up duplicate split_version function
>   buildhistory_analysis: ignore removal of self-dependencies
>   classes/buildhistory: save metadata revisions
>   classes/package: don't make locale pkgs depend on PN pkg if not in
> PACKAGES
>
> Radu Moisan (2):
>   atk: package update 2.2 -> 2.4
>   babeltrace: Update to upstream stable versrion 0.12
>
> Richard Purdie (15):
>   gcc-cross-initial: Ensure it uses an isolated sysroot
>   at: Use variables from the environment to override the makefile default=
s
>   mesa: 7.11 -> 8.0.4
>   gdb-cross: Explicitly disable python
>   kernelshark: Inherit pythonnative
>   kernel.bbclass: Revert ${base_libdir} change
>   Revert "linux-firware: use ${base_libdir} instead of /lib for packaging=
"
>   linux-firmware: Ensure PR goes forward, not backwards after the revert
>   linux-yocto-3.4: Disable extra slang header search path
>   python: Fix RPATH QA issue on non-gplv3 builds
>   gcc: Disable use of sdt.h header
>   package-index: Remove the python hack, its not needed after the
> pythonnative
>   linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0
> kernels to
>   linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2
> kernels to
>   automake: Fix version reference in path substitutions
>
> Ross Burton (8):
>   mesa: no need to depend on python-native, the class does that
>   mesa: format the packages list nicely
>   mesa: move glu.pc to libglu-dev
>   mesa: add --enable-shared-glapi, and package it in libglapi
>   mesa: enable the Graphic Buffer Manager library
>   gthumb: fix parallel build problems
>   buildhistory: correctly handle reductions of numeric fields
>   buildhistory: reduce the numeric delta to 10%
>
> Roy.Li (1):
>   busybox: fix du-k-works test case
>
> Saul Wold (1):
>   foomatic: fix perl path for target
>
> Wenzong Fan (1):
>   gdk-pixbuf: fix parallel install issue
>
> Xin Ouyang (1):
>   findutils-4.4.2: add bison-native to DEPENDS
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-ti:
>
> Andreas M=FCller (1):
>   ti-dmai.inc: fix 'proto=3D'-warning on recipe parsing
>
> Koen Kooi (1):
>   u-boot 2011.09+git: update to latest version of Tom Rini's tree
>
> Roger Monk (3):
>   gstreamer-ti: convert proto to protocol in SRC_URI
>   am-sysinfo: switch 'proto' to 'protocol' in SRC_URI
>   u-boot_2011.09[.10rc]: Always use gnu ld for LD
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-angstrom:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-browser:
>
> Martin Jansa (2):
>   chromium-20: add unistd.patch which was used in 19*
>   mozilla: disable elf-hack
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-mono:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-raspberrypi:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-kde:
>
> Samuel Stirtzel (10):
>   task-kde-image: Remove redundant entry shared-mime-info
>   kdelibs4: Update to 4.9.0
>   kdelibs4-native: Update to 4.9.0
>   kde-runtime: Update to 4.9.0
>   kde-workspace: Update to 4.9.0
>   libkactivities4: Update to 4.9.0
>   nepomuk-core: Update to 4.9.0 to fix kde-runtime errors
>   plasma-active: Update to 4.9.0 to fix various issues
>   angstrom-kde-desktop-image: Temporary remove networkmanager
>   Update README
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com

--f46d0407160be907bb04c7638db7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The OE Changelog is back. =A0Some time ago, I got several reports that the =
changelog was missing entries. =A0I have since revamped the way dates are h=
andled and may have made things better (or worse). =A0The tool simply runs =
git shortlog --since &lt;date&gt; --until &lt;date&gt; with the dates refer=
enced. =A0This should capture changes from Mon through Sun of that week. =
=A0The git shortlog --since/until uses the commit dates, not the author dat=
e, so that may explain some of the missing entries. =A0git log --format=3Df=
uller can be used to view commit dates.<div>
<br></div><div>If you still see missing entries, please send me the changes=
et hash and repo, and I&#39;ll debug it. =A0If there are additional repos t=
o include, please let me know.</div><div><br></div><div>Thanks,</div><div>
Cliff<br><br><div class=3D"gmail_quote">On Thu, Aug 16, 2012 at 11:07 AM,  =
<span dir=3D"ltr">&lt;<a href=3D"mailto:cliff.brake@gmail.com" target=3D"_b=
lank">cliff.brake@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
Changelog since 2012-08-05 until 2012-08-12. =A0Projects included in this r=
eport:<br>
<br>
bitbake: git://<a href=3D"http://git.openembedded.org/bitbake" target=3D"_b=
lank">git.openembedded.org/bitbake</a><br>
openembedded-core: git://<a href=3D"http://git.openembedded.org/openembedde=
d-core
meta-openembedded" target=3D"_blank">git.openembedded.org/openembedded-core=
<br>
meta-openembedded</a>: git://<a href=3D"http://git.openembedded.org/meta-op=
enembedded" target=3D"_blank">git.openembedded.org/meta-openembedded</a><br=
>
meta-yocto: git://<a href=3D"http://git.yoctoproject.org/poky
meta-smartphone" target=3D"_blank">git.yoctoproject.org/poky<br>
meta-smartphone</a>: <a href=3D"http://git.shr-project.org/repo/meta-smartp=
hone.git
meta-micro" target=3D"_blank">http://git.shr-project.org/repo/meta-smartpho=
ne.git<br>
meta-micro</a>: git://<a href=3D"http://git.openembedded.org/meta-micro" ta=
rget=3D"_blank">git.openembedded.org/meta-micro</a><br>
meta-slugos: git://<a href=3D"http://github.com/kraj/meta-slugos
meta-nslu2" target=3D"_blank">github.com/kraj/meta-slugos<br>
meta-nslu2</a>: git://<a href=3D"http://github.com/kraj/meta-nslu2" target=
=3D"_blank">github.com/kraj/meta-nslu2</a><br>
meta-intel: git://<a href=3D"http://git.yoctoproject.org/meta-intel
meta-handheld" target=3D"_blank">git.yoctoproject.org/meta-intel<br>
meta-handheld</a>: git://<a href=3D"http://git.openembedded.org/meta-handhe=
ld" target=3D"_blank">git.openembedded.org/meta-handheld</a><br>
meta-opie: git://<a href=3D"http://git.openembedded.org/meta-opie" target=
=3D"_blank">git.openembedded.org/meta-opie</a><br>
openembedded: git://<a href=3D"http://git.openembedded.org/openembedded
meta-bug" target=3D"_blank">git.openembedded.org/openembedded<br>
meta-bug</a>: git://<a href=3D"http://github.com/buglabs/meta-bug.git" targ=
et=3D"_blank">github.com/buglabs/meta-bug.git</a><br>
meta-efikamx: git://<a href=3D"http://github.com/kraj/meta-efikamx.git
meta-gumstix" target=3D"_blank">github.com/kraj/meta-efikamx.git<br>
meta-gumstix</a>: git://<a href=3D"http://gitorious.org/schnitzeltony-oe-me=
ta/meta-gumstix.git
meta-ettus" target=3D"_blank">gitorious.org/schnitzeltony-oe-meta/meta-gums=
tix.git<br>
meta-ettus</a>: <a href=3D"http://github.com/koenkooi/meta-ettus.git" targe=
t=3D"_blank">http://github.com/koenkooi/meta-ettus.git</a><br>
meta-fsl-ppc: git://<a href=3D"http://git.yoctoproject.org/meta-fsl-ppc
meta-igep" target=3D"_blank">git.yoctoproject.org/meta-fsl-ppc<br>
meta-igep</a>: <a href=3D"http://github.com/ebutera/meta-igep.git" target=
=3D"_blank">http://github.com/ebutera/meta-igep.git</a><br>
meta-netbookpro: git://<a href=3D"http://github.com/tworaz/meta-netbookpro
meta-xilinx" target=3D"_blank">github.com/tworaz/meta-netbookpro<br>
meta-xilinx</a>: git://<a href=3D"http://git.yoctoproject.org/meta-xilinx" =
target=3D"_blank">git.yoctoproject.org/meta-xilinx</a><br>
meta-chicken: git://<a href=3D"http://github.com/OSSystems/meta-chicken
meta-java" target=3D"_blank">github.com/OSSystems/meta-chicken<br>
meta-java</a>: git://<a href=3D"http://github.com/woglinde/meta-java" targe=
t=3D"_blank">github.com/woglinde/meta-java</a><br>
meta-qt3: git://<a href=3D"http://git.yoctoproject.org/meta-qt3
meta-telephony" target=3D"_blank">git.yoctoproject.org/meta-qt3<br>
meta-telephony</a>: git://<a href=3D"http://gitorious.org/sysmocom-openembe=
dded/meta-telephony.git
meta-eldk" target=3D"_blank">gitorious.org/sysmocom-openembedded/meta-telep=
hony.git<br>
meta-eldk</a>: git://<a href=3D"http://git.denx.de/eldk.git" target=3D"_bla=
nk">git.denx.de/eldk.git</a><br>
meta-ti: git://<a href=3D"http://git.yoctoproject.org/meta-ti
meta-angstrom" target=3D"_blank">git.yoctoproject.org/meta-ti<br>
meta-angstrom</a>: git://<a href=3D"http://github.com/Angstrom-distribution=
/meta-angstrom.git
meta-browser" target=3D"_blank">github.com/Angstrom-distribution/meta-angst=
rom.git<br>
meta-browser</a>: git://<a href=3D"http://github.com/OSSystems/meta-browser=
.git" target=3D"_blank">github.com/OSSystems/meta-browser.git</a><br>
meta-mono: git://<a href=3D"http://git.yoctoproject.org/meta-mono.git
meta-raspberrypi" target=3D"_blank">git.yoctoproject.org/meta-mono.git<br>
meta-raspberrypi</a>: git://<a href=3D"http://github.com/djwillis/meta-rasp=
berrypi.git
meta-kde" target=3D"_blank">github.com/djwillis/meta-raspberrypi.git<br>
meta-kde</a>: git://<a href=3D"http://gitorious.org/openembedded-core-layer=
s/meta-kde.git" target=3D"_blank">gitorious.org/openembedded-core-layers/me=
ta-kde.git</a><br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for bitbake:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for openembedded-core:<br>
<br>
Andy Ross (1):<br>
=A0 iputils: Break libsysfs dependency<br>
<br>
Bogdan Marinescu (2):<br>
=A0 bison: updated to 2.5.1<br>
=A0 subversion: Add missing build dependency on sqlite3<br>
<br>
Damien Lespiau (2):<br>
=A0 mesa: Update to 8.0.4 (latest stable version)<br>
=A0 mesa: Use &#39;require&#39; instead of &#39;include&#39;<br>
<br>
Darren Hart (1):<br>
=A0 linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE<br>
<br>
Franklin S Cooper Jr (1):<br>
=A0 psplash: Update to latest psplash version<br>
<br>
Jackie Huang (2):<br>
=A0 tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage<br>
=A0 python: Fix to support the python module _bsddb built with db 5.3<br>
<br>
Javier Martinez Canillas (25):<br>
=A0 xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc<=
br>
=A0 alsa-state: use ${sbindir} instead of /usr/sbin for packaging<br>
=A0 lsbsetup: use ${bindir} instead of /usr/bin for packaging<br>
=A0 sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc<br>
=A0 lsbtest: use ${bindir} instead of /usr/bin for packaging<br>
=A0 cronie: use variables instead of hardcoded paths<br>
=A0 useradd-example: use ${datadir} instead of /usr/share for packaging<br>
=A0 ubootchart: use variables instead of hardcoded paths<br>
=A0 xkeyboard-config: use ${datadir} instead of /usr/share for packaging<br=
>
=A0 systemtap: use ${datadir} instead of /usr/share for packaging<br>
=A0 mingetty: use ${base_sbindir} instead of /sbin for packaging<br>
=A0 openssh: use ${localstatedir} instead of /var for packaging<br>
=A0 libpam: use ${localstatedir} and ${sysconfdir} instead of /var and /etc=
<br>
=A0 x11-common: use ${sysconfdir} instead of /etc for packaging<br>
=A0 builder: use ${sysconfdir} instead of /etc for packaging<br>
=A0 xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging<br>
=A0 qemu-config: use ${sysconfdir} instead of /etc for packaging<br>
=A0 chkconfig: use ${sysconfdir} instead of /etc for packaging<br>
=A0 man: use ${sysconfdir} instead of /etc for packaging<br>
=A0 rsync: use ${sysconfdir} instead of /etc for packaging<br>
=A0 lsbinitscripts: use ${sysconfdir} instead of /etc for packaging<br>
=A0 usbinit: use ${sysconfdir} instead of /etc for packaging<br>
=A0 lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc<br>
=A0 kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib an=
d /et<br>
=A0 linux-firware: use ${base_libdir} instead of /lib for packaging<br>
<br>
Jesse Zhang (1):<br>
=A0 image-mklibs: pass correct libdir to mklibs<br>
<br>
Khem Raj (3):<br>
=A0 populate_sdk_rpm.bbclass: Depend do_populate_sdk task on createrepo-nat=
ive<br>
=A0 glib-2.0-nativesdk: Add dependency on glib-2.0-native<br>
=A0 binutils: Enable threaded linking with gold<br>
<br>
Marcin Juszkiewicz (1):<br>
=A0 libpam: disable NIS to not link with libtirpc when it is available<br>
<br>
Martin Jansa (4):<br>
=A0 qt4-native: fix creating /include directory in build host root<br>
=A0 bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps<br>
=A0 eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4<b=
r>
=A0 curl: disable ldap/ldaps explicitly<br>
<br>
Paul Eggleton (9):<br>
=A0 classes/buildhistory: remove obsolete flat package history feature<br>
=A0 classes/buildhistory: ensure old package info is removed<br>
=A0 classes/buildhistory: remove unused functions<br>
=A0 classes/buildhistory: save preinst/postinst/prerm/postrm<br>
=A0 classes/buildhistory: record PKG/PKGE/PKGV/PKGR<br>
=A0 buildhistory_analysis: tidy up duplicate split_version function<br>
=A0 buildhistory_analysis: ignore removal of self-dependencies<br>
=A0 classes/buildhistory: save metadata revisions<br>
=A0 classes/package: don&#39;t make locale pkgs depend on PN pkg if not in =
PACKAGES<br>
<br>
Radu Moisan (2):<br>
=A0 atk: package update 2.2 -&gt; 2.4<br>
=A0 babeltrace: Update to upstream stable versrion 0.12<br>
<br>
Richard Purdie (14):<br>
=A0 gcc-cross-initial: Ensure it uses an isolated sysroot<br>
=A0 at: Use variables from the environment to override the makefile default=
s<br>
=A0 gdb-cross: Explicitly disable python<br>
=A0 kernelshark: Inherit pythonnative<br>
=A0 kernel.bbclass: Revert ${base_libdir} change<br>
=A0 Revert &quot;linux-firware: use ${base_libdir} instead of /lib for pack=
aging&quot;<br>
=A0 linux-firmware: Ensure PR goes forward, not backwards after the revert<=
br>
=A0 linux-yocto-3.4: Disable extra slang header search path<br>
=A0 python: Fix RPATH QA issue on non-gplv3 builds<br>
=A0 gcc: Disable use of sdt.h header<br>
=A0 package-index: Remove the python hack, its not needed after the pythonn=
ative<br>
=A0 linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0 kerne=
ls to<br>
=A0 linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2 kerne=
ls to<br>
=A0 automake: Fix version reference in path substitutions<br>
<br>
Ross Burton (8):<br>
=A0 mesa: no need to depend on python-native, the class does that<br>
=A0 mesa: format the packages list nicely<br>
=A0 mesa: move glu.pc to libglu-dev<br>
=A0 mesa: add --enable-shared-glapi, and package it in libglapi<br>
=A0 mesa: enable the Graphic Buffer Manager library<br>
=A0 gthumb: fix parallel build problems<br>
=A0 buildhistory: correctly handle reductions of numeric fields<br>
=A0 buildhistory: reduce the numeric delta to 10%<br>
<br>
Roy.Li (1):<br>
=A0 busybox: fix du-k-works test case<br>
<br>
Saul Wold (1):<br>
=A0 foomatic: fix perl path for target<br>
<br>
Wenzong Fan (1):<br>
=A0 gdk-pixbuf: fix parallel install issue<br>
<br>
Xin Ouyang (1):<br>
=A0 findutils-4.4.2: add bison-native to DEPENDS<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-openembedded:<br>
<br>
Andreas M=FCller (2):<br>
=A0 systemd-systemctl-native: handle ALIAS tag<br>
=A0 gdm: replace &#39;WantedBy=3Dgraphical.target&#39; by &#39;Alias=3Ddisp=
lay-manager.service&#39;<br>
<br>
Franklin Cooper Jr (1):<br>
=A0 ltrace: Fix make error<br>
<br>
Gary Thomas (2):<br>
=A0 media-ctl: Fix build with latest automake<br>
=A0 libxml++: New recipe - C++ bindings for libxml<br>
<br>
Horia Geanta (1):<br>
=A0 strongswan: upgrade to version 5.0.0<br>
<br>
Khem Raj (6):<br>
=A0 gitpkgv.bbclass: Add a symlink from meta-oe<br>
=A0 testlab.bbclass: Delete<br>
=A0 systemd: Upgrade to 187 tag<br>
=A0 busybox: stopping systemd-kmsg-syslogd is not needed<br>
=A0 <a href=3D"http://busybox-syslog.service.in" target=3D"_blank">busybox-=
syslog.service.in</a>: Create alias for syslog.service<br>
=A0 systemd: Use cross cpp<br>
<br>
Koen Kooi (4):<br>
=A0 orc: update to 0.4.16<br>
=A0 nodejs: update to 0.6.20<br>
=A0 fuse: update to 2.9.1<br>
=A0 sox: add 14.4.0<br>
<br>
Martin Ertsaas (1):<br>
=A0 cpufrequtils: Use CC, LD etc. that comes from OE.<br>
<br>
Martin Jansa (14):<br>
=A0 fbreader: drop machine overrides<br>
=A0 emacs: rename TUTORIAL.ko to TUTORIAL.KO so it&#39;s not picked by pack=
age.bbcla<br>
=A0 emacs: copy only needed stuff to qemu-treedir, not whole sysroot<br>
=A0 phonet-utils: simplify with inherit autotools<br>
=A0 sip: import from oe-classic and upgrade to latest<br>
=A0 python-sip: import from oe-classic and upgrade to latest<br>
=A0 python-pyqt: import from oe-classic<br>
=A0 anki: import from oe-classic<br>
=A0 systemd-compat-units: move list of disabled services to variable, fix h=
wcloc<br>
=A0 mplayer2: enable speex<br>
=A0 php: inherit pythonnative<br>
=A0 php: add build-defs.h to SSTATE_SCAN_FILES it defines path to sysroot w=
here<br>
=A0 systemd-compat-units: use systemctl mask<br>
=A0 systemd-systemctl-native: extend systemctl wrapper to support mask acti=
on<br>
<br>
Otavio Salvador (4):<br>
=A0 libxaw: Fix libxaw-dev to not depends on non-existent libxaw package<br=
>
=A0 tiobench: fix aligned allocation method clash with newer glibc<br>
=A0 postgresql: Fix redundant rpath for &#39;/usr/lib&#39;<br>
=A0 postgresql: Fix packaging of static libraries<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-yocto:<br>
<br>
Andy Ross (1):<br>
=A0 iputils: Break libsysfs dependency<br>
<br>
Bogdan Marinescu (2):<br>
=A0 bison: updated to 2.5.1<br>
=A0 subversion: Add missing build dependency on sqlite3<br>
<br>
Damien Lespiau (2):<br>
=A0 mesa: Update to 8.0.4 (latest stable version)<br>
=A0 mesa: Use &#39;require&#39; instead of &#39;include&#39;<br>
<br>
Darren Hart (1):<br>
=A0 linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE<br>
<br>
Franklin S Cooper Jr (1):<br>
=A0 psplash: Update to latest psplash version<br>
<br>
Jackie Huang (2):<br>
=A0 tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage<br>
=A0 python: Fix to support the python module _bsddb built with db 5.3<br>
<br>
Javier Martinez Canillas (25):<br>
=A0 xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc<=
br>
=A0 alsa-state: use ${sbindir} instead of /usr/sbin for packaging<br>
=A0 lsbsetup: use ${bindir} instead of /usr/bin for packaging<br>
=A0 sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc<br>
=A0 lsbtest: use ${bindir} instead of /usr/bin for packaging<br>
=A0 cronie: use variables instead of hardcoded paths<br>
=A0 useradd-example: use ${datadir} instead of /usr/share for packaging<br>
=A0 ubootchart: use variables instead of hardcoded paths<br>
=A0 xkeyboard-config: use ${datadir} instead of /usr/share for packaging<br=
>
=A0 systemtap: use ${datadir} instead of /usr/share for packaging<br>
=A0 mingetty: use ${base_sbindir} instead of /sbin for packaging<br>
=A0 openssh: use ${localstatedir} instead of /var for packaging<br>
=A0 libpam: use ${localstatedir} and ${sysconfdir} instead of /var and /etc=
<br>
=A0 x11-common: use ${sysconfdir} instead of /etc for packaging<br>
=A0 builder: use ${sysconfdir} instead of /etc for packaging<br>
=A0 xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging<br>
=A0 qemu-config: use ${sysconfdir} instead of /etc for packaging<br>
=A0 chkconfig: use ${sysconfdir} instead of /etc for packaging<br>
=A0 man: use ${sysconfdir} instead of /etc for packaging<br>
=A0 rsync: use ${sysconfdir} instead of /etc for packaging<br>
=A0 lsbinitscripts: use ${sysconfdir} instead of /etc for packaging<br>
=A0 usbinit: use ${sysconfdir} instead of /etc for packaging<br>
=A0 lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc<br>
=A0 kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib an=
d /et<br>
=A0 linux-firware: use ${base_libdir} instead of /lib for packaging<br>
<br>
Jesse Zhang (1):<br>
=A0 image-mklibs: pass correct libdir to mklibs<br>
<br>
Khem Raj (3):<br>
=A0 populate_sdk_rpm.bbclass: Depend do_populate_sdk task on createrepo-nat=
ive<br>
=A0 glib-2.0-nativesdk: Add dependency on glib-2.0-native<br>
=A0 binutils: Enable threaded linking with gold<br>
<br>
Marcin Juszkiewicz (1):<br>
=A0 libpam: disable NIS to not link with libtirpc when it is available<br>
<br>
Martin Jansa (4):<br>
=A0 qt4-native: fix creating /include directory in build host root<br>
=A0 bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps<br>
=A0 eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4<b=
r>
=A0 curl: disable ldap/ldaps explicitly<br>
<br>
Paul Eggleton (9):<br>
=A0 classes/buildhistory: remove obsolete flat package history feature<br>
=A0 classes/buildhistory: ensure old package info is removed<br>
=A0 classes/buildhistory: remove unused functions<br>
=A0 classes/buildhistory: save preinst/postinst/prerm/postrm<br>
=A0 classes/buildhistory: record PKG/PKGE/PKGV/PKGR<br>
=A0 buildhistory_analysis: tidy up duplicate split_version function<br>
=A0 buildhistory_analysis: ignore removal of self-dependencies<br>
=A0 classes/buildhistory: save metadata revisions<br>
=A0 classes/package: don&#39;t make locale pkgs depend on PN pkg if not in =
PACKAGES<br>
<br>
Radu Moisan (2):<br>
=A0 atk: package update 2.2 -&gt; 2.4<br>
=A0 babeltrace: Update to upstream stable versrion 0.12<br>
<br>
Richard Purdie (15):<br>
=A0 gcc-cross-initial: Ensure it uses an isolated sysroot<br>
=A0 at: Use variables from the environment to override the makefile default=
s<br>
=A0 mesa: 7.11 -&gt; 8.0.4<br>
=A0 gdb-cross: Explicitly disable python<br>
=A0 kernelshark: Inherit pythonnative<br>
=A0 kernel.bbclass: Revert ${base_libdir} change<br>
=A0 Revert &quot;linux-firware: use ${base_libdir} instead of /lib for pack=
aging&quot;<br>
=A0 linux-firmware: Ensure PR goes forward, not backwards after the revert<=
br>
=A0 linux-yocto-3.4: Disable extra slang header search path<br>
=A0 python: Fix RPATH QA issue on non-gplv3 builds<br>
=A0 gcc: Disable use of sdt.h header<br>
=A0 package-index: Remove the python hack, its not needed after the pythonn=
ative<br>
=A0 linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0 kerne=
ls to<br>
=A0 linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2 kerne=
ls to<br>
=A0 automake: Fix version reference in path substitutions<br>
<br>
Ross Burton (8):<br>
=A0 mesa: no need to depend on python-native, the class does that<br>
=A0 mesa: format the packages list nicely<br>
=A0 mesa: move glu.pc to libglu-dev<br>
=A0 mesa: add --enable-shared-glapi, and package it in libglapi<br>
=A0 mesa: enable the Graphic Buffer Manager library<br>
=A0 gthumb: fix parallel build problems<br>
=A0 buildhistory: correctly handle reductions of numeric fields<br>
=A0 buildhistory: reduce the numeric delta to 10%<br>
<br>
Roy.Li (1):<br>
=A0 busybox: fix du-k-works test case<br>
<br>
Saul Wold (1):<br>
=A0 foomatic: fix perl path for target<br>
<br>
Wenzong Fan (1):<br>
=A0 gdk-pixbuf: fix parallel install issue<br>
<br>
Xin Ouyang (1):<br>
=A0 findutils-4.4.2: add bison-native to DEPENDS<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-smartphone:<br>
<br>
Denis &#39;GNUtoo&#39; Carikli (1):<br>
=A0 meta-shr: 3rdparty: add ubx-utils uttilites for the om-gta02 machine.<b=
r>
<br>
Martin Jansa (14):<br>
=A0 meta-shr: systemd-compat-units: simplify<br>
=A0 mesa: drop glamo patch<br>
=A0 meta-smartphone: kernel recipes using MACHINE_KERNEL_PR now need to inh=
erith<br>
=A0 meta-shr, meta-openmoko: rename gpsd bbappends<br>
=A0 shr-e-gadgets: bump PR after enlightenment upgrade<br>
=A0 libphone-ui-shr: update for new elm APIs<br>
=A0 shr-wizard: bump SRCREV to fix compatibility with python-elementary r71=
083 a<br>
=A0 shr-wizard: bump SRCREV to fix compatibility with python-elementary r65=
604 a<br>
=A0 shr-settings: bump SRCREV for newer EFL and remove now unneeded do_conf=
igure<br>
=A0 meta-shr: libphone-ui-shr: fix runtime issues in phoneuid after EFL_SRC=
REV r<br>
=A0 elsa: rename to entrance<br>
=A0 libphone-ui-shr: bump SRCREV and drop local patches<br>
<br>
Simon Busch (5):<br>
=A0 meta-samsung: samsung-modem-mgr: add initial recipe<br>
=A0 meta-samsung: netbase: add specific network interface configuration for=
 cres<br>
=A0 Initial creation of the meta-android layer<br>
=A0 Move all android specific recipes from meta-fso to meta-android<br>
=A0 meta-fso: drop android utilities from fso-autorev.inc<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-micro:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-slugos:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-nslu2:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-intel:<br>
<br>
Kishore Bodke (3):<br>
=A0 meta-romley: Move Matrox MGA Xorg driver to meta-intel/common<br>
=A0 meta-intel:Add a MATROX MGA variable to ia32-base.inc<br>
=A0 meta-romley: Add Matrox MGA variable to romley.conf<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-handheld:<br>
<br>
Andrea Adami (1):<br>
=A0 zaurus: fix jffs2 and ubifs images for collie<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-opie:<br>
<br>
Paul Eggleton (9):<br>
=A0 snes9x: remove X11-based recipe<br>
=A0 snes9x-sdl-qpe: use FILESEXTRAPATHS instead of FILESPATHPKG<br>
=A0 kaffe: add missing patch from OE-Classic<br>
=A0 libsdl-qpe: add missing patches from OE-Classic<br>
=A0 gnuplot: remove<br>
=A0 opie-taskbar-images: allow re-exec of do_install<br>
=A0 libetpan: remove<br>
=A0 opie-sysinfo: split out machine-specific images<br>
=A0 task-opie-16mb: use 240x320 not 320x240 images<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for openembedded:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-bug:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-efikamx:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-gumstix:<br>
<br>
Andreas M=FCller (4):<br>
=A0 linux-omap: defonfig add WLAN USB chips and add debug for libertas<br>
=A0 linux-omap: defconfig compile UBIFS into kernel<br>
=A0 linux-omap: fix ADS7846 init fault<br>
=A0 linux-omap: update to v3.5<br>
<br>
Samuel Stirtzel (1):<br>
=A0 overo.inc: Use the linux-firmware-sd8686 instead of marvell-sdio-fw_9.7=
0.3-p<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-ettus:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-fsl-ppc:<br>
<br>
Matthew McClintock (2):<br>
=A0 u-boot: change UBOOT_MACHINES to use ?=3D so they can be overridden<br>
=A0 update preferred version for linux kernel<br>
<br>
Zhenhua Luo (2):<br>
=A0 <a href=3D"http://fsl-image-lsb-sdk.bb" target=3D"_blank">fsl-image-lsb=
-sdk.bb</a>: replace POKY_BASE_INSTALL with CORE_IMAGE_BASE_INSTALL<br>
=A0 add NOR u-boot into the default build list of p1010rdb<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-igep:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-netbookpro:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-xilinx:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-chicken:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-java:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-qt3:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-telephony:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-eldk:<br>
<br>
Andy Ross (1):<br>
=A0 iputils: Break libsysfs dependency<br>
<br>
Bogdan Marinescu (2):<br>
=A0 bison: updated to 2.5.1<br>
=A0 subversion: Add missing build dependency on sqlite3<br>
<br>
Damien Lespiau (2):<br>
=A0 mesa: Update to 8.0.4 (latest stable version)<br>
=A0 mesa: Use &#39;require&#39; instead of &#39;include&#39;<br>
<br>
Darren Hart (1):<br>
=A0 linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE<br>
<br>
Franklin S Cooper Jr (1):<br>
=A0 psplash: Update to latest psplash version<br>
<br>
Jackie Huang (2):<br>
=A0 tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage<br>
=A0 python: Fix to support the python module _bsddb built with db 5.3<br>
<br>
Javier Martinez Canillas (25):<br>
=A0 xinetd: use ${sbindir} and ${sysconfdir} instead of /usr/sbin and /etc<=
br>
=A0 alsa-state: use ${sbindir} instead of /usr/sbin for packaging<br>
=A0 lsbsetup: use ${bindir} instead of /usr/bin for packaging<br>
=A0 sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc<br>
=A0 lsbtest: use ${bindir} instead of /usr/bin for packaging<br>
=A0 cronie: use variables instead of hardcoded paths<br>
=A0 useradd-example: use ${datadir} instead of /usr/share for packaging<br>
=A0 ubootchart: use variables instead of hardcoded paths<br>
=A0 xkeyboard-config: use ${datadir} instead of /usr/share for packaging<br=
>
=A0 systemtap: use ${datadir} instead of /usr/share for packaging<br>
=A0 mingetty: use ${base_sbindir} instead of /sbin for packaging<br>
=A0 openssh: use ${localstatedir} instead of /var for packaging<br>
=A0 libpam: use ${localstatedir} and ${sysconfdir} instead of /var and /etc=
<br>
=A0 x11-common: use ${sysconfdir} instead of /etc for packaging<br>
=A0 builder: use ${sysconfdir} instead of /etc for packaging<br>
=A0 xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging<br>
=A0 qemu-config: use ${sysconfdir} instead of /etc for packaging<br>
=A0 chkconfig: use ${sysconfdir} instead of /etc for packaging<br>
=A0 man: use ${sysconfdir} instead of /etc for packaging<br>
=A0 rsync: use ${sysconfdir} instead of /etc for packaging<br>
=A0 lsbinitscripts: use ${sysconfdir} instead of /etc for packaging<br>
=A0 usbinit: use ${sysconfdir} instead of /etc for packaging<br>
=A0 lsb: use ${base_bindir} and ${sysconfdir} instead of /bin and /etc<br>
=A0 kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib an=
d /et<br>
=A0 linux-firware: use ${base_libdir} instead of /lib for packaging<br>
<br>
Jesse Zhang (1):<br>
=A0 image-mklibs: pass correct libdir to mklibs<br>
<br>
Khem Raj (3):<br>
=A0 populate_sdk_rpm.bbclass: Depend do_populate_sdk task on createrepo-nat=
ive<br>
=A0 glib-2.0-nativesdk: Add dependency on glib-2.0-native<br>
=A0 binutils: Enable threaded linking with gold<br>
<br>
Marcin Juszkiewicz (1):<br>
=A0 libpam: disable NIS to not link with libtirpc when it is available<br>
<br>
Martin Jansa (4):<br>
=A0 qt4-native: fix creating /include directory in build host root<br>
=A0 bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps<br>
=A0 eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4<b=
r>
=A0 curl: disable ldap/ldaps explicitly<br>
<br>
Paul Eggleton (9):<br>
=A0 classes/buildhistory: remove obsolete flat package history feature<br>
=A0 classes/buildhistory: ensure old package info is removed<br>
=A0 classes/buildhistory: remove unused functions<br>
=A0 classes/buildhistory: save preinst/postinst/prerm/postrm<br>
=A0 classes/buildhistory: record PKG/PKGE/PKGV/PKGR<br>
=A0 buildhistory_analysis: tidy up duplicate split_version function<br>
=A0 buildhistory_analysis: ignore removal of self-dependencies<br>
=A0 classes/buildhistory: save metadata revisions<br>
=A0 classes/package: don&#39;t make locale pkgs depend on PN pkg if not in =
PACKAGES<br>
<br>
Radu Moisan (2):<br>
=A0 atk: package update 2.2 -&gt; 2.4<br>
=A0 babeltrace: Update to upstream stable versrion 0.12<br>
<br>
Richard Purdie (15):<br>
=A0 gcc-cross-initial: Ensure it uses an isolated sysroot<br>
=A0 at: Use variables from the environment to override the makefile default=
s<br>
=A0 mesa: 7.11 -&gt; 8.0.4<br>
=A0 gdb-cross: Explicitly disable python<br>
=A0 kernelshark: Inherit pythonnative<br>
=A0 kernel.bbclass: Revert ${base_libdir} change<br>
=A0 Revert &quot;linux-firware: use ${base_libdir} instead of /lib for pack=
aging&quot;<br>
=A0 linux-firmware: Ensure PR goes forward, not backwards after the revert<=
br>
=A0 linux-yocto-3.4: Disable extra slang header search path<br>
=A0 python: Fix RPATH QA issue on non-gplv3 builds<br>
=A0 gcc: Disable use of sdt.h header<br>
=A0 package-index: Remove the python hack, its not needed after the pythonn=
ative<br>
=A0 linux-yocto-3.0: Apply slang workaround fixing perf builds to 3.0 kerne=
ls to<br>
=A0 linux-yocto-3.2: Apply slang workaround fixing perf builds to 3.2 kerne=
ls to<br>
=A0 automake: Fix version reference in path substitutions<br>
<br>
Ross Burton (8):<br>
=A0 mesa: no need to depend on python-native, the class does that<br>
=A0 mesa: format the packages list nicely<br>
=A0 mesa: move glu.pc to libglu-dev<br>
=A0 mesa: add --enable-shared-glapi, and package it in libglapi<br>
=A0 mesa: enable the Graphic Buffer Manager library<br>
=A0 gthumb: fix parallel build problems<br>
=A0 buildhistory: correctly handle reductions of numeric fields<br>
=A0 buildhistory: reduce the numeric delta to 10%<br>
<br>
Roy.Li (1):<br>
=A0 busybox: fix du-k-works test case<br>
<br>
Saul Wold (1):<br>
=A0 foomatic: fix perl path for target<br>
<br>
Wenzong Fan (1):<br>
=A0 gdk-pixbuf: fix parallel install issue<br>
<br>
Xin Ouyang (1):<br>
=A0 findutils-4.4.2: add bison-native to DEPENDS<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-ti:<br>
<br>
Andreas M=FCller (1):<br>
=A0 ti-dmai.inc: fix &#39;proto=3D&#39;-warning on recipe parsing<br>
<br>
Koen Kooi (1):<br>
=A0 u-boot 2011.09+git: update to latest version of Tom Rini&#39;s tree<br>
<br>
Roger Monk (3):<br>
=A0 gstreamer-ti: convert proto to protocol in SRC_URI<br>
=A0 am-sysinfo: switch &#39;proto&#39; to &#39;protocol&#39; in SRC_URI<br>
=A0 u-boot_2011.09[.10rc]: Always use gnu ld for LD<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-angstrom:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-browser:<br>
<br>
Martin Jansa (2):<br>
=A0 chromium-20: add unistd.patch which was used in 19*<br>
=A0 mozilla: disable elf-hack<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-mono:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-raspberrypi:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
Changelog for meta-kde:<br>
<br>
Samuel Stirtzel (10):<br>
=A0 task-kde-image: Remove redundant entry shared-mime-info<br>
=A0 kdelibs4: Update to 4.9.0<br>
=A0 kdelibs4-native: Update to 4.9.0<br>
=A0 kde-runtime: Update to 4.9.0<br>
=A0 kde-workspace: Update to 4.9.0<br>
=A0 libkactivities4: Update to 4.9.0<br>
=A0 nepomuk-core: Update to 4.9.0 to fix kde-runtime errors<br>
=A0 plasma-active: Update to 4.9.0 to fix various issues<br>
=A0 angstrom-kde-desktop-image: Temporary remove networkmanager<br>
=A0 Update README<br>
<br>
<br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><a href=3D"http://bec-systems.co=
m" target=3D"_blank">http://bec-systems.com</a><br>
</div>

--f46d0407160be907bb04c7638db7--
