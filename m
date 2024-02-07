Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABBDC4829C
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 16:40:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2238.1707324024506267465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 08:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A97C1FB
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Feb 2024 08:41:06 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A4AF3F64C
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Feb 2024 08:40:23 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oeqa: rename assertRaisesRegexp to assertRaisesRegex
Date: Wed,  7 Feb 2024 16:40:22 +0000
Message-Id: <20240207164022.4037405-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 16:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195070

From: Ross Burton <ross.burton@arm.com>

TestCase.assertRaisesRegexp was renamed to assertRaisesRegex in Python
3.2, so rename to fix a warning during test execution.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/runcmd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selft=
est/cases/runcmd.py
index 6fd96b84850..70047ca0caa 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -58,11 +58,11 @@ class RunCmdTests(OESelftestTestCase):
         self.assertEqual(result.status, 0)
=20
     def test_result_assertion(self):
-        self.assertRaisesRegexp(AssertionError, "Command 'echo .* false'=
 returned non-zero exit status 1:\nfoobar",
+        self.assertRaisesRegex(AssertionError, "Command 'echo .* false' =
returned non-zero exit status 1:\nfoobar",
                                 runCmd, "echo foobar >&2; false", shell=3D=
True)
=20
     def test_result_exception(self):
-        self.assertRaisesRegexp(CommandError, "Command 'echo .* false' r=
eturned non-zero exit status 1 with output: foobar",
+        self.assertRaisesRegex(CommandError, "Command 'echo .* false' re=
turned non-zero exit status 1 with output: foobar",
                                 runCmd, "echo foobar >&2; false", shell=3D=
True, assert_error=3DFalse)
=20
     def test_output(self):
--=20
2.34.1


