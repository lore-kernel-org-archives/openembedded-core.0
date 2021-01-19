Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.8125.1611038766599620035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Xe+yMqCJEYAE9mbujvrMZeU+pPWAMOzs2NZ+7VrP2mALR+/2rZydeC09+q52ZKarGQpkLyMFV1
 Ezqz5PgVaqBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035589"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035589"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:06 -0800
IronPort-SDR: E8SRypQ9KllvtUtLxwCI+jkDdGCoVR04FNxzDR26/XH7tG8Bit4NiqzqoWRMFXdGoNOH072V2i
 G6nsjakbv1IQ==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441606"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:05 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/30] gstreamer1.0-omx: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:29 +0800
Message-Id: <20210119064552.115692-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0-omx_1.18.2.bb => gstreamer1.0-omx_1.18.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.2.bb => gstreamer1.0-omx_1.18.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
index 686fcc2655..797ed60722 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4c05d64544eecf4aaf5b337789916c67ed720317dfb2c8c8c335720fcc5c7cf4"
+SRC_URI[sha256sum] = "ed0f26504e9a60e15055134410f156e40952336410f2a59bdbbda45e61e8b93f"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.29.2

