Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F60C43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:12:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48979.1782922375373420022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=BW/d9NQN;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DF3D452F
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:12:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 758A33F673
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782922374; bh=wI9RM5BXFZARDltHp2kWTVKh7rK3PO4GSyHq669Rxgo=;
	h=From:To:Subject:Date:From;
	b=BW/d9NQNsKQPZ/4OAMmxfGmmXuHXahxPysVSyuUzGTk94Vw4SyCwevdJvxt2uFvt9
	 mbNXc9zWY5/I+FWwEbEfE+35I6tvp4vNfZ5Fh1Pen1CmvA2KtCAP016Q6UAqFVUID4
	 SxlrcRCZGsWkuen1ronN3KXyoK2w6Go1sSiVwt2M=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] meson: add explanatory comment to the meson-native wrapper script
Date: Wed,  1 Jul 2026 17:12:48 +0100
Message-ID: <20260701161250.980101-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239988

Add a clarification comment because it's not immediately obvious that
meson-native is used in eSDKs (whereas nativesdk-meson is used in a SDK).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/meson/meson-wrapper | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recip=
es-devtools/meson/meson/meson-wrapper
index 3aa1a93520c..570b550e019 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -1,5 +1,7 @@
 #!/bin/sh
=20
+# If this wrapper script is being ran in a normal build environment and =
not an
+# eSDK, then just call the real script directly.
 if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
     exec "meson.real" "$@"
 fi
--=20
2.43.0


