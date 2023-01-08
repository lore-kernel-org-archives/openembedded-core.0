Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5158AC677F1
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 19:15:53 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.52503.1673205345915586173
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 11:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3A80B20A119E;
	Sun,  8 Jan 2023 11:15:45 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3A80B20A119E
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 3/3] oe-selftest: Add baremetal toolchain test
Date: Sun,  8 Jan 2023 12:15:25 -0700
Message-Id: <20230108191525.1312582-3-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108191525.1312582-1-alejandro@enedino.org>
References: <20230108191525.1312582-1-alejandro@enedino.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 19:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175638

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/lib/oeqa/selftest/cases/baremetal.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/baremetal.py

diff --git a/meta/lib/oeqa/selftest/cases/baremetal.py b/meta/lib/oeqa/se=
lftest/cases/baremetal.py
new file mode 100644
index 0000000000..3f70feebad
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/baremetal.py
@@ -0,0 +1,13 @@
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
+        self.write_config('TCLIBC =3D "baremetal"')
+        bitbake('baremetal-helloworld')
--=20
2.34.1


