Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4074.1620808565759951992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 5GIS/rb4CObejpsAevYdN7mUQooJ94PDc3+/RGprESNybc1xdRQI93bESVpufH6iZ8kIo0Q1jv
 eGjgWMGHGKog==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917770"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917770"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:01 -0700
IronPort-SDR: TAxNxg0tWQbPiDQvn2Cv++VuLOZHFg8vFGlLsRgvEAYzfbx8qRPeRIXl00qSf3RqSdMhOVC0sT
 v/3XUSufHJUA==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645686"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:35:56 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/15] review request
Date: Wed, 12 May 2021 16:35:32 +0800
Message-Id: <cover.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review these changes for hardknott. No problems while testing on
autobuilder.

Thanks,

Anuj

The following changes since commit d5d88c2293e8ebc958d1bce9af8f796024443be9:

  libevent: Increase ptest timing tolerance 50 ms -> 100 ms (2021-05-07 08:51:54 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (1):
  linux-firmware: upgrade 20210208 -> 20210315

Anuj Mittal (1):
  lsb-release: fix reproducibility failure

Bruce Ashfield (1):
  linux-yocto/5.4: qemuppc32: reduce serial shutdown issues

Chen Qi (1):
  db: update CVE_PRODUCT

Kai Kang (1):
  grub2.inc: remove '-O2' from CFLAGS

Michael Opdenacker (1):
  sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure
    message

Peter Kjellerstedt (1):
  libcap: Configure Make variables correctly without a horrible hack

Richard Purdie (4):
  oeqa/qemurunner: Improve logging thread exit handling for qemu
    shutdown test
  oeqa/qemurunner: Fix binary vs str issue
  oeqa/qemurunner: Improve handling of run_serial for shutdown commands
  puzzles: Upstream changed to main branch for development

Romain Naour (1):
  dejagnu: needs expect at runtime

Vinícius Ossanes Aquino (1):
  lttng-modules: backport patches to fix build against 5.12+ kernel

Yann Dirson (1):
  linux-firmware: include all relevant files in -bcm4356

zhengruoqin (1):
  ruby: upgrade 3.0.0 -> 3.0.1

 meta/classes/sanity.bbclass                   |   9 +-
 meta/lib/oeqa/selftest/cases/runqemu.py       |   9 +-
 meta/lib/oeqa/utils/qemurunner.py             |  21 +-
 meta/recipes-bsp/grub/grub2.inc               |   2 +
 .../recipes-devtools/dejagnu/dejagnu_1.6.2.bb |   1 +
 .../ruby/{ruby_3.0.0.bb => ruby_3.0.1.bb}     |   2 +-
 .../help2man-reproducibility.patch            |  27 ++
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |   1 +
 ...20210208.bb => linux-firmware_20210315.bb} |   8 +-
 .../linux/linux-yocto-rt_5.4.bb               |   2 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   2 +-
 ...block-add-a-disk_uevent-helper-v5.12.patch | 305 ++++++++++++++++++
 ...block-add-a-disk_uevent-helper-v5.12.patch |  48 +++
 ...free-event-name-mismatching-with-pro.patch |  71 ++++
 .../lttng/lttng-modules_2.12.5.bb             |   3 +
 meta/recipes-sato/puzzles/puzzles_git.bb      |   2 +-
 meta/recipes-support/db/db_5.3.28.bb          |   2 +-
 meta/recipes-support/libcap/libcap_2.48.bb    |  21 +-
 19 files changed, 504 insertions(+), 34 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.0.0.bb => ruby_3.0.1.bb} (97%)
 create mode 100644 meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210208.bb => linux-firmware_20210315.bb} (99%)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-block-add-a-disk_uevent-helper-v5.12.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch

-- 
2.31.1

