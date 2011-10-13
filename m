Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJbB-00043l-IP
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:37:17 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=sXWHLSlLRNvpkeUgQ4VR8EZO0Tja39efSnYSPTzo93o=;
	b=a5eUHYTNn5icMll3Z+DueautTfixvnBs2EcyeluFzticMVrifJ2hAcpq4EO5OV4l84
	mDseJfjo3VJ71+a9tHgYnhxp4HRauvKmRsIR+BDCsNux8Ainj4S5GYSE9+O6iiLhI+13
	jFrTxmlUOk6IjUR7lEP4Nm45STubl/geBXwYA=
Received: by 10.204.130.65 with SMTP id r1mr2387748bks.27.1318505495572;
	Thu, 13 Oct 2011 04:31:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm3276604bkw.5.2011.10.13.04.31.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:31:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:25 +0200
Message-Id: <6c75399b6bd39f4eafaf4b4964cab9e3273dd7a2.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 07/20] mesa-common: MesaDemos is now separate recipes, bump PE, introduce INC_PR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 11:37:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc   |    5 +++--
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb  |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_git.bb   |    2 +-
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb |    3 +--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index fb9a216..ee359ba 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,9 +12,10 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2;name=mesalib \
-           ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaDemos-${PV}.tar.bz2;name=mesademos "
+INC_PR = "r12"
+PE = "2"
 
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
 S = "${WORKDIR}/Mesa-${PV}"
 
 PROVIDES = "virtual/libgl"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
index 5f15091..5f14346 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -7,7 +7,7 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native python-native"
 DEPENDS += "mesa-dri-glsl-native"
 
-PR = "r5"
+PR = "${INC_PR}.0"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://crossfix.patch \
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 9e32d0a..c50ba15 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -13,7 +13,7 @@ DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
 
 SRCREV = "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
 PV = "7.7+git${SRCPV}"
-PR = "r2"
+PR = "${INC_PR}.0"
 
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
index 8b83378..1e0d821 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
@@ -12,8 +12,7 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
 
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
 
-PE = "1"
-PR = "r1"
+PR = "${INC_PR}.0"
 
 EXTRA_OECONF += "--with-driver=xlib --without-gallium-drivers"
 
-- 
1.7.7



