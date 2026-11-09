Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5983.1794231647701584293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=LfndlQ2P;
 spf=pass (domain: est.tech, ip: 52.101.72.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9rXNXG3xBXsjy6d/19TEOzNClP5npWZZPZxOWfua6HtzN3L4L/4Wd07xQcMAqRz1JhWHBTZIV2v9GlRtZE5hc/w4237tuse8kNmwbet40J3AbhWB4UM9Db+R/vhoajgcXJ2WZ61RVBudU/+4yoqx+gT1UqLMYsNgRHtZLNiCmMvaytOhTgqe49p6PGvgyLlM1WWev/R/AR+wut4R+byvfZtI9Xo7XJloKttLRfM/WmpKS1lvwDkrsh1dilBFR4p1BN2+ABEpkyam6e4h4o8WmUOz2C4rKfSkM3hfAItzSA9fHE8YsIJpmDVPqn4DQzaN/q6JcaUu5bP1Zvco3lwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B114F5gW3nU0le5ji7rWPPucAkvlMVQQFuMyRna3KFI=;
 b=cWfLVEZZ8ybR5OHh9n7+Pvvbfybn7Z/Nx5gWrmdYfgE0k25drcwywGOmURuPao2PW7tULNjzC/D5LRUGZJcvfp/7LP3zjE6d9LSNeTg4m/4FYlByf+RUPZxAhZgXTdG1y+zqpO+3zxarSBifru5f3UrOyaw3qntTVSN5F77vSFTyQ0XJDFiceP4ePATAAjzpx68/CQ9GseEjzVsU0+ZjHSyJClgboUuvlqmT6kAEJUTB54S1UZpG/J5DSd8vdmXa0bSyVIwm04hzvZdnlHwXJF3Qs+WV1q2wC2N5OTphjO+XTno+0FZVXYi6oa50J+yT3CLhXdUkqZt06gcweengKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B114F5gW3nU0le5ji7rWPPucAkvlMVQQFuMyRna3KFI=;
 b=LfndlQ2PDsxntLtIyTo0fRwUqiWyEUIkPGUPsnh9+4DcowqvrdHgZbEkIllvVe8yrX2zoT9C/PrRoD5SOcPWzQHMNYLnQ+lXANEnsHWPPPuql3rtDvhOdIVa18eHg8aqzsdP5fLjYKU8N+WctCiUesVcFEd4ZUUZ+HOMl5BK0wiEHvjUix3yKOWbZOPVyFjV33mRnqtwLBbvkk5E+3Zqhx2OzO7tjacW0FKnZa/uDJxg4Lmt5ho8lu22ogguF+zT+DWZoiLX7ugPF+ONyX9nlIfvHIMg9MsgyHRV1FNJUhplnbiWpFgKekRfsbyCK6d1Mg8D3uCbJ2sc1RWpVG6YNQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:48 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/21] gstreamer1.0-python: upgrade 1.28.8 -> 1.28.9
Date: Mon,  9 Nov 2026 14:40:20 +0100
Message-ID: <20261109134034.74458-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:10:110::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: 275a6ec3-62a9-42a6-2c7c-08df3e671017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|260925021911599003|260925021311599003|260925022911599003|11063799006|261021121427099003|56012099006|261021123027099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|12006099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 8ePhzBkUyox5nP87/pTpAMerpWcfwK1a8btgPH51bWWsS8nCzHJIIb/EcKg38oF5T5ny7gohHL1nEdUOhsBmNFdWYbiO7Uub5HPMZkiKbn7+2V+Ato74+8IVK1NBiQfcLpp9mDwyZbrK8wBSKBkfYaje+M2M8nvpigCoEwI3Jmxp0LD2uZz+DtwfdJ0F4/PNJB4NfbWC/PSHf8j1PTAr8s+bUH3pKeCnk+TKNER0qFzMH3x4cnz6EPmz9JmwZGYda8w38fhef2Dgh0/7FBivPnnyMIDVd1urtUtCq3k78qBgH09aoEVkW3HMgTVwJnvU4cVRoQYFMf1TdI40FH50+OYhkRvxwk1ktPNo6qYixqeXsu4Hr1T9xO2azJKAOMbnryj6xuywNw0O63VSfSPrnohYwQqlcdAM/TYTohzWz9ThiSoyhHaBD/pLnf9H7irXKBZcgmac3FHuMQvW/2BIqNd88IQOiFt8TW0rJY7WFuYfp83x0+8iUNeKedLMVxTEe5EWmul7djxHjF8ulB77uScwR0tBtNvNP2vhmCL1pv8Zm88uLnnoCLms6N1dRi77Bm15fRqcBnCDbfItGVA2fIdDrRGV2mp+vd9yimQGpeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eV4NN7VfdSqUU4NCf2qr+3uXjwHhG+vIWy9+V0nWimDtTWGfuxFak56A7ZAS?=
 =?us-ascii?Q?1Nk0Ys5FzYO+KIalJ3lscOMiKJtVoP8tHzpVkh372vOpu8aJzWFEeAsV3Jnl?=
 =?us-ascii?Q?77CzaYqYjTWdNUrGJdeJHdw7SpDjjTBXswSqrTzfb2OtF4tbq+1tCP4VdviD?=
 =?us-ascii?Q?VTig9A6x07grhi4oLdbRmcCFZXToxq9g7PARENF2ZrbdH+yWZotbmMTzdlgo?=
 =?us-ascii?Q?7FElL4qnKMuadCPaMEekiMi3yOabshktUmAUJ89vPxYgbUA2DAmy261Ir5Z/?=
 =?us-ascii?Q?VHBPoMDXTcIF4mn4vF6VZXYzhMPMUh+2ieIWlKlulfNdFQqcyYC7mkuCNS6h?=
 =?us-ascii?Q?Qc+7VhfQ8QgBnxRfCISNSc5LN5WNmtlIyNJxfjThLO8neAsnksZR4f589fWK?=
 =?us-ascii?Q?tdNcI+EAd7196yOVY4yMlTbpq4+W3lKCTwSXHv/o3JcdeC5VPPz4oV37kpJ2?=
 =?us-ascii?Q?NOrvAPjOiMa7Mho1BDGsuqXQnq6n7WiThZ6ae+fMEgVMWAoXXN4lIRrZLgIg?=
 =?us-ascii?Q?kUSQOzrMHXXbsf/Rkg5pcUUgtpe2FaX6A0iEF/S9DIHhQ9xAlk2+CUWrv0Eq?=
 =?us-ascii?Q?9WfrhkjsFZfKfklVvdQBsQNtTGKrlsIXi1cM4esd80g+pSqs+ZEyuVJ01DcE?=
 =?us-ascii?Q?I0r9U90+uQJW4cMHNJ0OYBM6GV0M8QNIZddoO3iwpjKxMHl9oUjPA91Bag/r?=
 =?us-ascii?Q?9O6lOxX4wPMKm9K4ny6YcM3RhGg9HX0njgxEWYeMcY7qSPR8naCKJg3Nf4X+?=
 =?us-ascii?Q?IqTtH91SNMVOazypf7KoKRJr83HAF/R0N3OAhorZueZUZdNixc97RGGq7i9D?=
 =?us-ascii?Q?RiZUqO7WOMkrJmcl9koZ1TaxfG76xbKhsA1AjSAAgKkd1VRPHpB/N7r3+K45?=
 =?us-ascii?Q?0VPq6GhUVG1MQyHqeKL8hHwZOx4CLlwcguWd53Kk9ZT92laFLKz9TSdiFVLg?=
 =?us-ascii?Q?6ZBB4DmU1cFIyRVcNN5+vTwJarOacyAAg/3yMDwBw2scihc207sDHGXN/eVT?=
 =?us-ascii?Q?QIO/g0FYm/ciXQpBTI749xjFQz4Nn2reZRqGWfqxTMCleylLltxCdK0JkoDu?=
 =?us-ascii?Q?tmejPVO78ZhaSa9E6BXgUM9c4PznAqTH+Ba/efbrOAaOHkKREBbqVXxYlsdN?=
 =?us-ascii?Q?wb/KrynZZ3GcPthH00igLQdAQyojUcAgK8n2xuMqwtpGlW1sNABL0abaXpFt?=
 =?us-ascii?Q?v/7f6B1CWiXVXvhPjhFGMW7E9NZOECt9k7eey7o38q5aM2bYkdcjP+M6Wulx?=
 =?us-ascii?Q?vjVYiZkOf7kVL8VyNZW92bkGdVW2U97BLPxTWmDBsMlT5Nh6/93iQ/z4h2Aa?=
 =?us-ascii?Q?Zs21ibzU6iHOOHtr7/eoAV1HBt+UPZ3etvhoNyOduABySKihFuYiuduI22TJ?=
 =?us-ascii?Q?Rz7NnZwPQ3w4+Gf1qxms9ZwybR3TTtSQLNAgJoDbaEBz8kFyz4FFqO6aBs1/?=
 =?us-ascii?Q?bon7TB/JonywDfzjUhM/Xjr3o32KCLYdWe1OaF6nwLvkVgJoShaGRRXP3pRo?=
 =?us-ascii?Q?jVWxWBcEkGLEID5bV8lpEQmwjlPbD3JwyoL7BnsTZI0ikFx2nkbFn4QU5mFj?=
 =?us-ascii?Q?ODmlEUyZipEwXTkvVXs+iaBXjSiHiilJWWOoJP21wJxiKQlEvGzT/j3rkABO?=
 =?us-ascii?Q?pmqGRtsgK7GqiMPn72El4NE7evp1rsVSdottZu4yGhj0DIVj4aI4TlIJFbIu?=
 =?us-ascii?Q?iQd0xMngujurBqdBHIQqwR+pMYom/y5ua5hFpoe7YsYZe6i4pxI5Eklma4mk?=
 =?us-ascii?Q?XsR3MqrQUQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 275a6ec3-62a9-42a6-2c7c-08df3e671017
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:48.3222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+U/SLBl+Cv/mY515X8um70M4gQuIw8YtHefTa1hklYepZCk5C+qG9pQQox+ifr102g1vxruAJ4elksrx+Jy5uXIJ4P1uqeMH+gFVQ2mz/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249812
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...reamer1.0-python_1.28.8.bb =3D> gstreamer1.0-python_1.28.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.8.bb =
=3D> gstreamer1.0-python_1.28.9.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.8.b=
b b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.9.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.9.bb
index c7efa31ecfc..08ba2e30b56 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.9.bb
@@ -8,7 +8,7 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc34deae4e395ca07e725ab0076a5f74=
0"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "6e0d8dd920234b9feeb86003d8f43c1996491f9d8190882329=
bf56f60a70206e"
+SRC_URI[sha256sum] =3D "e6ad2658fad5b96d99af72ceec7e48995ff792fbda438d3448=
6d189ce047718a"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstr=
eamer1.0-plugins-bad"
 RDEPENDS:${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobj=
ect"
