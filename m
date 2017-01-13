Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7338A71CCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:00:57 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r144so69795087wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 05:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TNXNVt1FfMIB38eTG/PrzfXdGLhsN6E6IR/QvkJzPoU=;
	b=I9r9E7bsN4q2dq8QGdvWJOadUOLj8frbdg8Ofx5JiMahD2LroGBXu+vTtkzRaGefsF
	HyxgB3hgGAI5mSlCFJDBmP9lY3JpzrwmjYJOcSaY8GtTuchj5dibPtMss9NMSMRQ+EB8
	Qk9e2h7HG+00VVc14htIcubwrPEkCBTdmzWvNQjEEkM2WtsyYIiiigRu0ugoEY88rhX5
	SCOBNXc2p/Isk/YSoh9DeJLF2lnBqn2xSZdnrVAw5UHgzzIWUGVqYxeMgoR829ZU8Pou
	PXcS+nxcTqw8ZCkUDDoAXx8LQOPmQHkvboh9u6PRR1tUXkVaTVBL7hiEGAqG51dmM0uS
	ying==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TNXNVt1FfMIB38eTG/PrzfXdGLhsN6E6IR/QvkJzPoU=;
	b=mf0bh2oCqsrOzbZsKAi4AtWOseISUC0jW4D97Yai2CSngIu3pMUF9rXoMhNujiS4Np
	gv5vD9/uRxke69OgWH0KAh2SW9IyIKOF7dHBJFown8OUkR2+1UOcE6YVtIFkgnkPxWzj
	IwVmVOm4wCrxcObM3CY1jdrEglbAokf1l72A/fpLSBfk9pHFqItVTDgKJw526mghBt0F
	YGU5Cp2vYtTlLjZ1P/9n3nNXwDD7qy0rs5QXGe4mt9cIR5d91Nt6bpoBDP96/NsJErNS
	26nzf3YuLk0vV65YSwZYDEj1ofRyWTdx68mo/jjoUoQl7BvVl2hj4RMTgx0cB4MUIY5/
	DVeQ==
X-Gm-Message-State: AIkVDXKzNsGXtOIpVPVPP59eLQKXsaMg4gpfkymmhuelwjL5AV4pmxRr4VySHIzcoH574nL6
X-Received: by 10.28.158.82 with SMTP id h79mr2095431wme.19.1484312456456;
	Fri, 13 Jan 2017 05:00:56 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r129sm4185415wmd.8.2017.01.13.05.00.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 05:00:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 13:00:53 +0000
Message-Id: <cover.1484312322.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 13:00:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Another consolidated pull.  Last run on the AB was mostly green:
- byacc on beaglebone-lsb failed (upgrade removed)
- checkuri failed (transient, works now)
- selftest failed (fixed in branch, tests work locally now)

Ross

The following changes since commit 29423274b1ff04e779f00aa6aae7dbaa7ce89226:

  bitbake: gitsm.py: Add force flag to git checkout command in update_submodules (2017-01-12 17:48:12 +0000)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to b1f6b2b8c185b446be83b030e6f01b2c390f5716:

  mpc8315e-rdb: move wks file to wic/ directory (2017-01-13 12:56:42 +0000)

----------------------------------------------------------------
Alejandro Hernandez (3):
      gummiboot: Remove gummiboot tests
      gummiboot: Remove old gummiboot recipe, related class and wks file
      systemd-boot.bbclass: Fix SYSYTEMD_BOOT_CFG creation

Alejandro del Castillo (2):
      opkg: upgrade to v0.3.4
      opkg-utils: bump SRCREV to 0.3.4 tag

Alistair Francis (1):
      runqemu: Allow the user to specity no kernel or rootFS

Amarnath Valluri (2):
      kernel: Modify kernel modules installation path.
      linux-firmware: Modify firmware installation path

Andre McCurdy (1):
      wayland: minor recipe cleanup

Andreas Müller (1):
      python3-pygobject: add PACKAGECONFIG for cairo - enabled by default

André Draszik (2):
      lib/oe/rootfs: reliably handle alternative symlinks
      opkg-utils: use D instead of OPKG_OFFLINE_ROOT in postrm

Chen Qi (9):
      systemd-bootchart: upgrade to 231
      dbus/dbus-test: upgrade to 1.10.14
      sysstat: upgrade to 11.5.3
      grep: upgrade to 2.27
      coreutils: upgrade to 8.26
      selftest/eSDK.py: fix sstate dir not found error
      selftest/bbtests.py: fix path assumption for LICENSE_DIRECTORY
      selftest/buildoptions.py: fix path assumption for DEPLOY_DIR_SRC
      scripts/oe-selftest: fix typo

Christoph Settgast (1):
      libdrm: enable etnaviv experimental support

Derek Straka (1):
      python-3.5-manifest: Add http module to the netclient package

Ed Bartosh (11):
      image_types.bbclass: look for wks files in <layer>/wic
      beaglebone: add beaglebone.wks
      wic: fix parsing of 'bitbake -e' output
      canned-wks: remove mpc8315e-rdb.wks
      direct.py: fix getting image name
      wic: _exec_cmd: produce error if exit code is not 0
      mpc8315e-rdb.conf: produce wic images for MPC8315
      genericx86: add genericx86.wks
      edgerouter: add edgerouter.wks
      README.hardware: update MPC8315E-RDB section
      mpc8315e-rdb: move wks file to wic/ directory

Haiqing Bai (1):
      kexec: ARM: fix align issue of add_buffer_phys_virt() for LPAE kernel

Ioan-Adrian Ratiu (1):
      wic/isoimage-isohybrid: remove do_stage_partition()

Jose Perez Carranza (1):
      runtime: Add cleanup for logrotate tests

Juro Bystricky (1):
      build-appliance-image: support for Toaster

Khem Raj (2):
      musl: Upgrade to 1.1.16+ on master
      grub-git: Upgrade to tip of master and fix with glibc 2.25

Leonardo Sandoval (3):
      recipes-test: exclude recipes from world target
      selftest: devtool: use distro agnostic recipes for devtool checks
      selftest: runtime-test: skip image-install test for poky-tiny

Linus Wallgren (1):
      apt-package: Include maintenance scripts

Mark Asselstine (1):
      sysklogd: do more to properly work with systemd

Markus Lehtonen (10):
      oeqa.utils.metadata: re-organise host distro information
      oeqa.utils.metadata: re-organise distro information
      oeqa.utils.metadata: drop 'unknown' git data elements
      oeqa.utils.metadata: fix retrieval of git branch and revision
      oeqa.utils.metadata: rename 'revision' to 'commit'
      oeqa.utils.metadata: add commit count information
      oeqa.utils.metadata: have layer name as an attribute in xml
      oeqa.utils.metadata: add bitbake revision information
      oeqa.utils.metadata: allow storing any bitbake config variables
      oeqa.utils.metadata: include BB_NUMBER_THREADS and PARALLEL_MAKE

Maxin B. John (1):
      sqlite3: upgrade to 3.16.2

Ola x Nilsson (2):
      externalsrc.bbclass: Add task buildclean
      oe-selftest: devtool: Add test for externalsrc buildclean

Patrick Ohly (8):
      recipes: anonymous functions with priorities
      build.py: add preceedtask() API
      runqueue.py: alternative rm_work scheduler
      gcc-source.inc: cleanly disable do_rm_work
      rm_work_and_downloads.bbclass: more aggressively minimize disk usage
      rm_work.bbclass: clean up sooner
      rootfs-postcommands.bbclass: sort passwd entries
      insane.bbclass: print license text as part of QA message

Randy Witt (2):
      image_typedep.py: Add a test that ensures conversion type deps get added
      image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types

Ross Burton (9):
      linux-firmware: remove alternatives for brcmfmac-stdio.bin
      opkg-utils: set CLEANBROKEN as upstream Makefile doesn't have clean target
      flex: upgrade to 2.6.2
      opkg: fix conffile errors in 'opkg status' calls
      rootfs: don't put /usr/lib/ssl and /etc into debugfs
      selftest/archiver: don't build an image for a basic test
      grub_git: remove redundant inherits
      selftest/bblayers: don't fetch a variable that is never used
      selftest/base: don't fetch DISTRO variable in constructor

Saul Wold (1):
      nfs-utils: remove -f exports from nfsserver

Tom Zanussi (1):
      scripts: python3 fixes and new tool ksum

Zheng Ruoqin (1):
      iproute2 4.7->4.9

 README.hardware                                    |  69 +++++++
 bitbake/lib/bb/build.py                            |  16 ++
 bitbake/lib/bb/data_smart.py                       |   3 +
 bitbake/lib/bb/parse/ast.py                        |  19 +-
 bitbake/lib/bb/runqueue.py                         | 107 +++++++++++
 .../recipes-test/aspell/aspell_0.0.0.1.bb          |   2 +
 .../recipes-test/devtool/devtool-test-localonly.bb |   1 +
 .../recipes-test/devtool/devtool-test-patch-gz.bb  |   1 +
 .../recipes-test/devtool/devtool-test-subdir.bb    |   2 +
 .../devtool/devtool-upgrade-test1_1.5.3.bb         |   2 +
 .../devtool-upgrade-test1_1.5.3.bb.upgraded        |   2 +
 .../devtool/devtool-upgrade-test2_git.bb           |   2 +
 .../devtool/devtool-upgrade-test2_git.bb.upgraded  |   2 +
 .../recipetool/selftest-recipetool-appendfile.bb   |   2 +
 meta-yocto-bsp/conf/machine/beaglebone.conf        |   2 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf        |   2 +-
 .../conf/machine/include/genericx86-common.inc     |   2 +-
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |   4 +
 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py      |  83 --------
 meta-yocto-bsp/wic/beaglebone.wks                  |   6 +
 meta-yocto-bsp/wic/edgerouter.wks                  |   4 +
 meta-yocto-bsp/wic/genericx86.wks                  |   7 +
 meta-yocto-bsp/wic/mpc8315e-rdb.wks                |   4 +
 meta/classes/externalsrc.bbclass                   |  19 +-
 meta/classes/gummiboot.bbclass                     | 121 ------------
 meta/classes/image_types.bbclass                   |  16 +-
 meta/classes/insane.bbclass                        |  29 +++
 meta/classes/kernel-module-split.bbclass           |   2 +-
 meta/classes/kernel.bbclass                        |  12 +-
 meta/classes/rm_work.bbclass                       |  31 +--
 meta/classes/rm_work_and_downloads.bbclass         |  33 ++++
 meta/classes/rootfs-postcommands.bbclass           |  22 +++
 meta/classes/systemd-boot.bbclass                  |   3 +
 meta/lib/oe/rootfs.py                              |   9 +-
 meta/lib/oeqa/runtime/logrotate.py                 |   1 +
 meta/lib/oeqa/selftest/archiver.py                 |  22 +--
 meta/lib/oeqa/selftest/base.py                     |   1 -
 meta/lib/oeqa/selftest/bblayers.py                 |   1 -
 meta/lib/oeqa/selftest/bbtests.py                  |   5 +-
 meta/lib/oeqa/selftest/buildoptions.py             |   5 +-
 meta/lib/oeqa/selftest/devtool.py                  |  65 ++++++-
 meta/lib/oeqa/selftest/eSDK.py                     |   2 +-
 meta/lib/oeqa/selftest/image_typedep.py            |  51 +++++
 meta/lib/oeqa/selftest/runtime-test.py             |   2 +
 meta/lib/oeqa/utils/metadata.py                    |  87 ++++++---
 meta/lib/rootfspostcommands.py                     |  44 +++++
 meta/recipes-bsp/grub/grub_git.bb                  |   4 +-
 ...-C-syntax-errors-for-function-declaration.patch |  74 -------
 .../gummiboot/gummiboot/fix-objcopy.patch          |  45 -----
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  39 ----
 .../iproute2/iproute2/iproute2-4.3.0-musl.patch    |  85 --------
 .../iproute2/iproute2/iproute2-4.9.0-musl.patch    | 131 +++++++++++++
 .../{iproute2_4.7.0.bb => iproute2_4.9.0.bb}       |   7 +-
 .../nfs-utils/nfs-utils/nfsserver                  |   2 +-
 ...need_charset_alias-when-building-for-musl.patch |   0
 ...0001-local.mk-fix-cross-compiling-problem.patch |  26 +++
 ...e-report-processor-and-hardware-correctly.patch |   0
 .../disable-ls-output-quoting.patch                |   0
 .../fix-selinux-flask.patch                        |   0
 .../man-decouple-manpages-from-build.patch         |   0
 .../remove-usr-local-lib-from-m4.patch             |   0
 .../{coreutils_8.25.bb => coreutils_8.26.bb}       |   9 +-
 .../{dbus-test_1.10.10.bb => dbus-test_1.10.14.bb} |   4 +-
 .../dbus/{dbus_1.10.10.bb => dbus_1.10.14.bb}      |   4 +-
 .../README_VirtualBox_Toaster.txt                  |  78 ++++++++
 .../images/build-appliance-image_15.0.0.bb         |  18 +-
 meta/recipes-core/musl/musl_git.bb                 |   4 +-
 meta/recipes-devtools/apt/apt-package.inc          |  15 +-
 ...oid-c-comments-in-c-code-fails-with-gcc-6.patch |  64 ------
 .../recipes-devtools/flex/flex/CVE-2016-6354.patch |  59 ------
 meta/recipes-devtools/flex/flex/crosscompile.patch | 214 +++++++++++++++++++++
 .../flex/flex/do_not_create_pdf_doc.patch          |  17 --
 .../flex/{flex_2.6.0.bb => flex_2.6.2.bb}          |  11 +-
 meta/recipes-devtools/gcc/gcc-source.inc           |   2 +-
 ...e-defined-bindir-and-mandir-as-installati.patch |  30 +++
 .../opkg-utils/opkg-utils/tar_ignore_error.patch   |   2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  13 +-
 ...reate-opkg.lock-in-run-instead-of-var-run.patch |   8 +-
 .../opkg/opkg/status-conffile.patch                |  69 +++++++
 .../opkg/{opkg_0.3.3.bb => opkg_0.3.4.bb}          |   7 +-
 .../python/python-3.5-manifest.inc                 |   2 +-
 .../python/python3-pygobject_3.22.0.bb             |  10 +-
 ...d-bootchart_230.bb => systemd-bootchart_231.bb} |   4 +-
 .../grep/{grep_2.26.bb => grep_2.27.bb}            |   4 +-
 meta/recipes-extended/sysklogd/files/klogd.service |  13 ++
 .../sysklogd/files/syslogd.service                 |  14 ++
 .../sysklogd/files/tmpfiles.sysklogd.conf          |   1 +
 meta/recipes-extended/sysklogd/sysklogd.inc        |  21 +-
 .../{sysstat_11.4.0.bb => sysstat_11.5.3.bb}       |   4 +-
 meta/recipes-graphics/drm/libdrm_2.4.74.bb         |   8 +-
 meta/recipes-graphics/wayland/wayland_1.12.0.bb    |  11 +-
 ...-ARM-Fix-add_buffer_phys_virt-align-issue.patch |  52 +++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |   1 +
 .../linux-firmware/linux-firmware_git.bb           | 186 ++++++++----------
 ...1c7962-that-brings-2-increase-of-build-ti.patch |  56 ------
 meta/recipes-support/sqlite/sqlite3_3.15.2.bb      |  12 --
 meta/recipes-support/sqlite/sqlite3_3.16.2.bb      |  11 ++
 scripts/contrib/python/generate-manifest-3.5.py    |   2 +-
 scripts/lib/wic/canned-wks/mkgummidisk.wks         |  11 --
 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks        |   6 -
 scripts/lib/wic/imager/direct.py                   |   4 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  49 -----
 scripts/lib/wic/utils/oe/misc.py                   |  32 ++-
 scripts/oe-selftest                                |  14 +-
 scripts/runqemu                                    |   9 +-
 scripts/tiny/ksize.py                              |  17 +-
 scripts/tiny/ksum.py                               | 168 ++++++++++++++++
 107 files changed, 1683 insertions(+), 1007 deletions(-)
 delete mode 100644 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py
 create mode 100644 meta-yocto-bsp/wic/beaglebone.wks
 create mode 100644 meta-yocto-bsp/wic/edgerouter.wks
 create mode 100644 meta-yocto-bsp/wic/genericx86.wks
 create mode 100644 meta-yocto-bsp/wic/mpc8315e-rdb.wks
 delete mode 100644 meta/classes/gummiboot.bbclass
 create mode 100644 meta/classes/rm_work_and_downloads.bbclass
 create mode 100644 meta/lib/oeqa/selftest/image_typedep.py
 create mode 100644 meta/lib/rootfspostcommands.py
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot_git.bb
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-4.3.0-musl.patch
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/iproute2-4.9.0-musl.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_4.7.0.bb => iproute2_4.9.0.bb} (61%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.26/0001-local.mk-fix-cross-compiling-problem.patch
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/0001-uname-report-processor-and-hardware-correctly.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/disable-ls-output-quoting.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/fix-selinux-flask.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/man-decouple-manpages-from-build.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.25.bb => coreutils_8.26.bb} (93%)
 rename meta/recipes-core/dbus/{dbus-test_1.10.10.bb => dbus-test_1.10.14.bb} (93%)
 rename meta/recipes-core/dbus/{dbus_1.10.10.bb => dbus_1.10.14.bb} (98%)
 create mode 100644 meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaster.txt
 delete mode 100644 meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
 create mode 100644 meta/recipes-devtools/flex/flex/crosscompile.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
 rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.2.bb} (84%)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/status-conffile.patch
 rename meta/recipes-devtools/opkg/{opkg_0.3.3.bb => opkg_0.3.4.bb} (87%)
 rename meta/recipes-devtools/systemd-bootchart/{systemd-bootchart_230.bb => systemd-bootchart_231.bb} (92%)
 rename meta/recipes-extended/grep/{grep_2.26.bb => grep_2.27.bb} (88%)
 create mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
 create mode 100644 meta/recipes-extended/sysklogd/files/syslogd.service
 create mode 100644 meta/recipes-extended/sysklogd/files/tmpfiles.sysklogd.conf
 rename meta/recipes-extended/sysstat/{sysstat_11.4.0.bb => sysstat_11.5.3.bb} (53%)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
 delete mode 100644 meta/recipes-support/sqlite/files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.15.2.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.16.2.bb
 delete mode 100644 scripts/lib/wic/canned-wks/mkgummidisk.wks
 delete mode 100644 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks
 create mode 100755 scripts/tiny/ksum.py

Alejandro Hernandez (3):
  gummiboot: Remove gummiboot tests
  gummiboot: Remove old gummiboot recipe, related class and wks file
  systemd-boot.bbclass: Fix SYSYTEMD_BOOT_CFG creation

Alejandro del Castillo (2):
  opkg: upgrade to v0.3.4
  opkg-utils: bump SRCREV to 0.3.4 tag

Alistair Francis (1):
  runqemu: Allow the user to specity no kernel or rootFS

Amarnath Valluri (2):
  kernel: Modify kernel modules installation path.
  linux-firmware: Modify firmware installation path

Andre McCurdy (1):
  wayland: minor recipe cleanup

Andreas Müller (1):
  python3-pygobject: add PACKAGECONFIG for cairo - enabled by default

André Draszik (2):
  lib/oe/rootfs: reliably handle alternative symlinks
  opkg-utils: use D instead of OPKG_OFFLINE_ROOT in postrm

Chen Qi (9):
  systemd-bootchart: upgrade to 231
  dbus/dbus-test: upgrade to 1.10.14
  sysstat: upgrade to 11.5.3
  grep: upgrade to 2.27
  coreutils: upgrade to 8.26
  selftest/eSDK.py: fix sstate dir not found error
  selftest/bbtests.py: fix path assumption for LICENSE_DIRECTORY
  selftest/buildoptions.py: fix path assumption for DEPLOY_DIR_SRC
  scripts/oe-selftest: fix typo

Christoph Settgast (1):
  libdrm: enable etnaviv experimental support

Derek Straka (1):
  python-3.5-manifest: Add http module to the netclient package

Ed Bartosh (11):
  image_types.bbclass: look for wks files in <layer>/wic
  beaglebone: add beaglebone.wks
  wic: fix parsing of 'bitbake -e' output
  canned-wks: remove mpc8315e-rdb.wks
  direct.py: fix getting image name
  wic: _exec_cmd: produce error if exit code is not 0
  mpc8315e-rdb.conf: produce wic images for MPC8315
  genericx86: add genericx86.wks
  edgerouter: add edgerouter.wks
  README.hardware: update MPC8315E-RDB section
  mpc8315e-rdb: move wks file to wic/ directory

Haiqing Bai (1):
  kexec: ARM: fix align issue of add_buffer_phys_virt() for LPAE kernel

Ioan-Adrian Ratiu (1):
  wic/isoimage-isohybrid: remove do_stage_partition()

Jose Perez Carranza (1):
  runtime: Add cleanup for logrotate tests

Juro Bystricky (1):
  build-appliance-image: support for Toaster

Khem Raj (2):
  musl: Upgrade to 1.1.16+ on master
  grub-git: Upgrade to tip of master and fix with glibc 2.25

Leonardo Sandoval (3):
  recipes-test: exclude recipes from world target
  selftest: devtool: use distro agnostic recipes for devtool checks
  selftest: runtime-test: skip image-install test for poky-tiny

Linus Wallgren (1):
  apt-package: Include maintenance scripts

Mark Asselstine (1):
  sysklogd: do more to properly work with systemd

Markus Lehtonen (10):
  oeqa.utils.metadata: re-organise host distro information
  oeqa.utils.metadata: re-organise distro information
  oeqa.utils.metadata: drop 'unknown' git data elements
  oeqa.utils.metadata: fix retrieval of git branch and revision
  oeqa.utils.metadata: rename 'revision' to 'commit'
  oeqa.utils.metadata: add commit count information
  oeqa.utils.metadata: have layer name as an attribute in xml
  oeqa.utils.metadata: add bitbake revision information
  oeqa.utils.metadata: allow storing any bitbake config variables
  oeqa.utils.metadata: include BB_NUMBER_THREADS and PARALLEL_MAKE

Maxin B. John (1):
  sqlite3: upgrade to 3.16.2

Ola x Nilsson (2):
  externalsrc.bbclass: Add task buildclean
  oe-selftest: devtool: Add test for externalsrc buildclean

Patrick Ohly (8):
  recipes: anonymous functions with priorities
  build.py: add preceedtask() API
  runqueue.py: alternative rm_work scheduler
  gcc-source.inc: cleanly disable do_rm_work
  rm_work_and_downloads.bbclass: more aggressively minimize disk usage
  rm_work.bbclass: clean up sooner
  rootfs-postcommands.bbclass: sort passwd entries
  insane.bbclass: print license text as part of QA message

Randy Witt (2):
  image_typedep.py: Add a test that ensures conversion type deps get
    added
  image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types

Ross Burton (9):
  linux-firmware: remove alternatives for brcmfmac-stdio.bin
  opkg-utils: set CLEANBROKEN as upstream Makefile doesn't have clean
    target
  flex: upgrade to 2.6.2
  opkg: fix conffile errors in 'opkg status' calls
  rootfs: don't put /usr/lib/ssl and /etc into debugfs
  selftest/archiver: don't build an image for a basic test
  grub_git: remove redundant inherits
  selftest/bblayers: don't fetch a variable that is never used
  selftest/base: don't fetch DISTRO variable in constructor

Saul Wold (1):
  nfs-utils: remove -f exports from nfsserver

Tom Zanussi (1):
  scripts: python3 fixes and new tool ksum

Zheng Ruoqin (1):
  iproute2 4.7->4.9

 README.hardware                                    |  69 +++++++
 bitbake/lib/bb/build.py                            |  16 ++
 bitbake/lib/bb/data_smart.py                       |   3 +
 bitbake/lib/bb/parse/ast.py                        |  19 +-
 bitbake/lib/bb/runqueue.py                         | 107 +++++++++++
 .../recipes-test/aspell/aspell_0.0.0.1.bb          |   2 +
 .../recipes-test/devtool/devtool-test-localonly.bb |   1 +
 .../recipes-test/devtool/devtool-test-patch-gz.bb  |   1 +
 .../recipes-test/devtool/devtool-test-subdir.bb    |   2 +
 .../devtool/devtool-upgrade-test1_1.5.3.bb         |   2 +
 .../devtool-upgrade-test1_1.5.3.bb.upgraded        |   2 +
 .../devtool/devtool-upgrade-test2_git.bb           |   2 +
 .../devtool/devtool-upgrade-test2_git.bb.upgraded  |   2 +
 .../recipetool/selftest-recipetool-appendfile.bb   |   2 +
 meta-yocto-bsp/conf/machine/beaglebone.conf        |   2 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf        |   2 +-
 .../conf/machine/include/genericx86-common.inc     |   2 +-
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |   4 +
 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py      |  83 --------
 meta-yocto-bsp/wic/beaglebone.wks                  |   6 +
 meta-yocto-bsp/wic/edgerouter.wks                  |   4 +
 meta-yocto-bsp/wic/genericx86.wks                  |   7 +
 .../wic}/mpc8315e-rdb.wks                          |   6 +-
 meta/classes/externalsrc.bbclass                   |  19 +-
 meta/classes/gummiboot.bbclass                     | 121 ------------
 meta/classes/image_types.bbclass                   |  16 +-
 meta/classes/insane.bbclass                        |  29 +++
 meta/classes/kernel-module-split.bbclass           |   2 +-
 meta/classes/kernel.bbclass                        |  12 +-
 meta/classes/rm_work.bbclass                       |  31 +--
 meta/classes/rm_work_and_downloads.bbclass         |  33 ++++
 meta/classes/rootfs-postcommands.bbclass           |  22 +++
 meta/classes/systemd-boot.bbclass                  |   3 +
 meta/lib/oe/rootfs.py                              |   9 +-
 meta/lib/oeqa/runtime/logrotate.py                 |   1 +
 meta/lib/oeqa/selftest/archiver.py                 |  22 +--
 meta/lib/oeqa/selftest/base.py                     |   1 -
 meta/lib/oeqa/selftest/bblayers.py                 |   1 -
 meta/lib/oeqa/selftest/bbtests.py                  |   5 +-
 meta/lib/oeqa/selftest/buildoptions.py             |   5 +-
 meta/lib/oeqa/selftest/devtool.py                  |  65 ++++++-
 meta/lib/oeqa/selftest/eSDK.py                     |   2 +-
 meta/lib/oeqa/selftest/image_typedep.py            |  51 +++++
 meta/lib/oeqa/selftest/runtime-test.py             |   2 +
 meta/lib/oeqa/utils/metadata.py                    |  87 ++++++---
 meta/lib/rootfspostcommands.py                     |  44 +++++
 meta/recipes-bsp/grub/grub_git.bb                  |   4 +-
 ...-C-syntax-errors-for-function-declaration.patch |  74 -------
 .../gummiboot/gummiboot/fix-objcopy.patch          |  45 -----
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  39 ----
 ...-4.3.0-musl.patch => iproute2-4.9.0-musl.patch} |  90 ++++++---
 .../{iproute2_4.7.0.bb => iproute2_4.9.0.bb}       |   7 +-
 .../nfs-utils/nfs-utils/nfsserver                  |   2 +-
 ...need_charset_alias-when-building-for-musl.patch |   0
 ...0001-local.mk-fix-cross-compiling-problem.patch |  26 +++
 ...e-report-processor-and-hardware-correctly.patch |   0
 .../disable-ls-output-quoting.patch                |   0
 .../fix-selinux-flask.patch                        |   0
 .../man-decouple-manpages-from-build.patch         |   0
 .../remove-usr-local-lib-from-m4.patch             |   0
 .../{coreutils_8.25.bb => coreutils_8.26.bb}       |   9 +-
 .../{dbus-test_1.10.10.bb => dbus-test_1.10.14.bb} |   4 +-
 .../dbus/{dbus_1.10.10.bb => dbus_1.10.14.bb}      |   4 +-
 .../README_VirtualBox_Toaster.txt                  |  78 ++++++++
 .../images/build-appliance-image_15.0.0.bb         |  18 +-
 meta/recipes-core/musl/musl_git.bb                 |   4 +-
 meta/recipes-devtools/apt/apt-package.inc          |  15 +-
 ...oid-c-comments-in-c-code-fails-with-gcc-6.patch |  64 ------
 .../recipes-devtools/flex/flex/CVE-2016-6354.patch |  59 ------
 meta/recipes-devtools/flex/flex/crosscompile.patch | 214 +++++++++++++++++++++
 .../flex/flex/do_not_create_pdf_doc.patch          |  17 --
 .../flex/{flex_2.6.0.bb => flex_2.6.2.bb}          |  11 +-
 meta/recipes-devtools/gcc/gcc-source.inc           |   2 +-
 ...e-defined-bindir-and-mandir-as-installati.patch |  30 +++
 .../opkg-utils/opkg-utils/tar_ignore_error.patch   |   2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  13 +-
 ...reate-opkg.lock-in-run-instead-of-var-run.patch |   8 +-
 .../opkg/opkg/status-conffile.patch                |  69 +++++++
 .../opkg/{opkg_0.3.3.bb => opkg_0.3.4.bb}          |   7 +-
 .../python/python-3.5-manifest.inc                 |   2 +-
 .../python/python3-pygobject_3.22.0.bb             |  10 +-
 ...d-bootchart_230.bb => systemd-bootchart_231.bb} |   4 +-
 .../grep/{grep_2.26.bb => grep_2.27.bb}            |   4 +-
 meta/recipes-extended/sysklogd/files/klogd.service |  13 ++
 .../sysklogd/files/syslogd.service                 |  14 ++
 .../sysklogd/files/tmpfiles.sysklogd.conf          |   1 +
 meta/recipes-extended/sysklogd/sysklogd.inc        |  21 +-
 .../{sysstat_11.4.0.bb => sysstat_11.5.3.bb}       |   4 +-
 meta/recipes-graphics/drm/libdrm_2.4.74.bb         |   8 +-
 meta/recipes-graphics/wayland/wayland_1.12.0.bb    |  11 +-
 ...-ARM-Fix-add_buffer_phys_virt-align-issue.patch |  52 +++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |   1 +
 .../linux-firmware/linux-firmware_git.bb           | 186 ++++++++----------
 ...1c7962-that-brings-2-increase-of-build-ti.patch |  56 ------
 meta/recipes-support/sqlite/sqlite3_3.15.2.bb      |  12 --
 meta/recipes-support/sqlite/sqlite3_3.16.2.bb      |  11 ++
 scripts/contrib/python/generate-manifest-3.5.py    |   2 +-
 scripts/lib/wic/canned-wks/mkgummidisk.wks         |  11 --
 scripts/lib/wic/imager/direct.py                   |   4 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  49 -----
 scripts/lib/wic/utils/oe/misc.py                   |  32 ++-
 scripts/oe-selftest                                |  14 +-
 scripts/runqemu                                    |   9 +-
 scripts/tiny/ksize.py                              |  17 +-
 scripts/tiny/ksum.py                               | 168 ++++++++++++++++
 105 files changed, 1618 insertions(+), 942 deletions(-)
 delete mode 100644 meta-yocto-bsp/lib/oeqa/selftest/gummiboot.py
 create mode 100644 meta-yocto-bsp/wic/beaglebone.wks
 create mode 100644 meta-yocto-bsp/wic/edgerouter.wks
 create mode 100644 meta-yocto-bsp/wic/genericx86.wks
 rename {scripts/lib/wic/canned-wks => meta-yocto-bsp/wic}/mpc8315e-rdb.wks (45%)
 delete mode 100644 meta/classes/gummiboot.bbclass
 create mode 100644 meta/classes/rm_work_and_downloads.bbclass
 create mode 100644 meta/lib/oeqa/selftest/image_typedep.py
 create mode 100644 meta/lib/rootfspostcommands.py
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch
 delete mode 100644 meta/recipes-bsp/gummiboot/gummiboot_git.bb
 rename meta/recipes-connectivity/iproute2/iproute2/{iproute2-4.3.0-musl.patch => iproute2-4.9.0-musl.patch} (42%)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.7.0.bb => iproute2_4.9.0.bb} (61%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.26/0001-local.mk-fix-cross-compiling-problem.patch
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/0001-uname-report-processor-and-hardware-correctly.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/disable-ls-output-quoting.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/fix-selinux-flask.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/man-decouple-manpages-from-build.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.25 => coreutils-8.26}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.25.bb => coreutils_8.26.bb} (93%)
 rename meta/recipes-core/dbus/{dbus-test_1.10.10.bb => dbus-test_1.10.14.bb} (93%)
 rename meta/recipes-core/dbus/{dbus_1.10.10.bb => dbus_1.10.14.bb} (98%)
 create mode 100644 meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaster.txt
 delete mode 100644 meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
 create mode 100644 meta/recipes-devtools/flex/flex/crosscompile.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
 rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.2.bb} (84%)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/status-conffile.patch
 rename meta/recipes-devtools/opkg/{opkg_0.3.3.bb => opkg_0.3.4.bb} (87%)
 rename meta/recipes-devtools/systemd-bootchart/{systemd-bootchart_230.bb => systemd-bootchart_231.bb} (92%)
 rename meta/recipes-extended/grep/{grep_2.26.bb => grep_2.27.bb} (88%)
 create mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
 create mode 100644 meta/recipes-extended/sysklogd/files/syslogd.service
 create mode 100644 meta/recipes-extended/sysklogd/files/tmpfiles.sysklogd.conf
 rename meta/recipes-extended/sysstat/{sysstat_11.4.0.bb => sysstat_11.5.3.bb} (53%)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
 delete mode 100644 meta/recipes-support/sqlite/files/0001-revert-ad601c7962-that-brings-2-increase-of-build-ti.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.15.2.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.16.2.bb
 delete mode 100644 scripts/lib/wic/canned-wks/mkgummidisk.wks
 create mode 100755 scripts/tiny/ksum.py

-- 
2.8.1


