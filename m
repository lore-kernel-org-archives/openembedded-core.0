Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569F9C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 19:46:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.320.1683056784452494511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 12:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F660C14;
	Tue,  2 May 2023 12:47:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8C083F64C;
	Tue,  2 May 2023 12:46:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] vulkan-samples: update to latest SHA
Date: Tue,  2 May 2023 20:46:18 +0100
Message-Id: <20230502194618.2182283-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 19:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180765

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/re=
cipes-graphics/vulkan/vulkan-samples_git.bb
index 7e70cf1f040..52a9ee75fe9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "gitsm://github.com/KhronosGroup/Vulkan-Sam=
ples.git;branch=3Dmain;protoc
            "
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
-SRCREV =3D "3df7dba1b1f428f24cd9a242af78540a518f4b67"
+SRCREV =3D "2307c3eb5608cb1205fa3514b3a31dbfb857d00c"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "These are not the releases you're lookin=
g for"
 S =3D "${WORKDIR}/git"
--=20
2.34.1


