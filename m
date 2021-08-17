Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.34266.1629168135472276180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 19:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="214133322"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="214133322"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:14 -0700
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="593153063"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.145])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:13 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] embree: upgrade 3.13.0 -> 3.13.1
Date: Tue, 17 Aug 2021 10:42:03 +0800
Message-Id: <20210817024209.114840-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../embree/{embree_3.13.0.bb => embree_3.13.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename dynamic-layers/openembedded-layer/recipes-oneapi/embree/{embree_3.13.0.bb => embree_3.13.1.bb} (95%)

diff --git a/dynamic-layers/openembedded-layer/recipes-oneapi/embree/embree_3.13.0.bb b/dynamic-layers/openembedded-layer/recipes-oneapi/embree/embree_3.13.1.bb
similarity index 95%
rename from dynamic-layers/openembedded-layer/recipes-oneapi/embree/embree_3.13.0.bb
rename to dynamic-layers/openembedded-layer/recipes-oneapi/embree/embree_3.13.1.bb
index 2461eeeb..69e0e7a3 100644
--- a/dynamic-layers/openembedded-layer/recipes-oneapi/embree/embree_3.13.0.bb
+++ b/dynamic-layers/openembedded-layer/recipes-oneapi/embree/embree_3.13.1.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/embree/embree.git;protocol=https \
             "
-SRCREV = "7c53133eb21424f7f0ae1e25bf357e358feaf6ab"
+SRCREV = "12b99393438a4cc9e478e33459eed78bec6233fd"
 
 COMPATIBLE_HOST = '(x86_64).*-linux'
 
-- 
2.31.1

