Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2DEC54E90
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 19:15:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7296.1747854898822614692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 12:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 492F014BF
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 12:14:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C11B13F673
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 12:14:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] rust: remove python3-native DEPENDS
Date: Wed, 21 May 2025 20:14:47 +0100
Message-ID: <20250521191449.1486927-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 19:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217055

This dependency has always existed in the oe-core recipes but isn't
explicitly needed here: the host Python is sufficient.

Note that rust-common still inherits on python3native[1] so this doesn't
yet actually have a meaningful change to the dependency tree.

[1] oe-core 4abd6ee9d48 ("rust-common.bbclass: rewrite toolchain wrappers=
 in (native) python")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rust/rust_1.85.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.85.1.bb b/meta/recipes-dev=
tools/rust/rust_1.85.1.bb
index dc4f5648552..583437f1f3e 100644
--- a/meta/recipes-devtools/rust/rust_1.85.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.85.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D9c0fae516fe8=
aaea2fb601db4800daf7"
 inherit rust
 inherit cargo_common
=20
-DEPENDS +=3D "file-native python3-native"
+DEPENDS +=3D "file-native"
 DEPENDS:append:class-native =3D " rust-llvm-native"
 DEPENDS:append:class-nativesdk =3D " nativesdk-rust-llvm"
=20
--=20
2.43.0


