Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15D8C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:52:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18215.1683118366716346937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C61C2F4;
	Wed,  3 May 2023 05:53:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA1A23F5A1;
	Wed,  3 May 2023 05:52:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] spirv-headers: remove description
Date: Wed,  3 May 2023 13:52:42 +0100
Message-Id: <20230503125244.3063552-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180820

This description doesn't actually describe the recipe in any meaningful
way, remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb b/meta=
/recipes-graphics/spir/spirv-headers_1.3.243.0.bb
index 8e4402a94e7..e27c0a67dc2 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb
@@ -1,7 +1,4 @@
 SUMMARY =3D "Machine-readable files for the SPIR-V Registry"
-DESCRIPTION =3D "Headers are provided in the include directory, with up-=
to-date \
-headers in the unified1 subdirectory. Older headers are provided accordi=
ng to \
-their version."
 SECTION =3D "graphics"
 HOMEPAGE =3D "https://www.khronos.org/registry/spir-v"
 LICENSE =3D "MIT"
--=20
2.34.1


