Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.92.70.69])
 by mx.groups.io with SMTP id smtpd.web09.8722.1619074335343231770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 23:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=GeJl5PZ5;
 spf=pass (domain: outlook.com, ip: 40.92.70.69, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhYwaiR2lO9/3EShOF2T4JInuLFo0w/Nl+PaYQaoZ3yj1gcmK8SKlKP4732SHJ9daKQO5CAd59LernDAiQ73Dmt/kNsLJyB08x/Hsr/8LvvB53dbDY+64Bq37eEpvoKioOuaTzyfZeu9dS0dT4SYX8DcbBssxh8whxi2KCPhzUo1i+1Hloh2AmP7F0V2UDfYqIi+e9xXIGLK1KgZuWAbarubbGgOVCI385t25eNUTrfir8Hkmmo0SsLG2R+F+mfY21XzlNQ6/8O+rJv+kR5RIujNIlAyRiL4leELP5CaAkcDnPtMFeLyuEh5APneXP+4cNSAHZgrsNSjIpRg9bj36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJg3d2U6xFB6F+C9sMzv3v2vjLb9OXSu4CyR5iYqN9w=;
 b=K8eenDdAOoMo4o+4heVA5bDmpJmDzOidt4Op4Y3G1cZEW8QaKr1bKPpz1mZRDhmxjgoHsRadKX7yrGduV8es2Iq8pT5qWZOoo4bADmp12EZvZ5pQYVsRMdTYcLr5U7KONjuZOfMcRkkUcrb5ELooe+Y/JXJgWEPWzNjWVKoqvR8BTE1a8MYZxDIb/v9UoO5t/vJK/nG0e5B0SWWBHzxktSV2iZat5P66vqRZwfx4ssEU0t9rW9j0GoVMq/4an4JpwCzw2xTRurpen0RawZzdl8zoRQklFTXNpkFqYhYaYDBxaT9yJqv3kGQA5vTWJtLBJKgNPO8+SGJf40jCWhT++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJg3d2U6xFB6F+C9sMzv3v2vjLb9OXSu4CyR5iYqN9w=;
 b=GeJl5PZ59oVgYl/atlcPqA4Hlc1tCgN1yAy3iuMw8E7L9u6qvA2iTsfliRpnaKTt6Nt68b7bl0yHyaFQ4e3ZeYWjfkRO/w/jlwrtPqo8Ee6onle7f0gXT68JNOD+wwUC3z8paoUtF5/haTmruM4L3FIYOC/K7A7aZiYQJiDXX+lKCiZRcEx1bCT0fXi3NVQmqRMFAArkxqHhRz+pdvREVH6WMf37V2PctwV4evDB85Qhbd3pSacWnMFhbHITK++/Ym1sai7N+oS+1KsJOrDTMyJQxRdIiyaTQPFSLDYReu7Y0PLyB/rFYbnywMFtZa0GyeT9Teh/xMdp1nOoFFJ8RA==
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e0a::49) by
 DB5EUR03HT024.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e0a::481)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 22 Apr
 2021 06:52:12 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0a::43) by DB5EUR03FT006.mail.protection.outlook.com
 (2a01:111:e400:7e0a::106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Thu, 22 Apr 2021 06:52:12 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:FC9A84A8755BB2DC46D2D720C815B75DA139CFED22D1716EBFBD8D2FE834CA80;UpperCasedChecksum:6779CC3FD5084B788E611CBDE7CA1254F774D65438C12E8A5FD90F8AB328375E;SizeAsReceived:7305;Count:45
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::a49a:d6ef:d598:e471]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::a49a:d6ef:d598:e471%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 06:52:12 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] cve-update-db-native: skip on empty cpe23Uri
Date: Thu, 22 Apr 2021 08:51:43 +0200
Message-ID: <AM9PR09MB46420BB6685CA903F63B2575A8469@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [cWMdUBiKu8RbRGq1vvMJW/VAw60KUr+u]
X-ClientProxiedBy: AS8PR04CA0111.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::26) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20210422065143.2995411-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.90.56) by AS8PR04CA0111.eurprd04.prod.outlook.com (2603:10a6:20b:31e::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend Transport; Thu, 22 Apr 2021 06:52:12 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 5ebd8538-bd27-4371-bf81-08d9055b2840
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtyu2s+u4PQccG4S+e56nxP57WhO3O8H7PUA9C/57Z0VL/aIeE7ocMkXY2IaR1cuUAXIQGju20M+7BHTAY22WxO3STQiShCZQ3p3kZf5TY1FKxa0F2+GzfunD8OwhzEb1N8xENODoLpjPGMLDcSlODVsOXmmPHfaeOrxHtSZYS7UWIA7cWaugBZ9Ikik7grTdVjOITScObZ2OSUKWUBRGuxXIysqGjx+MMBNxq8Z9eOp6FjnmwVR7Gru8Z54L65ANfNtoS8QvhdrucTJtDjrazU6PyZqA29OewlDr5ZFtT0YfFKtjXwqM6oyssXi8sJfWFrrM0e3KblVLGldsCTIChei3qVlFD4kf/KRjJrv8gEmORicH1Lm4aC+nqMlOl+BdXEhlL9C4Ir471JjL5OmB2PZRaIvaYbrQ0j4Gt2/gyTxS6vvKbQp+RMo0Ki/+kaQa6zQCQ0RezIoao6WinriGa4/dzRyJxsX/oTSJ+uvnj9L6qRTFu2hA6Iei80pFQ9KPllsPZXujsc5JikDAEycyv8m3mCmTEjVdJAyXbP1rD2xNHn6K2gHr7LSMqKataN0fD0Mj88o1kfN3Ey/rsgVmpfMm2QS51T/6npC9TDc+/X+BgRjbamE2aD4xnj1ZFqLrQ3dcBfFrtc4D9dd7P0rDuCQQveEhwnnonwbwJSiEhtZaPujs5Q6405VnM/Mw3xGcavof38GsYGXwXw7W+eJ6pdoc5t4dgdBlEvY65USg/ZUGQ==
X-MS-TrafficTypeDiagnostic: DB5EUR03HT024:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SV4osyHRF19BNRG4XdsGlJkgwklAeYEvxdJnJw2l8o1si/01czh6/5xMzLzSalxi0F2nsA7YyMOVMmwy4Rb2SKhwVTHek5utHgS0uI8fe+ZLMG8mplmQ5iC4D9hniF7cjjzTiCq7sjKWMnFAzhhDE5iYIbOl+QP/wLQS8ojZp5zc8AeOnU348cIOWe7vWHNGPcg3+1JDCXFd6hp+9fFCPwHhWpSQ+Ty3AdpvQE4q5dd5FXI8Ro7Cs6C06G+ix3/J+Pj34Vir8qd1d8PlugNnHQtYHd5kEIFkK4hObcLBI8S8ezsvTfkkV4s7Seq7y8RAOit8nHoDl3WB0Duw0NVpwJifNo9mxkxGJbiVlPCEcmeEUDmLpzwIF1JU8RysjPAtRfCxNDOTTouVocopcr32dg==
X-MS-Exchange-AntiSpam-MessageData: 
	p0T3Ote5M3Pk4OV7GjFSw5czQL/9n174q03rAyv2azEihE4QofeNxN8R/yLi16bUXeblh3Hhz8vj7qpKxNJuwnxOAcfYhXjDwJRcFMvV4Qoe+0QjwxDRIogT2mmUolXgmigIL8sIE9AmnpP666Fi0A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebd8538-bd27-4371-bf81-08d9055b2840
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 06:52:12.8256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT024
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Recently an entry in the NVD DB appeared that looks like that
{'vulnerable': True, 'cpe_name': []}.
As besides all the vulnerable flag no data is present we would get
a KeyError exception on acccess.
Use get method on dictionary and return if no meta data is present

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-=
core/meta/cve-update-db-native.bb
index 25ec6bac71..1599396c92 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -139,7 +139,9 @@ def parse_node_and_insert(c, node, cveId):
         for cpe in node.get('cpe_match', ()):
             if not cpe['vulnerable']:
                 return
-            cpe23 =3D cpe['cpe23Uri'].split(':')
+            cpe23 =3D cpe.get('cpe23Uri', '').split(':')
+            if not cpe23:
+                return
             vendor =3D cpe23[3]
             product =3D cpe23[4]
             version =3D cpe23[5]
--=20
2.25.1

