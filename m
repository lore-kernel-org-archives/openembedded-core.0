Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23493.1794818939217526356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 00:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hAqnumEI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5780073afa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fXQO2176389
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ptYtZTDo52DXcKAhrgMf48IWegbb2aH6BTNuf1Qowoo=; b=
	hAqnumEIxMcx0MiHpMC90eQT93OhvIT4NkvfAeE0k+Pf4P0Y170VTdy5mqWSmW0/
	cDBhtp05sKvhhbViYOakoBNgi4VCj5KnaaIS4FP/WFqdMfGtBNTnBhXLgQG6MPV2
	sBTSdxCHQAsB3KIw0cjqFiDj0ubPlMLc1a4X0ro///fl3HIeeMEPd4edi2LsfuNW
	XJNqN2muO+1qZUGQBTdx2X2FxOVwkwS+NAGPWeBnAVZPzdGReIVDxUHpR85NOO9N
	Ngp0g7sdLg3Qo3ehVVggaY7LDotcxNi7/nD6DJ5f6y1+nhTlR9jfQQMeCz9FYred
	gCPHwozYvp3HBGqCLd0ESw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021077.outbound.protection.outlook.com [40.93.194.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxgy7jb5k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:48:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PldBuAxKzpsxycjK2nmgIlOyAXDVBIY9q972p0ZUFIsd8/XTZue/19SznxNiMK8wNL7hI7hjuPL6EKBtzt3j9EsFxtZTb1gqXDbroIJ0TR1vECqWhGlERDia/IjpzZehesT89Vdh/cEVYpE5RkZKn7jCNGI7SvyvjlVYcSOMk3D8dIttCH6+xK+RuReTSfftYCwMlV+79p4OQ1iTgm+lMExxO17vFZV+hT/4/nlMWModpWw59rjbds1p5gfoPU/diWxtBN200VOjR02zJUT57knNpNKR3QdVvAadmCMcGFkgH//97cV8EDv0DhRs73Gqn+gfl9fo55+P+CgC6CES4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptYtZTDo52DXcKAhrgMf48IWegbb2aH6BTNuf1Qowoo=;
 b=museoM4gkm9HS5xgE6SEkKFxQP/DZBG76p07vjfTHGxKOoBWCzP43uDw6WLhrdmmJmTTtpkvP+l1XL5jo73W8SVEZlPd2+jXybWWay9lFFfyo6k0j7L5T61C1RS/tIbl2Z0fXXHX/miH8Id7eZ/3dVh/orZVk8dtzZdAoyNN2JSIR946GSto6l2sqBP5vvrQGkPYDllBGSBEyBkHymYYENKsRx8ZbNwZ35AxEdskIj56NAku06Pd4L7MkGvyUOh3u10VE49eT9gi9Pua5B1PwzpjzjGZ7NtA10exwc6Vdu1s5bEQqitHuA7XhCk3yGYmSS7F8Zs8f0QAO2zyAB7v1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by DS6PR11MB622039.namprd11.prod.outlook.com
 (2603:10b6:8:52b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:48:56 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:48:56 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [wrynose][PATCH 3/4] rust-cross-canadian: install target-specific env scripts and fix rustlib lookup
Date: Mon, 16 Nov 2026 00:48:34 -0800
Message-ID: <20261116084836.2336870-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261116084836.2336870-1-Harish.Sadineni@windriver.com>
References: <20261116084836.2336870-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|DS6PR11MB622039:EE_
X-MS-Office365-Filtering-Correlation-Id: 05897a9e-e810-4a3d-6b1c-08df43be7345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261102130727099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|38350700014;
X-Microsoft-Antispam-Message-Info: fcBstGdzuUitE162Wa2alqzLqlCccJNoQMR0NnxAYOJKCY+W5Tt/zrNbd+DE0W6H/5hcNIxdCWn9NWo3xHGdemrz9m8NqaBt1rKxVLMdBu8HROgXfcimU9RDRFb1gEn7FFs4+mCrys4aaTTTbkrmB8UxuXCv8NaMIfNdYzlrgUnB2GH58BmERaq4P11Kf+DDRcaO/Bxvm9jkN33/n1YNRkag72zh2G/cD9D8yegE+DHVaQTKYZycpo3DRUwyIH+H9RmLPwQFCv6dy0reXQYn9x81Ovj1vC9VTkUZOF9YjZXIMJBu+s1TXBQktdDmz28qmghRPeerR6mfeXXrdVpJapzdPzCsMZ859HqleZM7bYnb8huUUwau4k2HcfyK2xoS2haVjM/i4x1yL3BC2pnaOjSlPcPwmSBI203FZV0luxWYbnGv1eizCA0A5qWXmd7wHRmz+ELsCDRzOOWqbGmcR4u4IQFGlxx4JEwFaL/v2+gXUCx9SNuoNZ73tkNhW/4VWyyI2T9+Q9+4RxLbCi0xkRT2b29+2/RXMygej8juFYc7WiJEcKyXJ+htwHDh3NDzWw35g+BCqCpFE8DTEp+CPaYYs0MYs6tf2OXA1jdxX0xPyygf2wXsCEBmfLEMHKND7Jzb1x1ML4vNPQqkfwIK+xNYM7CJyEqcBT3I9ABULebj7p1yodHLZXDA09P650jvxswDtjp2yMI3bAtGOMEGmm+epwlKXhl2X2h6VWBQgfQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261102130727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?diR9zysTgyczYXwQmmFh7+odUmKoYLE9gtHnyn2r84HLot5sngZOmCLv81Rx?=
 =?us-ascii?Q?ahVscx6xJJEQyhxF9VMsV/t1Vwa6fOrc93U+zGhCo/7XjauLrTpGj+jjId4L?=
 =?us-ascii?Q?VInL+NLYOZrmtUWtMc5+Bab26sDHW9Myv0+slVBHDu0UWJSOrlJaMWxYzYeS?=
 =?us-ascii?Q?EQc9nxNp6uGR9BoSfbcym3uCG3E4KlUIIM0NNND2fyt+W7mtuvhBPrN3gnyq?=
 =?us-ascii?Q?ojgR0aH8S0t9Ybhm5knEQ0GjkjLDjsUcwH5RUoc5JkLlEOx7os1lyPi170jz?=
 =?us-ascii?Q?VwJyzkJZYu7EzTBHkKG1lTOmfGUrzLQnsj0LkimUd8xuYDlcR8Mj1KUU8y2J?=
 =?us-ascii?Q?3Dq7aF0NQADjZs22A4x7Oui1Uaia0VYDfwuJOJCca4uWM8mPHMInvbPu5b3x?=
 =?us-ascii?Q?23re47nbKwU9+zWMsgpQnoy5YGRMZp+3aZMFi6puDchO1C5o9Ik1R61PdzKa?=
 =?us-ascii?Q?SA+//1n6fzRcmtOI7IUoD8JR84yT3JCcw4LAWSn5MHaBScWS/WWmG+5lmvNX?=
 =?us-ascii?Q?74nch5FrrtiyrYtYL9lVFbY2CzYqdJJOYZ/b7aUcieuQdNz+d0E7wY6dwxYz?=
 =?us-ascii?Q?5dZqZ406BtmME7Bhvb59FCk65KVdo6PJWMRr2kYrVhHKWrTcBOtJzonxPQaN?=
 =?us-ascii?Q?gYSTOv/u7Ib3Q94vnEmoft56IbQ9PZl1R5CoVld1nAd+YZuDymtSij7DnCFZ?=
 =?us-ascii?Q?mSCYL791tM1GCwfzKhKaqC+3Y7nXyS77tDv3antSQJzj8YLPdlOUhjIxibwv?=
 =?us-ascii?Q?4ksLRbp3oUyICM1qvP/z93T6sWA7FOFjB6ThRuwohMtbCAV7DFEp40vjhXUe?=
 =?us-ascii?Q?vLC1BiQJb4VX5rXnVfjS1zAAfVSMRUBhzXTkGw+wPfyLxgGEpv8sk6GR5Wkx?=
 =?us-ascii?Q?KcJnrwCYbCaniAGOCkVFmgI6+edh4NATybmHB33rLAwSaFfS340uN90zFYSV?=
 =?us-ascii?Q?8qJ+ymV6RB3+AI0Qm3BdcGT8sPP2pUsDaI/5zJ5SQPLdSZJHsTpyScWUm95p?=
 =?us-ascii?Q?SgxFTOivDbN2bcmYjqwOf2t2x/dcUqeJhqaLlK5N0yp3fqerN3IGOrWg9leD?=
 =?us-ascii?Q?jXyHNMKuFuYE9uzRMppMd3ZoK7Zuklfpd8uNw1BXDOxZEGoiV65yHCQp7xm8?=
 =?us-ascii?Q?GEjhKde+Ye7l9eeVikVReVkSAfn8CF1Stb0f6BD5x20BejSFVFsdRL8npzH6?=
 =?us-ascii?Q?tQa5+aWZlIU36T40dh3WP7bEsM0A8NSNMj/Eo2h/B3aIzSGWlWPlh7jh/TkZ?=
 =?us-ascii?Q?vPH3oYQqWTL2qF9ah5OrBgvamW/SclU2CxvBkiucGAEBQQ+KyaHqL23a4XrZ?=
 =?us-ascii?Q?4pWSDH6LoRMxT2OToVZzLuCWRh/KMRcSnauEPIBQ+7ULb+xvoGb06jTkalL7?=
 =?us-ascii?Q?IGWsPGRnnxbh3FoYctP6dRBzR3YWKe6g7PpCtwpXzTKW/b2geaeRLoBrMKPe?=
 =?us-ascii?Q?ypZRGSFNYn4kH8uxcbJAfuamEM0iEbwO+ipJP9OKl+/7hMP2AftN7pQr9c2y?=
 =?us-ascii?Q?AI37S94YltL4rQgRX7EvBJoZPXHzA7Ac+aABaLq61FPc7HxLQagqlf78kiC0?=
 =?us-ascii?Q?EUaTYWPYwLFnXaYR1J1Vln/S5f+vX4btMm/+mo/1J/w8W4tSyVHrJJYTGJlC?=
 =?us-ascii?Q?qr8XzwNcDXaCe8fc8jDqJwCBSU+DFGUZhHM6WH8/ghwI/E2uw9/WcEgJB89a?=
 =?us-ascii?Q?rKIHx0Gv9u4BiNXFpRif+Px+bQYS1xl/S65Oej4HoRrqfr0wegP1Pn4n/int?=
 =?us-ascii?Q?BYcWsnT5SIZ9bk05lBn7sZ1LVueF4b4=3D?=
X-Exchange-RoutingPolicyChecked: vGvJhVruSEWeD3UJpzkGqQihXbC5A4OCcDfM9zEdt0+5s/NR0nb0AtYsY7Iv3T0SsSqev1H9/f/rlqiXfS7O2cTNEbxwHFrd5Ucqv3L0yw7yjlbniLC/OfAboYx3G24gGpEpe1qCHJQez3QK2wFlFHh4JVkU2YZ8f4Szov9Ssl8XGf1blMgSfwmovE7SoROY9r1Ud1OpVXCMYvMYqqVAQui356bHhbWFDb8EQ3g1hBY/YivBb6MeLF/62JXgFwPEM4Jm/fOL74y+1q4IrBJOc3AYtu3xCjtB1xI4omlAIpqAwBcgbYJBgBBuwk0R7B3WOI1INnwXn+JqvLfb0Nmlyg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05897a9e-e810-4a3d-6b1c-08df43be7345
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:48:56.7178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z30S/JWP1qvs7xaczznWXSzDgxgxQ5iUVo7jEFfuovNVwcAP9SG42VzHnafICBgNv5rukIotOyma8IzLUxTtyP0RIz2M3u+NfVXohWF2eJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB622039
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX8YHFmevSYM6b
 2BUQ5hDCL7i8MH0u490Dro0Oxp92YECLx7rmShzOdi+HbHd7IrkwwNyQ1s/JelkQ2yS9j1W/VYe
 0INrFyWgiK/LpAKCIwtEdy2EMn6CP3Awq9KOEzqQ34MG/KIzTBAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX+fpiG5iA4SwA
 7UGzneadrZ4yCqd65oJ4lfyTyNJ37wm9BppU2zH+uHJx1b3RC2n0sWWT9YhETParTSp8y2gjmnF
 QxWlgi2hB95d4z+tJkPfxV362Xak4zdpeVisdimoPwLasnRZwUPl+dEOvbP1Nkvhq8wX67o4rNa
 93+h23zuxLOQ5zLh4RAYPiD6wOMB52O7HDXZ8AVv4gmq9ZJZR+fXSPEoaUB9b/vLw+SwsAedoIy
 7Lwtucjg8dPN53FT4XjoHkkvbKkOY0bXBDiriysdsOT4w/X3/rcd77GyQ/PjRU8CEZ+ThD6zJoh
 G3bOW50X9UH7xyFnQGHi2I+B+9WnaiQUl4eTEWY4DbtayvaN9dFrxKoqJI5a2/Ubv5QPj7cyFUR
 0l8Bk/n81n+WgSJtWqr7jBaXGCBCf8Om5MCAfky0+MUrBtMZbmCJrCx+2uk2P3YLDYK2LspFTyh
 J+hZuNynWPxurmKslUg==
X-Proofpoint-ORIG-GUID: PkKoETPQpG6SMZ6g8xQnwnnpmHrNFofl
X-Authority-Analysis: v=2.4 cv=c9g+0h9l c=1 sm=1 tr=0 ts=6afac37a cx=c_pps
 a=bQgB5pj4NMiodnwxFn3P2A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=EoEa0L0g2eIUafYROuIA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: PkKoETPQpG6SMZ6g8xQnwnnpmHrNFofl
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250322
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

