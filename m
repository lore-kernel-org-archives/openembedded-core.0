Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: olZBq8L8CSnWJClXu+N0YfOIkSPBSo8SgOyFWG4oo8HTjguunO1YIoXKJ3ijxHW+xXU36KJ9zX
 IMhjuyW8RwSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:54 -0700
IronPort-SDR: yJlmPh+7+ad4+4axzVn+Glc47qVc/UoZHoK5JeIUcJ3T/bRbuugr0bfhtlyUUFtE8MSlGWdreg
 MKjJs4qyrdWg==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866261"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:51 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 18/25] gstreamer1.0-rtsp-server: upgrade 1.16.1 -> 1.16.2
Date: Fri, 29 May 2020 13:52:54 +0800
Message-Id: <e197e69d32dd8bf0d6861f26a0fe9a46547a4e7e.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...sp-server_1.16.1.bb => gstreamer1.0-rtsp-server_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.1.bb => gstreamer1.0-rtsp-server_1.16.2.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
index 45302ef4f6..15ef5d1b28 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.x
            file://gtk-doc-tweaks.patch \
            "
 
-SRC_URI[md5sum] = "380d6a42e856c32fcefa508ad57129e0"
-SRC_URI[sha256sum] = "b0abacad2f86f60d63781d2b24443c5668733e8b08664bbef94124906d700144"
+SRC_URI[md5sum] = "8a998725820c771ba45be6e18bfdf73a"
+SRC_URI[sha256sum] = "de07a2837b3b04820ce68264a4909f70c221b85dbff0cede7926e9cdbb1dc26e"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.25.4

