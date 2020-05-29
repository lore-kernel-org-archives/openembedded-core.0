Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 7rebar84Fbp1tkwJudse4gbbgS0bbWPv81AqMoJUMskC1T5MVv8OOcC/XUDdRPpCLFZya62Sqi
 CdtkVwn2Qijg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:38 -0700
IronPort-SDR: xhGj2uUceZDsY6WWVGfa0ylDBAA86TlqoemmhlItPj05O6BNsCN1/oXuFXj8heJ7SE3Wip3Ykt
 O1HhlaqiCbkA==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866210"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:37 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 12/25] gstreamer1.0-plugins-good: upgrade 1.16.1 -> 1.16.2
Date: Fri, 29 May 2020 13:52:48 +0800
Message-Id: <f27f40c36f12ec30b5def1d8d48aa9ed221f8402.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ins-good_1.16.1.bb => gstreamer1.0-plugins-good_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.1.bb => gstreamer1.0-plugins-good_1.16.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
index 0fa7b86ffe..ea0cbddc72 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
@@ -5,8 +5,8 @@ SRC_URI = " \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
 
-SRC_URI[md5sum] = "515987ee763256840a11bd8ea098f2bf"
-SRC_URI[sha256sum] = "9fbabe69018fcec707df0b71150168776040cde6c1a26bb5a82a136755fa8f1f"
+SRC_URI[md5sum] = "bd025f8f14974f94b75ac69a9d1b9c93"
+SRC_URI[sha256sum] = "40bb3bafda25c0b739c8fc36e48380fccf61c4d3f83747e97ac3f9b0171b1319"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.25.4

