Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: fES6s5FYK7L01cFuGW15t2pkv2tnMuf5dxgaAG4xFe6Jgvx35McbnyhTPqw2Kn60Tvmaez1bJJ
 LPTcJxHIteeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158719971"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158719971"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:23 -0800
IronPort-SDR: VRn9zZzXhDkexoKtCK9r4JDCMUFEarfyKgZmEJJ2ZyxNncHIYS4K8xFYJwdkcgysTzjnXU6GPP
 ci5ZYxpp65CQ==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802958"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:22 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/19] clutter-gst-3.0: do not call out to host gstreamer plugin scanner
Date: Tue, 17 Nov 2020 23:35:55 +0800
Message-Id: <4088ef3f6e608031a4f951cce5cc30b0af867e75.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is host contamination and can also fail for all kinds of
reasons when running under usermode qemu.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fb60d0920b660dffb346b2212dc6f8ba2a0b9fde)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index fc3eade886..7d9db1f38c 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -6,6 +6,8 @@ inherit clutter features_check upstream-version-is-even gobject-introspection
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
+export GST_PLUGIN_SCANNER_1_0="${S}/gst-plugin-scanner-dummy"
+
 SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
 
 DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0 libgudev"
-- 
2.28.0

