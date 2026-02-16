Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF39EE63F3F
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 13:48:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19796.1771249723414619722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 05:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3896C150C
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:48:36 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F5E23F632
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:48:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/7] libuv: enable nativesdk builds
Date: Mon, 16 Feb 2026 13:48:29 +0000
Message-ID: <20260216134835.717366-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 13:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231203

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/libuv/libuv_1.51.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.51.0.bb b/meta/recip=
es-connectivity/libuv/libuv_1.51.0.bb
index 9ff9cf35e2e..afc1bf87b5e 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.51.0.bb
@@ -17,4 +17,4 @@ do_configure() {
     oe_runconf
 }
=20
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


