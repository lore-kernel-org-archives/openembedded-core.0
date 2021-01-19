Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.8467.1611038763704006868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: fAdM/HGVnJPtfSekyXIMr6q4f3hzOWT3MLqCRS+lb62hAKZTwNnroPUXB+RpJEHZvOigSa/mWA
 rjQiYbH9HZJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035583"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035583"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:02 -0800
IronPort-SDR: gT3lo3KcXX8EM2Iru19WFqHZTSjF8L1yffXIBepS0eOXJ/Lgx1ibU2EBcoME/j6qD4bJF3SFXJ
 Zw8MnHmfON8Q==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441582"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:00 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/30] gstreamer1.0-plugins-good: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:26 +0800
Message-Id: <20210119064552.115692-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-good_1.18.2.bb => gstreamer1.0-plugins-good_1.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.2.bb => gstreamer1.0-plugins-good_1.18.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.3.bb
index 2e076bf884..7643e9e601 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.3.bb
@@ -4,7 +4,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "f71752dde434d9ec55fa5e8d2e2a3be3fc6eb5b34f397b065f84aead25b449a4"
+SRC_URI[sha256sum] = "9b3b8e05d4d6073bf929fb33e2d8f74dd81ff21fa5b50c3273c78dfa2ab9c5cb"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.29.2

