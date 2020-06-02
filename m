Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.18])
 by mx.groups.io with SMTP id smtpd.web10.682.1591130707262640357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=m9m7VFiJ;
 spf=pass (domain: outlook.com, ip: 40.92.91.18, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ph/hZuAT8SPoO/C2WIjs61aKewJotvV2u0exGe8wfNQTgrlm8cyEx8yHxXNDYa5qMkTv0gUiaEMJiutZnjDUPZfoduXjRSO8cjqCO+YLHRRGPuUOKuW+udnEGqVPBoA+3x0n1ELmE+QVYivB/T9/c8+60b06K8G9DIrVEskbaZ2NFlW/AnarXxBmtZ2UF8ElrqxdEfWNiukXjPkZ6L9uFflGIXnP7GJRqg4NjhT+CpzmnkUgUH6XIDkOVDgL9Rw+lpGIGwQGkBhmeHkV3ZrAGe785ToSBQTmwFkrwVRkcX1+I/XLSfrzsBBqm9Vcx6IddzIw+sYkFYgkafteTycRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jq9geEO1dXI1fbrbtuGszCAEduHf/vee++K8SpWf19Q=;
 b=Pjlb7zxqVjVHV8BAJR+besLIL9ehKdymQoLjFD1+bC2QaZoJ1LH1ZJ5uQ6OoOmM85/j+5Zmuq2Vha6tExLF+6s0If0AtMPxZ+oe9U57Zh7B+Y3SHNnRHv6ASh6bD/SS7WLRisuPRTnbuHoJ0BLMfE3yyTde2X4WqSPQhRXguLSyReGTVyHyM3xwOde/1mt/dVY+jG00XtRXqLirpIKVu3ionjgWESqZ3S3lnFqXlcBixTX13kyxxbU4ok0EeY1TTGJHZpUXC9XUapoEZCx4X1zpC1/rOcjfGn1r8lQYzA76R2y4XCEOGwEnzeb6ce0OjI8KFn+DmmlQlHWw4BQ2nIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jq9geEO1dXI1fbrbtuGszCAEduHf/vee++K8SpWf19Q=;
 b=m9m7VFiJqV30fHRI684VSSzO5TTTc0le/SOiAcDNVjhSp8X/w6PLLsjKFfQ20uqEJ4j0Kvs4GC007eyCjnbDBhhyVu7x8Puj8/YGK2Gtm77E5VMVlVz/2gH/+KHY9DKQIfGaIrNHraNfrFv6GYZ9/ghRRF4zCzI1Ew4rm8FeZir/cNwCCMYahIhC5FSYOhTlV3IQ7coaT5iI3btXgsIh+pYZjYJngWeIJr8+8coRj91/s/tdtLXF+Fb7gtKN8VSo0gNTVZhIHYl6CvI5MawlrLkXQJiVb1efbRRasBN+60SZLJbe+oJBqOaQKvYg5/L54QIezlYjJNoWCL+KrKAQjg==
Received: from VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::45) by
 VI1EUR05HT108.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::321)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 20:45:05 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::48) by VI1EUR05FT040.mail.protection.outlook.com
 (2a01:111:e400:fc12::442) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:45:05 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:8089C75148732193F1C56F7372ABA36CD7954B507F605BCBA82D1D5515A92E1A;UpperCasedChecksum:6D97393C3968C6D92F520E6EBD3F524664F554FD79DD1BF1B519ACCD7EB41402;SizeAsReceived:7566;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:45:05 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] cogl: point to correct HOMEPAGE
Date: Tue,  2 Jun 2020 22:44:16 +0200
Message-ID: <AM7PR05MB688115D5646E2046D1909C50A88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602204418.26224-1-kweihmann@outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::32) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602204418.26224-7-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 20:45:04 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602204418.26224-7-kweihmann@outlook.com>
X-TMN: [G48eAtTMToAhSIEXg7qJMXfRWVwPRSBI]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: dce361fe-fc46-4f09-7c0e-08d80735d45a
X-MS-Exchange-SLBlob-MailProps: 
	lHNTL7xaWTiHmuVo1ULMIOcDZ3brmOaH2WiouRhUUvnBX3JW/PM8VxMa2qQIUM3re6b4FpP0RGlMVjJoDa3M37WBL1rJI3vERh9qYUgyi+BoUealpQ4YOAUmyz4GoSvqvzCd//UBlOMb+qlTVYx7Vsll7uNplTWM+mPg+BR1XqNyJSx8tYkcsSFSnMoFsW8BhrKsMLqMI9OLIse35kAvksYhWBBVzJINfp/VS6ZVkR1yrB4C1Qa17Ovzit3N99xU6GNguk3XPWkMQ9ia6cDTA6IWTtV/ohoBQKufbqlKSOcW9Ac3d9CfN36o382nsF2oIejQQWG1aTl9D4ecsO/cbQA7VkekdDSf2dZ3QkfB44rvGoBNax6dQldr0ogRSyjfh0Se/5+Hqql3qzxV9J94m/cjnoBJPvV6QnMRnjN0h3e7NV58c8octFbDhJiCTiu3+rcsjzn9yLfdhgfAQtD7RD2580jqMBMFAXpXUHaDcTCqzk5TZwPPIWhk7Wr+QVwn3wxwHKbPoA18sBhZCngINMIG6zkbCCk/whL1I882rhBAl8eWbj/2ZWbsuS/3xb3gAAi7WLL8jB1DixdC0CaRtuPmHlFjSrm3kgz7iiwcUAaM3nRNZvc0N3ztgu8JSpVrJ9LmNliZgvXjixtv6JpYji/Z0oJHItqxJawaAXn3HBuzPKFX2AavtOcf+RyIW+9HceeOG1xlfsrqSPLJbt3idLsfHDRXRZ+leWgUdggZ0XSnua0eeX6oB21hBVutZX4634bjQSiy/zqr1kFO/SgLvxpqsif6O+kiOph7yt8cLIjkJY57AC7/G1h31BSVYsOyLGpVVxsqh1XQ+ZyBf9uko2WMcA95eHFVqRXE03kUHq/0k+u2H++84O7zXHPEZmLKJf6fCuuFNh6c6E9Racv5PHFoKEnPzjeqaqkELHyiY4cX+u26LpXqFDW80whAWi85YDSBnx/CZfw=
X-MS-TrafficTypeDiagnostic: VI1EUR05HT108:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sw+7oC4ws35bbs+Spgh11bN2m/iN9Z5JNB/XwSEs0nvjpum/ByE3VIfp/adB0SxXQD+ciaGH17y1Snu6kJhXLkOOycgqYcup0arDT7kqkM5mTrCuoKwcmSRwxPnd2HBSgWalQnf8tvcrDIPxFQdLUDE/Di2g0bxLcgJc73HFTrt3k1PQweKSC2V4kdAYg9a2Av4I6M27vGCdISjhG9pNO/Za7eKioKeF0vdGzzgILESTBfBDQHljeQNNX7TxAxd2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	l5Qurbq/KmahSKuLEfDm9mDi1f2iL9+0uj/o8wKemcgCEPnjgrcSPnYI5b9FvFktznGzuiMBsSgPJS5zKxpjmLkyf0EtSD8OdXum6L5dYnTr4UvGZNWVahl0UzLMrkgwmr2kdkT6kIj8ic029FlKMQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce361fe-fc46-4f09-7c0e-08d80735d45a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:45:05.3282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT108
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

As the previousy set wasn't reachable anymore

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphic=
s/cogl/cogl-1.0.inc
index d8d06651da..1c5d0b79cb 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Cogl is a small open source library for us=
ing 3D graphics \
 hardware for rendering. The API departs from the flat state machine style =
of \
 OpenGL and is designed to make it easy to write orthogonal components that=
 \
 can render without stepping on each others toes."
-HOMEPAGE =3D "http://wiki.clutter-project.org/wiki/Cogl"
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/cogl"
 LICENSE =3D "MIT"
=20
 inherit clutter features_check upstream-version-is-even gobject-introspect=
ion
--=20
2.20.1

