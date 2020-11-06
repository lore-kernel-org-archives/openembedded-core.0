Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: rAfK2vJJtZ8+N1QbmVgZfMIbgR6ccPL5ZtnuUxKJUHkCJLKm5+uFvbiZBUORRVaWQjW4+M6r+3
 bmsVbxKn9Oew==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428834"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428834"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:39 -0800
IronPort-SDR: A116+fb1VXUKFqVCVAnPdmO2ITTEcF+9x5WHphvozydr5PMBQ4Mw3m+aVyRn+Y7ljiTCrfxaph
 lQUKZcKaivcQ==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490004"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:38 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/22] gstreamer1.0-libav: Update 1.16.2 -> Update 1.16.3
Date: Fri,  6 Nov 2020 14:28:05 +0800
Message-Id: <1cc05b37c302c393a8137a619225e66f16778a56.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

(From OE-Core rev: af7cf7c37b4ea30592529442c72f22309cb577c5)

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...reamer1.0-libav_1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
index 2fdefc925e..98355a1b75 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "eacebd0136ede3a9bd3672eeb338806b"
-SRC_URI[sha256sum] = "c724f612700c15a933c7356fbeabb0bb9571fb5538f8b1b54d4d2d94188deef2"
+SRC_URI[md5sum] = "d08fb5429f102d5a3f1eca3dee2a0add"
+SRC_URI[sha256sum] = "d10c5eb1a00a91de97c85c0956c663aa6e99d268195cdec4534c179b831538ec"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.28.0

