Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: S1l3Zb3nu2l6PE4fAkaPpB1JbwzW3YEA7g33/iabtos896dm3eUIiWFbTqdoArCKxUNRTpREtE
 QRy7O2R7HZ1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004407"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004407"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:08 -0800
IronPort-SDR: 94TCm2WwDrLybjk/NspjyVF8f3GchVbxJ2/UevSpf4JbT4VldZgf0DU2yxpj9AX9pCO3xOW2i+
 1nESmrfliMFw==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302695"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:06 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/21] gstreamer1.0-plugins-base: set CVE_PRODUCT
Date: Mon, 30 Nov 2020 09:11:27 +0800
Message-Id: <679964bf178e0bba9fc3e5f8064b1cd55bf159c0.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

There are CVEs with the 'gst-plugins-base' product, so set that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec0f0e5995ab498f50ad51ceb361784247614982)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.16.3.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
index a4f4772c1c..9daaf7587e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
@@ -97,3 +97,5 @@ def get_opengl_cmdline_list(switch_name, options, d):
         return '-D' + switch_name + '=' + ','.join(selected_options)
     else:
         return ''
+
+CVE_PRODUCT += "gst-plugins-base"
-- 
2.28.0

