Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id AC70877794
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 13:33:11 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id r103so135356795wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 06:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BBNICewTUObjmxpgeLctSDJApr6lVMeGevMX1iJkTZU=;
	b=TQVDBAfUKosmnzq45gHEiBL+EWYbqrRqHEQxZ4ELuqjxehMxu5yarD2JbuUktsF5FR
	ZmMYHSWsTuca0YMNa8Pye0WdWBXjlD+W/h20U1thgC/LKUzIwhfJ78pSK9YXpVPq6+Rn
	Iz0FDdzURISU8jc2q03Gawjv3ThswLml7akFaNTRqbslJu0MGUViVycV0IHsdgeyC+JS
	IlETYE4BJJNraTGV+r193aYVDZcrKo6zUdai0vsetYgJv3gUtdXj3lJI6h7niweGiGp0
	bVwbO40f+QGkY4AUKPM8T9ePCGsSaRgKqUv/zTaIVMv46Rd6w8RvRlXv4QMWpNkAPDcG
	e5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BBNICewTUObjmxpgeLctSDJApr6lVMeGevMX1iJkTZU=;
	b=ayeCbBZhYsohfymHG36g23pYpz4IIP+RGHNhhuxKVsNDAIhDI+7W8ZyiiuEQ6HJxVI
	FyGfvBvEUaihg2vRxLCUQGJCgezy2ouvivaajm9T9pxnju+65lPrxTAt/mvJvtXY1+Yl
	/JdNh0wvfdR3YANmtKP62ebG+erxJGwI0Gajm9UyLKYBVjmCJLRPwPFnaTypBE97fdrb
	lvD1GPyEG6L3xUhmB7IO2qTsmBu5NL67/4npwPvhzQ9pD75D460vqMXkpU2hX5YeqG7d
	e+2Kuv9l4I7zMPvjbRWqBsNNfe3+pSzjGEQSFbMSM8rftHhszh/xKj0c7VbVE5cD8qqi
	bZiw==
X-Gm-Message-State: AKS2vOzoYDLMWGfG7jNbth9FwMMIPjbWQUtNMTne0x+8KayvUkiHd/c0
	WbSQsGw6Ah3NXjy6NRk=
X-Received: by 10.28.16.12 with SMTP id 12mr6763984wmq.9.1498051991654;
	Wed, 21 Jun 2017 06:33:11 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l70sm14159413wmd.3.2017.06.21.06.33.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Jun 2017 06:33:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jun 2017 14:33:08 +0100
Message-Id: <cover.1498051930.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 00/48] Consolidated pull
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
X-List-Received-Date: Wed, 21 Jun 2017 13:33:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Almost fifty patches for oe-core/bitbake/meta-poky, all green on the autobuilder.

Ross

The following changes since commit d5d9a80a4ffca55721993d366e80538132b75960:

  bitbake: fetch: fix handling of files with incorrect checksums from a premirror (2017-06-16 10:58:28 +0100)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 6b0cd011fd331bd7de301134fabb8c3e9a7e8dc1:

  gobject-introspection: Disable generating static lbraries (2017-06-21 14:11:06 +0100)

----------------------------------------------------------------
Andrej Valek (7):
      libxml2: Disable LeakSanitizer when running API tests
      libxml2: Avoid reparsing and simplify control flow in xmlParseStartTag2
      libxml2: Fix CVE-2017-9047 and CVE-2017-9048
      libxml2: Fix CVE-2017-9049 and CVE-2017-9050
      libxml2: Fix CVE-2017-5969
      libxml2: Fix CVE-2017-0663
      libxml2: Revert "Add an XML_PARSE_NOXXE flag to block all entities loading even local"

Aníbal Limón (3):
      oeqa/core/threaded: Don't assume that results exists on logDetails
      oeqa/core/loader.py: Fix _make_failed_test for python >= 3.4.4
      oeqa/selftest/context: Reload testlayer_path when meta-selftest isn't added

Denys Dmytriyenko (1):
      util-linux: upgrade to 2.30

Ed Bartosh (5):
      buildhistory-diff: exclude paths from the output
      wic: flatten directory structure
      wic: code cleanup
      wic: fix restoring of original fstab
      wic/runner.py: move runtool API to misc.py

Huang Qiyu (1):
      libnewt: 0.52.19 -> 0.52.20

Jair Gonzalez (3):
      bitbake: event: remove mapping for deleted event handlers
      bitbake: tests: create unit tests for event module
      bitbake: selftest: add bb.tests.event to bitbake-selftest

Jan Kiszka (1):
      tzdata: Install zone1970.tab

Jean-Francois Dagenais (1):
      wic: remove extra double-quote on documentation string

Joe Slater (2):
      ghostscript: move to version 9.21
      ghostscript: add X11 PACKAGECONFIG info

Jose Perez Carranza (2):
      selftest: Add Testopia ID to test cases
      oeqa/selftest/systemdboot: Add Test to check boot file is created correctly

Khem Raj (4):
      ffmpeg: Upgrade to 3.3.2 stable
      zlib: Pass pre-calculate uname enable re-entrant flags
      webkitgtk: Upgrade to 2.16.3
      gobject-introspection: Disable generating static lbraries

Leonardo Sandoval (2):
      scripts/contrib/patchtest: run patchtest on local branch
      oeqa/context: allow test execution with buildhistory unless version-going-backwards is present

Marc Ferland (2):
      bluez5: remove libusb dependency
      bluez5: add more PACKAGECONFIG options

Martin Jansa (1):
      sstate-sysroot-cruft.sh: Extend the whitelist

Martin Kelly (1):
      qemuboot.conf: make cpus match built artifacts

Ming Liu (1):
      core-image-sato: drop packagegroup-core-x11-sato-games from IMAGE_INSTALL

Nathan Rossi (1):
      kernel-uimage.bbclass: Fix up generation of uImage from vmlinux

Patrick Ohly (1):
      bblayers sanity: bblayers.conf.sample specific update code

Peter Kjellerstedt (5):
      oe-pkgdata-util: package-info: Allow extra variables to be displayed
      insane.bbclass: Ignore perl as dependency for nativesdk packages
      linux-firmware: Avoid a dependency on python-core
      texi2html: Add a dependency on perl
      git: Add a dependency on perl for gitweb

Petter Mabäcker (1):
      multilib.bbclass: fix faulty redefinition of STAGING_KERNEL_DIR

Ross Burton (2):
      conf/maintainers: update for revised maintainership
      libpcap: apply fix from upstream to fix build race

Yeoh Ee Peng (1):
      selftest/devtool: replace file assertTrue/False with assertExists/NotExists

 bitbake/bin/bitbake-selftest                       |   1 +
 bitbake/lib/bb/event.py                            |   6 +-
 bitbake/lib/bb/tests/event.py                      | 377 +++++++++++++
 meta-poky/conf/distro/include/maintainers.inc      | 336 ++++++------
 .../lib/oeqa/selftest/cases/systemd_boot.py        |  54 +-
 meta/classes/insane.bbclass                        |   2 +-
 meta/classes/kernel-uimage.bbclass                 |  26 +-
 meta/classes/multilib.bbclass                      |   4 +-
 meta/classes/sanity.bbclass                        | 121 +----
 meta/conf/lib/bblayers_update/__init__.py          | 104 ++++
 meta/conf/machine/include/qemuboot-x86.inc         |   6 +-
 meta/lib/oe/buildhistory_analysis.py               |  51 +-
 meta/lib/oeqa/core/loader.py                       |  22 +-
 meta/lib/oeqa/core/threaded.py                     |   7 +-
 meta/lib/oeqa/selftest/cases/containerimage.py     |   2 +
 meta/lib/oeqa/selftest/cases/devtool.py            | 138 ++---
 meta/lib/oeqa/selftest/cases/image_typedep.py      |   2 +
 meta/lib/oeqa/selftest/cases/imagefeatures.py      |   1 +
 meta/lib/oeqa/selftest/cases/liboe.py              |   4 +
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py |   4 +
 meta/lib/oeqa/selftest/cases/package.py            |   4 +
 meta/lib/oeqa/selftest/cases/recipetool.py         |   4 +
 meta/lib/oeqa/selftest/cases/runtime_test.py       |   4 +
 meta/lib/oeqa/selftest/cases/sstatetests.py        |   2 +
 meta/lib/oeqa/selftest/cases/tinfoil.py            |   1 +
 meta/lib/oeqa/selftest/cases/wic.py                |  19 +
 meta/lib/oeqa/selftest/context.py                  |   4 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |  30 +-
 meta/recipes-connectivity/bluez5/bluez5_5.45.bb    |   2 +-
 .../libpcap/libpcap/fix-grammar-deps.patch         |  29 +
 meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb |   1 +
 .../libxml/libxml2/CVE-2016-9318.patch             | 207 --------
 .../libxml/libxml2/libxml2-CVE-2017-0663.patch     |  40 ++
 .../libxml/libxml2/libxml2-CVE-2017-5969.patch     |  62 +++
 .../libxml2-CVE-2017-9047_CVE-2017-9048.patch      | 103 ++++
 .../libxml2-CVE-2017-9049_CVE-2017-9050.patch      | 291 ++++++++++
 ...ibxml2-fix_and_simplify_xmlParseStartTag2.patch | 590 +++++++++++++++++++++
 meta/recipes-core/libxml/libxml2/runtest.patch     |  25 +-
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   6 +-
 meta/recipes-core/util-linux/util-linux.inc        |   2 +-
 .../util-linux/uuid-test-error-api.patch           |  99 ----
 .../{util-linux_2.29.2.bb => util-linux_2.30.bb}   |   7 +-
 meta/recipes-core/zlib/zlib_1.2.11.bb              |  12 +-
 meta/recipes-devtools/git/git.inc                  |   2 +-
 .../ghostscript/ghostscript/CVE-2016-10219.patch   |  49 --
 .../ghostscript/ghostscript/CVE-2016-10220.patch   |  55 --
 .../ghostscript/ghostscript/CVE-2016-7978.patch    |  30 --
 .../ghostscript/ghostscript/CVE-2016-7979.patch    |  48 --
 .../ghostscript/ghostscript/CVE-2016-8602.patch    |  47 --
 .../ghostscript/ghostscript/CVE-2017-7975.patch    |  23 +-
 .../ghostscript/avoid-host-contamination.patch     |  19 +
 ...t-9.21-native-fix-disable-system-libtiff.patch} |  22 +-
 ... => ghostscript-9.21-prevent_recompiling.patch} |  25 +-
 .../ghostscript/ghostscript/mkdir-p.patch          |  36 ++
 .../{ghostscript_9.20.bb => ghostscript_9.21.bb}   |  36 +-
 ...python_0.52.19.bb => libnewt-python_0.52.20.bb} |   0
 .../{libnewt_0.52.19.bb => libnewt_0.52.20.bb}     |   4 +-
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |   2 +
 meta/recipes-extended/tzdata/tzdata_2017b.bb       |   2 +
 .../gobject-introspection_1.50.0.bb                |   1 +
 .../linux-firmware/linux-firmware_git.bb           |   3 +
 .../ffmpeg/ffmpeg/0001-build-fix-for-mips.patch    |  44 ++
 .../ffmpeg/{ffmpeg_3.3.bb => ffmpeg_3.3.2.bb}      |   5 +-
 meta/recipes-sato/images/core-image-sato.bb        |   2 -
 .../webkit/webkitgtk/ppc-musl-fix.patch            |  12 +-
 .../{webkitgtk_2.16.1.bb => webkitgtk_2.16.3.bb}   |   5 +-
 scripts/buildhistory-diff                          |  12 +-
 scripts/contrib/patchtest.sh                       | 118 +++++
 scripts/lib/wic/engine.py                          |   2 +-
 scripts/lib/wic/filemap.py                         |   8 +-
 scripts/lib/wic/ksparser.py                        |   2 +-
 scripts/lib/wic/{utils => }/misc.py                |  43 +-
 scripts/lib/wic/partition.py                       |   3 +-
 scripts/lib/wic/pluginbase.py                      |   3 +-
 scripts/lib/wic/plugins/imager/direct.py           |  11 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   4 +-
 .../lib/wic/plugins/source/bootimg-partition.py    |   2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   5 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |   2 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |   2 +-
 scripts/lib/wic/plugins/source/rootfs.py           |   2 +-
 scripts/lib/wic/utils/__init__.py                  |   0
 scripts/lib/wic/utils/runner.py                    |  52 --
 scripts/oe-pkgdata-util                            |  12 +-
 scripts/sstate-sysroot-cruft.sh                    |   2 +
 scripts/wic                                        |   2 +-
 86 files changed, 2460 insertions(+), 1111 deletions(-)
 create mode 100644 bitbake/lib/bb/tests/event.py
 create mode 100644 meta/conf/lib/bblayers_update/__init__.py
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9047_CVE-2017-9048.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_and_simplify_xmlParseStartTag2.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
 rename meta/recipes-core/util-linux/{util-linux_2.29.2.bb => util-linux_2.30.bb} (80%)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7978.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7979.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
 rename meta/recipes-extended/ghostscript/ghostscript/{ghostscript-native-fix-disable-system-libtiff.patch => ghostscript-9.21-native-fix-disable-system-libtiff.patch} (67%)
 rename meta/recipes-extended/ghostscript/ghostscript/{ghostscript-9.02-prevent_recompiling.patch => ghostscript-9.21-prevent_recompiling.patch} (81%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.20.bb => ghostscript_9.21.bb} (77%)
 rename meta/recipes-extended/newt/{libnewt-python_0.52.19.bb => libnewt-python_0.52.20.bb} (100%)
 rename meta/recipes-extended/newt/{libnewt_0.52.19.bb => libnewt_0.52.20.bb} (90%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.bb => ffmpeg_3.3.2.bb} (97%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.1.bb => webkitgtk_2.16.3.bb} (96%)
 create mode 100755 scripts/contrib/patchtest.sh
 rename scripts/lib/wic/{utils => }/misc.py (86%)
 delete mode 100644 scripts/lib/wic/utils/__init__.py
 delete mode 100644 scripts/lib/wic/utils/runner.py

Andrej Valek (7):
  libxml2: Disable LeakSanitizer when running API tests
  libxml2: Avoid reparsing and simplify control flow in
    xmlParseStartTag2
  libxml2: Fix CVE-2017-9047 and CVE-2017-9048
  libxml2: Fix CVE-2017-9049 and CVE-2017-9050
  libxml2: Fix CVE-2017-5969
  libxml2: Fix CVE-2017-0663
  libxml2: Revert "Add an XML_PARSE_NOXXE flag to block all entities
    loading even local"

Aníbal Limón (3):
  oeqa/core/threaded: Don't assume that results exists on logDetails
  oeqa/core/loader.py: Fix _make_failed_test for python >= 3.4.4
  oeqa/selftest/context: Reload testlayer_path when meta-selftest isn't
    added

Denys Dmytriyenko (1):
  util-linux: upgrade to 2.30

Ed Bartosh (5):
  buildhistory-diff: exclude paths from the output
  wic: flatten directory structure
  wic: code cleanup
  wic: fix restoring of original fstab
  wic/runner.py: move runtool API to misc.py

Huang Qiyu (1):
  libnewt: 0.52.19 -> 0.52.20

Jair Gonzalez (3):
  bitbake: event: remove mapping for deleted event handlers
  bitbake: tests: create unit tests for event module
  bitbake: selftest: add bb.tests.event to bitbake-selftest

Jan Kiszka (1):
  tzdata: Install zone1970.tab

Jean-Francois Dagenais (1):
  wic: remove extra double-quote on documentation string

Joe Slater (2):
  ghostscript: move to version 9.21
  ghostscript: add X11 PACKAGECONFIG info

Jose Perez Carranza (2):
  selftest: Add Testopia ID to test cases
  oeqa/selftest/systemdboot: Add Test to check boot file is created
    correctly

Khem Raj (4):
  ffmpeg: Upgrade to 3.3.2 stable
  zlib: Pass pre-calculate uname enable re-entrant flags
  webkitgtk: Upgrade to 2.16.3
  gobject-introspection: Disable generating static lbraries

Leonardo Sandoval (2):
  scripts/contrib/patchtest: run patchtest on local branch
  oeqa/context: allow test execution with buildhistory unless
    version-going-backwards is present

Marc Ferland (2):
  bluez5: remove libusb dependency
  bluez5: add more PACKAGECONFIG options

Martin Jansa (1):
  sstate-sysroot-cruft.sh: Extend the whitelist

Martin Kelly (1):
  qemuboot.conf: make cpus match built artifacts

Ming Liu (1):
  core-image-sato: drop packagegroup-core-x11-sato-games from
    IMAGE_INSTALL

Nathan Rossi (1):
  kernel-uimage.bbclass: Fix up generation of uImage from vmlinux

Patrick Ohly (1):
  bblayers sanity: bblayers.conf.sample specific update code

Peter Kjellerstedt (5):
  oe-pkgdata-util: package-info: Allow extra variables to be displayed
  insane.bbclass: Ignore perl as dependency for nativesdk packages
  linux-firmware: Avoid a dependency on python-core
  texi2html: Add a dependency on perl
  git: Add a dependency on perl for gitweb

Petter Mabäcker (1):
  multilib.bbclass: fix faulty redefinition of STAGING_KERNEL_DIR

Ross Burton (2):
  conf/maintainers: update for revised maintainership
  libpcap: apply fix from upstream to fix build race

Yeoh Ee Peng (1):
  selftest/devtool: replace file assertTrue/False with
    assertExists/NotExists

 bitbake/bin/bitbake-selftest                       |   1 +
 bitbake/lib/bb/event.py                            |   6 +-
 bitbake/lib/bb/tests/event.py                      | 377 +++++++++++++
 meta-poky/conf/distro/include/maintainers.inc      | 336 ++++++------
 .../lib/oeqa/selftest/cases/systemd_boot.py        |  54 +-
 meta/classes/insane.bbclass                        |   2 +-
 meta/classes/kernel-uimage.bbclass                 |  26 +-
 meta/classes/multilib.bbclass                      |   4 +-
 meta/classes/sanity.bbclass                        | 121 +----
 meta/conf/lib/bblayers_update/__init__.py          | 104 ++++
 meta/conf/machine/include/qemuboot-x86.inc         |   6 +-
 meta/lib/oe/buildhistory_analysis.py               |  51 +-
 meta/lib/oeqa/core/loader.py                       |  22 +-
 meta/lib/oeqa/core/threaded.py                     |   7 +-
 meta/lib/oeqa/selftest/cases/containerimage.py     |   2 +
 meta/lib/oeqa/selftest/cases/devtool.py            | 138 ++---
 meta/lib/oeqa/selftest/cases/image_typedep.py      |   2 +
 meta/lib/oeqa/selftest/cases/imagefeatures.py      |   1 +
 meta/lib/oeqa/selftest/cases/liboe.py              |   4 +
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py |   4 +
 meta/lib/oeqa/selftest/cases/package.py            |   4 +
 meta/lib/oeqa/selftest/cases/recipetool.py         |   4 +
 meta/lib/oeqa/selftest/cases/runtime_test.py       |   4 +
 meta/lib/oeqa/selftest/cases/sstatetests.py        |   2 +
 meta/lib/oeqa/selftest/cases/tinfoil.py            |   1 +
 meta/lib/oeqa/selftest/cases/wic.py                |  19 +
 meta/lib/oeqa/selftest/context.py                  |   4 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |  30 +-
 meta/recipes-connectivity/bluez5/bluez5_5.45.bb    |   2 +-
 .../libpcap/libpcap/fix-grammar-deps.patch         |  29 +
 meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb |   1 +
 .../libxml/libxml2/CVE-2016-9318.patch             | 207 --------
 .../libxml/libxml2/libxml2-CVE-2017-0663.patch     |  40 ++
 .../libxml/libxml2/libxml2-CVE-2017-5969.patch     |  62 +++
 .../libxml2-CVE-2017-9047_CVE-2017-9048.patch      | 103 ++++
 .../libxml2-CVE-2017-9049_CVE-2017-9050.patch      | 291 ++++++++++
 ...ibxml2-fix_and_simplify_xmlParseStartTag2.patch | 590 +++++++++++++++++++++
 meta/recipes-core/libxml/libxml2/runtest.patch     |  25 +-
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   6 +-
 meta/recipes-core/util-linux/util-linux.inc        |   2 +-
 .../util-linux/uuid-test-error-api.patch           |  99 ----
 .../{util-linux_2.29.2.bb => util-linux_2.30.bb}   |   7 +-
 meta/recipes-core/zlib/zlib_1.2.11.bb              |  12 +-
 meta/recipes-devtools/git/git.inc                  |   2 +-
 .../ghostscript/ghostscript/CVE-2016-10219.patch   |  49 --
 .../ghostscript/ghostscript/CVE-2016-10220.patch   |  55 --
 .../ghostscript/ghostscript/CVE-2016-7978.patch    |  30 --
 .../ghostscript/ghostscript/CVE-2016-7979.patch    |  48 --
 .../ghostscript/ghostscript/CVE-2016-8602.patch    |  47 --
 .../ghostscript/ghostscript/CVE-2017-7975.patch    |  23 +-
 .../ghostscript/avoid-host-contamination.patch     |  19 +
 ...t-9.21-native-fix-disable-system-libtiff.patch} |  22 +-
 ... => ghostscript-9.21-prevent_recompiling.patch} |  25 +-
 .../ghostscript/ghostscript/mkdir-p.patch          |  36 ++
 .../{ghostscript_9.20.bb => ghostscript_9.21.bb}   |  36 +-
 ...python_0.52.19.bb => libnewt-python_0.52.20.bb} |   0
 .../{libnewt_0.52.19.bb => libnewt_0.52.20.bb}     |   4 +-
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |   2 +
 meta/recipes-extended/tzdata/tzdata_2017b.bb       |   2 +
 .../gobject-introspection_1.50.0.bb                |   1 +
 .../linux-firmware/linux-firmware_git.bb           |   3 +
 .../ffmpeg/ffmpeg/0001-build-fix-for-mips.patch    |  44 ++
 .../ffmpeg/{ffmpeg_3.3.bb => ffmpeg_3.3.2.bb}      |   5 +-
 meta/recipes-sato/images/core-image-sato.bb        |   2 -
 .../webkit/webkitgtk/ppc-musl-fix.patch            |  12 +-
 .../{webkitgtk_2.16.1.bb => webkitgtk_2.16.3.bb}   |   5 +-
 scripts/buildhistory-diff                          |  12 +-
 scripts/contrib/patchtest.sh                       | 118 +++++
 scripts/lib/wic/engine.py                          |   2 +-
 scripts/lib/wic/filemap.py                         |   8 +-
 scripts/lib/wic/ksparser.py                        |   2 +-
 scripts/lib/wic/{utils => }/misc.py                |  43 +-
 scripts/lib/wic/partition.py                       |   3 +-
 scripts/lib/wic/pluginbase.py                      |   3 +-
 scripts/lib/wic/plugins/imager/direct.py           |  11 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   4 +-
 .../lib/wic/plugins/source/bootimg-partition.py    |   2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   5 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |   2 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |   2 +-
 scripts/lib/wic/plugins/source/rootfs.py           |   2 +-
 scripts/lib/wic/utils/__init__.py                  |   0
 scripts/lib/wic/utils/runner.py                    |  52 --
 scripts/oe-pkgdata-util                            |  12 +-
 scripts/sstate-sysroot-cruft.sh                    |   2 +
 scripts/wic                                        |   2 +-
 86 files changed, 2460 insertions(+), 1111 deletions(-)
 create mode 100644 bitbake/lib/bb/tests/event.py
 create mode 100644 meta/conf/lib/bblayers_update/__init__.py
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-9318.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9047_CVE-2017-9048.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_and_simplify_xmlParseStartTag2.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
 rename meta/recipes-core/util-linux/{util-linux_2.29.2.bb => util-linux_2.30.bb} (80%)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7978.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7979.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-8602.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
 rename meta/recipes-extended/ghostscript/ghostscript/{ghostscript-native-fix-disable-system-libtiff.patch => ghostscript-9.21-native-fix-disable-system-libtiff.patch} (67%)
 rename meta/recipes-extended/ghostscript/ghostscript/{ghostscript-9.02-prevent_recompiling.patch => ghostscript-9.21-prevent_recompiling.patch} (81%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.20.bb => ghostscript_9.21.bb} (77%)
 rename meta/recipes-extended/newt/{libnewt-python_0.52.19.bb => libnewt-python_0.52.20.bb} (100%)
 rename meta/recipes-extended/newt/{libnewt_0.52.19.bb => libnewt_0.52.20.bb} (90%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.bb => ffmpeg_3.3.2.bb} (97%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.1.bb => webkitgtk_2.16.3.bb} (96%)
 create mode 100755 scripts/contrib/patchtest.sh
 rename scripts/lib/wic/{utils => }/misc.py (86%)
 delete mode 100644 scripts/lib/wic/utils/__init__.py
 delete mode 100644 scripts/lib/wic/utils/runner.py

-- 
2.11.0


