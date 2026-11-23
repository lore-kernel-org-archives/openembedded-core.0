Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52075.1795433021367261973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 03:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bntZNeyJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57878b1b4b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9HIm92243295
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 03:23:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=X9ZcUe7iM
	8HFLsyduVewHPGfnp+EOXkEGwHMdQ6m/XI=; b=bntZNeyJ4FMRax/2oFU8EpE2E
	+wLQdKGDJGlyD7rI5UHWplipecBGX3NNOPjUCFRx6rmEktT+7Nw65ZOtVPzvPYMc
	JDHxv5OjNlQUSak1BetKT24V7Iw6xRJz61VI627LCzm4PiScbxEnmhjdrLArkx8t
	DPtN/A+L00gap6Fmp5gsdwBBXxCWs8E7IvRshyReACO40iOxMFZggTbSZhDvZDuW
	o42a61r1616zA5N7YBXjAEbD3ZuEo8in1772BquJFxHZZm1pmCPNzoc8Ah+BN4ih
	5lhDR6iKsQHPbsEy+b75hqRNqUjtroGGw7G+IXnJt2pIaSSn/WtZVp6n6zzVQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023130.outbound.protection.outlook.com [40.93.201.130])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j37f324nv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 03:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DM+omBSzvVDh5DAbbpQOAkq9U9HI/2CRiKbUBYTk951Suu0kMZWM+RxGe1hCZrfBKQ1NLqOkxviIHha+JDdAi+f+v5vaYXc7+OhoLY8eGdC4oiVdlYu8wf6nezAaPhAta1120QxbXR9ngh2bJ9WQBpdBMeCbM0Y1bhmyENiO8Ym8uJawAiVRt1fnk7yEH4zuop0iRyfUiF10x3zzhP2QMJWK1OhCD76NwCFalMWNoGPTNP7rw5SD0jamK7Aqm/onqHkWWUNRwYIiLZ1jD0+fLFekKyr+destmWOKtBLKQT+i4G8HgNm+jFvgMQIQb1bL2ksttOZ2uU+8jI3PoTVqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9ZcUe7iM8HFLsyduVewHPGfnp+EOXkEGwHMdQ6m/XI=;
 b=rF0Fk3ako+ReXCpGqfOJCa7jclx9rhiiZOpUUV7CGBMhmkqA+9dR5hmPSUgl2s6xuR+Z/15eIolB2esAWXDVYDdVgLIpPuoebZNZ2QifZOzGmA9UcD+1BOZ37prmjtQPke1gwqWsOfu4OwwfuryVHj8tPGou4Vf4PU2+LCngEMpS5GE64sGUFry3BsrgoYEYXh83oO9aVxiYo4e2UWYaHWr32vG8Mw2J9cMYgJatMEFTPVN6U6yQZSSqZwdC8/eBpa2X1BaLYc4EXolLTxLN0161rk3Wq9wE0GPC4a1yLRtTr5w5qU0uHYw5+hWZK4MBTq/nGp7O/dLlTlrMjQGlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by PH0PR11MB4792.namprd11.prod.outlook.com
 (2603:10b6:510:32::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 11:23:37 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 11:23:36 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] gcc: Fix for CVE-2026-115456
Date: Mon, 23 Nov 2026 03:23:14 -0800
Message-ID: <20261123112314.7326-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|PH0PR11MB4792:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b8242c-5621-4ede-1ea3-08df49543784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|38350700014|10067099003|261009223027099003|11063799006|56012099006|260925021911599003|260925022911599003|260925021311599003|261021123027099003|261021130227099003|261021135927099003|261021133027099003|261021121427099003|261022115727099003|261022075727099003|261022113327099003|261022105027099003|261009221727099003|261009220027099003|261009223327099003|261009221227099003|261026130827099003|261028144727099003|261026135527099003|261026140227099003|261026121527099003|261102123227099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: imRECAmxENBQDi0q/GATtUKl4sq1F7/xNcTnoMb+HmvOoqU7TXz6tdKRfskhuPuydhXCLMOEUBZugOYx9cH+qAfPmKOFEV0VzPj1aj5X75McUqoovLSJBpZdhEBbvb8QbO3BXujltmC3RmzEnzDi0hn+UanQAktzInDazpmWXMgZ5vNAR8v4Cx9Da8EwaynNGBKAM4ToxZIAWSxphZK3sSXlC0BRjmL1mP8ZDYYloqPkZxNlbPkOM1pqXEP5FnngKJkgbqjpnuEGVxDJ5gO/DW4ydFMjwJPlPA262WdqFhJ7Ef8Kg5AcnCSvGIxuV7D3JhbwiMbtxsi6EsDblXqAmrBKlPfesYsZdvownTGYCjNWeMzI0EXLnY8P36JuySbT91jHMMM5Ka9DzUH4l7PnAINcyxMoh+GmeWAEq1u9IA7vvdZJDzNYk9OEq+teaQ6jPY0K7xtH+URZugsqQwMkmv+X9j3NYPrgyrTOmEi0kNcXbqIDBeHBk9k7cvjwM+3PybqCsJa11WEEYZlw/A8v6YlXEyOAmDZCIrD8bxkJRAfTHY5QZeCj4wLvh48c9DspxFnLfy9JlTaqdAHCF9bnZb3KhVqYRNdkG3Y3U9my5B3B53pm5uGq81NkXLCiGfA8NQLxLlfP3orQd1TekVEBIYpjT+FEUvfP+ZTEv6x0TORo70TrvP0PQq5dTPGjiPPgONe1CzTUGfb61Q+vyCPBE3bZfzC0bqVjLiQ/e1E2C5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(38350700014)(10067099003)(261009223027099003)(11063799006)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(261021123027099003)(261021130227099003)(261021135927099003)(261021133027099003)(261021121427099003)(261022115727099003)(261022075727099003)(261022113327099003)(261022105027099003)(261009221727099003)(261009220027099003)(261009223327099003)(261009221227099003)(261026130827099003)(261028144727099003)(261026135527099003)(261026140227099003)(261026121527099003)(261102123227099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IXmeMbUy1Km+iHmpa6MY2xaoo1vH9GEPP5RzZuFLc4ENntoppWS0n/JSD4bH?=
 =?us-ascii?Q?fJl9akWBW0toRAJHIGkywPau0J7/AxVDtSWwGIXJNpffB8WYn4lcIgUvaA7Z?=
 =?us-ascii?Q?syB0l1udaEhRGlNUUT7chsVyeyb1GtzRNgutngRyw29G6cz8gPuIEi636HdN?=
 =?us-ascii?Q?yoYxYVJuWhbis0EK+wJ+HirF4RhXf/m3dDU6PAyvJPUpTnLIViulph4/l9l+?=
 =?us-ascii?Q?kIDB0niHS1lsUcdJRibACd2QG01T2o69K1hlfqNwfi6re3pcBZxuTHsro6zm?=
 =?us-ascii?Q?Kcrb7VKqMHrCix1l685KdnaSo45arNy1wLCPSHR/jm6PGjpBgGUa9/hC1Dve?=
 =?us-ascii?Q?7fSiXc186sPG3FCipuIYRu9Ag1Nq1iVo2UqF4fBDLiPwkKLHUc11oAQFfNm8?=
 =?us-ascii?Q?RF98IUpgke3E3pvgzVcAy8Awt0vkwKXKetO2jks+2hG6D2U9CMpWxA+YFLco?=
 =?us-ascii?Q?pfRxryAtUTbrnSGn6IeDE/9CChb7VScNy+lgrwaFD+e/r0BGOIMwYjGWn/d0?=
 =?us-ascii?Q?UQ/BJqLaiVcVN2QxzBxznYluQitaO0xgEe+Vralm74NsyETjwoCtmPjuNGlV?=
 =?us-ascii?Q?Y4tjpj/rMr15zGxr2e384Ry1I9NQwZl9XBYLghPmRlpj/TQ5iDsXZ4M5s3NI?=
 =?us-ascii?Q?DI8hMJ7tOH43BRpfMUmYZe276FO52Of6rPG35xSZmIE3j6rxJPiG5PylwZ2f?=
 =?us-ascii?Q?LoVjvCtnlni56ETvH5v1zjUDBLQz5h8WSHZmwFw+kw+PZUjOUbR3iwFJpibA?=
 =?us-ascii?Q?Vz5hmpdeMax7wt3RqOY8Bx9V7/BP4wrUnuNJrAg54sZz6VVDVxkqEMtHfzK8?=
 =?us-ascii?Q?BgUOAB+dybClch0bveCpK5M6ANzTdoUWi0UeVVlRmWuHVF9vJYnS9+53uBtr?=
 =?us-ascii?Q?qyQjTpAABNCjeJAsHAmGi1Tn4UkPLDbYDnvi+ehgUdKVMQKDCBefAeo21oGm?=
 =?us-ascii?Q?9lIy94dO+4eIwn77bJ+qK2dGr3CCl8A1t3MhHCiVVZsffQ+hEA+mFdf04vW3?=
 =?us-ascii?Q?fVZs+xOnu8HvbRRmvbyXhyA+Pf79zXnguIl+ETyCOWdV2KdseNcTOvnwohyI?=
 =?us-ascii?Q?echSYnJECMHSAoFBr4wKx61+Jd45D+zcDS/Eg4nw73XQWe6Zs+cHuHMsAzeR?=
 =?us-ascii?Q?GpQcR9lluBou7WCPfpnIqYlRo6fPOGqNtJEx3v5t0ZOSqPV2Cp+R7bHZRRLY?=
 =?us-ascii?Q?uS0YUeQralcoqcQamn8pk77YWyXj8kg58YFifdhHeU/K90WEmKMP036thAre?=
 =?us-ascii?Q?/r0OZcAnqjwK3+mItqKTFM/ObKDJo8XGvfkVGSfAFTZh21wU+uZaGz3eekxF?=
 =?us-ascii?Q?JAC638GBMZRvMs0ExblGAS8JzseQ90bynlDksWACvzcA4cA9qdMT4jRBSje3?=
 =?us-ascii?Q?8bsW8dOHaHMEwQ4vKwtgvv6lXmMayI4nCtj7iPa8+3EzYZNn3gO80+ss8Vkh?=
 =?us-ascii?Q?+b6BCpfRwLvLuvYZCS4W8cYYWGxZ/J9hLVYCMFef431IDArwB5nB8oB7f+de?=
 =?us-ascii?Q?cEMY6ElSwQjgKEU22eZOuP6q7J55r5mI1XduwM0M6zk7amdnP27uUndjHWFX?=
 =?us-ascii?Q?qYUOgFItUSxmFBfK/Y5Fr9+WCPHOYAKFid634EIJbIfdvPWuGwHm/G0BO2iA?=
 =?us-ascii?Q?tag0hdqQx5t42zaTxE9WvLY87GF3ABiz8jHXPYs/emxMSTuWif5iU+GR2jNn?=
 =?us-ascii?Q?Ge69tIoKonHSTt1tpgNOb69ComuRyGO7yZ4L/LKg+St9x3zepxJbxwg4hXaS?=
 =?us-ascii?Q?l/9uiqQPKMj6gVwViHBznuXfwJF/wMY=3D?=
X-Exchange-RoutingPolicyChecked: ip7b/2nXPOchDm2FX0xEhUxHeHnK28U5wmZG03C7oe+9rrQzL3Psq8zKVdldDjErAVpw9FrXa2URUuCkU2/K9Ia8mJ53BpoGB1nbISmEvRKqF3WM4rnHioqVLA8NSGvRTnzWx+AYeZdiJVu0PokxM1mYFYCM9k6BdOzBhZaC3gYNzaPOZPduzh5vwykT9GaZnFMtQ8QlrdWGDUPwg4ojCMbbQ77uzODvwV/yyyXI0iZHAOkzb9ZBNiZ798kpeHaoKOtE7k5urMvhf52Ur78NiEHhuG2NfM8pHl+66opCIEyJUuJ/GLUS1MEKdLZRM7lfG+Burljt6r5veXR6/RYP7g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b8242c-5621-4ede-1ea3-08df49543784
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:23:36.8416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iASEozuSd5fmkke9a4A98Kj3Q/Pv8vSYspcuRe1c7TiBKBnNFQqiLbg762HJFcm9gInj6kE2mnA4irFZqgjh5gmjDgpOFlU1is5yMKwG21k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
X-Authority-Analysis: v=2.4 cv=U8MHnuru c=1 sm=1 tr=0 ts=6b04223c cx=c_pps
 a=R3F9aRyRY32UOR1LGZhq/Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=20KFwNOVAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=LgH-VTes1Od8Cjp2bRwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NSBTYWx0ZWRfXwH2jeSM6XAtD
 aB5CEz9PqMBy1suT65p9haKX4V3qXgvBkPVFVCTIPpPnTH4ssCr/xce7v0itXCp6FNNYz/K7/aV
 q/hrzw1KnAYsc70MpghHudhQQISxwGJSFqXbon7Nn7P0KCqV4F/N
X-Proofpoint-ORIG-GUID: gg23ljEx9HZplLSq6B7oD8Q15LBZdcdK
X-Proofpoint-GUID: gg23ljEx9HZplLSq6B7oD8Q15LBZdcdK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NSBTYWx0ZWRfX3pZWCqo1EHpZ
 ECMUo09bFqTkseK3OnZ5w4J1gPFVQ2eJ7zFKe/rPxzeGVWyRDMRTSl9tk22M/s5pQzXDrG+8M6r
 YICHguSJwZ6fECKarnPAo53wQ1HSe9CC84n+yibuZDur3W6CMQUIwMItIvY5yObInVcBVmsE+DO
 1KW6GxDupHLvqxeN3gvqHZi52I7QUDcvS0gC6RQbF4HkD93Ng4tL5PziccBNJ5qt+j3dJLzfXpU
 kcprH7QCNssAJc6x66w6jMWxQqKA1DpPMeHJCj+o27fDcEUbxvA93Q1gUqeeNjP29oZpKesJgC5
 gkLKE26OR3tcvb5lmhuKwUBk8watUo+PQmzKeV5HgvNF7yVVqogDX7jl8pqXNclo16J7qXD1fGW
 oSoGTr9C57RXsN+Iy/Ys3b/w8J5aR64qOh2iO03SsE6/5nbQqves0ttQ7MKcy7okY0ExaW/pUb/
 bLCr8uHenH1GqwrdNyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250900
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
 .../gcc/gcc/0028-CVE-2026-115456.patch        | 141 ++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-CVE-2026-115456.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
index a629b48d95..6cc9dc3344 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -76,6 +76,7 @@ SRC_URI = "${BASEURI} \
            file://0001-Fix-check-for-working-assembler-gdwarf-4-option.patch \
 	   file://0026-CVE-2026-102010.patch \
 	   file://0027-CVE-2026-125709.patch \
+	   file://0028-CVE-2026-115456.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0028-CVE-2026-115456.patch b/meta/recipes-devtools/gcc/gcc/0028-CVE-2026-115456.patch
new file mode 100644
index 0000000000..bbbbc34a17
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-CVE-2026-115456.patch
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
2.55.0

