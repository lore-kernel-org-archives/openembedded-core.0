Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.92.68.101])
 by mx.groups.io with SMTP id smtpd.web11.27597.1592252833662536614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 13:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=qxoZaLbu;
 spf=pass (domain: outlook.com, ip: 40.92.68.101, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKs2e/hiFYcF7uuy7FAqp7NT3aAvVx8IkmuE4YQ4wAh6OKpUDEWs2R/CFEBYGLSRRIW2o2pYmgzUKpHHm3NdzOJNNdRKS68rK5+z2aHTMbdcEhha5KnHy72utzRcbfMXWPm9LmumIzBAWQb+X7Ph0FaT2vrb5KK01XATHESPXZPj9l5GsW0RsC1VYcHHCA1A+zVgSM942BfnmskSTjS5kLgJh5heT3RZoeKZckftuVchx3VS4HcYQhWOF8Q5pwFosVC/RAIisY51/rwNTzBt/dtcA3pdzKY4luKXgyqJyu8vIZ13DVF2SnJzGFMKgZs3rYoTNPceisY/xrToR71FwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoEurSpPdu6k8QaHOnOu1gRgvIkSL268zNoHPiU/Iuo=;
 b=OfnlwzrrqCh9EQtkP8FC95GS2DlwJryKRj3dsJ+fzPK0pP55jEdGQoby7nwLCabm/ZHVhUvMA5YA4vFYxknY9th8tFuUUWx7kV0PpW0RcysTqt2JIMoKuTdaaEKKHmOkjtvA53lLeDAfu3/k+5XkQhRtjc4IV6Bqkx8/sQW4eII3AfCnqzBZt+fokpcOJ67Z7Y+zdpr/JT+9DicBQ+bjHeDWpid5g0eqSVDXNH+qnhYRMJ2hQDbS6218Fj332SUQ6bm25FpTK+xltNmt7/k3iIDtMH4zPBoopfaVYoNB5kZXmjurcVZXTqQn0Bx5d3MVKj5ONvCAMOaDzwJYAfI9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoEurSpPdu6k8QaHOnOu1gRgvIkSL268zNoHPiU/Iuo=;
 b=qxoZaLbusH8bG5WwjCsrLd2asbPYZEGfwJmVuuFrAzr5dzdqM4ZhI1nTR29FUVU96wGu0IkZVY97q8utU1Hf+4n5nwCGob5Eoje5NWtkIeua4sJbv4EuwLYK9xMIHIlMUtGOK4gD+Ag46o5MMXTP/dvtdP/ItEXGeR/+l9WdfHbCcmdjCdnIRsGfVM9oIrGxLSIYSnLGE1BTep/iJMisS3tKkdAv8eZwSchOHx9ze0nxIqVz9J3wUfoqb1prA+tBP6o6DW/z2u8ORxvg4an+idpw4B8mHV9N3mbvepfIvuxD/khr/GgFv+fQSLjByaPREPvuspaoa0IDIjDqV2s4Pg==
Received: from AM5EUR02FT024.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1c::4e) by
 AM5EUR02HT183.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1c::329)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Mon, 15 Jun
 2020 20:27:11 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1c::52) by AM5EUR02FT024.mail.protection.outlook.com
 (2a01:111:e400:7e1c::126) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22 via Frontend
 Transport; Mon, 15 Jun 2020 20:27:11 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D500F29E21D528F3C0466CE5F593B074622BFE06259137CD1DE9AEAD41F91208;UpperCasedChecksum:6845A0F92D54B3A3CE14FCBEE53E88AA5A39152FF39B3F40EB0DBE83E088FA8B;SizeAsReceived:7417;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 20:27:11 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v3] oeqa/runtime: Add OERequirePackage decorator
Date: Mon, 15 Jun 2020 22:26:56 +0200
Message-ID: <AM7PR05MB6881025F753CF8A54FA3728EA89C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6PR10CA0068.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::45) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200615202656.14722-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.4.148) by AM6PR10CA0068.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Mon, 15 Jun 2020 20:27:10 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200615202656.14722-1-kweihmann@outlook.com>
X-TMN: [Zdq9f2/D5dyxxz+BZ/Jh8zh1Ta1y2NZq]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b8c3ecfc-7d82-4d2c-332a-08d8116a7b86
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj1eIGNFzfTjd4T5cI/qWxCak3s5h5fVKex+6o2h3BtQcf48SlHGyAjMsenkt/7zpYzbO7KNnZB2IFqBn7FAu7/9oD3ZvSg4dC7EXDykfWGLjkeDh7BYFjKPizWK+wyZ4h1D7lWB+m6y3Auo6oP2z4sCRtMTM6Zb7CjLbuEvz7oNTLV05OrfmvLj03c7g3F/fC/b+zs292xcO8vSDKjaRhLaLvhVKoFZfpQ8gn+8ABqh9ztRIOkj53bRgfyJhv1uyueJ7ExQY99jLUCGtLhWbrjxjPANQ/fYJfLKMi2mKlIjMhw2x6EkEgEJ1oB0vUz4m2aIKe+IK9s66eKH5dM5BxhKjbbierYmqhe34rHy08tHXgwoF+vWeibRtbWqIabVeiBnZBfapDidom5zdolK7Od7DCGl97l1z1flE2HnLSplpgGU5nhchzx2anYdg79V6tm3Zegt7ZtAlrgcZ6cPkGcvCEAppMHT3wYrxWd+GVa3xEn+O6N6Za9cCgGXKZGF3klucZvQIeUZla7WRNeQm1WW4a8IhMu0vQ5nBNjHQYrcAKqbelIKk+hE6MQeshgra8RHH9sbisUAjRNbAwalhLYtysmwRhOS2hshn5eU2/85ejPZFJkvW8SNXC+ho+VWiWQfEk7vD1Gq1VnojORZ9genDuKsZUnFTBwcUKo5TLfMAaJwPufWfsa2r1mO3rWyLyPmbm2jY1vzgQ==
X-MS-TrafficTypeDiagnostic: AM5EUR02HT183:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JWIT7jHtKE0HIJz+x+WpVznBweS4lV6TAIQ9xIzbNqWDqjJ6WXN6snSHdMWH4HqDReNnhyvNdyI0EUc9gda+gDnuPHTgrM4eXvrVIiHMXZEdw1Oj96q0aw2veCt37HweLB/YZoU7Kum8CkxAMNf7BnaoBfZoGlH/PLd6Xx2Va8oIAqlyazmyYaPBmYEzwyrsEsJixRPNKToAEi0ib/MlyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	DZFINgjSBk5b3OJaim6P63nzcPzlsZOGAiWpxyofXlz0UYNKWxLM0zTXp6MjuhyRxIQQvXzzzYX+43DzpNiS3iIaXL6zRD4aiowzYaYSIIzjECIssmv9eJRA3okBV7LdjT2qV0QGtahfLQ3I3xjjdQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c3ecfc-7d82-4d2c-332a-08d8116a7b86
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 20:27:11.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT183
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
index 4c5ca198b0..57178655cc 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -46,11 +46,41 @@ class OEHasPackage(OETestDecorator):
             self.logger.debug(msg)
             if not self.case.tc.image_packages.isdisjoint(unneed_pkgs):
                 msg =3D "Test can't run with %s installed" % ', or'.join(u=
nneed_pkgs)
-                self.case.skipTest(msg)
+                self._decorator_fail(msg)
=20
         if need_pkgs:
             msg =3D 'Checking if at least one of %s is installed' % ', '.j=
oin(need_pkgs)
             self.logger.debug(msg)
             if self.case.tc.image_packages.isdisjoint(need_pkgs):
                 msg =3D "Test requires %s to be installed" % ', or'.join(n=
eed_pkgs)
-                self.case.skipTest(msg)
+                self._decorator_fail(msg)
+
+    def _decorator_fail(self, msg):
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
+    def _decorator_fail(self, msg):
+        self.case.fail(msg)
--=20
2.20.1

