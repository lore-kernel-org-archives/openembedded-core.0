Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9C8EB64DC
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 14:22:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11947.1687357338195407495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 07:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EF161063;
	Wed, 21 Jun 2023 07:23:01 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04C813F64C;
	Wed, 21 Jun 2023 07:22:16 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] base: improve LICENSE_FLAGS_DETAILS output
Date: Wed, 21 Jun 2023 15:22:12 +0100
Message-Id: <20230621142212.985096-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 14:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183183

From: Ross Burton <ross.burton@arm.com>

Don't prefix the output of LICENSE_FLAGS_DETAILS with "For further
details, see" so that recipes can put arbitrary text in their license
details instead of being limited to a specific sentence structure.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
index 976a2ddee4b..cbda8d12f09 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -520,7 +520,7 @@ python () {
                 message =3D "Has a restricted license '%s' which is not =
listed in your LICENSE_FLAGS_ACCEPTED." % unmatched
                 details =3D d.getVarFlag("LICENSE_FLAGS_DETAILS", unmatc=
hed)
                 if details:
-                    message +=3D " For further details, see %s." % detai=
ls
+                    message +=3D details
             bb.debug(1, "Skipping %s: %s" % (pn, message))
             raise bb.parse.SkipRecipe(message)
=20
--=20
2.34.1


