Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.97])
 by mx.groups.io with SMTP id smtpd.web08.16452.1611684509948111257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 10:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=PSXYcxym;
 spf=pass (domain: outlook.com, ip: 40.92.51.97, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oazl9RA9YPrYeH6UmyyOjSxiiXkgPqpzTas/wAWFsY0ri5fHrf7LdIzZache73RKLIlE7aqq49jKzCmOaSOC3y2jUrZdueFUUyIhwV0CSWkqWiEBPwn43Lz08rLXZhE8g8s6VYkxh7p6fPLu+0yJiLSGR6W0HKxxHI88DtebcUp2Umkx48QK+St6p5JqmsmwuhIB/KZxN9Ok9lfwpWp+Cs/FiFfi+LmeekvOYQ7GZuFPxfY4V9Z0WJu8MDop4KjcIIXusvK+KwLJEeg3wq8vbC5fTA3l6FqfGFVD81lkaugboX9bIttmgawyFKfBMBB9ZTBZWGYzmAX/wnoNbodnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dzws/fgNFJAUJtcSOs3s2IwMGAAjz52q6TewNYGuOlw=;
 b=df5L2USXh30T75xtUel9K9JFlg2/Vj+6pLH8tCLj1StZLr2wy8WKvPypGfbNdXEGU4WORDYOuAoWGGxL2CW5T2BQJnN1uIv66h68JqdwLFyj4bipoXoeV975SJoUnXCUmD+/hgdCokqRMZjoLYLKrBNzPw6bxVyN45M47T9jkTVMPua8ELMBd2xItkk5wYUNhiBUvTZCUear68+BT4mwjHHG28ZGJtgolZkoc6aypzH++gviFtEtrY7tXHuiLPFL4MwJ65wMv5Ukd+n5ZP2Od3fMAGfaGUrSKGuIQpzVbNW7+z4RPwHHaby+rvF29aFLDE07wsHTW/ewYXoOy+YTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dzws/fgNFJAUJtcSOs3s2IwMGAAjz52q6TewNYGuOlw=;
 b=PSXYcxymHLk8zFjdT4kO3SxDjln3oQWc5voBEifV2xPXCiqXOqCRbbXSwiYs+qSXz7YIvvn0989WMI96XveC2ECIwuHqX1L9+QqXyp23Gsc4oiSet+WBxfDN945NjAhrhXo8RcJeLyejF6p7E8WZMdXoFaUTc0KU691goXFR+8VGOjltfGJjgYnCaNI/oDv+RmMIXrluS+89uGo5jr/4bBevRFZg1DaIpk9L9lBnNcaoIKrULE/69pVKXyBXHnEUHZ2YG2TzAZIzdAVZIXmvtG1cCYFueq0BFO5pBC8O6yda8oJmYQ86UhmYSK2vIMY78sLKTXpyF6KgdyC7qC6/Pw==
Received: from DB8EUR06FT017.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::4d) by
 DB8EUR06HT030.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::382)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 26 Jan
 2021 18:08:27 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc35::50) by DB8EUR06FT017.mail.protection.outlook.com
 (2a01:111:e400:fc35::113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Tue, 26 Jan 2021 18:08:27 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:2321D742E96B42CC08EA81B38B26FDBC9BCC53D7B7A3090636CF20B42F5EE099;UpperCasedChecksum:3DD167FC8F745DEDBF49B2310772AC77D3940C4C3615FB16CF02FBB5AB089B11;SizeAsReceived:7424;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c17:e937:d8cc:1970]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c17:e937:d8cc:1970%3]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 18:08:27 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2 2/3] OETestContext: order test cases by prio & depends
Date: Tue, 26 Jan 2021 19:01:42 +0100
Message-ID: <AM9PR09MB4642F0A8F6A711C5CC4EE30FA8BC0@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126180143.605303-1-kweihmann@outlook.com>
References: <20210126180143.605303-1-kweihmann@outlook.com>
X-TMN: [FGRbpqrLx0bQtlIxJcMH+cyit9KgsEHF]
X-ClientProxiedBy: AM6P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::34) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20210126180143.605303-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.86.85) by AM6P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 18:08:27 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 0556e0f8-362e-45ee-5985-08d8c2256166
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtxLuW3rfWTFfNVlooeYgJyU/esdWoSgZq+bagyPNQD5vJYxDGUYFFwFXWMX1HCaYnZKENs16T3lDel/B4ENO1MOX5KHWCGUfABV+/+HS9pLyWfdXrSEXsJ5cHsZ5YXlH+wO+ZwBzKnE1bAqz3ZkZ2KpmDfN9mwQ7cow7fw6I/PtztVJLjdnWTFhTSFQcFtTOH7YnSYxdtxiG+M29YD8undpCQqh/4sHOMRpWuqumtdQp/J6qr8HEytssf5AMfur8nVGJwQCmZdrjSvsuanA/h/n5GuSEceHeD6jrrW/8LGCvLrmw+lJ6f7nWac+Qw4r3SzG1cVj4mVY/g6h6ya+eN9XR8mzagZ//vMrwd02DIo8trLffWIJqb++ivUC1NGSBBKSF4iOlK3LvK/woizkAapM1IOxJYs1zqGrmJSiGKOHXWlHQoD/tMdZKFU+LcrxZ1ZI/SLW+UgzohnJP4wz4myKvIExHqYAGbCkVDxCKrn9F6ywxeiZnpP74kfRlZNUXjUAO2SlsYhVDEFkHmZoRwKRKdPfezvE7I1F9n5NuNvbQpl5jYIwInV/e3BZ2M4Vt1tGJXmZzr7MnRMKdWJV9dxiDxVZvMKzzYb97dXKId2OlLL0/s66nyJt8efn64ZABj8QVG23i9L2Bh2N6ZjTt7y3A++el2I113VxAf7I4E32ih76nisHiVnvMsI6xkKaG2d5zNaPMIwRMFFbgFE9U+sHSQrCPgxU5XYcdA58le+XrA==
X-MS-TrafficTypeDiagnostic: DB8EUR06HT030:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yTKdHPBlZnIgU6ijEIuJT+qCG/offQDMKNyCifBpbbh4HLksMObLc9ygn3BzVypy/29ciXDi5XZ/4BJS0SbsZJlszOPd8mRonLNPD2NL9K109+Z9/2y8j26tn0V6dMvS7UDNISjj09Ihq9xh2QfK8/OLI11WiMzHwKz/aqiib78lqKqxD+2P530iBF6pi428dU/WfsIJ8Nt+oNfz8CuKhRHEKiqM5GCUUlo8+MjyFNmDKyL18Up0aKycKb+I4URp
X-MS-Exchange-AntiSpam-MessageData: 
	g7n+KL2EMq2hP3TVX7RhUIgOQnshaaLW4sMmgYTWsU7gviV1XENMrtqhNDja8jMiOTS8fZ+U5ylpdx/bZh0l4vRxR+QlIpBDlOFyr+njdfmzp8MvAu5Ma8mSK1mwBmDEBJeX1IZWVK1dbW8zQpMgkw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0556e0f8-362e-45ee-5985-08d8c2256166
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 18:08:27.9060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT017.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT030
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Order the overall test case list in the resulting test suite
by priority (by default all test cases do have a priority of 50).
In a second round move test cases with test dependencies accordingly.
New method 'orderSuites' can be explictly overridden to disable
usage of the new 'priority' decorator.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
v2:
  - mind test cases without any decorator
  - rename new method to orderSuites

 meta/lib/oeqa/core/context.py | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 2abe353d27..2ca9ec0c56 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -66,6 +66,34 @@ class OETestContext(object):
                 if (cid + '.').startswith(skip + '.'):
                     setattr(tclass, 'setUpHooker', skipfuncgen('Skip by th=
e command line argument "%s"' % skip))
=20
+    def orderSuites(self, suites):
+        _tests =3D {}
+        for _test in suites._tests:
+            _prio =3D 50
+            _depends =3D []
+            for x in getattr(_test, "decorators", []):
+                if hasattr(x, "depends"):
+                    _depends +=3D getattr(x, "depends")
+                if hasattr(x, "priority"):
+                    _prio =3D getattr(x, "priority")
+            _tests[_test.id()] =3D {"prio": _prio, "deps": _depends, "ref"=
: _test}
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
+        for k, v in _tests.items():
+            _tests[k]["prio"] =3D set_suite_prio(_tests, v)
+
+        suites._tests =3D [x[1]["ref"] for x in sorted(_tests.items(), key=
=3Dlambda tup: tup[1]["prio"])]
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
+        self.suites =3D self.orderSuites(self.loader.discover())
=20
     def prepareSuite(self, suites, processes):
         return suites
--=20
2.25.1

