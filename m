Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.13900.1630308851415211051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 00:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="197789532"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="197789532"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:10 -0700
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="509469236"
Received: from hongkekh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.105])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:08 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 0/9] Patch review request
Date: Mon, 30 Aug 2021 15:33:51 +0800
Message-Id: <cover.1630306698.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review these changes for hardknott. Buils cleanly on autobuilder
except for intermittent valgrind ptest failures and a parselog failure
while testing qemuppc-alt.

Thanks,

Anuj

The following changes since commit 9ba6c42c1cc0ffb690126aa93ccb529405473af5:

  glibc: Fix CVE-2021-38604 (2021-08-25 10:44:50 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (2):
  tcf-agent: fetching over git:// no longer works
  linux-firmware: upgrade 20210511 -> 20210818

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.141
  linux-yocto/5.4: update to v5.4.142

Changqing Li (1):
  file: fix close_on_exec for multithreaded decompression

Joe Slater (1):
  icu: increase pkgdata command buffer size

Khem Raj (1):
  weston: Re-order gbm destruction at DRM-backend tear down

Marek Vasut (1):
  image_types: Restore pre-btrfs-tools 4.14.1 mkfs.btrfs shrink behavior

Randy MacLeod (1):
  openssl: upgrade from 1.1.1k to 1.1.1l

 meta/classes/image_types.bbclass              |   2 +-
 .../{openssl_1.1.1k.bb => openssl_1.1.1l.bb}  |   2 +-
 meta/recipes-devtools/file/file_5.39.bb       |   3 +-
 ...ec-multithreaded-decompression-issue.patch | 220 ++++++++++++++++++
 .../tcf-agent/tcf-agent_git.bb                |   2 +-
 ...d-drm-Re-order-gbm-destruction-at-DR.patch |  50 ++++
 meta/recipes-graphics/wayland/weston_9.0.0.bb |   1 +
 ...20210511.bb => linux-firmware_20210818.bb} |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...pkgdata-increase-command-buffer-size.patch |  46 ++++
 meta/recipes-support/icu/icu_68.2.bb          |   1 +
 13 files changed, 344 insertions(+), 25 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1k.bb => openssl_1.1.1l.bb} (98%)
 create mode 100644 meta/recipes-devtools/file/files/0001-Fix-close_on_exec-multithreaded-decompression-issue.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210511.bb => linux-firmware_20210818.bb} (99%)
 create mode 100644 meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch

-- 
2.31.1

