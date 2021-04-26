Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.3122.1619415956730921110
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 22:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TO4Wu5+WaO1shbPT/AQAMNV2lSa6SMhVWgfyFZ8s60BXQvWFo9g8c3CypcsuPXM80+jp/wR7pF
 /p6vCwti3fpg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="281613557"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="281613557"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:45:55 -0700
IronPort-SDR: AIL5mIrk7koYGRDLnlVeU5q/0sFbT+PJpJhZxeVLGIRjwFTFwKz7v7SyafRhnYVUUIC6XXaZ6m
 EhM3nFYm3tWA==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="385670668"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:45:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 0/8] review request
Date: Mon, 26 Apr 2021 13:45:38 +0800
Message-Id: <cover.1619409036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these changes for gatesgarth. Builds cleanly on
autobuilder except for one failure that doesn't look related to the
changes.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2078

Thanks,

Anuj

The following changes since commit 147a08dced5e565f19f4987a3c199780dc00f878:

  busybox: fix CVE-2021-28831 (2021-04-20 10:37:33 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.109
  linux-yocto/5.4: update to v5.4.111
  linux-yocto/5.4: update to v5.4.112
  linux-yocto/5.4: fix arm defconfig warnings

Gavin Li (1):
  kmod: do not symlink config.guess/config.sub during autoreconf

Khem Raj (1):
  ca-certificates: Fix openssl runtime cert dependencies

Konrad Weihmann (1):
  cve-update-db-native: skip on empty cpe23Uri

Richard Purdie (1):
  sanity: Further improve directory sanity tests

 meta/classes/sanity.bbclass                   | 21 ++++++++++--------
 .../recipes-core/meta/cve-update-db-native.bb |  7 +++++-
 meta/recipes-kernel/kmod/kmod.inc             |  1 -
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 .../ca-certificates_20210119.bb               |  6 ++---
 7 files changed, 39 insertions(+), 32 deletions(-)

-- 
2.30.2

