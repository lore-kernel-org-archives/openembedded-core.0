Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: L/NPRTWhACNNv+PDNOTi42PEHyk0Fdyc5mPUUxvC5Uo8NOiLc84vnLom3uh7iunP8UnEUHwkz/
 +KKWlvQV1Cog==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428853"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428853"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:43 -0800
IronPort-SDR: FZmhxDR+bc+aDZnzpT5b4qxOcflJOLMUUbVrcx7LrZAherMFk+sxX7fabcVFHSksEdBwCtRsOY
 llIjoFWR9lsQ==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490053"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:42 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/22] gstreamer1.0-omx: Update 1.16.2 -> Update 1.16.3
Date: Fri,  6 Nov 2020 14:28:08 +0800
Message-Id: <d82aae6725545449edd5e4a8d04d67cf5168846a.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

(From OE-Core rev: e091bfead5907cc13c237d7464c50efe8810d6cd)

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
index f1bdbd235d..1aa13cf73c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6362786d2b6cce34de08c86b7847f782"
-SRC_URI[sha256sum] = "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439"
+SRC_URI[md5sum] = "d4d89dd44362c1d262186c60437cdbee"
+SRC_URI[sha256sum] = "60603b7889528ef8539d36cb3284b648c46aa0cf980a28cba4d3fe3a44988ff9"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.28.0

