Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.2053.1590600419655104296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 10:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k+37thEN;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id j10so9263014wrw.8
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 10:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tLvBoI3p/njMWofs9YISNZRkvmhgcwSrMrmUVCo5TBQ=;
        b=k+37thENPoSz/IEXei+93/ARDlmzfY1vLKAIkbKTb23zpTQ1YmpkGc11F7cCJTfkhU
         4i0Yh5Yer46arwlXHoUe8+wfmRAXZ0lzuQ28tOtDMhFrUC5lhGI/mUtGwOIMsO5+lKZv
         yOsSPDEpyDU1Ix81NM3HHQu1s5aaWeahJUcaZRbCRO+7GgAlRIp2/f28OQrjYDarx3Au
         o1LykyWQvjWpM4h4NsdH+dh1adcK3qEvGutPJw974VgDCDz3KYjttvFeCBN3SIErExjl
         myO1eX4o10eILCcCj0siHCD6TqSrTU4NGso6Gywie5g2pVWsZ7eGc7ptq4KrpcKm6xiu
         h/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tLvBoI3p/njMWofs9YISNZRkvmhgcwSrMrmUVCo5TBQ=;
        b=n5nvH+CC5s4rxApKzTrLvLzUc3ZI8yh3M1C8r1cdUQWInSQSyt9zvxBYxozo7Y48ep
         NVafgezTKOgt7Ycxh0iDPYzlXEXrvYF2ZWOWuPmkFTg3IJ0pdtgL+GlQ15Ao+vKRIjr+
         Vf4Q2S9KkGH4GGvhrbqFVWmumsTTpfj1o/5bEqrEiNqs9fZY9a2/tSPe8cn2jDr/vu6G
         CSnlPbcqXhWFILeabL884V8rCW1+GxTeD6F9wPgREs5gLdeatnQO9R04q04G48bIlZP7
         RFXFxX1vsgPd6nPVNpS+l6BQ3ka5HtNjAYY2q5Yhd+PJMVmyWLID1RGzdo/3SHY6A2qu
         5XVw==
X-Gm-Message-State: AOAM5337srwBVR2XP3C5bnThKHZCAdBT2t2LRaoGaUzGrzeP9PgrIjzn
	+HamGawawAHFYRGdpfru13UYZjxP
X-Google-Smtp-Source: ABdhPJy1m54yhEV6patfs2Tpmpm8BQEvsP7HwmorAkiNXUD26jDOAmaSB26yjEmb1B/K8eLF4V/6Hg==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr27301618wrp.419.1590600418091;
        Wed, 27 May 2020 10:26:58 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id w10sm3388147wrp.16.2020.05.27.10.26.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 10:26:57 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH V2 1/2] u-boot.inc: fix some inconsistent coding style
Date: Wed, 27 May 2020 19:27:40 +0200
Message-Id: <20200527172741.4319-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527172741.4319-1-liu.ming50@gmail.com>
References: <20200527172741.4319-1-liu.ming50@gmail.com>
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

