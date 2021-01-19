Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.8125.1611038766599620035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: dEBDMt50FWSkZsZhd1jSduePenf2w91DwjFxgRsOo1vgoU5YIW/WxezodfmyHGMXzMiU4ANDzT
 VaNWhbC3Z5vQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035612"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035612"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:11 -0800
IronPort-SDR: E+kM83+bOqJHGnvfk0PRqwsTKFGDXoW/coS79jnVPsn0VU/8/DOzu7IJiwJqU6iU6MuzrcgFnL
 J9u5us/ICdAQ==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441625"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:10 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/30] gst-examples: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:33 +0800
Message-Id: <20210119064552.115692-11-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-examples_1.18.2.bb => gst-examples_1.18.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.2.bb => gst-examples_1.18.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb
index 54a4b5df15..35a8928f51 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "45086d8ef2d75244d9d5c8f69c0f0e1dfd4200b3"
+SRCREV = "06599904baa5d0e47b5cb9501372156567760f8e"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

