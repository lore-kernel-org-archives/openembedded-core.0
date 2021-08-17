Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.34266.1629168135472276180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 19:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="214133338"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="214133338"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="593153072"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.145])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:19 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] lms: upgrade 2109.0.0.0 -> 2127.0.0.0
Date: Tue, 17 Aug 2021 10:42:08 +0800
Message-Id: <20210817024209.114840-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817024209.114840-1-anuj.mittal@intel.com>
References: <20210817024209.114840-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-bsp/amt/{lms_2109.0.0.0.bb => lms_2127.0.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename dynamic-layers/openembedded-layer/recipes-bsp/amt/{lms_2109.0.0.0.bb => lms_2127.0.0.0.bb} (96%)

diff --git a/dynamic-layers/openembedded-layer/recipes-bsp/amt/lms_2109.0.0.0.bb b/dynamic-layers/openembedded-layer/recipes-bsp/amt/lms_2127.0.0.0.bb
similarity index 96%
rename from dynamic-layers/openembedded-layer/recipes-bsp/amt/lms_2109.0.0.0.bb
rename to dynamic-layers/openembedded-layer/recipes-bsp/amt/lms_2127.0.0.0.bb
index 8ff8c88a..f911044f 100644
--- a/dynamic-layers/openembedded-layer/recipes-bsp/amt/lms_2109.0.0.0.bb
+++ b/dynamic-layers/openembedded-layer/recipes-bsp/amt/lms_2127.0.0.0.bb
@@ -31,7 +31,7 @@ SYSTEMD_SERVICE:${PN} = "lms.service"
 
 SRC_URI = "git://github.com/intel/lms.git \
            "
-SRCREV = "e0ebda9d1e7884b51293b71c1bcda511a7942e1a"
+SRCREV = "6ef4440c40783aad218efa6df8768d8c99380c2b"
 
 do_install:append() {
     install -d ${D}${systemd_system_unitdir}
-- 
2.31.1

