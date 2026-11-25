Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38621.1795598709967454656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 01:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UZRPm9pV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=57892adad4=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP67HGg3663016
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 09:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=p4dhJFam0
	u8UQMhdMaLteydbCqihEWoOEq9lhd98gsQ=; b=UZRPm9pVrUFMNzkOAJGJh7LHe
	2PIV/Mc3q2WbjkYL9uQCIx+LX9GyuFZqUMZklAbbHSfrSeYC1SmHWbLXi5rhc3PL
	ZPqNssXOHUxpHqeL9QJLmFx1UTGs/IZ6uc9A6Pd9bme5d5dp+/ZpLEw4eyflp/RV
	DHOtc/HgvXvqOA0rXKgxwMqw626b7wujNiD0x+uoni/ZdyZfWWNggWpnFcc2W4QI
	C+OvezathqwC7HzwuUoM3Tt/tvKzu4CqJYU1C0o/RJyW33+gCyNOfxFbIvdiW2NC
	lEkYOzfmxIPlrbqEpcy/pjnd56sw9bbTME1rnn7DVKvGgo6XLH4JiE+J3iymw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022098.outbound.protection.outlook.com [40.107.209.98])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j51492uun-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 09:25:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTLFfx36w8oqgLWpEHbKAEydIuCelr+lNNYsxq9MLTAYb15hva98ydHGqUSR+1bQChQbohSju03P2eQ6598l/xXGJtSsLpo7lF8Z2L+RZ0DT90Nl2RtPVxqatlf7ExNDnLuIwxAJaaWjdYp6I4dDd8IY4EcDm1djrWY8gh61q699rnwA04h6Co1lMyWl6CK6M4Ik3lq368iCkdIViV/WbN3f+PbNq25r6GK+kT/THNhwtT54Zh9LoMoeKD8fbLXaB0F4nm+BnP97Y7ZHO3CWsGuaiajuOgyu96lJTo27gwvoxiodSsY9QMDFBSicMvfFG+NYoAU35oCTKaVf/iDUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4dhJFam0u8UQMhdMaLteydbCqihEWoOEq9lhd98gsQ=;
 b=U82BppwGpAdMDYISrBfh7YeiFuewKhNPEyBcmtKZy04TaiHJkni/0BSATqwiMHROT2xIcaafQgPk8uyTn/OddWv86Uuhn6Yc2LVMP5o/YMGpFixGPFO7OiVysvpFBUhm+754GYXmyM0JHWtVa2v5jkiTQWzRE7r4z49F6pejAJacjCGkz+9h1ZsOxzhoE1Xih+U9lf975oYwjPoO3TpmxSZBV8jEVkDRhQgPP2oy/c2CTtkP50Idvn9Hu5Cxk+Cd7UuSdtBBFmZ4JCxMaJGB+Jp0JqXQ7U0hLub0QFfBxVbBHzObydKZ2De3ZRzG9hTMwF7csMS9eh9syf8jqjzwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DM4PR11MB6041.namprd11.prod.outlook.com (2603:10b6:8:60::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 09:25:04 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%6]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 09:25:03 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Shiva.Komati@windriver.com,
        sumanth.gavini@windriver.com
Subject: [wrynose][PATCH] ffmpeg: fix CVE-2026-75143
Date: Wed, 25 Nov 2026 14:54:34 +0530
Message-Id: <20261125092434.1291033-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0141.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::20) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|DM4PR11MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: caa5a5f7-d57b-4693-9fe1-08df4ad5fc5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|18002099003|12006099003|261009223027099003|3023799007|13003099007|261026140227099003|10067099003|11063799006|261026135527099003|56012099006|261026130827099003|261026121527099003|261021121427099003|261022115727099003|261022105027099003|261102123227099003|261021133027099003|261022113327099003|261021135927099003|261021123027099003|261022075727099003|261028144727099003|260925021911599003|38350700014|260925021311599003|260925022911599003|261021130227099003;
X-Microsoft-Antispam-Message-Info: CtwOb8tTux4KUgOMT7v35WDOCqk2eXpDzb/xHigJSW79OpTkVIx0pzTznfFbIPiPQI3G/OZRwP41uoQ4rfIY+7tJPNYr50LcM6Vc1Kw+bzKBuXoz+YC0jq0Le7/fIki7f3CIsRgixQpQ9B3qIRQnblUXoBY5FJpQqLD7yO+jvt7klgyOeBm+j06qXXtIaS1NXcTVqVVcYf8mcqKRprd6t5UoWXlu2B2de+F2SCBAN6ub07kwK2tqMhrohplfuc5YJaXeRriLpwcm08lepMoSsN1RaO/yMSoPyYm9LL2Lcfhud2YDP1ptePDAlQv8lvh0X1B2XDfToU5qwc7ojdf00n4zfuUNEVWbYXh48mawx7sefcQN+ODOjidPBC3wvcOu2oCyZfizF5D3i5OM5QgYYna//ejK9l9WaFFbljQbuorfNFGYmU1o7rBKP/PCld1RrnaQzZZft7Dr0LEIYy18T5AHfzQvc9aKIRlX/p7j2ABVurEFLjcPnzBk4L/8jcTSUN82JLJgX2wqCHkmovPMqhEI2yCk2xrzWPEO2V0Z41j861TBieABGpqyZ9wAy6ilAB2DcnPDrZIes27YENv6A09XOO/+2CUixHH6tD0Ud2W12LjcgW2jHU2mrtJyUgEAMNVD3aPUDLlqbCDm3YBxb34fz1uCXtDDb3GaBdhMLJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8695.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(18002099003)(12006099003)(261009223027099003)(3023799007)(13003099007)(261026140227099003)(10067099003)(11063799006)(261026135527099003)(56012099006)(261026130827099003)(261026121527099003)(261021121427099003)(261022115727099003)(261022105027099003)(261102123227099003)(261021133027099003)(261022113327099003)(261021135927099003)(261021123027099003)(261022075727099003)(261028144727099003)(260925021911599003)(38350700014)(260925021311599003)(260925022911599003)(261021130227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sv2nQXSXtWlgqEhuSa4tIjfyf2wVTJsqo+KereoFDOyRyt0PpGh4uyCvSD1M?=
 =?us-ascii?Q?dE3uvmKG7LjV7hoaNW78mETKMWIEIgoEBlDX53CH7nekM0w+QLIxBqn/X4sB?=
 =?us-ascii?Q?GiLS5Oxv/lUcn3sbPs2ee5uWnLW+aHrWZEfSA4ninuCy84icWux3/ttoXfU6?=
 =?us-ascii?Q?ND1P72TlYxFOuBmijPNVjbyIxAoJvoEmx0hfMb4+ApUq185fTPyNhTFVZ6L4?=
 =?us-ascii?Q?1oCOaZbm6FK4lP0RHdL1U1eCT+tSnL83J+jAcqsmynqFbd711EQyBjpCKtiK?=
 =?us-ascii?Q?T0SwpYIbO4FIl0WZdpO0hlOZFHNU5gsVtX+rfwXdOrC/iygo2Ril0h6IJKly?=
 =?us-ascii?Q?LMn9Fo687Z/nIbFFRVdvOFk9sPwf80o8m4ke7dcJkZjC9/52n1GabfpTFbbm?=
 =?us-ascii?Q?P0lReuxJJJAwCuXtv+4xr0s26LNn8lEibYukxeB9otfDuRBynhXFUXH0cGHW?=
 =?us-ascii?Q?8bjo7D5cM45ZtG5X2D9apreVkrl877kpcVnv2Xa1lwHVzM1rFins4h71H+bT?=
 =?us-ascii?Q?MbEkEEE+cZZarvA2yk6YowrbjV1LFhlQHjivLksyZbHb1AAPkQ6HssEux0UM?=
 =?us-ascii?Q?gN3IC6PquoR5Ac8iulInM1xLl8fMrQEk9KBFlMf2B1KinLqWrVfoTfCu1R2F?=
 =?us-ascii?Q?mOdc0xupgHsnyd5XrR01bQl4M28M86oUsJ605I61I3DnfWGQHnCIvlxVEkrm?=
 =?us-ascii?Q?4s9492pRZI+fQPTadPYJh/HwNjrF180eypwcKxhWhqTQDk9f0q5WMIs90vte?=
 =?us-ascii?Q?PIreMtMAZPW9TqiEAk2jzQpg2Y4sGZDTqKBstw5psOH739mTa1k+gqjQGUsf?=
 =?us-ascii?Q?4VLEVMjLLOMPEfRCmrPtsu2nX2f1j/VczOmbD9KTy/WnVwWmp7eWFv9VW9PU?=
 =?us-ascii?Q?KbcAxlk9VjAPFdZY5Fj0Yk20kCaEGlD9F3n8tTY/m9mke5A0blbkT9nH2HG5?=
 =?us-ascii?Q?vVyR39tq4KcSv7sfSeGHZz42swSsFWkXS+s7oJbsrrWEH5GHDK6go1YdYjuQ?=
 =?us-ascii?Q?84zRHRwCawX+TtJeRS+9QvuLuowOW1Ntjc3rLFpYdZImxsfY9401a7YshrL7?=
 =?us-ascii?Q?uhdsx6/mOuIz1eT7l943UO/YJeYj680SSSqb6DOQbccRfPp9GCxqESFxPCj9?=
 =?us-ascii?Q?uugM7Im4Bck0bJfJq6uwzoJmSbMA8Iac3C1Ys5n5fzG8wuh9ZFujLQnlOvLH?=
 =?us-ascii?Q?/fY+k0VNNDj9WgjqTFikgnNTQML9fh7DvHe8QZIf6QB1xXif90xtaVzZArFD?=
 =?us-ascii?Q?1B6fdrXZjt7LI5ilQb2uXPrEFWxw8QiEZql7UbTETAz8gDhxOEBF0MkXLuWp?=
 =?us-ascii?Q?gHVPxFh3MfIB6dD/JH41aZDCn8Qw31Q7zgeMr+kHdtd4nRPmIA3oIMa6BFUC?=
 =?us-ascii?Q?TVAdGygVG0/oAfNMUOH5NRc6iVFn60yVbz+ryE0DjaQT0FjghEjDhgUnSsTL?=
 =?us-ascii?Q?NNNyySgRu0p/kkYGlVZh+Ndtje4nqWbUWQpdAij8nkk1ZTYXgNcXOJ4ky5BA?=
 =?us-ascii?Q?E1FD5S9IbuErdpRp+tY69ZW0WZQ8v6T2O7aM99R6revcf+V06CpKeKfiRF+B?=
 =?us-ascii?Q?gw6d7I+1LUTqw7HjjSAzT1WVTApjr3r4LYfSOSQqio2eJBSHSYyni4fd3TRX?=
 =?us-ascii?Q?ARzxyHG+yNsjEZ5bs5mVZEE43NwKNT4rl0VpTCfpqzrnqOEBiMSIvVcc6RSt?=
 =?us-ascii?Q?+PQfjgBlF2VcZ6PCwneXzJF/zPYqK8QR/i6I1Hfz/Kax9NMhHoF/hwZ+/pJB?=
 =?us-ascii?Q?pbK7TviSqn+5qiQi/KriAak/H5YVGz2HfN3xe8aI5zU4W73bmRG8?=
X-Exchange-RoutingPolicyChecked: k/MeJgXAYEBzM1ywX4ouS2/XFZ3WxLgJ1kcrlScJcA44MC7on6YyXfuri62we2hXXNM/NrjPt/k/5X+KYsrwncb73L1XlFvqsIT4AFCJslSt4YrF1kH2jW/NlQ9akZO6QMSYdrbSvXYqDcdRRdw3V9FbFRDMyPEIonGww2RDCOay84RSR4nv6LivTUaUxa3XDp4pwdXt5xFawl+cpJ9LWm9AEzYwK4YV/wV/I1QyvOGgvQdDtyM6jBPcJiATwL/TdX27a4gHEaYBRwdV1/djbVtOp9JRoMltxFLTRn2L5hw1Yb/kSx9Ja/fi8AqVdGxa5Ovu4whVuW+Sj2wXBFMAHA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa5a5f7-d57b-4693-9fe1-08df4ad5fc5c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:25:03.5364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DajqS2EOqnBElX2rZkXrerac9svUwmynv5olrS19GiQJ1AGWtKkkbAPk33yrtTqWAAjbU1l0cuFT80f1/nXYF8g2kyoBbCTLtm3GS/0IWy3YGP9+tjh9wYaQo6ICsT2/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6041
X-Authority-Analysis: v=2.4 cv=ScJi5fRu c=1 sm=1 tr=0 ts=6b06a974 cx=c_pps
 a=eLOM5dFMzXA1JCJXN2lYUQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=5fZKPoO2FM44ekDmq-gA:9
 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX8Hle3nIjp5PL
 IYKwqTiIQWgZuvvSHnmhc6Y0k3TYxpE5xn8vA691853KhY1Wr3jDjAOpaB4PVKwJNkC7ftOBRVK
 n891WiMTdFxTZnwedzFWCM/yHJ8OGjCF68yNGs2eDR0D4WLw6babvREoLjtIxf9+s7l+mttcRWT
 wToMn8cwMIk7yxTHtJqEQ6aKCubEpR1CiI67StkynJJkRz9x1twg1RIm3Tm0kpLhXAabZ4z30Uo
 CZegyIdsgXO4jIjy4GQ9waVTB/pXNizmSGRv+04umHuqx5B4eJk21vZT6038BhwPU8N6hREK3wO
 GXFPEvogTxAYfwk+JIZTS0iTvNKmYxLrMTyNuaJSGRYy6lbq6iAT6RL0fPO9e0HEghZNM9Phkuw
 eXRhUY7eUAxhTFCsEzChqWfeXxAiQFDsedshgVF9G6uCmWtH+wMqKuD1uCb3kxik9s4LVKgatHN
 lQCXuQ8vLBooT2/4Agw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfXz9Kyl+y0nV5s
 pllJE6zuUYisk4ynXKbTdnPWb14HQZCvQ64rHZBpVOX/8RV59CuARHbONNYmxeIHoy+A2dVkGne
 cKul6f0GrTOPwwZ1bIa28VhnPa5HDU1oH3UeR1RZgjBAv2QkNGqQ
X-Proofpoint-GUID: nbdW9Hgw-ZKP_Npgyckn_OvE7Qf6qUbz
X-Proofpoint-ORIG-GUID: nbdW9Hgw-ZKP_Npgyckn_OvE7Qf6qUbz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 09:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251171
Content-Type: text/plain; charset="utf-8"

Heap buffer overflow vulnerability in the RIST protocol reader
(libavformat/librist.c) of FFmpeg.
This issue affects FFmpeg: before commit 1c10bcc.

Backport patch to fix CVE-2026-75143.

References:
[https://nvd.nist.gov/vuln/detail/CVE-2026-75143]

Upstream fix:
[https://github.com/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3db142ce390602]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-75143.patch        | 33 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch
new file mode 100644
index 0000000000..93021c1b6a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.patch
@@ -0,0 +1,33 @@
+From 1c10bcc2e17255dacb717a25ab3db142ce390602 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <MegaManSec@users.noreply.github.com>
+Date: Tue, 4 Aug 2026 12:11:55 +0000
+Subject: [PATCH] avformat/librist: honor the caller buffer size in
+ librist_read
+
+librist_read() ignored its size argument and copied the full payload_len,
+overflowing a smaller destination (e.g. via the async: wrapper). Clamp the
+copy to the caller-provided buffer size.
+
+Fixes: out of array access
+
+CVE: CVE-2026-75143
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3db142ce390602]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ libavformat/librist.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/librist.c b/libavformat/librist.c
+index 9669d5b5df5a5..3c4b5e3e5b96f 100644
+--- a/libavformat/librist.c
++++ b/libavformat/librist.c
+@@ -226,7 +226,7 @@ static int librist_read(URLContext *h, uint8_t *buf, int size)
+         }
+     }
+ 
+-    size = data_block->payload_len;
++    size = FFMIN(data_block->payload_len, size);
+     memcpy(buf, data_block->payload, size);
+ out_free:
+     rist_receiver_data_block_free2(&data_block);
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index b92676d4db..fe6286f7dc 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-66036_p1.patch \
            file://CVE-2026-66036_p2.patch \
            file://CVE-2026-66041.patch \
+           file://CVE-2026-75143.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.40.0

