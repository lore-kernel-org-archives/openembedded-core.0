Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C168EDE99A
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 16:31:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.791.1725985906579412772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 09:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C64CF113E
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 09:32:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 357963F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 09:31:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vulkan-samples: limit to aarch64/x86-64
Date: Tue, 10 Sep 2024 17:31:39 +0100
Message-Id: <20240910163139.2913214-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 16:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204358

This package is only tested upstream for aarch64 and x86-64 targets,
for example there are int/long cast issues on 32-bit platforms and ATSC
is only ported to aarch64/x86-64.

Instead of listing the machines where we know it doesn't work, limit the
recipe to machines where it is known to work.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/re=
cipes-graphics/vulkan/vulkan-samples_git.bb
index 93d4cdfdd9e..06e996d2435 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -36,4 +36,4 @@ EXTRA_OECMAKE +=3D "-DCMAKE_DISABLE_PRECOMPILE_HEADERS=3D=
ON"
 # This needs to be specified explicitly to avoid xcb/xlib dependencies
 EXTRA_OECMAKE +=3D "-DVKB_WSI_SELECTION=3DD2D"
=20
-COMPATIBLE_HOST:x86 =3D "null"
+COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
--=20
2.34.1


