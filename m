Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: luZO3Hw+2wX8MnirO4MxHV9CV7jiwdJWYmEy/zy6nLl3Tg+stsKorTQUYZhpgRjmt5FBV+8uVo
 MG6P6PKr/a2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428819"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428819"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:37 -0800
IronPort-SDR: BN7iDQF9tkECdBkqH3vMyCQzHgOrJDRSg7HMYHZLf1yrNi5DT5COY2RYz6xZ1yO3HxbiK/Kxhe
 6q11aSwr5FHg==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321489991"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:36 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 05/22] gstreamer1.0-plugins-bad: Update 1.16.2 -> Update 1.16.3
Date: Fri,  6 Nov 2020 14:28:03 +0800
Message-Id: <9b716b146dc875bf55f1ad093dc95244a201d745.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

(From OE-Core rev: ee8e7a9fb8f3d29357598b2a533bb44da12d6099)

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ugins-bad_1.16.2.bb => gstreamer1.0-plugins-bad_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.2.bb => gstreamer1.0-plugins-bad_1.16.3.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.3.bb
index 99176b2571..ffbaaf425a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.3.bb
@@ -8,8 +8,8 @@ SRC_URI = " \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
 "
-SRC_URI[md5sum] = "ccc7404230afddec723bbdb63c89feec"
-SRC_URI[sha256sum] = "f1cb7aa2389569a5343661aae473f0a940a90b872001824bc47fa8072a041e74"
+SRC_URI[md5sum] = "8969ea1aec3411c13d0e7dd27ccaaef1"
+SRC_URI[sha256sum] = "84efe57011658f0a53a5d5b20f64ef109f5105dccb0808c21e069e946673514d"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.28.0

