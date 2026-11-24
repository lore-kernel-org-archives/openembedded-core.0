Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13886.1795508828147109342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Nzgsa7wG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5788a914bf=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5Z3XU1208358
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 00:27:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=7EZRBct36
	rogKbO1XcqF1X51e8sOgYSQ35s5hSAv8CA=; b=Nzgsa7wGCeiirUxYAukiA27O0
	MT6+wZLTGdEZiOqUVg/QDgWngDjpBtHA1aZaVQtXbXaVgGAtsZEJKmbw/oT6wGQB
	DYQ11c6LrHIQNSe+t1P/AQGau2JcM2i18R5ciy9V29CW14CniiKh0llpV6eDq7PA
	DgN9cwiQvuMIn5IIxveAFwmJnylBUKM8uEP3R6t0OYF14++T6HwjlwV/otvgqRAF
	pas2jWWY11zrcK3ZIYsBB7XRbu7tN9QWrKbH9RlH6oG9AhwlfSOpxATL3NRK/6U0
	UfwXN5rtipnsKoBPg+6w/M0vIBPyCx+hy79XoeKBjnliKJhQafdijuYuSPLQQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021089.outbound.protection.outlook.com [52.101.57.89])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j516wrcq2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 00:27:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+k8Fg6fYPmXanHirgn3AOQaapEowzm4aABsEYLhvwDljQWboh9co0kqdiSOyWW0kY9Mnc59KEKPyyT7sgbz3xfzLlrNWbJaQGgD9zYDD7AmWAcDrp49i4nlEt/vfIwFOmrYlsFFIuwNAWBalUNGzRJJ/KzX+/ccHhLioRaSHeYbEoaG5I6SwHDsESncFJfnUQYUrhUVQKyckvUVhM3fcOR3sBr0ZAcWOGqXLG4jlkIxISNnXgl/SUa+iPtfx35oewrB/7GvQ1J50e3I7qcga7rowHLeGXBjY9uv0zBplpB5CjdJZi6jZ7es9peiDtw527bju3Uj5pMG3B8IqYdh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EZRBct36rogKbO1XcqF1X51e8sOgYSQ35s5hSAv8CA=;
 b=ESoHsgkaVBm+B1c42wyNOG/XsoK74E601TI6CKfZJxJe7nXXheBrAEbhth7wSL61I11TjAUkoXVfa8k4ZBXAO4DRl3+b8NvIqWo9Gu/ouVdbI3s0Li0QVei7oXGC6f7m2akxfjuknDqPowN+InYkk0IyrOCjHdgJ64O36pjzfiEHlyHtHTJcnwTEtxHiTLEK7aaCuSO8DEG4vtK0xzkh5P8iPSQ1/Rcj0tuwr/hgagBeFtBjGveAh/eR274BN+MaQH9uGzVN3EiPOrDOlOSOX64zQQt+aD+QW5S8nrU7lrm4T1gN/rENpnhN0JsoUgvTQkX77dybAd1fNMOzqlMlxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by MW4PR11MB6739.namprd11.prod.outlook.com
 (2603:10b6:303:20b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:27:00 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 08:27:00 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [wrynose][PATCH] gcc: Fix for CVE-2026-115456
Date: Tue, 24 Nov 2026 00:26:38 -0800
Message-ID: <20261124082639.4060759-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::28) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|MW4PR11MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b2ba29-b96a-49b8-2f56-08df4a04b604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|1800799024|23010399003|6133799003|18002099003|3023799007|13003099007|11063799006|260925021311599003|260925022911599003|56012099006|260925021911599003|261026130827099003|261026135527099003|261026121527099003|261021133027099003|261028144727099003|261021135927099003|261009223027099003|261022113327099003|261009221727099003|261021130227099003|261022075727099003|261009223327099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261102123227099003|261009221227099003|261009220027099003|261022115727099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: bEm64ohB+wSx0izd5rKstplqxK1qacBHLuFAAGzDqc/Dutu74WktoWE6/+b8mSRxBweygWBxvPfocV0YbGkzWnM3Nh5YseEAaui0V9oOrI1gvtWJFImTB40nFb/vSLBY9OB6yi4kgeR9QWMylj3FHk0CtRAHYTXNXvwKioTQtBktXdJ1uqVWnDqkbWQYewLJvxswEa3xkXF4h/Gd9qGxWIDHDZiww3P8IV6qdHzg0/DIkB/yvV40Zoh5gihrWEuwkLfrP7chXze0ELQs/JDZRzu89oExuR83B7brJiK59aA0YNZRC0sVb4HxnlPvTUONBNzBRejX4NKlA83DRU3izM4lSOBJveyiPvqCFesd43ROS8zi6p5RynuqGqGOiILc+NF/c4rFP2yBOLkmRkpkJWahgwwceQjGLhQwl5BitYDOngBPEQ6ooW5cOJG/44giK/Fv0ONXbEa9FrGj8LIc6z7iRVXH9+7A1laQd6/cX95Vxop2zBKoRzRgcAITeLCaMakOlrdilIdFUBjrkfU7lvZxFjz+zIhEbL6aZ2gVGlH+oqXG1tFw2eine70bn/F1noXGXvUzqn/wkhlxpU/oAC84WuIIpjxbmxGwAAC26BrkVeTlKcuwsF1Zkf5J30aVABaXMIIQCfy7+1DUfns7hFljIck86N8LHLCAfASvATU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(23010399003)(6133799003)(18002099003)(3023799007)(13003099007)(11063799006)(260925021311599003)(260925022911599003)(56012099006)(260925021911599003)(261026130827099003)(261026135527099003)(261026121527099003)(261021133027099003)(261028144727099003)(261021135927099003)(261009223027099003)(261022113327099003)(261009221727099003)(261021130227099003)(261022075727099003)(261009223327099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261009221227099003)(261009220027099003)(261022115727099003)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MEr5wb2Lm0umIVacXZ0BmFMTywuYYqKRfemxUMYAsjHfMS+FEMUCwwuXUjbi?=
 =?us-ascii?Q?VA2MTxXUvZ46T4PqKQ/ujydeQda0DBY0d9N/D9OxXnnU0MYTEb1Kd8mRqhTT?=
 =?us-ascii?Q?8KwBk7iq6bgh42pSKBEInwSbDoUxGz+O7MnAlI/JHZHe6+x6f4hIIiCI8dhZ?=
 =?us-ascii?Q?BHgrdpYW7j2toJn4BJeTy4UFcD1NKb1LByi2OiKZNpr6vKW8rdPKlyUq8ILe?=
 =?us-ascii?Q?IJhyAypZA3QR3WefcplPMWqanmop4XK+4OJNimRoG2QhMC9EU/2aISL+DGw8?=
 =?us-ascii?Q?DcaXtjljnesrvg78rf8Vaxjnk6nvpNkuRWxwErVcfQ8QfOqA/kOp6+DuyWtE?=
 =?us-ascii?Q?0Ilc9cHI2GCe3UQ+WVRGSEec1qSJLMVdtBb6XtcWq4SmGK3V7NXBhCV4vuN3?=
 =?us-ascii?Q?QvyRTrPyQP3NS7Ni9C2gtbeUPjyAp9BEtCDndF0mOpViOuT9Gjc01voOb7en?=
 =?us-ascii?Q?Dqs2+pXNYeBS/HVs+8heOcCLBTNR9Kzhu+B+Icjlw3rwLVH8/z4vIv3n/LPk?=
 =?us-ascii?Q?HpvFJWQEvlEH5rcPm3zVBGecLrugpv3hKNcETETr1d773hqaA6kX4RReIz4P?=
 =?us-ascii?Q?AumSCHKIWupdaNblB4i7D6ohys8sk7M0WIsZV1OEaVDKWK+LSsQccRImo15u?=
 =?us-ascii?Q?UYE/90g6gBBk24SFi/CXMzsDUFIwS0pa/tqs+lisKZipg2Jtk2epuSqNqUJS?=
 =?us-ascii?Q?y1OZq1XX8wJRtGpeDDVNuwG//fWdLhoQhyX/mmGy9kKA8ujM71pNhrWiiGzp?=
 =?us-ascii?Q?tj8zv/fPcZkLt6kXtCuRaJLtUDG8QfREmTC1niAuBODs/qAvQlnZg3eznfUA?=
 =?us-ascii?Q?mCdMGcDxuh9K2ihE8liXfE/RJMchZLGtTrCb2MOH6b5eAkHTPLNojsf8ZiSO?=
 =?us-ascii?Q?LY13NOuBmC6XEvuZUJVaoovUk4uawrlbd1RYeQvWDPOw9I+7thxPdCUpbpcA?=
 =?us-ascii?Q?jIOlmEfGDTcxd7ZZD0A9e+Bn6FClnMgbk2MPzRaEe288icpQC4ONjCMIOUfy?=
 =?us-ascii?Q?ItNDl0ZAiPqdkSL38EYyfuFSkafH/kMEOZKUtavuxr0uVeb5fXUAen7kI2An?=
 =?us-ascii?Q?ICGo5dMRsi2bfHFg46UkaJYosQITUZRS6uskDHttu0RX99C6EmGVj+9XpGA9?=
 =?us-ascii?Q?A6o6z5hEylu2yjSNUPoWIIwZ6I2wokpVvJIDbQ1LtaWj9hIrZo9FHRtQq/pl?=
 =?us-ascii?Q?2OwLnpa6cOke+tJghbeEfM9wu7zykjTyD94uEWz3DfD83yxJoqyUbJYtLZEt?=
 =?us-ascii?Q?s1AchBRb0aAEnzjmwXL7hmhAiY9OHviB7emCzl5LYo+BRebAFrXYtgK9Y+nn?=
 =?us-ascii?Q?Au+EdTlGzVDqX3bx6gSWiq3z5SgYQT2TWQVD+Pz7iLAaieXhS1lgS3281A6x?=
 =?us-ascii?Q?whe59UHH1rykDEHpSoqBq22mw0O9GKmJbvT+pyo3hwwctdmZk8+SxDyiq5yF?=
 =?us-ascii?Q?hYh13oh+eORjRai+nzVzs6IA/vxjxymqWonB2DgkNy/va/UGh5Y6Tn35rKut?=
 =?us-ascii?Q?IAZLqERjCYKlrxjae9MJoYsQEhe4+EfwAOUM8z+8i9MVSg5GovTUZ8r1z1u3?=
 =?us-ascii?Q?cZkw5ox6d5CldFTsg3ikJk/zoV6KIAZxXMzTYcYl+crT4iWagXjJ5LVSTEg0?=
 =?us-ascii?Q?TXwurN1rpfUzLS4ItLeKiUvNah+bGzaZMW8tFiCaLVVI8Lzkiktzt4oH9Ke/?=
 =?us-ascii?Q?AA4boncrtJDWjPmGGswqHp/8/eF0Tml/gYsXjuJNRjhsohIAKJeEv6moJfEs?=
 =?us-ascii?Q?1RWEVtS0r/fTyvnhxIdaCZRn7t3Y1Wk=3D?=
X-Exchange-RoutingPolicyChecked: hGyKSmeZaCdovupsqrc3ygFWbuSQIxoUi/S5arj/mHREBIaDhTqaoJIUTsjqTbps0sHerrQfxITMXo37z+IRIXQc4Rgs0CbTH84o+gGwp8zYSW/7XpuV57KIVcatWRyuW1P62VTbMpt3ommF9vaIBw0f3TKpZFziVAdkZwCmqamkucF2e3T+eZ7a0P4gxFQliJ8WnBTgm7MRy/lZUplc3NX+vx0CyUVd/Khrnunab3rSdOhqeVkrJhhAOZ7Bn7UFWw7P9BNQQdxhMK3AzkWorw1alR0sEvdDImynD3vzqxtHqJgWxKMzPVvtuorivEVOv9gMJ39ey93ZUTHZ7OinmQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b2ba29-b96a-49b8-2f56-08df4a04b604
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:27:00.5200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gKOM+9M3ke0O4hQ5gc1mZCmLHawTn4/2R4xqq0kjlI9l1r6w4EA82k26IWUum6ulSFtrT0P4bRtuiA/nkYRJ/xhQRWYc6jILRB/0utXuGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6739
X-Proofpoint-ORIG-GUID: 8PeyuVO3ABVVBBxndHYMV-Mg92dcrtYM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX6LtGj7tl+LIs
 n4EQq0DnV+pTI5oL/v8DXnDpavBfG+NBtM3gsyX8QCZJqhcDgPwZW/5rX4MBN3r6psbWa1MEo88
 oRxPD1vZkkqCvDcEcQifNp/eQrnC1CIoaM4g2dd1JbS7oQdeIAQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX9ZOVY6KPfqHx
 n8cqSCIu00bdl2oftCxfbmuX7Ztec7yYD2SsLn8PcD7F23BxwzcAUQQlh9tWSC+7dVmc2IwRamJ
 Kao2G3p2FyVQ0MOGcqax5HA7swQ4iNivb57IdxBViO3p/09K8K4N4iRTmoqRn/FSe8L5KlJ2zbi
 6C83XtsxmufxXsDT+00D4t6EP0ffdT9RmXzoeVMk5amtBsjv6JuiC4KVLhnbfJ2SI7/VaIa7Fcc
 VRI7BA7LR1n35kR3Wx8fFRIbEfBJDGPqEVMMWClBKnuTHVtb8f0sFo7BmPlobyHzLVQv5kJkkBS
 Lc2Lp/VrpdYuDFKErtpsshbi/mCUXDYxvzgbl8Rx/Z16LulYkUe/hN2UL836MKD+y3/GNf46IbC
 fY8Dix+p3cZBZo16ME+u5U9/6gM2cdymAvAJiZZKiUhT+g9WkCMAVqkTHV4BAYFgaK5QmK3+C+T
 wNVn1vcw1Y2DZ3JNYQA==
X-Authority-Analysis: v=2.4 cv=bofZl0ai c=1 sm=1 tr=0 ts=6b054a5b cx=c_pps
 a=Sq/50nUKxlEOOe6u8VXKPA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=20KFwNOVAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=hN6najDUr4UxPvgtyDcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 8PeyuVO3ABVVBBxndHYMV-Mg92dcrtYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250967
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

libstdc++: Fix std::from_chars to not read past end of input [PR127666]

The bug report points out one out-of-bounds read and the second was
found by an LLM. The testcase was generated by an LLM. The code fixes
are artisanal handwritten code.

References:
https://nvd.nist.gov/vuln/detail/cve-2026-115456
https://bugzilla.redhat.com/show_bug.cgi?id=2563044
https://gcc.gnu.org/cgit/gcc/commit/?id=816c1a39ca9b656ba2d001c7b6fa421ebe44b3a0

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-15.3.inc        |   1 +
 .../gcc/gcc/0030-CVE-2026-115456.patch        | 141 ++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115456.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.3.inc b/meta/recipes-devtools/gcc/gcc-15.3.inc
index ed719197bc..c6695b4a1e 100644
--- a/meta/recipes-devtools/gcc/gcc-15.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.3.inc
@@ -76,6 +76,7 @@ SRC_URI = "${BASEURI} \
 	    file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
 	   file://0029-CVE-2026-102010.patch \
+	   file://0030-CVE-2026-115456.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115456.patch b/meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115456.patch
new file mode 100644
index 0000000000..4a5800bb39
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115456.patch
@@ -0,0 +1,141 @@
+From 816c1a39ca9b656ba2d001c7b6fa421ebe44b3a0 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Thu, 1 Oct 2026 17:39:33 +0100
+Subject: [PATCH] libstdc++: Fix std::from_chars to not read past end of input
+ [PR127666]
+
+The bug report points out one out-of-bounds read and the second was
+found by an LLM. The testcase was generated by an LLM. The code fixes
+are artisanal handwritten code.
+
+Assisted-by: LLM
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/127666
+	* src/c++17/floating_from_chars.cc (pattern): Avoid reading past
+	the end of the input. Remove unused variable.
+	* testsuite/20_util/from_chars/127666.cc: New test.
+
+CVE: CVE-2026-115456
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=816c1a39ca9b656ba2d001c7b6fa421ebe44b3a0]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+(cherry picked from commit 524847fec983eaedca147840ce46fcbb0cd38952)
+---
+ libstdc++-v3/src/c++17/floating_from_chars.cc |  9 ++-
+ .../testsuite/20_util/from_chars/127666.cc    | 70 +++++++++++++++++++
+ 2 files changed, 76 insertions(+), 3 deletions(-)
+ create mode 100644 libstdc++-v3/testsuite/20_util/from_chars/127666.cc
+
+diff --git a/libstdc++-v3/src/c++17/floating_from_chars.cc b/libstdc++-v3/src/c++17/floating_from_chars.cc
+index 9bad12c7f69..9846784c57f 100644
+--- a/libstdc++-v3/src/c++17/floating_from_chars.cc
++++ b/libstdc++-v3/src/c++17/floating_from_chars.cc
+@@ -452,13 +452,16 @@ namespace
+     // fmt has the value of one of the enumerators of chars_format.
+     __glibcxx_assert(valid_fmt(fmt));
+ 
+-    string_view res;
+-
++    // Fail if the input is empty or starts with '+'
+     if (first == last || *first == '+') [[unlikely]]
+ 	return nullptr;
+ 
+     const int neg = (*first == '-');
+ 
++    // Fail if the input consists of a lone '-'
++    if (first + neg == last)
++      return nullptr;
++
+     if (std::memchr("iInN", (unsigned char)first[neg], 4))
+       {
+ 	ptrdiff_t len = last - first;
+@@ -490,7 +493,7 @@ namespace
+ 	else // Only need 4 chars for "-NAN"
+ 	  len = neg + 3;
+ 
+-	buf.assign(first, 0, len);
++	buf.assign(first, len);
+ 	// prevent make_result correcting for "0x"
+ 	fmt = chars_format::general;
+ 	return buf.c_str();
+diff --git a/libstdc++-v3/testsuite/20_util/from_chars/127666.cc b/libstdc++-v3/testsuite/20_util/from_chars/127666.cc
+new file mode 100644
+index 00000000000..25989f2cfee
+--- /dev/null
++++ b/libstdc++-v3/testsuite/20_util/from_chars/127666.cc
+@@ -0,0 +1,70 @@
++// { dg-do run { target c++17 } }
++// { dg-require-effective-target mmap }
++// { dg-require-effective-target sysconf }
++// { dg-add-options ieee }
++// { dg-additional-options "-DSKIP_LONG_DOUBLE" { target aarch64-*-rtems* aarch64-*-vxworks* x86_64-*-vxworks* } }
++
++// Bug 127666
++// std::from_chars(first, last, long double&) reads past 'last' for "inf"/"nan"
++
++#include <charconv>
++#include <string_view>
++#include <cstring>
++#include <sys/mman.h>
++#include <unistd.h>
++#include <testsuite_hooks.h>
++
++using namespace std::string_view_literals;
++
++// One past the last writable byte; the guard page starts here, so reading
++// at or beyond this address faults.
++static char* buf_end;
++
++template<typename T>
++void
++check(std::string_view input, std::errc ec, std::size_t len)
++{
++  // Position the input against the guard page so an over-read faults.
++  char* const first = buf_end - input.size();
++  std::memcpy(first, input.data(), input.size());
++  T value = 1;
++  auto res = std::from_chars(first, buf_end, value);
++  VERIFY( res.ec == ec );
++  VERIFY( res.ptr == first + len );
++}
++
++template<typename T>
++void
++test_type()
++{
++  // The inf/nan forms used to read past the end via strlen.
++  check<T>("inf"sv, std::errc{}, 3);
++  check<T>("infinity"sv, std::errc{}, 8);
++  check<T>("nan"sv, std::errc{}, 3);
++  check<T>("nan(1)"sv, std::errc{}, 6);
++  check<T>("-nan(ab)"sv, std::errc{}, 8);
++
++  // A lone sign used to read one byte past the end.
++  check<T>("-"sv, std::errc::invalid_argument, 0);
++  check<T>("+"sv, std::errc::invalid_argument, 0);
++}
++
++int
++main()
++{
++  const long pg = ::sysconf(_SC_PAGESIZE);
++  VERIFY( pg > 0 );
++  char* const base = (char*) ::mmap(nullptr, 2 * pg, PROT_READ | PROT_WRITE,
++				    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
++  VERIFY( base != MAP_FAILED );
++  VERIFY( ::mprotect(base + pg, pg, PROT_NONE) == 0 );
++  buf_end = base + pg;
++
++  test_type<float>();
++  test_type<double>();
++#ifndef SKIP_LONG_DOUBLE
++  test_type<long double>();
++#endif
++
++  ::munmap(base, 2 * pg);
++}
+-- 
+2.49.0
+
-- 
2.53.0

