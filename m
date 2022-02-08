Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED633C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 14:30:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11871.1644330646693337486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 06:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB5BB2B
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 06:30:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81E493F73B
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 06:30:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: test that newlib can build
Date: Tue,  8 Feb 2022 14:30:43 +0000
Message-Id: <20220208143043.4129965-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 14:30:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161511

Add a test to set TCLIBC=3Dnewlib and build newlib/libgloss.

This is the absolute minimum test, but at least it exercises the build
of this package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/newlib.py | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/newlib.py

diff --git a/meta/lib/oeqa/selftest/cases/newlib.py b/meta/lib/oeqa/selft=
est/cases/newlib.py
new file mode 100644
index 00000000000..999e3e78b08
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/newlib.py
@@ -0,0 +1,11 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class NewlibTest(OESelftestTestCase):
+    def test_newlib(self):
+        self.write_config('TCLIBC =3D "newlib"')
+        bitbake("newlib libgloss")
--=20
2.25.1


