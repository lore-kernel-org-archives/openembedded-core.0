Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2780.1795108213056837268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 09:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ThFdRi9c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=57839d567b=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF8fMa2219575
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 17:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Jf2sDXwAacAup2Dc2+cjQBUHO5gMYyuJMdwgknCqL0Y=; b=
	ThFdRi9cLv8gSZYNK5kD0X1dZooUc+h2qy2oCm3lwnaQEwIloYwHcJ1mPm8/Mmp3
	PHjpnER36PV6LaYLwrKvGd5RsGDTPHo94IPQlMfJGXO9FIIgIxV69iPOwY4mTLuX
	PhHRfnI96BA+/VaXAFtw3WtFtqlEN5ti4fMK4fMbmPTLT3FJiLKgJXtZNGAOmNFR
	b0+nW/535Yg+SebxPzyxpgTaBR2mViGd3ur50x2oPZjkzOEQA1ueUeOhVxMJ65pR
	B9OwYzqYEJCnOmfk1aY4aztNwyIjpp9RII2PUBXvV8spuJwmE7wlmUSBk6L+fT5O
	xJ8vSld8lD3+V3P/4Ct0jA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022084.outbound.protection.outlook.com [52.101.53.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvkek69-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 17:10:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BigrevcPfKBkl0N33ByR0qyhAYEFW18HNpAWqkWe7dyfN5J0EfhUV2lW2J81cd6mSsxLhLaOUllOevOgTG1sHOhEMSHPLaNshKqCaVuS5+u2corpfRDRNYOXIvo7Q0a4W6vv1rbzvLzrhwfyviGg44aDZxcAg5lms7GnXVpvbV1GaBYt0zkrkJXMC+XNlEUE5pjdbjBmECZPteYJpEJHFWtrfB2ivn/dDMlvhlAiyJoagj5gs+i01dmLI71qYvDb4A9ncCQygN9Ho2ZMWueSTCaMVxHKvcWiE0bpRkkPbcxO5ilFu0ydAeRYqL8LOZR3yQCEFMxiQH7cQN7TEBAD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jf2sDXwAacAup2Dc2+cjQBUHO5gMYyuJMdwgknCqL0Y=;
 b=mTASx8soWstsURH/3V8RzD3TbERgVSQKko0jGmcYrQBK8aX3+9csmIy7UmneZ5BIbx443fXW6Se+xB+C9W0Y0boflEeptZR46l4wraGzRHO9QitdpxZFIXeUurmW2I3CCLeAparbKOGLwg6ZDeELiQ7mYQq6Slv7mjC/WweqiGbg9wWTzwAoCVNG5sy+Z9FcB6HWpJRhtmy0HdPm5mP6cdCh8o7CUy21aupJBw/goI5AXhMHrZyO2JVFhknFe6bE9h8igSAbI/LQaXJRKjqOAi4ip4C2Q0KEOUAmOwk2YO5W4Ij65pZLmH9k7RMy/Vl0VxMyeIHTHNbZ+NQYpKgD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by DS0PR11MB6351.namprd11.prod.outlook.com (2603:10b6:8:cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 17:10:08 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 17:10:08 +0000
From: Sai Sireesha T <saisireesha.t@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, Kris.Gavvala@windriver.com,
        sumanth.gavini@windriver.com
Subject: [wrynose][PATCH v2] libsoup: fix CVE-2026-0719
Date: Thu, 19 Nov 2026 11:09:57 -0600
Message-ID: <20261119170957.5041-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106160329.86073-1-saisireesha.t@windriver.com>
References: <20261106160329.86073-1-saisireesha.t@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR19CA0017.namprd19.prod.outlook.com
 (2603:10b6:610:4d::27) To SA7PR11MB9594.namprd11.prod.outlook.com
 (2603:10b6:806:4cf::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA7PR11MB9594:EE_|DS0PR11MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d755fa-6ff9-41d2-b9ed-08df465ff6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|52116014|376014|366016|23010399003|261022105027099003|260925022911599003|261021133027099003|261026140227099003|260925021311599003|260925021911599003|261026135527099003|261028144727099003|261021123027099003|261022115727099003|11063799006|56012099006|261021121427099003|261013131602099003|10067099003|261021135927099003|261009223027099003|261021130227099003|261022075727099003|261102123227099003|261022113327099003|261026130827099003|22082099003|18002099003|261026121527099003|13003099007;
X-Microsoft-Antispam-Message-Info: aMMPqmLbF2LfOkrqsUaoAqDkoV44itVdeDYkoAR7WvKqw7qA4QGWQEtR/b5p8QFXk3BaC2vum8niDl4oh+oQGQHeOfzpwvyGsgb4lweVtlzcKuYuMeBWYMvHVHLD0qmX8nZyXYFrINZWx5SoDXoPpW6Qnaxsh1ej/5enyRaco8T5mqyoeFbb4MUugFBRI9b160yBnVr7/eym2uhgNtmlETfRWzET3tGrb9LHevoo2lV3GfPxoup0pUDXpZ1WHJWuTsE+c3XpCFNan0fg8/bD0hqPKais5SmdJW8WoAsccM/lbnLHK3rwvzXhJi2dk9Al1nGbavEBKozZ5K3gAPJmK3WqIf27P7m4U4meH6PNjqqafxozDAeD3g4lhejov3s8jP7ca2Xg8XJVAb+byJsl8EzPF+lXSfVC4JcuAnVW20aGYyUafzqYD8fIsdZMsYq09SoXRj+BGzpvbZ+mUr0y7VDFvr/aekgE4aJ0+L7liEfisJHosoilt/TScbQCIjjR1ez7XQBq8vJUByCN8XhhgerBn8KrDM6GGt1RBCeCwX1l9nsw+LbnoNgO04hWMhUfrySTF6WhiiPPFeRx8fW5jbHNjdsuquCYR1y7IRA1Hpl7BtR0VqGuwxjFE70ogjNE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(52116014)(376014)(366016)(23010399003)(261022105027099003)(260925022911599003)(261021133027099003)(261026140227099003)(260925021311599003)(260925021911599003)(261026135527099003)(261028144727099003)(261021123027099003)(261022115727099003)(11063799006)(56012099006)(261021121427099003)(261013131602099003)(10067099003)(261021135927099003)(261009223027099003)(261021130227099003)(261022075727099003)(261102123227099003)(261022113327099003)(261026130827099003)(22082099003)(18002099003)(261026121527099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e6K/FFKrDbQ0mVqJSu0insFlD6qVScUkTIIzl/q8KPrJ3o/LHHdP47EepCtU?=
 =?us-ascii?Q?mXdQDw3ZeaDg+Q3Z3TwTl0fUOVsZijggh3Vex0TUnLY0hAHsjNk3cSjFzxbK?=
 =?us-ascii?Q?RXvBarFEa7yZHUeGx/6dSI1DHWHvp1mKXRuqplQ+I8hfP2KM8ZuRQwBCs2wS?=
 =?us-ascii?Q?GMrgaapQqDE/rQ9ZXB8nauXtNmHzj/dRM8+MHIFsNpnkVMAyOL6DVipo9EVX?=
 =?us-ascii?Q?TZI9ij2lQyn/PyaSf/0mmdck+HItWlTzkg5JvmDisK/8MGwCByfvoah6Geqq?=
 =?us-ascii?Q?nS2zlVrUjWPsNWukLMKeZJjlRDxMyPUA9TO4Z4iwL5qIalPk+05T1YpC/lvW?=
 =?us-ascii?Q?hhRi/LanUjLEG1sSVEUFDgQvxwnNnO8us+u2MwjkPR+imQjjIXxkRcrY8N1B?=
 =?us-ascii?Q?MkyxRhaqhs0CvBBZ84bRIGKFOKvpwZb1XSqn0QphVZs76zy4FyKDj8+c8z6j?=
 =?us-ascii?Q?J+xblAoce69t8ss7nUy+fb0wfCk91OCco71eEEwLcznrjO2QZ6FDBTe6gw3P?=
 =?us-ascii?Q?xSVWwu+lO2CtaU3zDzXmfZKsEOX4yZGmPKZvZMl4Jtnu9BycyZkSPe1n3FQz?=
 =?us-ascii?Q?oesXPYNLWoy42EJMFSYHDISDFo9M1K4gcUTTYfnalRZ1832pdTn5ZmwZS0WM?=
 =?us-ascii?Q?cXntMnFRijAfLVUDgUPugc2LbM117kYDpleYPmX8KgYd5z4STrQtrKdorJ9x?=
 =?us-ascii?Q?UGEWLb0cMjU13kdQ015jK/yk3saO7+rugE8Z/1p75hjuQRqvtwXbETT7ukRi?=
 =?us-ascii?Q?3wOOCmvXYknWbsYnCA163o97CrStCfCiEiapF/dhox0qEFn6Uiyu7v0x7Dfe?=
 =?us-ascii?Q?BD4uBf9uM2PNJiYasmvXrZAI9iV8+w20liS5jHK5iI1UQaJq4WvXph7l0I8j?=
 =?us-ascii?Q?AwoYU5Hzxi99SwqbV2NtGnClWYYz5Se8X+6372Pr0JXoizT/F+K94cWOk6FO?=
 =?us-ascii?Q?mEqEnjwA0o9sD6tH6iRGTMM+UbBCWR4rTa0ijhX1hZ1uxjFZTPkw3d2yk+9u?=
 =?us-ascii?Q?ZMW4QLl4Yuew2CxGs4hx5ZEQVqzvDtTdU6udWLMAeprh6Czsln0iIq/5q+Qz?=
 =?us-ascii?Q?Sj6FsjSpCp/jTbPoUL6W+n7vcprUPIqh+6NdC9NB+ozH2urUN2+p55w9EOoH?=
 =?us-ascii?Q?CQlt2m3Ms7KRV3zgbie/cL0QO1XUAN1UGEXxX2Q2IXtCaTGVm5ExZ/jaQYU/?=
 =?us-ascii?Q?1kapPyC3nsfzsAcs3SLB6RBm5lGn2yk0D9c0/sqnCSiS6xPO0Q+COwBK4dAq?=
 =?us-ascii?Q?eg3Yvl56HS5AYTSSodvJxEUC2Re2OR2jHNx7ts4uw6uqdRMIrjEYdWE1M+QN?=
 =?us-ascii?Q?U2hDOiBREej7RAjucslza9yXb20nyzaeDq0I6VQRx1DyFyWzeju7ddjklJ1t?=
 =?us-ascii?Q?v00dK+nAt5q5yMwfTlHYoq+NMkJcSXwI0qdDZcEUBXUSxPvEIksMKouSIW+z?=
 =?us-ascii?Q?tmfpcXMlYoBODEFMx95Ylb+alXk4OyQMIQZDZXnFaZgvseXikUZnANdgNyt0?=
 =?us-ascii?Q?nuAYJ+3OQkoc9gXEbM72LsGLh8hj1wxk/k+RP1+Yu6/m8SkXZqgvjmdOoS8s?=
 =?us-ascii?Q?0CyiPa8S6mNhSWkMxZjBWNK5TdivSPuVBpZDwi3Lnkhhlp14GNXRSKr43qft?=
 =?us-ascii?Q?IiBQ+kQkRLHaYboYsV11TcziPvRRkkYQCOxrSaR8B18PvaamJlrnIGUCTzN4?=
 =?us-ascii?Q?aSwmFUoxOPkRE8zKLjdMuSdk1KimXP55TTLaAQnxFlP1alw9lVfg1t6YLQvc?=
 =?us-ascii?Q?uGA0GFL40f9CqJe2rxXLMauBkLLt6ziCN8T7xZq7Hza+hi3OUpanCor/vt72?=
X-MS-Exchange-AntiSpam-MessageData-1: gPR6ut0QbKi4hRpRnbDFaIK87f9mSdQ8uF0=
X-Exchange-RoutingPolicyChecked: bwOgktem7/iGmrqoQNxIc+/13gW8hOugXakPOsa673+iJAUTclCWaIhCNo4Lu2hkW5HVZlHd3bY0cH+x5zG0r9X0soROw+W07L7e9dvqPo8oHBetAd+I4sOkFTzSNnIkosC6MKDZaerQq2HCnkruhkdgvfsNxvTBRCNFbbKOvAsqtmDhXtRIz6lhTvdSHifx8QkMeKiW1dtY1QdKaqC2+wx3SILbR/bRys+Ic4Iax3vtgVz5ihIaO1y/KGO3/zhAtZCi6Iy+5GHIPmWyktPIEXgBcA+zY3VYhl9em1gvTTmfEpx+2xWqhpPL4V5rLZuy8lndJRH0TFlB7NHpjc3sQQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d755fa-6ff9-41d2-b9ed-08df465ff6c9
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:10:08.6974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPmO9yD4TM+FRc4Y6WwiPQnILlECJ7xF5z2vNJcs+qePmxSsakGxEYfgrecXDXTDeBts/lj0n52hWA7mWlo/gmOVfvz2HTOBhYS2X0KbBVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6351
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2OCBTYWx0ZWRfX0RyyuW6nkn4M
 mW4Q+nZq6oK84ijj1C6PVbxWaSaTe9Xmj2qPXdr06ds48ZSeKYJVx9ps+44Qt+7VPuxE6pKufP/
 z4MqUpzrx+qiVPhlhTgFMV7bo40b6zE0I7Z5NqQeYJ1hBLfdx03q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2OCBTYWx0ZWRfX9seGjnElvaAk
 t5EQSIlQdrokdx2Jmz5+Ov4RaWufsiGM1L8Uvv5y2jnD8Y892+sVJD9D3Z0ozNhFFKtLvxPPD+O
 57ZDNCDC3TXFCbX/9qZ7SHeAIm/WazGyE3SoiBqRRNLS4JZxqtuVxrfPpAthd6K39GCayNYBHgu
 xykm4qr9X57MY4czsn9PBVO1QkmCQMu0Hk3cGbvp50/IzcasO1PCbLybXPDSjkLNSmOWS/wVQId
 W3qhrmBzD+Hf1mwjrB9fj6jUTwVuPPeOqZDhSfUq0Nf+34syeOESavOt85dfb91QfefiV97dtCK
 orgTSdzngelQooeTn65ksvzuekC6tpYF1WDL1+IZaRPYlD9smjNmVXU06MdnJ5VEoqWon6rhOLs
 4x3ZhxXg+jv4V3laIVZ2AUrT5fzFktYS76JwHCc6BVqey0qPeDwdoIhsMefKVgOuf5oi4hird4u
 aNR9S9ZdUdjr8GvZAOQ==
X-Authority-Analysis: v=2.4 cv=OdYNnRTY c=1 sm=1 tr=0 ts=6aff2d73 cx=c_pps
 a=BojASg16tjKL+eL2GW4eig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=yMhMjlubAAAA:8 a=t7CeM3EgAAAA:8 a=iox4zFpeAAAA:8 a=fjap6yag92prjKDRmHcA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: Crfm2XGU0P6g-WNACuM1mKLDdjEcyZDg
X-Proofpoint-GUID: DqHVuEEPpkfsvCjXfU7lqGBVzdkn9PMW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 17:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250713
Content-Type: text/plain; charset="utf-8"

Backport the upstream fix [1], which explicitly mentions CVE-2026-0719
and was merged into libsoup 3.8.1. The 3.6 stable series was not
patched upstream, so a backport is needed.

[1] https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf921b4125b513

Signed-off-by: Sai Sireesha T <saisireesha.t@windriver.com>
---
 .../libsoup/libsoup/CVE-2026-0719.patch       | 191 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch b/meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch
new file mode 100644
index 0000000000..73e8121de2
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch
@@ -0,0 +1,191 @@
+From 835d887ec7b37c45bda55df2cf575de5bcdcb652 Mon Sep 17 00:00:00 2001
+From: Mike Gorse <mgorse@suse.com>
+Date: Thu, 8 Jan 2026 16:19:37 -0600
+Subject: [PATCH] soup-auth-ntlm: Reject excessively long passwords
+
+According to
+https://learn.microsoft.com/en-us/troubleshoot/windows-server/windows-security/ntlm-user-authentication,
+the practical limit for a NTLM password is 128 Unicode characters, so it
+should be safe to reject passwords longer than 256 bytes. Previously,
+md4sum could overflow and cause an out-of-bounds memory access if an
+extremely long password was provided. Also update md4sum to use unsigned
+variables for size-related calculations, as a precaution.
+
+This is CVE-2026-0719.
+
+Closes #477.
+CVE: CVE-2026-0719
+Upstream-Status: Backport [https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf921b4125b513]
+Signed-off-by: SaiSireesha T <saisireesha.t@windriver.com>
+---
+ libsoup/auth/soup-auth-ntlm.c | 28 ++++++++++++-----
+ tests/ntlm-test.c             | 59 +++++++++++++++++++++++++++++++++++
+ 2 files changed, 80 insertions(+), 7 deletions(-)
+
+diff --git a/libsoup/auth/soup-auth-ntlm.c b/libsoup/auth/soup-auth-ntlm.c
+index af416fd2..0b8accd9 100644
+--- a/libsoup/auth/soup-auth-ntlm.c
++++ b/libsoup/auth/soup-auth-ntlm.c
+@@ -309,6 +309,7 @@ soup_auth_ntlm_update_connection (SoupConnectionAuth *auth, SoupMessage *msg,
+ 	gboolean success = TRUE;
+ 	GUri *uri;
+ 	char *authority;
++	static const guchar zero_hash[21] = { 0 };
+ 
+ 	/* Note that we only return FALSE if some sort of parsing error
+ 	 * occurs. Otherwise, the SoupAuth is still reusable (though it may
+@@ -355,6 +356,14 @@ soup_auth_ntlm_update_connection (SoupConnectionAuth *auth, SoupMessage *msg,
+ 		return FALSE;
+ 	}
+ 
++	if (priv->password_state == SOUP_NTLM_PASSWORD_PROVIDED && !memcmp(priv->nt_hash, zero_hash, sizeof(zero_hash))) {
++		/* This can happen if an excessively long password was
++		 * provided, in which case we don't try to hash */
++		conn->state = SOUP_NTLM_FAILED;
++		priv->password_state = SOUP_NTLM_PASSWORD_REJECTED;
++		return TRUE;
++	}
++
+ 	if (!soup_ntlm_parse_challenge (auth_header + 5, &conn->nonce,
+ 					priv->domain ? NULL : &priv->domain,
+ 					&conn->ntlmv2_session, &conn->negotiate_target,
+@@ -449,8 +458,10 @@ soup_auth_ntlm_authenticate (SoupAuth *auth, const char *username,
+ 		priv->username = g_strdup (username);
+ 	}
+ 
+-	soup_ntlm_nt_hash (password, priv->nt_hash);
+-	soup_ntlm_lanmanager_hash (password, priv->lm_hash);
++	if (strlen (password) < 256) {
++		soup_ntlm_nt_hash (password, priv->nt_hash);
++		soup_ntlm_lanmanager_hash (password, priv->lm_hash);
++	}
+ 
+ 	priv->password_state = SOUP_NTLM_PASSWORD_PROVIDED;
+ }
+@@ -604,7 +615,7 @@ soup_auth_ntlm_class_init (SoupAuthNTLMClass *auth_ntlm_class)
+ }
+ 
+ static void md4sum                (const unsigned char *in, 
+-				   int                  nbytes, 
++				   size_t               nbytes, 
+ 				   unsigned char        digest[16]);
+ 
+ typedef guint32 DES_KS[16][2]; /* Single-key DES key schedule */
+@@ -650,7 +661,7 @@ soup_ntlm_nt_hash (const char *password, guchar hash[21])
+ {
+ 	unsigned char *buf, *p;
+ 
+-	p = buf = g_malloc (strlen (password) * 2);
++	p = buf = g_malloc_n (strlen (password), 2);
+ 
+ 	while (*password) {
+ 		*p++ = *password++;
+@@ -1092,15 +1103,16 @@ calc_response (const guchar *key, const guchar *plaintext, guchar *results)
+ #define ROT(val, n) ( ((val) << (n)) | ((val) >> (32 - (n))) )
+ 
+ static void
+-md4sum (const unsigned char *in, int nbytes, unsigned char digest[16])
++md4sum (const unsigned char *in, size_t nbytes, unsigned char digest[16])
+ {
+ 	unsigned char *M;
+ 	guint32 A, B, C, D, AA, BB, CC, DD, X[16];
+-	int pbytes, nbits = nbytes * 8, i, j;
++	size_t pbytes, nbits = nbytes * 8;
++	int i, j;
+ 
+ 	/* There is *always* padding of at least one bit. */
+ 	pbytes = ((119 - (nbytes % 64)) % 64) + 1;
+-	M = alloca (nbytes + pbytes + 8);
++	M = g_malloc (nbytes + pbytes + 8);
+ 	memcpy (M, in, nbytes);
+ 	memset (M + nbytes, 0, pbytes + 8);
+ 	M[nbytes] = 0x80;
+@@ -1200,6 +1212,8 @@ md4sum (const unsigned char *in, int nbytes, unsigned char digest[16])
+ 	digest[13] = (D >>  8) & 0xFF;
+ 	digest[14] = (D >> 16) & 0xFF;
+ 	digest[15] = (D >> 24) & 0xFF;
++
++	g_free (M);
+ }
+ 
+ 
+diff --git a/tests/ntlm-test.c b/tests/ntlm-test.c
+index a92a21c8..4670532a 100644
+--- a/tests/ntlm-test.c
++++ b/tests/ntlm-test.c
+@@ -714,6 +714,62 @@ do_retrying_test (TestServer *ts,
+ 	soup_test_session_abort_unref (session);
+ }
+ 
++static gboolean
++long_password_test_authenticate (SoupMessage *msg,
++			         SoupAuth    *auth,
++			         gboolean     retrying,
++			         gpointer user)
++{
++	size_t l = 65536;
++	char *password;
++	char tmp[10000];
++	size_t i;
++
++	password = (char *)g_malloc (l);
++
++	for (i = 0; i < 10000; i++) {
++		tmp[i] = 'A';
++	}
++	for (i = 0; i < l/10000; i++) {
++		memcpy (password + i * 10000, tmp, 10000);
++	}
++	memcpy (password + l - 1 - 10000, tmp, 10000);
++        
++	soup_auth_authenticate (auth, "alice", password);
++
++	g_free (password);
++	return TRUE;
++}
++
++static void
++do_long_password_test (TestServer *ts,
++		  gconstpointer data)
++{
++	SoupSession *session;
++	SoupMessage *msg;
++	GUri *uri;
++	GBytes *body;
++
++	session = soup_test_session_new (NULL);
++        soup_session_add_feature_by_type (session, SOUP_TYPE_AUTH_NTLM);
++        soup_session_set_proxy_resolver(session, NULL);
++
++	uri = g_uri_parse_relative (ts->uri, "/alice", SOUP_HTTP_URI_FLAGS, NULL);
++	msg = soup_message_new_from_uri ("GET", uri);
++	g_signal_connect (msg, "authenticate",
++			  G_CALLBACK (long_password_test_authenticate), NULL);
++	g_uri_unref (uri);
++
++	body = soup_session_send_and_read (session, msg, NULL, NULL);
++
++	soup_test_assert_message_status (msg, SOUP_STATUS_UNAUTHORIZED);
++
++	g_bytes_unref (body);
++	g_object_unref (msg);
++
++	soup_test_session_abort_unref (session);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -737,6 +793,9 @@ main (int argc, char **argv)
+ 	g_test_add ("/ntlm/retry", TestServer, NULL,
+ 		    setup_server, do_retrying_test, teardown_server);
+ 
++	g_test_add ("/ntlm/long-password", TestServer, NULL,
++		    setup_server, do_long_password_test, teardown_server);
++
+ 	ret = g_test_run ();
+ 
+ 	test_cleanup ();
+-- 
+2.54.0
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index e5c2d18ded..c5805dd22f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -17,6 +17,7 @@ SRC_URI += "file://CVE-2025-32049-1.patch \
             file://CVE-2025-32049-2.patch \
             file://CVE-2025-32049-3.patch \
             file://CVE-2025-32049-4.patch \
+            file://CVE-2026-0719.patch \
             file://CVE-2026-1539.patch \
             file://CVE-2026-5119.patch \
             file://CVE-2026-2708.patch \
-- 
2.43.0

