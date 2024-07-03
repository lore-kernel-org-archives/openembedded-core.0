Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F08DC41513
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 00:47:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.40586.1719967631324278483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 17:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7914ac32be=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462NUlGA028885
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jul 2024 17:47:11 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4033em2jyh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 17:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajoubtRhg1C/zxc9hMqjFGQ5A8kiSqZxZkI63tl6KLpP1Sy4uREDSlbhE14vMeeQNR8XH0gAmSXisdA8d5g8Nre8mj98hlAyOsnwXD33XZqf27SABnxTQqlTw3bFVPT6uAFPMmAGt3tlb8SZ3SYhS/pRzbB0edCghhfVnKOqMoenrcMrqrceSQLCdzCOgzYD52jMoNUaEz1ngGhkdJ49BJEYtLTdPDnE1ePteuW9gI8EpEkp8F6lxHq6yHpPoWHqMCHmGhuLoUNRtS6x8ltxNWyOd9Aidi7AmjyZX466ofHZQKNB1uYRrtU45lKgS0AWp+wtRvo3A8Rl1saVJcoAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1dPSndYHOG0pPjwg9XoouBnL+CmA/Q7SWUovCgdr4I=;
 b=JybWRBxpqg1jF1/c5qITpz+Wngjs/AIN4uXA7Ck39oY2Y1NiGGlHi5j/HkhjHReozOJtJqHeLRyyNhmVsqpHbFHuIYD8N//LGAfcIQ6PrzgoUyCLFFpx2Gm+bU34a3zcpQpd0nncLSwEgtXO6aaAXa0Hn6L4i94ltX9Rvf9iKFVePFMkdxNlaadAiKXXSCIXotBuf8HZ0zL9PM5w01xTWGfZ4qupQd3T0MwLjfDJrZIDgg3LagImSm5JGqTh+DJTNGKnmxNEaBNfZc2eyxVqtlSVYqGknd8J8b+yHfSYeNBvQkyncECJ47TrnmQeKFXdTnwUXX9Ryq0l+PBY6nw0kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW3PR11MB4747.namprd11.prod.outlook.com (2603:10b6:303:2f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.29; Wed, 3 Jul 2024 00:47:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 00:47:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] less: upgrade 643 -> 661
Date: Wed,  3 Jul 2024 08:46:56 +0800
Message-Id: <20240703004656.2295327-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240703004656.2295327-1-yi.zhao@windriver.com>
References: <20240703004656.2295327-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW3PR11MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a84d084-c808-4b95-eca0-08dc9af9aa79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kSC769DnLEvSNIbVWnHAuSj7gFA90DQig3HpcsQVympXjeun9n1lT6v8UCzH?=
 =?us-ascii?Q?A3kaLR1Z2vGQyNe6NxoW3biIBuGLSfYNjxgDcGl5GIRAsm09mOBMCGxqBdpk?=
 =?us-ascii?Q?TWAxCmz1CCF27NWcRsaCN6hXrdfcuYSkzukOZnT4V7veMmt3k0vJRiApFh8L?=
 =?us-ascii?Q?DkH4Txm/REdgdRvyi5/1OqynVnl0+mCInoR+6BIwrMdQ+zI2FcekrM4c0GAx?=
 =?us-ascii?Q?aSmy8OZTzgcROskvLY/VT1xxTIt/ys7Kzwse2mc9gIS2b4bkoaNvgCudLRIi?=
 =?us-ascii?Q?4diSLiMmW7iW+c9gzppMTNDjqLCzT0apvadQtuoZdztv3SS5Upb1IVhXMllb?=
 =?us-ascii?Q?1a21sfxArshQbPLFLHwaDWvfk3DtXfKhcNR2x70HlRrC4YfAA7ffIGNF3oMY?=
 =?us-ascii?Q?PE/O35RIFXRG0Gv25RIH4pVk8ZP/vTSqIpNZ/KYhMLcgTnUtPP903r9kyOzs?=
 =?us-ascii?Q?Yrw1O7VSMkgdD+uD03vpIJC18OrkJnmE7M7uq+4aL2MGvJEhErXhzKG4Bxyk?=
 =?us-ascii?Q?ku9HRuGWSJdq4CsJBfXSULVY9g4mDsp8r/kplsYVEiGVaf8YkV1YAfVXx9Vq?=
 =?us-ascii?Q?1LzmqioMMR6cQSLfhUd3kQZoBaQSFea0TVm24sBt/brxVPGK2RQa899TCw7x?=
 =?us-ascii?Q?EiGpanB9VCvbN7J0a3BYaFlpaAMF58ddE3K2hIJ6YItW9cA1WscFsFkHx3Hj?=
 =?us-ascii?Q?1SHfPzZtCgRE2GYQFFUP4f5FYDglQxjK3YyRK+nVwmSrrZHpz9AnGF97dQ5u?=
 =?us-ascii?Q?CQmf2l7ND0tuMTuPMif2sxt/sVhzTdN/LVrYgf3TpUFnRgVnmU3dDr1/BZ0+?=
 =?us-ascii?Q?l+SdGZmgDhOMDPLsNO27RkgZva59fCKeikAfi/m2BoXO68IE0jdsh/MBdpy5?=
 =?us-ascii?Q?MMS4FZUZSId4LW1aEKOXWPctb81j9xy8nApx+FWQ32z0XZ8Gr7U5//0WwOuv?=
 =?us-ascii?Q?snF6MuHE/6ayDovGCJm9OkaRHcytNXrWyCSg8eR4lKkSdnEpvzuuMm6zLZYW?=
 =?us-ascii?Q?FSFKZyml9KPFZJ2M8nj6cie0bO2aLPdwRuFxFu8Y40t3mqHqc/lZG1hnK5ty?=
 =?us-ascii?Q?ytt3E9Auw+KV4DzrW0iLOchrVjrN6kGYvHdlXnl2i/GOSO9po1FNiQRBcSE7?=
 =?us-ascii?Q?mCxcjTSFFhx2IYRZ7esJ5LvSaYOLI1LooaMLkCGrKUxqBE7FpG7D+w1gNrAk?=
 =?us-ascii?Q?u5S1zT3kBpj/mYHbrQcuVtJaRVvFMXHet/s2mSi00RmPGfVo3GSYN7fbJvzG?=
 =?us-ascii?Q?p4INE1/CG6CooTOgyB1D56HoY4Lg4a4XPd23gBYPvdbD9G1J2rG29R4wPdQa?=
 =?us-ascii?Q?VD66hSTTNOjsjmV4wvCqRJzqKc28rsxKwKteRl7rZmdFVC5OIe9duCwcoCuj?=
 =?us-ascii?Q?FdcEBtA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?72bGHrPqKdwWH7ReT6jpb9m1UOou+5pB7iILFkzhfBxU8JnCQwQBCzj7264h?=
 =?us-ascii?Q?J0pLmPVOmeLLHhnzxGMUU3Fefx+sZQWKzP8z3K2Dh2yeCN7gi2+ddF07vY4S?=
 =?us-ascii?Q?TbnWOc2biZrja5D+WFq2zJe/j4VI5uRcINctGRqCzQIZWbomA7uwOl/gMVQf?=
 =?us-ascii?Q?A1kbx8I9W4F3RlegcElHODpgitiL8P4zKjQHZpFtoytNBQ/pXFEecq9H4chV?=
 =?us-ascii?Q?Aplu84aaOxi98RiJLG0boC6Da620QJAADcEyV/TB40a6SDIyA2Y442NPKRLi?=
 =?us-ascii?Q?ujvCGhGK9UXgnakqdYDYNpRCi9H4urdtdc403N+POJPCBhF0m9kZJw4BlSPH?=
 =?us-ascii?Q?tr3eKg7qo84nOXHSre5n8H9XAZEcG+o/XX3ZaEjy6TBriKaUImQS0ywedFq9?=
 =?us-ascii?Q?/WEqDy64k+oG99TUlwm1FZqQYjQCyOKJbmTTlsgtqqNCaYD40ZpciS+LDvfF?=
 =?us-ascii?Q?66tt7mTSzyqiUabLhZAsszyN/Qy65UtwqOaE6jKsdAjfPJ3DU3Wuwuv6LY1b?=
 =?us-ascii?Q?hdwwMJe6c5D3dc3/g/yl461uKQ4iFO469xvRkqvIURmD2lqvMMC15UggpKFJ?=
 =?us-ascii?Q?oXi1CkfQ/N2/ctrUp9h8ad4uQgsMjPu4JgctZXaY0mK/xw8cBI+jvUI1tyrZ?=
 =?us-ascii?Q?LKinh8LRR8i2v5RuNoyEvqYtw6S1JT2vfIukctAlEUdd+SoDdYocFwIzlTC2?=
 =?us-ascii?Q?2D6iZdNzcLVEUX4ukh6oeH5TwSddW8g1McaVF9VsIcVBcyTOeRZ+CGVxuVg3?=
 =?us-ascii?Q?Uj935GAGvg8q9ukbU6I3d8KPQXLxFLOihOGV68OhvhejvYUmaFYdpslWk+l4?=
 =?us-ascii?Q?B34U/dJ3MO2fydbpPfgrBNvKFuniWx8Z2q/954RCbeRLls89qPvV3DdaV18X?=
 =?us-ascii?Q?S9KsOiTjpSTjX76uANreIzOSWALLAK7BUvPv3gSix+M9Oum1XF1wrlq1n4Z2?=
 =?us-ascii?Q?jxtHftx83emYptgqzJ0Ud6lNTUXcRCQVED2o+aeo4/gZS0ahAyXF3O7mpDZ/?=
 =?us-ascii?Q?Rjm0R/7Vne09n3N0Txj12QwbyE0Su2dDpYopjx7JlFIlXxGyNXFM9porHF0f?=
 =?us-ascii?Q?ASrjZD+JMpcTZh4YtGgB47IGqglf+T7SSGHpcR3SwgKl/r9hb4WrX5cn2LOv?=
 =?us-ascii?Q?K9s/IKVwJP4eVwyLOC1kdpfyycFvEJsWBz2CTmH0GQM4mNLmGT3o9Pwf4SlD?=
 =?us-ascii?Q?sMmFpLr2oYHr+d6wxTHj5Ee1Nv3ll07qFS3OjI24d2QBuZcP+/IM0rAAtW3B?=
 =?us-ascii?Q?reowuTDWivKTvv5OXYTp3C2KmZrkxe9rmeSUtItcAYezaIF+K695Frg5FwfI?=
 =?us-ascii?Q?jDx2RBWWHS3NIoX79t3Tivw5eRoevazxfBJ1Ys6VEWk/P6TJ7FOzs+BLy3pF?=
 =?us-ascii?Q?NQYWpx/cKpegYoCgWozRC/hH0uXs3gJZged1copi2oZal+VYmb7eFdlKv6Qk?=
 =?us-ascii?Q?5LoGGDbBWHbwt3xiVJTA4oK4PV+lLQ89I/z5QLh9y4IVHUXyppjxr8S8Q+o2?=
 =?us-ascii?Q?8tX5FX1y0hhU9nYKl5w953eWLZ36GMvu50ffv7tw0xsZCENWoH0i4ao+K4Vq?=
 =?us-ascii?Q?RH2OCZH12QnM9vG8OXr5Fa+SNJaMbC4k/wCow7Ah?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a84d084-c808-4b95-eca0-08dc9af9aa79
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 00:47:07.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+b8Lri4/zZszzzo6Ajt1Ad+aWViWpzn1LIZoTCabLJbyWRQ0gLXdTK1B+Ld/RqMMsod0wQrbAfXZbWA71aRFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4747
X-Proofpoint-GUID: 7KwUanClBgrHXfDHiumWidin0R9su-Wg
X-Proofpoint-ORIG-GUID: 7KwUanClBgrHXfDHiumWidin0R9su-Wg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_17,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=894 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407030004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 00:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201447

ChangeLog:
https://www.greenwoodsoftware.com/less/news.661.html

License-Update: Update copyright year to 2024

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/less/{less_643.bb => less_661.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_643.bb => less_661.bb} (91%)

diff --git a/meta/recipes-extended/less/less_643.bb b/meta/recipes-extended/less/less_661.bb
similarity index 91%
rename from meta/recipes-extended/less/less_643.bb
rename to meta/recipes-extended/less/less_661.bb
index 67834bdd58..c3f5853ea4 100644
--- a/meta/recipes-extended/less/less_643.bb
+++ b/meta/recipes-extended/less/less_661.bb
@@ -21,7 +21,7 @@ SECTION = "console/utils"
 
 LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://LICENSE;md5=1b2446f5c8632bf63a97d7a49750e1c6 \
+                    file://LICENSE;md5=ea7ea443692720f3015859945c0fb65d \
                     "
 DEPENDS = "ncurses"
 
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "2911b5432c836fa084c8a2e68f6cd6312372c026a58faaa98862731c8b6052e8"
+SRC_URI[sha256sum] = "2b5f0167216e3ef0ffcb0c31c374e287eb035e4e223d5dae315c2783b6e738ed"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.25.1


