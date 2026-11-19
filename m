Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13959.1795092814929734895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 04:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Z/tswkO3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57831a9a21=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBi5Hu1981418
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:53:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=d9xO/kPhR
	T3oM3kLsn/mDjwAKWZRwv8BlpBRMgjEvgM=; b=Z/tswkO3mCnIBY/TEHREv0Zv6
	zpKtQl48/dC7RydDBrVwc9WFDmbdNW7v51E/yp72Dl0QbCVGdH6gqvgsv4G6YLbt
	p0pHwK3qCcPtcWwwprb/5hBApohujQnF1Y6NpxQV0uZfpIMz9OmkGCjt6MLuCVuv
	syc8VskvYoRUICCFFFPn1RRDBgLwKcvzGnBfTIa4CmlvyGJUngGaWTtCyJTZ8ydv
	y+DFPrShih9wey9uw3GQx2+nxNJYAtP9uhKLcid0P+Hmj4V57dv61F8P9NxtZnzt
	V+QFlFL7eQ11xb7HAp0Wrqz1w/dWKU/IUfYTAPrZiDTLZ9zvBtu+ukJhC1f0Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022109.outbound.protection.outlook.com [40.93.195.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvge4xf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 04:53:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2XFLcM/a8vLvCHv6qA0LcjWENS06xWSq3PhbfdndNYG/PSNsPRDmT55PA26KIo5y2/Us21Nel01ZUMPIu7eRctQiJocxcpJ/1rzsyO9CSwdh41mMNtam8PG1KEgt7fblWgkOrZ2nsW86Fvlwy+2tuHIOHV9rVYQH1N57UZFtO3dONxWezqgeG/TgosYvmfA1H7SXPRQJTTcLD609jOitFE22XWyexUKKjQFvkplHS0RF9pAQdMf9bhlVzqAOmzUS6kKtMeUhmobmNuLRwEWVkKSpnD1y29yl8KoziAchsYiDob8phxTmQxlxL0og+/IGUMzobb9x0EibRt67U8d/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9xO/kPhRT3oM3kLsn/mDjwAKWZRwv8BlpBRMgjEvgM=;
 b=TpY2iKRRNcAXvU/q8EC/oB/6v4G0Z5bd8581q6UuerQOz3Uw11N3z5SRI9iN82Q5gby51VeBsPAxPp/gdK/kpWyHVNu8Gu/oO4O8s1qB+622BciE0rCa/e6+zMvTlGPACxx8IkvJah6p514sVheMYclC50qFm4B8lia3ZROwtRjW6683/6fH2T2XZHSw1ojLnIOZ7JSrzaSG6hZ5vhuiVZNXAyKhL6x7LV+f7harFkeVTuj9yApkekciaiHiyzxH8YxqEcDy+K8NUn8TrqFlm4Bze5EbNtLMpeB7sPv419Eug1TFlU3oHvFAY5OJtYaLXPeM68YQATic1x5iqh/atA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB8737.namprd11.prod.outlook.com (2603:10b6:8:1a1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Thu, 19 Nov 2026 12:53:30 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 12:53:30 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, mark.hatle@kernel.crashing.org,
        liezhi.yang@windriver.com, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v3] pseudo: Tell makewrappers the target architecture
Date: Thu, 19 Nov 2026 04:53:14 -0800
Message-ID: <20261119125314.495667-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:217::35) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 291b1b75-4120-45b9-2333-08df463c1c3d
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|261021123027099003|38350700014|260925021311599003|56012099006|261022075727099003|11063799006|260925021911599003|260925022911599003|261022105027099003|261021121427099003|261028144727099003|261026121527099003|261026140227099003|10067099003|261102123227099003|261009223327099003|261009220027099003|261009223027099003|261009221227099003|25016099003|12006099003|18002099003|29003799003|6133799003|261009221727099003|3023799007;
X-Microsoft-Antispam-Message-Info: uw29/XcMuoprDQZtULfR3cAvQLApexwWzPl8jmalk72KzRPEoOUIl6Y4hPUmK2D6AEvSEi571gtZUDlZ3zavCrvJomhAMGDw42tIB4b7/gkfB0MT47Pdske4RvHTMWN7QGMfBNwS7ukaZzCkxSHlSpcBycLY3c0O3tmQZipaucP8KoVpnDuaYyrLy/Lqq3b1iwsHN/2ySYOIEb9QW9D5dvswvvomNnmtFyK5sPgN/EGBjOPHUganbL6TZ1ZlUHtG607xKnEMc/KykZgUTWfOSlA8vGaZZc1F9jbun0ARj9qPRTcMpMAC2VM3hOqkTavSQJw4SPm0EEqfAMluy7xQeyX4U1i8rTK49DTDWvxrx9NLmDMH/DWgViakUKFLzXln6Zl3roNOT1Jxp2ZYM0Hv62kNZss6W3r4xDbGx6aEDkTOr1hxCfvJ9TNShdjx0myB9StohGW5hc9vShxFFlJrmVW17uisYkh4mpjOkJyQTRrGIfu6mcHGvzXE4y5ofkVn3MsHQBl6DGGveRij2SLL7BX2tz+fuFeHn/dI4dmEW7mhIhgkvJsnqvhXHBdc3GC2MYCffv0BE8hDT/QSu43SDTIDEBp99d71VhS0ttrIE32odQ+dtvtjldWPv4UqnCD7PVDz99j08zBo4nW3uBG3KWap5oTYWG6EnQsRHyYFLeM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(261021123027099003)(38350700014)(260925021311599003)(56012099006)(261022075727099003)(11063799006)(260925021911599003)(260925022911599003)(261022105027099003)(261021121427099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(261102123227099003)(261009223327099003)(261009220027099003)(261009223027099003)(261009221227099003)(25016099003)(12006099003)(18002099003)(29003799003)(6133799003)(261009221727099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X0VV9CJfpbB3jud6nX2viY75MohgZKDGAWKi9sJh4tvZONSlzbsRLShW0kTu?=
 =?us-ascii?Q?t74YJ3IH5+FesrhchyrOz/duM6HcyltmuETjjoV0y6IeXWqGMmJtQmR+pyra?=
 =?us-ascii?Q?xyLy9VujWOypcmv9EFF4kaDMFO2k7P9V6m4OXhBAUu5SGdjfFr5qvkTiheKv?=
 =?us-ascii?Q?oDp1HvzF54KfdMCQTewQPk0n7t/oB/2sG4+YbTrU4yGFvwA6SbKiXKf7RCaD?=
 =?us-ascii?Q?zctLI52s2FzJU57mV2THSIEUblNFcAMuN1/vDGeTwbHcELyIUeNAXatgepxl?=
 =?us-ascii?Q?uosQpYJMPfVEajYplVY3Nd4rNG9GxbmqZl9/sXRH+KL3MEtcJ+D3mhpw1CMi?=
 =?us-ascii?Q?4Gj9ifZZpxy5m3nOvWJ/y0Xgyzo1P4OmZ5t2gE9gebBe87lGkAbina7WV6mw?=
 =?us-ascii?Q?Wob6YwjJPZK3bVRgArWPVAQn4FwUro3r3QywNmM1pP1MO9RlEdakA4Y+QXV6?=
 =?us-ascii?Q?PoWqec5qLDHJro9huf6r7F+wjWdla8QKNb9YRSOtoxaBBkLpO4OirAnwCWFL?=
 =?us-ascii?Q?PCSFs3DqCmvgH509sv8bKi25ohV3iria49Bpo6nJiPIfNyq9HoDhsQHgfUCS?=
 =?us-ascii?Q?sJKaOjheMp2t9a2hPDxkD4KCxzj/Bwf7fzoZMkLxWhW2eT/MJ/L4H2+XME/Z?=
 =?us-ascii?Q?X2Z5Aa3m6E7yGGivynraQukAJ2qwOvVeAfFwKhoZQJJqoTYXeXwD79UuUr6T?=
 =?us-ascii?Q?czxdHv5xvyEHKO+Dk1qBcD/e6vWfX425UX2dp93btEvo30Fqg4Qhc9vYRsfX?=
 =?us-ascii?Q?td1KmmP6ELVL0eUoMll7RkdkNCrH4vNAsgAFtZC0QGhNFF/rpttn4o+xfI3M?=
 =?us-ascii?Q?93+Bz+G0CVcTGwY97Vo7tdXCi1jUUwk8lhxjmqxhIL3Ocl29lPwWvjzZpvaY?=
 =?us-ascii?Q?1lOXgQRK+1dlVHTOC9mttJ6ji2YMIK26W8bYmCInG4USOnc89rtcrIzO9tt+?=
 =?us-ascii?Q?TgpZPEdzmaPGjQw2oxWI8B3heUkT2Z/vyFdXQf7qD+kYJklwN55TYqBgaYdd?=
 =?us-ascii?Q?8l1cc48NWNug/TDENcw/rpcZxASk0o+MGHmo8PwdLzI15tTCc6kw9RKpKBjm?=
 =?us-ascii?Q?Hvx6x9RJkEh+GkmE52/KITpLIwAiErkt9+pY3n741P5wB/YmTbIzIt222T61?=
 =?us-ascii?Q?TMgPGKflRpvPbBeTcFRiyrZufg4PcuLTN1QiU204KV3a8kPWhe0lAEaH0dtR?=
 =?us-ascii?Q?BdwBO7Pce73LLXTkROlN41/9z0K6p6b67AasIIXM42gJG1vtHFloJ15SgqxK?=
 =?us-ascii?Q?+CKXU3G6tsqmBnkma6Dat8U6UxgRuTs4hoHMVqLHtMrS+6VdR00lU5BdJJtQ?=
 =?us-ascii?Q?q3bSf3L/bP8T3qrNSQdlu6f/93CKUTEpGUsOHctOA+k0aXwy4c/fF9sJFuB2?=
 =?us-ascii?Q?9o8Cmo+tQOfe9X4mfFi67h1QIhxcwHh8MTEpTZtSsMwebdwjUXt0jCa01erN?=
 =?us-ascii?Q?45hs/2e8bknkqgusfMARVDLTvJIhdVf0z1EyeG7ySFlUGbiWo85TszNh+0cj?=
 =?us-ascii?Q?4k3iDYxx7GkKkGC6oMP2HU5pgcTYrnC8rOAQdjpBJPyMMX4Jsko4Xx8hMOgV?=
 =?us-ascii?Q?FyQqcRyX372TJmLYKmyz8JwHOMz/kvDHwCrO0gkfE8FFtutZe1SxeT7fN8Q7?=
 =?us-ascii?Q?jC+c8CYQonSyaAqvEYmgN6LT1fRJQU1dDdRjTdptYv5xne2tuNCDVAxpWGei?=
 =?us-ascii?Q?U/UmDGr7Oy/LFJwOKFC5Mf1T51H9VZ5m9HGobLnt8Q4mXVEF8lKg0Dl0lPPA?=
 =?us-ascii?Q?DvPXTTT1sLi0CDCO1I+LYwdnw+g9yy4=3D?=
X-Exchange-RoutingPolicyChecked: udL7Zh9W4Bf/PFJ2Sz/blAUnIP3wimAEoZBEyc6EfsNv69v5nLYrvWaLw20nztWki3SRtSc0+DhRIfMlfy3DruqzglG/UBa0wyu0DiVmuOm08PfUWtNR39ajcjJPajkz475tmz71JJHpFmkofb0Z45mUhAxyIeEJoNIsRgRF3igsCJozXxzPBuVw/jrWU1bviCOQX1GR9Q0ZrPyfEqRI0Fs1KSp9NaKNWb3TIHQTN+sDhdoVlDc/K7X6AFJcdr4VGNSaIA1eKk0JcTaPzZosk3nYp44+qF2/ffrYW9FzNGzRKHB1eo7UnNP6dWBmuCOUUbsG5E3FgejXpJSLmP6LeA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291b1b75-4120-45b9-2333-08df463c1c3d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:53:29.8163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3ocbwgQdkne/O43NZF6oh3pv8BNlWwRVx8DDzho2+8wIs2ITVrppOEWF8966eEgivwG/la2FsJ1QwFgP4ulNH5nloSXmefjUihRKNu9YHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8737
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=EudHPicA c=1 sm=1 tr=0 ts=6afef14e cx=c_pps
 a=o74NBiIPioXkFKZqBywf3Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=zd2uoN0lAAAA:8 a=aWP0L8byh6lFeiI77bUA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX84ke01qeWpbJ
 oiho6L3hBbj9u2YTeTBrE7hHVr87BEleN6aSy6IGL797YKEhueA1AhzKQ1xBUvsmi1YaVQTYaIH
 j6BzDMqLRzOWJgN1sXnOiI0wpYmjzd1aE+EMzLahGD+xY0pQjnTa6DvbltRCbzFV4HzNDxxx5RP
 qJkZ0eQefFevR15nF0LIMV1R7zgmn8Qrm6Wac5AX8gpfEMLiGOzaQXbVFX0UdoASJGkbjCJJzy+
 NYgSG/af9g0vpKma5ByUwMn8gELNhFafEpqKniT6PwP6YyKvO+aMhC1QEyLQNzvKdvZhcBVcg17
 GFIHMKNh4GrcTMDfTdmQ1tZ6M2U/yvL3PeHgEfd5XqsLHuKEpYPzuLF8GFm+Yx4iRjLUGboWf6x
 CX2+eJH2NYIwNOv54xEjHhVmr65FksSvh/J5tJYoiY7qDNl/Kbv02Afd/667a1JMgmOmG2XCUAc
 xndSMFG9dbXv5p+sxvg==
X-Proofpoint-GUID: SNzboClHoZwd-OJxBY7Z7luiq2OLrQUc
X-Proofpoint-ORIG-GUID: DVrBIVSN0rsYDUUNnWRUKfCCd9VGWwSi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX8Yoj1vHJCv3g
 ZHR1hpquqCqUARTs3xGgcUu8sVJtUYU8DyLmsYEfFDHkKNfRhq21AOdI6IuACYFNkd0ti3yefgj
 xEZ0CTVtlbvnEBeLe4eoUa/IVW+LhNQ2lH8bNH4RLTTwxd5oiPGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 12:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250667
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

makewrappers picks the architecture specific entries in wrapfuncs.in
(e.g. the GLIBC_2.17 symbol versions for the xattr wrappers on aarch64)
from the machine running the build rather than the machine pseudo is
built for, so the pseudo packages differ between x86_64 and aarch64
autobuilder workers.

Backport the upstream fix, which adds a configure --target option, and
pass TARGET_SYS to it. pseudo-native is unchanged since TARGET_SYS is
the build machine there.

The fix is in pseudo-1.99.1, so the patch can be dropped once SRCREV
moves to that tag or later. The --target=${TARGET_SYS} in pseudo.inc
has to stay.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
v3: split the two configure lines in pseudo.inc, patchtest flagged them
    as too long. No other change.

v2: backport the upstream fix (pseudo 979add3116, in pseudo-1.99.1),
    reworked as a configure --target option as Mark suggested.

 ...ow-the-wrapper-architecture-to-be-se.patch | 149 ++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo.inc       |   8 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
 3 files changed, 156 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch b/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
new file mode 100644
index 0000000000..6bdea7ad6d
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
@@ -0,0 +1,149 @@
+From 979add31166eadc1954b32ff7cb6038fbd171e06 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Fri, 30 Oct 2026 11:56:45 -0700
+Subject: [PATCH] makewrappers: Allow the wrapper architecture to be set for
+ cross builds
+
+Architecture specific modifiers in wrapfuncs.in, such as
+version-aarch64="GLIBC_2.17" on the xattr wrappers, are selected with
+platform.machine(), so they follow the machine running the script
+rather than the one pseudo is built for. An aarch64 pseudo cross built
+on x86_64 ends up with GLIBC_2.3 and the reverse with GLIBC_2.17, which
+shows up as pseudo not being reproducible between x86_64 and aarch64
+builders.
+
+Add a --target option to configure and pass it on to makewrappers,
+which uses the cpu part of the triplet for these modifiers. Without
+--target the build machine is used as before.
+
+[YOCTO #16376]
+
+Upstream-Status: Backport [https://git.yoctoproject.org/pseudo/commit/?id=979add31166eadc1954b32ff7cb6038fbd171e06]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+Message-Id: <20261030185645.765144-1-sunilkumar.dora@windriver.com>
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+---
+ Makefile.in  |  3 ++-
+ configure    |  6 ++++++
+ makewrappers | 17 +++++++++++++++--
+ 3 files changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6640a73..9c6da77 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -34,6 +34,7 @@ BITS=@BITS@
+ ARCH_FLAGS=@ARCH_FLAGS@
+ MARK64=@MARK64@
+ RPATH=@RPATH@
++TARGET=@TARGET@
+ VERSION=1.99.0
+ 
+ LIB=@LIB@
+@@ -146,7 +147,7 @@ tables: enums/*.in maketables templatefile.py $(TABLES)
+ 	./maketables enums/*.in
+ 
+ wrappers: makewrappers templatefile.py $(TEMPLATES) ports/*/wrapfuncs.in
+-	CC="$(CC) $(CFLAGS) $(CFLAGS_PSEUDO)" ./makewrappers "xattr=$(XATTR)"
++	CC="$(CC) $(CFLAGS) $(CFLAGS_PSEUDO)" ./makewrappers --target="$(TARGET)" "xattr=$(XATTR)"
+ 
+ .SECONDARY: tables wrappers
+ 
+diff --git a/configure b/configure
+index 68c9962..b43809e 100755
+--- a/configure
++++ b/configure
+@@ -10,6 +10,7 @@
+ opt_prefix=
+ opt_libdir=
+ opt_suffix=
++opt_target=
+ opt_arch=x86
+ opt_bits=
+ opt_sqlite=/usr
+@@ -32,6 +33,7 @@ usage()
+     echo >&2 "  configure --prefix=..."
+     echo >&2 "           [--libdir=...]"
+     echo >&2 "           [--suffix=...]"
++    echo >&2 "           [--target=...]"
+     echo >&2 "           [--enable-memory-db]"
+     echo >&2 "           [--enable-epoll]"
+     echo >&2 "           [--enable-xattr]"
+@@ -153,6 +155,9 @@ do
+     --suffix=*)
+         opt_suffix=${arg#--suffix=}
+         ;;
++    --target=*)
++        opt_target=${arg#--target=}
++        ;;
+     --arch=*)
+         echo >&2 "WARNING: The --arch option is now deprecated. Use --cflags."
+         opt_arch=${arg#--arch=}
+@@ -341,6 +346,7 @@ sed -e '
+   s,@LIBDIR@,'"$opt_libdir"',g
+   s,@LIB@,'"$opt_lib"',g
+   s,@SUFFIX@,'"$opt_suffix"',g
++  s,@TARGET@,'"$opt_target"',g
+   s,@SQLITE@,'"$opt_sqlite"',g
+   s,@ARCH_FLAGS@,'"$arch_flags"',g
+   s,@DEFAULT_SQLITE@,'"$default_sqlite"',g
+diff --git a/makewrappers b/makewrappers
+index 81d2444..1ac46bf 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -15,6 +15,13 @@ import platform
+ import subprocess
+ from templatefile import TemplateFile
+ 
++# Set from --target=, empty means the machine running this script
++target_arch = ""
++
++def wrapper_arch():
++    """Architecture the wrappers are built for: the --target cpu or the build machine."""
++    return target_arch or platform.machine()
++
+ class ArgumentList:
+     """A (possibly empty) list of arguments"""
+ 
+@@ -316,11 +323,11 @@ class Function:
+             # Strip all leading/trailing whitespace
+             modifiers = {k.strip():v.strip() for k, v in modifiers.items()}
+ 
+-            arch = "-" + platform.machine()
++            arch = "-" + wrapper_arch()
+             # Sorted so that versions-foo appear after versions, so overrides are easy
+             for key in sorted(modifiers):
+                 value = modifiers[key].replace('<equals>', '==')
+-                # If the key is version-arm64 and we're on arm64 then rename this to version
++                # If the key is version-arm64 and we're building for arm64 then rename this to version
+                 if key.endswith(arch):
+                     key = key.replace(arch, "")
+                 setattr(self, key, value)
+@@ -664,10 +671,15 @@ def process_wrapfuncs(port):
+ 
+ def main(argv):
+     """Read in function definitions, write out files based on templates."""
++    global target_arch
+     funcs = []
+     sources = []
+ 
+     for arg in argv:
++        if arg.startswith('--target='):
++            # A GNU triplet such as aarch64-poky-linux, only the cpu part is used
++            target_arch = arg[len('--target='):].split('-')[0]
++            continue
+         if '=' not in arg:
+             print("Invalid argument '%s', must be of the form name=value" % arg)
+             exit(1)
+@@ -697,6 +709,7 @@ def main(argv):
+     port = Port('common', sources)
+ 
+     # the per-function stuff
++    print("Architecture for wrapper modifiers: %s" % wrapper_arch())
+     print("Writing functions...")
+     all_funcs = port.functions()
+     for name in sorted(all_funcs.keys()):
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index ba946ef9c9..d150c8779d 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -33,9 +33,13 @@ PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback --enable-ep
 # Compile for the local machine arch...
 do_compile () {
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} \
+	    --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" \
+	    --bits=${SITEINFO_BITS} --without-rpath --target=${TARGET_SYS}
 	else
-	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib \
+	    --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" \
+	    --bits=${SITEINFO_BITS} --without-rpath --target=${TARGET_SYS}
 	fi
 	oe_runmake ${MAKEOPTS}
 }
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c0332dc9e2..f8903dbb63 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -3,6 +3,7 @@ require pseudo.inc
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://fallback-passwd \
            file://fallback-group \
+           file://0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch \
            "
 SRC_URI:append:class-native = " \
     http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
-- 
2.49.0

