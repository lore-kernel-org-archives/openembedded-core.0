Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: XSLTuJpqJy8hnFfYYN1zbL8Fti4BbL+iihOlIYzhlPjeZj/Vc+afq8gU+1Y1vClnWst22iWy7O
 wjL/jtDhINRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247098"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247098"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:27 -0800
IronPort-SDR: LWeFY2uR3rBBMvtOUL2KORZuqzFwv/dubzc5WnUWzP3rTVnpoh8nfF3Ta3wL3D2Fi5vzQRdaE9
 N0kHr1//KMiQ==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825413"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:26 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/27] libuv: upgrade 1.40.0 -> 1.41.0
Date: Wed, 17 Feb 2021 13:51:52 +0800
Message-Id: <20210217055210.22019-9-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libuv/{libuv_1.40.0.bb => libuv_1.41.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.40.0.bb => libuv_1.41.0.bb} (90%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.40.0.bb b/meta/recipes-connectivity/libuv/libuv_1.41.0.bb
similarity index 90%
rename from meta/recipes-connectivity/libuv/libuv_1.40.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.41.0.bb
index f793db09be..ab06a43d21 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.40.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.41.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "4e69e333252693bd82d6338d6124f0416538dbfc"
+SRCREV = "1dff88e5161cba5c59276d2070d2e304e4dcb242"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.29.2

