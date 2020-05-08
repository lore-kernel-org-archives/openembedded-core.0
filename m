Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.81])
 by mx.groups.io with SMTP id smtpd.web12.8626.1588937861248366298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 04:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=hC0BcPh6;
 spf=pass (domain: outlook.com, ip: 40.92.66.81, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQKV56FNrvoh3Hj4V2gw3jIbm5jUeTxXWx5uF/0BBomw4ng7Cj9TbnqBFUeL7fKWb6pOQMshS+yQxAh+cZ5LaDVkle9UZ1Twf8FWrwZz/MUtGEdvZ1SV4OpgaDC/CVDMpYCq6GgY+hoabkB9hp4XztAEUoZAsbHXhpwUqqkiOVD1cKblF2mApa5AgmC02Z7P+qe5zdVo0opzjQp19sbom88VMgu9grgWKLEKOEVmMdhmozkDRgaYb9PBDFZRmHRhRjKy3+TVepRpB9iaoSC8tNymfxcNu2P/Xeml5KQy4Er8fi1dUVxcYr2gn633GaFyqLSu93U56lGMYfmCOPN2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJE/cdX2YukHi2QnfeqMf8ao72vSdIDgFWHqFq9xwVE=;
 b=ThOthnWX5135sC3hKphS9yu4mWfG9XlUiu+x32MmN8THMEc8rmUPIcw+d5K2ITRmS9iABof6fOBDup6EWF0NGIzMkElmVUYCstNcHTDbEFy+/4jfRpTT5Qsw8FYbiyBuGYgMzJx/uO3sYHIeBTcaFjJkjVDsgdpe7b6K0/s2cYKW3hjvCb2EGdCOBn/pyhrOxg402yTZ5w+iTZ/FKM1AXTn4xw2xj1HFd0senKQTZtpXKwno2yRtASYjlzCDHO17vLVjk/eh7XDrRWATh2boXO/+lj6DQz9Lv5jXm1vxW/uC4slvDTcKPRCZNVpNqUGeMIBMZqw2v+7W2rJsvfi+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJE/cdX2YukHi2QnfeqMf8ao72vSdIDgFWHqFq9xwVE=;
 b=hC0BcPh6aWGR12T7f7fC5xAfT4E6hzwenm/5Kg9U7gR5q3/xO/xW4Y+VdoeHMxQT79fAgYekjVAaSq9oH0GabcUkI0v7+jv1IzWznFhZIZ28Z8AvJpYs8cVTBiW+BVojhE1hU1NzwZ1WBOxn4BXdUtcW5tgqyYJe2P8T+lu6NkNnW1F7viYGl2h2I/WO4/oj6U8k/ht/Pq5jeFxHoYpkDcNfBgOi5OYrT+qIHO1LeMQeBU0kRwHRmJCwN/JDGFeK3fVnBn3wNFZaGAXy3EycOYDpe+Ja9vEYMbbYpsJSC0PCRu/EnJ1V9qvxdOEigzbKxDeDXAJ1oYE5xpJCAVYkOw==
Received: from DB5EUR01FT025.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::53) by
 DB5EUR01HT151.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::464)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Fri, 8 May
 2020 11:37:38 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1a::4a) by DB5EUR01FT025.mail.protection.outlook.com
 (2a01:111:e400:7e1a::240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Fri, 8 May 2020 11:37:38 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DCD6C080CCB517EA8C368483403E015BDD96F72D7E239A64B962E31969E72917;UpperCasedChecksum:B4C94A84E7C30D155F566E1F507BB4491C9FCE3C23BB30EFCBB72B3AE6C8900E;SizeAsReceived:7458;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%6]) with mapi id 15.20.2979.028; Fri, 8 May 2020
 11:37:38 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] pypi.bbclass: mind package suffix on version check
Date: Fri,  8 May 2020 13:37:20 +0200
Message-ID: <AM7PR05MB6881F29B1FAD006F027D07FEA8A20@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6PR08CA0031.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::19) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200508113720.3201-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.95.187) by AM6PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:20b:c0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 11:37:37 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200508113720.3201-1-kweihmann@outlook.com>
X-TMN: [fBQLRkyvW5rGOWpSLEarsyYMH4Pspcgy]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 5410ea0d-d058-46dd-1315-08d7f34435a7
X-MS-Exchange-SLBlob-MailProps: 
	jGdi06XMWgDXEaDPvQrh0wXmjh3CCeKfrZd/yCyjEFapT9YHkvPavZwBvMHRmOUdakTSP2Y9qjnBEPBwIFqxDm07gqgFh1T+tYIapRFtNe6O1oT1rqmDC5IpqnsF/JDW4gPB7dPDebKR1irLaqUNmKjDwLJRiOK+0ydwudugO8XNM6w0aqEHDdxcB+LIFPuoH79M3wXDA/eI6zgHDfYWt2lrbUSBphVSFsMRQrHla52PJrzlxgBpkJzOHn5vvkfVVWUoAWjDJLFdzw1h0Vl13gzx4rE2sU9LQcM5FgAnxBxHgHiiQ9e/lg48sSFivisbuGWqKfYI+JC+wQBQqoSWrT+F9KPXadhXFQlomvp5UjgLH4Jk27Z6FpWTJY7fG4L8zi51GFVAKO2v3oRlvLlyymwNK/awwrq7IgOoiKpAiO17upkrsSFVMroTlGITurNq3O3qphdP7fk89MPDwxnj6DWaXDDkzf1VvxNgVxyImBFm9sQN6ns2x+Q1rt8skJJe9UF78zuaK2C7m2GSpsM6ox2/4kQtpFbbgk8BELCbw7c7R4EzJKAHYAr0UCT2XNdLLuEmmp7K9WAOyUh3QB4oAu3Ch8CClcsaI+GlJ7XvkrHxc/yery13XTRF5300lNpNPQv1HcjMn3jpc9M85YrS1WnkXIpao4VzQHiusYTVjtiRinbQJDG7ao9/I0Ktg5U0sXnPK1+3zDDy8Pl3/A5xWYrFudRkkXaM8TtVSAiN2aNYU9E13WWK7XTdmupUWnjtXRNojUTwYnXfeLr2UmvXvxP5KfB9+gtDDI1E22Z8DxnEYDsUtD0ayS3ES/6q3xf8QEwVRZQrv0+fRrdfP09jjGofdJyyKiNqIhnpmTy4cOW6wKlpBChFXcz+/ZDSCaLJlP9xKFVgLP/9UUx1Tig/ep+3uoXzUOJcxSKKFAeTbc8djC+IbeRrqKt0sWs2hsXs+mqJTyLD8h82hexqWCOg+uqUPC6Jow13
X-MS-TrafficTypeDiagnostic: DB5EUR01HT151:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G6G26xpofcsBoKcqaqd0TUiycvVN0YjqyI6COOjqozbJYEc/ttRIUsWzT2ic7MkxFdUmkOyKlMvq/AwKYGMmoGhvKdeax661q4rkEiDPywF5WNFUeYvtPUAq/ZxnxVsnO2tJhu/VguGuiak31yzD2FICMuA1fgQ1luL8yNKJTfNUtRJuHT5cVo8OnmcJLlJAZLjD97FZTsg/fRA6Z872R1dRlvFDhGs0Iyb8Pb+aq17I8w6cyLkiZgGq6B1mGVSa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	/Ys6G4yArpDI1G5TV96vd0SeRbffxBcsSXTxspdBgynfHazEGgrhL/sC13fAxcusteL+13HsP6OvoARRjNHTo7o++m9a0vi+HOSI2/yhqyUpXYxZYA6QmbszZD94aTlmThAKnK3GSxrHnRB1PbRb2g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5410ea0d-d058-46dd-1315-08d7f34435a7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 11:37:38.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT151
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Some pypi packages do have suffixes like dev, or a0 or b1.
When doing a version check on these, the version will get falsely
trimmed down to a version without the suffix.

E.g. 3.8.0a1 will become 3.8.0 which then also means that
a version upgrade from 3.8.0a1 to 3.8.0a2 will not be detected.

Fix that by inserting an optional suffix group with alphanumeric charset.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index e5d7ab3ce1..7d0f367a02 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -23,4 +23,4 @@ SRC_URI +=3D "${PYPI_SRC_URI}"
 S =3D "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
=20
 UPSTREAM_CHECK_URI ?=3D "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
-UPSTREAM_CHECK_REGEX ?=3D "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_REGEX ?=3D "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+[a-z0-9=
]*)"
--=20
2.20.1

