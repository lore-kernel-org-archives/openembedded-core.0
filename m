Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC2EC0219B
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 04:41:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3466.1738989714439030281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 20:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41343a7b44=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5184frCT025162;
	Fri, 7 Feb 2025 20:41:53 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hm0py5dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 20:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxqBRZPocsRUvd4nJSK8fgHKvkK8cDd3X+qcEJV1/cEy4g6s7rRSJZkRfL7K4doOGIBmsX7si3u6vcp1WwAalZPwj3U1vVWApbJENQWxDtKO9IFl0kHS7EckUPePKtkQ04aSJFd2nc7l2SxfNeYsMhTib3ckGo3JMWWKVOSEUHA+arFROa+KJomiRAAf5q5nh/Bnmp0B7puUEkV8E+hs//QhXNXKmyt6fYLQG1Rv1V6Pg8ZyMvq7evq3Tc4Ec3/WkB8FIz4x7MrqBVNngr/wECgYUj1M7Y7EH0mjll8H5DcGx3W4pTy2pSjZup06/xpQDHCbI9YQcSGGAdhNH/9jUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF/eJTwuxMRwaLCzxpPXe6iMbPuejSfIu4pef1/PsCU=;
 b=yfYnt8stVmeIPk3Of6ePSA9tgW29uSFlY2OyV84He2zDTMwZvTLBlkjomCJ9KpwCAwUedPX9m/Wg0anoFwYRbS0ZvppFyavIaerLbXnegP+kFLRsslg3mzXcNuKsMZSvOBVrORCVMOtNb3kMJKEezSidYnYIysFnlX4XtXw4dxrE0nMI4L8UsNlKNgkQwcHbbYbQtiphYlAc7KAwJeewWuLGc7+oQdChRjxZy+dXr/ZYnDpdU37t/4QQdNIQyxkeQ9OufKitK6DHTapwZrYRHbKvbnmdN6sMxdxHVX+stZiOZ8sxe4DfgQCcNk+u/vYwD9B6w5i2MstHZeAEZmAuhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Sat, 8 Feb
 2025 04:41:47 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8422.010; Sat, 8 Feb 2025
 04:41:47 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] liburcu: add missing header file in uatomic/generic.h
Date: Sat,  8 Feb 2025 12:41:24 +0800
Message-Id: <20250208044124.2358670-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0101.jpnprd01.prod.outlook.com
 (2603:1096:405:4::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: f6bcd042-3007-4d59-6e59-08dd47fae55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PxMMXphHksEMr1Jnj2ynGWP+k/VR93k6lCvNdwdXAT3cZJASe1zAAAk0QraI?=
 =?us-ascii?Q?YKMvZHyArFaubo9M3282o6e4gfEoNA7STzPFevNZ1UNWaxGT1rHrHDl7NSyP?=
 =?us-ascii?Q?Y3GqVOkNy2rHg3/nvwu0P089M4ELLl726gW2/v57pURC4Cv01Cqk7W+6A91F?=
 =?us-ascii?Q?5OJ723I/VuQ1G9U79tePsGJxQYK843iuwFKRSbdZpwzyOcd+3fG4PdYp6PoO?=
 =?us-ascii?Q?RbPEdbWG64m1FaPXaNRHcE22E5mNHqRwOhPqTmSWxWNtrd0KL8zJ3CK+ru+t?=
 =?us-ascii?Q?B61NJ/L5sLMqE4YIi3IEYpg/j9Tuxz6zv7XG99v+diOEPBR8XcGngKzi5yVS?=
 =?us-ascii?Q?MfaNrslOvDqJGfLYA4tmodMEkaiJ0zfbnTBzVI5ZbO0yREG4IUsNoWqHl4Tm?=
 =?us-ascii?Q?0/NyrVi0VSRfYsm93QERX4zmIMe5kbqcYNtvo4QCU+BWT7hClNQvmFIGiWAB?=
 =?us-ascii?Q?xRWi9NMPgzAmak63UR/0uakHSXpOv2qN7mgzU59IEN9Wm6xcknk0sIro+C46?=
 =?us-ascii?Q?2Pu1oHJ8iMkDyjaOufr26H32X81Uyq155N8KbJP7w6jG3IdsqmyGiG6o569E?=
 =?us-ascii?Q?xShTWcTJNNUyBOIDV2k6y2keLnjPv4dJYq9O6mzFwnYKPCi08bHsKIjwz9lF?=
 =?us-ascii?Q?2+aIxAlN9vu3dIblD7vXfHTMDOh/11JFU/5pqjUE1GXA7aGSmEKrp+AJ+SdY?=
 =?us-ascii?Q?P6S1jtEfSiC7fLhy0v8BLjhr0yZ6vfbQ7XpLGvZBQo+U+b201h89+IQigxIk?=
 =?us-ascii?Q?RPZCOajocyMSaUUqC05GJ1hXvJWwIGGQMBDGG4Yv1mPbduN5VBGImFusTv37?=
 =?us-ascii?Q?XVbSH40N5UJhRCJgdGW0ReAbDKJCFUa0Fz6LYqQD2ZgC343E6ZBB1LgeBFaN?=
 =?us-ascii?Q?aUjNHoDlegvymz7nfEUQ+VtIp7vnxG2SNYOA3oPtO0630rCcCixHkIlOeOvR?=
 =?us-ascii?Q?dVHSo9/4q7Wfq8CDxxm6QVJOj+koon4aOLrPsoh4Na1/74BrY6NR0hiVDG6B?=
 =?us-ascii?Q?KSZJ6uUV5BbuNQ9h8Mhdz7N60bKME6aIZP/suIGm1iTWBlM9nyOx9pWHmN4Z?=
 =?us-ascii?Q?JhyIiOPoiJjpvrVd0e6BLK9O33MCaPyot3gJTKE1o5J0jU+kzvSGxc1bQQ7T?=
 =?us-ascii?Q?qbRD0hvy2pu9CIFUiMznFJKSEXG7CJbjPENdqmOLp+JSEhK4zVpn4xMjamln?=
 =?us-ascii?Q?WAMclJeZSYsZFlpIctMmAsxDmKD3omeljGQ29mpg3YYPC1CY7Fh68x+hxsw7?=
 =?us-ascii?Q?iWAxaIR0iV+pNGqkG39kVC+ZK08tDugADAtZqYgq0E9lKBu4D28fbHAnl5/E?=
 =?us-ascii?Q?jA/WIAwWHiESinCUdbl00+O54PNKAo8ZMwb6USHTUk4dZR+jWlpMf9jz9Xwy?=
 =?us-ascii?Q?zD+Dm672q/DSvvoVJMFDRPBDJ4/k?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PAGFB3ooq9w6qfCSLXCjuz9dnN/qqByURD+0Ae2q+3IjupgcXbZyCeB8Oxfj?=
 =?us-ascii?Q?qXX32MJbRVQeAC5omcFPOVJQR2mPx0BALnsjArAUJLxlUsTg6LN20l+l1JSM?=
 =?us-ascii?Q?vKyzmOLc4I/8qOeqqNiPUARBXa+rA4nyugXzT72jW3lCQpcoZ8TmfmNseO1k?=
 =?us-ascii?Q?xeMZQvqhU/VbabipvavJvAgIXpEo/NG0bGTW9peY32UfUkJLPqeYtNo4vimQ?=
 =?us-ascii?Q?6HjqFjC0DleXzQJMrrb0ylGUagCk1iZEAOY00gDi/fm4DVxXdZlA/GRB9/gG?=
 =?us-ascii?Q?36CUiQeH1JY+qcV/uQMv17Pwy6jsVJIM9bvPce5cKm9BZrOckHc9IxE+ovEV?=
 =?us-ascii?Q?TcvTksrKwCCnQY41FknQlcL2ewI1uZpfqUWE0Wbf2GPTXHsdxWfXe7TQgPvw?=
 =?us-ascii?Q?MV+r5Li1fWt42/nWtRq94C87IbBtBkGU8Tm4/Py9a6jT5P11SNwGw0sC8Ad/?=
 =?us-ascii?Q?PkaDiakISv+utZwz/XyGxVh4YAgQyfYhMWVxR6T1g8o1UeWNwEQtLwpRCn84?=
 =?us-ascii?Q?XqVUORlipz6oR3mLvIyTbzJRf62+kzuY7aJ5ZYM5eCwagXlkkkwcdMfJE372?=
 =?us-ascii?Q?mxSYKVVhtbSl+U9u6OubsQt7CYfkZdiE80IRGh1cEu6mAIOsDjdn9TBHpw5W?=
 =?us-ascii?Q?8BYKvYJDJNd9I+uRTJfsTtJpS+pO9PT5yd3DGiO1WejD8AznjAHBMjxqOE7Q?=
 =?us-ascii?Q?TM5QwXPuW4vgeacJ3FQCSVedqpz6lxQR+VOmwoefikK4wu+siT+6YQxVOgzv?=
 =?us-ascii?Q?B4e2QLX5H2RxHd49UOCdAi4gzuiOyqeZD9rLSIUy8Cd3raL+JtCvcVnYUOTR?=
 =?us-ascii?Q?10k2ajli3TrjuA3tXHq83Hxst6BHr9UNfD+9ysGXveI4eC0ZKysMl9X0Q74Z?=
 =?us-ascii?Q?DtI5nzHmOiXYUhlQrXAyGaogh5FRyS0dSbYRQ4PbJuYbmcmYbsz76VUXA5vd?=
 =?us-ascii?Q?thZb+eQo9TmWT982Z60teQVcXayDQJHfwaDpPHwf+QurEgpJhqrxrLpsgrKO?=
 =?us-ascii?Q?SagbJkV3sG0CUW01PS9vFlFeTlBs3lEW1MkxX8W+u+vO9BXnnV8To6w8evwm?=
 =?us-ascii?Q?wtEkIItVmRJ8sy7NaeZSCQaN6ZFNGwYvA+GrgZvsS6VdfhTVi9G6gIZdn4Gt?=
 =?us-ascii?Q?PxGquQEhPJrsLyl4vhGD/HbFwsGhne4tgnqnJYzjKcICXBE+jT6iecJXX8uz?=
 =?us-ascii?Q?ASkrzXdpMCAdNdCf10e7KqrWjQI38KI/qk1dYg1kUVhwXeT/7Z4CHolvpOaA?=
 =?us-ascii?Q?rM3GEJRCGaTmUlBYLsxM+lQzoEIbZWn6HQdPen0W2jiT6yA2mNH9v0WkRBEO?=
 =?us-ascii?Q?yPmUr1JHz6cVPFXKm3eUuj6qmBSopJ+oU9aMwhWYWrujVCmZZZYcT6HzRpOZ?=
 =?us-ascii?Q?KwjZxYE/wzqJKFDrNtojD028PgZpRzDG+kDpXDAHxoQd+aWKNR0+vUUCNxAE?=
 =?us-ascii?Q?f09BbauInuvgh979bgqYDnr2L1KBl7wZNfjpFIaLPq1HFktdFp5NXm2yS/S0?=
 =?us-ascii?Q?N+d2YSoK66tbtzsy87DdWcDyLX6sGrsJxwpmxkGd+1xxmn5UDy3bjW/SBDQ4?=
 =?us-ascii?Q?TG501NOBne7msLu+D5/M4Ad8Pjq5Qa7aSekbMxFT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bcd042-3007-4d59-6e59-08dd47fae55f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 04:41:47.4619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HodaKT0+uTgP17nMLqgWba6VpUkt7OBYC5DPXtkeZPkaXHh2Ug3VUEKTbcEiXuwNT5B4vaVX3oWM+fhrJJur2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
X-Authority-Analysis: v=2.4 cv=PqlpbxM3 c=1 sm=1 tr=0 ts=67a6e091 cx=c_pps a=IYePPuTyj3qIg1BHBNk0GA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8 a=RCenPsKwZeGm33B7eYIA:9 a=RVmHIydaz68A:10 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BivsJ0V_PT2yn3X6Wmq5P7shoDa8joo3
X-Proofpoint-GUID: BivsJ0V_PT2yn3X6Wmq5P7shoDa8joo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_01,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=925 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502080034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 04:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211012

We encountered the following error when building multipath-tools on
qemuppc64 platform:

| In file included from /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/ppc.h:228,
|                  from /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic.h:73,
|                  from lock.h:5,
|                  from lock.c:1:
| /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/generic.h: In function '_uatomic_and':
| /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/generic.h:422:24: error: implicit declaration of function 'abort' [-Wimplicit-function-declaration]
|   422 |                 oldt = uatomic_read((uint32_t *) addr);
|       |                        ^~~~~~~~~~~~
| /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/generic.h:1:1: note: include '<stdlib.h>' or provide a declaration of 'abort'
|   +++ |+#include <stdlib.h>
|     1 | // SPDX-FileCopyrightText: 1991-1994 by Xerox Corporation.  All rights reserved.
| make[1]: *** [../Makefile.inc:155: lock.o] Error 1
| make[1]: Leaving directory '/build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/git/libmultipath'

Add stdlib.h header file for abort() in uatomic/generic.h.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...h-add-missing-stdlib.h-header-file-f.patch | 45 +++++++++++++++++++
 .../recipes-support/liburcu/liburcu_0.15.0.bb |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/liburcu/liburcu/0001-uatomic-generic.h-add-missing-stdlib.h-header-file-f.patch

diff --git a/meta/recipes-support/liburcu/liburcu/0001-uatomic-generic.h-add-missing-stdlib.h-header-file-f.patch b/meta/recipes-support/liburcu/liburcu/0001-uatomic-generic.h-add-missing-stdlib.h-header-file-f.patch
new file mode 100644
index 0000000000..5872f45f43
--- /dev/null
+++ b/meta/recipes-support/liburcu/liburcu/0001-uatomic-generic.h-add-missing-stdlib.h-header-file-f.patch
@@ -0,0 +1,45 @@
+From c534091fc6924e76e6d24e861da9cf7272714231 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 21 Jan 2025 11:02:05 +0800
+Subject: [PATCH] uatomic/generic.h: add missing stdlib.h header file for
+ abort()
+
+We encountered the following error when building multipath-tools on
+qemuppc64 platform:
+
+| In file included from /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/ppc.h:228,
+|                  from /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic.h:73,
+|                  from lock.h:5,
+|                  from lock.c:1:
+| /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/generic.h: In function '_uatomic_and':
+| /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/generic.h:422:24: error: implicit declaration of function 'abort' [-Wimplicit-function-declaration]
+|   422 |                 oldt = uatomic_read((uint32_t *) addr);
+|       |                        ^~~~~~~~~~~~
+| /build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/recipe-sysroot/usr/include/urcu/uatomic/generic.h:1:1: note: include '<stdlib.h>' or provide a declaration of 'abort'
+|   +++ |+#include <stdlib.h>
+|     1 | // SPDX-FileCopyrightText: 1991-1994 by Xerox Corporation.  All rights reserved.
+| make[1]: *** [../Makefile.inc:155: lock.o] Error 1
+| make[1]: Leaving directory '/build/tmp/work/ppc64p9le-wrs-linux/multipath-tools/0.10.0/git/libmultipath'
+
+Upstream-Status: Submitted [https://github.com/urcu/userspace-rcu/pull/28]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ include/urcu/uatomic/generic.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/urcu/uatomic/generic.h b/include/urcu/uatomic/generic.h
+index 5a81e00..5c8cb6c 100644
+--- a/include/urcu/uatomic/generic.h
++++ b/include/urcu/uatomic/generic.h
+@@ -15,6 +15,7 @@
+  */
+ 
+ #include <stdint.h>
++#include <stdlib.h>
+ #include <urcu/compiler.h>
+ #include <urcu/system.h>
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/liburcu/liburcu_0.15.0.bb b/meta/recipes-support/liburcu/liburcu_0.15.0.bb
index 95d9ba17e1..a029b88111 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.0.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.0.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
                     "
 
 
-SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
+SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
+           file://0001-uatomic-generic.h-add-missing-stdlib.h-header-file-f.patch \
+          "
 
 SRC_URI[sha256sum] = "4f2d839af67905ad396d6d53ba5649b66113d90840dcbc89941e0da64bccd38c"
 
-- 
2.25.1


