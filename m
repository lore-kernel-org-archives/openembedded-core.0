Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: dzyaEPIoLjaur1qF1nOt+MVfv/0uQABTEEUBeDeLrVfFlixLymki7xfa3FpGtE6ztp99qd40Km
 CvwxSsOdBx1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:51 -0700
IronPort-SDR: SCG/9zEkcn59vWMU4YJ7VCBiHH+B7Z/ddyOWLBeGknOcFEWRJz2iPGNaVHJTqs8KixBuS4qs8U
 YFgNmWBwjNbQ==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866255"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:48 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 17/25] gstreamer1.0-python: upgrade 1.16.1 -> 1.16.2
Date: Fri, 29 May 2020 13:52:53 +0800
Message-Id: <b6006b561265dc6972011d4dd1a9539b501438f1.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...amer1.0-python_1.16.1.bb => gstreamer1.0-python_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.1.bb => gstreamer1.0-python_1.16.2.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
index c0f8b5aaa3..989556ce8b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
            file://0001-meson.build-fix-builds-with-python-3.8.patch \
            "
-SRC_URI[md5sum] = "499645fbd1790c5845c02a3998dccc1b"
-SRC_URI[sha256sum] = "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8df35b780bd8347489"
+SRC_URI[md5sum] = "6ac709767334d8d0a71cb4e016f6abeb"
+SRC_URI[sha256sum] = "208df3148d73d9f416d016564737585d8ea763d91201732d44b5fe688c6288a8"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.25.4

