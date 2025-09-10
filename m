Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E184CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:48:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18305.1757512092560018104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 06:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD0601595
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 06:48:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE8CF3F63F
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 06:48:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libical: update patch status
Date: Wed, 10 Sep 2025 14:48:06 +0100
Message-ID: <20250910134807.2366064-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 13:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223214

The 0001-cmake-Do-not-export-CC-into-gir-compiler.patch changes have
been merged upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libical/libical/0001-cmake-Do-not-expor=
t-CC-into-gir-compiler.patch b/meta/recipes-support/libical/libical/0001-=
cmake-Do-not-export-CC-into-gir-compiler.patch
index 0f0dadb4e4c..4027c218c59 100644
--- a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-in=
to-gir-compiler.patch
+++ b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-in=
to-gir-compiler.patch
@@ -8,7 +8,7 @@ compiler rather than just CC variable, therefore let it u=
se the default
 values from environment and not synthesize it from CMAKE_C_COMPILER just
 for this case.
=20
-Upstream-Status: Submitted [https://github.com/libical/libical/pull/552]
+Upstream-Status: Backport [https://github.com/libical/libical/pull/552]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  cmake/modules/GObjectIntrospectionMacros.cmake | 3 +--
--=20
2.43.0


