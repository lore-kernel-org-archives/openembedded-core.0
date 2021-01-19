Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.8125.1611038766599620035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RB3SigDyisUkp43z2srbYliN2gLNQ2bRypf7h48OOnWyTElMWFMLaFgg2cfwXKcOu4MhfkiObW
 tn2DqtKhbEYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035598"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035598"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:08 -0800
IronPort-SDR: mzhBBagyUlWiaqDEWn7FbECz6T7TDn3RzgYV2rNoxPT8n+p45qacWUuCBMfcf0/tlU3Kzy21sm
 7tpk51Z1/+0Q==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441612"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:07 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/30] gstreamer1.0-python: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:31 +0800
Message-Id: <20210119064552.115692-9-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...reamer1.0-python_1.18.2.bb => gstreamer1.0-python_1.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.2.bb => gstreamer1.0-python_1.18.3.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
index 5711744b4d..897d246793 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e19d0f760b353e88161b3712193cffbd79bf1314418da792b5fec4d8ecef389c"
+SRC_URI[sha256sum] = "4e630735276e08ff4d70337aa5d91fd008e5f1ed3dc0993674cd5820e264259a"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.29.2

