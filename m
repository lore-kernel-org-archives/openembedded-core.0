Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23492.1794818937201271038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 00:48:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PRkI98FT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5780073afa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fg942176434
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=v//yipbXi
	pWx1derIPEHPjg9BM/2BqFkxCYM/O7Ua1k=; b=PRkI98FTAEUoPEyBOP81zY8P6
	4yqg5i0msdrzsSPhHcsQ263HHtDFAiRyrRHUHzizVwmpH1Bpi7cJvki2TyuDA24u
	dgYxL6fAXnq0Pyqiwt2e6DGJndQp6fbcEM3kPN+awfdnfJI2lww+fBWoMSw55Wsr
	0cYdiARUHW8kPAlJk2gfQoueWY/ZPDkN6ZLbjJvAwWSbSbcurGOvbR4NBSjyPB0k
	ayPF8RwriCD/2NNy3YYF0eScUExSLV787b7K2Zui7VvXPshtugJYvmjlhNhYfW3m
	p0OkBIJD3pgxYdAfg/u9kKgwkmrqRZv0rZq+XVcWOO1EJAqb3aLAdysrdpxoQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021107.outbound.protection.outlook.com [40.93.194.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxgy7jb5d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:48:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IN8RMCWIBcP/zNZlmljTlgfTxD07NRJ5C1uRPnREx8RiHtFCxH8eWbW8SoMqeCir1lu46Qt6RRB2ZF/m1VT57rs6DFMK2spR5NkiJViqBrchiZC3g5Vcf6kaWo1fLJLNwYceqRLjdvr4Sc5Kr32+O5P4+i8gdzrV4jER6d8bxZkdU2dAx1WrZjxqUBnkXGt7xWQ2DGQzUPOSQ1MMhhyRNL4RysKA3hd4Z1FgEO7GFfyyqYKa7SQiLDO/OZbROtCVCTzBLGMTnUj4k5WUx5P+OIrwxipZeX6RCp2SU7ZFMcuCuNJnbSkXBZzglun2uv04i+uxj3Y8BtE/3drdgghTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v//yipbXipWx1derIPEHPjg9BM/2BqFkxCYM/O7Ua1k=;
 b=AiMSjJq8i0OBnlyCEXQhQUTtsMKlBznAq9iJ1dBh2TIFxRg5sjCEEsOcny/x5+M7WV/1Etquv/vkmOi/I2W8X78s6JC/0Et3cphwcalmX4p3YqVGOHpwFEl545qYfnAqQgR1ZSdLF+s7DFe/WxXVZ/G/s7yNhqcMi3/r27cALgmM4wdMNnwR/9F0rR+zMnvWGt+WJ1BArRtHZDC2izZLGTmObl+lD5+KRt4hGGedn0PfTTeHKhNJstnvNOJNlKtBkc4B1QFOPC2vgj0KEdAyw08yAPR6BTTb8nZ/wELjXiqDiHzcpWTXUlVuHGAmtqiXwTbD70fGtTCiVWKOUQJNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by DS6PR11MB622039.namprd11.prod.outlook.com
 (2603:10b6:8:52b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:48:53 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:48:53 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [wrynose][PATCH 1/4] toolchain-scripts: drop unused OECORE_TARGET_SYSROOT environment-setup.d sourcing
Date: Mon, 16 Nov 2026 00:48:32 -0800
Message-ID: <20261116084836.2336870-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|DS6PR11MB622039:EE_
X-MS-Office365-Filtering-Correlation-Id: be4b24a3-5d0b-4d7d-cff5-08df43be7170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|18002099003|261009223027099003|5023799004|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261026130827099003|261026135527099003|261021123027099003|261022105027099003|261022113327099003|261021121427099003|261022075727099003|261021135927099003|261021133027099003|261021130227099003|261022115727099003|38350700014;
X-Microsoft-Antispam-Message-Info: N672FPKXzP7JSLVqbBlzSlzLSXs2N5uShCuxJGai9nKrypsgeUxwseQ/p8fPmkLwXDMz00dMl2qESJNqJgD5nwVoXE421mQtu8N8bNMw4DAFLJ2gF4mFCaKPxPFrO1nZCca+EUTSTdRmU+Y2uzNoQJMJf6bx0/WL8W2lANLS33KII2iZ9pFYwswzbSPImvMT7Ufsb6dclA4jpCdw6zlv72Iwd3TZh1LWLRQD0/y5fYu5pXDNJyz9OahWw1dtCARq3EHz09xcv/vOnui32hgwnCKMpYms+aeKtJJ5tU+KsgjRHKUcblR6mF+wIownwjKcuozY3/t+ER+I+j1nFhahcdSO/qNu4Z3pK6kPQLpHa9/zx/Slys4NJRyZYxVfgeuEUtQcnkyGeJlY44xIUi/seZDMi71KNiOuKcKQxQTfr06wvCAw5JVgZ5xxw741WJEihdrbJ9JAB5Ryuk8/Xc9YelP5uEL4PL5zqxZhit0fAQ4PSxcgZ6g11RyJU1Gq+DKkcYYtEWJg7WnkOV6/ecjnHZ3bKLoML739YXjVn393l5Xpu1HWHmkezkndeO0ldRKtRuHk0PpbAXkwCah6Oe8Huvv/glwBtcJFK7PLD5VpVtwe9Z9vgqEye5O1f1UcsG44ExPyoMCAtVZSBu48N/Xk/ZotzKm8ItclM9KXPEkd1PGSktx47YVUxTn1B+boDoAOsuoSkZT7LvBi1biPw2kEu7AP6atjKuIBE9zj4OE4FwE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(18002099003)(261009223027099003)(5023799004)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261026130827099003)(261026135527099003)(261021123027099003)(261022105027099003)(261022113327099003)(261021121427099003)(261022075727099003)(261021135927099003)(261021133027099003)(261021130227099003)(261022115727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b796+Z9bqz/EWCXLuNhwSb4vkon+LUUMZci+FYAxkghW0zzEqbzMJs+a7VDG?=
 =?us-ascii?Q?hL5MShH/xr6ghakHFX/zLpCat3ZthYzHjVzhnfCSNwab55fyy812wX1BocWR?=
 =?us-ascii?Q?HtpqoSy+wD+31Vwipp0c7J/lGdDekDXCraJuUk49IvdytQ2Octjc+A1hlsI2?=
 =?us-ascii?Q?716VVBlXtxsw/1vJYUQcU+4ZD/PxHemCBIsJevxRH6km/z9GPJlOYw6cZQIX?=
 =?us-ascii?Q?wtIQAU0jS0zi0qWpWlAjbEGByGB9jAG1z/46W38RyvqLP9Tua54bKssbD0CM?=
 =?us-ascii?Q?aNROE4k1VL0mASqfaj+aAaaEFlz7w8T/dM+OB13lwlbkBk9unD1E80+cHJRe?=
 =?us-ascii?Q?VW8FaT7cauk6QtnIVdp6HbtHN6gk0LTU7f3pFIHEHebnBo+nKKb9QZi6tGuP?=
 =?us-ascii?Q?eLHb1ke9Mmzg/G55p6uWE/K52pQ9x2xCwgfZrZ1R/aj0Isbfq5GGFAyD1tdF?=
 =?us-ascii?Q?P1RWRTSWkgfBncXfXxC78QkgC/IlJrM5Ehm7YojYNorDJ4FLc9kRsj3iXadF?=
 =?us-ascii?Q?gGjrZZMBLMMO11tWUrBSSPdhKmy1MNzOZbkrrnstdjk4VbKLwx/WS8oE9ejE?=
 =?us-ascii?Q?p09t8inMAoKyspwJYqAKp2SS9OT6QxzYehTyboCRnmS+KddNESH5STwWyL/q?=
 =?us-ascii?Q?UTWTKVYsaDVtjrkidz2cSDwFt/RBN5chPIEPdgKLUyWRC48wQf3mi9L/dLJz?=
 =?us-ascii?Q?Y902C77SQXjRdYgH0YVqlu5cd3IedMErD3M+JxduTeyFj+eRpN5Jo7XmLqvE?=
 =?us-ascii?Q?FuTOuZ6UC0M79KoD92z1YLMy19hukRds4AK0BFzv1OnB3Ks7a/zXGCLxchAP?=
 =?us-ascii?Q?JS3OKkN+/6OT1ZA7FN6rlaCebVHp4RQDy647lwsHTgWT647SAfcotCWLcmY0?=
 =?us-ascii?Q?MkLjck6Zrb5Z81hRRaP2IpbgFenGFrBNZWU42Ph1YNXrMJZGlaNri9OdHFFC?=
 =?us-ascii?Q?tk53uNiV7q23CCOyyOGk3qsuOfQX5rYsqRG/QcPGOEu8S2VjORcd1Dvb58d1?=
 =?us-ascii?Q?UsLFoav+vcSaCpjXDk2tYovTGAMs8E/j130W8+7EWiv6XifKSZOdCAC7EQRR?=
 =?us-ascii?Q?TrsPIYg6GhTsrc/th8UPrzHfbks5c78gloSaO129Y9J57dRCKUhvQKR8g4jD?=
 =?us-ascii?Q?OhjIgsnj5XpK7XgzphPF8A/KOVxDo9vXQ2IAPgFBke0l3FqSj8SjwXpRXFXD?=
 =?us-ascii?Q?XzkDvQ+5A9KfxAl6KT0yekFKA3AjpvA2hCrA96UiUzw4YhyLW/tnfjEl4kyZ?=
 =?us-ascii?Q?ZjMr1qWWdAcC7+frEzoeuAcaaUz6U9R/u33Ivu0qT2Oy7WEn04+JTiP6mNCt?=
 =?us-ascii?Q?sTfsneg90KQwhcSGpVgZhTrimVWpWUbeeiC3q5YEJvXFu7WR2jPdCOYqD1u2?=
 =?us-ascii?Q?zN1X4EM9lfjpR2LKiKJfQeNj2bmEBMY8lU5hNqzLcJDqYyexd+9CJQYlOQPd?=
 =?us-ascii?Q?1zRQmattfr2O1nGSiT+roPX7Gom5m0px36GJTuDJK47BiYRdOaC73+LPrz4+?=
 =?us-ascii?Q?BjVpdMMpZ2M095cIqJPt58OBkPXF3DwTYVojDjr0Nr4quffbUguz9DzrczHp?=
 =?us-ascii?Q?eTr9uTbxvFsEqwhhHIvXaL0DsavFtVYWVurj14qzEtOIVuRwPNIKRzt8eXyw?=
 =?us-ascii?Q?kWJZfzYPqKTaT8Wz3umgFJ2XfhxR0qRj+Pd9vjXZ7osEm/SI7tuodrdeUSQX?=
 =?us-ascii?Q?MoVfuhasbfRdFdqFEvPhZBjHyTX3uspsWDgS3+AdHdRtNkUWbWrviYNiVGhO?=
 =?us-ascii?Q?x/KXTxp0ets8vNtvoZ3I+kfOuzpHKFg=3D?=
X-Exchange-RoutingPolicyChecked: xSwaucxSsu7uxCe2SxQasBMCCZYa+Oz/ChxH5qos9Xs0Is5evNQzeaUp9chqf+drr5Ipig+yzmfNt34OpWypNR96u2gkgqAHqAwV14jwxwvACIaCxzyhxyUSeqU4DzXW1RL6cnmRVIvvh9GNI3K0AY/50z5vGADGeJkgicw+NPPy+hzjTfFfzNJIbqKxC6U0FTsabM/paNbUN/TFUVfOVAij8FOJlbfEItYgI+5RCXfxgSwlR5H9pn0ap2X5W5Xl00yM0+R3Tg7jAa8cBEGMPHPP5ZvGtIzuRkm71Mb6vSfZ+XdFL6wLy5E8FIxGOxIj0kWtLXwMBjyk0m7BlT+akw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be4b24a3-5d0b-4d7d-cff5-08df43be7170
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:48:53.6487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIj5EGahNjX5Ya7Vz+zZwIkCo6e4Dp9lcM8B5IfHkFN6SFt8pRymcu8WqekPktrJn1Kkmcrx4TzwBwWqYRLnRXxPpBwziaA8d4wW4ux4NWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB622039
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfXywxqd/JWTXl0
 Nn9VoeTmA341sCMS9DC09gnvfXJ6v8dO6Y5it32AllxxDjm+TXh3/GUxVMSq26TWt9HedeylenZ
 bN0Jm6XnI6G1+8EtnM9yT0e/nMyvDjrxGwnFv89T8FYgj2+12naI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX/kUGFkQoEwjy
 aFSt4YA8H4UfosDy/NZlTpEYq4qq/hIiXSQfGrq8ecs0k5X4IqFWY74WaCbJjutTNEyOZyak1Y7
 /Mg02d2JL+oa2NcdxvsAxbYxEHJ/nmbww3FdGWQy7FjVEMAgAtchF1g6v0Fn2Kf+mv9W7liVHbC
 5EMtHAbHpMc9lmNIilM45MzMUl6DeWAlOWW1/GnFFp/GrqjqJ7KVpVpc0rsYOXI3FZZr2l6EwPA
 UJnGbSewAsvQhc2HTAZzzwwM4DixgfQUx4D+hUjEfpMOlW0GN2KG8TpGbZ7S0noWnG/4GT0HA3Z
 0JXv0AZ1Zkwzomu/fHQftU6pTv+AsCA26KgXNpCx7Wir8DZLgBfimFGwRCRGFFdJn5rfcHwQ8IV
 NiJdCWSOQL8LQvrF6mRRwSbEm43+4l1U0TZHFwb4ZNOFOwnV9HMiTMlreMzAf32AvCZ+krLXJv1
 o9qu19gaxhqkjkzrt+w==
X-Proofpoint-ORIG-GUID: xpAhVRILdnSHAVDQAs4wsgpneM-niDqP
X-Authority-Analysis: v=2.4 cv=c9g+0h9l c=1 sm=1 tr=0 ts=6afac377 cx=c_pps
 a=xmT5btM1tXsMPZo7WXzprQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=ag1SF4gXAAAA:8 a=P-IC7800AAAA:8 a=RTyAfxNcIBcxbLWgfY4A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: xpAhVRILdnSHAVDQAs4wsgpneM-niDqP
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250320
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
index 3c1ceb32bf..8cab82ec03 100644
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

