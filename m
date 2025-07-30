Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FA1C87FD3
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:03:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39293.1753891430576359168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26BF21BF7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2A413F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:03:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/13] python3-cryptography: add missing openssl DEPENDS
Date: Wed, 30 Jul 2025 17:03:34 +0100
Message-ID: <20250730160343.4053614-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730160343.4053614-1-ross.burton@arm.com>
References: <20250730160343.4053614-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221125

This package links to openssl, so add it to the dependencies explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-cryptography.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/=
recipes-devtools/python/python3-cryptography.bb
index f41e13f4a1c..5963064b724 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -24,6 +24,7 @@ inherit pypi python_maturin cargo-update-recipe-crates =
pkgconfig
=20
 DEPENDS +=3D " \
     python3-cffi-native \
+    openssl \
 "
=20
 RDEPENDS:${PN} +=3D " \
--=20
2.43.0


