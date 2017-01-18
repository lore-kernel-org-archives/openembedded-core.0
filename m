Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 49F256FF0E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 10:08:22 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id r144so17234886wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 02:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CIYy/UbirneDPpSue9FW/wubC+vBxGIvlOspWlsokKY=;
	b=lR5VpLRjOgrfSN6sjGiKLai4tLTykjo7wdJUgr/c1Uo5vq27pWi1jF7vVIO5eFXyxM
	Ed7eQgwAkE0bhe2M0Bl3byr861EKrLtBaeJZ+2KnqmGDHe8SIElFfQJr/3MGETPmktNh
	qSHXiqA78YwGJo79ZVZVnYZYxs8HxjZ44B3XPa3aKjZwG2jrrgushIrRt+1wAHcnNwOz
	x5UYeZnLsQa4Q1jhy9Mean3iEuA5Zs/D/bQMI1telybcW8LcDV3FaXLFp5sjhQNmGuwo
	FIP+g1XKyxKr2QYeQX45zeQHJrpNQnzvXquZIn41EaJ9bSp6BSZf4+xlPO2CBLaXiSJr
	6PmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CIYy/UbirneDPpSue9FW/wubC+vBxGIvlOspWlsokKY=;
	b=FoyYWZBQ69BcGYiUdhB+8gcb8KB95UeMwaI64zqXSKWLNp36mEthnmJfyd2xb9Q3tk
	dRB/8zLjzFMDIWFCysZfDh928WkcaaXTbQrEfrV7V07Q4/7g7TvAeBvKzTaFNi/BbFxi
	TLXoXdgJ9idHXdOx1V/7x8u+xbjFn3bqFluAFESE/bPYNSNyebykcsNkwuxKnP8irQ90
	nQUwfXPlRItIc0zP3XfN40JOJp2J6D5ASZX5StjAG3XiXxjDX0XMhQYpa7bAKGe/4goo
	jbimnb9ynJL4y7QdBJDHY+IS0yQst35VuWlwKL8zrQv3UH16jLU6lyKCC/Vu8fCwrjoP
	kBCw==
X-Gm-Message-State: AIkVDXJN7HLDRVnOpDEaeXV5sbx4r8BB4x515x3rDGty5sAoWtYkLMdEYqsP8htcIuhqDAiO
X-Received: by 10.223.154.109 with SMTP id z100mr2053689wrb.145.1484734101979; 
	Wed, 18 Jan 2017 02:08:21 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	204sm44270428wmj.7.2017.01.18.02.08.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jan 2017 02:08:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2017 10:08:17 +0000
Message-Id: <cover.1484733982.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 00/56] Consolidated pul
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
X-List-Received-Date: Wed, 18 Jan 2017 10:08:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

A consolidated pull with meta-poky and bitbake commits at the beginning, then
oe-core.

Green on the autobuilder apart from three failures in checkuri: two transient
and one genuine: ed's upstream tarball has disappeared.

Ross

The following changes since commit 63f899a950daf1018999455bafa7a2be8b22f164:

  bitbake: toaster: bin/toaster whitelist TOASTER_DIR (2017-01-17 13:18:47 +0000)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 3409effd461f148eba2d51f6819e73f8bdcca777:

  oeqa/selftest/devtool: rewrite modify testcase (2017-01-18 10:04:30 +0000)

----------------------------------------------------------------
Andre McCurdy (1):
      gstreamer1.0-plugins-good: fix qtdemux_parse_svq3_stsd_data() memory leak

Andreas Müller (1):
      waf.bbclass: handle PACKAGECONFIG

André Draszik (2):
      python3-pygobject: enable cairo only when a display is available
      time: BBCLASSEXTEND to native and nativesdk

Benjamin Esquivel (1):
      poky: add fedora-25 to the SANITY_TESTED_DISTROS

Chen Qi (1):
      byacc: upgrade to 20161202

David Vincent (1):
      extrausers: Use static ids when available

Edwin Plauchu (4):
      swig: upgrade to 3.0.11
      python3-setuptools: upgrade to 31.1.1
      python3-pip: fixed dependecy with python3-enum
      python3-docutils: upgrade to 0.13.1

Fabio Berton (1):
      openssl: Use linux-aarch64 target for aarch64

Jose Perez Carranza (1):
      oeqa/selftest/tinfoil: add test IDs to tinfoil test cases

Joshua Lock (1):
      poky: Switch to post release name/version

Khem Raj (1):
      gstreamer1.0-plugins-bad: Backport patches for improving live playback

Maciej Borzecki (1):
      wic: partitionedfs: account for non-table partitions when checking if logical parititon is needed

Mariano Lopez (3):
      lib/oe/package_manager.py: Fix extract for ipk and deb
      oeqa/utils/qemurunner.py: Add missing sys module
      oeqa/utils/qemurunner.py: Be sure to stop qemu-system

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

Maxin B. John (4):
      libproxy: update to version 0.4.14
      mdadm: upgrade to version 4.0
      netbase: upgrade to version 5.4
      harfbuzz: upgrade to 1.4.1

Nathan Lynch (5):
      lttng-ust: don't exclude manual pages from build
      lttng-ust: upgrade to 2.9.0
      lttng-modules: upgrade to 2.9.0
      lttng-tools: upgrade to 2.9.3
      babeltrace: upgrade to 1.5.1

Nathan Rossi (3):
      kernel-fitimage.bbclass: Allow unset load/entry addresses for ramdisks
      kernel-fitimage.bbclass: Don't assume KERNEL_IMAGETYPE == fitImage
      kernel-fitimage.bbclass: Check value of UBOOT_SIGN_ENABLE

Ola Redell (1):
      kernel-module-split: Append KERNEL_VERSION string to kernel module name

Patrick Ohly (6):
      rm_work.bbclass: allow preserving additional content
      build.py: add preceedtask() API
      runqueue.py: revised completion scheduler
      rm_work_and_downloads.bbclass: more aggressively minimize disk usage
      rm_work.bbclass: clean up sooner
      gcc-source.inc: cleanly disable do_rm_work

Richard Purdie (1):
      event/ast: Add RecipeTaskPreProcess event before task finalisation

Robert Yang (3):
      qemuboot.bbclass: use IMGDEPLOYDIR
      scripts/runqemu: fix checking for <file>.cpio.gz
      runqemu-export-rootfs: fix inconsistent var names

Ross Burton (4):
      perf: use PACKAGECONFIG instead of hand-rolled logic
      perf: add PACKAGECONFIG for systemtap
      gstreamer1.0: make libunwind detection deterministic
      oeqa/selftest/devtool: rewrite modify testcase

 bitbake/lib/bb/build.py                            |  16 +
 bitbake/lib/bb/event.py                            |   7 +
 bitbake/lib/bb/parse/ast.py                        |   1 +
 bitbake/lib/bb/runqueue.py                         | 125 ++-
 meta-poky/conf/distro/poky.conf                    |   5 +-
 meta/classes/extrausers.bbclass                    |   4 +
 meta/classes/kernel-fitimage.bbclass               |  23 +-
 meta/classes/kernel-module-split.bbclass           |   9 +-
 meta/classes/qemuboot.bbclass                      |   5 +-
 meta/classes/rm_work.bbclass                       |  41 +-
 meta/classes/rm_work_and_downloads.bbclass         |  33 +
 meta/classes/testimage.bbclass                     |   2 +
 meta/classes/useradd-staticids.bbclass             |  37 +-
 meta/classes/waf.bbclass                           |   2 +
 meta/lib/oe/package_manager.py                     |   6 +-
 meta/lib/oeqa/selftest/devtool.py                  |  73 +-
 meta/lib/oeqa/selftest/tinfoil.py                  |   9 +
 meta/lib/oeqa/utils/metadata.py                    |  87 +-
 meta/lib/oeqa/utils/qemurunner.py                  |  10 +
 meta/recipes-connectivity/openssl/openssl.inc      |   2 +-
 ...netbase-add-rpcbind-as-an-alias-to-sunrpc.patch |  24 +-
 .../netbase/{netbase_5.3.bb => netbase_5.4.bb}     |   6 +-
 meta/recipes-devtools/gcc/gcc-source.inc           |   2 +-
 meta/recipes-devtools/python/python-setuptools.inc |   4 +-
 ...tools_31.0.0.bb => python-setuptools_32.1.1.bb} |   0
 ...docutils_0.12.bb => python3-docutils_0.13.1.bb} |   6 +-
 meta/recipes-devtools/python/python3-pip_9.0.1.bb  |   1 +
 .../python/python3-pygobject_3.22.0.bb             |   2 +-
 ...ools_31.0.0.bb => python3-setuptools_32.1.1.bb} |   0
 .../swig/{swig_3.0.10.bb => swig_3.0.11.bb}        |   4 +-
 meta/recipes-extended/byacc/byacc.inc              |   3 +-
 .../0001-byacc-do-not-reorder-CC-and-CFLAGS.patch  | 161 ++++
 .../byacc/{byacc_20160606.bb => byacc_20161202.bb} |   4 +-
 .../0001-Fix-some-type-comparison-problems.patch   |  50 --
 .../mdadm/files/0001-Fix-typo-in-comparision.patch |  86 --
 ...dadm.h-bswap-is-already-defined-in-uclibc.patch |  55 --
 .../0001-raid6check-Fix-if-else-indentation.patch  |  37 -
 ...il.c-include-poll.h-instead-of-sys-poll.h.patch |  45 -
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |  23 -
 .../mdadm/{mdadm_3.4.bb => mdadm_4.0.bb}           |  10 +-
 meta/recipes-extended/time/time.inc                |   2 +
 .../{harfbuzz_1.3.4.bb => harfbuzz_1.4.1.bb}       |   4 +-
 .../{babeltrace_1.5.0.bb => babeltrace_1.5.1.bb}   |   5 +-
 ...lttng-modules_git.bb => lttng-modules_2.9.0.bb} |  10 +-
 .../0001-Fix-error.h-common-error.h.patch          |  33 -
 meta/recipes-kernel/lttng/lttng-tools/run-ptest    |   5 +-
 .../utils-remove-bogus-interpreter.patch           |  35 +
 meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb     | 127 +++
 meta/recipes-kernel/lttng/lttng-tools_git.bb       | 120 ---
 .../lttng-ust/lttng-ust-doc-examples-disable.patch |   2 +-
 .../lttng/{lttng-ust_git.bb => lttng-ust_2.9.0.bb} |  13 +-
 meta/recipes-kernel/perf/perf-features.inc         |  22 -
 meta/recipes-kernel/perf/perf.bb                   |  27 +-
 ...1-mssdemux-improved-live-playback-support.patch | 929 +++++++++++++++++++++
 ...ming-implement-adaptivedemux-s-get_live_s.patch | 183 ++++
 ...ming-use-the-duration-from-the-list-of-fr.patch |  62 ++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb   |   3 +
 ...e-seqh-after-calling-qtdemux_parse_svq3_s.patch |  33 +
 .../gstreamer/gstreamer1.0-plugins-good_1.10.2.bb  |   1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   1 +
 .../gstreamer1.0/deterministic-unwind.patch        |  24 +
 .../gstreamer/gstreamer1.0_1.10.2.bb               |   1 +
 .../{libproxy_0.4.13.bb => libproxy_0.4.14.bb}     |   4 +-
 scripts/lib/wic/utils/partitionedfs.py             |   3 +-
 scripts/oe-selftest                                |  12 +-
 scripts/runqemu                                    |  22 +-
 scripts/runqemu-export-rootfs                      |  21 +-
 67 files changed, 2024 insertions(+), 700 deletions(-)
 create mode 100644 meta/classes/rm_work_and_downloads.bbclass
 rename meta/recipes-core/netbase/{netbase_5.3.bb => netbase_5.4.bb} (76%)
 rename meta/recipes-devtools/python/{python-setuptools_31.0.0.bb => python-setuptools_32.1.1.bb} (100%)
 rename meta/recipes-devtools/python/{python3-docutils_0.12.bb => python3-docutils_0.13.1.bb} (60%)
 rename meta/recipes-devtools/python/{python3-setuptools_31.0.0.bb => python3-setuptools_32.1.1.bb} (100%)
 rename meta/recipes-devtools/swig/{swig_3.0.10.bb => swig_3.0.11.bb} (58%)
 create mode 100644 meta/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
 rename meta/recipes-extended/byacc/{byacc_20160606.bb => byacc_20161202.bb} (74%)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-typo-in-comparision.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-raid6check-Fix-if-else-indentation.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-util.c-include-poll.h-instead-of-sys-poll.h.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.4.bb => mdadm_4.0.bb} (81%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.3.4.bb => harfbuzz_1.4.1.bb} (88%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.0.bb => babeltrace_1.5.1.bb} (81%)
 rename meta/recipes-kernel/lttng/{lttng-modules_git.bb => lttng-modules_2.9.0.bb} (84%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-common-error.h.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-interpreter.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools_git.bb
 rename meta/recipes-kernel/lttng/{lttng-ust_git.bb => lttng-ust_2.9.0.bb} (84%)
 delete mode 100644 meta/recipes-kernel/perf/perf-features.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
 rename meta/recipes-support/libproxy/{libproxy_0.4.13.bb => libproxy_0.4.14.bb} (88%)

Andre McCurdy (1):
  gstreamer1.0-plugins-good: fix qtdemux_parse_svq3_stsd_data() memory
    leak

Andreas Müller (1):
  waf.bbclass: handle PACKAGECONFIG

André Draszik (2):
  python3-pygobject: enable cairo only when a display is available
  time: BBCLASSEXTEND to native and nativesdk

Benjamin Esquivel (1):
  poky: add fedora-25 to the SANITY_TESTED_DISTROS

Chen Qi (1):
  byacc: upgrade to 20161202

David Vincent (1):
  extrausers: Use static ids when available

Edwin Plauchu (4):
  swig: upgrade to 3.0.11
  python3-setuptools: upgrade to 31.1.1
  python3-pip: fixed dependecy with python3-enum
  python3-docutils: upgrade to 0.13.1

Fabio Berton (1):
  openssl: Use linux-aarch64 target for aarch64

Jose Perez Carranza (1):
  oeqa/selftest/tinfoil: add test IDs to tinfoil test cases

Joshua Lock (1):
  poky: Switch to post release name/version

Khem Raj (1):
  gstreamer1.0-plugins-bad: Backport patches for improving live playback

Maciej Borzecki (1):
  wic: partitionedfs: account for non-table partitions when checking if
    logical parititon is needed

Mariano Lopez (3):
  lib/oe/package_manager.py: Fix extract for ipk and deb
  oeqa/utils/qemurunner.py: Add missing sys module
  oeqa/utils/qemurunner.py: Be sure to stop qemu-system

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

Maxin B. John (4):
  libproxy: update to version 0.4.14
  mdadm: upgrade to version 4.0
  netbase: upgrade to version 5.4
  harfbuzz: upgrade to 1.4.1

Nathan Lynch (5):
  lttng-ust: don't exclude manual pages from build
  lttng-ust: upgrade to 2.9.0
  lttng-modules: upgrade to 2.9.0
  lttng-tools: upgrade to 2.9.3
  babeltrace: upgrade to 1.5.1

Nathan Rossi (3):
  kernel-fitimage.bbclass: Allow unset load/entry addresses for ramdisks
  kernel-fitimage.bbclass: Don't assume KERNEL_IMAGETYPE == fitImage
  kernel-fitimage.bbclass: Check value of UBOOT_SIGN_ENABLE

Ola Redell (1):
  kernel-module-split: Append KERNEL_VERSION string to kernel module
    name

Patrick Ohly (6):
  rm_work.bbclass: allow preserving additional content
  build.py: add preceedtask() API
  runqueue.py: revised completion scheduler
  rm_work_and_downloads.bbclass: more aggressively minimize disk usage
  rm_work.bbclass: clean up sooner
  gcc-source.inc: cleanly disable do_rm_work

Richard Purdie (1):
  event/ast: Add RecipeTaskPreProcess event before task finalisation

Robert Yang (3):
  qemuboot.bbclass: use IMGDEPLOYDIR
  scripts/runqemu: fix checking for <file>.cpio.gz
  runqemu-export-rootfs: fix inconsistent var names

Ross Burton (4):
  perf: use PACKAGECONFIG instead of hand-rolled logic
  perf: add PACKAGECONFIG for systemtap
  gstreamer1.0: make libunwind detection deterministic
  oeqa/selftest/devtool: rewrite modify testcase

 bitbake/lib/bb/build.py                            |  16 +
 bitbake/lib/bb/event.py                            |   7 +
 bitbake/lib/bb/parse/ast.py                        |   1 +
 bitbake/lib/bb/runqueue.py                         | 125 ++-
 meta-poky/conf/distro/poky.conf                    |   5 +-
 meta/classes/extrausers.bbclass                    |   4 +
 meta/classes/kernel-fitimage.bbclass               |  23 +-
 meta/classes/kernel-module-split.bbclass           |   9 +-
 meta/classes/qemuboot.bbclass                      |   5 +-
 meta/classes/rm_work.bbclass                       |  41 +-
 meta/classes/rm_work_and_downloads.bbclass         |  33 +
 meta/classes/testimage.bbclass                     |   2 +
 meta/classes/useradd-staticids.bbclass             |  37 +-
 meta/classes/waf.bbclass                           |   2 +
 meta/lib/oe/package_manager.py                     |   6 +-
 meta/lib/oeqa/selftest/devtool.py                  |  73 +-
 meta/lib/oeqa/selftest/tinfoil.py                  |   9 +
 meta/lib/oeqa/utils/metadata.py                    |  87 +-
 meta/lib/oeqa/utils/qemurunner.py                  |  10 +
 meta/recipes-connectivity/openssl/openssl.inc      |   2 +-
 ...netbase-add-rpcbind-as-an-alias-to-sunrpc.patch |  24 +-
 .../netbase/{netbase_5.3.bb => netbase_5.4.bb}     |   6 +-
 meta/recipes-devtools/gcc/gcc-source.inc           |   2 +-
 meta/recipes-devtools/python/python-setuptools.inc |   4 +-
 ...tools_31.0.0.bb => python-setuptools_32.1.1.bb} |   0
 ...docutils_0.12.bb => python3-docutils_0.13.1.bb} |   6 +-
 meta/recipes-devtools/python/python3-pip_9.0.1.bb  |   1 +
 .../python/python3-pygobject_3.22.0.bb             |   2 +-
 ...ools_31.0.0.bb => python3-setuptools_32.1.1.bb} |   0
 .../swig/{swig_3.0.10.bb => swig_3.0.11.bb}        |   4 +-
 meta/recipes-extended/byacc/byacc.inc              |   3 +-
 .../0001-byacc-do-not-reorder-CC-and-CFLAGS.patch  | 161 ++++
 .../byacc/{byacc_20160606.bb => byacc_20161202.bb} |   4 +-
 .../0001-Fix-some-type-comparison-problems.patch   |  50 --
 .../mdadm/files/0001-Fix-typo-in-comparision.patch |  86 --
 ...dadm.h-bswap-is-already-defined-in-uclibc.patch |  55 --
 .../0001-raid6check-Fix-if-else-indentation.patch  |  37 -
 ...il.c-include-poll.h-instead-of-sys-poll.h.patch |  45 -
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |  23 -
 .../mdadm/{mdadm_3.4.bb => mdadm_4.0.bb}           |  10 +-
 meta/recipes-extended/time/time.inc                |   2 +
 .../{harfbuzz_1.3.4.bb => harfbuzz_1.4.1.bb}       |   4 +-
 .../{babeltrace_1.5.0.bb => babeltrace_1.5.1.bb}   |   5 +-
 ...lttng-modules_git.bb => lttng-modules_2.9.0.bb} |  10 +-
 .../0001-Fix-error.h-common-error.h.patch          |  33 -
 meta/recipes-kernel/lttng/lttng-tools/run-ptest    |   5 +-
 .../utils-remove-bogus-interpreter.patch           |  35 +
 meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb     | 127 +++
 meta/recipes-kernel/lttng/lttng-tools_git.bb       | 120 ---
 .../lttng-ust/lttng-ust-doc-examples-disable.patch |   2 +-
 .../lttng/{lttng-ust_git.bb => lttng-ust_2.9.0.bb} |  13 +-
 meta/recipes-kernel/perf/perf-features.inc         |  22 -
 meta/recipes-kernel/perf/perf.bb                   |  27 +-
 ...1-mssdemux-improved-live-playback-support.patch | 929 +++++++++++++++++++++
 ...ming-implement-adaptivedemux-s-get_live_s.patch | 183 ++++
 ...ming-use-the-duration-from-the-list-of-fr.patch |  62 ++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb   |   3 +
 ...e-seqh-after-calling-qtdemux_parse_svq3_s.patch |  33 +
 .../gstreamer/gstreamer1.0-plugins-good_1.10.2.bb  |   1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   1 +
 .../gstreamer1.0/deterministic-unwind.patch        |  24 +
 .../gstreamer/gstreamer1.0_1.10.2.bb               |   1 +
 .../{libproxy_0.4.13.bb => libproxy_0.4.14.bb}     |   4 +-
 scripts/lib/wic/utils/partitionedfs.py             |   3 +-
 scripts/oe-selftest                                |  12 +-
 scripts/runqemu                                    |  22 +-
 scripts/runqemu-export-rootfs                      |  21 +-
 67 files changed, 2024 insertions(+), 700 deletions(-)
 create mode 100644 meta/classes/rm_work_and_downloads.bbclass
 rename meta/recipes-core/netbase/{netbase_5.3.bb => netbase_5.4.bb} (76%)
 rename meta/recipes-devtools/python/{python-setuptools_31.0.0.bb => python-setuptools_32.1.1.bb} (100%)
 rename meta/recipes-devtools/python/{python3-docutils_0.12.bb => python3-docutils_0.13.1.bb} (60%)
 rename meta/recipes-devtools/python/{python3-setuptools_31.0.0.bb => python3-setuptools_32.1.1.bb} (100%)
 rename meta/recipes-devtools/swig/{swig_3.0.10.bb => swig_3.0.11.bb} (58%)
 create mode 100644 meta/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
 rename meta/recipes-extended/byacc/{byacc_20160606.bb => byacc_20161202.bb} (74%)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-some-type-comparison-problems.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-typo-in-comparision.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm.h-bswap-is-already-defined-in-uclibc.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-raid6check-Fix-if-else-indentation.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-util.c-include-poll.h-instead-of-sys-poll.h.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.4.bb => mdadm_4.0.bb} (81%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.3.4.bb => harfbuzz_1.4.1.bb} (88%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.0.bb => babeltrace_1.5.1.bb} (81%)
 rename meta/recipes-kernel/lttng/{lttng-modules_git.bb => lttng-modules_2.9.0.bb} (84%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-common-error.h.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-interpreter.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools_git.bb
 rename meta/recipes-kernel/lttng/{lttng-ust_git.bb => lttng-ust_2.9.0.bb} (84%)
 delete mode 100644 meta/recipes-kernel/perf/perf-features.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
 rename meta/recipes-support/libproxy/{libproxy_0.4.13.bb => libproxy_0.4.14.bb} (88%)

-- 
2.8.1


