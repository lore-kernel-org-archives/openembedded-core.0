Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D147C54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 19:40:23 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.53060.1673206818787688705
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 11:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id C017B20A119A;
	Sun,  8 Jan 2023 11:40:17 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C017B20A119A
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH v2 3/3] oe-selftest: Add baremetal toolchain test
Date: Sun,  8 Jan 2023 12:40:05 -0700
Message-Id: <20230108194005.2208934-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 19:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175640

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/lib/oeqa/selftest/cases/baremetal.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/baremetal.py

diff --git a/meta/lib/oeqa/selftest/cases/baremetal.py b/meta/lib/oeqa/se=
lftest/cases/baremetal.py
new file mode 100644
index 0000000000..cadaea2f1a
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/baremetal.py
@@ -0,0 +1,14 @@
+
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class BaremetalTest(OESelftestTestCase):
+    def test_baremetal(self):
+        self.write_config('TCLIBC =3D "baremetal"')
+        bitbake('baremetal-helloworld')
--=20
2.34.1


