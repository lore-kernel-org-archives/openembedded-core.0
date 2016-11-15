Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB9765C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 16:30:00 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id 3so68432334pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 08:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zsg9QxBsK9JolIfpwiyEe2AzPTsn/GaZOGgWSsztpqQ=;
	b=0DA82zdOUa94NXrTnouMG38kg5QkL1s2PVJiMpXn+rRVU/MATgWCaPyQU+/x9Z1XIM
	B00U30Zw0jYUFem0IP9fLx84L/GQDdcLGw2wqv00WTCIxZ7HEu2Dwd8IAPb3r9noc8PU
	2IVOHWXgcObnUbOUJ9tKVA/WBrqumizZyxmAn8TvolQ7nwTF+yX5/wVjAjHe4yCnjOKu
	3gyHDvQiMBdpMwkfYh8YOfxF8O7R0LtUdrDNPWiGz56Pk+4j5x2HLis1FpOn6Ju4tqR3
	o6jf0EgC3/NU4dCIf4ikxz97H1AtO9GUKV7r6ZbOpaPHcDy9/Uo8t+c7T5SYgbYwt0sd
	rjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zsg9QxBsK9JolIfpwiyEe2AzPTsn/GaZOGgWSsztpqQ=;
	b=BEMxayaL8eagEa3AAfjEutARPNR+6bxDxofpvpvMeusdhgVgKPDHDAW9shb07tWTqw
	kyvRMz8410mV0Yfcl539kDdbHrupZc99/3rOmelBaH6erFLePMouU14eYr7XXyXUQfqi
	Qj9Hc4o9ilhjZasJJGrR756Uugif0xr4On2p8u1obkOE3RpQNvrz8uNJPVeoyJyfD+XG
	PxrSE+zJSMT8IfYzXpEC2cunRXSJyIPCeJirBjKENsqblZ/Amw+y6Dw0clK6HmXGMwxM
	CQgC7zdE2Tq01gM0djmkPfUCEt3yLeKffMxQPAoj8EQI37sGsYAZzPcpKcIxBSoB72XO
	Rv9A==
X-Gm-Message-State: ABUngvewyjHscAX1j7l3HESth2CP+tclooGNN0VUsuBL7iw1pdkJvSDdgGOFe6y5NXzeOg==
X-Received: by 10.98.219.5 with SMTP id f5mr48849488pfg.131.1479227402208;
	Tue, 15 Nov 2016 08:30:02 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:4df7:42c0:6403:eac6])
	by smtp.gmail.com with ESMTPSA id
	t89sm42248261pfe.50.2016.11.15.08.30.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Nov 2016 08:30:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 08:29:12 -0800
Message-Id: <cover.1479227001.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/45] Morty: Patch set review
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
X-List-Received-Date: Tue, 15 Nov 2016 16:30:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sending cover leter only:

I have pulled together a set of patches which seem to be appropriate for Morty.
Please review to see if a commit is inappropriate or missing.


The following changes since commit 6c9f6b5f70ab3ee194b2c2c6f3bd462c994848fa:

  bitbake: toaster: buildinfohelper Handle regex paths (2016-11-03 17:41:15 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/morty-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/morty-next

Alexander Kanavin (8):
  lttng-tools: do not install shared libraries in ptest package
  gnome-desktop3: fix dependencies
  webkitgtk: remove lib_package inherit as executables are now installed
    in libexecdir
  rt-tests: fix the recipe version to match upstream
  epiphany: remove unnecessary libwnck3 dependency
  libwnck3: remove the recipe
  libarchive: update to 3.2.2
  valgrind: update to 3.12.0

Andre McCurdy (1):
  gdb: update 7.11+git1a982b689c -> 7.11.1

André Draszik (2):
  boost: disable 'wave' in MIPS16e mode
  bash_3.2.x: update recipe version to match what we're shipping

Armin Kuster (2):
  tzcode-native: update to 2016h
  tzdata: Update to 2016h

Chen Qi (2):
  rpm: fix file location of rpm2cpio.real
  systemd: CVE-2016-7795

Dengke Du (1):
  subversion: fix "svnadmin create" fail on x86

Dmitry Rozhkov (1):
  openssl: rehash actual mozilla certificates inside rootfs

George McCollister (1):
  uboot-sign: fix do_concat_dtb for .img, .rom

Juro Bystricky (1):
  build-appliance-image: Fix incorrect PATH

Kai Kang (2):
  qemu: supplementary fix of CVE-2016-5403
  qemu: fix CVE-2016-7423 and CVE-2016-7908

Khem Raj (1):
  binutils-2.27: Fix linker segfaults when linking binary files

Lukasz Nowak (1):
  connman: fix bad file descriptor initialisation

Markus Lehtonen (1):
  python: fix python-tests rdepends

Mike Looijmans (1):
  busybox/mdev.conf: Ignore eMMC RPMB and boot block devices

Olaf Mandel (1):
  texi2html: Allow compiling out-of-source

Paul Eggleton (5):
  classes/license: fix handling of symlinks pointed to in
    LIC_FILES_CHKSUM
  classes/populate_sdk_base: fix usage of & character in SDK_TITLE
  classes/nativesdk: set SDK_OLDEST_KERNEL appropriately
  oe-setup-builddir: fix TEMPLATECONF error message
  classes/populate_sdk_ext: prevent invalid TEMPLATECONF entering eSDK

Robert P. J. Day (2):
  testsdk.bbclass: Clean up comments, clarify image choices.
  oe-pkgdata-util: Use standard verb form in help info.

Robert Yang (2):
  oe/copy_buildsystem.py: dereference symlink
  insane.bbclass:buildpaths: open() file with 'rb'

Ross Burton (4):
  slang: add PREMIRRORS to handle upstream moving tarballs
  slang: clean up options and dependencies
  util-linux: add su.1 to update-alternatives
  shadow: add nologin.8 to alternatives

Samuli Piippo (1):
  package_manager.py: correctly remove all dependent packages

Yi Zhao (5):
  tiff: Security fix CVE-2016-3945
  tiff: Security fix CVE-2016-3990
  tiff: Security fix CVE-2016-3991
  tiff: Security fix CVE-2016-3623
  tiff: Security fix CVE-2016-3622

 meta/classes/insane.bbclass                        |   4 +-
 meta/classes/license.bbclass                       |   2 +
 meta/classes/nativesdk.bbclass                     |   2 +
 meta/classes/populate_sdk_base.bbclass             |   7 +-
 meta/classes/populate_sdk_ext.bbclass              |   6 +-
 meta/classes/testsdk.bbclass                       |  14 +-
 meta/classes/uboot-sign.bbclass                    |   4 +-
 meta/conf/bitbake.conf                             |   5 +
 meta/conf/machine-sdk/i586.conf                    |   1 +
 meta/conf/machine-sdk/i686.conf                    |   1 +
 meta/conf/machine-sdk/x86_64.conf                  |   1 +
 meta/lib/oe/copy_buildsystem.py                    |   6 +-
 meta/lib/oe/package_manager.py                     |   2 +-
 ...ts-Fix-bad-file-descriptor-initialisation.patch | 102 ++++++++++++++
 meta/recipes-connectivity/connman/connman_1.33.bb  |   1 +
 .../openssl/openssl/openssl-c_rehash.sh            |  20 ++-
 meta/recipes-core/busybox/files/mdev.conf          |   2 +
 .../images/build-appliance-image_15.0.0.bb         |   2 +-
 .../systemd/systemd/CVE-2016-7795.patch            |  69 ++++++++++
 meta/recipes-core/systemd/systemd_230.bb           |   1 +
 meta/recipes-core/util-linux/util-linux.inc        |   8 +-
 meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
 ...lt-in-ARM-linker-when-trying-to-parse-a-b.patch |  31 +++++
 meta/recipes-devtools/gdb/gdb-7.11.1.inc           |  22 +++
 meta/recipes-devtools/gdb/gdb-7.11.inc             |   9 --
 meta/recipes-devtools/gdb/gdb-common.inc           |  24 ----
 ...nadian_7.11.bb => gdb-cross-canadian_7.11.1.bb} |   0
 .../gdb/{gdb-cross_7.11.bb => gdb-cross_7.11.1.bb} |   0
 .../gdb/{gdb_7.11.bb => gdb_7.11.1.bb}             |   0
 .../python/python-2.7-manifest.inc                 |   2 +-
 ...0001-virtio-zero-vq-inuse-in-virtio_reset.patch |  57 ++++++++
 .../qemu/qemu/0002-fix-CVE-2016-7423.patch         |  45 +++++++
 .../qemu/qemu/0003-fix-CVE-2016-7908.patch         |  62 +++++++++
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |   3 +
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |   2 +-
 .../0001-fix-svnadmin-create-fail-on-x86.patch     |  56 ++++++++
 .../subversion/subversion_1.9.4.bb                 |   1 +
 .../valgrind/valgrind/11_mips-link-tool.patch      |  37 ------
 .../valgrind/valgrind/gcc5-port.patch              |  64 ---------
 .../{valgrind_3.11.0.bb => valgrind_3.12.0.bb}     |   6 +-
 .../{bash-3.2.48 => bash-3.2.57}/build-tests.patch |   0
 ...ont-include-target-CFLAGS-in-host-LDFLAGS.patch |   0
 .../mkbuiltins_have_stringize.patch                |   0
 .../bash/{bash-3.2.48 => bash-3.2.57}/run-ptest    |   0
 .../string-format.patch                            |   0
 .../{bash-3.2.48 => bash-3.2.57}/test-output.patch |   0
 meta/recipes-extended/bash/bash_3.2.48.bb          |  47 -------
 meta/recipes-extended/bash/bash_3.2.57.bb          |  18 +++
 .../{libarchive_3.2.1.bb => libarchive_3.2.2.bb}   |   4 +-
 meta/recipes-extended/shadow/shadow.inc            |   3 +-
 meta/recipes-extended/slang/slang/no-x.patch       |  14 ++
 meta/recipes-extended/slang/slang_2.3.0.bb         |  16 ++-
 .../files/0001-Allow-compiling-out-of-source.patch |  39 ++++++
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |   1 +
 ...code-native_2016g.bb => tzcode-native_2016h.bb} |   8 +-
 .../tzdata/{tzdata_2016g.bb => tzdata_2016h.bb}    |   4 +-
 meta/recipes-gnome/epiphany/epiphany_3.20.3.bb     |   4 +-
 .../gnome-desktop/gnome-desktop3_3.20.2.bb         |   2 +-
 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb      |  19 ---
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |   3 +
 .../libtiff/files/CVE-2016-3622.patch              | 129 ++++++++++++++++++
 .../libtiff/files/CVE-2016-3623.patch              |  52 ++++++++
 .../libtiff/files/CVE-2016-3945.patch              | 118 +++++++++++++++++
 .../libtiff/files/CVE-2016-3990.patch              |  66 +++++++++
 .../libtiff/files/CVE-2016-3991.patch              | 147 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   5 +
 .../{hwlatdetect_2.0.bb => hwlatdetect_1.1.bb}     |   0
 meta/recipes-rt/rt-tests/rt-tests.inc              |   5 +-
 .../rt-tests/{rt-tests_2.0.bb => rt-tests_1.1.bb}  |   0
 meta/recipes-sato/webkit/webkitgtk_2.12.5.bb       |   2 +-
 meta/recipes-support/boost/boost.inc               |   2 +
 scripts/oe-pkgdata-util                            |   2 +-
 scripts/oe-setup-builddir                          |   2 +-
 73 files changed, 1138 insertions(+), 256 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0003-stats-Fix-bad-file-descriptor-initialisation.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2016-7795.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb-7.11.1.inc
 delete mode 100644 meta/recipes-devtools/gdb/gdb-7.11.inc
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.11.bb => gdb-cross-canadian_7.11.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.11.bb => gdb-cross_7.11.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.11.bb => gdb_7.11.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in-virtio_reset.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/0001-fix-svnadmin-create-fail-on-x86.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/gcc5-port.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.11.0.bb => valgrind_3.12.0.bb} (95%)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/build-tests.patch (100%)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/dont-include-target-CFLAGS-in-host-LDFLAGS.patch (100%)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/mkbuiltins_have_stringize.patch (100%)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/run-ptest (100%)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/string-format.patch (100%)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/test-output.patch (100%)
 delete mode 100644 meta/recipes-extended/bash/bash_3.2.48.bb
 create mode 100644 meta/recipes-extended/bash/bash_3.2.57.bb
 rename meta/recipes-extended/libarchive/{libarchive_3.2.1.bb => libarchive_3.2.2.bb} (94%)
 create mode 100644 meta/recipes-extended/slang/slang/no-x.patch
 create mode 100644 meta/recipes-extended/texi2html/files/0001-Allow-compiling-out-of-source.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2016g.bb => tzcode-native_2016h.bb} (69%)
 rename meta/recipes-extended/tzdata/{tzdata_2016g.bb => tzdata_2016h.bb} (98%)
 delete mode 100644 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_2.0.bb => hwlatdetect_1.1.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_2.0.bb => rt-tests_1.1.bb} (100%)

-- 
2.3.5


