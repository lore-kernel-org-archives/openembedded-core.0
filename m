Return-Path: <net147@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id E21056B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:02:26 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro2so3214234pbb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ma6lNU82GLNz1E7s+GH5oUYifWLOQSMPFfXm74h8vQc=;
	b=r6ieOj6rcDh9qk4CG5i10rNKb7VdInGWo0N5nLWAvvB7YI/jj4IXRcxobEQvf9tNC1
	zsRcPR4Lh5qoAyfxf6jz6Q6xK1wibs5Oc6g71GtSim5TOWJWXL0hTzhYmC3/uiRAPE2R
	Jh04xV4h4sGGzs4/07CHsnp8A764v8q/NEmMlxVleRWwlJbpPitksCNW8m66aL5Ak5zK
	n4LqgBBUAC7/wQLyNePtcwgVb2PkvLIu32GC+ZslgJSBPAulXIVDMzGWtfHrj2EsKmFp
	rWkmh9R3wxEVoc2h17N9mRnROyiOqqGg6//xWGtkSQ72Swn/sWOjtEOQXGu0FfbfmmBD
	lgIg==
X-Received: by 10.66.141.4 with SMTP id rk4mr13134320pab.127.1374156147447;
	Thu, 18 Jul 2013 07:02:27 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	pq1sm13974362pbb.26.2013.07.18.07.02.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Jul 2013 07:02:26 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2013 00:18:02 +1000
Message-Id: <1374157082-20897-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] mesa: upgrade to 9.1.5
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
X-List-Received-Date: Thu, 18 Jul 2013 14:02:27 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch       | 0
 .../0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch   | 0
 meta/recipes-graphics/mesa/mesa.inc                                   | 2 +-
 meta/recipes-graphics/mesa/{mesa_9.1.3.bb => mesa_9.1.5.bb}           | 4 ++--
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-9.1.3 => mesa-9.1.5}/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa-9.1.3 => mesa-9.1.5}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.1.3.bb => mesa_9.1.5.bb} (79%)

diff --git a/meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa-9.1.5/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
rename to meta/recipes-graphics/mesa/mesa-9.1.5/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
diff --git a/meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch b/meta/recipes-graphics/mesa/mesa-9.1.5/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
rename to meta/recipes-graphics/mesa/mesa-9.1.5/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ada1170..4f93b90 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -87,7 +87,7 @@ do_install_append () {
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
     
-    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
+    # it was packaged in libdricore and preventing upgrades when debian.bbclass was used 
     rm -f ${D}${sysconfdir}/drirc
 }
 
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.3.bb b/meta/recipes-graphics/mesa/mesa_9.1.5.bb
similarity index 79%
rename from meta/recipes-graphics/mesa/mesa_9.1.3.bb
rename to meta/recipes-graphics/mesa/mesa_9.1.5.bb
index a7ccbe6..49fa5dd 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
            "
 
-SRC_URI[md5sum] = "952ccd03547ed72333b64e1746cf8ada"
-SRC_URI[sha256sum] = "8d5dac2202d0355bff5cfd183582ec8167d1d1227b7bb7a669acecbeaa52d766"
+SRC_URI[md5sum] = "4ed2af5943141a85a21869053a2fc2eb"
+SRC_URI[sha256sum] = "89ea0d1afd90a87dab253777bfe414820c4aa3890add1487ca2b49f6b3e194fd"
 
 S = "${WORKDIR}/Mesa-${PV}"
-- 
1.8.3.2


