Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8467.1611038763704006868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: t9dogFhcWDimANKTZq3GN/i2SEhh5B6MVWfb0Nt4E7Okt1h3DEXDQmw8GxnOiOxdaeZjYNauq9
 Sf7RfnqHduWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035580"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035580"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:00 -0800
IronPort-SDR: m8+HYJwrrd1CrOY0D1Oxag7qCW6rEh9pSjrsf5a5XDtL1/bPXZ/7vVEA541G0O/HCBSo/apw7j
 ikUDTVD7bz6w==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441578"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:45:59 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/30] gstreamer1.0-plugins-base: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:25 +0800
Message-Id: <20210119064552.115692-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-base_1.18.2.bb => gstreamer1.0-plugins-base_1.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.2.bb => gstreamer1.0-plugins-base_1.18.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb
index 531d577b0c..84602246c9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[sha256sum] = "dd04fb1f7826e2f6d9b4d66fc22f19cc6a47c301e13041f0ee3d7f65c89b05ac"
+SRC_URI[sha256sum] = "dbfa20283848f0347a223dd8523dfb62e09e5220b21b1d157a8b0c8b67ba9f52"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.29.2

