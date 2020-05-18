Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.85])
 by mx.groups.io with SMTP id smtpd.web12.2679.1589830132122476586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 12:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=CDj4XwqZ;
 spf=pass (domain: outlook.com, ip: 40.92.90.85, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VF08eVfk73FBH870DX5BLJuCrwwjpTjNczuvNeZh4auGPr4cGYjcyfbeufLa9mHTGpVL5ikiNm7dkiRTJlvY37/STYfaenMBhYIco4qBtUwJVmbt+NuBHAGQ2gXUExyXBVLYWUa9l9Cvs35ZOPWimIl6gpWOTJKo78Mx7oegIOYABc6RtwFMZcw8lxD7YXgFTw2expWZSxk7VOejCEP9tQ6fZX3zMok/M/u8VZ1O42TPxsM2XKIH8YpVxAMBORY7uj5nBXrZZTnR9r5Gjvb1C/gL2gcCb2QcFbsIppGgEaS1sBEsy6s+l8cBoIv2uFX8H4QYEHXrOSHfa8qGVALiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTwdOITOtzxYk1aNPxClPKynHxm9bkpu8nm++IQGpPk=;
 b=bZoSCDjFEgYca7OFLvD0DDi3eXeCI0yN2uW0J+FZD6Uf1HIZmzbJpgw9bsd8lgU06J6IRZrHRwrVgFIp+TTpW+raqFduIL7YONNeFBJ2PgSV9zU2BtspBjc/ec2LWdDB+8kWRzudnaDSBrfXP0skDLHlFO7NJmp0ACBD/F6S8o6cU5OQbhSM5qugPVpfD6qVJwN8QJojMWlhgNIMw5oDwHpHx1t+M+4M5kiMLPN/ph6H/hoG3X9FMewbVnz7GVEdVe1s58f45DO80OmhC2tVAH1uNtK6Jndf8o0asIMiicNL3XsQXPKPgH+EOfFc99SiFvIWkGf/Vr0et6mAWxhxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTwdOITOtzxYk1aNPxClPKynHxm9bkpu8nm++IQGpPk=;
 b=CDj4XwqZjHzwwr4VZ8s3SrqEXPFRhERy53woo2P0VtnQ9MydSIvGw2l3FkpClbiuWYLHqPOC6sERA2r7pw/SnIwbb8FHcn1jgyygIu6xWvIJmsPSJRGpAY1xK4wSrZTtPEnB7wP1OKyimZTljFnxMLKfIC+cXJu3L0I4U/ohsaEt07IvSRSJEGqCo+reevEXKNXlTLuCWHRFQRxfFmUzUXozpckr1aBJjTlXXe2+C5zDom3jX1spe4uqAvdJQ+aWXFm1fyT3giTPQxgBCKhnysge3aoGSfonXNok+v4//JOyYWnk07LRwpGPRJHHMClDsNK/+fnMJG4Eo78UyVbTkg==
Received: from VI1EUR05FT057.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::41) by
 VI1EUR05HT179.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::365)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Mon, 18 May
 2020 19:28:50 +0000
Received: from PR3PR05MB6890.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::43) by VI1EUR05FT057.mail.protection.outlook.com
 (2a01:111:e400:fc12::213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19 via Frontend
 Transport; Mon, 18 May 2020 19:28:50 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1489041F5E45EEA973D1475B2FB4D6B871D6A7740F925C8D65121F3DE5EF5C30;UpperCasedChecksum:49D4F60E989847B05F0DFF40FBDE25A8C0AD56126D81A55132D7EF3D927A635D;SizeAsReceived:7460;Count:48
Received: from PR3PR05MB6890.eurprd05.prod.outlook.com
 ([fe80::24da:f065:2c41:d7f2]) by PR3PR05MB6890.eurprd05.prod.outlook.com
 ([fe80::24da:f065:2c41:d7f2%5]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 19:28:50 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] lib/oe/recipeutils.py: passthrough of FETCHCMD
Date: Mon, 18 May 2020 21:28:07 +0200
Message-ID: <PR3PR05MB6890F47DA3F618627A79C442A8B80@PR3PR05MB6890.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P193CA0091.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::32) To PR3PR05MB6890.eurprd05.prod.outlook.com
 (2603:10a6:102:63::10)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200518192807.27003-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.40.124) by AM6P193CA0091.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Mon, 18 May 2020 19:28:48 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200518192807.27003-1-kweihmann@outlook.com>
X-TMN: [97xY5vF+I4YP8aVzCki5+8hI4QlH0aSf]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2e214244-dc56-4ed8-5677-08d7fb61b098
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyJX6xl2Py1Cdg/P6GvWiA3EMXqvZNXz9Cf2sPF0HNBMcRUXXty1g5X5mVkLQw/xVIVB+93lxuNQRwaI/wLKYZgaBqQSYMqOGQb6kasJbzE6lC74L4o8mr4n0GeGHBaxtZhhxlKgNRjbWkzo/t7ZxXHCSiiLVSf/By3SD4vlr0FL+02fJA3VBVRLLFZGVPPMvHrc5HJIqR7kHkPewy/BQQhg1PuwUel9OlilSfdHpO7GUDfFPV0cFUR//uUlLmYyy6gO+zezRgonYb5gnjW29nBl102DzEDlb67/nAqZ9oX3cfdaaAxfZPYsPHZDSFihUHCZlxy380H9PZTeYZQTDudNIF+biYSn+m53zzd8sNTBDFM7m05GVSkjSO/M0zfYgY6QQH3DgBmY9SgFoilUp7DvshMEWm2w75/4nOBvMOnzIaX+8B/qTek2UC2D2BnwjjgpJYv75yy2HYWSQTYlPGQ3RIqVJhrM5sw6yl6J/ez50pB9zZIpHLtfQGA5czZd6vzk9qVxgAOBxd74d9JcSntZD2ukPmuACfskeOTIisd7Q2v/DRSIcWm8mvkJvqIc3b1HllJmZwtjFvP/JPG3Z9X7oMIlpLK5LIygC7YbDlK13i+Tq1pSqKDYR2JTRe/ASQ1x72K65p9l9vFpKmO5p4KAI8ReRHzeFNZM4xi4dMLTp6xcjsYgRC2/0GdkCbu1XohXBbmiJZIHuOP8UHKKJ3sTwtfkFhUwG3poKP+V5hB1BxsBxC77G9vpYBWYz2GxA8c=
X-MS-TrafficTypeDiagnostic: VI1EUR05HT179:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ze+C5ZKKQNFa028OOgduArSjMq0pQvDmSqnR2Ozz3KKewNMgKVwVilLpA2i6MUIwp+jUfN6Y/C+XtKqlOPWuWqfaDBk5WaPU3KfJ/rVpM4IMCfbYCEp9+UVRZeUcaiJM1XBMWlEpeHEbqyh6lpgShguh4z8GOSAdnobSRxrboldFQb5+9zpv0y6GWTMx5PlFXfMVGo7cmryKW+lkcv6tDA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR05MB6890.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	3rcwq2SBr2mNQB0q9wr77M3Cnzf5zZVolNdGBHbBjdiwSLEjPCtRpAXHR3F/vlav1QWyapSbnxc81/msSQ+gc2sJABCCPb/AGxee9eWZuObY2X/jGbdSx1Tf4L1mHuCNuLahaJIAc5J0znwBI9lXKg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e214244-dc56-4ed8-5677-08d7fb61b098
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 19:28:50.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT179
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

let FETCHCMD_* settings be passed to upstream check functions from
get_recipe_upgrade_status. It enables using different values for
the fetching tools, as otherwise always the defaults are used.
E.g. use different timeout or retry values for wget.
This is especially useful for remote server that do request-limiting (429)
or that are simply unavailable (500, 504) and can speedup upgrade-check
for a larger set of recipe significantly

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/lib/oe/recipeutils.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 732420e46f..29473a9882 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1076,6 +1076,18 @@ def get_recipe_upgrade_status(recipes=3DNone):
                  'RECIPE_UPSTREAM_VERSION',
                  'RECIPE_UPSTREAM_DATE',
                  'CHECK_DATE',
+                 'FETCHCMD_bzr',
+                 'FETCHCMD_ccrc',
+                 'FETCHCMD_cvs',
+                 'FETCHCMD_git',
+                 'FETCHCMD_hg',
+                 'FETCHCMD_npm',
+                 'FETCHCMD_osc',
+                 'FETCHCMD_p4',
+                 'FETCHCMD_repo',
+                 'FETCHCMD_s3',
+                 'FETCHCMD_svn',
+                 'FETCHCMD_wget',
             )
=20
     with bb.tinfoil.Tinfoil() as tinfoil:
--=20
2.20.1

