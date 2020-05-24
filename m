Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.16251.1590337428326928030
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 09:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SXyFfS7L;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id z18so18215836lji.12
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tLvBoI3p/njMWofs9YISNZRkvmhgcwSrMrmUVCo5TBQ=;
        b=SXyFfS7LPRA9Bu1AY1D4K20TDgBQvaNXanxKiCG+3H3g1gcwqjXIQ0Ed7JgyiIJP9o
         dMw5UywukyHAxZmQDjKrRVdEj8Z1QMrzjmVJ9RbiKwLkFNWodpwFIfAexy+q3BLkAB2f
         KJO8sfOWKkzyBx7J7IKeoHD5tyh5G3P69q7h51iI6mEsuLCPEL/0eb7/cCaHRwSMp74E
         rbk02xKw/9AnCHxxZ0ZMwY8cGXyNq1mGPSWNypzm9T8v8vcdoQQUV1JR/hsGC3y4HYfJ
         y7DnVdWyuuS4vw32Z/IqyUm7Mz1lU9+jQMzRa+QgE1CuPmyVxg8tyBAusXVIzoKySmOU
         D3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tLvBoI3p/njMWofs9YISNZRkvmhgcwSrMrmUVCo5TBQ=;
        b=WbZhpQm7QqLPCGi/+QFHUEc32Q0zuS5JMGJcbB3wvUGWkb7IEeuSUqqvh11/5NqI5+
         NC8ZRfMHHlr8bDBuky3l4Nr8d2+Rmb10JP5FogrkQY0I0z3QVf3iUJGoDW9/0YwAl2sh
         /GSwMiF22+20YBYdpo9D00+XvRSJvKV3u8XrFpo/dO0f+j2OfifNZRXF9HdVCGO8ibAx
         UjvsalXCmUMQGCnfqAArCYXDPYzXV5bEZmcL0YZ3LBp5vC+2zBliaCCPP0AA5u6RnV9O
         gSyKWrZUg7vX4px3QrmodbS3oBRyaf1lVb1vPPlsN+nWHx0IEUm5P0SbZeWs1ZTMWvoC
         ySAA==
X-Gm-Message-State: AOAM533V3HtTKYbsKuBl9WJO2NPeCb75O9kosjaeS8YTnjJY0Lzu2TbB
	Os5EkWGdipZHeYOy5sc025mKsFJZ
X-Google-Smtp-Source: ABdhPJyEOtwRKEE0/noHUY415RfteHdCSOIucM12i59CrqHuFkhgIaD4wMOvPpgVMhahqBqVWCkuoQ==
X-Received: by 2002:a2e:9cc4:: with SMTP id g4mr5237335ljj.163.1590337426294;
        Sun, 24 May 2020 09:23:46 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id a22sm568418ljm.14.2020.05.24.09.23.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 May 2020 09:23:45 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH] u-boot.inc: fix some inconsistent coding style
Date: Sun, 24 May 2020 18:24:37 +0200
Message-Id: <20200524162437.23615-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
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

