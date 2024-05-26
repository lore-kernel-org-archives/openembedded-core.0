Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CEAC25B78
	for <webhook@archiver.kernel.org>; Sun, 26 May 2024 04:44:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.762.1716698678721231739
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 21:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=587657352c=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44Q4iDN6015534
	for <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 04:44:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5gt4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 04:44:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5qgTvPAVjgt7r6cGeLub4iqoAy4iZLbTyLPppXZljONClb4fPhxrfP942jtlix8GlHQSHqcPA8es3faBOX3PAzKs1uvMnI/QBt2QrQimhH82R7fjfvZ++xRV08P3STVANbKvJBWmYQwqPiqhCIr2Le3H3sbFDISxp2tlEPikZTQSpz328kelfBufHeVO3uXV9yM1a7aiRRRufJ41MoA0/VKE+6n2vSpAuOmXOxsddggmmTyGlgXqp/ApOafbGePSE2z+mOuOJshPh5ktoxOiCjqgvyHp2futFcX/bM6tKGrv05OZRX32olHxwgPCLAJ4A8WCd81GS+32jCYr1OHkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z79ev4jnMZ6TBJH+mcWWkGpi9RxE/q2AuiBflth6wc8=;
 b=FI3KjNMrSAWeSLHvEg7oDwcqVh5SGwQbFjT7iWpgTd5w1x7DbOxuLrIqK/hQSBxQr6onfenBtMIbykQv2q0JTGIPqYDpQxpXS0F4CaAEQBPGDo3zyKAKgUj37P/VMe4hB6PhN9RpYQ8r67qIPJeWYNHbyyLYYSkJ3NQtdy4PJ6Rvw0Cji2iGWhg/NH4YIyL1ZZvhk9FTy5c1Zk55tBQWPuXkt2XmG7Fl0rwJ2hJliFCLsbdqHMLuQEzATi2SChb5gFYZ+zlaaNTaPAuifYBlmrJjIr6/M1X+C2QYnnWPVLlh8b8oEAuVsvdcncLaVL2MUNIERckcJrvXspKBE/iZmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Sun, 26 May
 2024 04:44:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7611.025; Sun, 26 May 2024
 04:44:36 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libnl: change HOMEPAGE
Date: Sun, 26 May 2024 12:44:22 +0800
Message-Id: <20240526044422.2560900-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 1114091f-42a0-4470-7b8f-08dc7d3e8b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|52116005|1800799015|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+4LCTte6qRWYhUahNEqSay133j16yvzwL8w2QDueEKUr8xo1I9u3MGW7bUhn?=
 =?us-ascii?Q?JrNrcqpJE5Zly4y8d5gdKi/GBlfOZ/8f5+b8rQZtoq3jGp9aA/HWcqiU2kJP?=
 =?us-ascii?Q?KnKBi52P1S5hfLtBKBVsDrjvdHJYuQnh0bwsNJtTvmAens1QnkEU8E+MYqif?=
 =?us-ascii?Q?bEigKGGkLs71fbQlBWGXD6NiBGifAb6U5MP7K5J13EQQaXhNcQe6Ty9lPEMr?=
 =?us-ascii?Q?1oaawJ7g6jd496mzczrzlQbfLuS5Kuom+WFYGS4Hd5vL/V7/3gfeo/Jo/eHB?=
 =?us-ascii?Q?f153lk81r+S9wG/fNBLmzLYlofEO3lZofQdNGj2nQFuEodAl9184ampLEZWO?=
 =?us-ascii?Q?GaYa4aSANhV84sGo4oaO+dzlG6U1cY9YJheFpNwnPmZjjbc01atSw+ZfLmli?=
 =?us-ascii?Q?h8loTlkCD3rpBDBYjQTOB74BtAAHw+Tzu/l6vQ38uWeUCC02iatzy651oghU?=
 =?us-ascii?Q?S97VlDtZ4+KPEdmwr8F6XHhMwP/F7AqpqqcgY+YyH5pteNc/ABGW5aQmZ3q/?=
 =?us-ascii?Q?2AsA4WkJFRKH/S7SNIVUa/ynfjEjg5Gz95BQ6RPlH+xpLXFAZtC4Z8HwVIbd?=
 =?us-ascii?Q?sP+thw8c01a1zK6f/FrVa1CL90iLy3Eb88gaOFa8twXApK17Zd7Pd5mWMZxX?=
 =?us-ascii?Q?fCBiGZ5g3VjjW7TEWkC8/5wh5/YOYdwads2jtKr0JB+/U3CIoj6epn85p9bM?=
 =?us-ascii?Q?vWyZ0lJjL4nByQEQ52AHobVtuVz2vXH73CUs1g3nSmc0efjcK9Tg2rvwZG6J?=
 =?us-ascii?Q?K06KSiaq77b1LtlslwzPUfCiesKKiYQlnAf+uurUhIb3WBgIhytEYU0J1SAo?=
 =?us-ascii?Q?GyKoqqUJFv4exi+KiCpk3WY90jAJF1NPH25Nf3RjEovnRslUPi0pnyApiZRR?=
 =?us-ascii?Q?EvOs1K+qxlvZUobAl//miHP1ZEIt1+Hn0FPevOdhMwWTtCdinzluWOYD/bkq?=
 =?us-ascii?Q?/X3vIqOFxcmViHghWWcRk7ebO6Tw7eQa2JWBl8A41LpklxOzGEOUA+PQIGBu?=
 =?us-ascii?Q?ZAN24YXW/GUZo+wDR6SsewzP/OumD5LvSE5F2a/3mj12Ry66nWx09Ogv5g2u?=
 =?us-ascii?Q?72mBbBvqm0dHXfXlkjV0sssPe9JpbbhSNYr4EgfLXCFywmtidx+j/1HyrRWU?=
 =?us-ascii?Q?Zw6fM0RMVvo/0nlYg+/EIBTWL8JP8pFlDDG9Y+rJczK268Au0y/jGFzX2ArA?=
 =?us-ascii?Q?YlClszHEeMx4kKuUaXYwJ2XB/rB9hZTWzfvMvvYMBPX5LsSvh21ww95xHcG5?=
 =?us-ascii?Q?nkcUin+yC/dUNtUdUCpQ6acqs3pyd3EX6ZsKOapSDQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZxBUFOPbAL3/7JmealEX/Php5Ca0kqjSRO/RPnwp+EHQP+l1F01PO9CpCc5+?=
 =?us-ascii?Q?cB2o574FlHubHrQjW2XJUX3ERddqdSwknzRJwTAH9JE+BnxulVveFdtuqJs7?=
 =?us-ascii?Q?uFLVNrdR4Eb67LyeAE2jvv5qLAuyv5dU2XvZpR1DEJBK+vepQz3GkRILsl3P?=
 =?us-ascii?Q?qFHBjju4cHn9u2ACNHtI/VN1geTgo1Cn3SlQbTEgdySHamUCciwmbQWIUh3V?=
 =?us-ascii?Q?zICaz1OVahB3sgeZ1AjihrSsXYzXoqqwYk4cyTjMO7h6RfgQZavko636wLst?=
 =?us-ascii?Q?je1lgFXNgcO+dmhyF7/wSTTa6UfeOT39X6Effqxa1ViwqQyepj3/ZEpAM8En?=
 =?us-ascii?Q?b05/vT5leXvVYxF7566+BSWYT2HjSHtNngZYaB5V3ByF1gwRWwDPTuLXAVbP?=
 =?us-ascii?Q?7Q8YK5nn20k3wXJkFWYYXFomJ+p/akjEDXs1lf45Ms1QFWuvQrMorfQCcy9O?=
 =?us-ascii?Q?Cy7wYzECVVUxGI7mLPGYokFopBOgw3qOsug0c9vKNMjZ6nkTIMNRfoIlw2XR?=
 =?us-ascii?Q?noF5L60HhY+RDN77geDZILoxP//vqaXFvOt3pv34y9q+nX9PAC+8kh2O6fTn?=
 =?us-ascii?Q?qmS3F+/Jt6PzdTsUQZqdqigiCycNPdsurbNvoMQL//ydgAFzKPWWXzQuHZN6?=
 =?us-ascii?Q?2ZFTokxpYaVBldeilu0fPx8XHDXoM+5+CarW+VFbw/9xOX2T2pd5hizA2dN1?=
 =?us-ascii?Q?4YIHNzLUK9vdjdiqNwVbVqdM7qR/G3iIi2oOHl+ecbFZZI5cJXNY7zHhZidF?=
 =?us-ascii?Q?PTlJGo6ypDZ/axBQFBa5fGUMHcSAUwp0THrF19XKWkWoJib9zJ9ssxJSu/Xt?=
 =?us-ascii?Q?E2X4DhBAY6gezwZ+BobU/5ejpKLXqbZiVtv948/pXul813sAyJNCs0A3KCSd?=
 =?us-ascii?Q?LJ2XIZF1GO6UBhWrzcEJyx2TXUjl1Jezx76+R9fTKOZvFNrGdnepqps0w9hl?=
 =?us-ascii?Q?RQSENNGXoPyufrdzwT4Lv/YR5pI1XISK5YGJyBkdxlomuc0ura7foFNAnQBG?=
 =?us-ascii?Q?BfAyJPEOdaMyZTnAuqwyU02Q1lfiG2QY3LC4WYc2ilAx61xeevwREreJ63ai?=
 =?us-ascii?Q?5nNXYkzlS56RpY/9FhptL58KMd/NmLKqjAQKGe1AYn+iY61t4l1d/17JBm7g?=
 =?us-ascii?Q?2xZiCK13FJMCD5AsMcDRSLYumykBLX3x+9fYXG7Nvup1G4cPW8FEExNu+CbD?=
 =?us-ascii?Q?fhj/6EETOl/MVaWzPySdIoUV4eqaPX1f/eutlOH4mH52mQeoBVA+elaWs23K?=
 =?us-ascii?Q?TqVxDV5uc0PxTdSghMRpeX1qyDx81vPydxlie9sPzKmBDAveNFiEudPl6hK1?=
 =?us-ascii?Q?OtfiDuC/ZyjH+YEgiIZxpL9xgkumnZLceJM63Nxshdtpi2q4N6qXmhECJhnU?=
 =?us-ascii?Q?jTp+K1Xgy2xEFb8ddrMSGVqmi9zS6tiCOibC+yxrjaCZdhYeI1gCpVR2WSCV?=
 =?us-ascii?Q?JsnMu4AJmFOca2GfqYFrNZY+zgt9fZQO+1UXr2KVOsrNPr9eM6M7RLaz2wiT?=
 =?us-ascii?Q?LGQ44e0A/C9HumR0blbIPrZ/8Ur3Do1ILg58TLQ/lVZDTLk8v7KM7NL9OIbG?=
 =?us-ascii?Q?PtVYGMIMvvuftln/UZWbimRvn7LF4YlJjwsSTbwZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1114091f-42a0-4470-7b8f-08dc7d3e8b75
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2024 04:44:36.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjw9GrHsXoYQU41z4qklXfoLzhSm79wQ/t4STDPvZX6JKcV1oPhIf+YEfJT5JXTj8+sP8ZHfzJ0XqGSPxJMsOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
X-Proofpoint-ORIG-GUID: b0WfctxfV3M53n4XUDzuYdXKgj8SmSaW
X-Proofpoint-GUID: b0WfctxfV3M53n4XUDzuYdXKgj8SmSaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_02,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=932 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405260037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 04:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199878

From: Chen Qi <Qi.Chen@windriver.com>

http://www.infradead.org/~tgr/libnl/ stops at 2014, the
current official home page should be the github one.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/libnl/libnl_3.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libnl/libnl_3.9.0.bb b/meta/recipes-support/libnl/libnl_3.9.0.bb
index db9d93e8cb..b2825374cf 100644
--- a/meta/recipes-support/libnl/libnl_3.9.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.9.0.bb
@@ -4,7 +4,7 @@ APIs to netlink protocol based Linux kernel interfaces. libnl is the core \
 library implementing the fundamentals required to use the netlink protocol \
 such as socket handling, message construction and parsing, and sending \
 and receiving of data."
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
+HOMEPAGE = "https://github.com/thom311/libnl"
 SECTION = "libs/network"
 
 PE = "1"
-- 
2.34.1


