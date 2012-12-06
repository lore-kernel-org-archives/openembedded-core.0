Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tgajt-0006Pj-Fy
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 13:39:41 +0100
Received: from mail-la0-f69.google.com ([209.85.215.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 06 Dec 2012 04:24:28 -0800
Received: by mail-la0-f69.google.com with SMTP id w12so4805824lag.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 04:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=B6OKM20E9Jd+TEfesIm4zewqqPTLc86bP/x2AMnVMM4=;
	b=GjCcuOuyAaI9aF21pIcraDZDItfOlJBVCsJsES90VFdWIvaEVUUDFWPuXDrCKQ/G1G
	8eFoxUhkL1LxYPNfKvyv3Z2dKnttXKqoNNpUHTIJ1mx+xH759Ioqhc97EZB3ZDZgFpTu
	t1aiVbWFGpoqeF41g2FKwrm8ndnpMeDv7RA7CCfcu5KWmC+lp6IC9tZrJIivluVPKji7
	6mm+1ZPI64TdD01GJlc8LD7rPIjED5GUdYJi7Cwglaj5F3IzB5DrfjmviaIJWqvGfspv
	RzEpn35E9D3ahYC98pQkPY835auoIcg6mhG5dKfzQR0IcXUkepBkg8/jmXVxyIVcS3oM
	74tw==
Received: by 10.216.202.152 with SMTP id d24mr592578weo.117.1354796712787;
	Thu, 06 Dec 2012 04:25:12 -0800 (PST)
Received: by 10.216.202.152 with SMTP id d24mr592573weo.117.1354796712670;
	Thu, 06 Dec 2012 04:25:12 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fv2sm22921211wib.4.2012.12.06.04.25.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 04:25:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 12:23:32 +0000
Message-Id: <8cccc80457ab4e9c7ec120a2be99d74888c9cdea.1354796499.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <00c93976db485ebbff0096fe35a57c641ce876c9.1354796499.git.ross.burton@intel.com>
References: <00c93976db485ebbff0096fe35a57c641ce876c9.1354796499.git.ross.burton@intel.com>
In-Reply-To: <cover.1354796499.git.ross.burton@intel.com>
References: <cover.1354796499.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmu4VZglJK+rWABGtVHe4/IppZ/tsKz6VE45NVXDKYBnGpDxPIhJZ/WUfSCopm4odZphXtlO52Cl/WonZJ79qNelb7ue8xM15g3DRfvuLfy3ACcQuDPtmbNiPywGj5K/byLxkN9OEQwXwgbTWllj39Kil2EWIEG//JG5bU7X+csK3xux2Y+8dg48MXHe/qUV7wMYdlL
Subject: [PATCH 2/3] mesa: upgrade to 8.0.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 12:39:41 -0000

Licence checksum change, use an upstream source file instead of a generated
file: we were previously checksumming the Bison license.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/{mesa-8.0.4.inc => mesa-8.0.5.inc}    |    6 +++---
 ...sa-dri-glsl-native_8.0.4.bb => mesa-dri-glsl-native_8.0.5.bb} |    6 +++---
 .../mesa/{mesa-dri_8.0.4.bb => mesa-dri_8.0.5.bb}                |    2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-8.0.4.inc => mesa-8.0.5.inc} (80%)
 rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_8.0.4.bb => mesa-dri-glsl-native_8.0.5.bb} (66%)
 rename meta/recipes-graphics/mesa/{mesa-dri_8.0.4.bb => mesa-dri_8.0.5.bb} (78%)

diff --git a/meta/recipes-graphics/mesa/mesa-8.0.4.inc b/meta/recipes-graphics/mesa/mesa-8.0.5.inc
similarity index 80%
rename from meta/recipes-graphics/mesa/mesa-8.0.4.inc
rename to meta/recipes-graphics/mesa/mesa-8.0.5.inc
index c6307dc..b39b011 100644
--- a/meta/recipes-graphics/mesa/mesa-8.0.4.inc
+++ b/meta/recipes-graphics/mesa/mesa-8.0.5.inc
@@ -1,6 +1,6 @@
 DEPENDS += "mesa-dri-glsl-native"
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \ 
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0001-Compile-with-uclibc.patch \
            file://0002-cross-compile.patch \
            file://0003-fix-for-x32.patch \
@@ -9,8 +9,8 @@ SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-ha
 
 S = "${WORKDIR}/Mesa-${PV}"
 
-SRC_URI[md5sum] = "d546f988adfdf986cff45b1efa2d8a46"
-SRC_URI[sha256sum] = "02ed19f4f5f6535dda03a9932a81438aa78ea723ebba1f39a3d49a70a4e1d07e"
+SRC_URI[md5sum] = "01305591073a76b65267f69f27d635a3"
+SRC_URI[sha256sum] = "511b8da34f8e69ed24caf422964fb7ae747f3b1d8093f6b8aa2602164a475a5e"
 
 do_configure_prepend() {
   # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
similarity index 66%
rename from meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
rename to meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
index d551598..842d492 100644
--- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
@@ -1,10 +1,10 @@
 require mesa-dri-glsl-native.inc
 
-LIC_FILES_CHKSUM = "file://glsl_parser.cpp;beginline=3;endline=33;md5=d078f1cddc2fc355719c090482254bd9"
+LIC_FILES_CHKSUM = "file://glsl_parser.yy;beginline=2;endline=23;md5=a12a9c0208ee64a07ce314dfed4c81eb"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
-SRC_URI[md5sum] = "d546f988adfdf986cff45b1efa2d8a46"
-SRC_URI[sha256sum] = "02ed19f4f5f6535dda03a9932a81438aa78ea723ebba1f39a3d49a70a4e1d07e"
+SRC_URI[md5sum] = "01305591073a76b65267f69f27d635a3"
+SRC_URI[sha256sum] = "511b8da34f8e69ed24caf422964fb7ae747f3b1d8093f6b8aa2602164a475a5e"
 
 S = "${WORKDIR}/Mesa-${PV}/src/glsl/"
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb
similarity index 78%
rename from meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
rename to meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb
index a5a592d..26b56e4 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_8.0.5.bb
@@ -1,4 +1,4 @@
 require mesa-common.inc
 require mesa-${PV}.inc
 require mesa-dri.inc
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.0"
-- 
1.7.10



