Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.34639.1620052602095814023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 07:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: aNnZMgEAgo1BF/GeHpLQyEeDO0GA+TFN3q4M56tXelHOBDzQAQCoWBifT/Rf7nJlUc5nIn1PtR
 tj1KBJ8/kyrQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="197849503"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="197849503"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 07:36:41 -0700
IronPort-SDR: 6fsvk+ue8dxdjFRLnjlmV9COiA1BmVeOBRJX2QfpItAWkUFrfoHPgWdQdYGpXM0v9F4CJ6iEO2
 QJkjJmP38Eig==
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="405697096"
Received: from semohdyu-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.72.206])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 07:36:40 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 0/6] review request
Date: Mon,  3 May 2021 22:36:28 +0800
Message-Id: <cover.1620052258.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these changes for gatesgarth. Builds cleanly on
autobuilder.

Thanks,

Anuj

The following changes since commit 8b0aef3f504d650c3208f11b62a7926aa90967f1:

  sanity: Further improve directory sanity tests (2021-04-23 23:20:58 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Changqing Li (2):
  cairo: fix CVE-2020-35492
  gdk-pixbuf: fix CVE-2021-20240

Chen Qi (1):
  rsync: fix CVE-2020-14387

Marek Vasut (1):
  linux-firmware: Package RSI 911x WiFi firmware

Richard Purdie (1):
  yocto-check-layer: Avoid bug when iterating and autoadding
    dependencies

hongxu (1):
  deb: apply postinstall on sdk

 meta/lib/oe/package_manager/deb/sdk.py        |   4 +
 ...-the-hostname-in-the-certificate-whe.patch |  31 +++++
 meta/recipes-devtools/rsync/rsync_3.2.3.bb    |   1 +
 .../gdk-pixbuf/CVE-2021-20240.patch           |  40 ++++++
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |   1 +
 .../cairo/cairo/CVE-2020-35492.patch          | 121 ++++++++++++++++++
 .../cairo/cairo/bug-image-compositor.ref.png  | Bin 0 -> 185 bytes
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |  11 ++
 .../linux-firmware/linux-firmware_20210208.bb |  11 ++
 scripts/yocto-check-layer                     |   3 +
 10 files changed, 223 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/bug-image-compositor.ref.png

-- 
2.30.2

