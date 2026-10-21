Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5823.1792566216438679250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 00:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C3+HKDTe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4754a97a91=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5imOB3497997
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 00:03:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=6hTlCzOVw1Y9750IMTAT
	37zKHNXW+TWIz18DpVFoM3E=; b=C3+HKDTeXgnLd13NC4GRgr0kaLE6YGFd/9d0
	eqm7ZACpUglvGGK6EOvBU8pf03e6PjicKcO2Z9Ez+zQWUlRqjrJ4suGPbOw07LtT
	J+WQBiEoGQJ2ILnkw+FV7sp6IYO/50nAj8No2Kk8olBtM92r6z3R2hdeyBg+ixOk
	Lhr15wMIhwbSOsf1D2NO0toIopspECv21V3gWPOopJ1i8e8w5YLOaHPTaI/zwIKb
	EfIQUGSirOEvTo/ZAtBEKDaw455LGycbhwRTYVVjcUa5zucW5gWfBvSpSxpLoP+o
	KHbt8/BH/spw4hhWmuBkOedNtx9gwYKLxzwjy5KF/vZVi2RTLA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020101.outbound.protection.outlook.com [40.93.198.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hdw66a97p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 00:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUlW/t54cdMo+ecr678DalU2FaMVCA84OYVUrcPtFjjt3sKv8CqINrW+xar7sV6aCNa+xoWMBootSUrtM3yWFCH590vDNj7QLEcIk/9swZyeuLUVMlmRRpd8sydCdns7JxTF2ED/b+YOrxJGEUw/csp2vKl4fRPYPTbwBd4gtRXfr86VhoDKhIfHrSanQt/a1TfE+GkkuTF7SP3aAtmZj966UxN12ARana2Wv1FxvuvANUKGaFQIbvm9+N94IbJMq2JiKGm5tjpG+j1vqOzILUgmH5BxHoHbRtE+hnAaE5KoGpmEssIefz3qzBeCbxMKiU5LM663b1SkBvhDomFtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hTlCzOVw1Y9750IMTAT37zKHNXW+TWIz18DpVFoM3E=;
 b=NDlTz2RSUqe7aki+DfK0tjLqOYDxaGoYwwo6v6qaXMkQrjj8iOfTuTaRjFDcN41wWkWoeWGBAsQV/yU91xweLx5jAeOeYfP7u7GPDZcwC8miUJgosAk81fxLNVlqBZyWROHJV+A9DRbuJhhDSffoLEoFqwIVoTz2eBZlWM62NroKbYErOmjhzqleU4PRj27SSBM8sGrlmkqQukAYPEzPW/4kzAdWigzEC2wjpH1IQ5YNF26XJmUTYWK/9CD6x+t1rfF2NH6moMDBg2HFwHvGQbhXl0gutGKF3Wg8ApNTHBzyWFW6AzoALqGROrv6yogeIZIrInzXlS/yxrzs8WDO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by SJ0PR11MB6816.namprd11.prod.outlook.com
 (2603:10b6:a03:485::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 07:03:32 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::bd8b:e175:4855:9e44]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::bd8b:e175:4855:9e44%7]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 07:03:32 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] libXi: upgrade 1.8.3 -> 1.8.4
Date: Wed, 21 Oct 2026 12:33:08 +0530
Message-Id: <20261021070308.2984268-1-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: d953a9d6-25d3-4837-2cdd-08df2f416ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3v2Af9QLTE9XDpb9OdaxfdwDmmVnWgYCl/84jAodaKiVDKhbmR51sw+f1/bOhVcPu8fHHrZc8u9rqNxC1PiYgLUIHqN3WSyDwWl7v5aT0bra3GAbouMbHedybHt9+36bLZGyz5yE0OczmmEFY6mVy99QaDjEjM+2pkPCki0pcqp2K9JxGJPEND48/GgLzCfJoVNQ5mPSTHYmz4T0c4nY/2xzsNQxjh0vuwqdQSIdZhkK0bwoVdTo7GqPCMjsSCvN7UAwHkMvrBo5j8SlTRmeF+j9XbaQlAup3ZiiHgiyjD2RdRe8On6kpV7bQ/eS4lJ/t1Gb+0TGtp11Ws0dZmSZKQkg56rsMcbeFwVeMu6rNz+hQSJxQvua6BMMWiXijoN0GHS82snvBt5+RK5oFGAcv86oc/C70SZgvX2oyIhs9cD5W62Q9yyEeTdcHc0xLb77bUcBrKMO0rAiGiuOcW7jX1LtswVp2egcSUxMePwBQ7N4XBIqBABkgpzfQsnmn/uCTNyt8pGKk94joIdmDvlQs6kvPj974LLtYoXw2ThS4WVS3p5AFfHv923tAr++lYN4oc8PW7TSamF49BDCDsiv6rUWgJTNvI4H6unmRDibfyS8gq40SgUswditt2WcZ6IYGmnLI2KfpG1dvJ3GZWUFFDV4nTSnDZRvaZJGvjrzHx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dSyePlZxnGDiqoBwrLNQ86B7Jj/74ILt6qPpLaoQUuuv9c/Ksho3VGTN6NmX?=
 =?us-ascii?Q?HvoQymJbPR69vTDZsuB/fbjjmzVs5urHYeZccmWS9p1eenPUnR2ErXbhG1hQ?=
 =?us-ascii?Q?fD8u30+bc6OhAlj29VnIQ8BgG8qrRXk0+BXVMWj0FegJJSeWfS0Ufe+94YvY?=
 =?us-ascii?Q?3YBSFaGrTrt39Cf7/jgHY5ZmsApb/2tAkdns+pfcdpVVEx5i7kc1j0e13jsz?=
 =?us-ascii?Q?yApOQg8wLAKN8wFe06H1oWxM/OjOmEAFOBx4n9YI00A0/vutBudTyvDngbF2?=
 =?us-ascii?Q?0LFdmOjam974Ws6S/68hg+7wiRCL2vQjiZY6rkj1JmHN0peIevnglyjXp+eP?=
 =?us-ascii?Q?acM0uwRywe3pazsPWJ0O9fEGTJ2lWzphTUdeDqUcQBeIzsWppIvdMiwzzkEN?=
 =?us-ascii?Q?l1SMj8tkaZ9tggNa8e3Wer+nO4JtRpaaeNRMn5wN3sediEZus5xOWxNQgJyg?=
 =?us-ascii?Q?SWzbJalcg5HtuMPA6w922mLD7q1pp/Fk/gDqZ4OsFN3El332P1+/hSMw3wFO?=
 =?us-ascii?Q?QOghuaMqZYVTlY+YQ7GsA6kdExAghATDSCsQAJONcBTBFXCcgCOj33+auRFW?=
 =?us-ascii?Q?lO8u15cnm+kX8pal/k9FsAY91qHh15fJhVdlEXdeil86UqO65dPFGIwfuqyX?=
 =?us-ascii?Q?Ln8dn23X++06hzv6TW76ytmhXyuZUArvPI6oMZRGo0cLhHf9SGIIZsi6mpNu?=
 =?us-ascii?Q?xdNHBORgns9o3fG5fdqel+CmcMRIijOL2y6FKCPoBM4nf9E97+2kERF8Nhv2?=
 =?us-ascii?Q?Hfa0ZuWuAxQ6ZJXnG9Domzhs2MhCxmoeCYyPz2LDkYGAKFjrD47wsbyojR1d?=
 =?us-ascii?Q?jO67MNQFxbGUQYl/OQvc0865W3IK9IN0i0guUwnTWcLHQO2r5KZJmhjWNjYD?=
 =?us-ascii?Q?EE/O1CiMXAjOezeBido+norh4MHGC125d0//CCcAKxm5Kmkd+RYpzXJXB7Am?=
 =?us-ascii?Q?Iua12EHwMICMewLnCY0mSTXb3z/RXiUn23KI2et9mFKCvAuIltQVAQPb9Ppc?=
 =?us-ascii?Q?FmP8pIeGOqiIEHgDxifGWJVjKOD+XX0aZqmmOt6PMy5Juisr4vI8KXv7vqGv?=
 =?us-ascii?Q?zxCw0zz1o7N2Ky6DK8XgHxBEu0hQaqHq+G2ZnitzVSvia+MGahzQk/b5Eb04?=
 =?us-ascii?Q?2jxMY3CNCTx1Y6pmbtSiKlIa7RNglxntmcOucdQI37CvWmjwkFlMfMueC8MG?=
 =?us-ascii?Q?F35xiho4dLOoB+RBZJ4BePe0m64C5LEkFm4fF0in3hYQilwz/XF5Df3QP9yi?=
 =?us-ascii?Q?EOgLynG93+ttDBHTARBcB/wq3fr491mOwfsHAwFDVlk8OoeMM0+M0cOL1KK+?=
 =?us-ascii?Q?lL5i+7DGdCK/YHulXjefkVxYvoUlWDdZyqTeFf5+MBcB465okRhcIHslIkqT?=
 =?us-ascii?Q?B/9R+E3DiLDdeeKiy4SPDl5rWlfCOM0WQbzmmDseQqN5PfLJymP2xnl9lrsq?=
 =?us-ascii?Q?+9tFH+GjDUeUHU/Q2Hmglws1UQlo20ZAgCO0CrQmmn4vog86hTAH6qSMaoRf?=
 =?us-ascii?Q?TRXaeprnlNf0KI0ppdm2DqaYRZPMSbOC1abVaAhmTgjdleerwlAyZPuErZ2L?=
 =?us-ascii?Q?XwIMDrk++f8drZdL+sBqGlCPXLqn/gFSdWmyAoTqkPFUF1ocQ4RpeO5T69ry?=
 =?us-ascii?Q?A/QV+CADXrBmKTG1CiC10Si3oHbqSXWN4keqsl5369U8/ZWEFFLgNn7drWMI?=
 =?us-ascii?Q?qV5e1Nut4s1Nw1XU0+V2TS1vysufGyRhcRq/idce3mQjAOqMZR3US3Wopu/H?=
 =?us-ascii?Q?VoYclAmcH44LbCZCJ6NpWW9pHz4PQpw=3D?=
X-Exchange-RoutingPolicyChecked: Xu3KqbWirEiXoWxXt7+3PBj5fzZuERpeb7vg5i5gSMB52EbaIGL7LKIO0uCYH7Du/yi7wBJQGtmatMIuJZhZ7OkKpEEXGIxTw/hcALYXHSqE9b2qX4049S/8z1fPw9wv9ZU1zXlw+3h6M9NSbKe//CsuPsH3Qpmu4qMaryGQN16usxgUVf4Fm3ybKzdN8H90ItbLAdFcu+t8QJDgQR4DPLtfBxQ+frml38EFP74yj7XMV7wV/Tpsq4PmY9FLE/LsIRT9wqAAmZJELmo/079KR4/W0AbPqAzswMtTnmAOEFUpxo3XNQZyNxBXqcIuV8dEG72lzwrab7lmwXKCqeHkPA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d953a9d6-25d3-4837-2cdd-08df2f416ad2
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 07:03:32.2823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fmr39NYKu7yL0rxmvP16wxc2T7qKk78gEZm6jRi/4Spn2lPX4gmIJc3Iaiya19IX0yLhrpqsIGrscT8KT8M6aWV757ffMnlq0OWDg4SZTxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
X-Proofpoint-GUID: pq_tpEV_QsJ0GqiqwzOAMVzF0kox6P4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNyBTYWx0ZWRfX+JXFmbBm/2he
 ZtIBMHXBBQPCIrHkpUDv03ekif4cIL6Zpw1LOok1ctE2kvA+sQGjhR4hzBd3SbfrE9D5yRqa6cy
 1N8ubFaYce+vfAC66sUppkxtrZOcT2QIEU9ojPU/gRFxXZi91bvb11xcRcFGI1p5RE9FNaNWbE3
 yqAcHnBoacwVRXTGdWeU2I1kDHG8/GwoN0unqOtoSqXRaI7A/5vmdRoBP14SpjBgFLLu+GXt42M
 tdh+ywSKnGOqpgkEH2LDYVtDSsoiHN0ACS6+lqiqLbJ6PWRDfjoyRTJ+dv3VQWZKBZa87JhuXpC
 yoeze9umoQU7whBzMdLPAg1MDTh7l6WGlW/Z5OJWWAHcRbYSPPgLbXAGTBntntFyrwn9sZTime5
 y+OALA08qyPD/mTbfdBZF/5RyZ9cjG6TghCZYXPlA4bTS76qc6IV2I+LOvp05TpsQcgfzraC1o4
 B8AkMrA+GDqywUdhDPw==
X-Proofpoint-ORIG-GUID: pq_tpEV_QsJ0GqiqwzOAMVzF0kox6P4_
X-Authority-Analysis: v=2.4 cv=KMXPn1Fo c=1 sm=1 tr=0 ts=6ad863c7 cx=c_pps
 a=4RNThKpk0f9J61SA+MS+fA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=aR16PxjQAAAA:8
 a=t7CeM3EgAAAA:8 a=1Re-ZVLcoKOTGUClP_IA:9 a=zbFvvTOBjyH4ze5LlUjX:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNyBTYWx0ZWRfX74AtMI3Kqdd4
 3BFl94oW5QzRByVumkPfjwcLFDFl4r1Pa3K87BxbcB4grEme4geCg5jiu5uLOA44JNr/pd4Zkeu
 VR0TmuWXoyu+1KI8mKYvOwhAPlC1a6unY6ltNVURK0Nrp31qhOaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248366
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

