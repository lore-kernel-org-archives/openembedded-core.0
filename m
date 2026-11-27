Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16255.1795787328385141503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 05:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=giGCJElO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5791710b03=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCgOMZ481821
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 13:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0XJC8l2/H8E8pDPwj2tukXD14NRV18+BtRBIR8Igj5w=; b=
	giGCJElOKsrfOSai3CZxqNinQUseLTgB0RTCZ+cRksrSTjUtljg5xhwrIeDSVgVW
	89SPUxdUrdOD1F3sdY48OE5vtieY751Qfe1+XvzJCEhC/etw9wMzRLn/4Vu9Fq+9
	xKqHJoR7+C3xIVC+YJfQxHx49usChED4fKnrEJbhL2az7jZ4cfYHOTBGFqzfD1oN
	qZyVLlqTj3oezD5dq/JMtYDRJTY6ycuC6SZBBzIxT8pLswbR0TmJRZoPTm9ExjNj
	oqu6u9r1jtV6b62HWnx6SeUKxD6BuV0Tpz27xdaA3J2jycMHe6gMGdT7hNU5e7Dz
	VpsN3vuS0jBgdIwSwgoNVw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022087.outbound.protection.outlook.com [52.101.53.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j517hfnt3-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 13:48:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgJj2DwcNu9l3RanRJvoqXAm10UM0POuscTgnSAETpQj0rwUZPxARXsoVJCsLruTHaoPHxpTY3ZBYbURkw1kf/tLCRDpIREGxdgEHPvfgDuvBq72tYUx4bzxwHHHYOpepLMEnAZfKOl9EXg9aNR/AZ2iPOHN7DMOoZGTtPnpwaAqFtcZCPSoMnNiet3Lv4WC0T31L74/HQPtouFQhoFryDl6zcULbsamVXvKSK1/9QInG+XroT5ofhUJbZZR96llGRjKk+WAqnuJ9eRluEn7hXb5n6wbiISl5YCtXqJqhXxsWGydeNWhjbXE7txHlhn1PB94usCpI0/CAhbBRFJuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XJC8l2/H8E8pDPwj2tukXD14NRV18+BtRBIR8Igj5w=;
 b=HVGex0ATEfnhYHcABJ5saZB+TKzcV+mWpPnRbR4XF6rheSHQKiNoIg4q1+azKxYsKtiozjriX9RazY60sA1YFyRUbEFZLAqkRv6Nze4nE3NvAXR+dj4zsgZpFdODQZCNpF6uwmvYup4I4rAL9AIsk8pgm+tuYy+c+5fnBslbu5mrTL35XAHqEFTo3y7rptv3lSJx0i2LsyR45oLmgGw7GX9o72M4mJT5RG5P6lUkvLxB/SieOyy+nVVZOUuirJdeE/jZXvfApueMzcAVL0WrWILegMx5GnkY9Y6CbcappuZN40hvyxTcGlPloIDR90c3DSjZDzKLp0S/5u5zA0Ua6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by DS0PR11MB7406.namprd11.prod.outlook.com
 (2603:10b6:8:136::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 13:48:42 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 13:48:42 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com
Subject: [PATCH 2/2] gcc: Fix for CVE-2026-115455
Date: Fri, 27 Nov 2026 05:48:17 -0800
Message-ID: <20261127134817.1736030-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127134817.1736030-1-Harish.Sadineni@windriver.com>
References: <20261127134817.1736030-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|DS0PR11MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b8ef21-1153-4a94-fe54-08df4c8d2642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|38350700014|10067099003|56012099006|260925021911599003|260925021311599003|260925022911599003|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261102124527099003|261102123227099003|261009223027099003|261009221227099003|22082099003|18002099003|11063799006|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: xn+VdtxqVlIzOtMDQ4s18Gp8oQPcP3wAVkCgxXf2PopU6vMxpolU2BSgspxU17QrOyO/jyJ388zYjGAf086KJ3ZZMSEcV0AvyJ31xbRG/yQdC2f2nj8QFPhO3I3RG7ZbhljTjFfgfpOMZ5vkTciFSH+Ygv7cwg13E+EN+aUKfd11LiX1OSucOBxI/hyQH2Rn9rXQhG0MLF6/x+ecZMYG8PkHDyjNkJuPcMG6X8XmFHkeE6Vwprvm682gYnihrIlLvKktSBk4gJc2FTFAhaHGqz0QOeaML0oOpFS71DFqScB/v1eGATRA9hBoaAA/WMQrDOf/0i/WJuIdA5fTcngpM1plhggT4TFq3aLvNZgii0q8hGthpio4zt7OnQKeKUqJBGl1CL7WAg0ZROLaPni+Vm9muil9WI9QFDmuyY4N7TWhUBBtyWkeVh10506ABifC70KWr5ezFPRkdaTto+7iVw6vDgUbsoPmWbkdKVw6rVOTwNckUcdPHaw3PrzmwLFJ66CBuGWJ70nbWv0OeObXkiUg862ccNVJWEF4utxxqBdANz4mCBu0dbebl0wDVKSemav59PLvTHhbltAiTuHIgFb+j/AUPkkt0YClFTbn/oxJQHNUhtKdZ6xA6dT0BvnfZCIy/MOPHJNd9CfZYfQ8SoVXpkj9uG5DLdKhZZKVZ3pEQxSJ/7nLJx/R8aSKVt0uz2tlMITT9FlL1BmIbj/RAHwyclpI4SPVWB9d0dvMQ44=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(38350700014)(10067099003)(56012099006)(260925021911599003)(260925021311599003)(260925022911599003)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102124527099003)(261102123227099003)(261009223027099003)(261009221227099003)(22082099003)(18002099003)(11063799006)(6133799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NcmuRctXuNM36V/dgJJrjfqxL4927QmSErf5QJ2wqyVdqHeC0Bc7XtaR+74l?=
 =?us-ascii?Q?GmQccvZOmKUG2SBwWPXF5FXDSRWtYnJ+ysox2kE7jNl/WunR2mfXdoKz4Qhx?=
 =?us-ascii?Q?NZf3Y8hsrnNE0Ipw7bzUq1SmsY6cRw9yZIUFKDZ+M6c/m2Q6JRofOhDtKfhs?=
 =?us-ascii?Q?Tvf/sHr6ragLi2RcIrqMXiD2zH9MZs+aHa7a/VAoQJZaTxPr9kcIt/ddp2Yw?=
 =?us-ascii?Q?IiBRxGl8NpjQ1ur/9buDIDbJNbjCF+Eh/uzWkkXo8aJa3kH+pStibh0WSRSa?=
 =?us-ascii?Q?/HvQFRMdJzrVAxDUF+YYZXEz/rWUY/aCjynSpH+Y3SKf3c2UByRaAstwrgX0?=
 =?us-ascii?Q?GugDfX95oyr1sRuzobIUAYpXAbM7U4/89fZGb3TtIb9mAo+YFiI2EWpAYJQ1?=
 =?us-ascii?Q?TwijppcWZ+V3LfptobNmYIZH8PJJ9YOgNmZbDxJj9FWM9Ej/FmINkZtdJOS9?=
 =?us-ascii?Q?JpZM8/gL67QZBXCdLqOM8+fTcR+jlSpvySzapkHfTFB2bl6SjOp8npJIplZG?=
 =?us-ascii?Q?blI0eVppIdM51sXbLcF2R6Q4t7msSWqxvq6OcsqjJ2CLLhi28z0ziZCDpYEz?=
 =?us-ascii?Q?izsYh2TtFn2nnUZfbrQtfXj3vqtWHWh4NMMMV0ni2CZxc9V2wVQa924Sizxt?=
 =?us-ascii?Q?2ZrVL5JSblkYWGFM6UVtJ/yPgqdO4ljEoPGbPkPkkgZjFFyasZc7FJpB5+mr?=
 =?us-ascii?Q?vNApqu5FwJOhTvjxBneCUya5gnrdWTZ4bvbSoT9enAuFD0mDrQ3Vytv0KEhd?=
 =?us-ascii?Q?r/JsR0lOlA3oMVblYkudag8s6cKWt8kDDsmRL50t7CILbkVtcXxCr+b+kvHg?=
 =?us-ascii?Q?qKfhLCbMxXSsgC6fOsglbiwRSv+mYAMkQPKjzfvCNpG4zYzPnjaXESiNp3ct?=
 =?us-ascii?Q?N8/4DYl7FNzYV3QjkWgCIFFOb1dv0QL0kJMxH9RzMP6/qz3uwrZPJbfVWZMl?=
 =?us-ascii?Q?0Z0GhXpX968bDyQIJN50aALGEdBn8hsA/JWgBcsGCtdtuLC5zph9A82HJg/8?=
 =?us-ascii?Q?gvctKRoM4mjudqBsMCGCl1UcGue4FQsmoOeM4yFqJ7K6DRsuywuys7yEYS8D?=
 =?us-ascii?Q?H2bDPbA09A8Y6ZHt48QsYL6VzMFNqNTOWrTPgrct1rTWHV1x9BfDgdUMN4Gx?=
 =?us-ascii?Q?b0NlJ1JKbG/ev5hI4lc8k/cPk0m4rMTBkNSyxdqRNHZKV/PWGy1Vs6h72AtU?=
 =?us-ascii?Q?uNKtCbvhhNQhD36n+0/mTINdTzfH3Q/CoidEYubywNmPRiuxxxWHVMBo0VfM?=
 =?us-ascii?Q?xcv1YjGHlJYsDXRfnkNK+LPztCCRNHsnCdHRyFekrXTUqPTYDGSFXpLCWjjQ?=
 =?us-ascii?Q?sP0VB9R02iWCe66NStM0AHsmThTh7ROvq/eIjqTkOsbszMrWNK6c2mDDNK+o?=
 =?us-ascii?Q?oBe/RSOTJyyMjgkYYOaZeknE/lvecn+ZB6BmC8tXlsun8/UCty2sXpzpiqVC?=
 =?us-ascii?Q?d7tw6oOJe7mJtP0FsSg66N9EjDdBM75kii5vGNCZgV3EGqgTacwENA/OCxy4?=
 =?us-ascii?Q?PhP2U/owisVvdNaf/2uGOIjCOkNergPemy4NzagnYj3xGXFN9jrnEtiHVE6H?=
 =?us-ascii?Q?1cXvDNkc+zcew3lruJ5WKGOYSeRRwkTFqOL/FKNawkNxUpny8PfmcPXx9qm/?=
 =?us-ascii?Q?8NNe/ShMgbYRxem8UtU4wqS5t9cTsHFmVIO742laH2KgBy3QP0uktrBv8kcr?=
 =?us-ascii?Q?5kSgrlUX2HkVysl+bGZRclEUzFLXrdNJcOpWFYmvxWr6gZd2z9lpvf+9oHNQ?=
 =?us-ascii?Q?XfkS3KL99XRn79otCHc/BOoJX3jsU3g=3D?=
X-Exchange-RoutingPolicyChecked: B24XaEFvUgPH7JzC5yZHG2UXUCvZ2Pi7H6FlBNAPSplAzp5u4U2wEqRfbGiK9kb2H/OkT15DoHJyLyUYi3kV189HSer0upeUIbtM5yhQYM9I0NDAZBxXOAxm6gg3UOpMFvPoNRtedrppKXXISJSiF+lurwBGjj2UPcdIZKzuiPStVWmkSyyvAE3AKhe/zkuMU2xAVQii+t71W1U0Qe0xDP5GmKR98bHpK2J8nHNMDfqW7zP+hLflUhwsLB2dx5XAe4ubhqR6xUJdQfbbmqW3XDX0XPQAyFnh9AkbD96PFf81GaLNX38peBVdixn3HEQoLW9IMuSFocukAYneu1WgJQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b8ef21-1153-4a94-fe54-08df4c8d2642
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 13:48:42.6845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+x01ucdlV5sfUBbq3xtt/7jo5DRbKZHjDSVc8MEjPB7nGkzG6pNwt9kcD6dEGgT3Py//gTpT6bvx3+D0rJknMz8Loxff6V5F9eIGF79yFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7406
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfX0wghVAqmX5qO
 aUApz/R0kFEiAV3Qb2oRagtAFX7EpKNtKih0gDmxT9hZbyK3bNFY/JLPyCcP0F6vK7b881LMeTf
 uRto7+474y8xISIbX2FkhEgGrRxVa84gvXUHnn8E2xm3L3FxeXpv
X-Proofpoint-ORIG-GUID: VzjFLyQlfb3jSi2_nmeyTp94HTQbJ05G
X-Proofpoint-GUID: VzjFLyQlfb3jSi2_nmeyTp94HTQbJ05G
X-Authority-Analysis: v=2.4 cv=RutQvymK c=1 sm=1 tr=0 ts=6b098a3f cx=c_pps
 a=w/xsMB98MdRKPpKwYm4Ziw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=5uHtDAzNaJ_H4I_E8DUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfX8dDx3V3dCYGk
 YHoI01u7e0qI1HmqE41nhuxenXfElIHGpIymBzkmxxhD8RWiRC+wmoIq8KHii0K+7o6KUWarDXZ
 BGnhyHKV0EK3yFptNLUt/aTEYDa3V6W5OxXIAhrrXL0CeQ5/HIztPavFQ0ZX0MDsfJimP9jFWEk
 jm89ITV9VLpuIgJfG8q/8D9ac4yyuly7Inm+Au6Y4LS/kmdmMvd0G3MQID/VzwVxFqBxE/KX9t4
 m1VGllbKPaYzkqHQBBvGzdwkX/tiFvVTjQd/ORu/SClc1phBEpJYOlgKggKF+ScGJFWUvijeQ9l
 8SIT9Ck0swniMmVrZE7Vtf5YAwIaWOmUgqh9T4QnR+Kzmmed+0tZ2xgRB+k+RIPTwn5nkAkVpzQ
 49u00dq0V+YeJE0LqYoXAw9XGESABJzz89qDXfxPqGGz8d3hZBbUGK0xQMMpF8g6nyrkvGk70Ca
 xRI0Fi1uB9ASSO+A1lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 13:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251390
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

libstdc++: Fix stack corruption in std::bitset stream extraction [PR124370]

The __builtin_alloca argument didn't account for the size or alignment
of wide characters.
Replace __builtin_alloca with an array _CharT[small ? N : 1] which is
used for small, or a heap allocation otherwise.

Refrences:
https://nvd.nist.gov/vuln/detail/cve-2026-115455
https://gcc.gnu.org/cgit/gcc/patch/?id=5d419c69ce2e6b86d7da75f18736904885674219

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0030-CVE-2026-115455.patch        | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115455.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
index 4361fbe208..f0779b14a9 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -78,6 +78,7 @@ SRC_URI = "${BASEURI} \
 	   file://0027-CVE-2026-125709.patch \
 	   file://0028-CVE-2026-115456.patch \
 	   file://0029-CVE-2026-114691.patch \
+	   file://0030-CVE-2026-115455.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115455.patch b/meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115455.patch
new file mode 100644
index 0000000000..9d2e1829f5
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0030-CVE-2026-115455.patch
@@ -0,0 +1,145 @@
+From 5d419c69ce2e6b86d7da75f18736904885674219 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Thu, 1 Oct 2026 22:50:13 +0100
+Subject: libstdc++: Fix stack corruption in std::bitset stream extraction
+ [PR124370]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The __builtin_alloca argument didn't account for the size or alignment
+of wide characters.
+Replace __builtin_alloca with an array _CharT[small ? N : 1] which is
+used for small, or a heap allocation otherwise.
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/124370
+	* include/std/bitset (operator>>): Use array inside _Buffer
+	instead of __builtin_alloca.
+	* testsuite/20_util/bitset/io/input.cc: Suppress pedwarn about
+	C++14 binary literal.
+	* testsuite/20_util/bitset/io/wchar_t.cc: New test.
+
+CVE:CVE-2026-115455
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=5d419c69ce2e6b86d7da75f18736904885674219]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ libstdc++-v3/include/std/bitset                    | 31 ++++++++---------
+ libstdc++-v3/testsuite/20_util/bitset/io/input.cc  |  2 ++
+ .../testsuite/20_util/bitset/io/wchar_t.cc         | 39 ++++++++++++++++++++++
+ 3 files changed, 57 insertions(+), 15 deletions(-)
+ create mode 100644 libstdc++-v3/testsuite/20_util/bitset/io/wchar_t.cc
+
+diff --git a/libstdc++-v3/include/std/bitset b/libstdc++-v3/include/std/bitset
+index d581606e7dde..469c8da9ece4 100644
+--- a/libstdc++-v3/include/std/bitset
++++ b/libstdc++-v3/include/std/bitset
+@@ -1705,30 +1705,31 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+       typedef std::basic_istream<_CharT, _Traits>  __istream_type;
+       typedef typename __istream_type::ios_base    __ios_base;
+ 
+-#pragma GCC diagnostic push
+-#pragma GCC diagnostic ignored "-Wc++17-extensions" // if constexpr
++      static const bool __use_local = _Nb * sizeof(_CharT) <= 256;
++
+       struct _Buffer
+       {
+-	static _GLIBCXX_CONSTEXPR bool _S_use_alloca() { return _Nb <= 256; }
+-
+-	explicit _Buffer(_CharT* __p) : _M_ptr(__p) { }
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wc++17-extensions" // if constexpr
++	_Buffer() : _M_ptr(_M_local)
++	{
++	  if _GLIBCXX_CONSTEXPR (!__use_local)
++	    _M_ptr = new _CharT[_Nb];
++	}
+ 
+ 	~_Buffer()
+ 	{
+-	  if _GLIBCXX_CONSTEXPR (!_S_use_alloca())
++	  if _GLIBCXX_CONSTEXPR (!__use_local)
+ 	    delete[] _M_ptr;
+ 	}
+-
+-	_CharT* const _M_ptr;
+-      };
+-      _CharT* __ptr;
+-      if _GLIBCXX_CONSTEXPR (_Buffer::_S_use_alloca())
+-	__ptr = (_CharT*)__builtin_alloca(_Nb);
+-      else
+-	__ptr = new _CharT[_Nb];
+-      const _Buffer __buf(__ptr);
+ #pragma GCC diagnostic pop
+ 
++	_CharT* _M_ptr;
++	_CharT _M_local[__use_local && _Nb != 0 ? _Nb : 1];
++      } __buf;
++
++      _CharT* __ptr = __buf._M_ptr;
++
+       // _GLIBCXX_RESOLVE_LIB_DEFECTS
+       // 303. Bitset input operator underspecified
+       const char_type __zero = __is.widen('0');
+diff --git a/libstdc++-v3/testsuite/20_util/bitset/io/input.cc b/libstdc++-v3/testsuite/20_util/bitset/io/input.cc
+index b0e301a42b10..a01e48cf2847 100644
+--- a/libstdc++-v3/testsuite/20_util/bitset/io/input.cc
++++ b/libstdc++-v3/testsuite/20_util/bitset/io/input.cc
+@@ -42,6 +42,8 @@ void test01()
+   VERIFY( ss.rdstate() == ios_base::goodbit ); // LWG 3199
+ }
+ 
++#pragma GCC diagnostic ignored "-Wc++14-extensions" // 0b literals
++
+ void
+ test02()
+ {
+diff --git a/libstdc++-v3/testsuite/20_util/bitset/io/wchar_t.cc b/libstdc++-v3/testsuite/20_util/bitset/io/wchar_t.cc
+new file mode 100644
+index 000000000000..6c7c496daa17
+--- /dev/null
++++ b/libstdc++-v3/testsuite/20_util/bitset/io/wchar_t.cc
+@@ -0,0 +1,39 @@
++// { dg-do run }
++
++// C++98 23.3.5.3 bitset operators
++
++#include <bitset>
++#include <sstream>
++#include <testsuite_hooks.h>
++
++#pragma GCC diagnostic ignored "-Wc++14-extensions" // 0b literals
++
++// Bug 124370 - Out-of-bounds write for wistream >> bitset
++void
++test_pr124370()
++{
++  std::wistringstream input(L"10011011001101");
++  std::bitset<10> b;
++  input >> b;
++  VERIFY( b == std::bitset<10>(0b1001101100) );
++}
++
++// Round-trip through a wide stream.
++template<int N>
++void
++test_round_trip()
++{
++  std::bitset<N> a(0b100110110011010101101010), b;
++  std::wstringstream ss;
++  ss << a;
++  ss >> b;
++  VERIFY( b == a );
++}
++
++int main()
++{
++  test_pr124370();
++  test_round_trip<0>();
++  test_round_trip<24>();
++  test_round_trip<1024>();
++}
+-- 
+cgit 
-- 
2.55.0

