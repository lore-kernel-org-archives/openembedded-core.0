Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C03C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 17:46:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1693.1706809555103855692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 09:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45D43DA7
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 09:46:37 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 40BBA3F738
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 09:45:54 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next PATCH] armv8-2a/tune-neoversen1: remove march usage
Date: Thu,  1 Feb 2024 17:45:53 +0000
Message-Id: <20240201174553.77294-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 17:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194597

OE-Core commit 54dfbfa3643a9656d8d3c2265817e96ab66bdca5 missed updating t=
his file

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc b=
/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
index 9d181ef4d5dd..55f054713fa5 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
@@ -12,6 +12,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES                                         +=3D "neoversen1"
 ARMPKGARCH:tune-neoversen1                          =3D "neoversen1"
-TUNE_FEATURES:tune-neoversen1                       =3D "${TUNE_FEATURES=
:tune-armv8-2a-crypto} neoversen1"
+TUNE_FEATURES:tune-neoversen1                       =3D "aarch64 crypto =
neoversen1"
 PACKAGE_EXTRA_ARCHS:tune-neoversen1                 =3D "${PACKAGE_EXTRA=
_ARCHS:tune-armv8-2a-crypto} neoversen1"
 BASE_LIB:tune-neoversen1                            =3D "lib64"
--=20
2.39.3 (Apple Git-145)


