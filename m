Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BB1C25B77
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 17:56:49 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.3257.1716227799768890103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 10:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout05.t-online.de (Postfix) with SMTP id 8A74770CE
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 19:56:37 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.45.105]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s97FU-3Svv6H0; Mon, 20 May 2024 19:56:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gcc-runtime.inc: additionally remove libgomp.info-1 and libgomp.info-2
Date: Mon, 20 May 2024 19:57:06 +0200
Message-ID: <20240520175706.1840576-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716227796-3E18DC7B-3C09CE3C/0/0 CLEAN NORMAL
X-TOI-MSGID: 5a85dc37-e978-49cf-a3c7-ab2c00831c06
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 17:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199600

This avoids:
ERROR: gcc-runtime-14.1.0-r0 do_package: QA Issue: gcc-runtime: Files/dir=
ectories were installed but not shipped in any package:
  /usr/share/info
  /usr/share/info/libgomp.info-1
  /usr/share/info/libgomp.info-2
Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
gcc-runtime: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
index dbc9141000..d1c47c5d5c 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -92,7 +92,7 @@ do_install () {
 		mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${T=
ARGET_SYS}/${BINV}/include
 		rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${=
BINV}/include
 	fi
-	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
+	rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/libgomp.info-1 ${D}${=
infodir}/libgomp.info-2 ${D}${infodir}/dir
 	rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
 	rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
 	if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
--=20
2.44.0


