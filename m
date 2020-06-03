Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.11960.1591184880486757710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 04:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ax1p9cGG;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id o9so2311670ljj.6
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 04:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tLvBoI3p/njMWofs9YISNZRkvmhgcwSrMrmUVCo5TBQ=;
        b=ax1p9cGGk3d59PahDP8tLOcrSZS+hGdrF4A93JixdEAJn8w3Qh+HmCm0JmwjeCC0QO
         RYY6IiMrHIUSUCRy1v5HTMROK3hPDIaDY5bSLz9XrbxVQPC3NdhziuxQ4Cdw8Zc8QT2M
         /+/uXIeRjo6ZNtWWNAcyD0T5mFb5iTf+XxaIUMLk2ALYadhr6RiM23RP5IRRG86boS6n
         n7lQIN4q5XkcdtvWcfcM8lhOD7aYVrrvhaQc5xs04NFACqxQuFIYjO6hWqaaCpSebTT3
         +mGL/swXDFgSA8yO5BTpyH0j3GZ/r2zcS3w5J5nwr+SgwOzMC8joEEq2rszqWS5ep/g0
         SQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tLvBoI3p/njMWofs9YISNZRkvmhgcwSrMrmUVCo5TBQ=;
        b=n2RXg29YbJJb3JS23e7D3cxlFSvIm+aXxcgFL3R5QeHPefLWgs1u9beXwJjrmxrNXn
         d4I6rX9OJetgoB6KRhGO+NNU0tQt+xBkhcN+utM9jzfVDFoEtDHE59GbHaeIlSEKuttU
         o9W7mE1F4guZLB4pfTUpLKosmO6qgD/31RdJgOwBp0jt2ntbqeRJZ7Qx58xX3dB7jShD
         MX2MJWtrpNezCJC0/7Jk0ZxVKDGPqJHK4LB2rksOcg5sNiwxIOxFrtWdqxq3Xbl3fJrP
         5oBhKSUF4tKUz8TwhJXU3L4/r0Z4OxVn6ZCZInFGApp4tfNX8O+pAR6aJU2Y1tMGYix0
         L4sQ==
X-Gm-Message-State: AOAM531fHIC9+TJDtOpYZuwyXePKZhA7D8oC89F/T5kGkvwbCPzpC3Ng
	K4jgywCnXxuH62Tv6P3lJ5riC+0b
X-Google-Smtp-Source: ABdhPJyhI2xAjDkGnniWWzhOpZUmsI2XmTXWFj0F0L57SpkNTdgq0131+qohk3ZMXuFaaAWgLOQO8w==
X-Received: by 2002:a2e:a37c:: with SMTP id i28mr2026818ljn.111.1591184878460;
        Wed, 03 Jun 2020 04:47:58 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([2a00:801:3fb:ebd4:e18d:d2e7:773:e410])
        by smtp.gmail.com with ESMTPSA id q3sm403715ljc.110.2020.06.03.04.47.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 04:47:57 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH V3 1/2] u-boot.inc: fix some inconsistent coding style
Date: Wed,  3 Jun 2020 13:48:37 +0200
Message-Id: <20200603114838.13541-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603114838.13541-1-liu.ming50@gmail.com>
References: <20200603114838.13541-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 44 ++++++++++++++----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 80f828df52..718435f13f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -91,19 +91,19 @@ do_configure () {
 }
 
 do_compile () {
-	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
-		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
-	fi
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
+        sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
+    fi
 
-	unset LDFLAGS
-	unset CFLAGS
-	unset CPPFLAGS
+    unset LDFLAGS
+    unset CFLAGS
+    unset CPPFLAGS
 
-	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
-	then
-		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
-		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
-	fi
+    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
+    then
+        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
+        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
+    fi
 
     if [ -n "${UBOOT_CONFIG}" ]
     then
@@ -130,16 +130,15 @@ do_compile () {
                     unset k
                 fi
             done
-            unset  j
+            unset j
         done
-        unset  i
+        unset i
     else
         oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
 
         # Generate the uboot-initial-env
         oe_runmake -C ${S} O=${B} u-boot-initial-env
     fi
-
 }
 
 do_install () {
@@ -162,9 +161,9 @@ do_install () {
                     ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
                 fi
             done
-            unset  j
+            unset j
         done
-        unset  i
+        unset i
     else
         install -D -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
         ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
@@ -219,9 +218,9 @@ do_install () {
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}
                     fi
                 done
-                unset  j
+                unset j
             done
-            unset  i
+            unset i
         else
             install -m 644 ${B}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
             ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYNAME}
@@ -238,7 +237,6 @@ do_install () {
     then
         install -Dm 0644 ${UBOOT_EXTLINUX_CONFIG} ${D}/${UBOOT_EXTLINUX_INSTALL_DIR}/${UBOOT_EXTLINUX_CONF_NAME}
     fi
-
 }
 
 PACKAGE_BEFORE_PN += "${PN}-env"
@@ -275,9 +273,9 @@ do_deploy () {
                     ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${type}
                 fi
             done
-            unset  j
+            unset j
         done
-        unset  i
+        unset i
     else
         install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 
@@ -346,9 +344,9 @@ do_deploy () {
                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_SYMLINK}
                     fi
                 done
-                unset  j
+                unset j
             done
-            unset  i
+            unset i
         else
             install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
             rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}
-- 
2.26.2

