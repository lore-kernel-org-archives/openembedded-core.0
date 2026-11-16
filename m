Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23811.1794818197848704003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 00:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mDl55IIn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5780073afa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fcJ82176426
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ptYtZTDo52DXcKAhrgMf48IWegbb2aH6BTNuf1Qowoo=; b=
	mDl55IInTC6lqyq2urLU/IdbJQ3j3igpfHYkeeTy00D8Li8+Cxl8KCQ2pCC2G/RW
	23M2JM6s7Izs7eZi21293uvYWloT52XPzoIpIqpyN4+qQRzqW462heWFAM7OWEBE
	Vde90oefYfKIeDqExblY0ywJI3rArTcip950CZXOIA67jFNi7tbvEou+SMBjoy8l
	BQgrlVHbhNl23qCCapAPb+hutUiROkczlHQdh3zv2Cd3q3qYTsFSkfUwjf3hzHJh
	yLJyX0FWDAQptSOCh01MlFejzKlxaccwWJeOpjT/1qxdtMSjU5GjTxIzD9nPU1/E
	oj3vOVSTMmDl5j762P6pQw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022108.outbound.protection.outlook.com [52.101.53.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxgy7japk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4a3s71Y9O/Fx57sKGfPgbbkb8eeHxDnSULqvNQpaLKMtoDQJmRtpLNkAoCWY98i3lsKG0Kwx6ZxgthL7ETH5F8gkCwwIE8QaMbRJtImPDLq0pAvvL1Xqi8GtnppbwRJjV/3aQd3j2LIXDhRkSCH9OXRiDYRCHB3i4db1X+vngAr8YDuQqzcY1aqVxEQ4vHyoa2Be176UWG4stLBVfkd7bLtmExNLu0DKCvj9Z/A6y1lgvdrsLYsQDwFQ2HUl3p0gW2ZDDU/1iUyoK1pvDVB/+ii/Y18jLN9SQGkGI8W9FgduwY/UkRN4T4zeilza3jaB/pstZL8vMjd004l5EpxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptYtZTDo52DXcKAhrgMf48IWegbb2aH6BTNuf1Qowoo=;
 b=Mpz+CeNWwdrllZKR0/zdKWLUi75ZSEo6fhU1Pme+nsT6zUM20KQbCYIQwdXJtXwN8qPvcbBjOsFrA9TgV+hSna1DYhltqmcAB4q3okbEydVd0e0RJK94wLAgjfuH5e3TKXJQETtE/h5Pi09Bqf8Vib5rK3EtYlplD5C5Hz9LFk+xZKO8FF9reWrpRNVws00wz3LmuEVBupWTsZxH1Jm4DlZqJ37r2larSQDY5ZSr8Hqb5kP3b50Gq/9EviPOfPXlC+XBEVy1m+WergCnEkvZ4zcc8HBu+I5CcjOV5r/U+waj7JD4ZDL6pREPTasRLLWOnl4C7Q6xBHD2S36SRBeVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:36:35 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:36:35 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [blacksail][PATCH 3/4] rust-cross-canadian: install target-specific env scripts and fix rustlib lookup
Date: Mon, 16 Nov 2026 00:36:03 -0800
Message-ID: <20261116083604.1926029-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261116083604.1926029-1-Harish.Sadineni@windriver.com>
References: <20261116083604.1926029-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 15da4273-3e69-43d3-243e-08df43bcb926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|261102130727099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|38350700014;
X-Microsoft-Antispam-Message-Info: oQQa8C2+To+LDXSTb7POEFUqm0ICpZy7oUyrxccMpcf/CpseSQnLBRgSw6+QnYatT1nw6dPOT9PlxnitlhKo6c46A98mmT/m7IMmPMFPJ2wT3LeVEbmV7uy6wCu9ySwEY7sL9GZLwZ2HmnN2q2cIV2a740HBaKU9ohwzchdUj7x8G6zQxWY8oN0YcX+p5M5/FXuayuQ30YuIH4XOcZxFIzx3oh4b0X6id4AemqymZYRAi/7Qp4DqNdABMEKALD4S3CvAJ8bBzZVsh/BwHKickXsXA57ijnk6fY2+gkdSO381nKcuLCnGPTTUPKRGFNXiLq5kPffY2E3KqHJiPufrn5N74uCwV3w2VWVnqm8nq4UN2dgF5PWSh9+vRbey/9O2Em1QR/Hyg7KQiCkZgA9ZfCzPyuB89Vk5T9sEsMCaA5YDqCsc0KiM+2FaskbXcrrLdLyKF2HInYLOXyyToRe34hGLMAKV6Uv+q1ygc226NVxhwXyYEi2+AeykblpRlXldabO0NQyxQDGNx7Vb+goejueWfqht17nY0vebWPgCVEma3gRgLE7tQeKOh2yjsqrvbs0COtPfESsaXfq0GGXzKHqZJ+jMjfK4p6FbMEqkrFRcs8CpAa7jYNmM1pH83+qbT1zefjDgDbSoIQTnmTh5gLmQwlUNdQeVfi1t9TqUWHn3FkyoAMcP7dIFFBpSE3AUglgmmEtX9/bRG73dKDklA0RxjR7rFhGJ7hpy0Vuawuw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eBst7kEa91tIUmdwoXnL1wXEoYKz03pzFV9h1VJrXuuIZSQ1wYU3hSQJagxm?=
 =?us-ascii?Q?R2xpPMzohs+iFOdVV3hV+aYBOYqyDDZn1SECKqOYYxkFcuvpd/eF24PcFQ3P?=
 =?us-ascii?Q?TzPDErDhddMYU4kJ0qMXAu+R7V3rUTjQPvyMJ+AYEC83DLoEMOlUhIQCSQ+G?=
 =?us-ascii?Q?Qt7zOzEa+BKWZhCpmTIvTP8qyNd3KWcKnqxJgHPR2GalUIskRGGd8m7U74Hq?=
 =?us-ascii?Q?7EcncO5yFjEgsMutbqaNy4Kc2MUuDicPUkoMcr0LJRv+BQY7eTrS1sNjLBBX?=
 =?us-ascii?Q?fZrfkqfaXrQgVMZzY6JV3u0DZaLSpAuDrx3rlifO0W72CFtEquwwOUvfZbIx?=
 =?us-ascii?Q?TtXiworEN5RBVW0a4KT15GCIzogts0KOkd9wQFvitcsMOQblD6hRZez4YI09?=
 =?us-ascii?Q?S53oLM4JkG3JRatnUaqvY6saW4ex9LesoUVAN9GJNZq+GQCZMZBGiDTm9kos?=
 =?us-ascii?Q?EQYXg17taZRO/lVo31mTTtPT/ghrALrVZO2L0hY18VNlUgE+YMxaUoSNryQL?=
 =?us-ascii?Q?WwNYkxAx9NnpL9Wlm6VM01O+g3suaAcxNvgdUR0M644apCr3I8mmxkLYVRbj?=
 =?us-ascii?Q?XdcLmzaR6AolavkJ/mXTIO7jkaylokHGyh0nePzU8FrGvK3CSbmrIK8xSXrR?=
 =?us-ascii?Q?uUIzEd/h88bu8R5uZ5WKmQbA1ujrHy0pDPIyTSvr2/d9mIwPPjKcqaVW1Yx2?=
 =?us-ascii?Q?JAAc7LXJtTa2jxnkOgtAXv/jp4at76rgLe7B24hjpGcK82mjGjaKAoRH4Tnx?=
 =?us-ascii?Q?3PcrxUbiE1lNJt93JCPn21FiIsCtqpCfn7zfAH/ALrjOedHSXrHSLcGlKT2k?=
 =?us-ascii?Q?UXFQlON93hV5V1+RKD2jKX/E8LpFqzjJS49+dr2nAQV1RJU6bqBtW3s78SOR?=
 =?us-ascii?Q?2DvIoP95nSFgqVZurM2uw5C3Lb1eQoaKAWz7PR1hV1xpx3upe2XYcnr8aiI4?=
 =?us-ascii?Q?vSjlENCcR+WUVKR89JD4BJn9Mmgn7MtU9uVfkCUecDDaz9MKs5yvXtELANtY?=
 =?us-ascii?Q?nszP/wtrkIKxGhJCsdgal5XAifh9HMHcyUdU5305E56TVX9IcwDJT7XkH9MI?=
 =?us-ascii?Q?54E7IHAHFrIKO7Ishy8CxHIvB4QEHO5C2E1A0B8yFw1Kgobj97d1NuKWMoXm?=
 =?us-ascii?Q?5X3F1G6F3v3bVRmNbLqThNTkMXRwoznciK+U43yPGJZDMgwen0B4ldpNnhcd?=
 =?us-ascii?Q?vUsJAagx0FMbUODgDQRmgyOtxAuVrE58Cqzt3aZG70JBlJ2ZBOt0wff70iBR?=
 =?us-ascii?Q?BX0yYT1RN7E9s2eCpsiVXeQHmbzX+plxQ4x0ckRd8CddoqUqOBuO2X2c6rvJ?=
 =?us-ascii?Q?TMF9zhmDwy+TgSRGpEkrvEL2B2nSjXmUkgKdsqLiNiqk2Rjd6Vr3EhdGW+af?=
 =?us-ascii?Q?5x++79TBRZOiKouUZexLkdEpg6axkZ/jvvBR7dmPxGbrW935+gwetX9BY2qq?=
 =?us-ascii?Q?66+whG0KIQ1pCpTaTeQYpS7dD/zAu5H751l2m97MNFtuef6mPWRKGScfwInT?=
 =?us-ascii?Q?FwtLeeA7n61EXjuC6ljLrPMp6YsI/jscKmf1NFEUDqBGepcL2NFFi5kZKK9O?=
 =?us-ascii?Q?p8u0GGGSTBBJJ5IVmt5Zd3faxS98sVmhzOo09saLV+GnpEq6OMQ8SioyNf6B?=
 =?us-ascii?Q?z9JXHuOEJAz2KLbm0UV855MvMSDR1VLrkR8rKnxTzXQciSt3GdADbH5fEjU0?=
 =?us-ascii?Q?Ifjk4imK/IxJIxvHhS4wdORu/UctwunYFt/9Rs09nDDL+QdwiIYGOQRUkx9G?=
 =?us-ascii?Q?4efkrDBwKgVXIq2JRPZvW7AdTSLxiPs=3D?=
X-Exchange-RoutingPolicyChecked: Md+SWt/jiSH5Al571FNcqs7GJS/K5sWpmQ+m0+oGZVOv8dt1Z3A4vQP+UpjD1pn1H3ZQI0ksAsCA0mg0GNAhiwBGa6S09xxdoNcfNBQHGgT+5s98XjO7EB5nz7L5BmVtflZ6XxaW8B88yENMXPq0LZGlVZUUAb+fwUQ8ZICPM7NL+55oHMYhGAskwc5532m0J4blGCIV22ndqvRPtWnnbVzQAzEaExMTscWIy/Yuv1uumR8WijtFpEhvql5mzYCWORf1bb/Sixw1+iadFCP60osb2amda859MsHa0F9Ra6YlDtEm0DWdeiUzTz1X+MYw7OrOO5tSct4SNAemD8zpYA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15da4273-3e69-43d3-243e-08df43bcb926
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:36:34.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buWbdgtA3Qd5PsVBGwAVHdEDsgGeUTpo04SM17Y02t0XflZ9/IX6s0fV9nxSX2yf4eo75VRD6wA55WZ4uss7owhqfvU8F/dUpZPywtMGnpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX0T4dlHc6qyZc
 nFoltBuybmogn6NI9RMbAGIyI+oOCSXq95UV4YL/1BRynlLNmAplBu28yH8wODez5uVqC15it7s
 HZ9ncDt1RCf5EdD+Y6Rns2VZLqT3mbr0+kfpuyROqA9Tl0bYgWxV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX7m5XU3Jah/Hi
 yEkdVl+n5c7DLhYtUvde5cjpNrF+ju9TqJnlZroL97qYDzwfuzZreC8ZqdRWFVAB0Md1yTpxTDW
 TwnlGVbH9ai8XXGO4TPfVb5G2etkB4IFPefxUuoZ9k3MPaMzeFl7mewk9esqNFLdaKUHqg6ytUy
 SEUUC+Q5qoIm+7trd+JbJAxmRfHTHO8ccwNxLmHlozVql/Z/0yeSAXc5q0B/MhPXDSybXa6935h
 r3Sws92vxJJsxr/KgC/8B8Oqt6+NoHqiV59aQxtSpVeQA1W9NFR0hsQQlysUaEYEqrep5CZcCQj
 MQNfKKfhqAgaPxk86t1URzw0TeRpz7sQdpYH1RwD0zNyw6HNJbxGN/n88rM2Q6KGwKJP6jmqTEN
 X34zfeEeNqnBi+GSsiBsUSSO7jX4fJJlXvOYVml5Xdrk2DnGnHcOFCaq2RVKIDLCPL/wG8r0Ygv
 whOQKKAAwZoSFKsqkag==
X-Proofpoint-ORIG-GUID: taPjQpXKRE7uuRFGa6uQUa0xwglcTopq
X-Authority-Analysis: v=2.4 cv=c9g+0h9l c=1 sm=1 tr=0 ts=6afac094 cx=c_pps
 a=MxHkyKj2cFYSCUcUIFQv8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=EoEa0L0g2eIUafYROuIA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: taPjQpXKRE7uuRFGa6uQUa0xwglcTopq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250318
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes [YOCTO #15061]

Fixes 32-bit Cargo build failures when using multilib-enabled SDKs.

Store the generated environment setup script in a target-specific
subdirectory so that sourcing the SDK environment always loads the
matching script for the selected target, avoiding accidental reuse of
the 64-bit configuration when building for a 32-bit target.

Also update CARGO_TARGET_<TRIPLE>_RUSTFLAGS to add an explicit -L
search path to the target rustlib directory inside the sysroot. This
ensures Cargo can locate the correct target-specific Rust libraries
during cross-compilation with the cross-canadian toolchain.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4ded97c2905d1c4ec7911d904cad3a5fce98255f)
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index f083bcda82..689ffa7efd 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -51,14 +51,15 @@ do_install () {
     chmod +x "$outfile"
     create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
 
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
-    mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d/${TARGET_ARCH}
+    mkdir -p "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
-	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+	LIB_PATH="\$OECORE_TARGET_SYSROOT/usr/${baselib}/rustlib/${RUST_TARGET_SYS}/lib"
+	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$LIB_PATH"
 	export CARGO_BUILD_TARGET="${RUST_TARGET_SYS}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
-- 
2.51.0

