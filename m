Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.104])
 by mx.groups.io with SMTP id smtpd.web12.1876.1609874253997961749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 11:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=oJICHVAc;
 spf=pass (domain: outlook.com, ip: 40.92.51.104, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCXuIDML/MnReDsHPNZuO+LSdX4O2BmJVZKp6OqR7Ye/RZlrhqt3o/Nnt2BOGPBRpKf53iXqz7Y2guWTo78/VRWZrp3Ik/NMmmE9qZpc/3CjNTvdDfHGz4VZHzSkWqUjB1CBlwGUZnhEl76UfIm4XZPBLb++F9JlbzfcWE5zCj5UWeC5lMJ3/iDjnoTa+FV6je+rbSBtDg8xR8X4eN5OA38MoEuyNvxNE9IZiIHndCbgPdThLtQo3+qdxM9fVVAewQXWO4hf61M7igZXnEa+RhcDIPLvIEOZfJ5sH5djSs33gHF2WdlCrndoxgjbjqs32ZPXU70xvaZbQAWL+pjWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+eFaaB7DYCMDsufgIk+cSFjmWeTqx+sKtIz+RcYwZw=;
 b=cyP6iayQ/yh+LZZWeRP6nIaD0l0DStiFPtHT+E9fzLRQDeDfWT8zQ41CQHeuqS9+fWuH3aImHSVI55RiPWvGjYXptE83N5q5EcluUpWikvluj0m9BGScAv5q21oxvAl4pxJBtVhZCMwNe9zykiumoRs7kcmn/ClD0H/XvZUPahjnALdEEWx21vM5SXj2ly2DDPnAHmJlMLO52mRorQkClHbBsQHuJSrqMzCmzYgXZl/5fK1psxjycgW47Emtx3jsXGr93gBKFNj7lyH2pfc1t7Mfb+XsB4u+EeQyxN37Plpi7SL+CjGyGbt0PNs1HKXpoIB5+eitd71aLTEhUwTL3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+eFaaB7DYCMDsufgIk+cSFjmWeTqx+sKtIz+RcYwZw=;
 b=oJICHVAcoPkuRxf8JvL/pviXQ9/qk7HhCWAbCrlaB8SkVnlEKwNN0JpCH/17y6DwEcLl6i/rwucVM+lTkO7tK7qfUEHj5sXm67Ni8RQSc7jnbDr4hfuT+xMLI1Uct8S81eDA+R8r4TJ8mZLrNWJOoEGoFzkttc/yxMqtxbCMYtvYDIHyaMnsn2ZAkR8QvEgD3oDk9LisXuE7iucVGAaE8BQ0KnqmaXq4IAzJwYplPFadz7wc0/iOOIZyJwi6tgq3gvHhdov0SJp0WUvbuiShy1s75EtBkqRas+Otri097nmKQ3FS+KpNX5DvcWe58GtmkJA0apJkmnoeNdw47huE+Q==
Received: from DB8EUR06FT003.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::48) by
 DB8EUR06HT023.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::492)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 19:17:32 +0000
Received: from DBBPR09MB4748.eurprd09.prod.outlook.com
 (2a01:111:e400:fc35::47) by DB8EUR06FT003.mail.protection.outlook.com
 (2a01:111:e400:fc35::217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 5 Jan 2021 19:17:32 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C849D6ABDF9A5156D576D2DFD6462D27A118CA519F30B52F1FD89C60677A270F;UpperCasedChecksum:6FB835C2AC3C7C54471433A4D742CA1CD18E1D298ACF9418CD25542B294A4EC7;SizeAsReceived:7260;Count:45
Received: from DBBPR09MB4748.eurprd09.prod.outlook.com
 ([fe80::d4e6:adb9:cf8:ea64]) by DBBPR09MB4748.eurprd09.prod.outlook.com
 ([fe80::d4e6:adb9:cf8:ea64%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 19:17:32 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [RFC][PATCH 1/2] oeqa: add OETestPriority decorator
Date: Tue,  5 Jan 2021 20:16:55 +0100
Message-ID: <DBBPR09MB4748488AFABBB0B74D5E3151A8D10@DBBPR09MB4748.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [mLPeQzWBODEe2RwZ3czRGixbCI5Tuc9f]
X-ClientProxiedBy: BEXP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::19)
 To DBBPR09MB4748.eurprd09.prod.outlook.com (2603:10a6:10:20a::11)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20210105191656.10222-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.89.138) by BEXP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.2 via Frontend Transport; Tue, 5 Jan 2021 19:17:31 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 14891317-3727-424b-816f-08d8b1ae8d16
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtyMQ35sLTzGn5u3A92afXyI2fELmf2IARFH7/w/CYMDRQga3W/d9JctSPwWWEdgv7/QnQcUjElEkTb9k5nfO5eSUImO7nI+S5z8K20EMRSaBP9OAhGHNcvFfkeLAJM/NrKDSsMNtg+/jqIy8+fE966S5qMOiD6v96hKYaCwDKUUKvycakdHGBa4VAh0c+SPkWjWGAE1lQPpmcs0cSdOMXBnSX69t/EXggFQ4DyYRe0go7KNdjrgfM/tj3XVJxuUtN4lByzBuOgI4GSyvqU1I1E1wZomqfcIEMSYW8X0b29LThEzYfsTw9/bHiUY2tOtw0ma99n3i5kqDciBsoJ/gOmEZ8PYBNGZZvxqzC2MrfB4cpKr0yo62CS1rx44T2PlNwDRFtK1oqRyExCt7AXrTGJ9JhzZkuFeNuPtg10NaituReTnft24GnQkYUbIYmDF36eJxFfWRBaAPJiUOCYl+eXfLpTRVclICUFsyucjrpC4OJ703G9lcR4CWPzNE2/bBJvk59gcSJxDf/8iBXJQ8yF8HJZMihfcy/6eVd3yGPihZlb1D4cEAvmkrOxGC8IEKf3crqfISmL1J+S+y4tMIfNqA2goixZb1Om5ZIJkI7OPimgJB9AUpD4CpFMrC4L3E7RGSvc5rAyc7El7QP18o3hdKbJWs0v0LjAKuZ7Pa/+ADrdxJ7re5mXWLrm3kiiZVudVy6swokOP0zyeXzeLCZWZVXpcm9s+CAJbIJsgZbA/yw==
X-MS-TrafficTypeDiagnostic: DB8EUR06HT023:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TrC0ikgvkH+KREOuhvC2VRfubJUMu6p4RYMBjglCvBAGikBkqAxhy7hZsZaJrjK0dsnkinEc/C5y+TDPzcI28ZAwG9CLQbtG54yl2VKOIL9ce699NIH/2jVO5kq1P7KvEXSry20RxI4U5d+azdnV/gBdPgUbGraAKXWQRe9RrwZZbZyYpg5tDscLR24kSPiuMHK6tHw9vEO8M6GPrviYjm/0IycFy/lkINvNo7KHQTujwzICJEakPFnaAMSIMVv3
X-MS-Exchange-AntiSpam-MessageData: 
	YtbaPyrq/6vXRm0c9Ob8UHRpGhR01SaFiq+XNZWt/EDBOZxIaL2rebD7/JqixnG9ge2N/APU47Kk+uJ05egjzzjRPU55Uatfo3JNlpmR1dMry7vTFg99N5fqTh5HszkylNMH3wBq8zhZqpiQXKVQPQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 19:17:32.1397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 14891317-3727-424b-816f-08d8b1ae8d16
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT003.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT023
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

