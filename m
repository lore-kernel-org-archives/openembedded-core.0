Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.92.71.54])
 by mx.groups.io with SMTP id smtpd.web10.1362.1619129547036856319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 15:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@hotmail.com header.s=selector1 header.b=Z3rLKBa3;
 spf=pass (domain: hotmail.com, ip: 40.92.71.54, mailfrom: falital@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/8/toDNwDsaR+vqOwEaRABTqUIp+TIqvW8v+8zoDJTT2w/VjiluARyZ6v68m5t9xW+UTWlYb1nKoZiwFmX9Yekxhz+ytvOxQcZ0uRjFlX4x4uwX9nc7lB1l9PeUKfbN7YKR+XGcX0kCcDUo7Fbi4B5OMTgwEpcWbgbT13oWTnu6BsYJX235DRziDUZhxIZd5ZrM/g2y/DgORrOlmykouqFs3MlNFudqXV6mIBJ614XUPVEkXbdYZVyLpMVp3lWfBdyr0YnKSxw8KtitulzXtEdf/VbPfNXfrufpgTytWiSP2TfAUQ1P9Nnlh6xIkdU0K4AZrWFjjZgvfAyCb1FUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBXk0g8Qy+H82rc7Ym7HZMJ+zJM6s7LdHhRUlFlJaQ4=;
 b=Rm+Cr33ue3zw07INjEGCGGK+Hcl7+Dti9iAQkZjM/HZwO4YeZIz8al0h9owTYSdW3Vp6migkCMaBf+WksKVzihg1cqpq7Smq7l53Alyz3V9RYRXwdHbu1y/UIFWRaQg5jp0g6zjgA2ZWFEir6csVkFmnWqh8FdwTyIY11g5s9FTqOxwrLqUnwIPYFlJXkOw6VPgLbMboP/gbisTSwX9DgOJ4nit28HKoc7H6hxeyEhnEnGaMGpvo2GYchRqF8kFafULOvCUSARDKodk+uIMQD55MvtR3bOWZ7znyczoUmNQehLS08jfJnBb/oh+19FufehO3K5zofmk1zZ3fgsxhjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBXk0g8Qy+H82rc7Ym7HZMJ+zJM6s7LdHhRUlFlJaQ4=;
 b=Z3rLKBa3PHWsesO7dLIR3fS8k58rc3WCOryUS0xkeYtsIGzPhl7FQAkR2u2w7pya20rs/KwAwqk/jc3B+eQhYSNWz0Bmoeyc7myAgXDT9h92ouZ3FrOYuvr2v2lOqswnlc9sLRBywDMhN7w5WoP8KzWJnD5RdFZ/nWx40w6bFEGmei82v9Pna276eYu0pQ68mDvhQ+Gyef86kwEbIE4vhlAUv/vYGTRc0SDxpWGrt0kGD0GZ1SJ16fr/duUVtcNtV94knBvl2qowhtSH/J0WT08r8lWnPcqgQGol9I4kfqx619FBcrmz+6nDcAKwfA6EEIJkxKZghUdFDmlpuwrkxQ==
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e09::4a) by
 VE1EUR03HT078.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e09::408)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 22 Apr
 2021 22:12:25 +0000
Received: from AM9PR02MB6530.eurprd02.prod.outlook.com
 (2a01:111:e400:7e09::4b) by VE1EUR03FT006.mail.protection.outlook.com
 (2a01:111:e400:7e09::116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Thu, 22 Apr 2021 22:12:25 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:B85A6115EF325A7C9B48A21AA9483935ECC6AA93A9EB8533958F65F32A170F61;UpperCasedChecksum:0EEF86CD202B265EC30C88E1BA895B4C3D780C008274FE920B1FBBFF4B29A7B9;SizeAsReceived:7305;Count:45
Received: from AM9PR02MB6530.eurprd02.prod.outlook.com
 ([fe80::fc5a:bc2f:e0a4:4a62]) by AM9PR02MB6530.eurprd02.prod.outlook.com
 ([fe80::fc5a:bc2f:e0a4:4a62%3]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 22:12:24 +0000
From: falital@hotmail.com
To: openembedded-core@lists.openembedded.org
CC: Savvas Etairidis <falital@hotmail.com>
Subject: [PATCH] cve-update-db-native: Check cpe object for validity
Date: Fri, 23 Apr 2021 00:11:36 +0200
Message-ID: <AM9PR02MB653052B255DD850376AED7E1B4469@AM9PR02MB6530.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [ZiuXYIbF3WH1yUbCKjSwlJpyXJgIVFOo]
X-ClientProxiedBy: AM0PR04CA0024.eurprd04.prod.outlook.com
 (2603:10a6:208:122::37) To AM9PR02MB6530.eurprd02.prod.outlook.com
 (2603:10a6:20b:2c8::18)
Return-Path: falital@hotmail.com
X-Microsoft-Original-Message-ID: <20210422221136.2709-1-falital@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Ranger.localdomain (178.203.145.67) by AM0PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:208:122::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Thu, 22 Apr 2021 22:12:24 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 5bc84a60-8cbf-4fe8-4d51-08d905dbb537
X-MS-Exchange-SLBlob-MailProps: 
	SNmTuH/oRumJKdvLkJ7DDU+ceTJyY7l3pj2ryWMF6/QecMeaskJ92YbNdD6944nY4aWsT/vNsdCSCeKc1NMai8lMwIRILKOPusYylbgrapwb6nEY4wRcNrbsYMh4DsgbOWQXUKHXAK6JxPOtDQuW8MwkhDMxGtr8XveaaJE4azq6DT7WWRLtOYQJs0w4tYBzcaWfHKO6hfqCF6y748uHvtbSrMHyYUAxr5ZWpovAh6WYrGV0DTOGUWjYqYhGmfRSb7hm9WF4dRdVpkDK1znX2X6/C28QeWLAUekBHQ1B3aPGUP48EvUCE+1fwgFYtrXk4q8fwJpbBKbPSv9Lb2edG7vh54WyjpG03LfWXFr2aQRcvom0SPWhQeyGf3biZ/vh/90Ia4K+1TkXCHPbUiari5gs6ZM2l9Aj48bd1kGJwasGEajyABz0YF0s1BPZA6+ZFyMpUNorYB02hvhebEbhbYquuZgte+VPYx8LiGVenjLxIvMHQHesFHEm8K1uUcaIJi0GmixNsSXOhyAjjuMbyN4JdvaMK3Q7/DHJ5XV7k9G2G97omxxI/Z7huOiZGZTuDc+0Bo6kahohRhXhVzv1HYptIF3EMOSXIlDI/WDVVpT6AWLVPseCyvM5tG34QRnbXa3pn6TjqUtrPh0+I2n0N6q50pBqaoBGVve4Rejw4DRdWhklZHZesh+sBsjPCfEc2z3fU6w4GCragqRoFoRqQqIFyke0uyKnh9OK83PLu8QxnGhZA24irBGbAl4kSBMzF2C1tL4jNdPCl+ELR+3F/ligPzH86UmTrd8Wd+fyz+Y03hN4DvTgcEeE7UtF7pRi
X-MS-TrafficTypeDiagnostic: VE1EUR03HT078:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J4DK1LSwcW1OX0bix+frCD5WbdFSPEqnoOGwsrKUcJwgv7a1VsKaSXpAgpky8i3VpUd0GlhmlgWxcuxSVz3vSPY3/m+jg61tmhGljTS8k3ksLj48STRl940nivHxOclbjDCVGuLtBvApVuosGAqZaHCgin4aki6Mm1G61rKwNU3+Ku6bz4XciAMLfQ/M9IREF98aQGWFW1X3t86CMuJKuwju71FpFWOT5zhSDErERS22rA0BeUJBgN4MUvLMeerKedUOwoXLht/lJQF1cqmy1Y3aveIEvIEthswMZ1PhyWbgxTpUS6TfMQKQRYccQcsd27O/NT63QudIvuUmApdD6pbGccxSryINJGQjTc4SLciDxPLylUc7FTmtfNio6cPhi7Z/NBDS0UPN0k+V93lJ1HFjOJsM2uVsHRN0DJ/clVJqzUx0hPdM2D0qg4wak2bk
X-MS-Exchange-AntiSpam-MessageData: 
	x2BuGrTRJyDDzZgDNmZUY42kPYdFmwlhtZ02a/n+qN+N5zTzfv0yrGmo2bNlYDDrlXjnu+GyXelM6hZEKs+6lcY6LEsmYsM0XCXJ5DyajHa2RI9vZFQv6h9weK5iPivOXk7zRLuf7mZRBOet2+KJFg==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc84a60-8cbf-4fe8-4d51-08d905dbb537
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 22:12:24.7904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR03HT078
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

In case the cpe object is missing required properties
it is not valid based on its json schema definition,
since it is not valid the routine will fail throwing
an exeption which will lead to a broken build.
To fix this we ingore this entry.

Signed-off-by: Savvas Etairidis <falital@hotmail.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-=
core/meta/cve-update-db-native.bb
index 25ec6bac71..50ac62251e 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -137,6 +137,10 @@ def parse_node_and_insert(c, node, cveId):
=20
     def cpe_generator():
         for cpe in node.get('cpe_match', ()):
+            # Check if cpe has all mandatory fields based on its schema
+            # https://csrc.nist.gov/schema/nvd/feed/1.1/nvd_cve_feed_json_=
1.1.schema
+            if 'cpe23Uri' not in cpe or 'vulnerable' not in cpe:
+                return
             if not cpe['vulnerable']:
                 return
             cpe23 =3D cpe['cpe23Uri'].split(':')
--=20
2.25.1

