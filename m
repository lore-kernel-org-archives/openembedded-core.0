Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.74])
 by mx.groups.io with SMTP id smtpd.web11.4752.1589057003044608565
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 13:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=Pk/fkwel;
 spf=pass (domain: outlook.com, ip: 40.92.91.74, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOHQqW7zEn8R20SRpG3kB8ES6SE96oJ7F7bd/BvBw97LUdiMmiE82t9jEPPCBFbcb9A+yc/WInMsD7oaf2muGxQItAOgOOBUhkFMcUoG5UgIa4EOX9sknnTfILEdrL5Uh/agLiYzG1prsWOUkK3aCP5sxFHiG8+iByHOftIwXK/7xrN0K633X/VfCiJRqqpZxOv874nAnQGuKQOq52Il1QnNKCxbAdRywRXOQvH0KYnktJmRMJWV1qGrOnOrfAzjlAverFubfyq2Nb0nEXQRoZ8gLqCfP2OyLIDy0KIH9E/v7TGNZvyUHURqq05e02WeApbuyRxTx4ecDyiH8WpYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmQx61a3zxXD8GzzgBaYguIccDlji2JqkVnqi/hbVzo=;
 b=RCv5QTHGjtsZqJSBga7EusKb4Yh9dTRPKiZteC6L3pYkg9zZJJYEINsHTaizry/3enImrlre/O1Z/kfgaYdZlKqcdbnx//8pHL5k0D6ZZ3NbzAYRuB0fNq/+gA4fRW82+nIWv+NWVCe9sJhXWSt7b3SqjrXig2ufLT0i++JwUjkAzN1HtRG8tjWkPlOrLPliJr2dpXj8nqV2ESW78LUxIeL/NLfHUu/xMHbf01PKYjqvpns78zHOQsp18kswwwMn1XBjw/TeCqlJ6jw1U4JjIv+/JGDjV2qlI49o5r3q6SsWIici/JmXbZMI+X+3OpE6bvp1ZK5nMrKjJHAto5WxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmQx61a3zxXD8GzzgBaYguIccDlji2JqkVnqi/hbVzo=;
 b=Pk/fkweluPg7ietuKm4+C4KecLEv/0yOf5rhvDAlll2aazq9Dg7zosgq/EJI0GMk6iSz406433J7ulzXhU3PBwLj8vcuMCGretHK4QG+/A5Jc1KIElbswO2u0H2e5iJfz5+kDPqiFbABJK2Jwz9rJc8h8b+OLQhlk4ZPv6yURl8aQffPTlQZcEpOpUPuJjf4NeOB22/LwmGhnYmuFcEw4WrGsV1VnYHF0LyeAXxx8mhMz2DBX8ugosbZ9SAMwxvSsS3hXKmLnmQxeKj6x1jXZT1aWCXnlO0rVFls/DqncFvrlFSt1QLQ1dQLEzr+bnCcDZQIJ5UEnZMQGa9tHJ2SpA==
Received: from VI1EUR05FT055.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::50) by
 VI1EUR05HT179.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::365)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Sat, 9 May
 2020 20:43:20 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::51) by VI1EUR05FT055.mail.protection.outlook.com
 (2a01:111:e400:fc12::142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sat, 9 May 2020 20:43:20 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:0A2BFB790E862C00978B785A4E761256AB0EC56AD02E215C0A268C3EEAD46504;UpperCasedChecksum:D9E801F96C1849A781A5E9DF4F1CA2E92C4A34CA0F81069F486D7E3F049E5AB4;SizeAsReceived:7455;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%6]) with mapi id 15.20.2979.033; Sat, 9 May 2020
 20:43:20 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] file: add PACKAGECONFIG for auto options
Date: Sat,  9 May 2020 22:43:10 +0200
Message-ID: <AM7PR05MB6881668050DCD8DBA7AE873DA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6PR10CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::23) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200509204310.19369-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.10.191) by AM6PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Sat, 9 May 2020 20:43:20 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200509204310.19369-1-kweihmann@outlook.com>
X-TMN: [e+4i+JTB5i025R9A4VgJbdVCd+LVMP+z]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 79dd1133-3c85-4188-97f3-08d7f4599c1c
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj2Q73utyfsDK2vwNnj/5KzdRxme7nH3D9B2r9tesUrYi4TCv0N1HYRaaSe7rscswJJLQmLbEJpvzcTK0+BGB7iz59l7hgLgfsaohiIJgcghS9MDEhFINMCeZFWuwKlYnZrsxKACABP4jzp5B65UN+JdiThzcA0uSS04PYv8QPQ/Be7i2ByYEwTrabLnGmr3XQNOiUEbUHbmowkMkTwkoPbHZkFSomV6LRNRcVa9bRv7EUgdrU3oRmprILxo4UzZruKb6uN+1ctL4f+2AIOAXgxbVzufn5OJWvG3YLq0tdpZerYSUjc+CO6BNe4QnwfMIVx3VDm0S6mEBRkybBnXkqfrlLeNm0GmJWB55Lfb5jzy6DMhOe0r+ZHhYJkbGkqF+YnWWNIG4Mq780GgD/LTLYCbF6EAdcPXC8QjvkfG9pPtULbI91/H7pF8tajTxo/Z64OgavzsQw4PrkpK3Amu4EM5kfarOWAij6nv/sSvyOdeLc1XQvPlSOHtOJm1tuGcmvajhtSc6eYZD+tzc0oldIsprfKjJhrPwyaHI6xCD4+hQure7Offv7LogYzAATlYNAWrnN1Xo+8LBAvh562QkSexN9ynCLOUa/uXqqLcU+ljh7PFxSUr3qngfcM7mJ9EMK3f6im9qkIXbLFPtxzUJN2Way+WkH6qk4WOC3CRBOSvkdvs3CGVA0iJ7jgzbOZO5Z9DAdHjXlgSmA==
X-MS-TrafficTypeDiagnostic: VI1EUR05HT179:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cJMhKk22N2jdDVuws9CMQ5eW6vDVZssbfBCJLFqeMdHwcEFo21n+T9Upgri8gyhwsEnI5cMUoYmMWzJeDbCklm0P5p/Yt0QwTzmKDJqSXlU38+cmTcsob0WJxV2Odjn8fZ4F5Ye/lmQ0afEIjkfQ3JgDXLLMVVeQNbnPLfEMWYb1OP+Ip9nlBQBUNtXIQ+Fj/axm1so45Yv2uAIdvVUxdA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	nr859rIOBAkPD3K40HV190UAyG1vOqszPL4vsjEoBA/qV1/f9XPU2Wu2ACJ8B9/7NF8/2wKxPdv6336pOPf/9yGs80XFyFDBI7SdJou5wf5H/qJbrgnWVfKtvXFsImdnBD4bnH3OKNY9/FumBClMfQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dd1133-3c85-4188-97f3-08d7f4599c1c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 20:43:20.6791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT179
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

A few options of file configure are set to auto, which can lead to
unpredictable effect when something in the sysroot does provide
things that satisfy the autotools checks.
In the worst case this will lead to package-qa failure as libraries are
not set in RDEPENDS but configured for the tool.

To mitigate changes of accidental configure set explicit options via
newly introduced PACKAGECONFIG variables for bzip, lzma and zlib
support, where the default is just zlib, as it was before

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/file/file_5.38.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtool=
s/file/file_5.38.bb
index b8f09107e8..fef21aa147 100644
--- a/meta/recipes-devtools/file/file_5.38.bb
+++ b/meta/recipes-devtools/file/file_5.38.bb
@@ -8,7 +8,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D2;md5=3D0251eaec1188b20d9=
a72c502ecfdda1b"
=20
-DEPENDS =3D "zlib file-replacement-native"
+DEPENDS =3D "file-replacement-native"
 DEPENDS_class-native =3D "zlib-native"
=20
 SRC_URI =3D "git://github.com/file/file.git"
@@ -18,6 +18,11 @@ S =3D "${WORKDIR}/git"
=20
 inherit autotools update-alternatives
=20
+PACKAGECONFIG ??=3D "zlib"
+PACKAGECONFIG[bz2] =3D ",--disable-bzlib,bzip2"
+PACKAGECONFIG[lzma] =3D ",--disable-xzlib,xz"
+PACKAGECONFIG[zlib] =3D ",--disable-zlib,zlib"
+
 EXTRA_OECONF +=3D "--disable-libseccomp"
=20
 ALTERNATIVE_${PN} =3D "file"
--=20
2.20.1

