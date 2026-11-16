Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23809.1794818195669608549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 00:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QVGfDmq1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5780073afa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fm6P3134481
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=09RcTHwQE
	lMXHZezAdHDXCJHalf4NnKWrHJH+WB4ECM=; b=QVGfDmq1fyw3B90y0TqdkT/Nf
	RX59MBafvswUG6ThU7c6yKxdsWvL/vQjhAZ3i8Oxu4wVBgQw/zXNDJastMOR5Y22
	zVMyrwXpP+lVs4zb0g3zVrD9CG2B7R/0qx0uYYsaImIS4S2BuDClAkPy8+V0PJL5
	pBfu4IKUeToySKyP2hpWMpQT6dCvZ4z+Z4/bY1zWPMPk0K42vJhgjDprhOvzjXdB
	5jHP/dsT617edDKh1KvPPjhsn2PBZdhYMS5b7YtGr8y7PxuzbjMNWby4Z/6lOpKQ
	VWvdi0AkDcX+YR5g9unSaXTnUy9AX7eTCFSxdHNRS09t55WJ7go8nl7ShgCrQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022091.outbound.protection.outlook.com [52.101.53.91])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxgwaaaq6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClDXjK92QBN02Ej3tTPwOaP5ecl+Fc1+k/wGn+GuAgOlP1eMgIO6X+oo9vY741T0t7P6anmPNopdJWep9gYkbKRK2dUVf86a5dD2VBMgMW7tOdeTrAYl7fpqZ+klI0T2n0Z+dNjaQ/CiITHj9m8Jvmlnj/DTIQCvaCerde98PTRYWnOh86O5qznBw8e7IgWnk+11Ae0W7jKRih/JxcCUHnS/9SpuikgUajm8vEBfZrYw82Y2zMH+vP4IyN6Ti8xlT4Ld/x48OMyvXuFyMlsTQ2HNVJr4iSpCHLaksBfFpVj0q9tDcG5ukk3OfW6Cflu6jtok+3++NcXj0i07ciG7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09RcTHwQElMXHZezAdHDXCJHalf4NnKWrHJH+WB4ECM=;
 b=BJInjCI9oOE9LJbToyAae1voYwFhCxPzoScvWaGioZK3F3WxkiWOn3iDlzVMqSc2ZmCLY4Uu8+HD0gTw0swA5kFIculYLKyhSWMPiwks9/N71061FI+CjgGRZxx9PhpM1iukn6aBQBiGboE7aYVCqqTPvEcvxKqJF6fSZLRl1r/roIglOVWgXa+0K9gwGT/ytE3KgF60ORBhKp7gQ+53KqYWsjuLe5qafFFm+5UZo0AAmuAmTjz6qZ6SlADEO2v1o6T2vnp1j2Bektc2J0cXxcy7eWCoshfnB0WAgdpP2VLgFjlt/Td/IpwKb9mRENIP12/ZPf21qHsdjLTdyk7BiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:36:31 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:36:31 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [blacksail][PATCH 1/4] toolchain-scripts: drop unused OECORE_TARGET_SYSROOT environment-setup.d sourcing
Date: Mon, 16 Nov 2026 00:36:01 -0800
Message-ID: <20261116083604.1926029-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e90b823-9602-400f-5842-08df43bcb6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|18002099003|261009223027099003|11063799006|5023799004|56012099006|10067099003|261102123227099003|261028144727099003|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261021121427099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|38350700014;
X-Microsoft-Antispam-Message-Info: /YoVNmv+FNEOQTtLzmi1ftqSLlQP/gfZn5OP32r9CJuSMvCVmveMawF6HVcgF/0FB+pF/CSIdVLm6l9cYlc+OppmOJg+H8Byns9xL6ZKTKDqcpOnerznc7VNcuw5VgmIUu3kXZlWqZtfU+gQL7gU2ruEX6eun1mqS/IwNkdlBuwxIIZMHi5g3AMwDf9oVdUq8gZYW6ZfyC2Qqm9OMy3AH03+RKdeOIutUIzYRHmFqILL7XulkbSncGAnDq5GxdzxjXH9Wv7qxMtSZN+oYmt4/siCkiyjo9YWRdtfj1Ins3oz5UsgzDQIpl6fwW9OFSKFOhykEP+wChXHJa1mTSm1UncLNku4nd/H3IGbCQf3MecDVkZcZLxfp4NxbnkwCnXOFkqIVJCvKaNWdt/MfNtwpcWT9yAb2DlmubgdWlmj5NcVNQHL1ULyyiW/8Ubw33PJW4YxWssLi1JA8vwpIEqxUnamMKaFcyj5+g0MkWawqmfeJTYL3Gsw2WBkaot5sJaX4aiQ50vqVXKWDjKhtlC0El8+7vB1rFyBGjJKhOAC3uoxqJAxZHY+RMYUMlSnC/QUzsvu++ifCOWTvTFG8eI0FD45hWgoEEol7rvm92sY3SFKYa8S9NxGbDjmaS7+Mq0puR42gsDhgieZfiXHj8LPgUJRrFnQZrefsgeKWE7r8NXpdOC7tzclo6s9hPnJuucDlARfxmSwanjQOeV2yefcnq0x9/7/1OkOD4CRJlF8FFk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(18002099003)(261009223027099003)(11063799006)(5023799004)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261021121427099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l//DYBKsnCn1BmIMjfhoFScyp8FXVksvY+4BfyRF2Cox1cUR8iLfh8aJCZN+?=
 =?us-ascii?Q?+ReaMse/qmaNirvOsKwI1taQMO8OYhVH0iFZ5xbMHazHQxewLTvkHm5EEIIm?=
 =?us-ascii?Q?t5Yo7yAVohaDDUPxjdgtx9P9lLuXXJwsAJIdmdMt8p9YMEsekHRMHyylvNza?=
 =?us-ascii?Q?yoPi2UVy2bEhXnqpAjLe4QtmzqNcDk5ceFp6WbDKmoNzA/h5wAYJJ8NVwYB6?=
 =?us-ascii?Q?FLV7V6RnD1fUDwJOBLfFAQ/zOagrBobSPGmd1Unj+zvJ+o2OaeBW4h6Sjaq2?=
 =?us-ascii?Q?F4V2zOI2U8UHQzpdI8vlVhJdMKRuv2co/YBr0PfYtfcPTC60yDWIH7TVAQQq?=
 =?us-ascii?Q?xeJ8jCNGo7otySIFb63nMH/EEF9unnTW1kdeDcjBqrrIE6+enzZuovwjZQIk?=
 =?us-ascii?Q?ZDahU08pQrBFzh21yhXCnYVSzBvshCsKAJT6Gix1MiDwsqs2A3+VYiDyAPvl?=
 =?us-ascii?Q?F036o1ynNTcnlnQCyVn8I9dTX9dFmOqzeMP89gqqiLGxWHQ4lzq5qou4hWm2?=
 =?us-ascii?Q?ASO+zZO1raMNA8qsbPGp1YW9dfydMZzmJCDNhZesbJJoLgJFbwIeibgs4Ql+?=
 =?us-ascii?Q?Adu/XUYbDTcWrxolvnnuIi0PDwelovepFdBP+2oFF/FM562ts6S6esBpyPfC?=
 =?us-ascii?Q?QtgvAzxWVfLIOi7CUVEu9Q6gzFo6kDzRdJAbFkE/PZP7ZvSDgmHJGkVyln5V?=
 =?us-ascii?Q?82dUSt12dL3RhjesdI+Z2Aw0IWMVkSvl/C5GPTJthNIsGmm0qj1uvGNRP3rd?=
 =?us-ascii?Q?Wchpl8ZQyl/UNp9bdvQvpMQSfi33zPF0DBkkmw6OZRca9bnNlx2ZhKf/uSzm?=
 =?us-ascii?Q?+fc0HKlj9xBJYNTVWK7geD1fPFTlW5uaLgXlE13QyNdCUiszEVJVcvRi2sTw?=
 =?us-ascii?Q?XfRwy4hr0mzm5T26KNersWEm3aG5opoLYeycynl+SnMJAhaLVOzfdbRR/6/l?=
 =?us-ascii?Q?bFIeWS5Mp1K3sDpXKojhuVKyVfLBlnX1MWe/iPR+SMJfSvn8dilx6w9ag7wL?=
 =?us-ascii?Q?bb5kTIBlHio5dMatrh1iAmr/0BJRYvMuSSyg0YQ0XxHNt/T0bMx/fEHyRpjC?=
 =?us-ascii?Q?mQm8TnnPvA9Nv0FnJciRwZhUeyH3DHFTb/oXuNRq2cTyd1+Dd3tUDGd18uEC?=
 =?us-ascii?Q?SxSbrr4yHEgJFrdnVz60XHzEr3tXpP/j7Y3ckC6mSQG9sQmG6lbaWfuThZna?=
 =?us-ascii?Q?uJ6EKXBgEao/8WF/TZDI0duc98aBpMQKEEcBbrQwmfemwZx2lYXkbd8pxLna?=
 =?us-ascii?Q?bQJw0q1iHF/+VjvWdxr2um7yJUfUgkOFqu5KwjDDlQBxtkCjg8DHhzKk5FDX?=
 =?us-ascii?Q?tEh0nhylajj8joe5tWnbn4RmpTh50+es7zN6L6Y9BfDrc5WE6c3kP15wG8Tw?=
 =?us-ascii?Q?86pUfW9AomdQwhJRpP2J99D3w2Db6B/OeQxCjpwbZJSCtsE+Lvly6KX8+uTU?=
 =?us-ascii?Q?OuoMXr4QCHCoilK8wgL5ATYAWhjTl0px3mezIW7RmE4TlkXOoV+KkM+M1ZV2?=
 =?us-ascii?Q?Gq89Ada09nxVyuiVjc5sD3uPBIVQKUHfnoZlYnuBMxF8dtlveSooSZWDLN5j?=
 =?us-ascii?Q?/8FLeR1wUbjNA0z0rTL7BOKgYsUV6jhOS80Yi+BXRYkoyrFa2Ffx+whQ4AyX?=
 =?us-ascii?Q?BLaMKMevYpMgIhrNcuDNHrH08Ca3C3Ru99P1Q656c6iZnXW8aiBM6aLJWEsM?=
 =?us-ascii?Q?wfdyH9E4kB21ZRPaLvqBI2itJfsnPa8T5P5MtRkqHHdsHROD602gPXehCwO6?=
 =?us-ascii?Q?Dwr95iatmXorJ03/Hyx3qklaCe8Mtkk=3D?=
X-Exchange-RoutingPolicyChecked: 4qLd4RCAMJAL1OaTHXr1mnLOscUYqe/vWgtyyUcaIayZZt9OEX8OPPq+0D6o/ukYJYThwBPrle9/74qkVAkogQJIGrqsp6Vxfp18FVCHHIAUF8ewI8MpDCxpDZFb7Pzd6Qyxc7Tfk+TwSyveGBNzffdZSb3gdq52Haq4bkJi3wNCQjxqWhZ7hjRCtNmCk6OzVhZ3Fc/6gL1KXyVLjbAJSK5tgTQJyZSLao+4VDEO4PFGJfO56KzwWv3wRvxOO/WvMeIi7fdIrkmcPwboJ/CDz6IbMvg3iLF3lFPwO1dvmW9ueYckQslAJDdRnsD6MKPCQ3/TTLs7bgBwdzpgyDIShw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e90b823-9602-400f-5842-08df43bcb6d0
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:36:31.0565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjiHUaAaGhR6MDLsFQOo6jTnfFZaxw7ilr0SZj1aB0LbjTIRJ0EkP7EWpFZ8BF5v9Eq00/EkamMdCHDkHhorCqoByqQHbEWArnT8nd9P93g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
X-Proofpoint-GUID: cRxVV5SBYYoAQxnCO97BdUOPz9CLHEXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfXwgxPA7fYCVkF
 xIyiZSdGwvnvb4q4QKLQdeTdjfRpTjFiggq9/Ld/4GqvEXIzFbUyHQCFqsyiOrppJK96JRwpTL0
 zBp3RthVgyu+IXxm/cZUZOTUUykBIltZ97B2Rl8xnZ1bYy0fjY3HkYAsPqeyVZuON8yl466T/2d
 2k8r4uSIHhpDQ8y6E+5+V1ijWWVeKKQAt+lhryHjOO1EjEaWR3VtizsJYJ/Jv54wy/p5bjtn2ft
 LFg0NeQJt+RkZE4jQPuvVNGF9Z+5xNEf38K3SeBXz9xPOzchW/fHc7yBdumpI1G9GCfm3CEsNy8
 Lb4AmXR3G5yitRpE898oSAGKBzFrMjnAAeu5uVXvSEtJhSFTfzrP/L/gWCqCD4PsrcIdNsV5jQu
 u8gDUuKEUKyiclwc6y9pIk/LSqDbMQHjdzRqsggDBdWqUjtzgE1nW65/fF/ljCVVUsbA8a+gzO6
 LenLW1No2lqCDFDtpYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfXxBcGRE5zfurb
 XJkGmqF4eCnkXWXVHmn4AvELXBAZ1axNxkt6wzT1a6c065i628nOz6KCekXBUMlnGgG2pgvZO3W
 K0cg6CxkC6Qk81c96YLiQP+ChUFEIIxZ03MnMuAlaFDNNiAd1BqR
X-Authority-Analysis: v=2.4 cv=OJWyTiaB c=1 sm=1 tr=0 ts=6afac092 cx=c_pps
 a=Xsn+9nYcq8ItZ5QxXIZu4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=ag1SF4gXAAAA:8 a=P-IC7800AAAA:8 a=RTyAfxNcIBcxbLWgfY4A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: cRxVV5SBYYoAQxnCO97BdUOPz9CLHEXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250316
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes [YOCTO #15061]

The generated SDK/tree environment scripts source *.sh fragments from
$OECORE_TARGET_SYSROOT/environment-setup.d. This target-sysroot handling
was added in 2d9466734f0c ("toolchain-scripts: Add mechanism to add
environment setup scripts") back in 2014, but nothing in oe-core (or the
other core layers) has ever installed a fragment into the target
sysroot's environment-setup.d. Every environment-setup.d producer
(openssl, rpm, git, curl, file, babeltrace2, python3-requests, cmake,
rust, cargo, rust-cross-canadian, ...) installs into the native sysroot
(SDKPATHNATIVE / native base_prefix), i.e. everything is nativesdk based.

The target-sysroot loop is therefore dead code that only adds confusion
about where environment fragments are expected to live. Remove it.

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eff3abdbd84993d2fb100a52159835e98e176f59)
---
 meta/classes-recipe/toolchain-scripts.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index e971b9a270..8bfcde55b5 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -164,11 +164,6 @@ toolchain_shared_env_script () {
     cat >> $script <<EOF
 
 # Append environment subscripts
-if [ -d "\$OECORE_TARGET_SYSROOT/environment-setup.d" ]; then
-    for envfile in \$OECORE_TARGET_SYSROOT/environment-setup.d/*.sh; do
-	    . \$envfile
-    done
-fi
 if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
     for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
 	    . \$envfile
-- 
2.51.0

