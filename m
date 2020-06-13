Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.101])
 by mx.groups.io with SMTP id smtpd.web10.6225.1592043605607820726
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2020 03:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=Nm3nXh8N;
 spf=pass (domain: outlook.com, ip: 40.92.67.101, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AR1NFFjnjOZqt/4TEN3VmwNKS4TUpCLagzjeQG2YjdCrjG5tYrkrvE1YcA9lORuxIba6YgKyQMKFRcXcd1Cn+fBsS96c8tBCMoUhFa78vH0FVi7UV2ykR0WDp7+lP8oZI/BQec1C13V+oZL4R/tSe0pT6HYzCgGWA7Yh96zmGURvsHE9iTA5Tu8kr5Kwhhpe8eYZW5vXruXUCMFkKT+WI7yrV+M5UN+q6iRGpTtGraoYnB18u7NW8z7bYcA0SSOZwXJpuamFukxsr/GQ4HCiCm7Oizqt6r4fSonfU4i7NisNMuYJg3spjwy+dy0awhMi3u0Xh2MTZgF27aRUy7uhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLL/nnDGWsZYT1X3xt+KXd7echqW0s1ANlXVN89XY/g=;
 b=SYndEcdP9UsYa5DCL4sJjSbJJzOGeNpqGkr0p+thhWXqklpiXUWdwify9tjqJxBxLejcSHzybSbeIApSc205EiRgRiDdX4c/4E9x8UXGMJtCXJlZzZa6g/a4tqqbJ5u+Nzvwr7zKG2ggaaM4C2DaXRsnDQFoIJf9U3udUJQ/q1huivNqTAx7/BK6LEYNDJkU6YYBfDrnZm3Sl7TquxweVZxGpkoTzKHavMk++56Qp+K/SyXz/K3H9EPhfaiEuTkos41CpMM/ddPaBGlzPGpdQlhZ8JXRdSpfe2HAxEYRNhvJq0iOVtv68a44C+U4xJ/nl94LiiAVeNb5oZN0GxgmEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLL/nnDGWsZYT1X3xt+KXd7echqW0s1ANlXVN89XY/g=;
 b=Nm3nXh8NL/V0SUGkQ/HDKRyx9hCBKjYXk1d0hQc4zLYF96aswsEv4rSE9YslzkcCp4mmvav8DZ7d6B2Lf3QnUOa2PMli7o0LMOI1jCr/Kmb7yPGZ6gB8UBZnxKIrMjLCeLhH4bOCLydFty5Jho7ZqaOEM12pb5FWTCE36/eBGGoV85/vQq+XxGCmR2Q9obC3Zu3TQXnLFvL6PItxsKh2/r4u6ls/PhZJ6sUqPCAabBfwQIimPlnClWlS5gO+v8vp+9P8ysS1j+NcVN7irEWVFpqiQqCwOCiHvzmL+hu7MQFTjn+WhboW5+/alRmGJtEDnx8tStMZGbA0pLGXECaEeA==
Received: from HE1EUR02FT060.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1d::52) by
 HE1EUR02HT218.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1d::296)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Sat, 13 Jun
 2020 10:20:03 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1d::53) by HE1EUR02FT060.mail.protection.outlook.com
 (2a01:111:e400:7e1d::464) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22 via Frontend
 Transport; Sat, 13 Jun 2020 10:20:02 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:40492EE3F1ACDFC502AD548FE9758F31957E379D152B45A91F0E8170E5FEB307;UpperCasedChecksum:6DB30ED2A5F71643ABCF9C426AA467ACC352C16FABB339B2EDCA10BCF03C8E06;SizeAsReceived:7404;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3088.025; Sat, 13 Jun 2020
 10:20:02 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] oeqa/runtime: Add OERequirePackage decorator
Date: Sat, 13 Jun 2020 12:19:41 +0200
Message-ID: <AM7PR05MB68814488723D88530BBC17E2A89E0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P191CA0091.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::32) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200613101941.14718-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.11.32) by AM6P191CA0091.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Sat, 13 Jun 2020 10:20:02 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200613101941.14718-1-kweihmann@outlook.com>
X-TMN: [UAfcKE71aadrUoG5fnsykds4zTwO26ZS]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 0de3a555-6f96-4978-d0f8-08d80f8355b1
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj06SN4ZaKdB+g1xb1mDfH1YBajXkUS4rXnoCec1F7rlpkHK6GNfY5tu0ABLudVVt2gYuFnKB3ckvmAhxf/CPHPlt2siaeO7qul/CofkebakfoIbsKSl/84TzJnX7xjJtUODvQTGAQ2/KLMpU9MDwrtRzotInPtX9nft8rgpz3PMvKurJ8TmPCJmOjkrSXgbMO9KVQ3dg5BZ2TpX2fDdSYp2+IEX8xBPXLu+Ljq5Jgbkw7+vKEV3S9x+mQ/DXhgQdzkPQrP3TorkqcsHcz+eVVnjc2HNBFjo+khRYyiE1HM0BcIFCUbywrATDlJWx8ExRXmzODqpS516se8WF+AfAFaT06OOnBIa9dwQGhMivqJOlgtq+mBzkJFMzoHuFT+nsFSesyvIccpWvrwtMH7rMAiDq1LQ+ohOYXkpIfF5iGjj+gTUUNwnNmuuktXKUdSzFxoMoT8QnWqFvhcVXKOnKADGj587zuLl0/dAvg565oZWGB1TK37849w9owIktQGSdpSpagfHg1mfGdqMwQbIE/YrAD6APfXsGGWFkkx5slZrSZCFbjdmAHiPiU9INQDUqxBBSWfTpFz8lJ3OAIgJ3MYoA27NdbN/K5PxvLuR8F1psuY2CZYSQ2sUSlxTECwc4I/muacDwaTiAwpzu0ax99BZ76tMmQNOffIWB8TMpP69VmZOz6OQ9CI4/D5UX74vaJoPpq4mZqviEw==
X-MS-TrafficTypeDiagnostic: HE1EUR02HT218:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cVcUqwIw28ifN5y/cdZEab0KZzftsxmb9lF5pkDEnwDj8jGhbYzYXzisRqLuDm5Yl48HsCwtVDWA+CkxIb8bSkH1/QvJZvOUM+ub5CUDwq1prN1zeEgSB48nt1vY7Tf4HU7O2Alj1GEiMOQSjLSdtA1Ziv1zGokPYyWWfZKpE4lxEo8xsGUWmCufiWFsDtAkhqkYE2cu5LwFLea2veIQhg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	Xoyhv5rkQLB6SiN3Ckv9BpsHTCOJM1CMU3W8Euc60Bl+Wikq+pVa+3xWedCqFSpMXOXzUHgt9jeJMWKwlaGlp7yrpEMd4Tmgt9rWVrcbVd1JnK1XWvDbq2FTHGIdgb/3U5QuzI+1gm5XdXYn9waYkg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de3a555-6f96-4978-d0f8-08d80f8355b1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2020 10:20:02.9517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT218
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add new decorator which behaves like OEHasPackage, but
fails the testcase if a dependency isn't met.

This helps to identify missing packages in the image
under test when using static test suite lists, otherwise
a missing package won't fail the overall test suite and
errors might slip through unnoticed

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/lib/oeqa/runtime/decorator/package.py | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/run=
time/decorator/package.py
index 4c5ca198b0..b3d3fdbec2 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -54,3 +54,53 @@ class OEHasPackage(OETestDecorator):
             if self.case.tc.image_packages.isdisjoint(need_pkgs):
                 msg =3D "Test requires %s to be installed" % ', or'.join(n=
eed_pkgs)
                 self.case.skipTest(msg)
+
+@registerDecorator
+class OERequirePackage(OETestDecorator):
+    """
+        Checks if image has packages (un)installed.
+        It is almost the same as OEHasPackage, but if dependencies are mis=
sing
+        the test case fails.
+
+        The argument must be a string, set, or list of packages that must =
be
+        installed or not present in the image.
+
+        The way to tell a package must not be in an image is using an
+        exclamation point ('!') before the name of the package.
+
+        If test depends on pkg1 or pkg2 you need to use:
+        @OERequirePackage({'pkg1', 'pkg2'})
+
+        If test depends on pkg1 and pkg2 you need to use:
+        @OERequirePackage('pkg1')
+        @OERequirePackage('pkg2')
+
+        If test depends on pkg1 but pkg2 must not be present use:
+        @OERequirePackage({'pkg1', '!pkg2'})
+    """
+
+    attrs =3D ('need_pkgs',)
+
+    def setUpDecorator(self):
+        need_pkgs =3D set()
+        unneed_pkgs =3D set()
+        pkgs =3D strToSet(self.need_pkgs)
+        for pkg in pkgs:
+            if pkg.startswith('!'):
+                unneed_pkgs.add(pkg[1:])
+            else:
+                need_pkgs.add(pkg)
+
+        if unneed_pkgs:
+            msg =3D 'Checking if %s is not installed' % ', '.join(unneed_p=
kgs)
+            self.logger.debug(msg)
+            if not self.case.tc.image_packages.isdisjoint(unneed_pkgs):
+                msg =3D "Test can't run with %s installed" % ', or'.join(u=
nneed_pkgs)
+                self.case.fail(msg)
+
+        if need_pkgs:
+            msg =3D 'Checking if at least one of %s is installed' % ', '.j=
oin(need_pkgs)
+            self.logger.debug(msg)
+            if self.case.tc.image_packages.isdisjoint(need_pkgs):
+                msg =3D "Test requires %s to be installed" % ', or'.join(n=
eed_pkgs)
+                self.case.fail(msg)
--=20
2.20.1

