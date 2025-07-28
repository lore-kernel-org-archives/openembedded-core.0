Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FA1C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 15:56:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.84733.1753718160180804176
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 08:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F6BA152B
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 08:55:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30D8E3F5A1
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 08:55:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] classes/toolchain/clang: compiler-rt and libcxx are not target-specific
Date: Mon, 28 Jul 2025 16:55:52 +0100
Message-ID: <20250728155554.2624191-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 15:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221009

This file can be used for nativesdk builds, which if they are using the
clang toolchain will also need compiler-rt and libcxx.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/toolchain/clang.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchai=
n/clang.bbclass
index 7c6ed57fb31..00cf6230408 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -26,8 +26,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cr=
osssdk =3D "clang-crosssdk-
 PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian =3D "=
clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian =3D =
"clang-crosssdk-${SDK_SYS}"
=20
-
-BASE_DEFAULT_DEPS:append:class-target =3D " compiler-rt libcxx"
+BASE_DEFAULT_DEPS:append =3D " compiler-rt libcxx"
=20
 TUNE_CCARGS +=3D "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " =
--dyld-prefix=3D/usr", "", d)}"
=20
--=20
2.43.0


