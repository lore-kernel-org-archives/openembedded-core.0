Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.9274.1620226005719106771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 07:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 8JtSOdTNuSayOxo3fS+HVUP69xAbhKWXsRe1ea+36XBrpyxDgyea4LtXiK0sDotYh0/yofYiuY
 FKMahLE0AIoQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="177776811"
X-IronPort-AV: E=Sophos;i="5.82,275,1613462400"; 
   d="scan'208";a="177776811"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 07:46:42 -0700
IronPort-SDR: yaNyHdz3O5zwk4Ra+U2RMY1Sxqrgxy6nrCJRxO49FG95uh2P6Lu3jN2xdFHBtIooo0I92r5E8B
 rMtt4VHu2s0g==
X-IronPort-AV: E=Sophos;i="5.82,275,1613462400"; 
   d="scan'208";a="539570585"
Received: from cwchuah-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.137.96])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 07:46:41 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 0/7] pull request (cover letter only)
Date: Wed,  5 May 2021 22:46:34 +0800
Message-Id: <cover.1620225552.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Final pull request before the final gatesgarth dot release. 

Thanks,

Anuj

The following changes since commit 8b0aef3f504d650c3208f11b62a7926aa90967f1:

  sanity: Further improve directory sanity tests (2021-04-23 23:20:58 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

Changqing Li (2):
  cairo: fix CVE-2020-35492
  gdk-pixbuf: fix CVE-2021-20240

Chen Qi (1):
  rsync: fix CVE-2020-14387

Marek Vasut (1):
  linux-firmware: Package RSI 911x WiFi firmware

Mark Hatle (1):
  populate_sdk_ext: Avoid copying and producing .pyc files

Richard Purdie (1):
  yocto-check-layer: Avoid bug when iterating and autoadding
    dependencies

hongxu (1):
  deb: apply postinstall on sdk

 meta/classes/populate_sdk_ext.bbclass         |   4 +-
 meta/lib/oe/copy_buildsystem.py               |   6 +-
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
 12 files changed, 229 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/bug-image-compositor.ref.png

-- 
2.30.2

