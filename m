Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: cVb6FjM+heAdy8BhD4S2R3RU/u4kw8e3tS9/aGij40L9NiV0H4jpbjMY3A4aRJOfwv2kyfFmWQ
 psQV2xbbHneg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:35 -0700
IronPort-SDR: FmfPyLoGovmT1dMemQcTIdkUOSn10baPb0PpHwmcAsvXdLlxTsKJfM/EQPSk7sVM4idyRmCoSF
 FsTKRo6r/R1g==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866196"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:33 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 11/25] gstreamer1.0-plugins-base: upgrade 1.16.1 -> 1.16.2
Date: Fri, 29 May 2020 13:52:47 +0800
Message-Id: <dedd38b6d864aacb79007b624fe69bdeec20e98d.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ins-base_1.16.1.bb => gstreamer1.0-plugins-base_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.1.bb => gstreamer1.0-plugins-base_1.16.2.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
index cb99fba5ff..95d3a3679e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
@@ -18,8 +18,8 @@ SRC_URI = " \
             file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
             file://link-with-libvchostif.patch \
             "
-SRC_URI[md5sum] = "b5eb0651bab70bf1714f103bdd66ce47"
-SRC_URI[sha256sum] = "5c3cc489933d0597087c9bc6ba251c93693d64554bcc563539a084fa2d5fcb2b"
+SRC_URI[md5sum] = "3fdb32823535799a748c1fc14f978e2c"
+SRC_URI[sha256sum] = "b13e73e2fe74a4166552f9577c3dcb24bed077021b9c7fa600d910ec6987816a"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.25.4

