Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A4EC7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 15:35:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11745.1685979330305528265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 08:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E350D75;
	Mon,  5 Jun 2023 08:36:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 673933F663;
	Mon,  5 Jun 2023 08:35:29 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] ninja: ignore CVE-2021-4336, wrong ninja
Date: Mon,  5 Jun 2023 16:35:27 +0100
Message-Id: <20230605153527.2772556-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 15:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182390

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/ninja/ninja_1.11.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipes-d=
evtools/ninja/ninja_1.11.1.bb
index 255f5efb703..83d2f012635 100644
--- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.11.1.bb
@@ -29,3 +29,6 @@ do_install() {
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+# This is a different Ninja
+CVE_CHECK_IGNORE +=3D "CVE-2021-4336"
--=20
2.34.1


