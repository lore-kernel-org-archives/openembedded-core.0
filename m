Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.45])
 by mx.groups.io with SMTP id smtpd.web11.4274.1588424534747870707
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 06:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=iEj9Pv2I;
 spf=pass (domain: outlook.com, ip: 40.92.64.45, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHg3FyqVbU6Ae9VeYso0/TE5gTkcv3OlIwVmxaYGZh2z1GOoym3K6aGaa/we2+0NEsuKa3hsohgpvaOyRGkTLxrxlVwq1SZI5Sm14qkVGoDc1DCmfOWDWD4TH1H3TXIs5c6BfxNuqBdSAV2WmCV8bQmIIpRZM+x5338aAsOPHM+j6IiTTWGXivoZ4WMKBPDHtIL1oJDQGdLhk+Iw7GN4ZM0lDR4DL+ZUua4ygLAVFxIwGF/tYFPhCYlOGM1YE97sq15B4dxxHuEHXzEjuMzmZzpLJ/0vz1UZ6MhHb0z8X6+HwWaeAhs2G8jd/0cLU4UYm31LrP8FgZKulGYTVHqCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qknF9E7JqUtx7l34OQsfqdFnHmaolDLdT0prt7h5EDk=;
 b=Nzz1KK8/l67p9wUWLjGzf7aVzasfD/rzZw5+S7uNJrgnhdO2gLUsycyuCwHFTD7uNpRcj/VMmr6a3nKL/mIGf166SYlWYaaGcmTYTKHpHqPhlu8qvPT9OC9gDNXFuTPObLWGW/nUxi0qnZ8ORIill8eK35YFftNkTqwly0NQXXoUl4K2rGljDYP9GW//tZ31o11YWV6uV2nYjY+4LWAoNFepUcgO22ePQwc/f3g6CwrXxIVaph7fLm7VcWQwJo8J/AVfLqpYcvluvgpBgmAoeV70nD8/NY+VR91myUUvmzuic8Al9wsPDUlh0nUM8a6dXZjS/b+J5BVKM1wWVTCHtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qknF9E7JqUtx7l34OQsfqdFnHmaolDLdT0prt7h5EDk=;
 b=iEj9Pv2IAAiPLze3/o68u1QK8tRFZl6Z9z/AJiCHAveANJGDzJIqHHhx4xvqTHwhMt3tz8766lwyY1uIf+zjSazNKJUJMNKQUlk9OhB3V1R6TPNvbRwpLoYXJBV+g7NdHw8JRUaUrOZIcUCOOPrkcC9d5VH2BafDeZ9k/NjqvJLO3Kf5daXvsAQFuEvAWC97cGBVFDmrg6eqBwJkKE8BSLLyVaAj8cen+I+x8mZ+fpHHHpo5TQ5meHk67se/QdM8VS+OJuVaxAcGCqafPqOhigmPQyBGsWWwO4/u+LEg0yzMCMmALzBaqS+hxmBVzY4EVGEXuPhVm19fD+ZigKI1QA==
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::4b) by
 VE1EUR01HT177.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::491)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Sat, 2 May
 2020 13:02:12 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e19::48) by VE1EUR01FT039.mail.protection.outlook.com
 (2a01:111:e400:7e19::291) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Sat, 2 May 2020 13:02:12 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:8B44EC76ACCDF8D3B03CE15C063536D53B9D361B902709D754B73B63540E9E4E;UpperCasedChecksum:1047F9C216092C1CF0F49DF3690762D536854FCF0651E85B874CDB345CBFB811;SizeAsReceived:7462;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%7]) with mapi id 15.20.2958.027; Sat, 2 May 2020
 13:02:12 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH v2] php: fix zip package config
Date: Sat,  2 May 2020 15:01:57 +0200
Message-ID: <AM7PR05MB68810418BBDB42ECB6B121DEA8A80@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: BE0P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::22) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200502130157.19418-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.231) by BE0P281CA0035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:14::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Sat, 2 May 2020 13:02:12 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200502130157.19418-1-kweihmann@outlook.com>
X-TMN: [T4yuHz1X/4UE7HQvhnM9hFBlIsUkrnoO]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 7b1dbb94-c825-42df-da58-08d7ee9907ac
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyLwVP6QrrX9/RKVe4g2uGbrXOgOSmiaRvzWViwTML+Ru5ilJ2xixBQ3zCgCiLgUWEfj3QJ7yKhnqNDnpyEI9n7jUmO8DRoGOG5XGsU0hbnuboX+FvDCCHKuQoctRazaH6RPLSDC+L9oYrR8GC64QZGRJxhxaNNbi7WTanQRVB9t+Vxy+bB3CtScb/HwOdePUyFpzfHSocoeanLDA7GiNg/YiUZlfZxAAWukbD/YNSYIJzZ6U0xIdTrzqx7Cr88WEvBIa3enJImUzCJexDi6LnFAMZ7V4gFqF4F+bzNmOUIjYz5IARka7IBod3asrP0Gsmmbem3qCryEilESXJcayCQJ933bCwp1hamwF2hS2AUiJ/EIaQVeP16rlWrMUn0Znc6cAfO4Dwf46HNjpA8LAvbvCgRGF0is0QBuVwHdcygND1/6N9ngshpsaqrJIY+PLpy7eXMHz4T7a26v5ObHz7alHKRboSEqkE644ECDRNpOenAGUPv99+jEgm2Bc8L0MFibgC8gSvqoJ3P4jnz2UUy/kbjcKNJ+/y0IsxQBKsDhMaIGe/eQoDnFM2E3P30ejJ5uQ4li5E3bg9Ds8CuO3dRH9bz4qzBK04lee9duOu13i/w8p732FcI3H67iRWd+RO4k76gHZGgQ0vvwugduj5sjdmhdN2OjDnTjU5QxGpMgvi4PKA1s38ovIO9ND9wPgUZ9XGidSBO4JhlucdPFywilY6I9j6BWrbX4jgt4lTaVXDKhH/UmmQWaOsHiQmFSXYk=
X-MS-TrafficTypeDiagnostic: VE1EUR01HT177:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+9gODbxKqoG5IJxXQdpzJYSGQ63Z8Ns2Kqy1hu+gKjLHpRidABbOjPnsi3N8aL26I5XB5TJufdjSm4VcVs+PV0dD7LSGSE5LMdNirbG8R8xsCiU7YVA9KDlyAkyBYCo+TSq46Cvo+A48PZyTKYHmCaej7W6YWaE3JtRwgZg2fq8rmZCFujdUKAZsS4Qp+BJ391PMlR/CNLyBjrl6s1//JA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	am/yiAAytwz+TVNgIAAET4VHmEGQqIH2kWQdfyiALQsLk7nav5ud4XjStJbJ6H+LaOT7f+GrbUXh4ZqOBNScXFF53hRwpjFkmp/fOh2vXTA/9MgTDpdKzdFqWsUNNx8F8b+U008zvAnZTOU667Y2ng==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1dbb94-c825-42df-da58-08d7ee9907ac
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2020 13:02:12.4500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT177
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

