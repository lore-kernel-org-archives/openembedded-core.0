Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2109460721;
	Tue, 24 May 2016 01:50:52 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id e35so265622qge.1;
	Mon, 23 May 2016 18:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=0Uv2BrnMFurwWRRbRPfPpS4ybQ2ZVZw7jBE4gKYO3iQ=;
	b=Dcor6yEIWsENsIQXdxRibRM0zFcfnKF+JZ8wJFi8/YAsaEWLMKOcRfnx7J9ZU++vf0
	IZrkCRc8UqGT0ps8u2LGYt02zrKgPyD6rrj+yyaOiq6OgXaS7v/9wMdEUqNwou5xyXTL
	ixNMMXtmiVrekfEDbVExe8JxJRmw+JIhMxPDC1Yqr5DuFSroJYE75CDmwu/EWwfPFN24
	JMhhKJNuIEbi4BPlsAu6EMJe88yrLx7HOJxiqI9JpvL+vwxu/qfVN8eYSqLJxg9QgUXP
	U5NrzaZvMyuggmMIzf1AL3w+89OzbqoT0vAtwvGaGHag6zCk4Kk4EOLKfLwDx05NIjG9
	8+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=0Uv2BrnMFurwWRRbRPfPpS4ybQ2ZVZw7jBE4gKYO3iQ=;
	b=RDzgr+kzPK5WtF3Th/tuZgMAgrpnq3/Utju5gW/Nt51FKI+QSMo6Eno8iPihcVVLKx
	KcET4+Xgbj3p4sMidUbvweYvoSQvtlpK0jwM7Z3JMgvAKChM84gJmOy3PpPaagHG1OYg
	83fbtguYUlGX/L6Fdv/VqVmI/IgrBYo+PspVxW8+t85toOh9vjUKC4D+r80FuS57DX63
	Lb0OB7YyxZtK+h1lHW/yQkmwxc0aXL20v80Aoa0WhCl7bDkgoyIaf3d+U/2ddWmemp3H
	TTyGsF+iF5hLOa6ayyTXmaeCIC2psB4SRYoMFdKExRa8NIHav1GnYnhN2UrJmBgIqNlO
	H1pw==
X-Gm-Message-State: ALyK8tK0cnQPRRyo32P+MZlYp2p2fdHkfbI7oZ3y7fHAKAadsF8OttMFkEesdOHk8lPP+g==
X-Received: by 10.140.156.195 with SMTP id c186mr1156670qhc.58.1464054652441; 
	Mon, 23 May 2016 18:50:52 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool5-cs-73.doycomm.com. [66.219.182.73])
	by smtp.gmail.com with ESMTPSA id q7sm153719qtd.34.2016.05.23.18.50.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2016 18:50:51 -0700 (PDT)
Date: Mon, 23 May 2016 18:50:51 -0700 (PDT)
X-Google-Original-Date: Tue, 24 May 2016 01:50:49 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1464054649898.9b34c448@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-05-15 until 2016-05-22
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 01:50:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-05-15 until 2016-05-22.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-atmel: https://github.com/linux4sam/meta-atmel.git
meta-beagleboard: git://github.com/beagleboard/meta-beagleboard.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-bug: git://github.com/buglabs/meta-bug.git
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-efikamx: git://github.com/kraj/meta-efikamx.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-arm: git://git.yoctoproject.org/meta-fsl-arm
meta-fsl-arm-extra: git://github.com/Freescale/meta-fsl-arm-extra.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git
meta-gumstix: git://github.com/gumstix/meta-gumstix.git
meta-gumstix-community: =
https://github.com/schnitzeltony/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-jetson-tk1: https://github.com/cubicool/meta-jetson-tk1.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nodejs: https://github.com/imyller/meta-nodejs.git
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-opie: git://git.openembedded.org/meta-opie
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-qt5: git://github.com/meta-qt5/meta-qt5.git
meta-slugos: git://github.com/kraj/meta-slugos
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-webos: git://github.com/openwebos/meta-webos.git
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-yocto: git://git.yoctoproject.org/meta-yocto
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Belen Barros Pena (1):
=20=20toaster: projectconf Small tweaks to IMAGE_FSTYPES form

Christopher Larson (5):
=20=20bitbake-layers: convert to plugin-based
=20=20bb.cooker: show limited traceback for parsing ExpansionError
=20=20Implement support for per-task exports
=20=20Provide LAYERDIR_RE for layer.conf
=20=20bb.codeparser: track variable flag references

Elliot Smith (3):
=20=20buildinfohelper: add method to set current build as CANCELLED
=20=20toasterui: capture keyboard interrupts the same way as knotty
=20=20toaster: don't show "Rebuild" button for cancelled cli builds

Michael Wood (8):
=20=20toaster: toastertables: Clean up and fix up a number of items
=20=20toaster: toastergui tests Fix toastertable tests
=20=20toaster: Remove DATABASE_URL being passed around as an environment var
=20=20toaster: runbuilds move the execution sequence out of the poll loop
=20=20toaster: Add a specific test settings file
=20=20toaster: tests Add a BuildTest helper class
=20=20toaster: tests build Add a test for a build of core-image-minimal
=20=20toaster: tests builds Add SSTATE_MISS as a valid condition for =
tc=3D833

Richard Purdie (6):
=20=20siggen: Fixes to handle sigdata/siginfo files only containing =
basehash data
=20=20knotty: Fix output buffering issues
=20=20cache: Increase cache version after task checksum calculation changes
=20=20codeparser: Increase cache version after code parser dependency =
changes
=20=20cooker: Improve taskgraph file handling
=20=20cooker: Fix parse progress for python3

Sujith H (2):
=20=20toaster: handle multiple imagefs types
=20=20toaster-tests: tests for project config

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Anders Darander (1):
=20=20lib/oe/rootfs: Fix DEBUGFS generation, without openssl

Andrew Bradford (1):
=20=20lttng-modules: Upgrade to 2.7.3 release

An=C3=ADbal Lim=C3=B3n (2):
=20=20classes/base: get_lic_checksum_file_list imporve validaton of url's
=20=20qemu: Upgrade to 2.5.1.1 for fix CVE-2016-3710 and CVE-2016-3712

Armin Kuster (5):
=20=20gcc: Security fix CVE-2016-4488
=20=20gcc: Security fix CVE-2016-4489
=20=20gcc: Security fix CVE-2016-2226
=20=20gcc: Security fix CVE-2016-4490
=20=20python-numpy: fix build failure with python-matplotlib

Awais Belal (1):
=20=20mesa-demos: provide option for disabling GLX demos

Christian Ege (1):
=20=20bluez5: fixed path to bluetoothd in sysvinit script

Christopher Larson (1):
=20=20mkelfimage: obey LDFLAGS, sort out HOST_ flags

Dai Caiyun (3):
=20=20shadow: Fix rootfs creation errors
=20=20net-tools: Fix rootfs creation errors
=20=20coreutils: Fix rootfs creation errors

Dengke Du (1):
=20=20coreutils: fix for native and nativesdk

Ed Bartosh (4):
=20=20wic: add bmaptool to the list of utilities
=20=20wic: implement --bmap option
=20=20wic: add help for --bmap commandline option
=20=20oe-selftest: wic: add test_bmap test case

Edwin Plauchu (3):
=20=20stat: fix security issues
=20=20zip: fix security issues
=20=20makedevs: fix security issues

George McCollister (1):
=20=20wic: fix path parsing, use last occurrence

Guojian Zhou (1):
=20=20perl: use PACKAGESPLITFUNCS instead of populate_packages_prepend

Herve Jourdain (1):
=20=20mesa: fix mesa_populate_packages() when dri is disabled

Humberto Ibarra (2):
=20=20scripts/oe-selftest: Improve listing by reducing unneeded spacing
=20=20scripts/bitbake-whatchanged: migrate from optparse to argparse

Jussi Kukkonen (17):
=20=20glib-networking: Upgrade 2.46.1 -> 2.48.2
=20=20pango: Upgrade 1.38.1 -> 1.40.1
=20=20gdk-pixbuf: Upgrade 2.32.3 -> 2.34.0
=20=20gsettings-desktop-schemas: Upgrade 3.19.3 -> 3.20.0
=20=20inputproto: Upgrade 2.3.1 -> 2.3.2
=20=20json-glib: Upgrade 1.0.4 -> 1.2.0
=20=20libsoup-2.4: Upgrade 2.52.2 -> 2.54.1
=20=20expat: Upgrade 2.1.0 -> 2.1.1
=20=20xproto: Upgrade 7.0.28 -> 7.0.29
=20=20glib-2.0: Upgrade 2.46.2 -> 2.48.1
=20=20wayland: Upgrade 1.9.0 -> 1.10.0
=20=20wayland-protocols: Add recipe
=20=20weston: Upgrade 1.9.0 -> 1.10.0
=20=20gnome-doc-utils: Update AM_GLIB_GNU_GETTEXT macro
=20=20pkgconfig: Update AM_GLIB_GNU_GETTEXT macro
=20=20openssh: Upgrade 7.1p2 -> 7.2p2
=20=20openssh: Backport fix for CVE-2015-8325

Khem Raj (5):
=20=20pixman: Fix build on arches not defining FE_INVALID exception
=20=20useradd.bbclass: Strip trailing ';' in cmd params
=20=20systemd: Create missing sysusers offline
=20=20elfutils-0.148: Fix build with gcc6
=20=20musl: Update to latest tip

Klauer, Daniel (3):
=20=20python-smartpm: Fix channel command --remove-all option (again)
=20=20python-smartpm: Don't ignore error if RPM transaction fails without =
problems
=20=20python-smartpm: Remove unnecessary error reporting improvement patch

Leonardo Sandoval (1):
=20=20ghostscript: Update URL_SRI considered as 'old release'

Marek Vasut (3):
=20=20sysprof: Disable nios2 support
=20=20kernel: fitimage: Repair misuse of shell test command
=20=20qemu: Upgrade to 2.6.0

Mariano Lopez (6):
=20=20oeqa/oetest.py: Add class ExportTestContext
=20=20testexport.bbclass: Split testimage class
=20=20oeqa/runexported.py: Remove host dumper
=20=20testimage.bbclass: Remove exported test
=20=20oetest.py: Add default pscmd to oeTest
=20=20oetest.py: Use the real ExportTestContext in exported tests

Martin Jansa (3):
=20=20useradd: use bindir_native for pseudo PATH
=20=20core-image-{minimal, testmaster}-initramfs: set COMPATIBLE_HOST
=20=20linux-yocto-rt, core-image-rt*: Explicitly skip when =
PREFERRED_PROVIDER_virt

Maxin B. John (9):
=20=20libproxy: update to version 0.4.13
=20=20libsolv: upgrade to 0.6.20
=20=20package_regex.inc: remove deprecated file
=20=20freetype: fix upstream check
=20=20libgudev: fix upstream check
=20=20cmake: update to 3.5.2
=20=20libsoup-2.4: provide PACKAGECONFIG for gssapi
=20=20libsolv: update to 0.6.21
=20=20harfbuzz: update to 1.2.7

Ming Liu (2):
=20=20kernel: moves KERNEL_SRC_PATH to bitbake.conf
=20=20build-appliance-image: use 'lnr' instead of 'ln -sr'

Nicolas Dechesne (1):
=20=20bluez5: move btmgmt to common READLINE section

Otavio Salvador (10):
=20=20weston: Fix SystemD service description
=20=20weston: Add PACKAGECONFIG option for 'clients'
=20=20weston: Enable XWayland when X11 and Wayland support are available
=20=20weston: Remove XWayland dependencies on PACKAGECONFIG
=20=20weston-init: Rework do_install to use install -D option
=20=20weston-init: Rework init sequence to avoid code duplication
=20=20weston-init: Error out if loading a nested instance
=20=20weston-init: Add module support for the weston-start helper
=20=20weston: Add Xwayland initialization support using weston-start
=20=20core-image-weston: If X11 is enabled, add XWayland support

Patrick Ohly (2):
=20=20image.bbclass: support duplicate compression types
=20=20image.bbclass: additional output in create_symlinks

Paul Eggleton (4):
=20=20classes/populate_sdk_ext: adjust variable blacklisting
=20=20classes/kernel: fix typo
=20=20classes/kernel: check OLDEST_KERNEL at configure time
=20=20devtool: sdk-update: drop support for local updates

Peter Kjellerstedt (7):
=20=20Revert "rootfs.py: add more info to the warning message"
=20=20rootfs.py: Remove _log_check_error() from the RpmRootfs class
=20=20rootfs.py: Simplify the regular expression used in _log_check_warn()
=20=20rootfs.py: Use one way to exclude lines in _log_check_error()
=20=20rootfs.py: Exclude lines in _log_check_warn() as well
=20=20rootfs.py: Reduce spam from _log_check_warn()
=20=20rootfs.py: Unify _log_check_warn() and _log_check_error()

Peter Seebach (1):
=20=20acl.inc, run-ptest: improve ptest functionality on limited rootfs

Raymond Tan (1):
=20=20mkefidisk.sh: mount images as read-only

Richard Purdie (15):
=20=20oeqa: Print function python3 fixes
=20=20classes/oeqa: Update for print statements and file() -> open() for =
python3
=20=20sstate: Ensure we sort the value used for SSTATETASKS for determinism
=20=20glibc: Add missing patch hunk back
=20=20pseudo: Work around issues with glibc 2.24
=20=20yocto-uninative: Update to 1.1 tarball (new version of glibc)
=20=20glibc-locale: Enable binary locale generation for nativesdk-glibc
=20=20nativesdk-glibc: Extend relocation support to locales
=20=20meta/selftest/scripts: Use print function for python3 compatibility
=20=20meta/scripts: python3: rename file -> open
=20=20kernel-uimage: Fix python indentation
=20=20meta: Update to modern exception syntax
=20=20bitbake.conf/toolchain-shar-extract: Use en_US.UTF-8 as locale
=20=20python-smartpm: Avoid locale issue with bitbake python3
=20=20scripts/oe-selftest: Remove inadvertant python3 specific change

Robert Yang (13):
=20=20cogl-1.0: set COMPATIBLE_HOST_armv4 to null
=20=20gnu-efi: set COMPATIBLE_HOST_armv4 to null
=20=20oe-buildenv-internal: add BBPATH_EXTRA to BB_ENV_EXTRAWHITE_OE
=20=20eudev: remove eudev-hwdb from RRECOMMENDS_eudev
=20=20python3-smmap: add it for python3-gitdb
=20=20python3-async: add it for python3-gitdb
=20=20python3-gitdb: add it for python3-git
=20=20python3-git: add it for buildtools-tarball
=20=20buildtools-tarball: remove nativesdk-python-pexpect
=20=20buildtools-tarball: replace nativesdk-python with nativesdk-python3
=20=20buildtools-tarball: add nativesdk-locale-base-en-us
=20=20webkitgtk: turn off JIT on armv4 and armv7a
=20=20linux-dummy: set INHIBIT_DEFAULT_DEPS

Ross Burton (5):
=20=20openssh: change URI to http:
=20=20unzip: update SRC_URI
=20=20zip: update SRC_URI
=20=20wipe-sysroot: fix wrong glob when removing manifests
=20=20package_manager: no need to output Note: in bb.note() calls

Roy Li (1):
=20=20systemd: re-enable mount propagation for udevd

Stephano Cetola (1):
=20=20openssh: update homepage and summary

Tom Hochstein (4):
=20=20mesa-demos: OpenVG demos with single frame need eglSwapBuffer
=20=20weston: weston-launch: Handle invalid command line options
=20=20weston: Provide a default version of weston-launch that doesn't =
require PAM
=20=20weston-init: Use weston-launch when starting weston as the first =
windowing s

bavery (1):
=20=20gdb: Backport patch to changes with AVX and MPX

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20obexftp: mark as compatible with bluez5

Andreas M=C3=BCller (3):
=20=20poppler: update to 0.43.0
=20=20geany: update to 1.27
=20=20geany-plugins: initial add 1.27

Armin Kuster (5):
=20=20python-numeric: Add LLNL license
=20=20libxkbui: Fix license WARNING
=20=20pytest: fix runtime issues.
=20=20python-cryptography: fix compile issue with openssl 1.0.2h
=20=20uim: Fix Warning

Catalin Enache (1):
=20=20proftpd: fix mod_tls build issue

Daniel McGregor (1):
=20=20krb5: fix uninitialized variable warning

Derek Straka (4):
=20=20python-flask-pymongo: update to 0.4.1
=20=20python-flask-login: update to 0.3.2
=20=20python-pymisp: update to version 2.4.36
=20=20python-requests: update to version 2.10.0

Hongxu Jia (3):
=20=20efivar: fix do_install failed
=20=20efibootmgr: sync with upstream while efivar upgraded to 0.23
=20=20efivar: fix unknown option while gold linker used

Ioan-Adrian Ratiu (1):
=20=20gnulib: bump git revision

Jack Mitchell (1):
=20=20libsoc: update to 0.8.1

Kirill Esipov (1):
=20=20apache2: fix libtool's path in apxs

Koen Kooi (2):
=20=20efivar: update to 0.23
=20=20efibootmgr: update and unblacklist

Paul Gortmaker (1):
=20=20netcf: unconditionally remove gnulib dir to support reconfigure

Robert Yang (1):
=20=20rrdtool: only unset PERLHOSTLIB in do_configure

Yang Shi (1):
=20=20libhugetlbfs: enable build for x86-32

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (2):
=20=20packagegroup-qt5: Drop qtbase-fonts
=20=20angstrom.conf: Bump default gcc/gdb/binutils versions

Koen Kooi (1):
=20=20arm-defaults: cover the funky new vfp cases as well

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (11):
=20=20weston-init: revive restarting Weston code for new calibration data
=20=20opencv: temporary fix for locale pkg dependency until fixed upstream
=20=20branding: start using bleeding branding for AUTOREV-ing components
=20=20recipes: replace old-style dashes in PRs with dots globally
=20=20weston-init: disable systemd service to fall back to old initscript
=20=20packagegroups: separate opencl and deps, remove cruft, simplify code
=20=20alsa-plugins: don't make pulseaudio the default device when available
=20=20packagegroup*-toolchain-tisdk-target: add opencl components to the =
devkit
=20=20tisdk-server-*-image: add opencl and opencl-extra packagegroups
=20=20ltp-ddt: update to latest
=20=20systemd: port custom rules from udev, enable networkd and automount

Jacob Stiffler (3):
=20=20arago-image: make all symlinks relative in /boot
=20=20sourceipk: fix git preservation against bitbake 1.30
=20=20ti-tisdk-setup: Bump SRCREV for U-Boot 2016.05 changes

Karthik Ramanan (2):
=20=20omapdrmtest: recipe cleanup and fixes for krogoth dependencies
=20=20packagegroup-arago-test: add omapdrmtest

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Carlos Rafael Giani (4):
=20=20chromium: Replace deprecated base_* wrapper calls
=20=20chromium: Create chromium-browser.inc to simplify upgrades
=20=20chromium: Upgrade to version 48.0.2548.0
=20=20chromium: Add workarounds for compiler errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Fabio Estevam (1):
=20=20u-boot-fslc: Update to revision 6e4d8c5

Otavio Salvador (7):
=20=20u-boot-fslc: Update to 2016.05-based fork
=20=20linux-fslc: Update to 4.6-based fork
=20=20opencv: Remove bbappend to block 3.1 version use
=20=20imx-vpu: Set PACKAGE_ARCH to MACHINE_ARCH
=20=20imx-base.inc: Fix PACKAGE_ARCH attribution for multimedia libraries
=20=20imx-base: Improve sstate signature handling for BSP packages
=20=20u-boot-fslc: Update to revision 158a5196

Tom Hochstein (1):
=20=20mesa-demos: Fix incorrent spelling of Upstream-Status tag.

Yuqing Zhu (1):
=20=20pulseaudio: Remove the control for speaker/headphone widget for i.MX7D

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Daiane Angolini (1):
=20=20imx6ul-pico-hobbit: Add machine configuration

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

California Sullivan (1):
=20=20linux-yocto/4.4: Bump SRCREVs to Linux 4.4.11

Ross Burton (1):
=20=20recipes: use bb.utils.contains instead of base_contains

Saul Wold (1):
=20=20lms8: Add patch to fix gcc6 C++ whitespace

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-jetson-tk1:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (5):
=20=202016-05-17, Version 6.2.0 (Stable)
=20=20Rename npm class to npm-base for Yocto 2.1 (krogoth) compatibility
=20=20Default back to non-icu builds with v6 Upstream defaults to small-icu =
since=20
=20=20Apply upstream patch to temporarily fix non-icu builds =
[nodejs/node#6820]
=20=20Added nicer Node.js version tags

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (5):
=20=20linux-ti-staging: update to 4.4.10 and ti2016.01-rc2 tag
=20=20u-boot-ti-staging: update for ti2016.01-rc2 tag
=20=20machine: add opencl feature to corresponding platforms
=20=20linux-ti-staging: update to 4.4.11 and ti2016.01-rc3 tag
=20=20u-boot-ti-staging: update to final 2016.05 and ti2016.01-rc3 tag

Sam Nelson (1):
=20=20linux-ti-staging: Add new device tree target =
am572x-idk-pru-excl-uio.dtb

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (5):
=20=20README.md: Rename README for markdown formatting
=20=20README.md: Rework structure of README
=20=20README.building.md: Document the process for meta-xilinx
=20=20README.booting.md: Document common booting processes
=20=20machine-xilinx-default.inc: Disable 'qemu-usermode' for MicroBlaze

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Edwin Plauchu (1):
=20=20meta-yocto-bsp: Enable xf86 modeset for beaglebone

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



