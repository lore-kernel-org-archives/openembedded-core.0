Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.8125.1611038766599620035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: QUb9sHVg6H31PHuG0tOjEp+261dmsgzP1n9BZxnCMu1Q7T3ME+vhCg3pSGKHOTGwufr00pQFhy
 T4Yl42ra3Dtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035603"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035603"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:10 -0800
IronPort-SDR: AcOz7YbZGnsMuVix31TC3lfUL9kn+xh12sidQ/9tLG8uh9mvMx3IfKMhuChm5FVaxs6dPC7DwR
 Mm9QJ4n1N2DQ==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441615"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:08 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/30] gstreamer1.0-vaapi: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:32 +0800
Message-Id: <20210119064552.115692-10-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...streamer1.0-vaapi_1.18.2.bb => gstreamer1.0-vaapi_1.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.2.bb => gstreamer1.0-vaapi_1.18.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb
index f237191d5f..23040ad73c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "8c7b2c74fda095d83dea67accde6a68ba9f608d97ed969fdcf278930f9b1c7c0"
+SRC_URI[sha256sum] = "ae9877f15757a661d4dfe6a09755a2faa959ab60752f14ca26b7ff10765e1f12"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.29.2

