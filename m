Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.84])
 by mx.groups.io with SMTP id smtpd.web09.8386.1611639384984775895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 21:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dtW1GlDu;
 spf=pass (domain: windriver.com, ip: 40.107.70.84, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOSQkdd6LjZeb4Vn6XAVzslHEHQiq7VeNz+ag+PV96Da/7xfKOeSFWat+uEIizgE0uZTFbQpUFpFmDco6mRtv8Al+JaSEw7Q1NlWPvFMmg1bAe2fZ/RPpY7FfuwD3OL/DSZ+oxiiM+JiX1+UomRQltCBCVgiWvsxwCgAjESCzdL4v+2d4raetA/Ar3E2IvxqdV3U9+nGeZKor5qHWf6HY1Rqf0lD/NMUwEYvrfMhq9pCP0K5X4eCJp7Z1vcRaIDqNLfbBt9wsj90pDr32qP7vVf6TOj1Uz7okEWUgVqBRIahKRI9t4pQ6Yw2Rj+mCQ4HOsei/XTa0s3RgixduVfchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SFBiT42c8qYRdDpanBBple3IQXZIZVbsH/GwYQ4XnQ=;
 b=mMr2V0w63lukmeG0C/shKS7MrTdyWZQchAu5aewHjpt/neGo8MhfIJRXG/xr6g4HtDQ0Sgjw/uP2/rqAn8texPbces35I5hFLE1dzcLRjRq6DK0mq75WVN8AW3u/0PKw1Doy7BNk6q6ndN3YaTrko4ya1Nx5M9SMTqDm9qL+g9wY0ujb/wmG0Ccca0uKxm4ygh8AnNfNKtJEkuJHrF7G1igV6rFRuLqXd88mTh6vEqN6NIzGLgRnDj37JI1jYhdHWHz4ab5IWnc9JFh6FeVPUdMLnLQ+dh69j+BkUuR9/3nDU/qVeybfsnR6ZVuxrulhgfXvDzx2ygDwXYvncjqHeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SFBiT42c8qYRdDpanBBple3IQXZIZVbsH/GwYQ4XnQ=;
 b=dtW1GlDuLo2/qnkWPD789E/QZZ8v6xRk6Pk9BFrYIsNfxDtWNeXMrZOpFp1zaEaUEK31Vtc5gqfae+lMCy9+o8JVBC5Vug8Xy35M55gXMOM560rTodmfRI3lQbKHxprzQQOKQ1iAht5shmuGdCyBfWWe5zyUh1bwrneaBPf5RL0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 26 Jan
 2021 05:36:23 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::10d7:6fc7:935:f29]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::10d7:6fc7:935:f29%7]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 05:36:22 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] core-image-sato-sdk-ptest: use 3G of RAM
Date: Tue, 26 Jan 2021 13:36:05 +0800
Message-Id: <20210126053605.2003-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0169.apcprd02.prod.outlook.com
 (2603:1096:201:1f::29) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR02CA0169.apcprd02.prod.outlook.com (2603:1096:201:1f::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 05:36:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f61585e-eef7-4a78-f30f-08d8c1bc508d
X-MS-TrafficTypeDiagnostic: SA2PR11MB4876:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB487699E25014263748AED80782BC9@SA2PR11MB4876.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eGQDM//d/j/M0tosY9+O1bA9sl2LEfg4HykYtB7bwbZMq3165qnOXSQkETRfbeDHZ4pwip41n4mn9hdsRniuEjR2AphPDTo7s5Bim2jgZKP8n95VSCqspB2DsDpOErYADaG3CYq/fcuZ68A4Wrsx3B065WeJdq86ykgALmNLwtz2gk7pzfzocXI84Qok0095kzjlt/AbYT6CYxv1eImkw7grddX4EEzLTyR9taSGoNXTZz//ixOZKdu0Let5zLoGD1M2qh3QSvZXez5vudUv/yc1gF2pSgooS66qjkmL52vbIuSLr9vHBSqaJykTWR63bsmLcMwCd67/xwoz0GaEBqHs01nkqNfibKLu6sOcZDDi9yvuW2gVn7MqZbULB+l7Hz205WOsj6ll5cp/bVWDCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(16526019)(36756003)(1076003)(83380400001)(4744005)(2616005)(956004)(8676002)(26005)(6506007)(44832011)(6916009)(186003)(8936002)(66476007)(66946007)(5660300002)(478600001)(6512007)(86362001)(6486002)(52116002)(2906002)(66556008)(316002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?mv2poSsL1s83DMcRA2D2if8+19Fi3Ff6i9f9FP7vV4gGVHKPQnHS53S/kwDs?=
 =?us-ascii?Q?KYBdoVh0fVujYw5U0C1MSgjMxR3zOGjs+XP2REVIi36aO6qS9hOfxiCKdXFD?=
 =?us-ascii?Q?PxJj3EUdKpbzmkiOY9Igg0Q8u52wO+sSrD/XAQImTrjEd4KZscwpU7LA4Z/B?=
 =?us-ascii?Q?ABSVV/8ZQDc9mhGOjJieWbLoVlPtC0fR4eUufcYVOF1vhmE26PtRmkivu332?=
 =?us-ascii?Q?fycebk+yIml5YcUR6+MiaZ01zIWDcv7n0O9bUY6Kkj3rNs5kPmWKxmo1ZRIR?=
 =?us-ascii?Q?ZWZD1GUb1ILcW0Vye5FbYuCh1nqkwI3c9kXv5fu8q6ekGlNSpWJSSI7/OpuS?=
 =?us-ascii?Q?/ztZFxOadAaQpzX42A+J/0htIFIOWRsQesWrX7Ozzp6cGAt0jwsP0Y4+EFDQ?=
 =?us-ascii?Q?yuy2AP6nnI8Ewg59TTmvj+Chi2E2rb5XpuIsfQhJ/w7S5x09XGL9Qy97AyDM?=
 =?us-ascii?Q?yxNNGMZDJxcg8TdRf8M/dR+xe9W8EyxUCWbL5KxEGOVxQpr47Cm7ClHS28/i?=
 =?us-ascii?Q?jXMT+64WOioVzn6+4dA9loomtLLI5ba5X12Cu73zTWHP1B6HUW+QK30MoCdt?=
 =?us-ascii?Q?Rakwc4geLOwfAFG1veC4SqrywRFEXnu+zNJew/tKyav1GALijKil7Fn1Q0UB?=
 =?us-ascii?Q?iB5xMUHb5VjuMvYR9HsoxxKTe/rxcvTHorGJKIRTv+3dfakRAh/PW7sw5jAG?=
 =?us-ascii?Q?YfDzvtE0f+lR6H7LiOZwPbfX5+LNWQn1Ib4SWuHlCBaMnhEOplFxeORhnZAo?=
 =?us-ascii?Q?qdJZkMaZlAEn9254pfVZMmFpCoIQwaVIQUbhMBn7hdm6XWFeFq9nYrPToy7z?=
 =?us-ascii?Q?f1TWFMD6i4PbN+wJQZ0Dcro8HsMjavzkzXPFUu+7N6bZh1LaNGNti2xbGU2N?=
 =?us-ascii?Q?sltwYxsXP4dNUDWkd6wqJpaCzuNq7D++HhXLklYI1oamZdaWs59B/XPiAXMf?=
 =?us-ascii?Q?/316SKNx3PzBSLuymZPyDyPVuEpgLYzBel8XJj/hCW36se2EJO4Ev6vpBMOk?=
 =?us-ascii?Q?eRuObdiepagIsqiJbZGkWid7QIucnY8RvyiTlS6Z4EkMRWLl989X1vrIufaV?=
 =?us-ascii?Q?U82YMOb8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f61585e-eef7-4a78-f30f-08d8c1bc508d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 05:36:22.7464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5szSHLFFE693c+b6xZxAc89YjZ7Y2cjUn5fQ1y/ZDxgSgEY/C0T95L+VNEdMv17ucbupz1n1JB3FWnzz0BK8k90i1H0QwATIoGa43ganTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
Content-Type: text/plain

[YOCTO #14164]

Some ptest cases, for example, libinput ptest intermittent failure on
arm64, this should caused by OOM Killer.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index bf749acd79..b3ce859d76 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -17,7 +17,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
 
 # ptests need more memory than standard to avoid the OOM killer
 # also lttng-tools needs /tmp that has at least 1G
-QB_MEM = "-m 2048"
+QB_MEM = "-m 3072"
 
 # Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
 PTEST_EXPECT_FAILURE = "1"
-- 
2.17.1

