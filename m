Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.4949.1630483341016079612
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 01:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="205801201"
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; 
   d="scan'208";a="205801201"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2021 01:02:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; 
   d="scan'208";a="428509191"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.235.132])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2021 01:02:18 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 0/9] Pull request
Date: Wed,  1 Sep 2021 16:02:11 +0800
Message-Id: <cover.1630481709.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please merge these changes.

Thanks,

Anuj

The following changes since commit 9ba6c42c1cc0ffb690126aa93ccb529405473af5:

  glibc: Fix CVE-2021-38604 (2021-08-25 10:44:50 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

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

