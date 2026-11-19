Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11266.1795081317334409813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 01:42:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j2uP2uza;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5783888df5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wsPU2277194
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 09:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Eu/0661VR
	uitRb257vgx4kNsojx3n8gX+tQ/BNmcDOg=; b=j2uP2uzay6Nq8icvNyRt+l+Gk
	579z9c4MgnRZfhl5223nXcZEWlaG9PLYPYKH3jMQyaTr0qrGw7n9PVzP/37uFsbS
	3EJlhGBecYVqvb5AoaI7AKiElYl9Jr8msrrlhEszq1ZC5qjkPiD56YoOOxMPDqK7
	S2yzhyHcoutc3kXl3PVDqT8s+30SjbGF8s/2253DToRTzM9qlLrM3GnI2mH+EUTD
	NoNJPw/hw4XELQLelwY3mU8RMzJ6E6MDzwF/lV+7ywBjxecv+cY8HbhAlnq43yAL
	ljXAuhLbcMP4Q7YNlmfauliPX+9zv/WtuLDp46AG6fKe03fYgfoBaZKzAvKNA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023135.outbound.protection.outlook.com [40.107.201.135])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvh5tdx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 09:41:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrzE+qXIkwDg9PqxMY2223RUeJcKvcOWcM2c0nvQJ3xoUABJlIxhx6XdfxLd5c4nTzb1P2Q1dxfPjs/qIbIDb93aVP7ZbLGGd2bpFh6EbMfwCZgwEQID9GKQHhSDyvE/Nad52jTFvyCrfD6ZT3oZtM/R4BuotkxdwsvZb8cMzx9U+EH8ICL97ZdrSP5RCDAPP29Brs9tEfaKmhQjMA5StF0iUhCFHH8/sqIIWVwaC38XOdUCVoDJtGUDJGf0F9lKkHWnodIQHcg6I+4AbHhCqWuz9lmOukklCWbg+5ctrap9okT9XmxNRj30vZSt9w0lnZpceTBRXrqashrCEKxvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eu/0661VRuitRb257vgx4kNsojx3n8gX+tQ/BNmcDOg=;
 b=viSkPXMtdopJy9wFPwjjIJpC1xlgnX2hAU9RUtqdwbZ46dtaNBd8hmvZbhB18hrfDCRwntUTzvv61caa0bDZag/vyk1xPbdxfWUIVKEd9Jw2AQyt8Jwu7/GF62RencHY0Qnyo9MgWhMZ4S1jpxwrAF0bgwzrUJ765QPeRSUBuz7nxP4cWH+gvfy985wbQAc95WiZcpCcMlQv1ySwtKbiyZy8LtFyDiu+WKztnLpyibV2tM75IQG41n5R/G3CxuNCDfWDUU6ryQEj2yMuSM+zR8OkThoV56VejYpi7JQkU4zdy5yMmeU6ZnQebaeqqzccRso4e4txKXQMV4DMDAJw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3SPRMB0031.namprd11.prod.outlook.com (2603:10b6:610:14d::10)
 by LV0PR11MB086872.namprd11.prod.outlook.com (2603:10b6:408:600::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:41:53 +0000
Received: from CH3SPRMB0031.namprd11.prod.outlook.com
 ([fe80::edd3:84b0:a509:60df]) by CH3SPRMB0031.namprd11.prod.outlook.com
 ([fe80::edd3:84b0:a509:60df%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:41:53 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: Fix intermittent test failure
Date: Thu, 19 Nov 2026 01:41:38 -0800
Message-ID: <20261119094138.1600327-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To CH3SPRMB0031.namprd11.prod.outlook.com
 (2603:10b6:610:14d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3SPRMB0031:EE_|LV0PR11MB086872:EE_
X-MS-Office365-Filtering-Correlation-Id: e496b75c-a947-4283-4a93-08df46215797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|261021135927099003|38350700014|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|12006099003|25016099003|18002099003|6133799003|29003799003|13003099007;
X-Microsoft-Antispam-Message-Info: 0eEVpRLVgUs+2UF742zLPu5goKvZGP3m+Yg+XFUcUEOO+2oqDCb7Gtv7xzLhGV653iU5N38twVBqkQhpcn7UYs4tvfJXmofrG1GY/4FmDxjMYLHVUL7sewxc/xCr6U2/DpOQp69rciCekETJnx2cDu1J4S7nJU++hgRu0sZ9OhS7WkNrq0b8kfpah9ec6keM/4tG+F/0yGNxOEAD9DEQl7whuQ2NB+p3eB6ZVUz4anyBmGAJ2TZ/HfK/KFJkpag+wUxD1+kEhgy5x41oLJhTwnQqGNEekoooaJDy+G8IYRzZPaGZiHj/+STzOJSYViwYttVhoEqemp8R1EvF2Zde6AZ6vtlC30nGnflROzzu3YsgsjUujhSuNpzEEd3NmLuZLCbRykqwRi0iev6VhX8pap+sepezh7HZSsrpQrE0wmIVaw5gOV1lrx7w7g7+NZpsGYi27N4VPRWzyqYHXHo319cMFlz1NZLTV4bGOWkTmrhOtJDqftkVcI3dnrABT3ZLluJ+8ucp7JH05rHsOyjHTdxaM6EzzDxT/5SrcZp4MkAaXtunbu70RLv0GeRus7KDWIPBKQ/G2EGxCBZxfHQVuipE57/4SWB1EMtpPlqN7cbvWa5ir5sVt1SeCXnKoqySb21OELEBUb8JXye23kTSwIX0ERE2Xp9MIL0yrCT9Djc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3SPRMB0031.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(261021135927099003)(38350700014)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(12006099003)(25016099003)(18002099003)(6133799003)(29003799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LCOgz+M9yWHmn4xEsXzFJwlm+TR6t5cEz4Nk7UNV+Sr4UrL6nFCpQQB61Z66?=
 =?us-ascii?Q?3ngTah/CJRiGPJzuc40aJCy1ZBExnGuiDQ89GYRQBksxR+HzaRZDE8WbKhZJ?=
 =?us-ascii?Q?CHI0/cC1pD4wht78bhcPLVJ/wyLiVJu9Jh4rcZx0xygTt9mQJ5kY7/ycqv5Y?=
 =?us-ascii?Q?TYe+zp2cbX1A+JQsxYVNdWPFWg5LLRuSpc4RarSKSLwKN54bU12V0bVI6DjN?=
 =?us-ascii?Q?KIcnhVb2O+JjDgrPsfzB44QEFKwXxa7bdMugDzSuVEjABCsBd+z+Wb1cRMYu?=
 =?us-ascii?Q?UFBTsFCYTADjmLXOvLNXWvyZZePIhlaMN6/b1zsTQAP35P7h20r2em28Y5uT?=
 =?us-ascii?Q?HiFO8GQ1BOrrbrZsSz6Nc2JIxXcSnaiHlil6v7VY/t+j6odf4ko+oBafgbMH?=
 =?us-ascii?Q?G/Hr682/mpgcM/jP1aSRWDUirhuPzqhkqtdBxlOHOno0ZSxGbyesGNG93hBf?=
 =?us-ascii?Q?YkXkdtOIrBiKY2m9kHfw/0UiGO9cRMDaGj46EkopcKRU8KhjLJdVanqLDZsl?=
 =?us-ascii?Q?Y7Kq/z2N0OKKDzsTyvSR8uJaDdym/IyUyBOTJyGS4CRx1luWBSZcFBmlKJ1f?=
 =?us-ascii?Q?OLI6w9mfBboXSmbG4jSQz89HPRmqA+mdWwHGTwr8S5P7s/eWMRP2H8vuqaKG?=
 =?us-ascii?Q?w6zNAn8lFUyahbL1MEUln2I4Adm+sV0mF/1BABAkY3KX6GzMUSfhrzqzZWLS?=
 =?us-ascii?Q?wd3JyoGb1st9z64X0de6znmwk4n5YG7TBXKOyxUd35480FUyTX1TmwTh37vX?=
 =?us-ascii?Q?GU6N7Wo2GNlqGzE7UTlkCCggy0xcocxDHTuKCWHAhiGlJsjTGmUY6P7wOH1u?=
 =?us-ascii?Q?l4B7YhKU2R2RnE0g8EviYdqs7cjX9zNNbNWnmEVCCqpvRMCLMwrE1YK+HQ7p?=
 =?us-ascii?Q?ZgwoYhLw+DCxAyFbivkSeiv0o8wgbNFxVKY7WjiYkYGkDrRzbv7Cp9JTjemm?=
 =?us-ascii?Q?chiR34zHmOS+gImk3uwtOn8nUqP04jtW+yYvxGouVdP9TRsNtp4y7PoiAa2S?=
 =?us-ascii?Q?P28PDJ3/ZBew5ZHXRRsf/+FUImREOnoL7clQVoCsHECNiGhA+KcOT5bdQ8WT?=
 =?us-ascii?Q?SfZvHJS0Q8rYZGoot+Mi6wLqssYy4eAXkGyqneEJhiGQSU6Z+UwyqEYl3p49?=
 =?us-ascii?Q?CyWwA9o+36BpXf5Ob/2emX4SoempN1r1koqdChmKGCSecqlhk7uu2lhbmXeE?=
 =?us-ascii?Q?ktOvcRXcnfJcpePMl6Q9dqTzy3V0guMFWSYpyvXabeH+OGcpMdIToMASUVp+?=
 =?us-ascii?Q?Dl0xT/J3xcmA5lwJ7LjBtU3ks4EyJ052xtFkIlVntH5TCbF4QrdSrZPTE5vg?=
 =?us-ascii?Q?e/YS2e5hE/t20aJKdp6qjindemXyW7h2hjU7j8h9sdPdvNxxM5uES5xwERQ5?=
 =?us-ascii?Q?utJAFX1NjaDRGta8QjEeD8E/w0XojYqpwYQz0Hvfsy0XrTp7Gl/2V5h+l/GN?=
 =?us-ascii?Q?FvfSSdJc1/IUWbKJ3JFCWS0ovpIyE05MIacpIonNRMc71UqUxc8Ew4ybruay?=
 =?us-ascii?Q?1j4WyXm7YJPJuMT4K6ThIEHxW9u2X3DBn+Is1fraXZkcfBJMo6RvBLtIWDnm?=
 =?us-ascii?Q?dHigG1+YuPXmUdCacxZLp0MfWHPWGuMduCTFonNI6NwYnuUSqhjlyPDXzEK+?=
 =?us-ascii?Q?8wjJ7u9g5AYcJTgaYgo4agfc9+O5aaMGeOPM4MxN04Fl2haVbjc0YoiubVR1?=
 =?us-ascii?Q?WTLFYtCUqkOXCa3IsQP5fU+Q/y4anDcDRnq/HyCIEHOGZX/bwRRYbUN8f7Qq?=
 =?us-ascii?Q?lKYvxon9tBLOiWWAEl2/HbHF+01tWYmx8TD6Chvt/8A9xCRdQ5Wb?=
X-Exchange-RoutingPolicyChecked: T2030zpjzvoK3eSgMkU3kBGi/nFImT5X/SMYjaU4EyujY9LJYLyIyfhCSubQnW1Mrjtl0Q3km62o7MPER0WoGHJFCZqSEjPDT0UHXPkq344BGtbsnL29i9xP14GzOsbq4MKN3kBTx3vKXz1ylhKiNF+A7k0tV+SSlaqWX1WAS38iolkdjV5sCbbRq+czG9OoonfyDGpVAHy26Jn8hWB3Cnz5v2mFz08ZkA7huOsHJzujhRtI7w7VUgrY5Cu0xyCj2WfQO0CQ56Kq+uZLfqi5X38uPeqL+1vhCuUKxRM2gH6Zv6wm4FHIYg3D0uEZJIPmtpl2STRy4zhNkGr3qvPfrQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e496b75c-a947-4283-4a93-08df46215797
X-MS-Exchange-CrossTenant-AuthSource: CH3SPRMB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:41:52.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYMmnbMi3EkfQFTipKjaS1BMQ6TZWhCcF78kGk8SBFXtglEHL/wSo50G+H1BbKzq/A/uRHGBNJqZLu7+4JL//oLUyv0hLm30ez4yc+pzvHYKzIQgmi4SriFDv+RDPq4k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB086872
X-Proofpoint-GUID: 8dANj5aD1kZVxraPvJ4B2nEoeGYJwy6F
X-Proofpoint-ORIG-GUID: 8dANj5aD1kZVxraPvJ4B2nEoeGYJwy6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfXwKQTsTSX4xfj
 Me4D9TtBRYK1Y6x6IlNl6a/7rwaSVI/5CSGpsfNX4xMGf7CxrPs86pw/x/eYWAdXRObh9D0HJ9h
 9kOnn/ZNBySpkHptrvtL8Tf9LB6uQrZ+oh7Tg1hVUM9EYqWyfC8hHo4t2t0p8pKnG7Ut5Eu4zC6
 tkHUcctvChtgvoG7j4a7IlBQxhztf7LWQ/8SmwupUCmaiOA+Ef7gMd/jfOo1wL9Z8p3GkhkvDT3
 TyTGXR8sof5jWKZEZaqXD4gNGJPJpkAz0J+GovFJW0x0tK+2QyYALxqvsUvi5YSbji7lgYaA+JH
 b33MSCa53VUIDEyXVUF+Rjl8HOJoe2Orqi6NawAd6Dl9oxVXDb3ViRnQNjvcMUyOjHNYrSef+vb
 hDN1WAxkuy7nbUYg5rOHgd6/+X0Tv9YJqscSfrpWxAehMYQH0aeYcHHdP+JvZz4Xw3onBLxkIZq
 jtmuRKh37RoWclJIN7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX+8btK+DcbfSl
 eBKY/35Nxcf5Qe+a2kuHNNVdWbeD8uYNyKlEM5pIiG23xHcWQ6HXc8r4cT6xkafv4cvjCG72sSB
 hByxw1UpK/sfQ+5BaNAb7gLaX2d3qqwTH5VefV0WqDWoVF1jb7dh
X-Authority-Analysis: v=2.4 cv=GNCdgeNK c=1 sm=1 tr=0 ts=6afec463 cx=c_pps
 a=TbD1l2oU6eC219p4blkGNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=mkIxG36oAAAA:8 a=Bk1BE_CMDg1iwUWdAl4A:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=KRdHDfwrMGS2gN7yEUgk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 09:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250656
Content-Type: text/plain; charset="utf-8"

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Fixes [YOCTO #16460]

Fix an intermittent test failure by backporting the upstream Rust commit.

https://github.com/rust-lang/rust/commit/a292cb16d5cfc32923be91c86afaf727682a38dc

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...se-thread-local-in-c_str_alloc_error.patch | 64 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0006-alloctests-use-thread-local-in-c_str_alloc_error.patch

diff --git a/meta/recipes-devtools/rust/files/0006-alloctests-use-thread-local-in-c_str_alloc_error.patch b/meta/recipes-devtools/rust/files/0006-alloctests-use-thread-local-in-c_str_alloc_error.patch
new file mode 100644
index 0000000000..f213220157
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0006-alloctests-use-thread-local-in-c_str_alloc_error.patch
@@ -0,0 +1,64 @@
+From a292cb16d5cfc32923be91c86afaf727682a38dc Mon Sep 17 00:00:00 2001
+From: Jules Bertholet <julesbertholet@quoi.xyz>
+Date: Mon, 16 Nov 2026 09:24:03 -0500
+Subject: [PATCH] alloctests: use thread-local in `c_str_alloc_error`
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/a292cb16d5cfc32923be91c86afaf727682a38dc]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/library/alloctests/tests/c_str_alloc_error.rs b/library/alloctests/tests/c_str_alloc_error.rs
+index 1e7d54d75b3..fc572169583 100644
+--- a/library/alloctests/tests/c_str_alloc_error.rs
++++ b/library/alloctests/tests/c_str_alloc_error.rs
+@@ -15,20 +15,22 @@
+ #![feature(alloc_error_hook)]
+ 
+ use std::alloc::{GlobalAlloc, Layout, System, set_alloc_error_hook};
++use std::cell::Cell;
+ use std::ffi::CString;
+ use std::panic::{AssertUnwindSafe, catch_unwind};
+-use std::sync::atomic::{AtomicBool, Ordering};
+ 
+ // Once armed, the first allocation of 8 bytes or more fails and disarms, so the
+ // reallocation inside `clone_into`'s grow path fails while the runtime's own
+ // smaller allocations keep succeeding.
+ struct OneShotFailingAlloc;
+ 
+-static ARMED: AtomicBool = AtomicBool::new(false);
++thread_local! {
++    static ARMED: Cell<bool> = const { Cell::new(false) };
++}
+ 
+ unsafe impl GlobalAlloc for OneShotFailingAlloc {
+     unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
+-        if layout.size() >= 8 && ARMED.swap(false, Ordering::SeqCst) {
++        if layout.size() >= 8 && ARMED.replace(false) {
+             return core::ptr::null_mut();
+         }
+         unsafe { System.alloc(layout) }
+@@ -39,7 +41,7 @@ unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
+     }
+ 
+     unsafe fn realloc(&self, ptr: *mut u8, layout: Layout, new_size: usize) -> *mut u8 {
+-        if new_size >= 8 && ARMED.swap(false, Ordering::SeqCst) {
++        if new_size >= 8 && ARMED.replace(false) {
+             return core::ptr::null_mut();
+         }
+         unsafe { System.realloc(ptr, layout, new_size) }
+@@ -59,11 +61,11 @@ fn clone_into_alloc_failure_leaves_target_valid() {
+     let src = CString::new("a fairly long value").unwrap();
+     let mut target = CString::new("x").unwrap();
+ 
+-    ARMED.store(true, Ordering::SeqCst);
++    ARMED.set(true);
+     // Under Miri the failing allocator is honored, so this reallocation unwinds; in a
+     // normal build the allocator can't intercept it and `clone_into` just succeeds.
+     let res = catch_unwind(AssertUnwindSafe(|| src.as_c_str().clone_into(&mut target)));
+-    ARMED.store(false, Ordering::SeqCst);
++    ARMED.set(false);
+ 
+     if cfg!(miri) {
+         assert!(res.is_err(), "clone_into should have unwound on the alloc failure");
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index ed779f3478..94a20a5350 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,6 +8,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0003-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=${RUSTSRC} \
             file://0004-Re-bless-tests-adjust-for-new-Cargo-lints.patch;patchdir=${RUSTSRC} \
             file://0005-rustc_llvm-drop-native-sysroot-L-when-cross-building.patch;patchdir=${RUSTSRC} \
+            file://0006-alloctests-use-thread-local-in-c_str_alloc_error.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "90dab90b8084eb57c35ae2b1d0b70c8e5138ace6023b22c60a5a400f586f63b2"
 
-- 
2.49.0

