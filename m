Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: H1cVLrpDA4UnDobGbVTJYJJPrGKBvxixJ1YlrIIrv+AXXUc9cGIVeJTfmEXMS+cTANz1ZMm2ME
 bavPFjT5l9MQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247198"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247198"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:49 -0800
IronPort-SDR: 4TL92w3MZ3XOJepwH4Fsoko4yZd75YGY3XsPOWczTMXpoYhEwos0IS/6Ms0TIsPVwEbwZ04/00
 VX0GdKk7C1Xg==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825469"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:48 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/27] libwebp: upgrade 1.1.0 -> 1.2.0
Date: Wed, 17 Feb 2021 13:52:08 +0800
Message-Id: <20210217055210.22019-25-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../webp/{libwebp_1.1.0.bb => libwebp_1.2.0.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.1.0.bb => libwebp_1.2.0.bb} (93%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb b/meta/recipes-multimedia/webp/libwebp_1.2.0.bb
similarity index 93%
rename from meta/recipes-multimedia/webp/libwebp_1.1.0.bb
rename to meta/recipes-multimedia/webp/libwebp_1.2.0.bb
index 68e5ae2b3c..33bec2fe70 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.0.bb
@@ -14,8 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[md5sum] = "7e047f2cbaf584dff7a8a7e0f8572f18"
-SRC_URI[sha256sum] = "98a052268cc4d5ece27f76572a7f50293f439c17a98e67c4ea0c7ed6f50ef043"
+SRC_URI[sha256sum] = "2fc8bbde9f97f2ab403c0224fb9ca62b2e6852cbc519e91ceaa7c153ffd88a0c"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.29.2

