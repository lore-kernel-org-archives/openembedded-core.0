Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.8243.1611038795825494015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gJc6mpwHdgwDTgWbbO20j718+gg/sFBhiekDXiNWs4t07w825fXZGkTwCExpHOpS/GbgKqFH7R
 bUixtwKt0XUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035621"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035621"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:12 -0800
IronPort-SDR: 7OpvgIH8Bt0xA51c+LIFD+MFgf+AU5JdvWjsY9glug9m9lemg+FAq6nnp5kWITOdd+vXJm8fSb
 YL5Z5FJLMZ+A==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441648"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:11 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/30] gst-devtools: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:34 +0800
Message-Id: <20210119064552.115692-12-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-devtools_1.18.2.bb => gst-devtools_1.18.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.2.bb => gst-devtools_1.18.3.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.3.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.18.3.bb
index 9fd9e0be93..21a31b41f5 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "6ea73d718bf1f9692218540ff88479c51d67c0b477fa56d6812fc7b739d30a56"
+SRC_URI[sha256sum] = "3025fee3607caf5069154c099533785675916e044ee92c936bbeacdda3750f26"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.29.2

