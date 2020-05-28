Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.11123.1590669662419283467
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 05:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rAkY/Kdj;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id z6so33137158ljm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=apEgWWERmC4iZliEA7sbM/jAUQ6Qf8znblD8yB1y+3M=;
        b=rAkY/Kdj3cEfd+2BOtNwbwadWW2tS5frIXbFOAdkIx3D/O+GhWnyTm2NiUvGNzljot
         Hgsul8llFso4JTZHDW5UNLREIJoMVPEfW0F2NRVzxKXIlcdzT6DeuoS4dpxxabVOi1aq
         JwET8+d48n5l3iGa0DZsFI99CkAp82GZbmPzGpQIVcqHfX/3C7tejTskz8utUahg+hOg
         DAaynNWWZyO3VY3FEJxyiu0+h/xXoIev9DLZnhB9D+U9VHwdUELNxTYZWT6168PHeJ5C
         2FckjOoNQLTB5l4vPHkdWEND/n5IAijQPnY2WY6iLAUDkCORxhgeR1zBBNtMT/w+cYP9
         WEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=apEgWWERmC4iZliEA7sbM/jAUQ6Qf8znblD8yB1y+3M=;
        b=bnuK9k6QTWFi2c8zCi0Xho0sh0DenNkgpEfmmK9HU1IiiIQwhefjzDKGHPCrc9Hq8+
         2xL/8CwOyF7wxz/4GEZrRdo6e3AoNc1VHpIujVu2/v5CdDwZC/qnqDkClqaBNW+a3J07
         F3pHoBxfx7aI7X9CzL/yaNwf6KCWrjHdyqlWYXrTUMdKqeEL5+auIQp1miVa8VsraSe5
         IBhg075nZ4YBw6uClhIlghCzTUgi4zLNUJnlXtuIR5ezPyNUmGu5BHNCnYgrtlNF/7o2
         ER47BpbJDkE9WZ8RXOskKfxHoYCv0ZPPbcDuOoOysHoaadHS8S+hEIkhHIliZnPDbt/Q
         w6LA==
X-Gm-Message-State: AOAM530fTXeHJbeAiWrv1WXRPAjyZ1R4LL+zGE0ogk5U1N9Pn11JyXcT
	U/8ghZ5yDTaCrIbPmki87FtRKa2N
X-Google-Smtp-Source: ABdhPJyQAHHBe2oiXHSBAPVKGyKghMu+Aeh6L6NXUjeQ5tvrcNWiqzLvC7iaq64JiR2tjnxo7RsxiA==
X-Received: by 2002:a2e:7f08:: with SMTP id a8mr1514105ljd.332.1590669660494;
        Thu, 28 May 2020 05:41:00 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m83-185-47-112.cust.tele2.se. [83.185.47.112])
        by smtp.gmail.com with ESMTPSA id f14sm1412061ljp.118.2020.05.28.05.40.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 May 2020 05:41:00 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	denys@ti.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH V3 2/3] u-boot.inc: fix some inconsistent coding style
Date: Thu, 28 May 2020 14:41:28 +0200
Message-Id: <20200528124129.15100-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528124129.15100-1-liu.ming50@gmail.com>
References: <20200528124129.15100-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 44 ++++++++++++++----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 8cfd25020c..be15e1760f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -105,19 +105,19 @@ do_configure () {
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
@@ -143,16 +143,15 @@ do_compile () {
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
@@ -175,9 +174,9 @@ do_install () {
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
@@ -232,9 +231,9 @@ do_install () {
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
@@ -251,7 +250,6 @@ do_install () {
     then
         install -Dm 0644 ${UBOOT_EXTLINUX_CONFIG} ${D}/${UBOOT_EXTLINUX_INSTALL_DIR}/${UBOOT_EXTLINUX_CONF_NAME}
     fi
-
 }
 
 PACKAGE_BEFORE_PN += "${PN}-env"
@@ -288,9 +286,9 @@ do_deploy () {
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
 
@@ -359,9 +357,9 @@ do_deploy () {
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

