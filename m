Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.26764.1629957766040268490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 23:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="215828293"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
   d="scan'208";a="215828293"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 23:02:44 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
   d="scan'208";a="527628653"
Received: from yvanugop-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.135.52])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 23:02:43 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/26] Pull request (cover letter only)
Date: Thu, 26 Aug 2021 14:02:37 +0800
Message-Id: <cover.1629956461.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes. I've removed the uninative upgrade from my
branch as those are causing problems. Re-tested and didn't see any
problems.

Thanks,

Anuj

The following changes since commit 01321ed982a8553672808afe2d9c1bee6628055d:

  gnutls: upgrade 3.7.1 -> 3.7.2 (2021-08-11 16:39:03 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Alexandre Belloni (1):
  oeqa/runtime/cases: make date.DateTest.test_date more reliable

Anton Blanchard (1):
  kmod: use nonarch_base_libdir for depmod.d and modprobe.d

Bruce Ashfield (6):
  linux-yocto/5.10: update to v5.10.55
  linux-yocto/5.4: update to v5.4.137
  linux-yocto/5.4: update to v5.4.139
  linux-yocto/5.10: update to v5.10.57
  kernel-devsrc: 5.14+ updates
  kernel-devsrc: fix 5.14+ objtool compilation

Dmitry Baryshkov (1):
  linux-firmware: add more Qualcomm firmware packages

Joe Slater (1):
  terminal.bbclass: force bash for devshell

Jose Quaresma (1):
  sstate.bbclass: fix error handling when sstate mirrors is ro

Khem Raj (1):
  sdk: Enable do_populate_sdk with multilibs

Marta Rybczynska (1):
  lzo: add CVE_PRODUCT

Oleksandr Popovych (1):
  utils: Reduce the number of calls to the "dirname" command

Patrick Williams (1):
  pixman: re-disable iwmmxt

Ross Burton (3):
  tar: ignore node-tar CVEs
  e2fsprogs: ensure small images have 256-byte inodes
  wic: don't forcibly pass -T default

Sakib Sajal (1):
  go: upgrade 1.16.5 -> 1.16.7

Tony Tascioglu (5):
  ffmpeg: fix CVE-2020-20446
  ffmpeg: fix CVE-2020-20453
  ffmpeg: fix CVE-2020-22015
  ffmpeg: fix CVE-2020-22021
  ffmpeg: fix CVE-2020-22019 and CVE-2020-22033

Vinay Kumar (1):
  glibc: Fix CVE-2021-38604

hongxu (1):
  sdk: fix relocate symlink failed

 meta/classes/multilib.bbclass                 |   1 -
 meta/classes/populate_sdk_base.bbclass        |   2 +-
 meta/classes/sstate.bbclass                   |   2 +
 meta/classes/terminal.bbclass                 |   5 +-
 meta/classes/utils.bbclass                    |   2 +-
 meta/files/toolchain-shar-relocate.sh         |   2 +-
 meta/lib/oeqa/runtime/cases/date.py           |   9 +-
 .../glibc/glibc/0001-CVE-2021-38604.patch     |  40 +++++
 .../glibc/glibc/0002-CVE-2021-38604.patch     | 147 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |   2 +
 .../e2fsprogs/big-inodes-for-small-fs.patch   |  22 +++
 .../e2fsprogs/e2fsprogs_1.46.1.bb             |   1 +
 .../go/{go-1.16.5.inc => go-1.16.7.inc}       |   4 +-
 ...e_1.16.5.bb => go-binary-native_1.16.7.bb} |   4 +-
 ..._1.16.5.bb => go-cross-canadian_1.16.7.bb} |   0
 ...{go-cross_1.16.5.bb => go-cross_1.16.7.bb} |   0
 ...osssdk_1.16.5.bb => go-crosssdk_1.16.7.bb} |   0
 ...o-native_1.16.5.bb => go-native_1.16.7.bb} |   0
 ...runtime_1.16.5.bb => go-runtime_1.16.7.bb} |   0
 .../go/{go_1.16.5.bb => go_1.16.7.bb}         |   0
 meta/recipes-extended/tar/tar_1.34.bb         |   3 +
 .../xorg-lib/pixman_0.40.0.bb                 |   2 +
 meta/recipes-kernel/kmod/kmod_git.bb          |   8 +-
 .../linux-firmware/linux-firmware_20210511.bb |  17 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  10 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 .../ffmpeg/ffmpeg/fix-CVE-2020-20446.patch    |  35 +++++
 .../ffmpeg/ffmpeg/fix-CVE-2020-20453.patch    |  42 +++++
 .../ffmpeg/ffmpeg/fix-CVE-2020-22015.patch    |  44 ++++++
 .../ffmpeg/ffmpeg/fix-CVE-2020-22021.patch    |  87 +++++++++++
 .../fix-CVE-2020-22033-CVE-2020-22019.patch   |  39 +++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |   5 +
 meta/recipes-support/lzo/lzo_2.10.bb          |   2 +
 scripts/lib/wic/canned-wks/common.wks.inc     |   2 +-
 scripts/lib/wic/canned-wks/directdisk-gpt.wks |   2 +-
 scripts/lib/wic/canned-wks/mkefidisk.wks      |   2 +-
 41 files changed, 553 insertions(+), 64 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch
 rename meta/recipes-devtools/go/{go-1.16.5.inc => go-1.16.7.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb => go-binary-native_1.16.7.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb => go-cross-canadian_1.16.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.5.bb => go-cross_1.16.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb => go-crosssdk_1.16.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.5.bb => go-native_1.16.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb => go-runtime_1.16.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.5.bb => go_1.16.7.bb} (100%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20446.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-20453.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22015.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22021.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2020-22033-CVE-2020-22019.patch

-- 
2.31.1

