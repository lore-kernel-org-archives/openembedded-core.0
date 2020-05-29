Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: aPh5IipW0tMxE4pOcS/UU+GwPKcPe95rpTP6fa4uvYfoOsfJCTis4R8nHioIeUDfO2hPXlssvs
 wSkXgOZSKHfA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:57 -0700
IronPort-SDR: 9G9jt0bBeGjoFaN2ICl9Ja6a41zS+WGwRbakvIHo4bUklcHeMBbBKC6TXp6zmsZrjGg75xQ2jF
 VDGpCRVmCBkg==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866266"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 19/25] gstreamer1.0-vaapi: upgrade 1.16.1 -> 1.16.2
Date: Fri, 29 May 2020 13:52:55 +0800
Message-Id: <16b254a5c7674bd9894a20037b10202d1450ac58.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...reamer1.0-vaapi_1.16.1.bb => gstreamer1.0-vaapi_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.1.bb => gstreamer1.0-vaapi_1.16.2.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
index 61cf705fd8..3170218abd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-vaapsink-downgrade-to-marginal.patch \
            "
 
-SRC_URI[md5sum] = "15b08f76777359d87b0b4a561db05f1f"
-SRC_URI[sha256sum] = "cb570f6f1e78cb364fbe3c4fb8751824ee9db0c942ba61b62380b9b5abb7603a"
+SRC_URI[md5sum] = "13f7cb6a64bde24e67f563377487dcce"
+SRC_URI[sha256sum] = "191de7b0ab64a85dd0875c990721e7be95518f60e2a9106beca162004ed7c601"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.25.4

