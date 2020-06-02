Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.57])
 by mx.groups.io with SMTP id smtpd.web11.613.1591130704964817969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=Qf3UU7nY;
 spf=pass (domain: outlook.com, ip: 40.92.91.57, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ykhtz3IS8zt4hdU3lyXVtFHsqvcDSwFKtICrLvw1ncfxOn715JModSJeiy1ttAuE5I0n3qM6JRrnoFGsW8ySe7RppJmVlhLZPrIM1DDng2XL2J+v4ywc54esdCMnVk4W0xX+UQ7ai38QnQRtUIUp8wXqJbF1mQrfjioYqD9OqHdoaepES2c2+9peMdpXNVrKtKVgFjvBJbNmOC/jxMdNtzI6ZIB84EdDiLLz1SYTGNjBeiYIia4CTjSiXjnheM27GN0q+/7zIYtn9RqNVKXBQpGFUp64vHTz2A/CaGYaq43Ie2sOj5mfFi2CjOsNYpX/6V/oVQRuOvTPQdIXFU8pyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYN0LP6VgGKILF3DX9YCf1S6r4QR2g9kkD7p5owCjBU=;
 b=k3vYDBrgdaheyaiLRu0bHk3c1DlXIAZI5yUxUJoDS8O7Un6TmgX/Dt3F4yQQgBu1CHEC7UVmKNmTBz+pMKigGHDnRILLk0vsQV6rEF2SBWuneNPaKLT7jmzqQpYE35LOZg7A0BYipRk2Op3SEP+4UI5NrDkygQbGSRYA9knADHFBgHzRHpKi97jwqOM0XJwDoQbpoH4F39QyUoUHuzcH09lRCdGpALfYYLv5EnfMUGYoC/gXe4atqm1O1QAM6mOq6iw+6y+bISVgaQXsv+8jen4mMGezwNCJkHPlDC2de+xiHlMJviy0mVCUaRbgoMHWUIGyHxsK/qBMJjhn0TUS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYN0LP6VgGKILF3DX9YCf1S6r4QR2g9kkD7p5owCjBU=;
 b=Qf3UU7nYTgMvPnlL19t4iXMOZ42DNQbm1AqnWl6eMfA/yIGdnPZxBiYev5jSUIYerRBTW7yfM7fRrbfR26u6pLWW/u5yBhP5+05PhOqDqPWakWrDqVD1F9XgsJcvl7k6TkrfZOkCmoITaa/7lxDhGkoeA/8flKlCaTU1Y4be20hxrDSxoadVaIPg2toumJJ6dKD3NwgJC04NYZ3N9+21IkapEoyOhVWzxCxLPeG6UGGYIv9SoHOiYxj/dgGWgiS4IAmhgyMNkExGZPYsLbXxgkvdlNgun/yFyp5hF5d0aeepTNVmmpDuezQnNJRXEJnvWBJHyVMjbTvtLNrKgnJtAw==
Received: from VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::50) by
 VI1EUR05HT230.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::413)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 20:45:03 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::48) by VI1EUR05FT040.mail.protection.outlook.com
 (2a01:111:e400:fc12::442) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:45:03 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1C40C47A7453A3D217CF40FD6C4FEF11E228F08988286816228C8B7010CE9F2C;UpperCasedChecksum:2AB554384CFDDEB61CC75563BBED211F58C6ADCEF4D6A0771B737D819729391C;SizeAsReceived:7594;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:45:03 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] gtk-doc: remove trailing whitespace
Date: Tue,  2 Jun 2020 22:44:14 +0200
Message-ID: <AM7PR05MB68811EE240683B95297F99A3A88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602204418.26224-1-kweihmann@outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::32) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602204418.26224-5-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 20:45:02 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602204418.26224-5-kweihmann@outlook.com>
X-TMN: [BL+pMwIJCd+EfjL1VXrMT1/2FrH+/Xy1]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 63db709a-7930-4062-6f59-08d80735d2c7
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyKnU5wPuodHyLMPzuZ10HBOcki53Gt0pWHNxCrOcB2fP9ojjAb1NIpqAK061ivIJEDN/eNg/BoosLSZrk5+35eGdYQuJEnJpdRyAg+8GZVVNcUvc6IXBZoWwiqkmUNlju45Iu/RxFZuf84qStckziUD/WK9S2BaH56xbMu5wk6+Yc5Ef54RPrRvUDvF2SbTVSBSfnzZTiiP5mL4rpmyvuV7PZ0P7PGNuPp3iK5LOrMwRAO67YEG+kfMIPA42NrnxjMmZwm6j8gWjF+CL+O9qtk8eDzc9mGglG1+YdDFU9g/ySqA9ysf3P/eFvFCUNiSxYnSKeKq2zjXjTBikm6yOykJfk2w7RYvbx4yrldsAh04i2phl2LYmT/J4Tg8zcSrII80y+k3UAgRzQp91fAwxh8XAUcbMFMbcjQSgBoMe2dmwtVnOsiN62zn3JdiYlFJthJQnUNN55edcqzTxC8wQETgATk+Lhl59GhUCYnlx+Zy84z6ivlkk4T9lwVquIN7zCtpYPY8zVrSvp1CLTJlImryx0hUNnKmEsC+5NeCc0myWS/uGsx5lNHc4OrKc4YGEaipFTYL7CMv9FZ37e5q9WRaAI0EuswowCligfGf+pP+JIMDvjhIHN5lLrS5gXqwnR2Jjb2M1gpazzvzXQ6zFY99nKzNm4wH992/ZK1xxNaBZH1FFJRZbK0Owc94JAbEK5nrJCD+FjCnR5O2aA1vzmmmxUoubzOGP7FsCIyJN1XyIUocHSc4Jf9jgDbdHPUrg3o=
X-MS-TrafficTypeDiagnostic: VI1EUR05HT230:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KGx0kdRing62weiMPOFogPldeYKyAuFQOvVaK3mG0PnqSGAVRrVyosXz+dAjaVcNs/nbWQx42EfKec6pVfws890HeXf7HO9B+TJHpSU3kcpR3WjTrdKorE5pgsoEsefn9E9nHVPmrU2AmUUgy4oioJWahs7iTC4y1HV+qA/bm7a3n2EkXC/4F9oGrJD7F/JpEE4N2OmwZgwCw7B5qnmrLA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	Le9kcnuFJDmfQlaBvS02Obw7doofVitiiwn5ujbkMIwDsmGnyrpvRTf0AMl+vnriW0Mz0QZatFkNIxaFHVPJUe5UUXfiyWiGHxDiGQiiiHJj4xjXdnCsFdYgThS7yLyAzP4Ay5yLGqFvrQzp7VhcHw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63db709a-7930-4062-6f59-08d80735d2c7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:45:02.9308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT230
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

remove unnecessary trailing whitespace

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb b/meta/recipes-gnom=
e/gtk-doc/gtk-doc_1.32.bb
index b508e62741..1eaf370ab0 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
@@ -40,7 +40,7 @@ do_install_append () {
     # configure values for python3 and pkg-config encoded in scripts
     for fn in ${bindir}/gtkdoc-depscan \
         ${bindir}/gtkdoc-mkhtml2 \
-        ${datadir}/gtk-doc/python/gtkdoc/config.py; do=20
+        ${datadir}/gtk-doc/python/gtkdoc/config.py; do
         sed -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/pkg-config,${bindir}/pk=
g-config,' \
             -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
             -i ${D}$fn
--=20
2.20.1

