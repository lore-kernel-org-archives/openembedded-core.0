Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12327.1795500626957365746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B9lLcmBO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5788a914bf=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5bgZl527333
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=hFB6x+ca8
	7WChdXnLT8BmxX5TT04gtoR6G/rBeTDXuY=; b=B9lLcmBODKa4ecD7v3ZeuNp04
	oYmjXj4JVwiYErmQN8QruGdJ5CJkS+EBd9+6TRELi4nKoyVneRH0CUvJuDytU0jP
	UVjpKE9L431oiFHTzdjYpxXRgTYD1f1F/QpUdwqlO7i/2aq2DqMdSWcwMIcq1j5o
	VFwcK8l3XxFx5GjTjpS/ZA/s3H3lbmwYCIdf0JNVXtrnECGWkD+Z6Ee7+PmrJqI/
	w8Ye1Jwu2G2OT6qzfnaZF+h0MWDY44yNV3qJsQZV7WL44j3G6S0UOVqtPoosFWTk
	2AuqbQblqot2KbSRVAsgULPwE7N3EDHNYTKCn6eHjOrrPnDkGqQyQyCsJ4XNw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023114.outbound.protection.outlook.com [40.107.201.114])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j517h87ju-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:10:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0eBQAGgoa3f7OFH25HmJM81UWosyKeLBXYpyc4AMMvuU6O7kKoBdu1q2Cx36C2Z7LF7UEVAUH67u+QjL67cVy0Fn3WpGsmvBzCuMDM9f65QEt+H2KcAHvocx8uxAdB3OMr9fHRieck/sXX3wwp2sBK/21A8N8BCCKnl1lKbNSYOWDtbONhg8qzUTP124eiUpF3gqlI6geNAd+1p/Lv0GUKXRTybl+H9kgAPTRAPFv3sLCp3Yvf04ENHvXiLCwMq0vtqY6mWd10EDiVq3PnmXcBOtVL59ETHtmyMbZt6/999xtGe1TAz5fRDTMpvrQGClnSSDZB1ePwcAvnAbmZy3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFB6x+ca87WChdXnLT8BmxX5TT04gtoR6G/rBeTDXuY=;
 b=oEVTBDvF6eoBbD5WmFghsNMH+oNRBYbzPY9I/dT+rccV0WAaT4fWoJIh4WLn6W6pDYxnI6kOBx1OreksiImoxNIXyJw8cD+PzfGwdtouaMMht1RCABjvcn5weXoaci2BURMHJLL9gKzN0Q56CRnnPbYtIkMc/EgPvkoV86Q9OIc4A3wLaXIFhN3/aosC8EYXfV6/7S1eDxmkVifE3K2ai1ndm9s/nlUQNKbgUnDH7XlIanqeJALnd9Fxu6OJGBoqO4Iuvn4yGCBaKQOzSVKgQkkJTocwKu95vpuyKZi132oWVoszzhWHll/vSE2AAPyowIh0IZlejBEvp7QcJ0QIpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by LV4PR11MB9467.namprd11.prod.outlook.com
 (2603:10b6:408:2d8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 06:10:23 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:10:22 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [blacksail][PATCH] gcc: Fix for CVE-2026-115456
Date: Mon, 23 Nov 2026 22:08:35 -0800
Message-ID: <20261124060835.2127766-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::7) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|LV4PR11MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea552c3-fec2-4783-ef90-08df49f19fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|6133799003|18002099003|3023799007|13003099007|56012099006|260925021311599003|11063799006|260925021911599003|260925022911599003|261021130227099003|261026135527099003|261026130827099003|261021133027099003|261026121527099003|261102123227099003|261009221227099003|261009221727099003|261028144727099003|261021123027099003|261022115727099003|261009223027099003|261022075727099003|261021121427099003|261022105027099003|261022113327099003|261009220027099003|261009223327099003|261021135927099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: ctlEwNS2Oio7fTXGpnT7YE9z1Zh72QAZsX30xN4r7m/4g2YXx1QoOz4Fee2TGR06LAFs+6I93cwR0umSzVVhEdx05qO2zsOzaKlJknf7G4sJBdwp7ATMrHgOPzyG3rY36nfAk6x/AIrYVtyYTtHMCHtKCIC3HXShkpWrJ0pSFuQubit8KzbaHRg/mtrjP+6OStFcILq8rEmrT0WQATieK1GDkZe+4tVQsp442MTOpNTmNBlJfNgwgZ2AJK9tNId7fe1ChW420GtJc68Vmad8Vvdj5bLnFz4r7qcoM0Hn5uWIzm6dKhVbSxeiHg9RqMZjU0XPyxqXefOClU+pYwGCHKJ8hl/yFgzV6rLNONJMgT5goINbMMQGXopOsm8DWXK2iT/CElnZkUiFpVIoShJDtFwicuwnBim+7G9WNjcmJAmcAKDbW27Vr9sMFmk0pVngTG46VlDZZDTZJM3CZNA3z3RMAZvcQwmjLIUAlAf8hicWnHpzR8bpD7yPlDDbUoV4mJGUWDyzG6tMmHpWWAuV8wcJ64wDbsvFibeDpqshefc2TpgnQfT8yinpwVtsWVRbzHT+RO5d4/iXD6aols6D36iXlxAKABFaMU+n1KU7T5eEevDpyDC8Q6oDG5KKn4icwczSb+Ld/VsLVneTWHQnx54ui0XsSm+PnXAciBvWjRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(6133799003)(18002099003)(3023799007)(13003099007)(56012099006)(260925021311599003)(11063799006)(260925021911599003)(260925022911599003)(261021130227099003)(261026135527099003)(261026130827099003)(261021133027099003)(261026121527099003)(261102123227099003)(261009221227099003)(261009221727099003)(261028144727099003)(261021123027099003)(261022115727099003)(261009223027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261022113327099003)(261009220027099003)(261009223327099003)(261021135927099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iU8pP5cMK3AXByKGRovoU9pMuKQ/WZzS9uZWryMjuGO52bamClAkOlAdOlZQ?=
 =?us-ascii?Q?mY3V7zDhUVFjb6ewvs7+crjHXWO7XYLpcrHBYgQ3UOVonyEUtNaYtbequ4Z5?=
 =?us-ascii?Q?tS6BCAlNNarONffvf+s2V0Dh9QZ17cSDUsB3IxwOgvxc9/JkirwMQ8GE5rXd?=
 =?us-ascii?Q?oNHxeIJhD0CT83XK9scpe3647Q27ZNUVCS/ORJRvxMg/MdbhkfaSxLvwmtHD?=
 =?us-ascii?Q?IAT8NRPRfA06pJUTJenegEwkKgYQTdRsXayKeUM7tIpYBbut5DN+VAY1CZL7?=
 =?us-ascii?Q?llrpg585FdoWhHZi24izDHTN9fq8faQuZyUQywS/vT+1wA48RSW3hZF9K6PM?=
 =?us-ascii?Q?f8/WiXRCGmXd5NsVX6PYLXpZ1WMWki57A1VIT8qSH9H4Re2e0HVYr33daz3k?=
 =?us-ascii?Q?uSMlth9sAQnWYcduAFsyfFOPNk0wLuobKRAp4sOwlhsmRv0AGa6HB2qPTByL?=
 =?us-ascii?Q?yVeDcotUAH1t6XgtfiOqt3IBYzhm20LvL21IOyQPM96u3RO/V6/WdvQFKyFc?=
 =?us-ascii?Q?SgvEOKOPF9COa7F3ZF+PTGqRB3yDDGkc0QodWpITIWkGeIIKqL/r5n+aReFK?=
 =?us-ascii?Q?8A6RmOwnAe6nFi2OZC2gq9y5mkHfFVKy2IsLt2Mv1e9AxIdnEqSGjHulCdNt?=
 =?us-ascii?Q?LetthUpOF781KK4fr9lCKfS3u5gmc3tTOG44mpfcUe1lMUXehDZH9iyrIIP0?=
 =?us-ascii?Q?d5C4FAGyuim+WhjyGvGCzCZPbIj+FwWcpnthGivLQvg+yybg+hoLmVV3TrWt?=
 =?us-ascii?Q?4LSa183ft698s+9L4DsjTpZ2Zdjgs370UsmS/LiqYskYoq4T1S1wUDgppuam?=
 =?us-ascii?Q?B8tb+ItHwSpkcTSP8hIXPD8uCGXNhgTNNmDbvHRqTgvvORjNnHGmX4g9mSks?=
 =?us-ascii?Q?1nU6NHrUe5skKUnsK1JAgQyP8MMU/vCvR+hGDZcNGULZgFxAbH4GNsAYCyij?=
 =?us-ascii?Q?FSXV++CqxljB6mdsYnTTgStnpFUPjCBcJGXj0PrtTFTw4H/YYImXzaNIYkm3?=
 =?us-ascii?Q?orPaK8o1uQpcQWE3rI6e7TFzDXChBI6PQDLmOVFofeqGo+xmhxiRqu+DzEfK?=
 =?us-ascii?Q?Qr2o0O/0Zf6DArstN2hwbvcc5uisxR0Hq1qnuVn61e2oT0zpyoMkLEj4XotX?=
 =?us-ascii?Q?8fo193uT13+dG/2V3oLC0Gp/gQNcPDKcyEULhAyCQgsnPEnRxJUaiEpKYjYT?=
 =?us-ascii?Q?Wp5NIof3VEabCQEaJaPPX0I53gIgCr5HVcB4mu/tiqAdr8HY/jiCEh9G9Zl7?=
 =?us-ascii?Q?grfiUiuAye2KYMA6srwtryX4KbCKzCWVSfnt6UtNEPqTJ6vLxPNp9yVupHDc?=
 =?us-ascii?Q?dIu3Ls+a/81YCakWWf8aX3J1ZpsNDZbN60tkPO4UN8LKccR+1yLYwW3LA/Zz?=
 =?us-ascii?Q?+rCiHhQGYyWIt7kFWJ3AaNgxFshQ9fcX6sSt4VpeeHZiXnJngDzu1h/qWg1t?=
 =?us-ascii?Q?gkAbq/r3jq/tQfKT6wJTqGRSoAgprn8mqOv7K6/HrboGF+Mb9lX9pAGUEIV1?=
 =?us-ascii?Q?GyssLyJCo7JXRz1AAcc6zWMUPz2fGLncERs2n9u0CDrow5R++4YQEOVglcI/?=
 =?us-ascii?Q?/FSN5zNcexjkMRo1DoFmE6sDovUf7LrPqcGQkX0yMRPpJzGXd0jG9H2GFrnC?=
 =?us-ascii?Q?bBLMY/liIuBnDC8/t/PfN276zf3HfvTZ7cDJJ6qgmZvOge53j7EypnJsiBY8?=
 =?us-ascii?Q?0oLTJ8LwnzlfuYgP/68CqmbmR3/bzrXyygt5RZLJOouRhbCIQHoH+1+5M8kE?=
 =?us-ascii?Q?TT1TtUDPe7vzj1t+vlY7q0sqVnT3C5g=3D?=
X-Exchange-RoutingPolicyChecked: W0a0B9urOQr9e87ujK3ZTm6qgguSb7XrTlQmDLYvU/XGhWdgAony2lOiiUbFwtvirtlXoF3cS2zVGiOZaeONFrjtimYxnkalVLipWHmEAUrmdCLPUgGfkUJr0ywclt4UcoDFVvIpH/5Ny3ogxK/WAvbZHk5sxrLmSRrkiR3pr3Y4CjrjrrWc5qsghtiv6WgvZl6P0sfFmcu6dcLKJxryUNjQDh85EJFro8DGJHgYEFMuZiENHcTCVBU7Skg7q9qrxap1MnkB2PqAUWCYC9n8LUjVe75ew67mTFPmM22F9r0CL+eBQsCo6xt8X0DzkyX08GZoc90JZvwi5eX3E9lLEQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea552c3-fec2-4783-ef90-08df49f19fd5
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:10:22.8193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsIHLbHnB5mVVvEGFcORQzbMWk5l08vT4XLKuNrvSKm6IDkQYdyYh8ORUAGxsu9LwjMvpVfeBLxFY398ZRVJyEZb2kU2zA5QIzEMKyHQPkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9467
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfX3wZ3fckvDgyN
 hjLOHAlTn8iVOtZAZ3cJa/u5i+bQgP0nbl0kiKZhZvoYVRximn3O1qm+6fcEi3pb1tNB2lSb1Oh
 HdKvKYoVcDyZriJswu5lELAQiB2jr1uKuA5NLDPoLjDSj0wcFeBH
X-Proofpoint-ORIG-GUID: ztNZI3GhetJIMQ3qYrx1TEMx_2E4bsmB
X-Proofpoint-GUID: ztNZI3GhetJIMQ3qYrx1TEMx_2E4bsmB
X-Authority-Analysis: v=2.4 cv=RutQvymK c=1 sm=1 tr=0 ts=6b052a51 cx=c_pps
 a=NHHWi8XJ/9zO9U5JHYeEaA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=20KFwNOVAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=ChX0DKMaeTd55rmnkw4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfX4evTNFRg+X2C
 dn93aucDv/ngNYNb6OnLlqvoqmQfkhxAT9Jo7M36mO+DJ/Aglll9lER/hNMIEWU53L9OSZwsD8z
 QhfI+wXFl+12Xj9lxGSY7W/oPyFYFO0gSeS56F0VewAZxnVghBw1kNHuwLT2WIQKhDjHzHUICHI
 d399zfPNcTwICkg12oi/v19blEls5WcKfCpOajd46H0K2rXk4Vgt/mH9FNIM528x0zmduuWVwJA
 +5zzxUwqAoXB8jrtmwpRbwHLFX3JqmKvrRnnevaEVWIyOZM5YRL5FKcMJp0OHD5GhRsufevABW6
 942C3EjgShRiE2XneNQn+ATpiV0mSw1Y9SIkLJ6yp5PW8fnjnxcmfpBeQqXiW/ZGxY/HFUCX3nP
 YNaYx+YL0ex1OtyGJKfAXizMl2Hmh1WArJJF/ucg7G34tx1ZgazrpXN4NsR7OQqlYh9PObWjnhO
 J0LU9HUaAGpZggc8Vkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250946
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

libstdc++: Fix std::from_chars to not read past end of input [PR127666]

The bug report points out one out-of-bounds read and the second was
found by an LLM. The testcase was generated by an LLM. The code fixes
are artisanal handwritten code.

References:
https://nvd.nist.gov/vuln/detail/cve-2026-115456
https://bugzilla.redhat.com/show_bug.cgi?id=2563044
https://gcc.gnu.org/cgit/gcc/commit/?h=releases/gcc-16&id=f69969225a091c2dc6c70f0cf2a43cca1ec25318

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0027-CVE-2026-115456.patch        | 141 ++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-CVE-2026-115456.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
index 3497493619..ea7b25b6f5 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -75,6 +75,7 @@ SRC_URI = "${BASEURI} \
            file://0001-mapper-localhost-might-not-be-known.patch \
            file://0001-Fix-check-for-working-assembler-gdwarf-4-option.patch \
 	   file://0026-CVE-2026-102010.patch \
+	   file://0027-CVE-2026-115456.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-115456.patch b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-115456.patch
new file mode 100644
index 0000000000..bbbbc34a17
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-115456.patch
@@ -0,0 +1,141 @@
+From f69969225a091c2dc6c70f0cf2a43cca1ec25318 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?h=releases/gcc-16&id=f69969225a091c2dc6c70f0cf2a43cca1ec25318]
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
+index ed434b39528..c28fc9a459e 100644
+--- a/libstdc++-v3/src/c++17/floating_from_chars.cc
++++ b/libstdc++-v3/src/c++17/floating_from_chars.cc
+@@ -451,13 +451,16 @@ namespace
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
+@@ -489,7 +492,7 @@ namespace
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
+2.55.0
+
-- 
2.49.0

