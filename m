Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12931.1793283229045513722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 07:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pppw0iTo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5762ce2ea8=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TE40hp3309491
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 07:13:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=RxA4rlq1A
	1U9KnnhsUhE9K8rI9WFuOQTynuvj1lp5n0=; b=pppw0iToLWEf3lStP38yXUrGL
	Rlu6AOvj0eIV3s5kwm/VAa1d3sw6Y6EpVjoAiiqq8dmCtHsu76ArR0N2TVx3Wb94
	q3xqMtPC5FoxOWA5+kBu1ymITrnTkr03d8ErFB1st0WGolEqRRvO+aaxYDir0Zqp
	ejNM7XgmP0mpQo2YWuGkYjat53NB3QhAcLhqwTWx/UR48z2igqowzMVrcjoaRwPg
	QvQm/Xl4hbTBl0ygOSgIWWC/Kb6RnjfLJl+4lmcLdpvBo4yjDbaVB8YLhazhuzW6
	hP38Gsx9tAkH9KM6NyzIeTqrObZF/gxW1LBY5on3gigVvjaz3gOsbvV0RsNXw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023101.outbound.protection.outlook.com [40.93.201.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hm7jw00mc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 07:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+1J37w50ibicOAdRoJLXkl+W7f+aoLDE4I0DXCIQaVZ3/mmo1r1iDqwmpgVOw30FpTVgfIE0YIpfxY21VxqfBO8cTV3JOANGszuro4m1F6H23XVn5yD4Oiu8zP0FsGK4J1sFMN+pr2EGnE79g4BkNo+bLBKGt9EVzgw13kfUSWh5GKvz1KXe2BSnrR8VbQfl2wPyzUYaTC/xSpi6Gd8yW28O9pe0tQt5yZaScIqOehfxRZgVJpEMR2fmEvjVs2pM9f1bnaHNxejufsiDFmndLShCLjZNo17gILgEJJM5usUY3S3t45+yacaZ1orLOkjm57BOIt+s2SLKHs/OrLqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxA4rlq1A1U9KnnhsUhE9K8rI9WFuOQTynuvj1lp5n0=;
 b=XkjMJAR+VVtGjheEz8vd4mQZ7ipvAe8S5Q6AUDTu29jRzOOp4wE/VEF94wIuzrmAjcMDfZBkkLP4XacdA+zUVNRXh4iBTetIevpH10cM5obya3qB2xoDKTV991VuEDNEsgfCncrCKMEpTqLL7JkVOjZZEQntYdL8FiJjddRYusBTW1Iaapq4i0A7AaARMur60cFBSPImYVfnJWD21oFfE5Zak4qLaijX8aPEh+Wfk6+gNRZsUL7eafBrcw0rfShPH31bLdhqeC14M2iotAFK+XwGMqS8eR+Q8/BJaKKtL1Wc63KRLCBNuqzBV2AnmyYaJCtaqfRKVQ2js08a77zBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 14:13:44 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 14:13:44 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, liezhi.yang@windriver.com,
        sundeep.kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH] pseudo: Tell makewrappers the target architecture
Date: Thu, 29 Oct 2026 07:13:25 -0700
Message-ID: <20261029141325.356259-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::33) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|LV3PR11MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: a78c9ba7-df34-4fc7-020c-08df35c6d70b
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|260925021911599003|261026140227099003|38350700014|260925022911599003|260925021311599003|56012099006|11063799006|261009221227099003|261022105027099003|261009220027099003|261009221727099003|261009223327099003|261021121427099003|10067099003|261009223027099003|261022075727099003|261028144727099003|261021123027099003|12006099003|18002099003|261026121527099003|25016099003|29003799003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: kSYca9nR6yUmZtgC46QLFEtmAm50idTkEry1wjweXameUnFVMvsfIrCtphCR/iudaP8EQeAG5FcQvrvvRwogxHq9J5+NKX7jTgBhyxch4XB13g4JU/Yu8NwHImCBQkCRwSjPmNbTsRKwWA0rlC4e1ZTXhlURxRsNGA0a48kvAK9P4+Jjvcf6lffdBjpfzRUeb68LS6FNtssPTfoPamPAzyywSNdNrKKfJGNcu9S7tRb7lPHsvEb6mFCQ9TbYxdFlxzB7g9z/BbkDqwzPCunebtUwOLWkcsJoVHRqg5g8tVDPjYB262IoVTinV8gYAKfD/IijlLDVQgxo+N62EQn6pjYvPl07LrbdbZPsVG/tin0n7f/RVMI36KOV7oRNKkZ7Co6PLM6chcXxDgDQJDpBkiDjp0IcquJupgevAEVYMy3xNO9qS4WEuKUXLGa6Mh6QiD2utoRvZvq4Spiqg9GRcSYGYjH3360qSP0AVJds/gqOP1GsYNut3svfKKqMcIHYGzzD69muEkxhyIJEHBykV4zoLgFS125R0deyi5uEr6RJzeyRGVzXsSYbRS+cBpzCLeYNs7eDueRAIJHwo+Wp94kBHxC5/fYfOAmjc7eVmyur2iMfV0Kj24t7y8eUsFPM48eyqh7bzqOeN867Wkw/G1td8XaIyM1wTlthI1HmMUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(260925021911599003)(261026140227099003)(38350700014)(260925022911599003)(260925021311599003)(56012099006)(11063799006)(261009221227099003)(261022105027099003)(261009220027099003)(261009221727099003)(261009223327099003)(261021121427099003)(10067099003)(261009223027099003)(261022075727099003)(261028144727099003)(261021123027099003)(12006099003)(18002099003)(261026121527099003)(25016099003)(29003799003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QyY73c4nDPpTb9zvVapMzhg/h64JliOimS2qP5fsufz1Yiy/l1jtYx1nI5fd?=
 =?us-ascii?Q?WRcNAxc/GIlCZvwduUtIVs0J/17qvkFRsO4WlMZkdE4s79sU7kTZKY45x56n?=
 =?us-ascii?Q?qOxaojDycwBePZUKKJly+NDAXdy94NLpjVKfRu9X0nA+W35w5hX0bilP/j2X?=
 =?us-ascii?Q?rHNrmG1JvBJw6HpOANt3rgJ4wjHpG3DGdITaGiUFOdYv60MJM3/nID3DRCXG?=
 =?us-ascii?Q?OROTSHUzO0PSHv7yOADYsLwD11O+UPfiZYB0LnWNhtRUlHfOPgS6CIGMkUe7?=
 =?us-ascii?Q?qeh65Qwrg+2MjTBU1GR7SvdvLPuigYSRjV8W/SUdwfpndG9LYCisA02k2rqs?=
 =?us-ascii?Q?w3RiJoOp8PdpsnB33eNrMyTWvASGSDgL9+MOzJnnCqWLmFtZ5UBWNzSFaT73?=
 =?us-ascii?Q?OBZQRfKRV+viMqTec7cR68q+X0fQ9gH2LZA7pCrxP50gayCAYBPDwh18k5db?=
 =?us-ascii?Q?LTfMdzN0GFuQF1ndOBQ8gvy+hXLCNUlXVnyOhc0YSLEWEVGj0CEx3nOfW94Z?=
 =?us-ascii?Q?+xp8haQAJflgz89QM3er+5zEfuMS7dT2lNqux8TWKGsU3w1KUJd1BrayA7+b?=
 =?us-ascii?Q?PUIgFvcANlTfr8+pI2olnYExZg3L0me+dWUN8Czu18vlTx/LNZDvYxX9jwIU?=
 =?us-ascii?Q?25/iuDpKsh5wlIEb5PVZPUGwXIVBgbX87EYGQPJCXWGSd0Y5sqfs6cvE3QHD?=
 =?us-ascii?Q?ozRNEnltX7TF7Vb1eo9csMh+8uecVXkhRGkDP48awtmEgQ3c/9RebBtWhY+Y?=
 =?us-ascii?Q?BfJXa6w776+DyojsotBA8pfbl5T1NYmGlY3nJekgoSmFc2k12a/YUCm2B2WS?=
 =?us-ascii?Q?Tt3mhwbti4xyNxmwBARC2bIqPO4euBFdy0b8joyotohY0a5M8p5N0DWsTGxd?=
 =?us-ascii?Q?u2UX4r37dwlOdCxINSzQm4iyYfVLOmdRAemIVLQFeTRRPPtb07YJsrXidVwc?=
 =?us-ascii?Q?1VRkBdtkgrtU66ZfN7s8wcLnCX8rpPYuik3MBtnKbdBqp2QQtorv8Hl5/kfL?=
 =?us-ascii?Q?PcsyA4BaytWCJmUCob0hQOngRKVVE3BGuT5HhPpg3lPRIYvhSGfD54acubOG?=
 =?us-ascii?Q?BjNTpIjWdTh9InkhkfAsNLPI2ZxafJsjVXBLmaYWwwReCH0+33dyEVkx9dMg?=
 =?us-ascii?Q?abiiEsOxUUbH7oUjI3qYjgczdvNM9y0BK41h6WXe0cfXauIRa2/mVe9j16S/?=
 =?us-ascii?Q?Hw1axdIx84p0kCcqPlc04pJ0Ta37asBe5r9ZSi6H+n4+G8/dghU3+0MdgWBE?=
 =?us-ascii?Q?BX2IOhh5n1485ae394kM5m8zqG5eyJYE+pjQbdFlU8BlwUefz4FBE3NVRm26?=
 =?us-ascii?Q?a9zSkFFSOnoHDNfGGx5F3raa6ZkKr3QniSRXseIoI8voifAshV6Lyxm/Cl+A?=
 =?us-ascii?Q?zlCE+X18U/36ulSvMsq8kLK+86LYlBmuzNHd2VRUMAl1UwL0B0UjVI3MyCeO?=
 =?us-ascii?Q?p35L40DBrOGB+Sns4+C1aGL9jwwCu2gVJ4zWkzHqJlrtTnWZYdHdOWWNAVog?=
 =?us-ascii?Q?GTdQ41W92g1kVu/g2/98nQHW3wpmHFtb7QvOaJPkhFIF2XX9osN7QOArkPX3?=
 =?us-ascii?Q?MzMW/CQnLlRnNsXaohmO9xWrjL0nodFUT5TfBED5rDufDJYinfIYlt4rOJOU?=
 =?us-ascii?Q?NR7X4pbogs+dgPb8MJeulaYqsYbLBeNaAo+c/nJlpUooUu2+8aXUvm0HGH47?=
 =?us-ascii?Q?rddx7JIOBftFXQvzZci/YXmJO8tY29l4y4GOH8NK0Sq/KsWqjqgollK+bcEm?=
 =?us-ascii?Q?hbO/O4Sh3GZOZdDSTPSerG47lKj+KA4=3D?=
X-Exchange-RoutingPolicyChecked: KxfOV8aalxTp4kpTZES0+undwM2Qg0+sV7mx/ULBMY6bPQTbn+8SmSvWWcaPN1xnUamqJml8qCxOGDCOcC0F74EHOJNtVrORf7WPmA7J7IQy72O28E/Areu/VNHCp0elgGYZN9xtdWPX51stNJxqKBvNzGxJc6P8Xct04Jjbov88Slflhx37zUBUy8djl78rh35FaGD5ETlaHLRoLsAPZ5huG6MGpVlcUqYwsUaiATbSimGGmoX3qiGrTqmqENPGKA61Va1znApi0BaNQqjpUtup6UjaA/ryTVt7GYNYi14SjhuWqxOWH55bIdtZcQio4GbePT5SX9EbfSFYti9A9Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78c9ba7-df34-4fc7-020c-08df35c6d70b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:13:43.9942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ToGDsU60cCJUOLPam3JWbmLxuvwLrYlEVwk7/z38jykVM0KtC22DD3bWF1F6FUfnYNa72jSlOoiRHkeDSL5LNovNQCGUJGxQnKHwSw5kRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: agE_P1NUDOkDbGpea6BQIH6jxyGNBKIW
X-Authority-Analysis: v=2.4 cv=V9LoQuni c=1 sm=1 tr=0 ts=6ae3549c cx=c_pps
 a=S0CpYmVZ9TPoM0rEAH/1JQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=NqVRljQcUNDXJAWXZKsA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1NCBTYWx0ZWRfXxtZ+VG6KsUtL
 JUyQMgO6bO3tHp9vioH4CBWrL4wQKKWpuqrzzMn7MGHVaC99eJexetx+FXpFzsGV+4D1P4Y1jcp
 TN2XIVs1FunCuX7uRvpsSFuovbK64NKo06QOM7HsfwRu6b4UwHLPP/aWRoIgYF4evYZLR+699M9
 da0P+l5PePWZRW6k7XuhsQjTExQqstpvVipcWnBA4gmhjbWRuZGwVSoEloLTWl6QcX4En3bu5ZV
 w/hUrNSMZR0GTBKZaQNuQTCYNuX0BMKuJgmaOaHbbJxmNgffUWla62q6mENtG0gf3oBHQAePCvh
 vD7kaEkVSd7Z/8M7Gd0bS6uiJc7WsvYWnpR+FYuo70YKCb1EgHfYflFaZi0+xjr5sBMqvCW2ztr
 ERYBOTZu+QBid2j39DK4TV0ktMXVeBIYzl+AbZwUMmUpdq/Yw8IOq2csdUyyLjgjRmhNLcwOdwN
 52sLTVnwmYrr2IYa7/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1NCBTYWx0ZWRfXxEDAGg4P63YV
 g6FOo0POHKcp2B+w8k8u+cWb6XgKe4HCSISm9X4xGTDq3u9OuIuNTzTUvG5mwltpLJ31qhV6YFi
 Tc59WOgeGkK1TjrkvVzhUwg267vm2IGzUrfchnlnbP0W/lveCy++
X-Proofpoint-ORIG-GUID: Wh67ygtC7lGDwaauUranVyWuLBXmS219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 14:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248949
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

makewrappers chooses the architecture specific entries in wrapfuncs.in
(e.g. the GLIBC_2.17 symbol versions for the xattr wrappers on aarch64)
based on platform.machine(), i.e. the machine running the build rather
than the machine pseudo is being built for. The result is that pseudo
built for qemux86-64 on an aarch64 autobuilder worker ends up with
GLIBC_2.17 instead of GLIBC_2.3 and the pseudo packages aren't
reproducible between the x86_64 and aarch64 workers.

Add the upstream patch which allows MAKEWRAPPERS_ARCH to override this
and set it to TARGET_ARCH. pseudo-native is unaffected since TARGET_ARCH
is BUILD_ARCH there.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...ow-the-wrapper-architecture-to-be-se.patch | 88 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo.inc       |  5 ++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 3 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch b/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
new file mode 100644
index 0000000000..7bc897b7e5
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
@@ -0,0 +1,88 @@
+From 43c81997fbe3b39ca5529c1fa3a80695c48f2af6 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Thu, 29 Oct 2026 06:55:15 -0700
+Subject: [PATCH] makewrappers: Allow the wrapper architecture to be set for
+ cross builds
+
+Architecture specific modifiers in wrapfuncs.in, such as
+version-aarch64="GLIBC_2.17" on the xattr wrappers, are selected with
+platform.machine(), so they follow the machine running the script
+rather than the one pseudo is built for. An aarch64 pseudo cross built
+on x86_64 ends up with GLIBC_2.3 and the reverse with GLIBC_2.17, which
+shows up as pseudo not being reproducible between x86_64 and aarch64
+builders.
+
+Add a MAKEWRAPPERS_ARCH variable the build can set and pass it through
+from the Makefile. Unset, the build machine is used as before.
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/yocto-patches/message/5183]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ Makefile.in  | 5 ++++-
+ makewrappers | 9 +++++++--
+ 2 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6640a73..bc2ab92 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -34,6 +34,9 @@ BITS=@BITS@
+ ARCH_FLAGS=@ARCH_FLAGS@
+ MARK64=@MARK64@
+ RPATH=@RPATH@
++# Architecture the wrappers are generated for, as a uname -m name.
++# Empty means the build machine; set it when cross compiling.
++MAKEWRAPPERS_ARCH ?=
+ VERSION=1.99.0
+ 
+ LIB=@LIB@
+@@ -146,7 +149,7 @@ tables: enums/*.in maketables templatefile.py $(TABLES)
+ 	./maketables enums/*.in
+ 
+ wrappers: makewrappers templatefile.py $(TEMPLATES) ports/*/wrapfuncs.in
+-	CC="$(CC) $(CFLAGS) $(CFLAGS_PSEUDO)" ./makewrappers "xattr=$(XATTR)"
++	CC="$(CC) $(CFLAGS) $(CFLAGS_PSEUDO)" MAKEWRAPPERS_ARCH="$(MAKEWRAPPERS_ARCH)" ./makewrappers "xattr=$(XATTR)"
+ 
+ .SECONDARY: tables wrappers
+ 
+diff --git a/makewrappers b/makewrappers
+index 19508fa..c90f5c7 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -15,6 +15,10 @@ import platform
+ import subprocess
+ from templatefile import TemplateFile
+ 
++def wrapper_arch():
++    """Architecture the wrappers are built for: MAKEWRAPPERS_ARCH or the build machine."""
++    return os.environ.get("MAKEWRAPPERS_ARCH", "").strip() or platform.machine()
++
+ class ArgumentList:
+     """A (possibly empty) list of arguments"""
+ 
+@@ -319,11 +323,11 @@ class Function:
+             # Strip all leading/trailing whitespace
+             modifiers = {k.strip():v.strip() for k, v in modifiers.items()}
+ 
+-            arch = "-" + platform.machine()
++            arch = "-" + wrapper_arch()
+             # Sorted so that versions-foo appear after versions, so overrides are easy
+             for key in sorted(modifiers):
+                 value = modifiers[key].replace('<equals>', '==')
+-                # If the key is version-arm64 and we're on arm64 then rename this to version
++                # If the key is version-arm64 and we're building for arm64 then rename this to version
+                 if key.endswith(arch):
+                     key = key.replace(arch, "")
+                 setattr(self, key, value)
+@@ -702,6 +706,7 @@ def main(argv):
+     port = Port('common', sources)
+ 
+     # the per-function stuff
++    print("Architecture for wrapper modifiers: %s" % wrapper_arch())
+     print("Writing functions...")
+     all_funcs = port.functions()
+     for name in sorted(all_funcs.keys()):
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index ba946ef9c9..526830207d 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -30,6 +30,11 @@ NO32LIBS:class-nativesdk = "1"
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback --enable-epoll --enable-xattr"
 
+# makewrappers picks architecture specific wrapper modifiers from the machine
+# it runs on (platform.machine()), which is wrong when cross compiling. Tell it
+# the target instead. pseudo-native is unchanged: TARGET_ARCH is BUILD_ARCH.
+export MAKEWRAPPERS_ARCH = "${TARGET_ARCH}"
+
 # Compile for the local machine arch...
 do_compile () {
 	if [ "${SITEINFO_BITS}" = "64" ]; then
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c0332dc9e2..f8903dbb63 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -3,6 +3,7 @@ require pseudo.inc
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://fallback-passwd \
            file://fallback-group \
+           file://0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch \
            "
 SRC_URI:append:class-native = " \
     http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
-- 
2.49.0

