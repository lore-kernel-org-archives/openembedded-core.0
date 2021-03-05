Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TWgp6I9bm9Ms/IL2OomgiLUR0N78/AkEkPOs2UkV4F/mVrHrdnBHdRifEXo+pmlZE9gLT0N69n
 nttxFF0gafnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671213"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671213"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:57 -0800
IronPort-SDR: SsfGFg16PCgHOWfUgjDNtWEOeSGV/ukb3p3u6Rp8oloa2HwH0wzmdtPtFgXCwz4urHuXXG9tSw
 gaxOF57/EZvA==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129126"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:55 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 43/52] bitbake.conf/image: Move image specific PSEUDO_IGNORE_PATHS to image class
Date: Fri,  5 Mar 2021 12:21:19 +0800
Message-Id: <88db28ed7eb827a63e680f0fb41c78d5c08704e6.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This path is image specific so we can move to the image class
definition of PSEUDO_IGNORE_PATHS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 66a8ca0f206434e0b301a8fdc90f062750d6d118)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6d3d5692da..60b07de221 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -180,7 +180,7 @@ IMAGE_LOCALES_ARCHIVE ?= '1'
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
-PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/intercept_scripts,${WORKDIR}/oe-rootfs-repo"
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/intercept_scripts,${WORKDIR}/oe-rootfs-repo,${WORKDIR}/sstate-build-image_complete"
 
 PACKAGE_EXCLUDE ??= ""
 PACKAGE_EXCLUDE[type] = "list"
-- 
2.29.2

