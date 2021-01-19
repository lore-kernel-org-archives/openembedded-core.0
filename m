Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.8124.1611038764033174121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Iw2pmrA7suiuwLFq0dDGA3jq9yphIDsiBfwk7zvkpRI0zB+6Cx+4NjHbt0FM/gZjZyILkHX5Mm
 iNEn+GmC+F0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035586"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035586"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:03 -0800
IronPort-SDR: OMU6FY6fifNQ4OPjK4oH8XIbqdTp8NEtrww8kQZfTSmyrTxJylRHNHvsBA01jKdF8iaYsguH5J
 L6SG2awW81uQ==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441595"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:02 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/30] gstreamer1.0-plugins-bad: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:27 +0800
Message-Id: <20210119064552.115692-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...plugins-bad_1.18.2.bb => gstreamer1.0-plugins-bad_1.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.2.bb => gstreamer1.0-plugins-bad_1.18.3.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.3.bb
index 6d0c988b7a..bbb7427b07 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.3.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-msdk-fix-includedir-path.patch \
            "
-SRC_URI[sha256sum] = "8ad5822f1118fe46a19af54422b74e3a16d79a6800dcb173b49e199a496b341a"
+SRC_URI[sha256sum] = "b7e34b6b86272588fbd8b314dadfa6ceff895198cfb59e2950378e9e31ff22e0"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.29.2

