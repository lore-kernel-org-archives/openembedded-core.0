Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5696.1792565566237199529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 23:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U6MeiOXG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4754a97a91=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5itrl3498112
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:52:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=6hTlCzOVw1Y9750IMTAT
	37zKHNXW+TWIz18DpVFoM3E=; b=U6MeiOXGZVbFiTe/Srki4OJbwBsLFSRuMZpk
	4Jdrwe1nFeOsGDjujwsAhQxPwtXkCURIZ5B4HFI4dPlJBvPgC0kZlGJQBwHD99wh
	+MKcEupNDRJDB3nkOCaCezQeVxHMkJE7Qs5QJ6pdh8jcNc++biGSLlO8ECcq++aM
	JZLKQQyZCICr18Tb8/vwlpc6WCoJF25n/pDjuYovHa8nj0/J9+Gk0URFpH7BddDk
	D27jd2Ry88eCz+dXeFg4fPoU569Y+2L/a3FFDo6i5NeQ2DFR0VBMGx/4tzHrFijJ
	xDg9jI1/iiKrzG/r+QGDQbswS3slKXk1TaRRRuI9D+KOYJEf7A==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022087.outbound.protection.outlook.com [52.101.53.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hdw66a8q9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OD00mfD2ykxnnZQaSUO8EU9sA8Jzg3aKPbX2QS9AZYX3y6xzFbzjQDk5WW3/jRWOUJtFNWngxkwHd+sIdgvfDGMdq/KjPBPAndUMNrNzTChJXthEh1qwUkbEbyd/Xfy7IC5QNhd5xG09/48Wnf9pIDiClwW3eIH8g2aGghAmo0876PZy5xXJ5ob/VhjwJ5hQMWvpWg+A28vFbEi5JSnPI9x2Oz2FG12cbL/9vQjJaUK3s+ADva19+AQSIyRUIUjTZIoOp0otsrdn4kPyXC7NyMxxN8Zh4jqwLgbmjumB0pVRGgdB0PN18qKLxJAs6/30w+/LEXOLjlR1oZ9J0HTjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hTlCzOVw1Y9750IMTAT37zKHNXW+TWIz18DpVFoM3E=;
 b=bVI2rncki8ZXWNyfa+vwNsxALkfiEMGV1T9q5RDmN3NkswKqTQnolnKnYETHEp9IusXb3KOl6GtPOmLl/W4HyYEquDPpZIHJ0PHyE70npAHEhpw+/OuJNdfTI2j63xVfNdi7BYNm9RbU7RJv4vKXMg/xy+v9eWLWuxWFeXflJ3lxPO9D/0Qim9+hii1uEQa11AHfgRGZu4AFQeLyRaftAxhGLl2e/e+2kCaaEJYIiHC8jMdd8dknz0UyjQx50QiVxfqSGNeR6Cq2ImrjyEwkY65vuDpplcXvOaNafrmSCi9SEgc6ZqmfjO5y2g89tkF1F2ddqYnIY3GFGvNZR1JVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by CHBPR11MB656690.namprd11.prod.outlook.com
 (2603:10b6:610:40b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 06:52:43 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::bd8b:e175:4855:9e44]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::bd8b:e175:4855:9e44%7]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 06:52:43 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libXi: upgrade 1.8.3 -> 1.8.4
Date: Wed, 21 Oct 2026 12:22:21 +0530
Message-Id: <20261021065221.2964406-1-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0156.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::16) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|CHBPR11MB656690:EE_
X-MS-Office365-Filtering-Correlation-Id: 61adb887-18d8-4579-f3af-08df2f3fe7f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|23010399003|38350700014|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: yJ+80xXaZXRfkL+DJn35GdkaeGVqTECi9CCo8eKmgH286nEJIXonf7NskgTw4LSmntaSvgJTu6KbMHNf1L3xi84+5TpPugoJOAAXyE1/cWxe/DtyNMYlyszyzcDkyVn9ElssWIDWCbliwmHGOV0BhMaS0epa7RVEHksCnrT2ZciuAml4bi4+hiIFcjKxEXlNsayXmVdJhNC3p8VWYCo/x9nqQJadLvjvMQDI4Cv+IfU+fzEQY9dKw/lFsMRU+xJefH5nmnEqSnXCYlvnK/+Tk2+6Di+24BTnar9iMppyutn3ghXWwCd112BN/gBCYKwzevZ5JfYHRw6rr33hkRCEonAgaUYETNbcXFn8WBd9da9EieMVHHuM33O3ecdDSKeBwaDVAAD6w5ynyA+MiR2h7FhpCRhqWfCTbzZAIU6/SKJF/yDMLCugQzl7CQxsI+fN1I3T0gpb7ArTRnZwOP0rnfc8qB1oght4vasn446EOjIRxVyQb1vtHWY3gG2gWfPXqaKisB2wvOjSNft66oemujyIqtr5wbvtwTAsVM2Y6jv3EvNV8PsunjEAmyEjgFjw+dNE1qXx+BS/RjFkS7Ib5nmoxQFA4hCvt3BR6jEZ4Cd8pGL1r3Uel+4PbF4cNFCB5Pl/LPAngluIWugRLPwH32Rw7qUXMQLMVnOAZXiQUA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(23010399003)(38350700014)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?03sxAuqauPKnDQQhmky1Z/FiMk51I24RfS+zZwgMjswx1nuIZacuhFqXtAk0?=
 =?us-ascii?Q?N8+s+pF1gAPkQMiYLCWAqdKi83P+1p0yfXdazK7F1FVDwnBb0A5UKusETqSn?=
 =?us-ascii?Q?T/JwqtKGLI0QdfQNflxmrDboxYVxokkSKlW8LjgcnP8XxW+9AQlO0nmjl9jo?=
 =?us-ascii?Q?9+z6Lc6M3cqfIzqxrVACOqSJOnyVDPiEmEVHk4HWfPqRMSw/tKiHTvDS9r5a?=
 =?us-ascii?Q?owcc5NJ1gBUiu3mqLXi4rlesOamrVnuJgOBqXzz1IeMpY8ilNi8G0lztfiTQ?=
 =?us-ascii?Q?RtrFgrsCowG0zvZeB52MOb0c0nNC5nZWkRpeO+lH4E4IJ+8l2HaeTXljfLiu?=
 =?us-ascii?Q?VmYqYKYLzuuKtFwFcJXYU+LbqYTE2b6XIvDzg9F9bg0fl+rrbG2flixqWTgA?=
 =?us-ascii?Q?pW4TyXl/S9ZWi6hLHm9OdtolOf3Mk8vd6fVpnTN2Ve1LIjsWoRDRJRr9I7Mv?=
 =?us-ascii?Q?bbi/cEgW2rymfNPh4n3dBul2uDYV7pLi9zUj6Wj5dfxZwD3U6rJhyRo/STlG?=
 =?us-ascii?Q?k8UFcNP7TnJWahn0LD3JCzIwpeVhfc6dIVj9m5kzkozabK4vAjPqem0kfwd1?=
 =?us-ascii?Q?Vq5eSC9Mof0iLRS88G5WMYPO5IJ4V73sD9J3g6nZC3UNd89WDVeFy5J4beSZ?=
 =?us-ascii?Q?LIEHonQpIMWTxYaARBOXZyZ6LTseX3ecsDZkui8r0EMjYY+JH+WWxe8KT2p3?=
 =?us-ascii?Q?mjNBb2ekja5escEJ5bQxJOcbZHiGw/wB7kaQZ8+nRGi1KC9flEkezwqR2oZu?=
 =?us-ascii?Q?9Zt4Re2m72tjNEzpCSgDOXpwDykmQn5IX56jtnJL8Gfx9kYhaAm7VimYKSBX?=
 =?us-ascii?Q?mRh6+f3TpLKMw+k3rvgOiy1s0jSzZpMcLcpn3RRCgK4I5/Hhchb/AKd3HBF/?=
 =?us-ascii?Q?5BUDF1T2TGS/bfVx2qEy4MFN1XH2x3Epi83a+iddyMCS/reEWWfLpQLyDLuo?=
 =?us-ascii?Q?kYdEOaRggNveucS/KlglaizimSQ2cNSurM7kLi3TwF/nNqp0zw6vuOqCnoP6?=
 =?us-ascii?Q?pZTXMf4Wops2gW91WXfndAi+rguYoCBD2YttV/w/74ur6TI0YjlAaFmeudb9?=
 =?us-ascii?Q?9JfRNnuI+vIuTQWeYTAkO7rcWThz+QKOBmAeVgExPh3nqRxvBXjxmkVoo+Tk?=
 =?us-ascii?Q?4I0EpVcREdT8X/jOR/wJ17gnVAzQuLTHLtGNT6V+D4dPqNH6SNqzw+/f1qtW?=
 =?us-ascii?Q?NwYkyVHl+aTi6KRqNxJq9btOTSZVvP2cMtJ0c5EuSAQDiTpoRtd2Ip02TWLL?=
 =?us-ascii?Q?tSNIyA03IEHI081TTUjL05ABp+IPrDW8MEybEUt0BMeBMpvXI6h+YjQXGGUk?=
 =?us-ascii?Q?CvN3cy/B7lrzXuIkVbU57vcuzWSiQy6mC0Ut/D15IMWDPAz2hC/FFakWzaQL?=
 =?us-ascii?Q?NP5jshc6a0wIwdGrvJ2r9fh2k3iS4kCeKzWLudKE1J+jq/GQHMdevUz4vPOy?=
 =?us-ascii?Q?cgs4GZEc+uDtAL+n1bpNtyD7Lfsn5bPnm1aOX/lDD7mhsrIxyXC3Y4vBKsvZ?=
 =?us-ascii?Q?tXfkIyrGkB/HQplFFsPTxGw6997abprLu6AExL+OlzYukK+PN9YOcJTMlomv?=
 =?us-ascii?Q?3OdpSQp25B96vKrCqvLuMeZZEkdPEt/PSIeIDUO6fv8uPz+rLhHR0yAOzVcU?=
 =?us-ascii?Q?hoPBqjCyHEfPqc6ee03EHBZO2J+smD+34D0dcmS5jXaoexxI++7joyIqehCd?=
 =?us-ascii?Q?AeHYzwmON/4HN67/JxBTKxDAiWwMwB0lGpnbk4jn0sElrnUcWMo7d3VlQBPa?=
 =?us-ascii?Q?YZ3YLp2ccyn9gELJqbvVhb3rEgw1NMM=3D?=
X-Exchange-RoutingPolicyChecked: CONAC9ExnBkFW9hiTA222GK/+D4UwDeUKUJTeUZSX4MithVpUqE68tFG9EGHmMSb9oe4NZhikE+gvXpsvyNAZdVI9ysdu/CugTiZdUCU6xYEf4Hz6jnN5I3SThbwrM+0JZuMm86g0VUXM5b8oeFBFKl2KahR0thgjRnbkIKkhxhl6EohbuQGfOg9X5vqNQLTsVLui/AOxSaIyRN83XVhuVfYHrXrFMXmDh1sKyAyY+FWCNSCeqg9uKIGlhr8CWmAXLn9CQLW7uPbh/DbeZdx6LdqDc7zHrTMcPetD/7jVUbN/9kIuX3uCyLw41TiULPVsV5sEHUa0fK6tuwFXVp2BQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61adb887-18d8-4579-f3af-08df2f3fe7f0
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 06:52:43.2551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O54UHBAJTLr6UB2U1n1inH9Db44TZNVuvADyG7Jhrp8E03npogp/9RSBGGGM3iFnVcB2k41dpNp4ZeXZXhTXH4DBse12sziJk6kjnnLPPqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR11MB656690
X-Proofpoint-GUID: xVefzXgmbI78EViZCV9aihoR4ukaii3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNyBTYWx0ZWRfXxyKnRC8K5Or5
 A4GUXIc0PYaYtq/UWu9XBvQOC7hnoelkdl4w8uFiBUxC/wh4FdB0hyGEzl++zZ/JF+zIDg0YEc6
 IVx2g/405I3fON9AXZSEB+kzDpPPejYPGs23FYREgYwI0kvaKM3bRMEXcinAbqaZwMkxbK+Wn0P
 RYEkUtBADbIkZgHXGPdiQZo640oT2N/SwXIHxEbnW78v9uaCha6AniZKEpwDFfzlYZty/X5iAmg
 f0jNb27gvwvF6ESz7Qp4tEI1msqu5cAHvQt54avUTo+JptaAUwPRaPsmiON3TyFzZnnzr1j3uLe
 xTeXLCa3dmEblCIrQ5i7U4NqCR7qi5K6CzNroe0siHftxcUXNavlhRI71joLdYC+s7IXlnyemeT
 GVyl2jJ0oYeFQxrDezeWgIonvEhAc6mF35LCXFlmVEZSE6Vkkgp81HfF5skmMqN57BaP7fVDZKd
 5qskAhTadSAcbz1Ehpg==
X-Proofpoint-ORIG-GUID: xVefzXgmbI78EViZCV9aihoR4ukaii3J
X-Authority-Analysis: v=2.4 cv=KMXPn1Fo c=1 sm=1 tr=0 ts=6ad8613d cx=c_pps
 a=w/xsMB98MdRKPpKwYm4Ziw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=aR16PxjQAAAA:8
 a=t7CeM3EgAAAA:8 a=1Re-ZVLcoKOTGUClP_IA:9 a=zbFvvTOBjyH4ze5LlUjX:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNyBTYWx0ZWRfXxQ7ogFLmginL
 0lC9oSCc4mtm9W0sgEFw+1lhLTfKUeemaRf9KnYKxCwVfAmeyYkubajYiHRg0RSpMmtYJlcCg7y
 rtPaMfDgLROQQenDHVA0qO8Vb3hIa85NhnGcmNCGbwOXL6P+jwXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248364
Content-Type: text/plain; charset="utf-8"

Security and bug-fix point release;

Fixes the following CVEs:
*CVE-2026-93541: Out-of-bounds read in libXi's XQueryDeviceState().
*CVE-2026-93542: Out-of-bounds read in libXi's XI2 class parsing via size_classes()
                 and copy_classes().
*CVE-2026-93543: Out-of-bounds read in libXi's XI2 class parser.
*CVE-2026-93544: Out-of-bounds read in libXi's XI2 XIQueryDevice reply parsing.
*CVE-2026-93545: Out-of-bounds read in libXi's XListInputDevices().
*CVE-2026-94281: Out-of-bounds read in libXi's XListInputDevices() class parsing.
*CVE-2026-94282: Out-of-bounds read in libXi's XI2 enter/leave/focus cookie conversion.
*CVE-2026-109089: libXi XGetDeviceControl Control Type Mismatch Heap Buffer Overflow
*CVE-2026-109090: libXi XGetDeviceControl DEVICE_ENABLE Heap Buffer Overflow

Reference:
https://lists.x.org/archives/xorg-announce/2026-October/003752.html
https://lists.x.org/archives/xorg-announce/2026-October/003754.html

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../xorg-lib/{libxi_1.8.3.bb => libxi_1.8.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.8.3.bb => libxi_1.8.4.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb
index 240215379f..fb89e3e526 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb
@@ -18,6 +18,6 @@ PE = "1"
 XORG_PN = "libXi"
 XORG_EXT = "tar.xz"
 
-SRC_URI[sha256sum] = "7ad60056f01af4f786cfe93b3a7707447711626fc8da2637bec71a90409babe5"
+SRC_URI[sha256sum] = "ddd6057b89a91903bc2f884d55c8467440906945e482c36547260dff28661afc"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.40.0

