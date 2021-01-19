Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8244.1611038799087798389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: McINx8ANefUHVxOj5iFHpyTeUP5b0Zkv1ms4uhM6L9alopCLqPEYsixsq1XBHtrnXgw9XYQS4R
 y+WQgCBAdhmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035664"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035664"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:32 -0800
IronPort-SDR: VsSlltEfGCRTyCt/Lb2r/rbzNu/m6YYLobmr0O1ohI4hF0iAINXhMjJzZ0vzrc0NxkeSyvQQFp
 1KPf98w37LQg==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441840"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:31 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 28/30] lighttpd: upgrade 1.4.57 -> 1.4.58
Date: Tue, 19 Jan 2021 14:45:50 +0800
Message-Id: <20210119064552.115692-28-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../lighttpd/{lighttpd_1.4.57.bb => lighttpd_1.4.58.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.57.bb => lighttpd_1.4.58.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.58.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.58.bb
index 9a9cad68c8..f0589e94c0 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.57.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.58.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[sha256sum] = "52ca961b89c12f7ecbb2e4e0c5a9e79b2863c64e33c42832a165e7f894d6217f"
+SRC_URI[sha256sum] = "267feffda13a190ebdce7b15172d8be16da98008457f30fddecd72832d126d0e"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.29.2

