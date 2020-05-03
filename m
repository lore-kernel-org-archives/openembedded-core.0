Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.56])
 by mx.groups.io with SMTP id smtpd.web12.21649.1588507322992601122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 05:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=ZJ+MiGgi;
 spf=pass (domain: outlook.com, ip: 40.92.67.56, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+TLk5ZmrsdLPUzM2Nnp9JLlhzopcnKkmbgfOZr9nI7SRdHy/N6oxjS01mwx4040qUMczYP0JFfxX8vFa2i5jeglT0JpYo37ghDxZcDjfm0N62t9y2Sz/xdVm740EK2zaoBPDvPWtB8kmKJjyNvcuwsf1g30jKG8a8uqO+LjN0wJDnRJR1VCjqEIHMTdlCRd5by2QqHxviw84OFRyZfN7fTjzyrunGyEUHo1v083SJAIxotnRDcbH2xNo3nV0nan9fPAJ6rPRBUd+CgbIXXirLr/32faEmQffQ1lDVPYcavz5H1hi0+ULIVULyVr3Lb0iksiTYAngBuZI9Brd0o9jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qknF9E7JqUtx7l34OQsfqdFnHmaolDLdT0prt7h5EDk=;
 b=k9j8PQxMtb9edlL+Vx+9y4PAeUeQKP1o7XLsq6hlmNHpqnLuXGzh+0IikNw2QqWABBjkarfXO6PDAoswkjNsmWeR4Yq1h/ks5fvAwsx4XuFBc1krzdXEPHPIE9QuDpttkp9xcacOR6gPyRgp8HhWdZZI1xUWwTzcEna5PFodqXdqi5XIEMaLQx74q1N5hFxyhSUyZHuW4U5vcLS/AuaKsGo3H3SPDYdpicIembwAwWI5+RJNNzDYDtVFU2XTS3EUFlJgpkaEMRTROnOy/TJsdHqh/KrOiAAj1pp0CzXWFp2A+NAUihDZpn+SeX9ZBK4Og4/6TshA1FTRFEBWelReVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qknF9E7JqUtx7l34OQsfqdFnHmaolDLdT0prt7h5EDk=;
 b=ZJ+MiGgiAdHe1PLTHJNyD0jp1FgQpiF5IPG2s3uWFQCpJFLxht2apF+Ti2n7oyKbuUpEvB+UuMeGa/r0FXmuk2AZH+kHBjZKBOsphaYjqUoFj+p1/RBlGKDwYq+6CNgQnjXzvH06R4MyNkhIrMTY0B5MX3oJtnFME5xXgf6Xmv6DNtg1lrFLnHRae5kwnsRRgQvFcPtJsokLogR9+xxx9bB+pQCuTznvaylNjte1c4XbBbFb61/Kn2ktATBwo7EmVFzNIMD35gmk4tjYrHqQG88i5w3KGhQT54d9JWR1jaoalnyzxbGz5hRdWAcQ/ThnYamSm2N5pB7oMAHxgGgB2A==
Received: from HE1EUR02FT052.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1d::4d) by
 HE1EUR02HT156.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1d::397)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Sun, 3 May
 2020 12:02:00 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1d::50) by HE1EUR02FT052.mail.protection.outlook.com
 (2a01:111:e400:7e1d::305) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Sun, 3 May 2020 12:02:00 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:0BFF5E66BBA017F8AB0B6624C79D5274302756ABE031234EAC1BDCAFF0F2EE57;UpperCasedChecksum:FA02A17A5281484E7CD545645C6872620F90955BF40676921ECF87249EA85933;SizeAsReceived:7461;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%7]) with mapi id 15.20.2958.029; Sun, 3 May 2020
 12:02:00 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH v4] php: fix zip package config
Date: Sun,  3 May 2020 14:01:43 +0200
Message-ID: <AM7PR05MB6881470A9DF3C88D48AE21E7A8A90@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P192CA0048.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::25) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200503120143.26103-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.87.181) by AM6P192CA0048.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend Transport; Sun, 3 May 2020 12:01:59 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200503120143.26103-1-kweihmann@outlook.com>
X-TMN: [bSoz9dbc0cdq4zznpGBDdRU2M8JrSBUR]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: fe10e021-d59c-4a2b-4c4b-08d7ef59c8cb
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyLZjHvRyHEJ2yv1rq5fk3tpcFLIn7P7Fp1GTD/JLXrihbn50J8zWjB42MMge8j/YhcguBxSF+b+jYpJN67h3wk7Q+TXWKFrPYsjOmXFZft/WCfQ11ZL5LfM5fB+LQg8P/k3yVQOZUiRGqQRmjt+qzsVjptg1sQfmJ3FF6W15Wq9If50CMAeOFBmtN/Bkk2BOFHD1q/72jx0/ivZdiQ/GbI5Z+NUCSlySrUNiJul5X+Y5Vydoq1lN4QZhbTtDqqXeGS2UUSZ1DbFt2g/NSOMIVIDEZW1x4NP+heMNb4mz3uQpm8EnAWG0jEqy9TKMv29a8217xxd9Ov67X/CBl56zot9G2+7Kq6iCPKjblveLVdlDGz30ln5yn138XxuGDbnNSuT0Q7pbA01E9VqvvUIr/BSCbBl+wG0wbXHT1Unm7lILFnqEor9DMDIW/vlF5Tt9lNHmTC/6Byq7WWDmkxbh5wllqAJXYoP6a4uC0OhpuRdybkni0eXxaEqJXTYFaUcl7Ct8e9/h+RwV71x7rZVQVZF0P+z4o440kVuNtjHPKnr1Lx4wZMMb2p/GJL0JuoQoaZiKPw5rl5G/5wtJC9Dl3yR9dnJObsElPJ6vo4bapmot03dsTcyz4ck4SqL8gByz3mBJ6IVyNXqd3zlr5vE7J5Ev5TO2M30XWLbAWT8wYd6wFr0kDG57HJmqgmQLo0lD3+Rm959Bkx28J2d1AzbgxbBSWhxBpT02d3I/OjFUvUf2iuNPQLtA7dcrGsW9ZWOJCk=
X-MS-TrafficTypeDiagnostic: HE1EUR02HT156:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jP6bMqM7Sbbc6QMhcioC/ZrO6P3X0Hv7J0USsnxN4hHL4886tRNeBOXZ7AC9gYdIcxgWuUp12WIzQviCe+9BUHNPUhzGVwrIbRVFinmYAnw5cnPcXLO4FVmv3oWMD51soTT1TsDoVz+1/eq6vf7s2kZxQZSYRh/4FJ5HMtmlh89ydHyhhK9OX/pgRl7VWBAfY9F5JDlTTUt0hh1yMlQ7nA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	fwPG+6/7gFBwyBFI75EIEv2FwzkjhPFw2ZbcU7m3VIZOkZQV0soGro7UUEp3b0OGhcipI1+8huPsKjkcz21li8fcAmM4n22cDqrssAWa1scisNZoIljJ58bWjWZG/lM63RIoWc8PZX6592/iChCZRg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe10e021-d59c-4a2b-4c4b-08d7ef59c8cb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2020 12:02:00.2401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT156
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

--enable-zip and --with-libzip were removed in PHP 7.x.
These are replaced by --with-zip --with-zlib-dir.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-devtools/php/php_7.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-de=
vtools/php/php_7.4.4.bb
index ff4c28e13..c1784a78d 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -81,7 +81,7 @@ PACKAGECONFIG ??=3D "mysql sqlite3 imap opcache openssl \
 "
 PACKAGECONFIG_class-native =3D ""
=20
-PACKAGECONFIG[zip] =3D "--enable-zip --with-libzip=3D${STAGING_EXECPREFIXD=
IR},,libzip"
+PACKAGECONFIG[zip] =3D "--with-zip --with-zlib-dir=3D${STAGING_EXECPREFIXD=
IR},,libzip"
=20
 PACKAGECONFIG[mysql] =3D "--with-mysqli=3Dmysqlnd \
                         --with-pdo-mysql=3Dmysqlnd \
--=20
2.20.1

