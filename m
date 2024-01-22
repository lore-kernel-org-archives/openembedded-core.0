Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5439C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:04:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.74559.1705932249455558704
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 06:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B8B21FB
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:04:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9257A3F73F
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:04:08 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] zlib: ignore CVE-2023-6992
Date: Mon, 22 Jan 2024 14:04:04 +0000
Message-Id: <20240122140406.3837333-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122140406.3837333-1-ross.burton@arm.com>
References: <20240122140406.3837333-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194162

From: Ross Burton <ross.burton@arm.com>

This issue is specific to the Cloudflare fork of zlib.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/zlib/zlib_1.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.bb b/meta/recipes-core/zlib/=
zlib_1.3.bb
index 1ed18172faa..9db5588d66a 100644
--- a/meta/recipes-core/zlib/zlib_1.3.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.bb
@@ -47,3 +47,4 @@ do_install_ptest() {
 BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_STATUS[CVE-2023-45853] =3D "not-applicable-config: we don't build mi=
nizip"
+CVE_STATUS[CVE-2023-6992] =3D "not-applicable-config: specific to the Cl=
oudflare fork"
--=20
2.34.1


