Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.54])
 by mx.groups.io with SMTP id smtpd.web12.8239.1588334217189199088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 04:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=gvy7Mlv6;
 spf=pass (domain: outlook.com, ip: 40.92.75.54, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mc0nUjiRb1f9/BiqtrJFYOJjM9KRgtfJXsMfEnHWEAQZ7gSY1Q2a74IDixebUe9t0SC+cUJIYExdjs8bx6vp4c/UP+cd73uzrx4fCs+NPSvRbM+xGtW3m/6Z631jkrjNDhp014GlRd7RTt8B2pvzMR/T/DyPIpJSgUXdL0KFFdyGAXuw48o0KqSqd4UvxX+Wje9bjsNYYnQ5+iuJ0bv+KNrMnP9mvJcTgTM+agdHM2PE8lq0b+vmJq23107UGoFIclyB8zwKVh178/0BZSZx+5SdaXZayR3oAEINJH/TKMpR1BG2yn4cU/nhTQfE+s1zu61huRK0kAgep6eU6PjtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8w9PAJrWaXoqpEQH73PHwdJV+X9/QZalUFxAAyd1AU=;
 b=RcQi4L18MM7i0C/ENFKuyHdT8XFhm/ZIh5drVJsUwoUit8Ns4GBRcxg1bCLo6dx6Fno4L79zV8KOH5VSR5zyIIzYBGpvaT0qLbtc10Qtk5f8WkNZrhchHlHY+ZOWoAwiT1n0cbIELyOtWPXn67Ab4DBnjkAVP5JgMBekTASl874Hlr/GR3YxkLB51tQajlO7JnOLwuP8dUduZIrB2SjBp3Gmz6lkERWR1D8ojsTyIhIhz0r6cn/kFdaUpoDXxJLWJyTmWpBoZJ2sITCwS7UrP5JVx+U3nYaVf7zzw24K4N8F+ALHSJbqzQ3e72n19YGIh3NEJwVxEhzqMsQ/kYpfpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8w9PAJrWaXoqpEQH73PHwdJV+X9/QZalUFxAAyd1AU=;
 b=gvy7Mlv6wUvJjfEMvU+sDvG8o86AMg4INiGCFY6TDQwxJkjVBsyrwBskJOD6kdqgBonKsMYc9Xfb5XBZhZoXboSuRpbmDp6LfrUlwldcczzciVnVefhOu54XVhPspCtXRKLW0Q51G5gAghqe8pzsiN/+Yb9dBITBUxPP2328Bt07gfpIhctdwI6NAUo0HkVeyn0Fp5zdPZmC4iHwAlgftIcH+hJ63i00F0W2DO+Yuy4Hty6YHsCNJlzbgF6dFXt92o+ISxqsbZ/uI/VG7Gwig7jn/0rp2/KElyeUO6MiC5UXErTCdJ780MXGkp+k2AAC6+AdeEewX+o36d36WWEsZA==
Received: from VI1EUR04FT017.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::44) by
 VI1EUR04HT229.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::187)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 11:56:55 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::44) by VI1EUR04FT017.mail.protection.outlook.com
 (2a01:111:e400:7e0e::228) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Fri, 1 May 2020 11:56:55 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:4A7E2A346CE2FA86E3C0E7A0A0FA04DB33719FFCADFB64A752E4864054BCE33F;UpperCasedChecksum:17B3B9E7C81C0154BC7208F2BDD68412DF8C656505C3954F99AEE969E2EAA358;SizeAsReceived:7474;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%7]) with mapi id 15.20.2958.027; Fri, 1 May 2020
 11:56:55 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 1/2] php: fix zip package config
Date: Fri,  1 May 2020 13:56:40 +0200
Message-ID: <AM7PR05MB68811C880CDB744B1B3C6835A8AB0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6PR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::28) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200501115641.17176-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.94.187) by AM6PR01CA0051.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 11:56:54 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200501115641.17176-1-kweihmann@outlook.com>
X-TMN: [dpgPYmZRyi/i36PKSkut4mE1JEdh8dqq]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 05f8a798-c7ac-4727-bfb9-08d7edc6be49
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyLyEFKlMg+eBXg770nUz7yDAClcvNIiDZmMXi5Z+ez6QZcp6EFOQncJmjwjy3gs3B8TdKUNv7NJSYdRk7YBLV+4O3m7i0j57uNGnn2aMEZlLpgM/YuGLxxgFCjTEzRfzV3u+G0VjiKMkX+yiRSD+yzYVu98t1woM2hdxcdQd8i1SnrbR3mA9bgYwGZcmnW5NezmMbkJrxykaBESW0GpFkpD8EFOsF1PXwf9pKkkiV8vKOso7x+82ia2sfBZOV7BoyRtjROKSE8/ox1KxZF//lsxwZUvosO8iKaUE2DuvN8LcQXi+45QL8anzP5Y1GLoFzWZYCtIW3MVHQNofeRXhfxyeY+08letzdoiu70gplm3GDAo4c6ktRWcXTJx8AkU1wTUnOtrwt2Kud8FBcIRWcpaoOr3tm2EGZQ8DfPYvb/sC2s5Thkht0slM3X8Z21OAhyxUUHxVXguJD2ClTGE8U6BARSMmvnnCoh9qHxSq6oNKcciW9gjlL7PA8kkVysPKb3cd3kQAv2ZWPur+whrlQmfpnVSlEQXnw9vhPlDNchPp6Zb1My+YSGrbJHqyWmy3Sl5QuUu7PsGGAtiamFhwY66wrN7VMJr966Dalnk5tJ722lxNwRw8Qvxs3kQjnooPajGCIZRM3Rr4pHDfkjzvJSRxQNgXZgpcAnJ70gRoeq2+xhvebg+pLKNA/C5dEh4GwPDH9Z4CnMh5DT2ecfxP2ZIfgq1078JP3axedGt7O8mKv1nXRJj6kW0J3nr04Hk7JE=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT229:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZTe6gZ/+Wp+3VbUeCAS3giMoxTgIIa/88gcAK6Gf77UqI54fyl7r2F1C3RDEDzW+LoR1nf6A0UWu1ENB+L6JOfGX8/Z1fN3KivjfqG9d+2HEkgBcfKnM4J26VpuKvd+MqCoCPWAEfXWAfE+xPxjCuWI+iAnzb1Mvqetrwv7Fb2B4dJYrVuBqCqLaCQ4hkyHNjy2Rw8N/+NRisV1ge2mnQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	Rw0+8EqVWvnBMa5pt/wCao+7m8suAXAF7uyK26Dn21b00ONfjzcxskEV98U8rJRjTGnl8WUJAKjMHKCEaxI6SvamJzST3UfJf9E8AWQWfpaqhbt+y9OaVvsStMWgAnwnTJiv4mk4JWDhIGrC2kDozw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f8a798-c7ac-4727-bfb9-08d7edc6be49
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 11:56:55.2436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT229
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

--enable-zip and --with-libzip were removed in PHP 7.x.
These are replaced by --enable-zip --with-libzip.

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

