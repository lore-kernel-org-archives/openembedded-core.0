Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8467.1611038763704006868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kpeTC18KU4pup0GkO9y16FsvTSSl2CQwkkqtvCXsq8sGnRF8j/2/gbnCGOqY8nS2tajZ563xST
 C0c42bWjormw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035587"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035587"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:04 -0800
IronPort-SDR: Ju7t+KIIS3Gv4IkEaFFn28Nja/iVHnLEI3t4jyJ6kaYi2OwSqN8yppJesnUZy14QV1nKURmDM2
 IJaSh6mK4NwQ==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441599"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:03 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/30] gstreamer1.0-libav: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:28 +0800
Message-Id: <20210119064552.115692-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...streamer1.0-libav_1.18.2.bb => gstreamer1.0-libav_1.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.2.bb => gstreamer1.0-libav_1.18.3.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb
index b638814aa4..8fa93253ac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "36969ad44c5f0756a8a90215410710d6c39713d58f6cee13d663be9774557f49"
+SRC_URI[sha256sum] = "ad20546bcd78ac1e7cf194666d73c4f33efeb62647d2b6af22993b540699e91c"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.29.2

