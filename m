Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.8125.1611038766599620035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: wsJq3R5snFsz/Hj3gN8MqGW4FBHKy61Na+YZY+m8Q+V9bCBGBFXt5VxqewxJcxdkhDbNkBzOu5
 aeMwHDryning==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035593"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035593"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:07 -0800
IronPort-SDR: yL8oYaMU+MPo0Yd08zuz1o7VbyNA3oHb8akCXM0HljaCpOx1PrGMi2hE7kdfjPlYzA/DGXHlHj
 Y+BjPL8pTMbQ==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441609"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:06 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/30] gstreamer1.0-rtsp-server: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:30 +0800
Message-Id: <20210119064552.115692-8-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...rtsp-server_1.18.2.bb => gstreamer1.0-rtsp-server_1.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.2.bb => gstreamer1.0-rtsp-server_1.18.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.3.bb
index b680aa38d6..d6aaa5df79 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.3.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "973922aba65a1672a131527dee965fb09bab4bb996c351f0ee7f42f0d5b954e2"
+SRC_URI[sha256sum] = "4f7757293b3d73dc49768b7392791668c4d0c21d41824624ffbd75c7f9ee0168"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.29.2

