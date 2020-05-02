Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.82])
 by mx.groups.io with SMTP id smtpd.web12.5079.1588426732352527476
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 06:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=MPDO1FuA;
 spf=pass (domain: outlook.com, ip: 40.92.91.82, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dh8DvbrGEyBa2l5kc9Zx/5Nebl68K+A5rHRBsor2u9Ick9JYJl8Q1I5wl+UkXJ5OtL1vSSlk8Jz0/iFVvz0ggJdr68Ad91dPnEwQAkGQBUr/8Y0nLUq9ab3jMyN3gKdTrbveBeM4fZzJEvGZrvsde4C3XepJ+3zcLbFVVXxzb2eR9wt3AARnxl6RdWHtjG9lg9XsDbjCpvL71uB/s2NV+GLr/eKHrp7Yf30UgbSIuZ08vxrHFSAruIueIjRbfjdslPLCrLtq/Meo1QSRDgUGOU3zylzBYgzBzLpeypCI41d6+Ouwb/zncN7jFYzzpWUC2dzcIoqd7A0yWqZAEH6n7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qknF9E7JqUtx7l34OQsfqdFnHmaolDLdT0prt7h5EDk=;
 b=SA3H+5RCRXc11GCHzkJglFrfPI0vLv0qevx7n8l2bjD7Nor1spWTZIsAw4V81ejaZMo2xKzPIM/PKUqADVzIUQEvteecZjZD9A6Gm4CVbiJko6cvzll/sBR7auE95v33JvB/cs7lTYCLFSepb1hG5kVlMry6mhprzLYGiEuKjjPL1eyiCm/dBiiN83cKfhHgghCMoHugXcKg7ElSNehoR2sMNNCSTfseOPACbxWSwKGlPx8ZIAKFiCp7kZTX/jXYVDKwKRVNNlFcQhyXcXLkAFWXecVsnBqfdj18Z0lQkgABodICVUEj95Us2cbsY3v8bmUiZJuRPoXo4Lgp8KhvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qknF9E7JqUtx7l34OQsfqdFnHmaolDLdT0prt7h5EDk=;
 b=MPDO1FuA0di2EWe+N7z9iQpvdycyIDr/THJOxr0qd6P3SULSqAShNNSlsqz8wI+AkXqY4A4VLLkj6qSKiXDnxMBSenPB1dSrrniGkW+bXjKF9W9/Ygkuheiv9YmLRFhS8O4ysBxBOZm07WcpH6UI/KXqYGcAsNBSbtJwDQ1D5FLJhuXrkzPN2iyK4nI0++I76r5qtAgSvxZ4+ouZf+SMld9jqCW984RjL8QcP4q85q6s/c+XRX6FaXhiEMU1HYh6WYjgi+7htijWtWPvrAc/WCjRejJcE4SSTTBNQIgdZ702bfVuQFlpBqUexQHvUOP5PD3QN95WyUtAt7bmWNp1Bg==
Received: from VI1EUR05FT049.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::45) by
 VI1EUR05HT235.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::406)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.24; Sat, 2 May
 2020 13:38:50 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::49) by VI1EUR05FT049.mail.protection.outlook.com
 (2a01:111:e400:fc12::225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21 via Frontend
 Transport; Sat, 2 May 2020 13:38:50 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:FED00D28E14A40CC94BD7535F8DC3DC6D180BDA828824288C7CC70978A5F50A0;UpperCasedChecksum:B140C0BE7E6706A9D21599EC9B687EE07756DE11542B16775A2C4A529B0E2007;SizeAsReceived:7467;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%7]) with mapi id 15.20.2958.027; Sat, 2 May 2020
 13:38:50 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH v3] php: fix zip package config
Date: Sat,  2 May 2020 15:38:38 +0200
Message-ID: <AM7PR05MB6881FAAC5E7D5F97024C2495A8A80@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR0502CA0021.eurprd05.prod.outlook.com
 (2603:10a6:203:91::31) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200502133838.22188-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.231) by AM5PR0502CA0021.eurprd05.prod.outlook.com (2603:10a6:203:91::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend Transport; Sat, 2 May 2020 13:38:49 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200502133838.22188-1-kweihmann@outlook.com>
X-TMN: [mo/vmq8HCjpTHrxzG6iHcm9q8NrAeAst]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f6495da0-c079-42ca-1933-08d7ee9e2586
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyLwVP6QrrX9/RKVe4g2uGbrXOgOSmiaRvzWViwTML+Ru5ilJ2xixBQ3zCgCiLgUWEfj3QJ7yKhnqNDnpyEI9n7jUmO8DRoGOG5XGsU0hbnuboX+FvDCCHKuQoctRazaH6RPLSDC+L9oYrR8GC64QZGRJxhxaNNbi7WTanQRVB9t+Vxy+bB3CtScb/HwOdePUyFpzfHSocoeanLDA7GiNg/YiUZlfZxAAWukbD/YNSYIJzZ6U0xIdTrzqx7Cr88WEvBIa3enJImUzCJexDi6LnFAMZ7V4gFqF4F+bzNmOUIjYz5IARka7IBod3asrP0Gsmmbem3qCryEilESXJcayCQJ933bCwp1hamwF2hS2AUiJ/EIaQVeP16rlWrMUn0Znc6cAfO4Dwf46HNjpA8LAvbvCgRGF0is0QBuVwHdcygND1/6N9ngshpsaqrJIY+PLpy7eXMHz4T7a26v5ObHz7alHKRboSEqkE644ECDRNpOenAGUPv99+jEgm2Bc8L0MFibgC8gSvqoJ3P4jnz2UUy/kbjcKNJ+/y0IsxQBKsDhMaIGe/eQoDnFM2E3P30ejJ5uQ4li5E3bg9Ds8CuO3dRH9bz4qzBK04lee9duOu13i/w8p732FcI3H67iRWd+RO4k76gHZGgQ0vvwugduj5sjdmhdN2OjDnTjU5QxGpMgvi4PKA1s38ovIO9ND9wPgUZ9XGidSBO4JhlucdPFywilY6I9j6BWrbX4jgt4lTaVXK8zYN008BHl6uKfHkzzpkQ=
X-MS-TrafficTypeDiagnostic: VI1EUR05HT235:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W11KLJ8121plQrWg6erlHpUzxa4i8PJTXzogCIBHIuMEQgWU2ThrDi6nFTXh+XPlNzkywhgvIc7d+/+k9PYhrOdUjOSHCqJGPFqEsDvVN+D6fi8w2rRW2gwYN6vGGGmhMusRkOxBvyKRmCXtPx4r2PyxllSWAMCGMlIQVzIrOaZc0uVAtKSRZrLiYHkiNZPTHklB6+NB6gv6WBHx9YCSIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	N+IKNoYQ7uAnbhIy7Sqa5dp3CclbqDIA9GNLvj4/Iat8mCXmok5QPK6eijwoQebG6v4LjF0zmxV5K86+/m1uRtVHjjpB03UDoemMGU/K2w2cMFY1flgyf/MAh8ugdf9uOitZOi6V2B9uAuiWQQePgA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6495da0-c079-42ca-1933-08d7ee9e2586
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2020 13:38:50.0691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT235
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

