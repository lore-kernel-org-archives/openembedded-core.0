Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CD2C3ABCC
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6816.1746866656691999695
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A968153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 05D343F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/23] toolchain-scripts: Add Meson settings for Yocto build SDK
Date: Sat, 10 May 2025 09:43:51 +0100
Message-ID: <20250510084400.269726-18-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216266

From: Tom Hochstein <tom.hochstein@oss.nxp.com>

The Meson settings for the standalone SDK also need to be available for
the Yocto build SDK, a.k.a. meta-ide-support.

(From OE-Core rev: 6287114bf10718fe49f7c1ed211f3d99f0933bc4)

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes=
-recipe/toolchain-scripts.bbclass
index b59a295abcc..9e4320f8762 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -99,6 +99,8 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_BASELIB=3D"${baselib}"' >> $script
 	echo 'export OECORE_TARGET_ARCH=3D"${TARGET_ARCH}"' >>$script
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
+	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"=
' >>$script
+	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian=
-')}"' >>$script
=20
 	toolchain_shared_env_script
=20
--=20
2.43.0


