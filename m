Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01FCC19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 02:12:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1883.1740622332987820762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 18:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=415316051b=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QNfwSh024121
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 02:12:12 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451pu21j2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 02:12:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyM2bh9bp4SJQV4IVTLv7FczDGcg2vyZXnk/2zb0alifa5KHu0MSUSfLimNHUGl7s8Cp0gWy0X74MdYzc8Fb9G5XbLFgrizg4Qoyb6u/VyQ8cNqoqXaNtAKCSR7zXwrm17XZoDyu0pvaKpd/hLe5dBYOk694dbfE2iXZEMPqRelF7IQBIK56rY/DmQXXNn2ECOWECl3arMPrK9a7x5l1XCoe1uh+wGIG2nx3YcLijq8ka0muX65dWv1gju02xHvBY1I8pHp6RSY3zm2SxxNTAOhT/NS9oFsn7IvkAMtrjs5zp+AH/GyVcT3xyHekGGedTXrXmtOkOuhuU8u8SxlsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zmkKRTZQ+BtWwUTK1MEAVwseX86Xjd2Ud0+litaOEc=;
 b=vXm1C9GjfaGZHllQ2195NYXUIVD2vw5DbuWdqQ0tWLVkHp2iE4fJp+U9Jym8yfdN6fAf4789/mA5sRXK/l5X37DbxT8ty6Vk7H0UwGB8VrvhbJooMcb6eyIC5nSwP27ejaM5oTrIifsUb8vPN/QY0r6hlWf7Pi4JFxTGfsCY6Hw+g+NetcF5E6H2yBWW87cvaKZje6/b0Grg3Muf8bY0TfnobnNH/Aujpo9giOEG8CLZyWpcs9UcSebisXP2r5UQo9okmwdg7VpR8r9pt9wUPVrX1WCck3B/lqpFKNjb5pCRgPPh8FxDbooHjaUgPH9Wbp6AgGwTKK1eZgtICYNDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 02:12:10 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%6]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 02:12:10 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH 2/2] xz: Update SRC_URI
Date: Thu, 27 Feb 2025 10:11:49 +0800
Message-Id: <20250227021149.628653-2-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227021149.628653-1-guocai.he.cn@windriver.com>
References: <20250227021149.628653-1-guocai.he.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::35)
 To SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|SJ2PR11MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ba9974-ad46-4b82-119a-08dd56d42488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X3KSpYI6hypdkK8wIQVmr9fhwNGUudlLgxCBpmBhGanRnRbryVIVs8kfoZs4?=
 =?us-ascii?Q?Avo7UPmEBRlFA6w8TImo3WNAkm56vKHFfsNiBU846+ctCHa+OTnLEZhVSvIT?=
 =?us-ascii?Q?OVdigjQTRugY123pttNOYzFDM/hqWyPInZpT0+vSZVGYIGfKLLHoBOT/Jfe4?=
 =?us-ascii?Q?4qYmoL5NrnfxPG4N8xUrFnCwOin5wI3ZpKcAN9ubD1zqAB50igQsiKXcuFEf?=
 =?us-ascii?Q?ueVD7woQ/Shhg1TPX/yKQjFMwpwoaLIa2C4CvT2ROTn/DRIZ3c+Uh0Qh+Qfc?=
 =?us-ascii?Q?x2SURLK5uBNlSmK0M4rAyl7cjsu6tf2c9p+rBa6J8M4emujKml4oBSzVThW5?=
 =?us-ascii?Q?9NQ8q4pC+D/Yr2QoztV6MEg9us5t8kIwNP+JnJdVoXMn8LV2VhTqjV4XE+gx?=
 =?us-ascii?Q?DLsX9gpGW/6iP1/t+Ar2A52QjEQILB1RDRjfpIVeaJ/C9k2AR1R0H+xaqfpw?=
 =?us-ascii?Q?6Gr9/CmKLmTCulr1oEcsQRO7qfdvkFZ+cbNzyYZ89bmxV55AnUwDakSHt+CN?=
 =?us-ascii?Q?JoWDBpBG2fY+QUkAUUCmIpNKnFTq2OWOAIWGTb64i2opdIlflyQSJB+MJy+C?=
 =?us-ascii?Q?Bq2bxK4z2CdKq6zYZJdo4gOhMXF3VEcLCP0cZ58VojEnbImTpl2fEfhQ8YlP?=
 =?us-ascii?Q?BvuF8IrKazUGHqLNMEnvfqwZ33vy0h50lhTOgXdz2j12BdmzaT0Yy/8T/Oa1?=
 =?us-ascii?Q?KuDmc4Xh9JqAbkwsjc+ZT9UOs+N2b1QwBh448t2aX2n58wpOVu2DWy9o9v0A?=
 =?us-ascii?Q?VoLXws3OjX7UxP0DNaGNRsW9CiTii/K3FlATFKWlRg/SKhQfCFj1d+sTojih?=
 =?us-ascii?Q?I1dTu756VMPqM6blTlxIoIA5SdVALDQD8kOoyl/hgxK/PSh3q2CfBTuyUAPf?=
 =?us-ascii?Q?fdQmEbuv7mZAy6cP78xLqS+Ybk7w63d2/AoDifejJCGyMbaHmumpIN9/oDwr?=
 =?us-ascii?Q?xVozT4AR631W99ptLcdrHtvpJ9i3ZH+oz1qL97ZOrdqtViKv5K7qqmWUANkq?=
 =?us-ascii?Q?6iJfhIrL+xD/Si+30QMVjk6+gKp0sQ66+WOO8EPsYgmJ3brLzHVzwMnLs5hB?=
 =?us-ascii?Q?eOCU03XLiq9xfLRL6N1N50D0CHf48buKP6NPZrpNh5NChwkSqz9532HhTIVk?=
 =?us-ascii?Q?8FvA481lUrqDy9uD0G6Bm1/FcLPaQqb28ft5n1a1es5wP5p1PYmp1/OL2pDi?=
 =?us-ascii?Q?5Xa7vyrav0z64JAcYu/4RaWII/Pl3h/+Dg7qsd3fbelqPadrwsZ2ZLjYQbPO?=
 =?us-ascii?Q?sCOp9ivMHKBrBytmqRIO8HXkmAcGdVEX4LvrapY1OTT5A9cGiEQtHRo4UwXQ?=
 =?us-ascii?Q?C8cd8/XzsGJqzzJIhnbRx4YF5bwlBn5GzpBipabO0NUMyhsZ+OTZ50zmArIw?=
 =?us-ascii?Q?HlnN5cbi5/1qKAYOH129YcLVQP5CVvWyV9R6pbBIWaJLQNRWpg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5mA70GKBC1kPL6pKsQAK2Zr/qSnNwkZjB3kK08CEa7Du8OHigWzQUFBWAPWi?=
 =?us-ascii?Q?AadATDDZw6PWv4DYuM/3PACRSwVBXv0DumhfhepFD9x7R+Js5LTC7VX1IbhZ?=
 =?us-ascii?Q?R8h9YsWsu5Eol0tUM5ZE5rQO12wNCXQ6HxHciuu1S+/jAAhpHYMk+d9Jtyop?=
 =?us-ascii?Q?SeaeqKWbzRTkD0MlTQRjXjN8jp2+NKsavbHB9ZsXSPV68brSwwe79Lza/4qf?=
 =?us-ascii?Q?zZ0cyMY4kpf+XyVLAX78EhidaoxbDxC8r+ngug74CsWYrI/07A0LXITTfefi?=
 =?us-ascii?Q?EblzoYWhgVEn4faPPSfpoQq4CPNwnhABGneQs2PgKsbDT1v1IU5H+jFnu6Nj?=
 =?us-ascii?Q?KejmvEf5fcJWHPc9KQPaF7UHXkc6nJS0bPR/FQOV+QonNMGTV5FQnrzYCr1I?=
 =?us-ascii?Q?M3Z3pjQ97Q/akrPQNnDIbURAaD0dHPvgIEb721K7ytuyGqKMuz/rAKdK8ksX?=
 =?us-ascii?Q?5qn76X6OzYUCY4bltbzE4wcxL7l7D+GKiSJT1RWjIZ2ReV03NuVNSiHz78QO?=
 =?us-ascii?Q?FdzP/8u34PIQlfd408PaDJLKbyKKixYeObZBFyEppCunsqEJt28vQ0NAhhYn?=
 =?us-ascii?Q?m+Y7FFMPy9dKERimRmewpWmBCOdoCZ/5MZmRMJvc71E7VaWDmX3Gy0V1reQH?=
 =?us-ascii?Q?qxmm2p6+1G8ym8kEvliKGRJi8317nRcVfz6HuiYZgsStk5LN36yqBraHV8Y7?=
 =?us-ascii?Q?QeerGV5S2Cg8TOn7PkoPcuRgiqh+TyouQbkhLNGLmC+sGHjJITasr3v/h8cK?=
 =?us-ascii?Q?p0tqSylvSeAYPLpb5HHTVGPnsYr5ciNS4Civ/VQcm//k8d5trUZHiHB8zNqq?=
 =?us-ascii?Q?FuRfnXRIrcCJamy8EAUIQsnzqiend9cjozA1ipmDagqsoojrWB2HAC4Uokrw?=
 =?us-ascii?Q?114npJwrRWivMxFVLy3kaHIyTYSgwbGWRsNMEn5mwFCUk0gNuKmnoy+2gmWQ?=
 =?us-ascii?Q?S0/qPUKTzyc2bdRcC2K+1bLdjxez2QAGQdPJCkNnbipwIj6uBG01qxlf6EIb?=
 =?us-ascii?Q?Gl/l0Vbv0naCsqdjwt8Z05Lj2QJAefyrZz5YgEG4utEUTEg+U2SplhjrhcXQ?=
 =?us-ascii?Q?c8EY6GDyO/acLPgozeLyAfMtJoYdIMwIjBcfFhET3ZWkffwML0lv7unJPiIU?=
 =?us-ascii?Q?+R4kQRemRzTu9NURHiLoMT86/gWiaE8sLSugf5nulGGz548DCUNSulHR2+17?=
 =?us-ascii?Q?YVnQoRMWoqNj2U7PfapPTBUk9BuQXi1OI+Q1bO0eFtoOBF/tjIpSA6xicMSK?=
 =?us-ascii?Q?cqr5qeIHzQGK5SSGg3AlDHDSQ9s9WJca5N9L16k7UM1clOCwO0pEBXaGHu5D?=
 =?us-ascii?Q?6cCLY0QC8x7xa5TA3stE6M3sDGP72kqvkBNrlcZjIg0wn8b/3BjaV24JxDbb?=
 =?us-ascii?Q?3vDX2BFbzg96cpTkE8twrHOnFhxL53tOypgpc1ZPNJ37SdENpxc6ABvoDX0S?=
 =?us-ascii?Q?5hf4KLuBMWmHgUBFhbJKJ352VCZa713JMNQ1j0/ikgHQqe4JnFRH8x/C5NFq?=
 =?us-ascii?Q?aSIigEanhPCU8sJyr+S19fCdadJgUWS2aQSeyzgEpSvjU3CDEWnl+xE6g0EK?=
 =?us-ascii?Q?tOek7PaJnkNniXZEquT5TGHwNyx4Gij2ukVoyHRUQaTxOnBfHMYFUTaJNFkj?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ba9974-ad46-4b82-119a-08dd56d42488
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 02:12:10.5993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vF/n1SLV0rQkK4W/uCM/Fiu3meGqy9vimLhVj/yUnYjy1frwyXV0haqaX72EBrCAC17Bk+kS5QnDI1UPH0OoSZvxsUUpcFVgw5KW3Eyvy48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8568
X-Authority-Analysis: v=2.4 cv=K7bYHzWI c=1 sm=1 tr=0 ts=67bfc9fc cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=KNeDkjSnAAAA:8 a=FP58Ms26AAAA:8
 a=t7CeM3EgAAAA:8 a=aJHKjTt760FWyKiF1XAA:9 a=_aqIeBqooYN0gCReXIfY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 68crAr0LwdBjY3YUOjsB8YOuvGhMy2Q3
X-Proofpoint-GUID: 68crAr0LwdBjY3YUOjsB8YOuvGhMy2Q3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=801 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502270016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 02:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211974

From: Guocai He <guocai.he.cn@windriver.com>

Update SRC_URI for xz.
The the tarball of xz-.tar.gz has been changed from
https://tukaani.org/xz/xz-.tar.gz to
https://sourceforge.net/projects/lzmautils/files/xz-.tar.gz

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-extended/xz/xz_5.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xz/xz_5.2.6.bb b/meta/recipes-extended/xz/xz_5.2.6.bb
index 3482622471..7f889e4367 100644
--- a/meta/recipes-extended/xz/xz_5.2.6.bb
+++ b/meta/recipes-extended/xz/xz_5.2.6.bb
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
                     "
 
-SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
+SRC_URI = "https://sourceforge.net/projects/lzmautils/files/xz-${PV}.tar.gz"
 SRC_URI[sha256sum] = "a2105abee17bcd2ebd15ced31b4f5eda6e17efd6b10f921a01cda4a44c91b3a0"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1

