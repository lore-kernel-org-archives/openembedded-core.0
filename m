Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.48])
 by mx.groups.io with SMTP id smtpd.web10.8482.1588334220237965121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 04:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=PbstkfUI;
 spf=pass (domain: outlook.com, ip: 40.92.75.48, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlGtywEPEXNpXyXMxkuMm1NvJxrNBkmgWYygvt7vtCXMcOPYuARl9SKrLXV+g+9Sza+QW2LpzCU7E4LLdHbvjtYV7ohq2QGQvCz9eRg1C2qVo68d0zb81t78+IeD4uPcJ9b9SKlQHGA46yCg/152QUBoNihManUEsmYivE6cKL6AIf4/vr/S88zICTRkJ/kF0vnGnm4yZAxUL8WpghMoEbhFO/IntwO/rux6cwkadnd+cn1gMVVD6SRrV1sXNc1zOBilYcbYmym2Zr4hVUMaHusBM2ezDwBY+njHKyBhnGKu92kQr6g2g1Wp1kcQ9q/TTp8ZfBvwDjjOSm9yAO4Y+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1bJzi8l0427/YridrRv5dt12v3mFsHRif1b+3EtLHE=;
 b=ErYcGFVeyvep/Fh4QI7mGrAaW87ERLFz8MNSFL7B9PTkGngMiBa35uL9ctFgLPxde05JA+G+MtxUfPFxsSltvy3jHpj5KeBTfdzUnL5k7DC8/HazqZuozOISAzg5c8udLpXHSUPLVtvo+Y7uwUC/mIarWVxV4/oUHPx1yAJubjr2VrgSXO/XeUl8n8z5ITkO9WITpbPepxa9fgSugB4O4RYjxzvv2mkJRwTvFaHDC8DBTqZCIc/8+q21LKcrp7EZfHEjDQU8NNL54Ho3J/jeHRPrIeaY1tlxb9mXay9RMmiae+AmCrK3NddCts/kwLqdC9BmCdmIfPbaQy06o6NTIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1bJzi8l0427/YridrRv5dt12v3mFsHRif1b+3EtLHE=;
 b=PbstkfUIw7GvNAZGNScZu7wrL3EHA0ts3MhlpSqnwtbyNO34hH85FJ9kmuHZRs8OBh5fG/GCDj/tBMTqNWVcySaQewrs2BkDW7uDNzfbpzZfA4zph5pSpilb/R88cdOV+YNRk87AiPzTvBd9zxOKVGe/k5W5Ig8ziDhZR70qxlstKk2IfE5TPQu8+LnVJk8Y8TDww06UN9bDAi88lTAOO+SO+NmcWFTjrVC7hcV+Nz4d3auwKRX1CNGa8k3KJhxW8D9U06WtFnpQt60CWzfHyLQfh4rOfaKNTDbqQwCLbRrOFo0bY2uOWQBTDH5U7sJLCfzI/P3ejJTLDiNqCaDrYA==
Received: from VI1EUR04FT017.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::41) by
 VI1EUR04HT096.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::210)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 11:56:57 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::44) by VI1EUR04FT017.mail.protection.outlook.com
 (2a01:111:e400:7e0e::228) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Fri, 1 May 2020 11:56:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:F2AE3436CBDB0EBCFA18D756A962E2471F49E3AC534B3DCCC51B2C8290A57224;UpperCasedChecksum:1A67267C804F0A0ED783D4E0050906033D9B31949E6914B802BED1BEC34FF084;SizeAsReceived:7625;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%7]) with mapi id 15.20.2958.027; Fri, 1 May 2020
 11:56:57 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 2/2] php: add multibyte string support config
Date: Fri,  1 May 2020 13:56:41 +0200
Message-ID: <AM7PR05MB68812ACF1BCC78D5DC3B9387A8AB0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200501115641.17176-1-kweihmann@outlook.com>
References: <20200501115641.17176-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6PR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::28) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200501115641.17176-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.94.187) by AM6PR01CA0051.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 11:56:57 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200501115641.17176-2-kweihmann@outlook.com>
X-TMN: [+8lGNNt/JHjO+28r1dH48B4UATndSsoS]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6de01238-fd17-405e-f6e8-08d7edc6bfed
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyLyEFKlMg+eBXg770nUz7yDqDVrhy1dl2u+0+j4q0cbuCX2ycQnJw7Zn3t7TiomPaFv65IKUxgIK5BmWcij9Qp/DTrSsN2rnSm+GzhH4B4oYb/KYaLR0Z7ku6eW72pZoGIB8nsBxLo9U1dzwOGRYJwdG7PGzEE02oy6iuBn++s9ThiqRJroADWfPr5VtahZqRbH1oUKNf1cj6OT2LeJMjqSnJuYrPnNcJme93aIteXxTxBmJAlViUDJ8mIGOceJbjSPu6HOqjGLl0xaWY7YAjsQ712+JEc4kLCBb0eqvIAYIeonQOpkAUfQupiobdeoyIXlkHZUg5mGL7PQEGS1/ZCUypZrDY4+UUGtgwQWmxDp1zpQOQU4SRLCKpGRhfnCRFibA2jo/JSP5zuk3RNVFobaiXuRP/WvJYhgBW+kyr0YRqj+AxeTbdVmacx6tLu4npPKCKzFnh8TdrVgZ/L/tF9ywIIZd9HGqBhVyw7Hks8brABLzj+Y9TvOtlsRBGQN3p2XmvdFkqrGB4AXjo1T6uNs/o6/7lSbwUv+w8dluw/69npOXo9PUUMNsTa4giK1EQeu1tniJrxAL0MolltLLjrbeJ/ozvT9Po4Rpauw3YgyMg/XulVYiRv6C7yHhEFy5xM6EGnDfiJcs9/4qSq7MuwsU3PASJE3JWst6FCMvefX4P4ZYI+UJQO15cjmYGX3rro8epf+BVMoT3Oy+TIBhuNZQ25k6DkQPua8qZjM7VydDlagg+UI9MVhhKxoaneQ1p4=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT096:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f+pPNcsSLTPC5pd0JX6fHA2rsljl8yjdIkWQQA0SJQ8MqGmw34BIvkjANyfDalO9FLGIBmgsbZ4TyuC8/gby9VoFaFRZqro/yegNRJJYvMvvvM2bSyEFJlNpsczDyxSHlbUdyIrbLxEIj/FbluqRigIZGMEjWH8CLH6/Y8M8Uroud5BUE9uVhtRHGmjIGO1Gjy8S2JNTZktz9QPR1/Xyhg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	FswMmjdTi9cJnQumJTxNd4c5vFvxbOW+I6WKc77C0L6Bj1SbI3rrkTThl8o5gFj324YlHd6nYZl6mj+7ltXVR9m7OoyAdpT8/EW4R87hhvXRWlMqo1yiAvMHdQ14+yvPJeSFIfue+Oe6p7uh2kPINw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de01238-fd17-405e-f6e8-08d7edc6bfed
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 11:56:57.7427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT096
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add mbstring to PACKAGECONFIG to enable
multibyte string support in php

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-devtools/php/php_7.4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-de=
vtools/php/php_7.4.4.bb
index c1784a78d..53cda40fb 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -105,6 +105,7 @@ PACKAGECONFIG[opcache] =3D "--enable-opcache,--disable-=
opcache"
 PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[valgrind] =3D "--with-valgrind=3D${STAGING_DIR_TARGET}/usr,-=
-with-valgrind=3Dno,valgrind"
 PACKAGECONFIG[mbregex] =3D "--enable-mbregex, --disable-mbregex, oniguruma=
"
+PACKAGECONFIG[mbstring] =3D "--enable-mbstring,,"
=20
 export PHP_NATIVE_DIR =3D "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN =3D "${STAGING_BINDIR_NATIVE}/php"
--=20
2.20.1

