Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gg0-f173.google.com (mail-gg0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id CF7016E75F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:31 +0000 (UTC)
Received: by mail-gg0-f173.google.com with SMTP id n5so753620ggj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=8IH/b728MLcyWtJH7JyHiakiw3YLOrP6d1Olv+u6lOI=;
	b=QiKJC5uynTwQ/nGLtOaGpk7Le0yw7HDg1hsMQaXgrQPzwAmXkJA2eg1/fy5BlFzCNo
	dKUE5RLJgQwCIRGdFnQuVgUq6EMRsWgvMHkasFtxbETJvfWwdgYt3n9FRq38sR16qrn3
	bQh/ctL8I09wmudnGDgVkwuPyllEgnce4AJFw5MuFNQ/526uwaBaVyh8dfmCj8uDLAie
	cSi1qVYakBqNc6P/R0SM99zGG3okSaXZwgPNr/6vnF3nyR/uxcYA+P/nBdLo2L2Syr4d
	nO6Qyg4qvarv4ysRgN3hfn7y9p5xnqTzAEzAxN0kcCr6yWOAz+oRe2xFKbo1bx5m4AC0
	oaEQ==
X-Received: by 10.236.121.162 with SMTP id r22mr10064162yhh.47.1390526792609; 
	Thu, 23 Jan 2014 17:26:32 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id h66sm42456281yhb.7.2014.01.23.17.26.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:31 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 24DBB17BF8D01; Thu, 23 Jan 2014 23:26:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:15 -0200
Message-Id: <1390526775-26036-12-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-fsl-arm][PATCH v3 11/11] gst-fsl-plugin: Upgrade to 3.0.10 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jan 2014 01:26:32 -0000

From: Lauren Post <lauren.post@freescale.com>

Release in 3.10.17-1.0.0_beta version

Change-Id: I94eacbce00c48fb15815f532097e4953e459938b
Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 recipes-multimedia/gstreamer/gst-fsl-plugin.inc       |  6 +-----
 recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.10.bb | 14 ++++++++++++++
 recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.9.bb  | 17 -----------------
 3 files changed, 15 insertions(+), 22 deletions(-)
 create mode 100644 recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.10.bb
 delete mode 100644 recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.9.bb

diff --git a/recipes-multimedia/gstreamer/gst-fsl-plugin.inc b/recipes-multimedia/gstreamer/gst-fsl-plugin.inc
index f26e690..1e8772e 100644
--- a/recipes-multimedia/gstreamer/gst-fsl-plugin.inc
+++ b/recipes-multimedia/gstreamer/gst-fsl-plugin.inc
@@ -56,11 +56,7 @@ FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
 FILES_${PN}-gplay = "${bindir}/gplay"
 FILES_${PN}-libmfwsconf = "${libdir}/libmfwsconf${SOLIBS}"
 FILES_${PN}-libgplaycore = "${libdir}/libgplaycore${SOLIBS}"
-
-# FIXME: The plugins look for the .so file, so add it here
-FILES_${PN}-libgstfsl = "${libdir}/libgstfsl-0.10${SOLIBS} ${libdir}/libgstfsl-0.10${SOLIBSDEV}"
-INSANE_SKIP_${PN}-libgstfsl = "dev-so"
-
+FILES_${PN}-libgstfsl = "${libdir}/libgstfsl-0.10${SOLIBS}"
 FILES_${PN}-libme = "${libdir}/libme${SOLIBS}"
 FILES_${PN}-libgstbufmeta = "${libdir}/libgstbufmeta${SOLIBS}"
 FILES_${PN}-libmfwba =  "${libdir}/libmfwba${SOLIBS}"
diff --git a/recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.10.bb b/recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.10.bb
new file mode 100644
index 0000000..3fe8195
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.10.bb
@@ -0,0 +1,14 @@
+# Copyright (C) 2013 Freescale Semiconductor
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require gst-fsl-plugin.inc
+
+EXTRA_OECONF += " CROSS_ROOT=${PKG_CONFIG_SYSROOT_DIR}"
+
+SRC_URI = "${FSL_MIRROR}/gst-fsl-plugins-${PV}.tar.gz"
+S = "${WORKDIR}/gst-fsl-plugins-${PV}"
+
+SRC_URI[md5sum] = "681a5e97d621eaa5b1bcca2597cd0152"
+SRC_URI[sha256sum] = "d1d194141c038ef72e7d4271355b2ef1a38bf5d110e93101609ab422596167df"
+
+COMPATIBLE_MACHINE = "(mx28|mx5|mx6)"
diff --git a/recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.9.bb b/recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.9.bb
deleted file mode 100644
index e319fc2..0000000
--- a/recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.9.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-# Copyright (C) 2013 Freescale Semiconductor
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-require gst-fsl-plugin.inc
-
-# FIXME: Inspecting the source code the content is in fact 3.0.9
-SRC_URI = "${FSL_MIRROR}/gst-fsl-plugins-3.10.9-1.0.0.tar.gz \
-           file://remove-GST_INFO-in-mfw_gst_utils.h.patch \
-           file://makefile.am-fix-aac-for-imx6.patch \
-           file://configure.ac-Fix-checking-for-include-headers-in-mul.patch"
-
-SRC_URI[md5sum] = "a338a5c25225c765ae5f44af82fe7413"
-SRC_URI[sha256sum] = "e809daa0cd60381f05a79f34a53305a5ee53bfed22192a1cda6d998acc84a6fd"
-
-S = "${WORKDIR}/gst-fsl-plugins-3.10.9-1.0.0"
-
-COMPATIBLE_MACHINE = "(mx28|mx5|mx6)"
-- 
1.8.5.3


