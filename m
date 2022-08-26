Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B68AECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 14:23:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.37559.1661523820479188324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 07:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0BD123A;
	Fri, 26 Aug 2022 07:23:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68DCA3F71A;
	Fri, 26 Aug 2022 07:23:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] libgcrypt: remove obsolete pkgconfig install
Date: Fri, 26 Aug 2022 15:23:35 +0100
Message-Id: <20220826142337.42920-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 14:23:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169919

libgcrypt.pc has been built and installed by libgcrypt since 1.9.0[1],
so the manual install can be removed.

[1] 97194b422bc89a6137f4e218d4cdee118c63e96e

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.10.1.bb
index f7108013d34..c1f52aedff5 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
@@ -49,12 +49,6 @@ do_configure:prepend () {
 	rm -f ${S}/m4/gpg-error.m4
 }
=20
-# libgcrypt.pc is added locally and thus installed here
-do_install:append() {
-	install -d ${D}/${libdir}/pkgconfig
-	install -m 0644 ${B}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
-}
-
 do_install_ptest() {
     cp -r --preserve=3Dmode,links -v ${S} ${D}${PTEST_PATH}
     cp -r --preserve=3Dmode,links -v ${B} ${D}${PTEST_PATH}
--=20
2.34.1


