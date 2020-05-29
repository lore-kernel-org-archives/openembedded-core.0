Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /Whii8GuWdwOYb8XyUqcUCH57YiTtfgVh6mlgjdE+T9St9D9546PyKlk9V8vIWLk8cPvAbjTmV
 ARHa+abSGS4g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:54:00 -0700
IronPort-SDR: H+RpHcJ0c8fwPbS4QyYogc+1vScVkIlgjMpmUm+3GapDbGsgJbABN/BjFh7Dt3OJRJZDagyvFA
 KkQ96HMnTfZw==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866271"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:58 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 20/25] gst-validate: upgrade 1.16.1 -> 1.16.2
Date: Fri, 29 May 2020 13:52:56 +0800
Message-Id: <53d655fdf2c7004fa95e2bb591f1e4d2289ba674.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-validate_1.16.1.bb => gst-validate_1.16.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.1.bb => gst-validate_1.16.2.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
index 7d602eabc6..35492fe861 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "793e75f4717f718ad204c554d577b160"
-SRC_URI[sha256sum] = "7f079b9b2a127604b98e297037dc8847ef50f4ce2b508aa2df0cac5b77562899"
+SRC_URI[md5sum] = "688f42c52d62e8c5e506df911553fb2c"
+SRC_URI[sha256sum] = "4861ccb9326200e74d98007e316b387d48dd49f072e0b78cb9d3303fdecfeeca"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.25.4

