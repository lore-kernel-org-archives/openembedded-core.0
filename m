Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.60])
 by mx.groups.io with SMTP id smtpd.web10.2002.1609874254469197804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 11:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=O1yJyNFL;
 spf=pass (domain: outlook.com, ip: 40.92.51.60, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkl9Nx+iUkZku9D6oC2OAN8sL1Du57sXSWpzYLzF8GrSxc/3nxBmtcTGkZzSEf6UcywZ02z2bNDDCOsRIDTYo+LMdWlWK3Nd88tomeUW/j/3ZX8U/UxU18HT0Jw5UyoFaxc1AJX6LY/KXJDqXmaq5FB6ypMND6j7f8ako8Nf7z/DrDtvdCOFWDTyX3kVGckbTShtrT2/UZ5H5dpqSJHwe90hot/rirmv04MyYOs4TyGDd9iRIImJyqHuxgRP8R49sa/9fF2Dst14+7sI5aiMb6ypZiTNI3Zk9YcB5M3P9tRtK2P5UIql0Mzwb6W8KMqoW/nQEluBhuA4ooPtxTIgNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4pRd/nkLqGRGmGFAYK7tuOdnYrYhF66S5zbaLfhghQ=;
 b=nm5etSmCGxRMTeTzG+hKXpG7PTVgveYv59moKsBZIF53B8vm6M2YXgIBdeVz+lW7zKxykoAsAqkWzdVdLwBc5qwFlzwdRUJqOyUOE+FCUgy0AMCXuBqtggn2CkXTFEorjsPKpT4gdjZUm0b+c2orZ5xMMrJAnOFuJPe07x7I2zPGFam9yYh74AHiW/iTi1Iq668cgP/Gbum4ob3W1Xa7IcmHvSaBrdRH7+M5C8Qy5wv4fNgbThCHH1yl2U8Ick2zKUkoK8zhbjQ7BhxYnRAcocje7hGLERlLctG9bXR6DClECJUnKb/PDdcIE27RwuE4o6Ay3u9BCPv+qTRO5Aq9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4pRd/nkLqGRGmGFAYK7tuOdnYrYhF66S5zbaLfhghQ=;
 b=O1yJyNFLYVGmB7HfM0676A3QebSdo6zoGtBvJlIflcDAT4bisfXeZK5KjhmfEZANo0ZO1ZFPThrdj80o61HmCrgRilXIir4TpIZTatecqeuFwshtPvWD08/NGnKgRvHWjVu17gQPmpjeHAEMMAk6FQh+/rhGzP7+/vcCkfCyfvCa/QQYYmrwDlBtWo8co/+byfLe/8tUBvmgRQKsrv4hC7pt4mTh27aqLWIOVsy59/Dyh43wKWBV+mvwXEyag8M+Sra71VR2w8+zRpLL4Uxqtdq5tV33evi6xVzEBztbyF565YCIjIpzPlFhmfCrJJFRm70prilI/AM2v3u7GqErdA==
Received: from DB8EUR06FT003.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::47) by
 DB8EUR06HT226.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::101)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 19:17:32 +0000
Received: from DBBPR09MB4748.eurprd09.prod.outlook.com
 (2a01:111:e400:fc35::47) by DB8EUR06FT003.mail.protection.outlook.com
 (2a01:111:e400:fc35::217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 5 Jan 2021 19:17:32 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:F6677F80C06B8C94267BC85FB4D892FAD6F36778CD5231B887476DA99E109CE9;UpperCasedChecksum:69C54EA19441A67563A494B371C990B3A6086167E16A780116199D6C30EEEB26;SizeAsReceived:7387;Count:47
Received: from DBBPR09MB4748.eurprd09.prod.outlook.com
 ([fe80::d4e6:adb9:cf8:ea64]) by DBBPR09MB4748.eurprd09.prod.outlook.com
 ([fe80::d4e6:adb9:cf8:ea64%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 19:17:32 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [RFC][PATCH 2/2] OETestContext: order test cases by prio & depends
Date: Tue,  5 Jan 2021 20:16:56 +0100
Message-ID: <DBBPR09MB4748F5A122F2C7C9B7AF9356A8D10@DBBPR09MB4748.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105191656.10222-1-kweihmann@outlook.com>
References: <20210105191656.10222-1-kweihmann@outlook.com>
X-TMN: [fAKB9NUwfi0iNpsmfsUZDrZZbamjWJV3]
X-ClientProxiedBy: BEXP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::19)
 To DBBPR09MB4748.eurprd09.prod.outlook.com (2603:10a6:10:20a::11)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20210105191656.10222-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.89.138) by BEXP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.2 via Frontend Transport; Tue, 5 Jan 2021 19:17:32 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6b7a13b5-2f96-4f1f-980b-08d8b1ae8d70
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyKX7eC5WDJAQn9HrQFd41bQCFKEoRJK8ARH+AuroUvgHfCL0zn9NFOIww257eWDnGlhsbkbl4tZb6xxDv5kc9uoOieR+xvxP2yg0WGv2tdXvAyxw4miqP/qE1BslDMSU7Ackfu24oifSjLk0ioRDrfYmvYIqlzvksfe4FH/lSVNkhGWYe88yyl5R5WH456zlqqFY1ew4BJmK6+CaSg5/vo9Va9FC4IEKfXKNQ89BlIN45smEsphdu/0w20LjEinufWtfXFGj6UfdFc4Gg7OpsZD+CGNXc9tsBUX1+0F3VXLF9Qg9Xk4moZsKM516pt5t01k51QnFxYqbRywOLzEwmLAf0VylARUqeZF7UXreWHjejWLaezkhfmH5jetLMnliF9o+SgfcrVwkT+oCfroMrvjqDeYGsVJgeEPTIZXi4NYAs6tTNM6A51NmepclbRStGA73hi8IIw5xmV5q4h6ZDs1JcHWP6zBMtPxXHVzzajaWEp6nh7kplNTOPHHjw9iM2QW5c4lY/Q8Pqf1r6mrgSBABWEvCXwrHubGOlIk7obNzxYlyPO+sJDYNnjDX1dv2U3re1/YFhMLBVLLW3SSPTAj0ur4EiM709q1e8MeIdHJo11d3l8mCknDNtwz8nntQ9oo1ymH1IsNps2q9Nb+yRk7Et4ANoewtYUkXEKKGA6Ytuu8aNiHtGzSLIW0Gz31JyXmK3UCDn/V5SOJSj4J7cMsdlq8YGEb0pwcjISNTNnV2cC/nxvJIiblxd6AB413SqQ=
X-MS-TrafficTypeDiagnostic: DB8EUR06HT226:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0sHDj4o9Ke7TvZdOynSikxg+7AVez1YZXjRHc1MjLly3HwCKfWP4Cx0pPq40J0T1eZP51SitVbVfnrhry2bnTsnEJ2r5VzBmv3n6qC4MpQKhSNpAhj5ffPeHumhGZA0iLyN25mJQON07yn/YyOj0Qw6l1EW3U341Zq/4JiqUAoR9apfrMgFzM8ewnAUavfh2y2eXLnOenfY2y63ZxJfGbRvbB5rz2T3Jer0O8uJFAfQcAqdRthhPhrfbrNm5eYBf
X-MS-Exchange-AntiSpam-MessageData: 
	kX0+d2+mxxvNWYv4mXlxBRYcT3LO/oicA9lltYD1IfSVIYstb4QMk7KloYQYxHdvnBYCf6+2l7OcxfWCIlZrlraA2p0zMe3NBkbdhy7nAN6ewb6Ff6BOVVH0k7c+72gKVfXzv9CdwYep/aGrh3XJGA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 19:17:32.7959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7a13b5-2f96-4f1f-980b-08d8b1ae8d70
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT003.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT226
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Order the overall test case list in the resulting test suite
by priority (by default all test cases do have a priority of 50).
In a second round move test cases with test dependencies behind
the maximum priority of priorities.
New method 'orderByPriority' can be explictly overridden to disable
usage of the new 'priority' decorator.

Resulting test cases list will be passed back to the calling
test runner instance

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/lib/oeqa/core/context.py | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 2abe353d27..8c5589b512 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -66,6 +66,34 @@ class OETestContext(object):
                 if (cid + '.').startswith(skip + '.'):
                     setattr(tclass, 'setUpHooker', skipfuncgen('Skip by th=
e command line argument "%s"' % skip))
=20
+    def orderByPriority(self, suites):
+        _ordered =3D {}
+        for _test in suites._tests:
+            _prio =3D 50
+            _depends =3D []
+            for x in _test.decorators:
+                if hasattr(x, "depends"):
+                    _depends +=3D getattr(x, "depends")
+                if hasattr(x, "priority"):
+                    _prio =3D getattr(x, "priority")
+            _ordered[_test.id()] =3D {"prio": _prio, "deps": _depends, "re=
f": _test}
+
+        def set_suite_prio(suites, suite):
+            for dep in suite["deps"]:
+                if dep not in suites:
+                    try:
+                        dep =3D [x for x in suites.keys() if x.endswith(de=
p)][0]
+                    except:
+                        continue
+                suite["prio"] =3D max(suite["prio"], set_suite_prio(suites=
, suites[dep]) + 1)
+            return suite["prio"]
+
+        for k, v in _ordered.items():
+            _ordered[k]["prio"] =3D set_suite_prio(_ordered, v)
+
+        suites._tests =3D [x[1]["ref"] for x in sorted(_ordered.items(), k=
ey=3Dlambda tup: tup[1]["prio"])]
+        return suites
+
     def loadTests(self, module_paths, modules=3D[], tests=3D[],
             modules_manifest=3D"", modules_required=3D[], **kwargs):
         if modules_manifest:
@@ -73,7 +101,7 @@ class OETestContext(object):
=20
         self.loader =3D self.loaderClass(self, module_paths, modules, test=
s,
                 modules_required, **kwargs)
-        self.suites =3D self.loader.discover()
+        self.suites =3D self.orderByPriority(self.loader.discover())
=20
     def prepareSuite(self, suites, processes):
         return suites
--=20
2.25.1

