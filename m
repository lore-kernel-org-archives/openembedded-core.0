Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: cNWHMjKVKky0ySaRnvtBhs5fsALaB83nfLVolv/1uZPmRBDza5oUoso4caD8aqfmObt4NMPN02
 TMBs01PIyqZQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:40 -0700
IronPort-SDR: GKZ+t120vhCi5YXWchomPVSeBpr3VFryxzqMtKT//Cb59UaaAjQ9Oe+CFp9iT3ZCdIO3fIT7Ya
 OxyeJRb8nhrw==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866211"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:39 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 13/25] gstreamer1.0-plugins-bad: upgrade 1.16.1 -> 1.16.2
Date: Fri, 29 May 2020 13:52:49 +0800
Message-Id: <06a6dc2355463568e8e0979bffe4899b916726df.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-bad_1.16.1.bb => gstreamer1.0-plugins-bad_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.1.bb => gstreamer1.0-plugins-bad_1.16.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
index 1731be8441..756b823e7d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
@@ -8,8 +8,8 @@ SRC_URI = " \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "24d4d30ecc67d5cbc77c0475bcea1210"
-SRC_URI[sha256sum] = "56481c95339b8985af13bac19b18bc8da7118c2a7d9440ed70e7dcd799c2adb5"
+SRC_URI[md5sum] = "ccc7404230afddec723bbdb63c89feec"
+SRC_URI[sha256sum] = "f1cb7aa2389569a5343661aae473f0a940a90b872001824bc47fa8072a041e74"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.25.4

