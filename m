Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.48])
 by mx.groups.io with SMTP id smtpd.web12.25127.1592245996253557466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 11:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=qGWWRhAk;
 spf=pass (domain: outlook.com, ip: 40.92.51.48, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLcjBX2iHFAIxcVB/toWOg+scl2rdDYZrXjnp2tCvCJQ+exKbGMx3uG0QXJ6U1xzSBquBxbdjTzrJE2O1ZVdJ274Fa9fcdegulGhRqsUqb89cTXaGbQJQQQ/+3Ygo0WPzeaaAoscKLoxZrUi1VOXsAHH20EVd6pv8vmniAYFPHhixTFn850QAceaKAuaJdfcuWWL29yOx2Z7CQiiFnfpqIO/kwQKL0963fuze6uk3KuXp7KGoQYXbu5ygrEQXWj90tX+qh3ALZDKB+wbnl4r33ZSmjhreolyWtUT2UNL10WpfJtPhy8uFN6m5J6rVewN3xR+PhFUBSmiO73pGWXXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpOU8h7zcnAebnJJNAcdh5FsIiRfdYYF3lMcuXTuCjo=;
 b=jYs7wRWGQ5n+2bEEin/R1fE3fr2DO7POghp+Kz0HFZX/0yugTLC5KTqP0ds1bz3p4jzmV3OyrZe9vcx9ag4A6wSuF0p+XcJd9zVjknfBFwAfC9Bq2TlPkQDvv3fvkPCxjSzkGHIy5kYaI4ip/rgrLH1QbkAq9JC6tgIDSTZ3S8KekT/OUaqyO9LXk+H2+YBn6wC9MQAPXPIetRhK+xpEPYTqlos9lEgc8LXNxZAC+FKfFhlsRfZI13kkQVfiKu++RMDwjK3stFSpVbl6JD5BS8aMQ+izk2S+R3ABDeytU5P/oQxI6Ab7OzQdocftd66Ltd//XP9vfxuH7zrlxK7rKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpOU8h7zcnAebnJJNAcdh5FsIiRfdYYF3lMcuXTuCjo=;
 b=qGWWRhAkuaNyZkLeVsOnfi7fL/qptWKU78yIVnNDWzA9Sri2urD0/5wpCn/bvQUvu7MkJwKKyafZgnB5y3EhTH9l82q8SkdofgPpdHMUnOfKk3fIo5z2Llcb5LxSp0hsTzEvbs9yCf76Oy4J/pdWBcVMZp/QPpp+CBNyKecIb9xtkpVk54rA7yg1Ock9Fl6GFzXH6DV5qFkk9nf2jPiQq30f4vEQNcFRKA5i4KvofSj43GQhVW3pfJA/dN8265FbZT9S259DxTegZyX6jiKQHV/Una+Lh99XKhoTBBRFGvHd2RelJk7gIQ4Y9SmhGG1sZiJlc+XSqxhzoSLJ+KUf1A==
Received: from DB8EUR06FT036.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::49) by
 DB8EUR06HT157.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::107)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Mon, 15 Jun
 2020 18:33:14 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc35::4f) by DB8EUR06FT036.mail.protection.outlook.com
 (2a01:111:e400:fc35::152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Mon, 15 Jun 2020 18:33:14 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D4EA00665189D182A9A457ECED498D761DA9AAD57A68F8857C8831B255A3762F;UpperCasedChecksum:733952F4181570CF0EDD5F132BF7A2CF3A44A112758893DC0E378A0AC6D55EA6;SizeAsReceived:7378;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 18:33:14 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2] oeqa/runtime: Add OERequirePackage decorator
Date: Mon, 15 Jun 2020 20:33:00 +0200
Message-ID: <AM7PR05MB688182C8A0A3EB1F89A30530A89C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: BEXP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::21)
 To AM7PR05MB6881.eurprd05.prod.outlook.com (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200615183300.3025-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.4.148) by BEXP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Mon, 15 Jun 2020 18:33:13 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200615183300.3025-1-kweihmann@outlook.com>
X-TMN: [ntMbrl6DAmTAGmJyj7SASgFGHgUtiaaB]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: fabbdfe5-fb73-464c-1634-08d8115a9037
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj1eIGNFzfTjd4T5cI/qWxCak3s5h5fVKex+6o2h3BtQcf48SlHGyAjMsenkt/7zpYzbO7KNnZB2IFqBn7FAu7/9oD3ZvSg4dC7EXDykfWGLjkeDh7BYFjKPizWK+wyZ4h1D7lWB+m6y3Auo6oP2z4sCRtMTM6Zb7CjLbuEvz7oNTLV05OrfmvLj03c7g3F/fC/b+zs292xcO8vSDKjaRhLaLvhVKoFZfpQ8gn+8ABqh9ztRIOkj53bRgfyJhv1uyueJ7ExQY99jLUCGtLhWbrjxjPANQ/fYJfLKMi2mKlIjMhw2x6EkEgEJ1oB0vUz4m2aIKe+IK9s66eKH5dM5BxhKjbbierYmqhe34rHy08tHXgwoF+vWeibRtbWqIabVeiBnZBfapDidom5zdolK7Od7DCGl97l1z1flE2HnLSplpgGU5nhchzx2anYdg79V6tm3Zegt7ZtAlrgcZ6cPkGcvCEAppMHT3wYrxWd+GVa3xEn+O6N6Za9cCgGXKZGF3klucZvQIeUZla7WRNeQm1WW4a8IhMu0vQ5nBNjHQYrcAKqbelIKk+hE6MQeshgra8RHH9sbisUAjRNbAwalhLYtysmwRhOS2hshn5eU2/85ejPZFJkvW8SNXC+ho+VWiWQfEk7vD1Gq1VnojORZ9genDuKsZUnFTBwcUKo5TLfMAaJwPufWfsa2ZKkpTx6mXEHTiOrI8LuFRA==
X-MS-TrafficTypeDiagnostic: DB8EUR06HT157:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qggXEpC/gxWl2vyCQIHmknMZlnEbds1Wh1yooc3rOYsDcdMfu5ex4sVM20kpuqgGZmvXyO92JajRD0uU4tSobvnyOIV5AzrO4f6hHgqfgW/4mH/8SX8pI+svzeNsZYngZo7/WmsmMQnB7WQKDntFIZNXKT6ULKvUYOCmAB4lZdYgCR+M8wsj5krk5q51bbQrtz9B0D4SX5zz44LCvVzggw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	VQbrDSm/AwMPSxO7OZpAfSMKEgAnFtkkwNwe4qtwKve/tG++2A8Vx4Hrw88vDCvipSg6eZiiCrbUDFnW1qPFDx03uvLJTgk1ALq7EL36wIgRIOQiHFUz4h/1ZsVC3N//HO4pIizH9Qg66tnKe2l4Qw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fabbdfe5-fb73-464c-1634-08d8115a9037
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 18:33:14.1584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT157
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
 meta/lib/oeqa/runtime/decorator/package.py | 34 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/run=
time/decorator/package.py
index 4c5ca198b0..f96c43d185 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -46,11 +46,41 @@ class OEHasPackage(OETestDecorator):
             self.logger.debug(msg)
             if not self.case.tc.image_packages.isdisjoint(unneed_pkgs):
                 msg =3D "Test can't run with %s installed" % ', or'.join(u=
nneed_pkgs)
-                self.case.skipTest(msg)
+                self.__decorator_fail(msg)
=20
         if need_pkgs:
             msg =3D 'Checking if at least one of %s is installed' % ', '.j=
oin(need_pkgs)
             self.logger.debug(msg)
             if self.case.tc.image_packages.isdisjoint(need_pkgs):
                 msg =3D "Test requires %s to be installed" % ', or'.join(n=
eed_pkgs)
-                self.case.skipTest(msg)
+                self.__decorator_fail(msg)
+
+    def __decorator_fail(self, msg):
+        self.case.skipTest(msg)
+
+@registerDecorator
+class OERequirePackage(OEHasPackage):
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
+    def __decorator_fail(self, msg):
+        self.case.fail(msg)
--=20
2.20.1

