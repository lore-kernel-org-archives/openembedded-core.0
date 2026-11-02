Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.851.1793644359635887591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 10:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IXk1QyOB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=576698308e=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HROjp1772285
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Nov 2026 18:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=NjdtXpVAQ
	TqsX4C+qf2nO+lZ0DqAqLmss7DjAAGPI2o=; b=IXk1QyOBW63187RpZcneACJg3
	0xsSfHdN+SOXlMP/g89F05YbxnT9pyLv0KiZ8ehRxnJPOheswsubsE8fdRLL7YcB
	Ix+GWKriDQYkNtp2YTjxR/RMw1nlzIwvyPmoyHrlr2oxoA0Z/NPbNx2v7myEgkUn
	ez7+EGheeUMNfrU4QIUH5Dyi1+uKDN0EKsd3lMwuXjPPlzXdM4gERm2inXdiGV7p
	wQlVG+TR4IZ7PQJ2tR6JzNTefGq8Nu2t9nQ6fgrMxNed0HczJ94LY61QLDbJiJj0
	0mz+GTKPyOy7dC9EySbfYAvGqImk41PHPBKm5GC7nGI/daa7aW+8SDnbVB6gA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020098.outbound.protection.outlook.com [52.101.201.98])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hn5hxu1mg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 18:32:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mf3eO3vlGt4fxYiWqeJwyKMkNTd+/vDVXmtZ98eWXWquelClxLNHh5vceoPAZER/6LNqDsamfo9DABkrouYWtlLArTNknnatQmTqDkxUM+I1RtT4FhMZG/xB5161ZTvaaq7mpMKnh7eRjQo3JOOnrXEkvntDmr3G108kmyyavKEu84C84F+LF2eYn4rj5xOCY9j1TK+7vzTjiDHCiuGcegM8IYaIAmX6Oc3OqA7CRYQn6QYFBqWpwRwMFXjNnZ9AKWWon7RJzkb3Wnug9GrzbQmzR9DKcqEyFhJPqNKXVSOrnUU4BbNsaR5m0Jf5GZUJ9U33QJXIRnqsXbG2oyyjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjdtXpVAQTqsX4C+qf2nO+lZ0DqAqLmss7DjAAGPI2o=;
 b=IEUPqLRK8/+oE0ukgDt5ePhbP1vagcrLLV336UUHC6rhfy+4ZOmAQwEyJivDnesyFZiv2aJTbapLw3sFmFJgG7jQsgUG0Jo/SDIvU4UIemKUjigfBViF/cMyWt0mv/+GV4O6SSqIS3ViLn5zSfj3RI19Kbat8K/UecOagc1t/UBr6NhEvFoFuHZnY4kflnyl/uMeUVZARqTX1QKT1P2BU6s6e/NMbvvEm9GJxa/6071djh4ef/grJ94zMz/JTVyMJ/AuzwwW3Tn52UxdCNRYgiA+7RHNJY2Xs2dwHk3fcrXwWqMxQf138HETyZqwch180viwNyX07lkM67NlPgD2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 MN0PR11MB6109.namprd11.prod.outlook.com (2603:10b6:208:3cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 18:32:36 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 18:32:35 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][scarthgap][PATCH 1/2] nasm: fix CVE-2026-6067
Date: Mon,  2 Nov 2026 12:31:39 -0600
Message-ID: <20261102183140.2210513-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:510:23d::12) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|MN0PR11MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 98458af4-1894-4a64-b06a-08df390faa53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|23010399003|6133799003|12006099003|260925022911599003|260925021311599003|260925021911599003|18002099003|10067099003|56012099006|261102123227099003|3023799007|13003099007|261009223027099003|261009221227099003|261022105027099003|261021135927099003|261021121427099003|261022075727099003|11063799006|261028144727099003|38350700014|261026140227099003;
X-Microsoft-Antispam-Message-Info: n9IxbWy+SrGqKYBHJScCKd9aweJCH27zZQmRj7lTcxtfUQxTTr/3kwXX31CeRFKhAUEZLsxR87wsuY8cVqXw8W4KV/HnpPbhBtpCvHzHpWXkQf0pVwgwR+nRReojNSRNpVbv2saPrjT+c87YHgFYhGX0ISe70ZtDja1o7dp8Pjqijqw5G4UVQ5b4i/ddhXD2wyhmdmMTf4HnaqUy4bHrcscp4yOp7hdwDLwOCjfUXhKrpuivSZBxceKv3Y+EhZg3xRnv/40otQele6IzIJOg1/AcU1/bf3a3DThYaU7pd65gbZ7i2MyRojdR2AJ8+29g775gxxi7qZb2SCRinwn41xNMubvtZHjyFRuD8mf2vmfAEAIBSNJhUfMXX+Hj8o2uMCsMLYB6BD4k5MHZOPGuv0P3bkklXt2ZPvpZR9MEwjua/mddhMK6Hm+eENfxF1o3OGdPt5Hx6nujsY606mZRa7QW/XzrClEhApVZ+NqHa8duWvIrroWxdCfrqMTRAUf7qD/MqNpEFacvjYFGtxrUiJJ295Us0GPEZXcIcw2kYzsgLt2jwrMmFRLB4ubbkrF5kmjjwvAVGLq/+9b4/0Qdri/5IdO8I3zjFyJW5rpLK7ixyslj2DyI7xSyipuNiOUOmqd66RoJMeoFYX8W6urIRnftzi7N9Zm41JmG09f7/TM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(23010399003)(6133799003)(12006099003)(260925022911599003)(260925021311599003)(260925021911599003)(18002099003)(10067099003)(56012099006)(261102123227099003)(3023799007)(13003099007)(261009223027099003)(261009221227099003)(261022105027099003)(261021135927099003)(261021121427099003)(261022075727099003)(11063799006)(261028144727099003)(38350700014)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1bF7+lwFZCG1XM2hhV44Cz0zBp4cIVT5shD1epz8CvR0TsyJBha38ZL/Mg1e?=
 =?us-ascii?Q?dqXuXUPZko0hQneaT82BIja7+kCtmmNCwNs7NTxE+w/8iHLLJofzOQaSScdj?=
 =?us-ascii?Q?iO6YbaQBsjCQc4PFnNRlCwp30l0Ioywn0LkcRu4BS9e4r6aW4g8+tQC3PfEi?=
 =?us-ascii?Q?j4DV1hfRZhIdb7m6/vgN2mydiW8SOLfw21zsbRly9eOd9kd/4YcOl6JI24Al?=
 =?us-ascii?Q?rcAfvL2uXcGlNl7lV03u2jBWRCYVYU4pfq5SPynIz1rVN6emqD2Co8C/1YcY?=
 =?us-ascii?Q?IH9O8sTQYYHUFJxdhz48DF36kNaTX/kc6u4s/8VYt5/Iuex1Imxz7mToeh8b?=
 =?us-ascii?Q?Gso3ByGLg9DfGBK7BHtY7i9R3YDqx77nHwFxMf9DH7CrA0JKB6THcFBc6M7v?=
 =?us-ascii?Q?Zs+H3OWe904KyD7nrXGTJ1FUDQ9UrEc63DgDSVnmuT/TnDHsHLrsg1vn+62i?=
 =?us-ascii?Q?zT2x4082IZ85kHhOie/3BL72+gcXfIr2DnSGRXhaihXugtO+bF0wehVio1VR?=
 =?us-ascii?Q?XgzoPa75XRJF9MbnJrdHPPpb9+yybSqVfsDzjzZ/Z4H+ezO6Z24v0MM3C9RB?=
 =?us-ascii?Q?U6CadYS4bJL7Ef2diV36jT8bydcGURgkFuimtLT8VqBCEk30xRYab8YZyG5k?=
 =?us-ascii?Q?NdddbBL4KT7lvz39z7+Anv6ULT0un1Jn10CG6Lgi32mP4k7SOW3b8N46nAOd?=
 =?us-ascii?Q?jKE1CbMLAx/RtGHxXuoBmzOWqpS3sL2y6cr8r3pmmLbg0+6Nt0PpUt/FuEBi?=
 =?us-ascii?Q?LgD2eD17RTY6KEOJTNFVFqvfQsaS9MyBstGhjBeXHPxIVAsdGze4qMW6qOGP?=
 =?us-ascii?Q?FXVxGZ1Kbe8X45MU/WtRtOS63XXCwUIP7h5oBgeITp8TGMjyqQzOqtgP9Zbj?=
 =?us-ascii?Q?WeXywgg3+VlD1qdZfc23PWfRs7fKKW61JDGSEtDq6IFeEXioOpH0b8oezE35?=
 =?us-ascii?Q?VqePENupiA06QNCWA2PRkuvyKUMNMRJoiObZ8u1a0zq4LX3akz1jOAz7rHxC?=
 =?us-ascii?Q?jfba93obY/xNmn4Cb+IfdXQvD8ChPAerlw+W5NC00L5lfNZfnUMY2BLMCKaz?=
 =?us-ascii?Q?ZkxVIbwyYreUQTy1afBhinOCLpiTAdDZvVPXxC4NB4txRTOnoACDSGiznaj0?=
 =?us-ascii?Q?Sq6UGsFU4q/KxU7aMmvuP66YC5TzT/igiwl7MPJO+Pw0KNBG9CPstJVXRuAw?=
 =?us-ascii?Q?A4+Zuc2zWl3p1/u4igrGI7V5uU35yEcX+8Y9dHb/FTlk4VOc9BaO1Q+tT5ls?=
 =?us-ascii?Q?C+VipWaCikRTUf692gbcWcOd5ZkQNMxn5GUz4Z/jz3b/w/Tfe1YAwDNzUG+a?=
 =?us-ascii?Q?RKJ3iA0sOW8hQ/TiJCg/P1tH4tUluHBxfG3btVklECkrvhy9OMxfJ/nmoj2q?=
 =?us-ascii?Q?ZmFSypbKExY8yCWmKOlDFun9z2yD3Bug7nO+4dEizftyl3D+x0WzPULkomgh?=
 =?us-ascii?Q?ytmDcc7PKz2VwvkPfTTQDmHvQ2RwN/v//RhUmKOx+8UIq9waDy6QVId3i4YG?=
 =?us-ascii?Q?AE/TN/S0IcVsObRBhtxUwVyBbccZv8/U8jG+o8YiGK5+zo+UE4wzNIQ7+5Ms?=
 =?us-ascii?Q?q1idLsAYNm93IznDDEtGmidqye+gHuxEyX1FNq1scWznYT8GML7iJDzyJH+J?=
 =?us-ascii?Q?Y76dfJT1HdbT1fe4dJx9OKuLhckPD3+CVLxUWmV4ez1q1ZezRaoaueZhBe4Z?=
 =?us-ascii?Q?/BOt/h5QIqpvt3emvLmEK5EVzxZTK6gN0TkhQ/k+viYyc2+Nm7uxoOhx9rYv?=
 =?us-ascii?Q?lkDTDwCLpObECIE2RCiMulAFXeChURM=3D?=
X-Exchange-RoutingPolicyChecked: eOv9mpuEQC00SlcTBiGm+6ovssqXJy0nJF2s4qBCdF4c47qs/dgtDWeM5EkOUF0Ld0mGQ6qAWB+8K6YGGKKIu1wljoDmbLrIp9/F4I5iqdUfruYOWFQmhAL4kR3U5XodchY0k1YSte1Z55V9FUlJ8Cfo2QQzZ8CzJJ6FpaHO8Eojc+k7yvr/sMh+wQOGBwT9dwnb4RcILre4NpcTIyWwrBipo0/zq9YFWK7p9lWryNkwrvU7gTdNvN043iGfoCVDaDgBtNrVj6wJia4JJKJMp0UpMDf9RqcyrbfQUdoUh6GOMQdHVDb4SbrlBvwQDzHcmZkBMUhSf7W5uxgX4GPmZQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98458af4-1894-4a64-b06a-08df390faa53
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 18:32:35.7102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPJyhc/5yySv1d5wRmtDVotoJCaQvKV6PBMNhSc+yGrVwN8OQxdk+jqwMzFr3uOo5+UIf2eqlyu8/z0WWr+Qs2f+V6f9f7yDbczfoiJohb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6109
X-Authority-Analysis: v=2.4 cv=dvJOmFg4 c=1 sm=1 tr=0 ts=6ae8d746 cx=c_pps
 a=VmHzJY20YZOiQKV2ZK05+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=PYnjg3YJAAAA:8 a=IGX8wMYuAAAA:8 a=t7CeM3EgAAAA:8 a=oGMlB6cnAAAA:8
 a=1J-8pnr1Yoqxb5oEfQIA:9 a=MyEMWE6lpU7D9y2mAhno:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=NdAtdrkLVvyUPsUoGJp4:22
X-Proofpoint-GUID: vn8CymPGbiG2zK5RKJSLhI1ITCb_RIPP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3MyBTYWx0ZWRfX2Y1B4iSar16A
 /MchNNAYvInkyvmJUbkn26VL3b0+u7uT/TjmiNlxcXBP3XXPsAeihCpsxPDl22OrMCjCmLqvRbF
 XjfHoJ4GCTTmDVMUQRWP7TsZAt93uo5XYOh64/Zkm52XqxTp5EzP
X-Proofpoint-ORIG-GUID: vn8CymPGbiG2zK5RKJSLhI1ITCb_RIPP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3MyBTYWx0ZWRfX5gLz0j8LfMCp
 kyuuYJalSZwrRfydLgt2I99StSsOJaiQriDweRLmbg5eTB9Y59LM4A4yLd+2N/Sbj+7O5rYnl6v
 Y+L8jHuqC+9/L3lQZMisYulf9YRfg2hB68JcANjcATSWKEGsniPjbgkTz2Qo7gQ6MAJD7UZgrKt
 jorzM+7vRCzdbFsTD22b5bPUksk4cyrN1OKMEbbCjVqNJAo5if0zj4AsyGWCLRr1NowFZfcRRJO
 6yIAmbli+v9k3TRty1trj6Yc64oD4ZTGrrjejLi1hhdk26/wpuH7HloL0DZTfmgQzXmquWhYAQw
 65xKEExKi3jwya2sfpgZRPkplE2S73O+Uib1/8TbLSosbQgJF2HQsU8WgmhtoDc0djv23zTuGvc
 zYI4d2h+/tbUfXigA2QQBuPyzCIIGvdruYsBALEF87TyBfcs2pBo2KHvMAJJ2hw1IG3Wy7oIV4N
 6WLW52ItIGunqIB+LPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 18:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249221
Content-Type: text/plain; charset="utf-8"

When using obj output format, specifying more than 256 segments in
the GROUP directive of the .asm file causes a heap-buffer-overflow.

This patch applies the upstream fix given by the commit in [1]
to address the issue in [2].

[1] https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94
[2] https://github.com/netwide-assembler/nasm/issues/203
[3] https://nvd.nist.gov/vuln/detail/cve-2026-6067

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 .../nasm/nasm/CVE-2026-6067.patch             | 36 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.16.03.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
new file mode 100644
index 0000000000..f637a688e3
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
@@ -0,0 +1,36 @@
+From 8bc3400afa0a3e46c890f8887d2f9bb5acc14024 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickclifton@github.com>
+Date: Mon, 29 Jun 2026 13:53:14 -0700
+Subject: [PATCH] outobj: fix buffer overflow when too many segments in a group
+
+The number of entries in a group was hard-coded, but not enforced.
+
+CVE: CVE-2026-6067
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94]
+
+Reported-by: <BreakingBad6@github.com>
+Fixes: https://github.com/netwide-assembler/nasm/issues/203
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ output/outobj.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/output/outobj.c b/output/outobj.c
+index fc336c194..ad4adb373 100644
+--- a/output/outobj.c
++++ b/output/outobj.c
+@@ -1641,6 +1641,10 @@ obj_directive(enum directive directive, char *value)
+                 /*
+                  * Now p contains a segment name. Find it.
+                  */
++		if (grp->nentries >= GROUP_MAX) {
++                    nasm_nonfatal("too many segments in a group");
++                    return DIRR_ERROR;
++                }
+                 for (seg = seghead; seg; seg = seg->next)
+                     if (!strcmp(seg->name, p))
+                         break;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm_2.16.03.bb b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
index 281f3940e7..729dfe8916 100644
--- a/meta/recipes-devtools/nasm/nasm_2.16.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
+           file://CVE-2026-6067.patch \
            "
 
 SRC_URI[sha256sum] = "bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7633f18ab063edb29e57"
-- 
2.43.0

