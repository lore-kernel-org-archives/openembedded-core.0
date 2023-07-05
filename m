Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EB8EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 10:50:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13852.1688554234093328922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 03:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00CA31713;
	Wed,  5 Jul 2023 03:51:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 230843F762;
	Wed,  5 Jul 2023 03:50:33 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/runtime/cases/rpm: fix unqualified assertTrue() call
Date: Wed,  5 Jul 2023 11:50:30 +0100
Message-Id: <20230705105030.3698799-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 10:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183884

From: Ross Burton <ross.burton@arm.com>

assertTrue() is a member of self, not a global.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/c=
ases/rpm.py
index fa86eb05373..7ab71851b44 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -60,7 +60,7 @@ class RpmBasicTest(OERuntimeTestCase):
                 time.sleep(1)
             user_pss =3D [ps for ps in output.split("\n") if u + ' ' in =
ps]
             msg =3D "There're %s 's process(es) still running: %s".forma=
t(u, "\n".join(user_pss))
-            assertTrue(True, msg=3Dmsg)
+            self.assertTrue(True, msg=3Dmsg)
=20
         def unset_up_test_user(u):
             # ensure no test1 process in running
--=20
2.34.1


