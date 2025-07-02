Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A153CC7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:29:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17993.1751441357796163810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=927864f6e4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625QxPE028073
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 00:29:17 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2088.outbound.protection.outlook.com [40.107.100.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm3sdn-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTNN+TaZm+/y/e58Sjgq/DE8R6dXLzvJ+cDSGgGtHjwq5Oi9JUtF0bFwkBMGuNyucaPlvH2TlngZSw39mudY8p6jNOK34QtWGP4tHd72X61fzLmEQmPjZS7MGt/LKsvQa0MoCY1+Fuyi4QafYKbATgblqx9GcdgYubDauDlOGme7HhgYKWeD7YwveU68GnPeY+bxFxuSdnV/8hiNS6ZzO8VVBDISjSu4P+TWph08Zz+5wl3v2VH9r+zjvzwk9ttgWHWMCaOk9RdLscistX6VNt+uuqr+Ymq0SQQz1fyLwISPaFaUE5uI9KUSPEU/koqMZZ7pYOhn2haEWlGN9tIpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4KsW7HUbMpJUs4D8svXvgKRyiD8znqO77QkiLndWho=;
 b=Hl62tio+yIQZdI0BxVLToNqI7cixa2QMAun40CoHVLCel5HzLV2X/gAIBHbYTJdjVza312GR2ESMClW0eWllAgfBXVGTDkFj88eDiu7HNoZNAAivLxyv7jvK4mMF1aJ504gN39mLRSBaWzvkKSdkNGv0/b6jUG8ckQ2RgHJTOh6qzv5t0lSvrGG0uMtjJfIUU3jsPFrCiEBeRiZs1JB/ukShOfpgBGw6Yboa5uLve6P5Jww/b/hx5uEa5ycXkUmw5trad+L1AE7Z9BVkfaVXKFW+wPQmqiTnJLByaS4eMZQ+QHeeirBr+mPb+NTON/QNZt+sanMS0Pb+3KbX9c1tBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Wed, 2 Jul 2025 07:29:15 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:29:15 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] libgpg-error:: drop -unknown suffix from version number
Date: Wed,  2 Jul 2025 15:28:53 +0800
Message-Id: <20250702072857.1267224-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702072857.1267224-1-yi.zhao@windriver.com>
References: <20250702072857.1267224-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 086a69bb-199e-4887-1f09-08ddb93a25af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kqZCqzbWYHwErfSpaCOOOEP1hbAJ9j218vr+X/oMmmUnugTqNlpjqsj2qTPP?=
 =?us-ascii?Q?mgaviPp1ZgQqxwfHFBEAXcyu3BFMejIjg2QhyDDcb4JDx26E9m2i/mSQqqOA?=
 =?us-ascii?Q?1uTOwRwmPh0CbW8oVRD0MCKQRjaPAJ2b/jQW2t5HM3a2wwTf6qfovPMtpQ55?=
 =?us-ascii?Q?oWqoIVcAkCZKnzBIF04KGo2U1eiqe7q1mOR5BPAPoToFB/O/IOspNqwPlvW5?=
 =?us-ascii?Q?mlc59E4YDJEpUMZ+tbOb7V8VnntfxDEnUv66OtV3O5N7Fv6tR7Zp4f5Z+kuh?=
 =?us-ascii?Q?5Lep9cCcCfRoy0Eg19NF7RPYdOZZ7IMuSxIavi9qGcHsfn0Vep3CRZu/cA9T?=
 =?us-ascii?Q?9/Fz9hOGkSwaG0aZmxiNaRMEtk4pukaIFG8pyqcRWd81eVqw1MqR8f9szSlv?=
 =?us-ascii?Q?FrF73DwYYLhFwgO9+yS6mhHYp8w7c0GyDOQfhMm/9kuABdDy94Nd3BgXGfP7?=
 =?us-ascii?Q?o/wxtWvowX7lwYpYULFu1UeMRRSyRKuG8L6vJ+x+8cOOAaWRYWZ8gA3/3fHd?=
 =?us-ascii?Q?0Fo2AnTW9tuRZOxPIh1eDRGDpknR50VDrihsELqEUXrVS/QntUX8joPpDcrA?=
 =?us-ascii?Q?bb7XhV/u+dLyPX4h7arI4A/l+g7kI8B+kvrS/T37+fqQglACMvxSytJg9Y1p?=
 =?us-ascii?Q?3AZoriW78DV28aHe7z2BEX/6PI5sZj5V/zB3bqk9b22Ys8LA7sQu3/oaXpa4?=
 =?us-ascii?Q?jeNur5O9h0X/Ry6fVJ9LUhvJBJApbAZY1gYY15V0ygGJYoz88WBVKO3l0zOI?=
 =?us-ascii?Q?EtiUfLSCbGx8ueIYAk5x2OcvTeg1G9sHu974bxiwnylcKiwGJH+SvIQukckA?=
 =?us-ascii?Q?MsnOL9/VtXnVnZcR+nhUGUkET6voyf22uCoNu5fBLFblLNlxtXWXu3HuvLD6?=
 =?us-ascii?Q?7LJqesb+Heq282P4jb33IbEiqm1b4sOVI6nmDhXl6YFTI8jjAEcBOGhq3Yk6?=
 =?us-ascii?Q?s2rTvQpgV1huTUu4T3RzfiHpPZZOAkjw/5O5Uwa31T1r+JLLfyD+hVrx8/fu?=
 =?us-ascii?Q?rFGZ0MN1WsUUcM4Ew4Mtc/tWicFYcHKBGN8y5jIu7aP5YVEeo0I1W3YrrMxW?=
 =?us-ascii?Q?2naq0ih7dv/0hrOMi9mDIMInXVDb6k152SpbdJrING2qjGEvRJ0qXI55kmzf?=
 =?us-ascii?Q?z+Org93fhe+qImZDb/ZYNfwa1INNfsrij+SkwgtOXm4wpezKmsmz5ofY8Ie2?=
 =?us-ascii?Q?xze2l1ukCMBzmw+/UQdkneUw4PdDGH5FvfRjAfrfKznsiPN4MpDorCuCkHVk?=
 =?us-ascii?Q?IFp/pCcpk6mtMD+/mTZEQW5UkPBNNUNLG2EZ5Fo4a5zmlmTidgorL0SooDns?=
 =?us-ascii?Q?HtArSCD/QG+cO+x3llou9pd4AZA8jTh68u8lrTbrHSxLsiu8fX2fCqvjdz4k?=
 =?us-ascii?Q?NRcjjPGih0uHech7N549eKegK+jEg+aKfa8XVEzbg7SxyucRH2t4QYiaGVHc?=
 =?us-ascii?Q?8vSYbDzWZ6umYBB2DPEVngizNlg1S6kBg7zIbg4CZK05IGW0ApQoUg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0BmLazcNU268asUlhs1aL961MmfNig2fszwlc4AOUbMxHQkDtc5BTHVe0kgJ?=
 =?us-ascii?Q?1BBuswWfbtUnwJEqN3U0qAEsThS1hwo+A/eNJjz/fptSLvQw1QoSuA12ttgP?=
 =?us-ascii?Q?bQTGxpQ7EChfj4vXrIPqBSv01T+MOseyKbSMp2HeBsf4yQe2Q1J+q8jM8Pl+?=
 =?us-ascii?Q?9Lei6j0Jl5LlVQ/aLOAeAWoh/g0XyVxqScBhUfn0nBjxOCMtGtEES0l0bazd?=
 =?us-ascii?Q?Y7aA8kZr6ZrUgN+PAZx9vDOhs6WAjolAO6ktEhj1ts+0tcyF9DHwzZVfGqGV?=
 =?us-ascii?Q?n3fdOCSbuQWAH7mUFA0XwSCf1a0pFp+Xe7f0RUsTYVOvvud1HK+gZGf0ExqO?=
 =?us-ascii?Q?bY3C0ZoiPrgmDQrJJTJ5mVTry9pxGv1wlSkxDH3c5JgQaVc1L9fWJ2ZJWvsu?=
 =?us-ascii?Q?nICkuPcG31VkqzoUuBvfWiKKJkAvBui4P6C6PBQGOd/MSPZXyYz3atKJTvep?=
 =?us-ascii?Q?B6cWZaj1RwWNaTmPmSA7CfCQvoaU4q0Gtmbtrvq4twBDoknhGOw770SXbLtp?=
 =?us-ascii?Q?k57YBmB6HD32XCv9jvJZEH0U/YZeVzUiNW4fNFY10B5wEBMhQmAF5oXsDG9X?=
 =?us-ascii?Q?YXX7QYmkfAWfb6kwlm6zTckI4oWP4SmkQHliGM1A72z/ZvkvLNn2IvxJ7cWy?=
 =?us-ascii?Q?bhhnMNzCYdLWzpiB39d783wcVx+jZHfEHR6mbDzmvQ6ToFccmTv3hq1jeow6?=
 =?us-ascii?Q?B7x4pkfBFEXILGMBq/9G7/5mv2/hzLh5EdqtPMtJUhifScUHj0g1a9vW9a2o?=
 =?us-ascii?Q?9XBQUa155wohr2zpwVeg0OLulCKI9U3dIdy8C7h+H0UIR1Hfe634QIiJX8bv?=
 =?us-ascii?Q?bp8CUhXF+imy3e+OojujjBJwYeYgO7NODrKfKMvJYelvAGj/Q7Sv4ekaX/kp?=
 =?us-ascii?Q?lY6QdR0sM7rQoE0QZxUT1dLQnL9HGv8qTfsXwsea7tBe34MvJwXt2J9nq9DQ?=
 =?us-ascii?Q?YXMl76ebXF25liiP84HLlISb1NBQ6CGVA+mb7GMbkzZ0C4PgRkvX/exx0tUl?=
 =?us-ascii?Q?mcFAl/euEhSAG96vtTJKco9Q0c+UPvDSx8prMvZc/eZDmO6D0U/32HKuK8f3?=
 =?us-ascii?Q?wrdBpXL9AXmliUOMrJeCiHyBaJMVIWsCC6H4lFGLZl8mJt+BbQuDtmkyzlaY?=
 =?us-ascii?Q?6YaMmCMTv+wK1GvocJZgXnrnbfb2izQruL1hGlSJ24/HNy3AlMWkIGzHHAzi?=
 =?us-ascii?Q?BmueilsPxeeu5neWqFZru3JDYBIJtMVIGN6uy1urnpk5qbgPO6DSBPRpbFwG?=
 =?us-ascii?Q?EeJK0KfacQjGio2quiEohrgnDnt4mLCuFSlcWHBdebmjVwRaJ3sTY1q8IKjP?=
 =?us-ascii?Q?/sqghwj/b8zBM6qftPlOO+eeZN0NUbOIvrrD/TaMV/CTiIknp7rBOHvKfQPX?=
 =?us-ascii?Q?wjWjD8IPZM8zSghaMeTJqySWgkuG3GMFvnRGhEvVH0LnILx/kyxJNB77gY/u?=
 =?us-ascii?Q?+U8nV0dlkd1srcff0lm+mBLXcob3/Ips7chtpsnmSpbCZH03l10yWXjUWpKl?=
 =?us-ascii?Q?+1ceYpf3cUJfNbXKQQOJf2akn1evTO4JhdZqDIWtJ4zQYeschuSqQIYLL42D?=
 =?us-ascii?Q?CNsfyIABPPUq6Tw6CKcIaHQzjdylnMIprsf9K2Wt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086a69bb-199e-4887-1f09-08ddb93a25af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:29:15.0766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4T8NA5l3DytkfNpS+2z4C7Iy0Mc3j5bx+q/9flfJghzdZPSFHMPP6JqH4McQo926weZwnpPEuhZusnYxk+VpNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=6864dfcd cx=c_pps a=bXIISpLe4O+zW6xWAQB2QA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=kdqOXoPNbOZXdu_Km-MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: x2myOEgmVX3R0fblS5dL9eMncqIDowp4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1OSBTYWx0ZWRfX3djpzJzLU5MH bUx1YEtyVndNsgCB3Wadoq5C1kZuSTRGOR72ULmauHBp2o/EHoRrwZRcPJDgEC83On0KIv6NaVm 6oIXmmfV1U4ssdS0DkcQI1v/1HempmKNBMCkpKlgONTJ/RRAdpiR5tuXY7WTdm/S2kkBKiJio4D
 QAlkp1hfJcRRoRt7sO/jxzKtltmIaYU3qs4iCkWP8KCUsqRIB9or96DaouYirctYghhAuli30SG aeiwDovKhH84OwkU8j81TUCGZh0ZcV4HLigKyDzBGieZwesycpuuAaZuSRviIIM3y32IqLaYvz1 5cWGEOTjUARrsenirZz4ZwgE4dSccaP5Vn/bEYeQJcfLFdH1KqLqzq5b3W4lc2JbTYewbtuJxNK
 Mp5ZvSpHmC+wsle1oEDi5ieI5r3wqvsvaj+RUy6ganieaJyrSqTYXsuA+lC0o9e3rOmM/K17
X-Proofpoint-ORIG-GUID: x2myOEgmVX3R0fblS5dL9eMncqIDowp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=665
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219795

Include drop-unknown-suffix.inc to remove unknown suffix in runtime
version.

Befor the fix:
$ gpg-error --version
gpg-error (libgpg-error) 1.55-unknown

After the fix:
$ gpg-error --version
gpg-error (libgpg-error) 1.55

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.55.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
index 842f54b0ff..7de52314a4 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
@@ -25,6 +25,8 @@ BINCONFIG = "${bindir}/gpg-error-config"
 
 inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest
 
+require recipes-support/gnupg/drop-unknown-suffix.inc
+
 RDEPENDS:${PN}-ptest:append = " make bash"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/gpgrt-config"
-- 
2.34.1


