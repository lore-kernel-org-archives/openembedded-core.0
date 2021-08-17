Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.34266.1629168135472276180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 19:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="214133332"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="214133332"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="593153071"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.145])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:18 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] ixgbevf: upgrade 4.11.1 -> 4.12.4
Date: Tue, 17 Aug 2021 10:42:07 +0800
Message-Id: <20210817024209.114840-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817024209.114840-1-anuj.mittal@intel.com>
References: <20210817024209.114840-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in this release:
- Added support for 5.12 kernel version
- Added support for RHEL 8.4
- Added support for SLES 15sp3

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../intel-ethernet/{ixgbevf_4.11.1.bb => ixgbevf_4.12.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-kernel/intel-ethernet/{ixgbevf_4.11.1.bb => ixgbevf_4.12.4.bb} (94%)

diff --git a/recipes-kernel/intel-ethernet/ixgbevf_4.11.1.bb b/recipes-kernel/intel-ethernet/ixgbevf_4.12.4.bb
similarity index 94%
rename from recipes-kernel/intel-ethernet/ixgbevf_4.11.1.bb
rename to recipes-kernel/intel-ethernet/ixgbevf_4.12.4.bb
index 2fa23a68..54e0a226 100644
--- a/recipes-kernel/intel-ethernet/ixgbevf_4.11.1.bb
+++ b/recipes-kernel/intel-ethernet/ixgbevf_4.12.4.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/${BP}/COPYING;md5=a216b4192dc6b777b6f0db56
 SRC_URI = "https://sourceforge.net/projects/e1000/files/ixgbevf%20stable/${PV}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "0031d09a54af9ecf1216c185e4641e38527643afa09e78d1bd95752e49fe8985"
+SRC_URI[sha256sum] = "d81f981dea85165057e92bd0d32c41f990890c57c35e2f0857229c9e490f7a1b"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/e1000/files/ixgbevf%20stable/"
 UPSTREAM_CHECK_REGEX = "ixgbevf%20stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.31.1

