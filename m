Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 7JZmlvPmFlZn+d/0bOl+1GvHBHJVP4T1EHrVEopBMKkYwG+GIoeLrirANAZS1c32B7T+lcm/C4
 dYXu/uL7Tydg==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004402"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004402"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:06 -0800
IronPort-SDR: BzPABQWp1esLJy1D5Ov7YA9a8pcT3AzsIkedMndicCRiU6dsZDStoEy3q3/ohxCChfyOaS80J+
 a/8OaWb3GIPg==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302691"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:05 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/21] gstreamer1.0-rtsp-server: set CVE_PRODUCT
Date: Mon, 30 Nov 2020 09:11:26 +0800
Message-Id: <096b1aa0727ee29adaf54b3133ebdaa71399a967.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

There are CVEs with the 'gst-rtsp-server' product, so set that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb5cbdead78d092733e783b09528b208efccac3d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
index 5f1b1d44fa..ed51a5693e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
@@ -29,3 +29,5 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 # Starting with 1.8.0 gst-rtsp-server includes dependency-less plugins as well
 require gstreamer1.0-plugins-packaging.inc
+
+CVE_PRODUCT += "gst-rtsp-server"
-- 
2.28.0

