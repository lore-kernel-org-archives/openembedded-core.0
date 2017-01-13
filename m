Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id EE02471D99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:39:22 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id u25so53875305qki.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 05:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BLn7Zb33ZcipcrctSx9JOTq7Z+Mf8QCwoFxNioy5Qno=;
	b=R2L3x/JBJVo5OBo1KKgIcjv4S8Gtt9NC9Zm9L/yuwMj998OQfzLxs/9utYbYh/g4u4
	u+4e7OBnkD2R5x5ohO6yIQdM5V2HF/kJallERv0vz3hhqXD84QmP8tboRhvnE17rVsW4
	3vB7+DyGHTjjVHXZIWKaCTUHN5fDPpXY3YHR8nTo4glS4JHJ5liZLOf0Aa7wWIHZ/B8P
	MINA8B3uZv6Pa/zd/BKycLkfq/7hiazLpMmhE5Y/peB06TNyvTsciTDGya5ho4zzFQsQ
	RTzytneqeA4TzHba+H3h2KFbMI1X8gTkpN2c023kgaoSOIBnl2hwUn7KC6ELOe/ov69Y
	sAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BLn7Zb33ZcipcrctSx9JOTq7Z+Mf8QCwoFxNioy5Qno=;
	b=WnEb0ojeYG7EBfsEZ9HKSVXOI6WY34PYXjMocy8ZQt03klUueTjXUqWv+/QCAa2vlV
	ooVLA0YTN+8bhtcPVfSpQwSyuewd6Et4PKPM4+UsQVAkkESClidlaeUzL5YQI3T3M2H0
	h0n9k7BU4U/HiznJQeGQiHgLXQbnc/+BgxvFHFX8qWp1JY8sk09bey+ruxuXiEiPoW8p
	2LsKcxvgSRJa1GKPim/oXM+OPHmPQmDq2ULkjYXHhi7Z01gK+C9PlameVjit+HaN5PiM
	dKMPfKMYz92SeLGdhVsa1593c4vdhuk6FBrzEQYjv8lrsq4H2wQmFpCWR2CSDc4Zb+0f
	h8Ew==
X-Gm-Message-State: AIkVDXJQYM/SWlyBZAqWWm/IfE0bRWdBUIGWBbqj4JiDAZohiCM99P/0p5GkmzXNwdQR8qaIx1gP/MagfHg7dQ==
X-Received: by 10.55.114.2 with SMTP id n2mr20064221qkc.318.1484314762660;
	Fri, 13 Jan 2017 05:39:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 13 Jan 2017 05:39:22 -0800 (PST)
In-Reply-To: <cover.1484312322.git.ross.burton@intel.com>
References: <cover.1484312322.git.ross.burton@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Jan 2017 08:39:22 -0500
Message-ID: <CADkTA4NpPn78=SB+b2zO=Vd8z2SG+BtBLQi1ciKjXyEruoQ1rQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 13:39:23 -0000
Content-Type: multipart/alternative; boundary=94eb2c05be6829d0970545f9f6e1

--94eb2c05be6829d0970545f9f6e1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2017 at 8:00 AM, Ross Burton <ross.burton@intel.com> wrote:

> Hi,
>
> Another consolidated pull.  Last run on the AB was mostly green:
> - byacc on beaglebone-lsb failed (upgrade removed)
> - checkuri failed (transient, works now)
> - selftest failed (fixed in branch, tests work locally now)
>


Should I re-send my kernel queue ? It is now about 13 patches long, and I'm
stacking
a few more on every couple of days.

I assume there are still some outstanding issues with the 4.9 kernel, or
more specifically
the 4.9 kernel headers ?

If there's a pointer to the list of issues, that would be great, so I can
help prod things
along (assuming I can sort out the build issues .. c libraries give me
headaches ;)

Cheers,

Bruce


>
> Ross
>
> The following changes since commit 29423274b1ff04e779f00aa6aae7db
> aa7ce89226:
>
>   bitbake: gitsm.py: Add force flag to git checkout command in
> update_submodules (2017-01-12 17:48:12 +0000)
>
> are available in the git repository at:
>
>   ssh://git@git.yoctoproject.org/poky-contrib ross/mut
>
> for you to fetch changes up to b1f6b2b8c185b446be83b030e6f01b2c390f5716:
>
>   mpc8315e-rdb: move wks file to wic/ directory (2017-01-13 12:56:42 +000=
0)
>
> ----------------------------------------------------------------
> Alejandro Hernandez (3):
>       gummiboot: Remove gummiboot tests
>       gummiboot: Remove old gummiboot recipe, related class and wks file
>       systemd-boot.bbclass: Fix SYSYTEMD_BOOT_CFG creation
>
> Alejandro del Castillo (2):
>       opkg: upgrade to v0.3.4
>       opkg-utils: bump SRCREV to 0.3.4 tag
>
> Alistair Francis (1):
>       runqemu: Allow the user to specity no kernel or rootFS
>
> Amarnath Valluri (2):
>       kernel: Modify kernel modules installation path.
>       linux-firmware: Modify firmware installation path
>
> Andre McCurdy (1):
>       wayland: minor recipe cleanup
>
> Andreas M=C3=BCller (1):
>       python3-pygobject: add PACKAGECONFIG for cairo - enabled by default
>
> Andr=C3=A9 Draszik (2):
>       lib/oe/rootfs: reliably handle alternative symlinks
>       opkg-utils: use D instead of OPKG_OFFLINE_ROOT in postrm
>
> Chen Qi (9):
>       systemd-bootchart: upgrade to 231
>       dbus/dbus-test: upgrade to 1.10.14
>       sysstat: upgrade to 11.5.3
>       grep: upgrade to 2.27
>       coreutils: upgrade to 8.26
>       selftest/eSDK.py: fix sstate dir not found error
>       selftest/bbtests.py: fix path assumption for LICENSE_DIRECTORY
>       selftest/buildoptions.py: fix path assumption for DEPLOY_DIR_SRC
>       scripts/oe-selftest: fix typo
>
> Christoph Settgast (1):
>       libdrm: enable etnaviv experimental support
>
> Derek Straka (1):
>       python-3.5-manifest: Add http module to the netclient package
>
> Ed Bartosh (11):
>       image_types.bbclass: look for wks files in <layer>/wic
>       beaglebone: add beaglebone.wks
>       wic: fix parsing of 'bitbake -e' output
>       canned-wks: remove mpc8315e-rdb.wks
>       direct.py: fix getting image name
>       wic: _exec_cmd: produce error if exit code is not 0
>       mpc8315e-rdb.conf: produce wic images for MPC8315
>       genericx86: add genericx86.wks
>       edgerouter: add edgerouter.wks
>       README.hardware: update MPC8315E-RDB section
>       mpc8315e-rdb: move wks file to wic/ directory
>
> Haiqing Bai (1):
>       kexec: ARM: fix align issue of add_buffer_phys_virt() for LPAE kern=
el
>
> Ioan-Adrian Ratiu (1):
>       wic/isoimage-isohybrid: remove do_stage_partition()
>
> Jose Perez Carranza (1):
>       runtime: Add cleanup for logrotate tests
>
> Juro Bystricky (1):
>       build-appliance-image: support for Toaster
>
> Khem Raj (2):
>       musl: Upgrade to 1.1.16+ on master
>       grub-git: Upgrade to tip of master and fix with glibc 2.25
>
> Leonardo Sandoval (3):
>       recipes-test: exclude recipes from world target
>       selftest: devtool: use distro agnostic recipes for devtool checks
>       selftest: runtime-test: skip image-install test for poky-tiny
>
> Linus Wallgren (1):
>       apt-package: Include maintenance scripts
>
> Mark Asselstine (1):
>       sysklogd: do more to properly work with systemd
>
> Markus Lehtonen (10):
>       oeqa.utils.metadata: re-organise host distro information
>       oeqa.utils.metadata: re-organise distro information
>       oeqa.utils.metadata: drop 'unknown' git data elements
>       oeqa.utils.metadata: fix retrieval of git branch and revision
>       oeqa.utils.metadata: rename 'revision' to 'commit'
>       oeqa.utils.metadata: add commit count information
>       oeqa.utils.metadata: have layer name as an attribute in xml
>       oeqa.utils.metadata: add bitbake revision information
>       oeqa.utils.metadata: allow storing any bitbake config variables
>       oeqa.utils.metadata: include BB_NUMBER_THREADS and PARALLEL_MAKE
>
> Maxin B. John (1):
>       sqlite3: upgrade to 3.16.2
>
> Ola x Nilsson (2):
>       externalsrc.bbclass: Add task buildclean
>       oe-selftest: devtool: Add test for externalsrc buildclean
>
> Patrick Ohly (8):
>       recipes: anonymous functions with priorities
>       build.py: add preceedtask() API
>       runqueue.py: alternative rm_work scheduler
>       gcc-source.inc: cleanly disable do_rm_work
>       rm_work_and_downloads.bbclass: more aggressively minimize disk usag=
e
>       rm_work.bbclass: clean up sooner
>       rootfs-postcommands.bbclass: sort passwd entries
>       insane.bbclass: print license text as part of QA message
>
> Randy Witt (2):
>       image_typedep.py: Add a test that ensures conversion type deps get
> added
>       image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion
> types
>
> Ross Burton (9):
>       linux-firmware: remove alternatives for brcmfmac-stdio.bin
>       opkg-utils: set CLEANBROKEN as upstream Makefile doesn't have clean
> target
>       flex: upgrade to 2.6.2
>       opkg: fix conffile errors in 'opkg status' calls
>       rootfs: don't put /usr/lib/ssl and /etc into debugfs
>       selftest/archiver: don't build an image for a basic test
>       grub_git: remove redundant inherits
>       selftest/bblayers: don't fetch a variable that is never used
>       selftest/base: don't fetch DISTRO variable in constructor
>
> Saul Wold (1):
>       nfs-utils: remove -f exports from nfsserver
>
> Tom Zanussi (1):
>       scripts: python3 fixes and new tool ksum
>
> Zheng Ruoqin (1):
>       iproute2 4.7->4.9
>
>  README.hardware                                    |  69 +++++++
>  bitbake/lib/bb/build.py                            |  16 ++
>  bitbake/lib/bb/data_smart.py                       |   3 +
>  bitbake/lib/bb/parse/ast.py                        |  19 +-
>  bitbake/lib/bb/runqueue.py                         | 107 +++++++++++
>  .../recipes-test/aspell/aspell_0.0.0.1.bb          |   2 +
>  .../recipes-test/devtool/devtool-test-localonly.bb |   1 +
>  .../recipes-test/devtool/devtool-test-patch-gz.bb  |   1 +
>  .../recipes-test/devtool/devtool-test-subdir.bb    |   2 +
>  .../devtool/devtool-upgrade-test1_1.5.3.bb         |   2 +
>  .../devtool-upgrade-test1_1.5.3.bb.upgraded        |   2 +
>  .../devtool/devtool-upgrade-test2_git.bb           |   2 +
>  .../devtool/devtool-upgrade-test2_git.bb.upgraded  |   2 +
>  .../recipetool/selftest-recipetool-appendfile.bb   |   2 +
>  meta-yocto-bsp/conf/machine/beaglebone.conf        |   2 +-
>  meta-yocto-bsp/conf/machine/edgerouter.conf        |   2 +-
>  .../conf/machine/include/genericx86-common.inc     |   2 +-
>  meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |   4 +
>  meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py      |  83 --------
>  meta-yocto-bsp/wic/beaglebone.wks                  |   6 +
>  meta-yocto-bsp/wic/edgerouter.wks                  |   4 +
>  meta-yocto-bsp/wic/genericx86.wks                  |   7 +
>  meta-yocto-bsp/wic/mpc8315e-rdb.wks                |   4 +
>  meta/classes/externalsrc.bbclass                   |  19 +-
>  meta/classes/gummiboot.bbclass                     | 121 ------------
>  meta/classes/image_types.bbclass                   |  16 +-
>  meta/classes/insane.bbclass                        |  29 +++
>  meta/classes/kernel-module-split.bbclass           |   2 +-
>  meta/classes/kernel.bbclass                        |  12 +-
>  meta/classes/rm_work.bbclass                       |  31 +--
>  meta/classes/rm_work_and_downloads.bbclass         |  33 ++++
>  meta/classes/rootfs-postcommands.bbclass           |  22 +++
>  meta/classes/systemd-boot.bbclass                  |   3 +
>  meta/lib/oe/rootfs.py                              |   9 +-
>  meta/lib/oeqa/runtime/logrotate.py                 |   1 +
>  meta/lib/oeqa/selftest/archiver.py                 |  22 +--
>  meta/lib/oeqa/selftest/base.py                     |   1 -
>  meta/lib/oeqa/selftest/bblayers.py                 |   1 -
>  meta/lib/oeqa/selftest/bbtests.py                  |   5 +-
>  meta/lib/oeqa/selftest/buildoptions.py             |   5 +-
>  meta/lib/oeqa/selftest/devtool.py                  |  65 ++++++-
>  meta/lib/oeqa/selftest/eSDK.py                     |   2 +-
>  meta/lib/oeqa/selftest/image_typedep.py            |  51 +++++
>  meta/lib/oeqa/selftest/runtime-test.py             |   2 +
>  meta/lib/oeqa/utils/metadata.py                    |  87 ++++++---
>  meta/lib/rootfspostcommands.py                     |  44 +++++
>  meta/recipes-bsp/grub/grub_git.bb                  |   4 +-
>  ...-C-syntax-errors-for-function-declaration.patch |  74 -------
>  .../gummiboot/gummiboot/fix-objcopy.patch          |  45 -----
>  meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  39 ----
>  .../iproute2/iproute2/iproute2-4.3.0-musl.patch    |  85 --------
>  .../iproute2/iproute2/iproute2-4.9.0-musl.patch    | 131 +++++++++++++
>  .../{iproute2_4.7.0.bb =3D> iproute2_4.9.0.bb}       |   7 +-
>  .../nfs-utils/nfs-utils/nfsserver                  |   2 +-
>  ...need_charset_alias-when-building-for-musl.patch |   0
>  ...0001-local.mk-fix-cross-compiling-problem.patch |  26 +++
>  ...e-report-processor-and-hardware-correctly.patch |   0
>  .../disable-ls-output-quoting.patch                |   0
>  .../fix-selinux-flask.patch                        |   0
>  .../man-decouple-manpages-from-build.patch         |   0
>  .../remove-usr-local-lib-from-m4.patch             |   0
>  .../{coreutils_8.25.bb =3D> coreutils_8.26.bb}       |   9 +-
>  .../{dbus-test_1.10.10.bb =3D> dbus-test_1.10.14.bb} |   4 +-
>  .../dbus/{dbus_1.10.10.bb =3D> dbus_1.10.14.bb}      |   4 +-
>  .../README_VirtualBox_Toaster.txt                  |  78 ++++++++
>  .../images/build-appliance-image_15.0.0.bb         |  18 +-
>  meta/recipes-core/musl/musl_git.bb                 |   4 +-
>  meta/recipes-devtools/apt/apt-package.inc          |  15 +-
>  ...oid-c-comments-in-c-code-fails-with-gcc-6.patch |  64 ------
>  .../recipes-devtools/flex/flex/CVE-2016-6354.patch |  59 ------
>  meta/recipes-devtools/flex/flex/crosscompile.patch | 214
> +++++++++++++++++++++
>  .../flex/flex/do_not_create_pdf_doc.patch          |  17 --
>  .../flex/{flex_2.6.0.bb =3D> flex_2.6.2.bb}          |  11 +-
>  meta/recipes-devtools/gcc/gcc-source.inc           |   2 +-
>  ...e-defined-bindir-and-mandir-as-installati.patch |  30 +++
>  .../opkg-utils/opkg-utils/tar_ignore_error.patch   |   2 +-
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  13 +-
>  ...reate-opkg.lock-in-run-instead-of-var-run.patch |   8 +-
>  .../opkg/opkg/status-conffile.patch                |  69 +++++++
>  .../opkg/{opkg_0.3.3.bb =3D> opkg_0.3.4.bb}          |   7 +-
>  .../python/python-3.5-manifest.inc                 |   2 +-
>  .../python/python3-pygobject_3.22.0.bb             |  10 +-
>  ...d-bootchart_230.bb =3D> systemd-bootchart_231.bb} |   4 +-
>  .../grep/{grep_2.26.bb =3D> grep_2.27.bb}            |   4 +-
>  meta/recipes-extended/sysklogd/files/klogd.service |  13 ++
>  .../sysklogd/files/syslogd.service                 |  14 ++
>  .../sysklogd/files/tmpfiles.sysklogd.conf          |   1 +
>  meta/recipes-extended/sysklogd/sysklogd.inc        |  21 +-
>  .../{sysstat_11.4.0.bb =3D> sysstat_11.5.3.bb}       |   4 +-
>  meta/recipes-graphics/drm/libdrm_2.4.74.bb         |   8 +-
>  meta/recipes-graphics/wayland/wayland_1.12.0.bb    |  11 +-
>  ...-ARM-Fix-add_buffer_phys_virt-align-issue.patch |  52 +++++
>  meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |   1 +
>  .../linux-firmware/linux-firmware_git.bb           | 186
> ++++++++----------
>  ...1c7962-that-brings-2-increase-of-build-ti.patch |  56 ------
>  meta/recipes-support/sqlite/sqlite3_3.15.2.bb      |  12 --
>  meta/recipes-support/sqlite/sqlite3_3.16.2.bb      |  11 ++
>  scripts/contrib/python/generate-manifest-3.5.py    |   2 +-
>  scripts/lib/wic/canned-wks/mkgummidisk.wks         |  11 --
>  scripts/lib/wic/canned-wks/mpc8315e-rdb.wks        |   6 -
>  scripts/lib/wic/imager/direct.py                   |   4 +-
>  .../lib/wic/plugins/source/isoimage-isohybrid.py   |  49 -----
>  scripts/lib/wic/utils/oe/misc.py                   |  32 ++-
>  scripts/oe-selftest                                |  14 +-
>  scripts/runqemu                                    |   9 +-
>  scripts/tiny/ksize.py                              |  17 +-
>  scripts/tiny/ksum.py                               | 168 +++++++++++++++=
+
>  107 files changed, 1683 insertions(+), 1007 deletions(-)
>  delete mode 100644 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py
>  create mode 100644 meta-yocto-bsp/wic/beaglebone.wks
>  create mode 100644 meta-yocto-bsp/wic/edgerouter.wks
>  create mode 100644 meta-yocto-bsp/wic/genericx86.wks
>  create mode 100644 meta-yocto-bsp/wic/mpc8315e-rdb.wks
>  delete mode 100644 meta/classes/gummiboot.bbclass
>  create mode 100644 meta/classes/rm_work_and_downloads.bbclass
>  create mode 100644 meta/lib/oeqa/selftest/image_typedep.py
>  create mode 100644 meta/lib/rootfspostcommands.py
>  delete mode 100644 meta/recipes-bsp/gummiboot/
> gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
>  delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patc=
h
>  delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot_git.bb
>  delete mode 100644 meta/recipes-connectivity/
> iproute2/iproute2/iproute2-4.3.0-musl.patch
>  create mode 100644 meta/recipes-connectivity/
> iproute2/iproute2/iproute2-4.9.0-musl.patch
>  rename meta/recipes-connectivity/iproute2/{iproute2_4.7.0.bb =3D>
> iproute2_4.9.0.bb} (61%)
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/0001-Unset-need_charset_alias-when-building-for-musl.patc=
h
> (100%)
>  create mode 100644 meta/recipes-core/coreutils/
> coreutils-8.26/0001-local.mk-fix-cross-compiling-problem.patch
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/0001-uname-report-processor-and-hardware-correctly.patch
> (100%)
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/disable-ls-output-quoting.patch (100%)
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/fix-selinux-flask.patch (100%)
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/man-decouple-manpages-from-build.patch (100%)
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/remove-usr-local-lib-from-m4.patch (100%)
>  rename meta/recipes-core/coreutils/{coreutils_8.25.bb =3D>
> coreutils_8.26.bb} (93%)
>  rename meta/recipes-core/dbus/{dbus-test_1.10.10.bb =3D>
> dbus-test_1.10.14.bb} (93%)
>  rename meta/recipes-core/dbus/{dbus_1.10.10.bb =3D> dbus_1.10.14.bb} (98=
%)
>  create mode 100644 meta/recipes-core/images/build-appliance-image/README=
_
> VirtualBox_Toaster.txt
>  delete mode 100644 meta/recipes-devtools/flex/
> flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>  create mode 100644 meta/recipes-devtools/flex/flex/crosscompile.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc=
.
> patch
>  rename meta/recipes-devtools/flex/{flex_2.6.0.bb =3D> flex_2.6.2.bb} (84=
%)
>  create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-
> Makefile-use-defined-bindir-and-mandir-as-installati.patch
>  create mode 100644 meta/recipes-devtools/opkg/opkg/status-conffile.patch
>  rename meta/recipes-devtools/opkg/{opkg_0.3.3.bb =3D> opkg_0.3.4.bb} (87=
%)
>  rename meta/recipes-devtools/systemd-bootchart/{systemd-bootchart_230.bb
> =3D> systemd-bootchart_231.bb} (92%)
>  rename meta/recipes-extended/grep/{grep_2.26.bb =3D> grep_2.27.bb} (88%)
>  create mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
>  create mode 100644 meta/recipes-extended/sysklogd/files/syslogd.service
>  create mode 100644 meta/recipes-extended/sysklogd/files/tmpfiles.
> sysklogd.conf
>  rename meta/recipes-extended/sysstat/{sysstat_11.4.0.bb =3D>
> sysstat_11.5.3.bb} (53%)
>  create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0010-kexec-ARM-
> Fix-add_buffer_phys_virt-align-issue.patch
>  delete mode 100644 meta/recipes-support/sqlite/
> files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch
>  delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.15.2.bb
>  create mode 100644 meta/recipes-support/sqlite/sqlite3_3.16.2.bb
>  delete mode 100644 scripts/lib/wic/canned-wks/mkgummidisk.wks
>  delete mode 100644 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks
>  create mode 100755 scripts/tiny/ksum.py
>
> Alejandro Hernandez (3):
>   gummiboot: Remove gummiboot tests
>   gummiboot: Remove old gummiboot recipe, related class and wks file
>   systemd-boot.bbclass: Fix SYSYTEMD_BOOT_CFG creation
>
> Alejandro del Castillo (2):
>   opkg: upgrade to v0.3.4
>   opkg-utils: bump SRCREV to 0.3.4 tag
>
> Alistair Francis (1):
>   runqemu: Allow the user to specity no kernel or rootFS
>
> Amarnath Valluri (2):
>   kernel: Modify kernel modules installation path.
>   linux-firmware: Modify firmware installation path
>
> Andre McCurdy (1):
>   wayland: minor recipe cleanup
>
> Andreas M=C3=BCller (1):
>   python3-pygobject: add PACKAGECONFIG for cairo - enabled by default
>
> Andr=C3=A9 Draszik (2):
>   lib/oe/rootfs: reliably handle alternative symlinks
>   opkg-utils: use D instead of OPKG_OFFLINE_ROOT in postrm
>
> Chen Qi (9):
>   systemd-bootchart: upgrade to 231
>   dbus/dbus-test: upgrade to 1.10.14
>   sysstat: upgrade to 11.5.3
>   grep: upgrade to 2.27
>   coreutils: upgrade to 8.26
>   selftest/eSDK.py: fix sstate dir not found error
>   selftest/bbtests.py: fix path assumption for LICENSE_DIRECTORY
>   selftest/buildoptions.py: fix path assumption for DEPLOY_DIR_SRC
>   scripts/oe-selftest: fix typo
>
> Christoph Settgast (1):
>   libdrm: enable etnaviv experimental support
>
> Derek Straka (1):
>   python-3.5-manifest: Add http module to the netclient package
>
> Ed Bartosh (11):
>   image_types.bbclass: look for wks files in <layer>/wic
>   beaglebone: add beaglebone.wks
>   wic: fix parsing of 'bitbake -e' output
>   canned-wks: remove mpc8315e-rdb.wks
>   direct.py: fix getting image name
>   wic: _exec_cmd: produce error if exit code is not 0
>   mpc8315e-rdb.conf: produce wic images for MPC8315
>   genericx86: add genericx86.wks
>   edgerouter: add edgerouter.wks
>   README.hardware: update MPC8315E-RDB section
>   mpc8315e-rdb: move wks file to wic/ directory
>
> Haiqing Bai (1):
>   kexec: ARM: fix align issue of add_buffer_phys_virt() for LPAE kernel
>
> Ioan-Adrian Ratiu (1):
>   wic/isoimage-isohybrid: remove do_stage_partition()
>
> Jose Perez Carranza (1):
>   runtime: Add cleanup for logrotate tests
>
> Juro Bystricky (1):
>   build-appliance-image: support for Toaster
>
> Khem Raj (2):
>   musl: Upgrade to 1.1.16+ on master
>   grub-git: Upgrade to tip of master and fix with glibc 2.25
>
> Leonardo Sandoval (3):
>   recipes-test: exclude recipes from world target
>   selftest: devtool: use distro agnostic recipes for devtool checks
>   selftest: runtime-test: skip image-install test for poky-tiny
>
> Linus Wallgren (1):
>   apt-package: Include maintenance scripts
>
> Mark Asselstine (1):
>   sysklogd: do more to properly work with systemd
>
> Markus Lehtonen (10):
>   oeqa.utils.metadata: re-organise host distro information
>   oeqa.utils.metadata: re-organise distro information
>   oeqa.utils.metadata: drop 'unknown' git data elements
>   oeqa.utils.metadata: fix retrieval of git branch and revision
>   oeqa.utils.metadata: rename 'revision' to 'commit'
>   oeqa.utils.metadata: add commit count information
>   oeqa.utils.metadata: have layer name as an attribute in xml
>   oeqa.utils.metadata: add bitbake revision information
>   oeqa.utils.metadata: allow storing any bitbake config variables
>   oeqa.utils.metadata: include BB_NUMBER_THREADS and PARALLEL_MAKE
>
> Maxin B. John (1):
>   sqlite3: upgrade to 3.16.2
>
> Ola x Nilsson (2):
>   externalsrc.bbclass: Add task buildclean
>   oe-selftest: devtool: Add test for externalsrc buildclean
>
> Patrick Ohly (8):
>   recipes: anonymous functions with priorities
>   build.py: add preceedtask() API
>   runqueue.py: alternative rm_work scheduler
>   gcc-source.inc: cleanly disable do_rm_work
>   rm_work_and_downloads.bbclass: more aggressively minimize disk usage
>   rm_work.bbclass: clean up sooner
>   rootfs-postcommands.bbclass: sort passwd entries
>   insane.bbclass: print license text as part of QA message
>
> Randy Witt (2):
>   image_typedep.py: Add a test that ensures conversion type deps get
>     added
>   image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types
>
> Ross Burton (9):
>   linux-firmware: remove alternatives for brcmfmac-stdio.bin
>   opkg-utils: set CLEANBROKEN as upstream Makefile doesn't have clean
>     target
>   flex: upgrade to 2.6.2
>   opkg: fix conffile errors in 'opkg status' calls
>   rootfs: don't put /usr/lib/ssl and /etc into debugfs
>   selftest/archiver: don't build an image for a basic test
>   grub_git: remove redundant inherits
>   selftest/bblayers: don't fetch a variable that is never used
>   selftest/base: don't fetch DISTRO variable in constructor
>
> Saul Wold (1):
>   nfs-utils: remove -f exports from nfsserver
>
> Tom Zanussi (1):
>   scripts: python3 fixes and new tool ksum
>
> Zheng Ruoqin (1):
>   iproute2 4.7->4.9
>
>  README.hardware                                    |  69 +++++++
>  bitbake/lib/bb/build.py                            |  16 ++
>  bitbake/lib/bb/data_smart.py                       |   3 +
>  bitbake/lib/bb/parse/ast.py                        |  19 +-
>  bitbake/lib/bb/runqueue.py                         | 107 +++++++++++
>  .../recipes-test/aspell/aspell_0.0.0.1.bb          |   2 +
>  .../recipes-test/devtool/devtool-test-localonly.bb |   1 +
>  .../recipes-test/devtool/devtool-test-patch-gz.bb  |   1 +
>  .../recipes-test/devtool/devtool-test-subdir.bb    |   2 +
>  .../devtool/devtool-upgrade-test1_1.5.3.bb         |   2 +
>  .../devtool-upgrade-test1_1.5.3.bb.upgraded        |   2 +
>  .../devtool/devtool-upgrade-test2_git.bb           |   2 +
>  .../devtool/devtool-upgrade-test2_git.bb.upgraded  |   2 +
>  .../recipetool/selftest-recipetool-appendfile.bb   |   2 +
>  meta-yocto-bsp/conf/machine/beaglebone.conf        |   2 +-
>  meta-yocto-bsp/conf/machine/edgerouter.conf        |   2 +-
>  .../conf/machine/include/genericx86-common.inc     |   2 +-
>  meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |   4 +
>  meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py      |  83 --------
>  meta-yocto-bsp/wic/beaglebone.wks                  |   6 +
>  meta-yocto-bsp/wic/edgerouter.wks                  |   4 +
>  meta-yocto-bsp/wic/genericx86.wks                  |   7 +
>  .../wic}/mpc8315e-rdb.wks                          |   6 +-
>  meta/classes/externalsrc.bbclass                   |  19 +-
>  meta/classes/gummiboot.bbclass                     | 121 ------------
>  meta/classes/image_types.bbclass                   |  16 +-
>  meta/classes/insane.bbclass                        |  29 +++
>  meta/classes/kernel-module-split.bbclass           |   2 +-
>  meta/classes/kernel.bbclass                        |  12 +-
>  meta/classes/rm_work.bbclass                       |  31 +--
>  meta/classes/rm_work_and_downloads.bbclass         |  33 ++++
>  meta/classes/rootfs-postcommands.bbclass           |  22 +++
>  meta/classes/systemd-boot.bbclass                  |   3 +
>  meta/lib/oe/rootfs.py                              |   9 +-
>  meta/lib/oeqa/runtime/logrotate.py                 |   1 +
>  meta/lib/oeqa/selftest/archiver.py                 |  22 +--
>  meta/lib/oeqa/selftest/base.py                     |   1 -
>  meta/lib/oeqa/selftest/bblayers.py                 |   1 -
>  meta/lib/oeqa/selftest/bbtests.py                  |   5 +-
>  meta/lib/oeqa/selftest/buildoptions.py             |   5 +-
>  meta/lib/oeqa/selftest/devtool.py                  |  65 ++++++-
>  meta/lib/oeqa/selftest/eSDK.py                     |   2 +-
>  meta/lib/oeqa/selftest/image_typedep.py            |  51 +++++
>  meta/lib/oeqa/selftest/runtime-test.py             |   2 +
>  meta/lib/oeqa/utils/metadata.py                    |  87 ++++++---
>  meta/lib/rootfspostcommands.py                     |  44 +++++
>  meta/recipes-bsp/grub/grub_git.bb                  |   4 +-
>  ...-C-syntax-errors-for-function-declaration.patch |  74 -------
>  .../gummiboot/gummiboot/fix-objcopy.patch          |  45 -----
>  meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  39 ----
>  ...-4.3.0-musl.patch =3D> iproute2-4.9.0-musl.patch} |  90 ++++++---
>  .../{iproute2_4.7.0.bb =3D> iproute2_4.9.0.bb}       |   7 +-
>  .../nfs-utils/nfs-utils/nfsserver                  |   2 +-
>  ...need_charset_alias-when-building-for-musl.patch |   0
>  ...0001-local.mk-fix-cross-compiling-problem.patch |  26 +++
>  ...e-report-processor-and-hardware-correctly.patch |   0
>  .../disable-ls-output-quoting.patch                |   0
>  .../fix-selinux-flask.patch                        |   0
>  .../man-decouple-manpages-from-build.patch         |   0
>  .../remove-usr-local-lib-from-m4.patch             |   0
>  .../{coreutils_8.25.bb =3D> coreutils_8.26.bb}       |   9 +-
>  .../{dbus-test_1.10.10.bb =3D> dbus-test_1.10.14.bb} |   4 +-
>  .../dbus/{dbus_1.10.10.bb =3D> dbus_1.10.14.bb}      |   4 +-
>  .../README_VirtualBox_Toaster.txt                  |  78 ++++++++
>  .../images/build-appliance-image_15.0.0.bb         |  18 +-
>  meta/recipes-core/musl/musl_git.bb                 |   4 +-
>  meta/recipes-devtools/apt/apt-package.inc          |  15 +-
>  ...oid-c-comments-in-c-code-fails-with-gcc-6.patch |  64 ------
>  .../recipes-devtools/flex/flex/CVE-2016-6354.patch |  59 ------
>  meta/recipes-devtools/flex/flex/crosscompile.patch | 214
> +++++++++++++++++++++
>  .../flex/flex/do_not_create_pdf_doc.patch          |  17 --
>  .../flex/{flex_2.6.0.bb =3D> flex_2.6.2.bb}          |  11 +-
>  meta/recipes-devtools/gcc/gcc-source.inc           |   2 +-
>  ...e-defined-bindir-and-mandir-as-installati.patch |  30 +++
>  .../opkg-utils/opkg-utils/tar_ignore_error.patch   |   2 +-
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  13 +-
>  ...reate-opkg.lock-in-run-instead-of-var-run.patch |   8 +-
>  .../opkg/opkg/status-conffile.patch                |  69 +++++++
>  .../opkg/{opkg_0.3.3.bb =3D> opkg_0.3.4.bb}          |   7 +-
>  .../python/python-3.5-manifest.inc                 |   2 +-
>  .../python/python3-pygobject_3.22.0.bb             |  10 +-
>  ...d-bootchart_230.bb =3D> systemd-bootchart_231.bb} |   4 +-
>  .../grep/{grep_2.26.bb =3D> grep_2.27.bb}            |   4 +-
>  meta/recipes-extended/sysklogd/files/klogd.service |  13 ++
>  .../sysklogd/files/syslogd.service                 |  14 ++
>  .../sysklogd/files/tmpfiles.sysklogd.conf          |   1 +
>  meta/recipes-extended/sysklogd/sysklogd.inc        |  21 +-
>  .../{sysstat_11.4.0.bb =3D> sysstat_11.5.3.bb}       |   4 +-
>  meta/recipes-graphics/drm/libdrm_2.4.74.bb         |   8 +-
>  meta/recipes-graphics/wayland/wayland_1.12.0.bb    |  11 +-
>  ...-ARM-Fix-add_buffer_phys_virt-align-issue.patch |  52 +++++
>  meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |   1 +
>  .../linux-firmware/linux-firmware_git.bb           | 186
> ++++++++----------
>  ...1c7962-that-brings-2-increase-of-build-ti.patch |  56 ------
>  meta/recipes-support/sqlite/sqlite3_3.15.2.bb      |  12 --
>  meta/recipes-support/sqlite/sqlite3_3.16.2.bb      |  11 ++
>  scripts/contrib/python/generate-manifest-3.5.py    |   2 +-
>  scripts/lib/wic/canned-wks/mkgummidisk.wks         |  11 --
>  scripts/lib/wic/imager/direct.py                   |   4 +-
>  .../lib/wic/plugins/source/isoimage-isohybrid.py   |  49 -----
>  scripts/lib/wic/utils/oe/misc.py                   |  32 ++-
>  scripts/oe-selftest                                |  14 +-
>  scripts/runqemu                                    |   9 +-
>  scripts/tiny/ksize.py                              |  17 +-
>  scripts/tiny/ksum.py                               | 168 +++++++++++++++=
+
>  105 files changed, 1618 insertions(+), 942 deletions(-)
>  delete mode 100644 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py
>  create mode 100644 meta-yocto-bsp/wic/beaglebone.wks
>  create mode 100644 meta-yocto-bsp/wic/edgerouter.wks
>  create mode 100644 meta-yocto-bsp/wic/genericx86.wks
>  rename {scripts/lib/wic/canned-wks =3D> meta-yocto-bsp/wic}/mpc8315e-rdb=
.wks
> (45%)
>  delete mode 100644 meta/classes/gummiboot.bbclass
>  create mode 100644 meta/classes/rm_work_and_downloads.bbclass
>  create mode 100644 meta/lib/oeqa/selftest/image_typedep.py
>  create mode 100644 meta/lib/rootfspostcommands.py
>  delete mode 100644 meta/recipes-bsp/gummiboot/
> gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
>  delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patc=
h
>  delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot_git.bb
>  rename meta/recipes-connectivity/iproute2/iproute2/{iproute2-4.3.0-musl.=
patch
> =3D> iproute2-4.9.0-musl.patch} (42%)
>  rename meta/recipes-connectivity/iproute2/{iproute2_4.7.0.bb =3D>
> iproute2_4.9.0.bb} (61%)
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/0001-Unset-need_charset_alias-when-building-for-musl.patc=
h
> (100%)
>  create mode 100644 meta/recipes-core/coreutils/
> coreutils-8.26/0001-local.mk-fix-cross-compiling-problem.patch
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/0001-uname-report-processor-and-hardware-correctly.patch
> (100%)
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/disable-ls-output-quoting.patch (100%)
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/fix-selinux-flask.patch (100%)
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/man-decouple-manpages-from-build.patch (100%)
>  rename meta/recipes-core/coreutils/{coreutils-8.25 =3D>
> coreutils-8.26}/remove-usr-local-lib-from-m4.patch (100%)
>  rename meta/recipes-core/coreutils/{coreutils_8.25.bb =3D>
> coreutils_8.26.bb} (93%)
>  rename meta/recipes-core/dbus/{dbus-test_1.10.10.bb =3D>
> dbus-test_1.10.14.bb} (93%)
>  rename meta/recipes-core/dbus/{dbus_1.10.10.bb =3D> dbus_1.10.14.bb} (98=
%)
>  create mode 100644 meta/recipes-core/images/build-appliance-image/README=
_
> VirtualBox_Toaster.txt
>  delete mode 100644 meta/recipes-devtools/flex/
> flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>  create mode 100644 meta/recipes-devtools/flex/flex/crosscompile.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc=
.
> patch
>  rename meta/recipes-devtools/flex/{flex_2.6.0.bb =3D> flex_2.6.2.bb} (84=
%)
>  create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-
> Makefile-use-defined-bindir-and-mandir-as-installati.patch
>  create mode 100644 meta/recipes-devtools/opkg/opkg/status-conffile.patch
>  rename meta/recipes-devtools/opkg/{opkg_0.3.3.bb =3D> opkg_0.3.4.bb} (87=
%)
>  rename meta/recipes-devtools/systemd-bootchart/{systemd-bootchart_230.bb
> =3D> systemd-bootchart_231.bb} (92%)
>  rename meta/recipes-extended/grep/{grep_2.26.bb =3D> grep_2.27.bb} (88%)
>  create mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
>  create mode 100644 meta/recipes-extended/sysklogd/files/syslogd.service
>  create mode 100644 meta/recipes-extended/sysklogd/files/tmpfiles.
> sysklogd.conf
>  rename meta/recipes-extended/sysstat/{sysstat_11.4.0.bb =3D>
> sysstat_11.5.3.bb} (53%)
>  create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0010-kexec-ARM-
> Fix-add_buffer_phys_virt-align-issue.patch
>  delete mode 100644 meta/recipes-support/sqlite/
> files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch
>  delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.15.2.bb
>  create mode 100644 meta/recipes-support/sqlite/sqlite3_3.16.2.bb
>  delete mode 100644 scripts/lib/wic/canned-wks/mkgummidisk.wks
>  create mode 100755 scripts/tiny/ksum.py
>
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05be6829d0970545f9f6e1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jan 13, 2017 at 8:00 AM, Ross Burton <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
Another consolidated pull.=C2=A0 Last run on the AB was mostly green:<br>
- byacc on beaglebone-lsb failed (upgrade removed)<br>
- checkuri failed (transient, works now)<br>
- selftest failed (fixed in branch, tests work locally now)<br></blockquote=
><div><br><br></div><div>Should I re-send my kernel queue ? It is now about=
 13 patches long, and I&#39;m stacking<br>a few more on every couple of day=
s.<br><br></div><div>I assume there are still some outstanding issues with =
the 4.9 kernel, or more specifically<br></div><div>the 4.9 kernel headers ?=
<br><br></div><div>If there&#39;s a pointer to the list of issues, that wou=
ld be great, so I can help prod things <br></div><div>along (assuming I can=
 sort out the build issues .. c libraries give me headaches ;)<br><br></div=
><div>Cheers,<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
<br>
Ross<br>
<br>
The following changes since commit 29423274b1ff04e779f00aa6aae7db<wbr>aa7ce=
89226:<br>
<br>
=C2=A0 bitbake: gitsm.py: Add force flag to git checkout command in update_=
submodules (2017-01-12 17:48:12 +0000)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 ssh://<a href=3D"http://git@git.yoctoproject.org/poky-contrib" rel=
=3D"noreferrer" target=3D"_blank">git@git.yoctoproject.<wbr>org/poky-contri=
b</a> ross/mut<br>
<br>
for you to fetch changes up to b1f6b2b8c185b446be83b030e6f01b<wbr>2c390f571=
6:<br>
<br>
=C2=A0 mpc8315e-rdb: move wks file to wic/ directory (2017-01-13 12:56:42 +=
0000)<br>
<br>
------------------------------<wbr>------------------------------<wbr>----<=
br>
Alejandro Hernandez (3):<br>
=C2=A0 =C2=A0 =C2=A0 gummiboot: Remove gummiboot tests<br>
=C2=A0 =C2=A0 =C2=A0 gummiboot: Remove old gummiboot recipe, related class =
and wks file<br>
=C2=A0 =C2=A0 =C2=A0 systemd-boot.bbclass: Fix SYSYTEMD_BOOT_CFG creation<b=
r>
<br>
Alejandro del Castillo (2):<br>
=C2=A0 =C2=A0 =C2=A0 opkg: upgrade to v0.3.4<br>
=C2=A0 =C2=A0 =C2=A0 opkg-utils: bump SRCREV to 0.3.4 tag<br>
<br>
Alistair Francis (1):<br>
=C2=A0 =C2=A0 =C2=A0 runqemu: Allow the user to specity no kernel or rootFS=
<br>
<br>
Amarnath Valluri (2):<br>
=C2=A0 =C2=A0 =C2=A0 kernel: Modify kernel modules installation path.<br>
=C2=A0 =C2=A0 =C2=A0 linux-firmware: Modify firmware installation path<br>
<br>
Andre McCurdy (1):<br>
=C2=A0 =C2=A0 =C2=A0 wayland: minor recipe cleanup<br>
<br>
Andreas M=C3=BCller (1):<br>
=C2=A0 =C2=A0 =C2=A0 python3-pygobject: add PACKAGECONFIG for cairo - enabl=
ed by default<br>
<br>
Andr=C3=A9 Draszik (2):<br>
=C2=A0 =C2=A0 =C2=A0 lib/oe/rootfs: reliably handle alternative symlinks<br=
>
=C2=A0 =C2=A0 =C2=A0 opkg-utils: use D instead of OPKG_OFFLINE_ROOT in post=
rm<br>
<br>
Chen Qi (9):<br>
=C2=A0 =C2=A0 =C2=A0 systemd-bootchart: upgrade to 231<br>
=C2=A0 =C2=A0 =C2=A0 dbus/dbus-test: upgrade to 1.10.14<br>
=C2=A0 =C2=A0 =C2=A0 sysstat: upgrade to 11.5.3<br>
=C2=A0 =C2=A0 =C2=A0 grep: upgrade to 2.27<br>
=C2=A0 =C2=A0 =C2=A0 coreutils: upgrade to 8.26<br>
=C2=A0 =C2=A0 =C2=A0 selftest/eSDK.py: fix sstate dir not found error<br>
=C2=A0 =C2=A0 =C2=A0 selftest/bbtests.py: fix path assumption for LICENSE_D=
IRECTORY<br>
=C2=A0 =C2=A0 =C2=A0 selftest/buildoptions.py: fix path assumption for DEPL=
OY_DIR_SRC<br>
=C2=A0 =C2=A0 =C2=A0 scripts/oe-selftest: fix typo<br>
<br>
Christoph Settgast (1):<br>
=C2=A0 =C2=A0 =C2=A0 libdrm: enable etnaviv experimental support<br>
<br>
Derek Straka (1):<br>
=C2=A0 =C2=A0 =C2=A0 python-3.5-manifest: Add http module to the netclient =
package<br>
<br>
Ed Bartosh (11):<br>
=C2=A0 =C2=A0 =C2=A0 image_types.bbclass: look for wks files in &lt;layer&g=
t;/wic<br>
=C2=A0 =C2=A0 =C2=A0 beaglebone: add beaglebone.wks<br>
=C2=A0 =C2=A0 =C2=A0 wic: fix parsing of &#39;bitbake -e&#39; output<br>
=C2=A0 =C2=A0 =C2=A0 canned-wks: remove mpc8315e-rdb.wks<br>
=C2=A0 =C2=A0 =C2=A0 direct.py: fix getting image name<br>
=C2=A0 =C2=A0 =C2=A0 wic: _exec_cmd: produce error if exit code is not 0<br=
>
=C2=A0 =C2=A0 =C2=A0 mpc8315e-rdb.conf: produce wic images for MPC8315<br>
=C2=A0 =C2=A0 =C2=A0 genericx86: add genericx86.wks<br>
=C2=A0 =C2=A0 =C2=A0 edgerouter: add edgerouter.wks<br>
=C2=A0 =C2=A0 =C2=A0 README.hardware: update MPC8315E-RDB section<br>
=C2=A0 =C2=A0 =C2=A0 mpc8315e-rdb: move wks file to wic/ directory<br>
<br>
Haiqing Bai (1):<br>
=C2=A0 =C2=A0 =C2=A0 kexec: ARM: fix align issue of add_buffer_phys_virt() =
for LPAE kernel<br>
<br>
Ioan-Adrian Ratiu (1):<br>
=C2=A0 =C2=A0 =C2=A0 wic/isoimage-isohybrid: remove do_stage_partition()<br=
>
<br>
Jose Perez Carranza (1):<br>
=C2=A0 =C2=A0 =C2=A0 runtime: Add cleanup for logrotate tests<br>
<br>
Juro Bystricky (1):<br>
=C2=A0 =C2=A0 =C2=A0 build-appliance-image: support for Toaster<br>
<br>
Khem Raj (2):<br>
=C2=A0 =C2=A0 =C2=A0 musl: Upgrade to 1.1.16+ on master<br>
=C2=A0 =C2=A0 =C2=A0 grub-git: Upgrade to tip of master and fix with glibc =
2.25<br>
<br>
Leonardo Sandoval (3):<br>
=C2=A0 =C2=A0 =C2=A0 recipes-test: exclude recipes from world target<br>
=C2=A0 =C2=A0 =C2=A0 selftest: devtool: use distro agnostic recipes for dev=
tool checks<br>
=C2=A0 =C2=A0 =C2=A0 selftest: runtime-test: skip image-install test for po=
ky-tiny<br>
<br>
Linus Wallgren (1):<br>
=C2=A0 =C2=A0 =C2=A0 apt-package: Include maintenance scripts<br>
<br>
Mark Asselstine (1):<br>
=C2=A0 =C2=A0 =C2=A0 sysklogd: do more to properly work with systemd<br>
<br>
Markus Lehtonen (10):<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: re-organise host distro informati=
on<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: re-organise distro information<br=
>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: drop &#39;unknown&#39; git data e=
lements<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: fix retrieval of git branch and r=
evision<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: rename &#39;revision&#39; to &#39=
;commit&#39;<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: add commit count information<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: have layer name as an attribute i=
n xml<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: add bitbake revision information<=
br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: allow storing any bitbake config =
variables<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: include BB_NUMBER_THREADS and PAR=
ALLEL_MAKE<br>
<br>
Maxin B. John (1):<br>
=C2=A0 =C2=A0 =C2=A0 sqlite3: upgrade to 3.16.2<br>
<br>
Ola x Nilsson (2):<br>
=C2=A0 =C2=A0 =C2=A0 externalsrc.bbclass: Add task buildclean<br>
=C2=A0 =C2=A0 =C2=A0 oe-selftest: devtool: Add test for externalsrc buildcl=
ean<br>
<br>
Patrick Ohly (8):<br>
=C2=A0 =C2=A0 =C2=A0 recipes: anonymous functions with priorities<br>
=C2=A0 =C2=A0 =C2=A0 build.py: add preceedtask() API<br>
=C2=A0 =C2=A0 =C2=A0 runqueue.py: alternative rm_work scheduler<br>
=C2=A0 =C2=A0 =C2=A0 gcc-source.inc: cleanly disable do_rm_work<br>
=C2=A0 =C2=A0 =C2=A0 rm_work_and_downloads.bbclass: more aggressively minim=
ize disk usage<br>
=C2=A0 =C2=A0 =C2=A0 rm_work.bbclass: clean up sooner<br>
=C2=A0 =C2=A0 =C2=A0 rootfs-postcommands.bbclass: sort passwd entries<br>
=C2=A0 =C2=A0 =C2=A0 insane.bbclass: print license text as part of QA messa=
ge<br>
<br>
Randy Witt (2):<br>
=C2=A0 =C2=A0 =C2=A0 image_typedep.py: Add a test that ensures conversion t=
ype deps get added<br>
=C2=A0 =C2=A0 =C2=A0 image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for =
conversion types<br>
<br>
Ross Burton (9):<br>
=C2=A0 =C2=A0 =C2=A0 linux-firmware: remove alternatives for brcmfmac-stdio=
.bin<br>
=C2=A0 =C2=A0 =C2=A0 opkg-utils: set CLEANBROKEN as upstream Makefile doesn=
&#39;t have clean target<br>
=C2=A0 =C2=A0 =C2=A0 flex: upgrade to 2.6.2<br>
=C2=A0 =C2=A0 =C2=A0 opkg: fix conffile errors in &#39;opkg status&#39; cal=
ls<br>
=C2=A0 =C2=A0 =C2=A0 rootfs: don&#39;t put /usr/lib/ssl and /etc into debug=
fs<br>
=C2=A0 =C2=A0 =C2=A0 selftest/archiver: don&#39;t build an image for a basi=
c test<br>
=C2=A0 =C2=A0 =C2=A0 grub_git: remove redundant inherits<br>
=C2=A0 =C2=A0 =C2=A0 selftest/bblayers: don&#39;t fetch a variable that is =
never used<br>
=C2=A0 =C2=A0 =C2=A0 selftest/base: don&#39;t fetch DISTRO variable in cons=
tructor<br>
<br>
Saul Wold (1):<br>
=C2=A0 =C2=A0 =C2=A0 nfs-utils: remove -f exports from nfsserver<br>
<br>
Tom Zanussi (1):<br>
=C2=A0 =C2=A0 =C2=A0 scripts: python3 fixes and new tool ksum<br>
<br>
Zheng Ruoqin (1):<br>
=C2=A0 =C2=A0 =C2=A0 iproute2 4.7-&gt;4.9<br>
<br>
=C2=A0README.hardware=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 69 +++++++<br>
=C2=A0bitbake/lib/bb/build.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 ++<br>
=C2=A0bitbake/lib/bb/data_smart.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0bitbake/lib/bb/parse/ast.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +-<br>
=C2=A0bitbake/lib/bb/runqueue.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 107 +++++++++++<br>
=C2=A0.../recipes-test/aspell/<a href=3D"http://aspell_0.0.0.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">aspell<wbr>_0.0.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-test/devtool/<a href=3D"http://devtool-test-localonly.bb"=
 rel=3D"noreferrer" target=3D"_blank">devto<wbr>ol-test-localonly.bb</a> |=
=C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-test/devtool/<a href=3D"http://devtool-test-patch-gz.bb" =
rel=3D"noreferrer" target=3D"_blank">devto<wbr>ol-test-patch-gz.bb</a>=C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-test/devtool/<a href=3D"http://devtool-test-subdir.bb" re=
l=3D"noreferrer" target=3D"_blank">devto<wbr>ol-test-subdir.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../devtool/<a href=3D"http://devtool-upgrade-test1_1.5.3.bb" rel=3D"=
noreferrer" target=3D"_blank">devtool-upgrade-<wbr>test1_1.5.3.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../devtool-upgrade-test1_1.5.<wbr>3.bb.upgraded=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../devtool/<a href=3D"http://devtool-upgrade-test2_git.bb" rel=3D"no=
referrer" target=3D"_blank">devtool-upgrade-<wbr>test2_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../devtool/devtool-upgrade-<wbr>test2_git.bb.upgraded=C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0.../recipetool/<a href=3D"http://selftest-recipetool-appendfile.bb" r=
el=3D"noreferrer" target=3D"_blank">selftest-<wbr>recipetool-appendfile.bb<=
/a>=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta-yocto-bsp/conf/machine/<wbr>beaglebone.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta-yocto-bsp/conf/machine/<wbr>edgerouter.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../conf/machine/include/<wbr>genericx86-common.inc=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta-yocto-bsp/conf/machine/<wbr>mpc8315e-rdb.conf=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0meta-yocto-bsp/lib/oeqa/<wbr>selftest/gummiboot.py=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 83 --------<br>
=C2=A0meta-yocto-bsp/wic/beaglebone.<wbr>wks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0meta-yocto-bsp/wic/edgerouter.<wbr>wks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0meta-yocto-bsp/wic/genericx86.<wbr>wks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0meta-yocto-bsp/wic/mpc8315e-<wbr>rdb.wks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0meta/classes/externalsrc.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 19 +-<br>
=C2=A0meta/classes/gummiboot.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 121 ------------<br>
=C2=A0meta/classes/image_types.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 +-<br>
=C2=A0meta/classes/insane.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 29 +++<br>
=C2=A0meta/classes/kernel-module-<wbr>split.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
=C2=A0meta/classes/rm_work.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 31 +--<br>
=C2=A0meta/classes/rm_work_and_<wbr>downloads.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 33 ++++<br>
=C2=A0meta/classes/rootfs-<wbr>postcommands.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 22 +++<br>
=C2=A0meta/classes/systemd-boot.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0meta/lib/oe/rootfs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-=
<br>
=C2=A0meta/lib/oeqa/runtime/<wbr>logrotate.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>archiver.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 +--<br>
=C2=A0meta/lib/oeqa/selftest/base.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>bblayers.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>bbtests.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>buildoptions.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>devtool.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 65 ++++++-<br>
=C2=A0meta/lib/oeqa/selftest/eSDK.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/lib/oeqa/selftest/image_<wbr>typedep.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 51 +++++<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>runtime-test.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta/lib/oeqa/utils/metadata.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 87 ++++++---<br>
=C2=A0meta/lib/rootfspostcommands.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 44 +++++<br>
=C2=A0meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" rel=3D"noreferre=
r" target=3D"_blank">grub_<wbr>git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0...-C-syntax-errors-for-<wbr>function-declaration.patch |=C2=A0 74 --=
-----<br>
=C2=A0.../gummiboot/gummiboot/fix-<wbr>objcopy.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 45 -----<br>
=C2=A0meta/recipes-bsp/gummiboot/<a href=3D"http://gummiboot_git.bb" rel=3D=
"noreferrer" target=3D"_blank">gum<wbr>miboot_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 39 ----<br>
=C2=A0.../iproute2/iproute2/<wbr>iproute2-4.3.0-musl.patch=C2=A0 =C2=A0 |=
=C2=A0 85 --------<br>
=C2=A0.../iproute2/iproute2/<wbr>iproute2-4.9.0-musl.patch=C2=A0 =C2=A0 | 1=
31 +++++++++++++<br>
=C2=A0.../{<a href=3D"http://iproute2_4.7.0.bb" rel=3D"noreferrer" target=
=3D"_blank">iproute2_4.7.0.bb</a> =3D&gt; <a href=3D"http://iproute2_4.9.0.=
bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.9.0.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0.../nfs-utils/nfs-utils/<wbr>nfsserver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0...need_charset_alias-when-<wbr>building-for-musl.patch |=C2=A0 =C2=
=A00<br>
=C2=A0...0001-local.mk-fix-cross-<wbr>compiling-problem.patch |=C2=A0 26 ++=
+<br>
=C2=A0...e-report-processor-and-<wbr>hardware-correctly.patch |=C2=A0 =C2=
=A00<br>
=C2=A0.../disable-ls-output-quoting.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../fix-selinux-flask.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../man-decouple-manpages-<wbr>from-build.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../remove-usr-local-lib-from-<wbr>m4.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../{<a href=3D"http://coreutils_8.25.bb" rel=3D"noreferrer" target=
=3D"_blank">coreutils_8.25.bb</a> =3D&gt; <a href=3D"http://coreutils_8.26.=
bb" rel=3D"noreferrer" target=3D"_blank">coreutils_8.26.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0.../{<a href=3D"http://dbus-test_1.10.10.bb" rel=3D"noreferrer" targe=
t=3D"_blank">dbus-test_1.10.10.bb</a> =3D&gt; <a href=3D"http://dbus-test_1=
.10.14.bb" rel=3D"noreferrer" target=3D"_blank">dbus-test_1.10.14.bb</a>} |=
=C2=A0 =C2=A04 +-<br>
=C2=A0.../dbus/{<a href=3D"http://dbus_1.10.10.bb" rel=3D"noreferrer" targe=
t=3D"_blank">dbus_1.10.10.bb</a> =3D&gt; <a href=3D"http://dbus_1.10.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">dbus_1.10.14.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../README_VirtualBox_Toaster.<wbr>txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 78 ++++++++<br>
=C2=A0.../images/<a href=3D"http://build-appliance-image_15.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">build-appliance-<wbr>image_15.0.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 +-<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_<wbr>git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-devtools/apt/apt-<wbr>package.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 15 +-<br>
=C2=A0...oid-c-comments-in-c-code-<wbr>fails-with-gcc-6.patch |=C2=A0 64 --=
----<br>
=C2=A0.../recipes-devtools/flex/<wbr>flex/CVE-2016-6354.patch |=C2=A0 59 --=
----<br>
=C2=A0meta/recipes-devtools/flex/<wbr>flex/crosscompile.patch | 214 +++++++=
++++++++++++++<br>
=C2=A0.../flex/flex/do_not_create_<wbr>pdf_doc.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 17 --<br>
=C2=A0.../flex/{<a href=3D"http://flex_2.6.0.bb" rel=3D"noreferrer" target=
=3D"_blank">flex_2.6.0.bb</a> =3D&gt; <a href=3D"http://flex_2.6.2.bb" rel=
=3D"noreferrer" target=3D"_blank">flex_2.6.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 11 +-<br>
=C2=A0meta/recipes-devtools/gcc/gcc-<wbr>source.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0...e-defined-bindir-and-<wbr>mandir-as-installati.patch |=C2=A0 30 ++=
+<br>
=C2=A0.../opkg-utils/opkg-utils/tar_<wbr>ignore_error.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-utils_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a> |=C2=A0 13=
 +-<br>
=C2=A0...reate-opkg.lock-in-run-<wbr>instead-of-var-run.patch |=C2=A0 =C2=
=A08 +-<br>
=C2=A0.../opkg/opkg/status-conffile.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 69 +++++++<br>
=C2=A0.../opkg/{<a href=3D"http://opkg_0.3.3.bb" rel=3D"noreferrer" target=
=3D"_blank">opkg_0.3.3.bb</a> =3D&gt; <a href=3D"http://opkg_0.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.3.4.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0.../python/python-3.5-<wbr>manifest.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-pygobject_3.22.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-pygobject_<wbr>3.22.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0...<a href=3D"http://d-bootchart_230.bb" rel=3D"noreferrer" target=3D=
"_blank">d-bootchart_230.bb</a> =3D&gt; <a href=3D"http://systemd-bootchart=
_231.bb" rel=3D"noreferrer" target=3D"_blank">systemd-bootchart_231.bb</a>}=
 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../grep/{<a href=3D"http://grep_2.26.bb" rel=3D"noreferrer" target=
=3D"_blank">grep_2.26.bb</a> =3D&gt; <a href=3D"http://grep_2.27.bb" rel=3D=
"noreferrer" target=3D"_blank">grep_2.27.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-extended/<wbr>sysklogd/files/klogd.service |=C2=A0 13 ++=
<br>
=C2=A0.../sysklogd/files/syslogd.<wbr>service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 ++<br>
=C2=A0.../sysklogd/files/tmpfiles.<wbr>sysklogd.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-extended/<wbr>sysklogd/sysklogd.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 21 +-<br>
=C2=A0.../{<a href=3D"http://sysstat_11.4.0.bb" rel=3D"noreferrer" target=
=3D"_blank">sysstat_11.4.0.bb</a> =3D&gt; <a href=3D"http://sysstat_11.5.3.=
bb" rel=3D"noreferrer" target=3D"_blank">sysstat_11.5.3.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.74.bb" rel=3D"=
noreferrer" target=3D"_blank">libd<wbr>rm_2.4.74.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.12.0.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>wayland_1.12.0.bb</a>=C2=A0 =C2=A0 =
|=C2=A0 11 +-<br>
=C2=A0...-ARM-Fix-add_buffer_phys_<wbr>virt-align-issue.patch |=C2=A0 52 ++=
+++<br>
=C2=A0meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.14.bb" re=
l=3D"noreferrer" target=3D"_blank">kexe<wbr>c-tools_2.0.14.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../linux-firmware/<a href=3D"http://linux-firmware_git.bb" rel=3D"no=
referrer" target=3D"_blank">linux-<wbr>firmware_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 186 ++++++++----------<br>
=C2=A0...1c7962-that-brings-2-<wbr>increase-of-build-ti.patch |=C2=A0 56 --=
----<br>
=C2=A0meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.15.2.bb" rel=
=3D"noreferrer" target=3D"_blank">sq<wbr>lite3_3.15.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 12 --<br>
=C2=A0meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.16.2.bb" rel=
=3D"noreferrer" target=3D"_blank">sq<wbr>lite3_3.16.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 11 ++<br>
=C2=A0scripts/contrib/python/<a href=3D"http://generate-manifest-3.5.py" re=
l=3D"noreferrer" target=3D"_blank">generat<wbr>e-manifest-3.5.py</a>=C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/lib/wic/canned-wks/<wbr>mkgummidisk.wks=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 11 --<br>
=C2=A0scripts/lib/wic/canned-wks/<wbr>mpc8315e-rdb.wks=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A06 -<br>
=C2=A0scripts/lib/wic/imager/direct.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../lib/wic/plugins/source/<wbr>isoimage-isohybrid.py=C2=A0 =C2=A0|=
=C2=A0 49 -----<br>
=C2=A0scripts/lib/wic/utils/oe/misc.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 32 ++-<br>
=C2=A0scripts/oe-selftest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +=
-<br>
=C2=A0scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A09 +-<br>
=C2=A0scripts/tiny/ksize.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 +-<br>
=C2=A0scripts/tiny/ksum.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 168 +++++++=
+++++++++<br>
=C2=A0107 files changed, 1683 insertions(+), 1007 deletions(-)<br>
=C2=A0delete mode 100644 meta-yocto-bsp/lib/oeqa/<wbr>selftest/gummiboot.py=
<br>
=C2=A0create mode 100644 meta-yocto-bsp/wic/beaglebone.<wbr>wks<br>
=C2=A0create mode 100644 meta-yocto-bsp/wic/edgerouter.<wbr>wks<br>
=C2=A0create mode 100644 meta-yocto-bsp/wic/genericx86.<wbr>wks<br>
=C2=A0create mode 100644 meta-yocto-bsp/wic/mpc8315e-<wbr>rdb.wks<br>
=C2=A0delete mode 100644 meta/classes/gummiboot.bbclass<br>
=C2=A0create mode 100644 meta/classes/rm_work_and_<wbr>downloads.bbclass<br=
>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/image_<wbr>typedep.py<br>
=C2=A0create mode 100644 meta/lib/rootfspostcommands.py<br>
=C2=A0delete mode 100644 meta/recipes-bsp/gummiboot/<wbr>gummiboot/0001-con=
sole-Fix-C-<wbr>syntax-errors-for-function-<wbr>declaration.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/gummiboot/<wbr>gummiboot/fix-objc=
opy.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/gummiboot/<a href=3D"http://gummi=
boot_git.bb" rel=3D"noreferrer" target=3D"_blank">gum<wbr>miboot_git.bb</a>=
<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/<wbr>iproute2/iproute2/i=
proute2-4.<wbr>3.0-musl.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/<wbr>iproute2/iproute2/i=
proute2-4.<wbr>9.0-musl.patch<br>
=C2=A0rename meta/recipes-connectivity/<wbr>iproute2/{<a href=3D"http://ipr=
oute2_4.7.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.7.0.bb</a> =
=3D&gt; <a href=3D"http://iproute2_4.9.0.bb" rel=3D"noreferrer" target=3D"_=
blank">iproute2_4.9.0.bb</a>} (61%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/0001-Unset-<wbr>need_charset_alias-when-<wbr>building-for-musl.p=
atch (100%)<br>
=C2=A0create mode 100644 meta/recipes-core/coreutils/<wbr>coreutils-8.26/00=
01-local.mk-<wbr>fix-cross-compiling-problem.<wbr>patch<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/0001-uname-<wbr>report-processor-and-hardware-<wbr>correctly.pat=
ch (100%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/disable-ls-<wbr>output-quoting.patch (100%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/fix-selinux-<wbr>flask.patch (100%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/man-decouple-<wbr>manpages-from-build.patch (100%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/remove-usr-<wbr>local-lib-from-m4.patch (100%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<a href=3D"http://coreutils_8.25.=
bb" rel=3D"noreferrer" target=3D"_blank">c<wbr>oreutils_8.25.bb</a> =3D&gt;=
 <a href=3D"http://coreutils_8.26.bb" rel=3D"noreferrer" target=3D"_blank">=
coreutils_8.26.bb</a>} (93%)<br>
=C2=A0rename meta/recipes-core/dbus/{<a href=3D"http://dbus-test_1.10.10.bb=
" rel=3D"noreferrer" target=3D"_blank">dbus-<wbr>test_1.10.10.bb</a> =3D&gt=
; <a href=3D"http://dbus-test_1.10.14.bb" rel=3D"noreferrer" target=3D"_bla=
nk">dbus-test_1.10.14.bb</a>} (93%)<br>
=C2=A0rename meta/recipes-core/dbus/{<a href=3D"http://dbus_1.10.10.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus_<wbr>1.10.10.bb</a> =3D&gt; <a href=
=3D"http://dbus_1.10.14.bb" rel=3D"noreferrer" target=3D"_blank">dbus_1.10.=
14.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta/recipes-core/images/<wbr>build-appliance-imag=
e/README_<wbr>VirtualBox_Toaster.txt<br>
=C2=A0delete mode 100644 meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c-=
comments-in-<wbr>c-code-fails-with-gcc-6.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/flex/<wbr>flex/CVE-2016-6354=
.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/flex/<wbr>flex/crosscompile.=
patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/flex/<wbr>flex/do_not_create=
_pdf_doc.<wbr>patch<br>
=C2=A0rename meta/recipes-devtools/flex/{<a href=3D"http://flex_2.6.0.bb" r=
el=3D"noreferrer" target=3D"_blank">fl<wbr>ex_2.6.0.bb</a> =3D&gt; <a href=
=3D"http://flex_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">flex_2.6.2.b=
b</a>} (84%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/opkg-<wbr>utils/opkg-utils/0=
001-<wbr>Makefile-use-defined-bindir-<wbr>and-mandir-as-installati.patch<br=
>
=C2=A0create mode 100644 meta/recipes-devtools/opkg/<wbr>opkg/status-conffi=
le.patch<br>
=C2=A0rename meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.3.3.bb" r=
el=3D"noreferrer" target=3D"_blank">op<wbr>kg_0.3.3.bb</a> =3D&gt; <a href=
=3D"http://opkg_0.3.4.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.3.4.b=
b</a>} (87%)<br>
=C2=A0rename meta/recipes-devtools/systemd-<wbr>bootchart/{<a href=3D"http:=
//systemd-bootchart_230.bb" rel=3D"noreferrer" target=3D"_blank">systemd-bo=
otchart_<wbr>230.bb</a> =3D&gt; <a href=3D"http://systemd-bootchart_231.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-bootchart_231.bb</a>} (92%)<b=
r>
=C2=A0rename meta/recipes-extended/grep/{<a href=3D"http://grep_2.26.bb" re=
l=3D"noreferrer" target=3D"_blank">gr<wbr>ep_2.26.bb</a> =3D&gt; <a href=3D=
"http://grep_2.27.bb" rel=3D"noreferrer" target=3D"_blank">grep_2.27.bb</a>=
} (88%)<br>
=C2=A0create mode 100644 meta/recipes-extended/<wbr>sysklogd/files/klogd.se=
rvice<br>
=C2=A0create mode 100644 meta/recipes-extended/<wbr>sysklogd/files/syslogd.=
service<br>
=C2=A0create mode 100644 meta/recipes-extended/<wbr>sysklogd/files/tmpfiles=
.<wbr>sysklogd.conf<br>
=C2=A0rename meta/recipes-extended/sysstat/<wbr>{<a href=3D"http://sysstat_=
11.4.0.bb" rel=3D"noreferrer" target=3D"_blank">sysstat_11.4.0.bb</a> =3D&g=
t; <a href=3D"http://sysstat_11.5.3.bb" rel=3D"noreferrer" target=3D"_blank=
">sysstat_11.5.3.bb</a>} (53%)<br>
=C2=A0create mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0010-ke=
xec-ARM-<wbr>Fix-add_buffer_phys_virt-<wbr>align-issue.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/sqlite/<wbr>files/0001-revert=
-ad601c7962-<wbr>that-brings-2-increase-of-<wbr>build-ti.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/sqlite/<a href=3D"http://sqli=
te3_3.15.2.bb" rel=3D"noreferrer" target=3D"_blank">sq<wbr>lite3_3.15.2.bb<=
/a><br>
=C2=A0create mode 100644 meta/recipes-support/sqlite/<a href=3D"http://sqli=
te3_3.16.2.bb" rel=3D"noreferrer" target=3D"_blank">sq<wbr>lite3_3.16.2.bb<=
/a><br>
=C2=A0delete mode 100644 scripts/lib/wic/canned-wks/<wbr>mkgummidisk.wks<br=
>
=C2=A0delete mode 100644 scripts/lib/wic/canned-wks/<wbr>mpc8315e-rdb.wks<b=
r>
=C2=A0create mode 100755 scripts/tiny/ksum.py<br>
<br>
Alejandro Hernandez (3):<br>
=C2=A0 gummiboot: Remove gummiboot tests<br>
=C2=A0 gummiboot: Remove old gummiboot recipe, related class and wks file<b=
r>
=C2=A0 systemd-boot.bbclass: Fix SYSYTEMD_BOOT_CFG creation<br>
<br>
Alejandro del Castillo (2):<br>
=C2=A0 opkg: upgrade to v0.3.4<br>
=C2=A0 opkg-utils: bump SRCREV to 0.3.4 tag<br>
<br>
Alistair Francis (1):<br>
=C2=A0 runqemu: Allow the user to specity no kernel or rootFS<br>
<br>
Amarnath Valluri (2):<br>
=C2=A0 kernel: Modify kernel modules installation path.<br>
=C2=A0 linux-firmware: Modify firmware installation path<br>
<br>
Andre McCurdy (1):<br>
=C2=A0 wayland: minor recipe cleanup<br>
<br>
Andreas M=C3=BCller (1):<br>
=C2=A0 python3-pygobject: add PACKAGECONFIG for cairo - enabled by default<=
br>
<br>
Andr=C3=A9 Draszik (2):<br>
=C2=A0 lib/oe/rootfs: reliably handle alternative symlinks<br>
=C2=A0 opkg-utils: use D instead of OPKG_OFFLINE_ROOT in postrm<br>
<br>
Chen Qi (9):<br>
=C2=A0 systemd-bootchart: upgrade to 231<br>
=C2=A0 dbus/dbus-test: upgrade to 1.10.14<br>
=C2=A0 sysstat: upgrade to 11.5.3<br>
=C2=A0 grep: upgrade to 2.27<br>
=C2=A0 coreutils: upgrade to 8.26<br>
=C2=A0 selftest/eSDK.py: fix sstate dir not found error<br>
=C2=A0 selftest/bbtests.py: fix path assumption for LICENSE_DIRECTORY<br>
=C2=A0 selftest/buildoptions.py: fix path assumption for DEPLOY_DIR_SRC<br>
=C2=A0 scripts/oe-selftest: fix typo<br>
<br>
Christoph Settgast (1):<br>
=C2=A0 libdrm: enable etnaviv experimental support<br>
<br>
Derek Straka (1):<br>
=C2=A0 python-3.5-manifest: Add http module to the netclient package<br>
<br>
Ed Bartosh (11):<br>
=C2=A0 image_types.bbclass: look for wks files in &lt;layer&gt;/wic<br>
=C2=A0 beaglebone: add beaglebone.wks<br>
=C2=A0 wic: fix parsing of &#39;bitbake -e&#39; output<br>
=C2=A0 canned-wks: remove mpc8315e-rdb.wks<br>
=C2=A0 direct.py: fix getting image name<br>
=C2=A0 wic: _exec_cmd: produce error if exit code is not 0<br>
=C2=A0 mpc8315e-rdb.conf: produce wic images for MPC8315<br>
=C2=A0 genericx86: add genericx86.wks<br>
=C2=A0 edgerouter: add edgerouter.wks<br>
=C2=A0 README.hardware: update MPC8315E-RDB section<br>
=C2=A0 mpc8315e-rdb: move wks file to wic/ directory<br>
<br>
Haiqing Bai (1):<br>
=C2=A0 kexec: ARM: fix align issue of add_buffer_phys_virt() for LPAE kerne=
l<br>
<br>
Ioan-Adrian Ratiu (1):<br>
=C2=A0 wic/isoimage-isohybrid: remove do_stage_partition()<br>
<br>
Jose Perez Carranza (1):<br>
=C2=A0 runtime: Add cleanup for logrotate tests<br>
<br>
Juro Bystricky (1):<br>
=C2=A0 build-appliance-image: support for Toaster<br>
<br>
Khem Raj (2):<br>
=C2=A0 musl: Upgrade to 1.1.16+ on master<br>
=C2=A0 grub-git: Upgrade to tip of master and fix with glibc 2.25<br>
<br>
Leonardo Sandoval (3):<br>
=C2=A0 recipes-test: exclude recipes from world target<br>
=C2=A0 selftest: devtool: use distro agnostic recipes for devtool checks<br=
>
=C2=A0 selftest: runtime-test: skip image-install test for poky-tiny<br>
<br>
Linus Wallgren (1):<br>
=C2=A0 apt-package: Include maintenance scripts<br>
<br>
Mark Asselstine (1):<br>
=C2=A0 sysklogd: do more to properly work with systemd<br>
<br>
Markus Lehtonen (10):<br>
=C2=A0 oeqa.utils.metadata: re-organise host distro information<br>
=C2=A0 oeqa.utils.metadata: re-organise distro information<br>
=C2=A0 oeqa.utils.metadata: drop &#39;unknown&#39; git data elements<br>
=C2=A0 oeqa.utils.metadata: fix retrieval of git branch and revision<br>
=C2=A0 oeqa.utils.metadata: rename &#39;revision&#39; to &#39;commit&#39;<b=
r>
=C2=A0 oeqa.utils.metadata: add commit count information<br>
=C2=A0 oeqa.utils.metadata: have layer name as an attribute in xml<br>
=C2=A0 oeqa.utils.metadata: add bitbake revision information<br>
=C2=A0 oeqa.utils.metadata: allow storing any bitbake config variables<br>
=C2=A0 oeqa.utils.metadata: include BB_NUMBER_THREADS and PARALLEL_MAKE<br>
<br>
Maxin B. John (1):<br>
=C2=A0 sqlite3: upgrade to 3.16.2<br>
<br>
Ola x Nilsson (2):<br>
=C2=A0 externalsrc.bbclass: Add task buildclean<br>
=C2=A0 oe-selftest: devtool: Add test for externalsrc buildclean<br>
<br>
Patrick Ohly (8):<br>
=C2=A0 recipes: anonymous functions with priorities<br>
=C2=A0 build.py: add preceedtask() API<br>
=C2=A0 runqueue.py: alternative rm_work scheduler<br>
=C2=A0 gcc-source.inc: cleanly disable do_rm_work<br>
=C2=A0 rm_work_and_downloads.bbclass: more aggressively minimize disk usage=
<br>
=C2=A0 rm_work.bbclass: clean up sooner<br>
=C2=A0 rootfs-postcommands.bbclass: sort passwd entries<br>
=C2=A0 insane.bbclass: print license text as part of QA message<br>
<br>
Randy Witt (2):<br>
=C2=A0 image_typedep.py: Add a test that ensures conversion type deps get<b=
r>
=C2=A0 =C2=A0 added<br>
=C2=A0 image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion typ=
es<br>
<br>
Ross Burton (9):<br>
=C2=A0 linux-firmware: remove alternatives for brcmfmac-stdio.bin<br>
=C2=A0 opkg-utils: set CLEANBROKEN as upstream Makefile doesn&#39;t have cl=
ean<br>
=C2=A0 =C2=A0 target<br>
=C2=A0 flex: upgrade to 2.6.2<br>
=C2=A0 opkg: fix conffile errors in &#39;opkg status&#39; calls<br>
=C2=A0 rootfs: don&#39;t put /usr/lib/ssl and /etc into debugfs<br>
=C2=A0 selftest/archiver: don&#39;t build an image for a basic test<br>
=C2=A0 grub_git: remove redundant inherits<br>
=C2=A0 selftest/bblayers: don&#39;t fetch a variable that is never used<br>
=C2=A0 selftest/base: don&#39;t fetch DISTRO variable in constructor<br>
<br>
Saul Wold (1):<br>
=C2=A0 nfs-utils: remove -f exports from nfsserver<br>
<br>
Tom Zanussi (1):<br>
=C2=A0 scripts: python3 fixes and new tool ksum<br>
<br>
Zheng Ruoqin (1):<br>
=C2=A0 iproute2 4.7-&gt;4.9<br>
<br>
=C2=A0README.hardware=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 69 +++++++<br>
=C2=A0bitbake/lib/bb/build.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 ++<br>
=C2=A0bitbake/lib/bb/data_smart.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0bitbake/lib/bb/parse/ast.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +-<br>
=C2=A0bitbake/lib/bb/runqueue.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 107 +++++++++++<br>
=C2=A0.../recipes-test/aspell/<a href=3D"http://aspell_0.0.0.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">aspell<wbr>_0.0.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-test/devtool/<a href=3D"http://devtool-test-localonly.bb"=
 rel=3D"noreferrer" target=3D"_blank">devto<wbr>ol-test-localonly.bb</a> |=
=C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-test/devtool/<a href=3D"http://devtool-test-patch-gz.bb" =
rel=3D"noreferrer" target=3D"_blank">devto<wbr>ol-test-patch-gz.bb</a>=C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-test/devtool/<a href=3D"http://devtool-test-subdir.bb" re=
l=3D"noreferrer" target=3D"_blank">devto<wbr>ol-test-subdir.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../devtool/<a href=3D"http://devtool-upgrade-test1_1.5.3.bb" rel=3D"=
noreferrer" target=3D"_blank">devtool-upgrade-<wbr>test1_1.5.3.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../devtool-upgrade-test1_1.5.<wbr>3.bb.upgraded=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../devtool/<a href=3D"http://devtool-upgrade-test2_git.bb" rel=3D"no=
referrer" target=3D"_blank">devtool-upgrade-<wbr>test2_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../devtool/devtool-upgrade-<wbr>test2_git.bb.upgraded=C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0.../recipetool/<a href=3D"http://selftest-recipetool-appendfile.bb" r=
el=3D"noreferrer" target=3D"_blank">selftest-<wbr>recipetool-appendfile.bb<=
/a>=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta-yocto-bsp/conf/machine/<wbr>beaglebone.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta-yocto-bsp/conf/machine/<wbr>edgerouter.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../conf/machine/include/<wbr>genericx86-common.inc=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta-yocto-bsp/conf/machine/<wbr>mpc8315e-rdb.conf=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0meta-yocto-bsp/lib/oeqa/<wbr>selftest/gummiboot.py=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 83 --------<br>
=C2=A0meta-yocto-bsp/wic/beaglebone.<wbr>wks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0meta-yocto-bsp/wic/edgerouter.<wbr>wks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0meta-yocto-bsp/wic/genericx86.<wbr>wks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0.../wic}/mpc8315e-rdb.wks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0meta/classes/externalsrc.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 19 +-<br>
=C2=A0meta/classes/gummiboot.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 121 ------------<br>
=C2=A0meta/classes/image_types.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 +-<br>
=C2=A0meta/classes/insane.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 29 +++<br>
=C2=A0meta/classes/kernel-module-<wbr>split.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
=C2=A0meta/classes/rm_work.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 31 +--<br>
=C2=A0meta/classes/rm_work_and_<wbr>downloads.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 33 ++++<br>
=C2=A0meta/classes/rootfs-<wbr>postcommands.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 22 +++<br>
=C2=A0meta/classes/systemd-boot.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0meta/lib/oe/rootfs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-=
<br>
=C2=A0meta/lib/oeqa/runtime/<wbr>logrotate.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>archiver.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 +--<br>
=C2=A0meta/lib/oeqa/selftest/base.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>bblayers.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>bbtests.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>buildoptions.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>devtool.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 65 ++++++-<br>
=C2=A0meta/lib/oeqa/selftest/eSDK.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/lib/oeqa/selftest/image_<wbr>typedep.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 51 +++++<br>
=C2=A0meta/lib/oeqa/selftest/<wbr>runtime-test.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta/lib/oeqa/utils/metadata.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 87 ++++++---<br>
=C2=A0meta/lib/rootfspostcommands.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 44 +++++<br>
=C2=A0meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" rel=3D"noreferre=
r" target=3D"_blank">grub_<wbr>git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0...-C-syntax-errors-for-<wbr>function-declaration.patch |=C2=A0 74 --=
-----<br>
=C2=A0.../gummiboot/gummiboot/fix-<wbr>objcopy.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 45 -----<br>
=C2=A0meta/recipes-bsp/gummiboot/<a href=3D"http://gummiboot_git.bb" rel=3D=
"noreferrer" target=3D"_blank">gum<wbr>miboot_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 39 ----<br>
=C2=A0...-4.3.0-musl.patch =3D&gt; iproute2-4.9.0-musl.patch} |=C2=A0 90 ++=
++++---<br>
=C2=A0.../{<a href=3D"http://iproute2_4.7.0.bb" rel=3D"noreferrer" target=
=3D"_blank">iproute2_4.7.0.bb</a> =3D&gt; <a href=3D"http://iproute2_4.9.0.=
bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.9.0.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0.../nfs-utils/nfs-utils/<wbr>nfsserver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0...need_charset_alias-when-<wbr>building-for-musl.patch |=C2=A0 =C2=
=A00<br>
=C2=A0...0001-local.mk-fix-cross-<wbr>compiling-problem.patch |=C2=A0 26 ++=
+<br>
=C2=A0...e-report-processor-and-<wbr>hardware-correctly.patch |=C2=A0 =C2=
=A00<br>
=C2=A0.../disable-ls-output-quoting.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../fix-selinux-flask.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../man-decouple-manpages-<wbr>from-build.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../remove-usr-local-lib-from-<wbr>m4.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../{<a href=3D"http://coreutils_8.25.bb" rel=3D"noreferrer" target=
=3D"_blank">coreutils_8.25.bb</a> =3D&gt; <a href=3D"http://coreutils_8.26.=
bb" rel=3D"noreferrer" target=3D"_blank">coreutils_8.26.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0.../{<a href=3D"http://dbus-test_1.10.10.bb" rel=3D"noreferrer" targe=
t=3D"_blank">dbus-test_1.10.10.bb</a> =3D&gt; <a href=3D"http://dbus-test_1=
.10.14.bb" rel=3D"noreferrer" target=3D"_blank">dbus-test_1.10.14.bb</a>} |=
=C2=A0 =C2=A04 +-<br>
=C2=A0.../dbus/{<a href=3D"http://dbus_1.10.10.bb" rel=3D"noreferrer" targe=
t=3D"_blank">dbus_1.10.10.bb</a> =3D&gt; <a href=3D"http://dbus_1.10.14.bb"=
 rel=3D"noreferrer" target=3D"_blank">dbus_1.10.14.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../README_VirtualBox_Toaster.<wbr>txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 78 ++++++++<br>
=C2=A0.../images/<a href=3D"http://build-appliance-image_15.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">build-appliance-<wbr>image_15.0.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 +-<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_<wbr>git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-devtools/apt/apt-<wbr>package.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 15 +-<br>
=C2=A0...oid-c-comments-in-c-code-<wbr>fails-with-gcc-6.patch |=C2=A0 64 --=
----<br>
=C2=A0.../recipes-devtools/flex/<wbr>flex/CVE-2016-6354.patch |=C2=A0 59 --=
----<br>
=C2=A0meta/recipes-devtools/flex/<wbr>flex/crosscompile.patch | 214 +++++++=
++++++++++++++<br>
=C2=A0.../flex/flex/do_not_create_<wbr>pdf_doc.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 17 --<br>
=C2=A0.../flex/{<a href=3D"http://flex_2.6.0.bb" rel=3D"noreferrer" target=
=3D"_blank">flex_2.6.0.bb</a> =3D&gt; <a href=3D"http://flex_2.6.2.bb" rel=
=3D"noreferrer" target=3D"_blank">flex_2.6.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 11 +-<br>
=C2=A0meta/recipes-devtools/gcc/gcc-<wbr>source.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0...e-defined-bindir-and-<wbr>mandir-as-installati.patch |=C2=A0 30 ++=
+<br>
=C2=A0.../opkg-utils/opkg-utils/tar_<wbr>ignore_error.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-utils_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_git.bb</a> |=C2=A0 13=
 +-<br>
=C2=A0...reate-opkg.lock-in-run-<wbr>instead-of-var-run.patch |=C2=A0 =C2=
=A08 +-<br>
=C2=A0.../opkg/opkg/status-conffile.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 69 +++++++<br>
=C2=A0.../opkg/{<a href=3D"http://opkg_0.3.3.bb" rel=3D"noreferrer" target=
=3D"_blank">opkg_0.3.3.bb</a> =3D&gt; <a href=3D"http://opkg_0.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.3.4.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0.../python/python-3.5-<wbr>manifest.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-pygobject_3.22.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-pygobject_<wbr>3.22.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0...<a href=3D"http://d-bootchart_230.bb" rel=3D"noreferrer" target=3D=
"_blank">d-bootchart_230.bb</a> =3D&gt; <a href=3D"http://systemd-bootchart=
_231.bb" rel=3D"noreferrer" target=3D"_blank">systemd-bootchart_231.bb</a>}=
 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../grep/{<a href=3D"http://grep_2.26.bb" rel=3D"noreferrer" target=
=3D"_blank">grep_2.26.bb</a> =3D&gt; <a href=3D"http://grep_2.27.bb" rel=3D=
"noreferrer" target=3D"_blank">grep_2.27.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-extended/<wbr>sysklogd/files/klogd.service |=C2=A0 13 ++=
<br>
=C2=A0.../sysklogd/files/syslogd.<wbr>service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 ++<br>
=C2=A0.../sysklogd/files/tmpfiles.<wbr>sysklogd.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-extended/<wbr>sysklogd/sysklogd.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 21 +-<br>
=C2=A0.../{<a href=3D"http://sysstat_11.4.0.bb" rel=3D"noreferrer" target=
=3D"_blank">sysstat_11.4.0.bb</a> =3D&gt; <a href=3D"http://sysstat_11.5.3.=
bb" rel=3D"noreferrer" target=3D"_blank">sysstat_11.5.3.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.74.bb" rel=3D"=
noreferrer" target=3D"_blank">libd<wbr>rm_2.4.74.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.12.0.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>wayland_1.12.0.bb</a>=C2=A0 =C2=A0 =
|=C2=A0 11 +-<br>
=C2=A0...-ARM-Fix-add_buffer_phys_<wbr>virt-align-issue.patch |=C2=A0 52 ++=
+++<br>
=C2=A0meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.14.bb" re=
l=3D"noreferrer" target=3D"_blank">kexe<wbr>c-tools_2.0.14.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../linux-firmware/<a href=3D"http://linux-firmware_git.bb" rel=3D"no=
referrer" target=3D"_blank">linux-<wbr>firmware_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 186 ++++++++----------<br>
=C2=A0...1c7962-that-brings-2-<wbr>increase-of-build-ti.patch |=C2=A0 56 --=
----<br>
=C2=A0meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.15.2.bb" rel=
=3D"noreferrer" target=3D"_blank">sq<wbr>lite3_3.15.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 12 --<br>
=C2=A0meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.16.2.bb" rel=
=3D"noreferrer" target=3D"_blank">sq<wbr>lite3_3.16.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 11 ++<br>
=C2=A0scripts/contrib/python/<a href=3D"http://generate-manifest-3.5.py" re=
l=3D"noreferrer" target=3D"_blank">generat<wbr>e-manifest-3.5.py</a>=C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/lib/wic/canned-wks/<wbr>mkgummidisk.wks=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 11 --<br>
=C2=A0scripts/lib/wic/imager/direct.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../lib/wic/plugins/source/<wbr>isoimage-isohybrid.py=C2=A0 =C2=A0|=
=C2=A0 49 -----<br>
=C2=A0scripts/lib/wic/utils/oe/misc.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 32 ++-<br>
=C2=A0scripts/oe-selftest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +=
-<br>
=C2=A0scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A09 +-<br>
=C2=A0scripts/tiny/ksize.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 +-<br>
=C2=A0scripts/tiny/ksum.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 168 +++++++=
+++++++++<br>
=C2=A0105 files changed, 1618 insertions(+), 942 deletions(-)<br>
=C2=A0delete mode 100644 meta-yocto-bsp/lib/oeqa/<wbr>selftest/gummiboot.py=
<br>
=C2=A0create mode 100644 meta-yocto-bsp/wic/beaglebone.<wbr>wks<br>
=C2=A0create mode 100644 meta-yocto-bsp/wic/edgerouter.<wbr>wks<br>
=C2=A0create mode 100644 meta-yocto-bsp/wic/genericx86.<wbr>wks<br>
=C2=A0rename {scripts/lib/wic/canned-wks =3D&gt; meta-yocto-bsp/wic}/mpc831=
5e-<wbr>rdb.wks (45%)<br>
=C2=A0delete mode 100644 meta/classes/gummiboot.bbclass<br>
=C2=A0create mode 100644 meta/classes/rm_work_and_<wbr>downloads.bbclass<br=
>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/image_<wbr>typedep.py<br>
=C2=A0create mode 100644 meta/lib/rootfspostcommands.py<br>
=C2=A0delete mode 100644 meta/recipes-bsp/gummiboot/<wbr>gummiboot/0001-con=
sole-Fix-C-<wbr>syntax-errors-for-function-<wbr>declaration.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/gummiboot/<wbr>gummiboot/fix-objc=
opy.patch<br>
=C2=A0delete mode 100644 meta/recipes-bsp/gummiboot/<a href=3D"http://gummi=
boot_git.bb" rel=3D"noreferrer" target=3D"_blank">gum<wbr>miboot_git.bb</a>=
<br>
=C2=A0rename meta/recipes-connectivity/<wbr>iproute2/iproute2/{iproute2-4.<=
wbr>3.0-musl.patch =3D&gt; iproute2-4.9.0-musl.patch} (42%)<br>
=C2=A0rename meta/recipes-connectivity/<wbr>iproute2/{<a href=3D"http://ipr=
oute2_4.7.0.bb" rel=3D"noreferrer" target=3D"_blank">iproute2_4.7.0.bb</a> =
=3D&gt; <a href=3D"http://iproute2_4.9.0.bb" rel=3D"noreferrer" target=3D"_=
blank">iproute2_4.9.0.bb</a>} (61%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/0001-Unset-<wbr>need_charset_alias-when-<wbr>building-for-musl.p=
atch (100%)<br>
=C2=A0create mode 100644 meta/recipes-core/coreutils/<wbr>coreutils-8.26/00=
01-local.mk-<wbr>fix-cross-compiling-problem.<wbr>patch<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/0001-uname-<wbr>report-processor-and-hardware-<wbr>correctly.pat=
ch (100%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/disable-ls-<wbr>output-quoting.patch (100%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/fix-selinux-<wbr>flask.patch (100%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/man-decouple-<wbr>manpages-from-build.patch (100%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<wbr>coreutils-8.25 =3D&gt; coreu=
tils-8.26}/remove-usr-<wbr>local-lib-from-m4.patch (100%)<br>
=C2=A0rename meta/recipes-core/coreutils/{<a href=3D"http://coreutils_8.25.=
bb" rel=3D"noreferrer" target=3D"_blank">c<wbr>oreutils_8.25.bb</a> =3D&gt;=
 <a href=3D"http://coreutils_8.26.bb" rel=3D"noreferrer" target=3D"_blank">=
coreutils_8.26.bb</a>} (93%)<br>
=C2=A0rename meta/recipes-core/dbus/{<a href=3D"http://dbus-test_1.10.10.bb=
" rel=3D"noreferrer" target=3D"_blank">dbus-<wbr>test_1.10.10.bb</a> =3D&gt=
; <a href=3D"http://dbus-test_1.10.14.bb" rel=3D"noreferrer" target=3D"_bla=
nk">dbus-test_1.10.14.bb</a>} (93%)<br>
=C2=A0rename meta/recipes-core/dbus/{<a href=3D"http://dbus_1.10.10.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus_<wbr>1.10.10.bb</a> =3D&gt; <a href=
=3D"http://dbus_1.10.14.bb" rel=3D"noreferrer" target=3D"_blank">dbus_1.10.=
14.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta/recipes-core/images/<wbr>build-appliance-imag=
e/README_<wbr>VirtualBox_Toaster.txt<br>
=C2=A0delete mode 100644 meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c-=
comments-in-<wbr>c-code-fails-with-gcc-6.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/flex/<wbr>flex/CVE-2016-6354=
.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/flex/<wbr>flex/crosscompile.=
patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/flex/<wbr>flex/do_not_create=
_pdf_doc.<wbr>patch<br>
=C2=A0rename meta/recipes-devtools/flex/{<a href=3D"http://flex_2.6.0.bb" r=
el=3D"noreferrer" target=3D"_blank">fl<wbr>ex_2.6.0.bb</a> =3D&gt; <a href=
=3D"http://flex_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">flex_2.6.2.b=
b</a>} (84%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/opkg-<wbr>utils/opkg-utils/0=
001-<wbr>Makefile-use-defined-bindir-<wbr>and-mandir-as-installati.patch<br=
>
=C2=A0create mode 100644 meta/recipes-devtools/opkg/<wbr>opkg/status-conffi=
le.patch<br>
=C2=A0rename meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.3.3.bb" r=
el=3D"noreferrer" target=3D"_blank">op<wbr>kg_0.3.3.bb</a> =3D&gt; <a href=
=3D"http://opkg_0.3.4.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.3.4.b=
b</a>} (87%)<br>
=C2=A0rename meta/recipes-devtools/systemd-<wbr>bootchart/{<a href=3D"http:=
//systemd-bootchart_230.bb" rel=3D"noreferrer" target=3D"_blank">systemd-bo=
otchart_<wbr>230.bb</a> =3D&gt; <a href=3D"http://systemd-bootchart_231.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd-bootchart_231.bb</a>} (92%)<b=
r>
=C2=A0rename meta/recipes-extended/grep/{<a href=3D"http://grep_2.26.bb" re=
l=3D"noreferrer" target=3D"_blank">gr<wbr>ep_2.26.bb</a> =3D&gt; <a href=3D=
"http://grep_2.27.bb" rel=3D"noreferrer" target=3D"_blank">grep_2.27.bb</a>=
} (88%)<br>
=C2=A0create mode 100644 meta/recipes-extended/<wbr>sysklogd/files/klogd.se=
rvice<br>
=C2=A0create mode 100644 meta/recipes-extended/<wbr>sysklogd/files/syslogd.=
service<br>
=C2=A0create mode 100644 meta/recipes-extended/<wbr>sysklogd/files/tmpfiles=
.<wbr>sysklogd.conf<br>
=C2=A0rename meta/recipes-extended/sysstat/<wbr>{<a href=3D"http://sysstat_=
11.4.0.bb" rel=3D"noreferrer" target=3D"_blank">sysstat_11.4.0.bb</a> =3D&g=
t; <a href=3D"http://sysstat_11.5.3.bb" rel=3D"noreferrer" target=3D"_blank=
">sysstat_11.5.3.bb</a>} (53%)<br>
=C2=A0create mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0010-ke=
xec-ARM-<wbr>Fix-add_buffer_phys_virt-<wbr>align-issue.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/sqlite/<wbr>files/0001-revert=
-ad601c7962-<wbr>that-brings-2-increase-of-<wbr>build-ti.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/sqlite/<a href=3D"http://sqli=
te3_3.15.2.bb" rel=3D"noreferrer" target=3D"_blank">sq<wbr>lite3_3.15.2.bb<=
/a><br>
=C2=A0create mode 100644 meta/recipes-support/sqlite/<a href=3D"http://sqli=
te3_3.16.2.bb" rel=3D"noreferrer" target=3D"_blank">sq<wbr>lite3_3.16.2.bb<=
/a><br>
=C2=A0delete mode 100644 scripts/lib/wic/canned-wks/<wbr>mkgummidisk.wks<br=
>
=C2=A0create mode 100755 scripts/tiny/ksum.py<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.8.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--94eb2c05be6829d0970545f9f6e1--
