Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.78])
 by mx.groups.io with SMTP id smtpd.web12.665.1591130706437240529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=GMSNa6Z6;
 spf=pass (domain: outlook.com, ip: 40.92.89.78, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grYgdTxthpvxE+m7ABTlq/qR/FhF6CGAqSH0gk+XI8R2mW1Go3T4hNZtRFB6QWbAmiD5MzrAN1JmWETwzcTIek39z3zvcL/TkFk+OYzalmxpriz8KPWwMeLGHWE08PvVkKSPSHEl6oYet84bYgjtgY++sHmD7Jj4Ktqmr/A+3sGx6GOL3IeJ7N15C6XjDIXDHSwXlk91Q+r9LNcVNnNmEjaVM0syry55dDqh7g25LtYE2dd259W3sXLYOMOCCGSZbECW1jfv02YtX9nodA2nVMvxfQZG6c4pNavNz2rOM3OcOBmNfucdzx1NLABjgfTfJphs6jLWNdVcs/LDVRBxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJpq8elSRE/Fz2MTIwtJSQeFQj0XX8jhN4QKufybPGE=;
 b=dBJaHaVpnWqjXZdbbv7VzjU38IF9Jj71SE+D73OoaBR4sVTJewuzxiXIAgeONY2EyYxDG7Hj9i5qI0a2B+rJDhuQo8P41nZLu6Y8SQk3xYlPIbyf4zyfAQmoU4b+NwUZDL0yaVb+3cJ9UzCBxsnhTQb8tfJVnPsRu4G4iNJi1cvZZoJFVXrYwk/Bql3Hxf7/HVFEoY9r8DLA533OAIc7VBEnyIpy0BdacUqP4qAKihHnNFnRgBGzwt4xLQkMmrv1MaqWoOedurOKMTc1aR+4wL1+Cb8LeWGQmJE45ew86QP35ArGUzg93ulnAkiddke5OZSz1Uq+5uDU/XZGsxbkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJpq8elSRE/Fz2MTIwtJSQeFQj0XX8jhN4QKufybPGE=;
 b=GMSNa6Z6yJBtMUwMmd7ZHrAHj+0oMKlo9WrUiCmFvcTjAUNL9svji7rBrjgF/SlO3MOPvoxckbBZQMfQWcieICdFRZo1I7/DlJP1rtpX4R6HcqPhpnql/CMz2Qb6jUoklSeO++uGN3azcwTbF/vkJkAXhnq9aQDjGo7zKPRM2m7nyPbeWc8n7HKr7T/IVq82h5PA4Z8MdP82gdNy1udnVbq/x6OGntBdaK9usk6Q18z1Y4u5i0oA/DUttC4WZgQiwTCdHXAxSY5rEkSK289AoCAl9EStadw7wcU4BmlaFACtWC7YwAnID98HJXitK3/tJM/Q+RYkWpGszf/4pQTvmw==
Received: from VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::46) by
 VI1EUR05HT073.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::127)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 20:45:04 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::48) by VI1EUR05FT040.mail.protection.outlook.com
 (2a01:111:e400:fc12::442) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:45:04 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A2958511C6E7C9AA38D9FC11923B99012245E44F803C0EF825DCADBDB25631F2;UpperCasedChecksum:FD5228770DCD412F6D07680A301B078502C74AFD86DA98D9540111D68155F182;SizeAsReceived:7557;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:45:04 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] libxt: fix whitespaces
Date: Tue,  2 Jun 2020 22:44:15 +0200
Message-ID: <AM7PR05MB68818975505020D033EF84B8A88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602204418.26224-1-kweihmann@outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::32) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602204418.26224-6-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 20:45:04 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602204418.26224-6-kweihmann@outlook.com>
X-TMN: [ieZLOV9+i9QqWfyBFxyrFQR1B+DJtP9k]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 55e6fca8-e0bd-4553-fe34-08d80735d413
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtxZDRLgFxEZNXonRi+PvJzlhalIAJPBEt1aJSIREoqeakxP9A4fwOoO4vzQArf9tuUFFb6V42ZQOjoyOHzYLGaZIIAZ4exhfb7ahpg2ntNUxzAdtA13E3n9iWtZyejUbSLJel2d3N9aB61KSu9JZnfVlwmNZVsgj6tsUiDhPFGJ/kW7qQtjfn/fOTRDpQy03OGQMraMVf4UlnvMCNe9KAKSFL9nC0connU3SnWsHmabG8/D9EyskRS3TFGfkFxrzOGnNOB7feYppSJbSZfAf2bHXwjtzPsqVVBg137Y9bxjjfVqRSigtqqd/vyPllqYT9nB22eOYIl0ei+QzrZjTl1l9ve4IZvqXAfs9AVjOEcaHkqWHrwtPZ4ZTOasgW4vgjHSZ9/KAJr7Lk3zcYq0f/ca5rdYG1aXFakgwxgNemgB08otJGsUZsWr33sJKWTG18KyDEH/e/GVVenU2em2dYaNFiAWk9Efpj0CZXZlP3EICJ5x2TCdkpob/8U7E23LIpJ2I4fwDAnvSTq70UxJBuTPmnz5EpM/HkLKpBQtzWjsrUURoqNBdyeXvdxHY/eUsTT+9X5QkcKQvEBJZ8040PS6udNRIiHtYJDMFQZ1dlLLTCJ6iYTSodCY5UcxKzD5CRlPPLTAfvwuuUe6gEbuc3aAH236vIoUHK3mjMgqVBLauo72qlMIZ7nU7nqjhU5xoDP0kP/ovrgvRy8vaJOOE2V/f4sjKU3yqFGkD8g2a+HvuQ==
X-MS-TrafficTypeDiagnostic: VI1EUR05HT073:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OnrL2eumPh6+nt20NVw2uTIbJuR/VotTi2/jOpaiVEhrLtZssfOMlraoqqP4Y3bXWhRTCgc+/FCT9AOd3X9k0KOkzTgjINTMpJ9dfpuYiHbJADr1RBNzUk0c24EFdE8QTkw7QxUU7MS7+sIAemHNJrn+rRM7My8rs2mHAOBa9tghPLVNWOWIyN3VXukQMe/c7k7VfC4o3tVzFLOkq25yog==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	5lj2+vho8MFlpLnUc24shCH+TVr6tci305Sj5LOw/BXHZvhAXJSqTkZSPwRDi7sTwZoGU7C3Cd4j2eOp3yizzJNeTE0rVhsiwetb9E2yanX8ePqipRgHzQj8qmjg0IePIcVwfMAEyuXSSuJ4R25DyA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e6fca8-e0bd-4553-fe34-08d80735d413
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:45:04.8155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT073
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

remove unnecessary whitespace and line breaks

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb b/meta/recipes-g=
raphics/xorg-lib/libxt_1.2.0.bb
index 42df435052..54384521c8 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
@@ -22,8 +22,8 @@ PE =3D "1"
=20
 XORG_PN =3D "libXt"
=20
-SRC_URI +=3D  "file://libxt_fix_for_x32.patch \
-            "
+SRC_URI +=3D "file://libxt_fix_for_x32.patch"
+
 SRC_URI[md5sum] =3D "a9019421d3ee8b4937b6afd9025f018a"
 SRC_URI[sha256sum] =3D "b31df531dabed9f4611fc8980bc51d7782967e2aff44c41052=
51a1acb5a77831"
=20
--=20
2.20.1

