Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id CC9407FBEF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 08:47:04 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id r11so2454638pjp.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 00:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TinCaMvFrQbyp92n8ZR3kMBs5n63Ciyf48MK18PuIL8=;
	b=WXIbdLW+IfLU67n1YTPvQz+WHT/HK4CsV1mmiW+LJUOZ4TwkLJikG/Vj5c1m/ZRnau
	hN3RalwRrhvojwDn3k8DGWspmlekQlBosUeePuALcOOw8ddSraZwrSbibXPwXZuFno6A
	mV9T3Qmdvr2AfsB9Z8tvywbR/YDkUTZ+uX8Udb2SdPrQPW7TuQa/LnD1N3nNkX1h666R
	X4k3M2A5DPfIocInx4+62bOkZ9M8PS3pSFQi8v6vfq5u3ryuq19LaV2hCeTHjlwZyZkl
	+jh0hvnwQ20awPPO8jfXzSyJWL/UFE2K9rDBgUVmTHaAfG2LkozFdDHhbrzZLkUdtV+g
	cmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TinCaMvFrQbyp92n8ZR3kMBs5n63Ciyf48MK18PuIL8=;
	b=dZCecyrRjZKV/D6BLWUlFfMSdhdPCB0DvAd7vf2O4DtkP1EVbRl6+kLyrs+InxWr1q
	KyXBMdMU+zlsB6ZSkEk+yvt7Q3PsFR9rXZkqwpcuzOzKXYHJsyJWJo9QcftRmyp+buC6
	+qgSPXD9TRoKDwcGrt0XDRk1AvTxBzYkxFIK2JAkvYAghoI58TDLXSLfXPyaMdQ/qpPz
	XQNRqrsOmyR88iNBqetYzfKsR3snlU6Y4j+pR2CDIElKsfUj2BifbkDiWfZJAlSQPBg/
	I4r5q505dMUXXP7QEIAnpWm8kdOLgq2+RPeJViiJN92jY5LSn1S4x2SAvq9TYdEwDB3T
	d9nA==
X-Gm-Message-State: APjAAAUgVUWHKOe2avYHyVmlzsVBWJfeD7WoPCM03fjbVsVseOi4UkfE
	YBMcGUz7rYVV6EpR670KkkGW+CNC
X-Google-Smtp-Source: APXvYqxokE3ErExdOfzsy8TRrPoMfHCByyeSuYtJC4PleCWSvdrIwIKATpOwj+AHPmadHHHUth4gRQ==
X-Received: by 2002:a17:902:934a:: with SMTP id
	g10mr12459055plp.99.1575622025666; 
	Fri, 06 Dec 2019 00:47:05 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	133sm15026506pfy.14.2019.12.06.00.47.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Dec 2019 00:47:05 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 08:47:02 +0000
Message-Id: <1575622022-12082-1-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] u-boot-fw-utils: Add capability of building from out-of-tree
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
X-List-Received-Date: Fri, 06 Dec 2019 08:47:05 -0000

This patch also helps to build with EXTERNALSRC.

Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.01.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.01.bb
index b5ce568..fa58f28 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.01.bb
@@ -10,22 +10,22 @@ EXTRA_OEMAKE_class-cross = 'HOSTCC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
 inherit uboot-config
 
 do_compile () {
-	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake envtools
+	oe_runmake -C ${S} ${UBOOT_MACHINE} O=${B}
+	oe_runmake -C ${S} envtools         O=${B}
 }
 
 do_install () {
 	install -d ${D}${base_sbindir}
 	install -d ${D}${sysconfdir}
-	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
-	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+	install -m 755 ${B}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+	install -m 755 ${B}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
 	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
 }
 
 do_install_class-cross () {
 	install -d ${D}${bindir_cross}
-	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
-	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
+	install -m 755 ${B}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
+	install -m 755 ${B}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
 }
 
 SYSROOT_DIRS_append_class-cross = " ${bindir_cross}"
-- 
2.7.4


