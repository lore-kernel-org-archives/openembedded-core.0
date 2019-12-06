Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 24A956C102
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 10:13:15 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id v93so2564670pjb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 02:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WqC5QFDbaBC/PK+Rsd3UPjkNCgpvq8TVDgwxkptxLqc=;
	b=cCLVOfOow521WuB3EKDWS7Fa7LqSEGXOBRrfaecsbFcz85rfc0e8nREalTWQrJqelx
	GM6lxyAuh56vvzjLwJrfyzYLRUgS3B+k6IIUY5LAROFpLoZQw0Ob+ZROkSEvpVqL+LdS
	shBrg2S1ltTN4qUFvkLPSZFHlB9A5mt0Ytt1dkKpr1m8PtvN1/NDGhfRH0Gog5T7toDw
	iabmjqNHpUrrffYzjxBxGYiQ+RvL7ZfcUqFeZWPqvtS1frC6lQXlNrRJTsFr/K/2AZDD
	ISnsB7n//Gbh9JmZVquQRdWarN5bAvNX3+lse5V6pg6cp3KGj0yTmretl7+q71f55Dc6
	vQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WqC5QFDbaBC/PK+Rsd3UPjkNCgpvq8TVDgwxkptxLqc=;
	b=lyn5eYYIx4tshQXObqclf5Kp5VPH9hx6GmLiwGJDFcj87KrI+9f+iyzXkcywm5Gocf
	VNCpttRDGA7r+xnm1eG77PXCikw+II5Zy2rrzT3zA25+L6Hp4N7TEP5Az5JowOaJcZTF
	It9GUqZFHYl4mfrD1cc76TPeBO6Mwv1ZF5rqrQT+2I8BmAM5lF2gpBRiEa9wZx5KdjYR
	ZDxrCzEDGKtG0qyH/oK/dWhIt9zoBYB/JX8zAPPd26YfnAdcHw+J6Gw223c0nvnNHNlG
	Y8QrTPykQgtA7OKRpOP4RhHFOpqdQkSsmOtB0esd5dkFHBgGuWI4YroPSP+WzsV0z1W7
	Aj+g==
X-Gm-Message-State: APjAAAWH1Cpc22nX+cSPLPUX50PZUG94+9oM7rxQOD5uGz3fvBKsFKTy
	7eF1A+zt4W1E0ADnf0E5AUBmdIwc
X-Google-Smtp-Source: APXvYqwWNMgTq8snHkT66DTcmu/Qp3BysUpKowr2buZ5KC8pyDeXyJJqsQNzBeoYFhu3O1A0pQ0fQg==
X-Received: by 2002:a17:902:b7c2:: with SMTP id
	v2mr399601plz.274.1575627195785; 
	Fri, 06 Dec 2019 02:13:15 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	e16sm15122767pff.181.2019.12.06.02.13.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Dec 2019 02:13:15 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 10:13:11 +0000
Message-Id: <1575627191-12947-1-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] u-boot-fw-utils: Add capability of building from out-of-tree
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
X-List-Received-Date: Fri, 06 Dec 2019 10:13:15 -0000

This patch also helps to build with EXTERNALSRC.

Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
index 04321b7..7de91ff 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
@@ -12,22 +12,22 @@ EXTRA_OEMAKE_class-cross = 'HOSTCC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
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


