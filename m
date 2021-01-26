Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.84])
 by mx.groups.io with SMTP id smtpd.web12.16439.1611684509441264644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 10:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=EJXhuoGU;
 spf=pass (domain: outlook.com, ip: 40.92.16.84, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qwwoi8j3I1KY5qk3py/5lTmatfZRv/NFOa6zgQLqktkx1c5ykaJSi3UrhLjzWQ7hBbgoVyXxIEUzckwzITwJmUywgwgCkOJm7Ue0pBHlojylyBdMiwfOyOqxFwg39d0yzESnpjGx6/7/ayfypqUU2mbFLCT3nVgsHBltQ8n9Sjp3u2HaUQV/rdm0agqLCCALPTCyMmcGDfIRKcp98Ue+hNR7h5AEImiuELp0VxKPrWUtMA5ydh9OQFXw8l9M33bgZ2PiiOtiebqlkTl5Vlk67Lxy2xgL7fxxLEdGuKg8lKSHXBTn3dhfb4GVjE2jK1nfxuxRCPx3ubbjdBZfnwtsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+eFaaB7DYCMDsufgIk+cSFjmWeTqx+sKtIz+RcYwZw=;
 b=VPG/E215OPZuWRLDwWeniSA8UFAE7FFRTdxX9Ljru6CnbGmZOw3cSPyZ+KYvw+0gHBL1QX4xvm6s9ckJq98yP1Un1hr6gohrarPWj4hdgdNXISPvhuFB3Fzu2f3urd8xkXqBcQd3eZMHYJnTAdkXwQViXwevhuCPEPK5lzI0/f8hOaTJ/qT6EsrK+kDiDn8jnULvHs9KO+CkJ+BtNE1Jb5V17mFYL4Dn0FBM6Iy9cgyYcA4xxJLJD0kIRgvW2rxXiNM5JRGlQ/Lqdh1uY0K+/lA1Ihbl5JZzgpxpPCPi7VQ8qFbqYlcDTKW5IadJUsvjm+t3J8yUVIhA+cyju3lh+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+eFaaB7DYCMDsufgIk+cSFjmWeTqx+sKtIz+RcYwZw=;
 b=EJXhuoGUsIpnBhQskdP8gWDmVAKdvzRY7jbWOtttKPNNyhW/BkIV6jMfoBrFyaPi19qyrlDXY/TyplHgEXzhO4Tnka4QDCgtTILCG7AR25yvi6y5I53bgLG6BjTnOizSylb6qnCioMNymq8NvyyAG1t09EeNIXK4jesF5CmaBNgoH0HTT85RphOaU2UyfgB0WaqPHo6wbwc5iwhbFnNRdoIWbwuJPs8Qt9PwuqXqhvKY6BVKXjTuSvB+rfuPBYr0oGxBMpz9D2o90lkoR6asRvPjmgmjy6I7MXICfS8N+67ZibNXY6nLpHzboSL104bUx5pKiNK/9a2/XgLWXqbyGA==
Received: from DB8EUR06FT017.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::4a) by
 DB8EUR06HT251.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::251)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 26 Jan
 2021 18:08:27 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc35::50) by DB8EUR06FT017.mail.protection.outlook.com
 (2a01:111:e400:fc35::113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Tue, 26 Jan 2021 18:08:27 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:BFA9BC5236D1EADB9327D340C935E9270ED026DE40522543B812783CD26F25FD;UpperCasedChecksum:6EE54A4B73E84908C0C260AF5C74A941C6B774BA02AFBED8424293DF1CA79435;SizeAsReceived:7295;Count:45
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c17:e937:d8cc:1970]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c17:e937:d8cc:1970%3]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 18:08:27 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2 1/3] oeqa: add OETestPriority decorator
Date: Tue, 26 Jan 2021 19:01:41 +0100
Message-ID: <AM9PR09MB46420375BEE263298A28ED52A8BC0@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [HrcDqgsTYUyhP4MmJwNPu7eHeljjSZw4]
X-ClientProxiedBy: AM6P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::34) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20210126180143.605303-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.86.85) by AM6P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 18:08:26 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 603dabec-05b1-4b75-969d-08d8c22560fe
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtxLuW3rfWTFfNVlooeYgJyUUyBrg1kYIXoJ9BsMW521jvOrh7Bs3FdMLTBtJSU6G8xBnrbL53YW/UNyo2z5OydUJo/4MgGyfQbX/av2YmvNyZYposk8prNeEi2AIoCJ1mBNlUAoZB/DGKJvO5xEM/5pK/vhqcOgYjOaj6k+ZHHd93EI1ilC8G0eaVqOtl/ykzc9kZHnmYgg+orthoCHazPviVMPdxirZy38N3STE7tWbsqxeMUUlKtM6oREHmE191Q8Gwu/PoUMyv2lYHUMzF1jHU8iJxOmY5aqA8MHyZco+l/Lp2/KFrXaCAW5L6yrwbIbxrqn5OhhuQbZkkDC2Dw6YsEXX7z3wWTEjuzpQN/r1xwaVnEbTJ/5So8bTts72JDL5PtlMSsFNeXUJcZi25VfHCAOnzScT5GRb8j/HJNKNqn06eaYepmNKxh8/TKRBcWPeM/3VBxmD+5fyu7WeacYCkxC1pJJbgXTLM3EwjoQp2kwNVrTd3KuotHRVxXFyl6xKG+lAWsrGuLDs9phELtPbFZjENl/4nxM8JEGCW7cBum8CJTBUJ+XoKqTD+udqRvjunubwPZe2eQ9u0r0PvHaJdLCqbHM6c4msIYLUkh46cKhvvNTt0S1WT2T0SM+I0pJY229s47CbdqTcQoYpv0vtBlBNmh7DNf09d+/ozoyfAn7kxJTHoj0HSr7p59zL4Ypv1KIVjhgD8WoYSga6KCe6NZMfRZtdjG3rXEUHj0POg==
X-MS-TrafficTypeDiagnostic: DB8EUR06HT251:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A/9eY6oKMprE7G+xOaBAJs10opW1vUquVAE54zabs/xQQc0N1VH82YcY2q1dC4IJdwUO1/JmWZ9rhqPXSsCVFXD/wASMMcEigAShMibrLESQu8ihDTju93acVpFeZRpaWbsHodlXV5SbGlRerBmZvRbm9HF1rYrBn2kVrfl3/3lcQ/mFfHHV4KP2ngfe92xc57cRKcNtUDe9yhwYXdgfvbTe5Ve31vwZTf43Sq5S+mY6YqWF0HdG2QRUO4rgR6Uy
X-MS-Exchange-AntiSpam-MessageData: 
	UCuVC+r3WsuVDFoznZSaVaGYW9c7P7plg0h67sOn8SKxHZBeTKM7KcoCYHUxPVcn8iiTm0YYw8vJLjSxCjtvs81ffuIZB/fnmhukQI6eUfgffpf3Jjm8+XauIKYXqDgHrWWXBgC+OvEaRFfH7p26uw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603dabec-05b1-4b75-969d-08d8c22560fe
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 18:08:27.2937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT017.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT251
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This modifies an implicit default priority.
Can be used to move the test case either to the front
or to the end of the test suite.
Value can be between 0 and 99, implicit default is 50.
Lower values move are run at the beginning of the list,
higher values at the end.
Within a single priority ordering remains unchanged.

It enables use cases such as shutdown tests, which
should always run at the end of the overall test suite,
no matter what test suites/cases are set in the current
test suite list.

This avoids also using test suite naming hacks, such as
usage of zzz_foo_test.FooClass.test_foo to move it to
the end of the test suite list.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/lib/oeqa/core/decorator/priority.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/lib/oeqa/core/decorator/priority.py

diff --git a/meta/lib/oeqa/core/decorator/priority.py b/meta/lib/oeqa/core/=
decorator/priority.py
new file mode 100644
index 0000000000..bca4675db0
--- /dev/null
+++ b/meta/lib/oeqa/core/decorator/priority.py
@@ -0,0 +1,17 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from . import OETestDecorator, registerDecorator
+from oeqa.core.exception import OEQADependency
+
+@registerDecorator
+class OETestPriority(OETestDecorator):
+    attrs =3D ('priority',)
+
+    def bind(self, registry, case):
+        if not isinstance(self.priority, int) or self.priority < 0 or self=
.priority > 99:
+            raise OEQADependency("OETestPriority must be an integer value =
between 0-99")
+        self.case =3D case
+        self.logger =3D case.tc.logger
+        self.case.decorators.append(self)       =20
--=20
2.25.1

