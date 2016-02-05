Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A28EF77331
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 17:17:34 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 128so79638930wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 09:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=RvAiMVZr/sgCcfezzukogdLQDTDUEi6DbXaU8aMFWNQ=;
	b=DGblEiJT+6Q4Gqk2K+1bKL/kszrUxoa5bESldpQnclQWqi9iXuLdlHCc23eTgr8NvD
	aNAXSHW2OXocfoHnp92XiIxAX0im7mqBkovg9dG2MJRgvpU9qv3H48KP+rOJzrv6aoKM
	7hHvCDMpH+a7AI+rIruziJ+JrwO3MQfNm9kig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RvAiMVZr/sgCcfezzukogdLQDTDUEi6DbXaU8aMFWNQ=;
	b=Uhv7zxsJNO2UiArf+XqbsIobYHoGEFxula+VkZ7RfYLj3OFZ7OGCE2GWgkoMZ1zao1
	+epG1hs/IwmuynffW/vnzemQx7JAbWv21KAnCrw8n376P1qI6IJZeZLX16ZDWStdjO49
	yimbUss37VWolr7IXMGiRVoUI3PwhJrzdOmTexnmNYM2NEbxXPQD0ue+RV+DzuBtU+Uf
	B8kxoxFhg9dfeSFkY0BtLoT5i4xUK7iSG+sYcsdoBp+a8FJ5VnMAmwhRQM73yXimiJls
	MpdEmdes/0BwOi3iW5RhwZtFxPJAs+CLbJ9RbjSKs9eCp0z81pEoLYYqoMV50nC5y8S6
	42YQ==
X-Gm-Message-State: AG10YOSyqiZIWOcqS4nO/VhXvS5Nvyd12/WJ1vyERP9XGXTtc5Vu+pUJOWaI7pNffLmDOk6t
X-Received: by 10.28.19.76 with SMTP id 73mr18240441wmt.24.1454692654616;
	Fri, 05 Feb 2016 09:17:34 -0800 (PST)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	g3sm16724709wjw.31.2016.02.05.09.17.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 09:17:33 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 17:16:57 +0000
Message-Id: <1454692617-25631-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Fri, 05 Feb 2016 17:17:35 -0000

* update SRC_URI and checksum.
* use libcrypto for sha1 functions. In upstream commit a24bdce4, support for
  SHA-1 was copied from xserver repo, so let's use the same default for
  --with-sha1 option that we use in xserver recipe in OE core.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb | 13 -------------
 meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb | 13 +++++++++++++
 meta/recipes-graphics/mesa/mesa.inc          |  6 ++++--
 meta/recipes-graphics/mesa/mesa_10.6.3.bb    | 14 --------------
 meta/recipes-graphics/mesa/mesa_11.1.1.bb    | 14 ++++++++++++++
 5 files changed, 31 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa_10.6.3.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_11.1.1.bb

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb b/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
deleted file mode 100644
index fc2bca9..0000000
--- a/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require mesa_${PV}.bb
-
-SUMMARY += " (OpenGL only, no EGL/GLES)"
-
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/mesa:"
-
-PROVIDES = "virtual/libgl virtual/mesa"
-
-S = "${WORKDIR}/mesa-${PV}"
-
-PACKAGECONFIG ??= "dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-
-EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb b/meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
new file mode 100644
index 0000000..fc2bca9
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
@@ -0,0 +1,13 @@
+require mesa_${PV}.bb
+
+SUMMARY += " (OpenGL only, no EGL/GLES)"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/mesa:"
+
+PROVIDES = "virtual/libgl virtual/mesa"
+
+S = "${WORKDIR}/mesa-${PV}"
+
+PACKAGECONFIG ??= "dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9b316e1..1ad4400 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3d
 
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native udev"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native udev openssl"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
 
@@ -22,7 +22,9 @@ inherit autotools pkgconfig pythonnative gettext distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-EXTRA_OECONF = "--enable-shared-glapi"
+EXTRA_OECONF = "--enable-shared-glapi \
+                --with-sha1=libcrypto \
+"
 
 PACKAGECONFIG ??= "egl gles dri \
 		${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
diff --git a/meta/recipes-graphics/mesa/mesa_10.6.3.bb b/meta/recipes-graphics/mesa/mesa_10.6.3.bb
deleted file mode 100644
index 5da56ad..0000000
--- a/meta/recipes-graphics/mesa/mesa_10.6.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/older-versions/10.x/${PV}/mesa-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "553e525d2f20ed48fca8f1ec3176fd83"
-SRC_URI[sha256sum] = "58592e07c350cd2e8969b73fa83048c657a39fe2f13f3b88f5e5818fe2e4676d"
-
-#because we cannot rely on the fact that all apps will use pkgconfig,
-#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-do_install_append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
-    fi
-}
diff --git a/meta/recipes-graphics/mesa/mesa_11.1.1.bb b/meta/recipes-graphics/mesa/mesa_11.1.1.bb
new file mode 100644
index 0000000..5d73feb
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa_11.1.1.bb
@@ -0,0 +1,14 @@
+require ${BPN}.inc
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "1043dfb907beecb2a761272455960427"
+SRC_URI[sha256sum] = "64db074fc514136b5fb3890111f0d50604db52f0b1e94ba3fcb0fe8668a7fd20"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install_append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    fi
+}
-- 
2.7.0


