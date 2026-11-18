Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11040.1795003500068964114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 04:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pPtW0Y8x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57829d0008=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBLYjY2516954
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 04:04:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=WbQkyNgsj
	9ZkTorlj5/K+Ay43glcPk3cxX89O78md6Y=; b=pPtW0Y8x+nzgm8T5cf28eDxAy
	ZRSAUdlYo44WyN3MflvzJyQwP8QU3gG5X2nKJIPSVvzBCfWBlNe3RseTG1MoydAn
	Qytjuh6K/SXU3/6WiJZFrI9h2u7UxhhC8zUUVN0ci9h7shDWxfUSG8+lVGcVC6oD
	UG/YajXfjxMZvYJWSZWwub2AUPUea2sturMiiErn16Pps3GY8TBw7CBJL1DKqUoB
	3yBvjciGobccLN/JWbgPZvhONsEo7uRkDmgaA45srRkvduHm1+kRAPmvt+zAY05B
	8XZ+LXRNhIAj2GnPRk2egBXtaHh/REPATqBdP0CC0i4/mlIvdKnowj96ecRpA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021088.outbound.protection.outlook.com [40.107.208.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvdgxbc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 04:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcXTvmaiT4vPQ/SnAux+Ao0GdtIcnygmDFLPAM5BIlajaar8BEU987BIK/G6ZV0f2IFtA66Xx6vjy5SamemEBk3KUoGRbV6rzbRDJasStqa1TOquzIuTZvQfWPf/Fd1hTETNeOVkrcGmna0/WzAEVdHU4F/rQGG6QunIzXOcclG4Co4F92t3ViQT5I87t/KCF4eEVvTksy4rfAgXwRJt7ALrfZhKehvyWNkBfGrJ2XaA3jk5Ezb1s8xp36t3Sk2DgU8xv0XOuAnOMHosHOexUwyaSh4Su01sthVdUQ5CSXG3QmNWgGwZgHmjnZPHikptuB6uWcWvKHnL77VFFkpwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbQkyNgsj9ZkTorlj5/K+Ay43glcPk3cxX89O78md6Y=;
 b=IVLb1FmGQvYN6fKeleQvbQZFnr5VciSIOOErzRBNa5/bgy00IcVL/odaUoSt8p0+rwpkSdSlTN5xWNHV08ULiUBQnoayfnfxuS8QlJSYaxD7sl0NrDA4QaIA4GQxbhsrkOeAej505eapFF54PS+pMbespqpTyE7/QDO2wtfRZDnUY03ElA0S/SWkxDoHDa7fMJt+YexoTWlIpoj4lNPuh461U2BbHwuOijVwCJI92cLImXVycs7hMe78Tv8yRug7ZyuwuEUdRhRRRsdBtrU2fG5pGDTtlCFEjXRKoAx90Vl2y/RArphATfWbpSWnbR0Va0cLPpy3a0ZW3tO14AB+sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 CY8PR11MB7900.namprd11.prod.outlook.com (2603:10b6:930:7a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Wed, 18 Nov 2026 12:04:55 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 12:04:54 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, mark.hatle@kernel.crashing.org,
        liezhi.yang@windriver.com, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2] pseudo: Tell makewrappers the target architecture
Date: Wed, 18 Nov 2026 04:04:26 -0800
Message-ID: <20261118120426.1918842-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::33) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|CY8PR11MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcb743f-35aa-46ef-c45b-08df456c2857
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|52116014|1800799024|376014|18002099003|6133799003|29003799003|25016099003|12006099003|3023799007|11063799006|56012099006|261022075727099003|261028144727099003|10067099003|261021121427099003|261021123027099003|261009223327099003|261009221227099003|261009220027099003|261009223027099003|261009221727099003|261102123227099003|261026121527099003|38350700014|261026140227099003|260925022911599003|261022105027099003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: swd7xjQgTjyZZXOm2eExe7LCgR2aiP7IbAvKBVQ6rACjbPZEuvaP7Tat61sIrrVVDF6xBAEkWwAh0mWCpemrTQnULJ5MQBbBLlVGB9HanWo07eIcxt4UIECiR5vvJsl2yavLy2EeN9YAl00qF6XQR6Iukqk6dH8O65WJnlLELbHiJUetpIPzLWRer4+2SpcLv4ISYWBRTfDlAhiVJ0mdLKBULC3RBrp9cCFas3UWMsM6j50Bzt4TPRuryyrElcd3Momq0YiAoHROF2N5J3sLqWoqnLELb62CQEmrBul7GBEkOjBXqsu1sJCz3pGScaKwZnaAo8URor1obygKO5awKf9nql2SG1FyYz5ue2TTNytYVxTVw9paFENnMkw5yUaM7EA/zOUM0un7uelT1odpNna0e7lYktkNnxuaa9+Ge1IeDASc+nmXJLQj37+l67fnncLAY4jQ3zOtwCdx6G+WbOf6QEml+c/sp+9i3jV/Euco38/ubyTdtjQh/mYKVzmT6Dtcipklh5LrtNMliKOpl9Bd89EnwAbx0wlgJxcKIn2FbjQQfH1kENs4LhHvbPGA6M4cj/8e8uVesgcZiHIAL5qi+6ZTkOkID6knqsIUcMTB3TSLCNuev+TmzdKCMrgOAJPRK+cHFBeUJFFkZi/Tq5RSBkojf5h4vuccdU/Vnr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(1800799024)(376014)(18002099003)(6133799003)(29003799003)(25016099003)(12006099003)(3023799007)(11063799006)(56012099006)(261022075727099003)(261028144727099003)(10067099003)(261021121427099003)(261021123027099003)(261009223327099003)(261009221227099003)(261009220027099003)(261009223027099003)(261009221727099003)(261102123227099003)(261026121527099003)(38350700014)(261026140227099003)(260925022911599003)(261022105027099003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oVZ9X4wxcRRSuFC+OVeDJ4fKoy+1Y3dlzXKdH5MfT6oS3Kz4qZj39/eZr4Lf?=
 =?us-ascii?Q?OJkZ1l8wtseya8oYY4J2KQlnbgVg9IQmS+SsgPe5+QWO8JNmxRRJAZCzKRMl?=
 =?us-ascii?Q?m/wQ7FTtL9m5E01ppIiYLLPy4xYfTYIxqM/CSbbsx0ZDhD8IEUmXEm3TiwlG?=
 =?us-ascii?Q?xZeI0WlR2m8wZmZA6ygxStwX2t6eXDr0O15ALd2MyqabONFyb0RlhTPW4qT8?=
 =?us-ascii?Q?NamyAlTfrW/u72j+fMPluZnPWunVv3jDA6e9JCA8sLJQ4GlYf0V+io96Bovc?=
 =?us-ascii?Q?WL4f7MYcLeAIM38QURoyoUxKhntvrky3NebVYyXdNx5Wf+kWLvktEGQQRLza?=
 =?us-ascii?Q?FYyLUsHB0majO/iSIqTFr9CbbwSexlgb68FeXs+VmgNo6QKoB2LiY8aN2z3I?=
 =?us-ascii?Q?kst3in+LzsIVnrnNRKvteHsOIIOtSZ21T+Y1CEI9t3L3Jwavl67LtANAIUMQ?=
 =?us-ascii?Q?ugXH8u/3u2CuZNDHV56tfvAEAaz5szhHsmmwtFIiNdlzrziHWQSVsqsZezJj?=
 =?us-ascii?Q?vkVLOwr2FanVPMcHMEuuDIXCWBElBsIYnaQSmSOUsvgFFSn6HyEkVUwoVMg/?=
 =?us-ascii?Q?Faw2tBT6INa1myx1dz8AAKgZHnoZDUti5bcQaEYpzDVZp/bNIhOD/98C4146?=
 =?us-ascii?Q?NyWwhWVoK1C0slViK1eskZ+yTq9xat4RCavOaJ5Q8cilSQFdUwc9s5GjTB8u?=
 =?us-ascii?Q?PRq/ZLvfzXH3woLP2+2vFN2erYUHJ3a8Cy66kO5T9vmaTf0Cs1E3WUhlFtb4?=
 =?us-ascii?Q?7EDBJqO5RMb4iVEOTdrMDQDTzKezE4iIHNXoEBq11gDTarS3CrjzdDJTWkur?=
 =?us-ascii?Q?k+SOnfAjtjcsabtiaP7QQgcutasvCzyCPU+wbIwHuMfsp/V/k6JIAvCmtxE9?=
 =?us-ascii?Q?l+XtJKgW2bXGO/lMFB4w+rR945WuZ3Wg+EYpUYq1Fc0yU+9VFMKbB3wb5mNY?=
 =?us-ascii?Q?lU99fuEXdvXyu3tmfN+kn30SI6WO8R40GGYxeT/MHEnbOezViHCy1UNoKTo7?=
 =?us-ascii?Q?waC8IjiSK9tGKdN2jLrkqHROCYzJHv2ny5NsJ9I5pT+z/rv7M/++CXHXz7U/?=
 =?us-ascii?Q?blphShQYnS0VuIeREm0hOoZAsQtHE+WUA5qA3qeNbEotZu8xa9UtVnjsaW46?=
 =?us-ascii?Q?GIZ59Tzr9erTJ8nNHOSgqAu2jkEE9uQKceQFOtCJcbi/2653Oc6Ew57M2g/4?=
 =?us-ascii?Q?Tt1fIh4hsVw6sT8KJ+laR10k6Hrk1kYIJwZUE3a7ASjiOfhQUm6DM5rwBWy6?=
 =?us-ascii?Q?ob9hxatR/Rini/CCQRynHFzTLGcSRdgc0N5IUiYG3/HwWNSREmgdN/LAa5JW?=
 =?us-ascii?Q?f9UFFtbehFgiut/4uWdck73IOfpqyFAU+bF0twJXGxVfacY0z0uwaRft6HLn?=
 =?us-ascii?Q?5Rx9cnYJ8BRNmJyWSLoneDz864Dfx6DF/VP4QG6QPvh+uq86++XUjr6de1KZ?=
 =?us-ascii?Q?UcgzVPta6+NQMQ1NgBGcNjArRrxleUR0f0hexpYqjRV8Z2d+tz3k+FW9N2Xz?=
 =?us-ascii?Q?SdS5mlfdKgq4CYIQaz+p7IKPhuW9IFeZIlahwCDHtZENz5SQpHm1oMyDGXdd?=
 =?us-ascii?Q?bn+sSVRXIdKzBkHPpIk/foc7AoEetV9HH6Xmxq5aVwC3fBt+Z/Ffnj3PNkiz?=
 =?us-ascii?Q?iT5irBwhHuC5AV4ql+lrXGi1fykGTCnqLavyexNTaTBkYNKiUenxVPkDFDxX?=
 =?us-ascii?Q?L7PF5+JrhVXFMc3kdXA7fAYjLzNDOMg+TT5D7g9JXE99EW+RP7vlSaTTFd3C?=
 =?us-ascii?Q?ZaXSncqSLODoUqgI7Af2yQrjOVnN+rs=3D?=
X-Exchange-RoutingPolicyChecked: Ddl43GkbFasiJIyXqx7/NFpJLnJMyz5NaTwdkQtU5/Iu+dCyL9uyAW8JX56hW+97OE61QLT5miOILTP/7K+MP6FRJM+UQXF+vZeQFJpyqiphDoK1g8hGvxYmLKX9/zWckahLPjU9iNHgf0Lgo+ib5qx+yfVMVBfpsRV/PPAZnIAu9406MIjAeFxudOlysn0+72enILgrTof+kit/wudNP5Rp/FILCZTwJoORbu1DVIqvnF2JjDlFTDhxzRHDrwiAAvK425V3KuAN1pDc5wyV3chHglZgA/L2y1l/Wl32QORYHWo8lY1JNFnm7iA8SP1P78j5krwh8vTwa1iBATchfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcb743f-35aa-46ef-c45b-08df456c2857
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:04:54.7174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwF3grDP4itehh5SKqsedO/zFl17cVR/jLsjKQW7mzZp917Ux0UOCT0tufNP8G8OaNuSykSytVPaQS81lBryRBA9cpD563b1nUapCUdamHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7900
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=XL2l2ghE c=1 sm=1 tr=0 ts=6afd946a cx=c_pps
 a=bSkFQXo9YJPfdG4GsN7qoA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=zd2uoN0lAAAA:8 a=aWP0L8byh6lFeiI77bUA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NyBTYWx0ZWRfX9tEj3g9aKm3P
 SEvguPCIgCKgOyYjCDZ8FO4A10me262HEqGdzchxK48CvqqrpZBDaFa3oLTAYOVDGwixGWWCAQF
 nQwjtHKj1vL6PQXWHKSnRuoDs6+LHY9levG66YTWV81OOg25VANg5nLT/+xRx6WgRn5EkfJX0EC
 z69UZD1NHKXKUVpQd6P+XNCeuFi6IYaLh+Ak2JmHu38s8a4I0mFPjbPs7tRGkreoUQJrsWL9t6s
 g3xpAl+9l+iPBqScln5tAgZF/ifT9X6fNv42c2wUgNl+xP2RpDJ00FG23sCJbONva2tWwUgPMYj
 p5Wse8E1TsF9DFKj3/rztuKR9ju8Tt/u3FTH5Bnd8kWnied3kq9+NZs7f6wtjwro7pPs/g9j2u9
 vDGspb8UkK9qkNUNjr1DgTMsTzG/ZCjQ+7k3VU2/6mp02rRBIHlLlfgpYo2tGrUp05d6EeOB2n3
 DOygJLPulo7Ju85fi5Q==
X-Proofpoint-ORIG-GUID: XaLY6CqCcmD4yaUstg_TaVhoJ54mR1A6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NyBTYWx0ZWRfX/rcL4KRYItgC
 ybU9GGJ9r3EoYrerbLz9wUd9eh9WwjaOiSyt510FCR5u/sKlSirpMVd5CGPMdTE+FXS0Ma9dLv2
 LNd9qA9n7Av6zbjyaUBloV4kYK0zVOawpKgkyn4MmOIJnrecWNPB
X-Proofpoint-GUID: Eow0jrqyIW3n8a2Ts04fMKgKA5RcFsjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250543
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

makewrappers picks the architecture specific entries in wrapfuncs.in
(e.g. the GLIBC_2.17 symbol versions for the xattr wrappers on aarch64)
from the machine running the build rather than the machine pseudo is
built for, so the pseudo packages differ between x86_64 and aarch64
autobuilder workers.

Backport the upstream fix, which adds a configure --target option, and
pass TARGET_SYS to it. pseudo-native is unchanged since TARGET_SYS is
the build machine there.

The fix is in pseudo-1.99.1, so the patch can be dropped once SRCREV
moves to that tag or later. The --target=${TARGET_SYS} in pseudo.inc
has to stay.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
v2: backport the upstream fix (pseudo 979add3116, in pseudo-1.99.1),
    reworked as a configure --target option as Mark suggested.

 ...ow-the-wrapper-architecture-to-be-se.patch | 149 ++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo.inc       |   4 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
 3 files changed, 152 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch b/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
new file mode 100644
index 0000000000..6bdea7ad6d
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
@@ -0,0 +1,149 @@
+From 979add31166eadc1954b32ff7cb6038fbd171e06 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Fri, 30 Oct 2026 11:56:45 -0700
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
+Add a --target option to configure and pass it on to makewrappers,
+which uses the cpu part of the triplet for these modifiers. Without
+--target the build machine is used as before.
+
+[YOCTO #16376]
+
+Upstream-Status: Backport [https://git.yoctoproject.org/pseudo/commit/?id=979add31166eadc1954b32ff7cb6038fbd171e06]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+Message-Id: <20261030185645.765144-1-sunilkumar.dora@windriver.com>
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+---
+ Makefile.in  |  3 ++-
+ configure    |  6 ++++++
+ makewrappers | 17 +++++++++++++++--
+ 3 files changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6640a73..9c6da77 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -34,6 +34,7 @@ BITS=@BITS@
+ ARCH_FLAGS=@ARCH_FLAGS@
+ MARK64=@MARK64@
+ RPATH=@RPATH@
++TARGET=@TARGET@
+ VERSION=1.99.0
+ 
+ LIB=@LIB@
+@@ -146,7 +147,7 @@ tables: enums/*.in maketables templatefile.py $(TABLES)
+ 	./maketables enums/*.in
+ 
+ wrappers: makewrappers templatefile.py $(TEMPLATES) ports/*/wrapfuncs.in
+-	CC="$(CC) $(CFLAGS) $(CFLAGS_PSEUDO)" ./makewrappers "xattr=$(XATTR)"
++	CC="$(CC) $(CFLAGS) $(CFLAGS_PSEUDO)" ./makewrappers --target="$(TARGET)" "xattr=$(XATTR)"
+ 
+ .SECONDARY: tables wrappers
+ 
+diff --git a/configure b/configure
+index 68c9962..b43809e 100755
+--- a/configure
++++ b/configure
+@@ -10,6 +10,7 @@
+ opt_prefix=
+ opt_libdir=
+ opt_suffix=
++opt_target=
+ opt_arch=x86
+ opt_bits=
+ opt_sqlite=/usr
+@@ -32,6 +33,7 @@ usage()
+     echo >&2 "  configure --prefix=..."
+     echo >&2 "           [--libdir=...]"
+     echo >&2 "           [--suffix=...]"
++    echo >&2 "           [--target=...]"
+     echo >&2 "           [--enable-memory-db]"
+     echo >&2 "           [--enable-epoll]"
+     echo >&2 "           [--enable-xattr]"
+@@ -153,6 +155,9 @@ do
+     --suffix=*)
+         opt_suffix=${arg#--suffix=}
+         ;;
++    --target=*)
++        opt_target=${arg#--target=}
++        ;;
+     --arch=*)
+         echo >&2 "WARNING: The --arch option is now deprecated. Use --cflags."
+         opt_arch=${arg#--arch=}
+@@ -341,6 +346,7 @@ sed -e '
+   s,@LIBDIR@,'"$opt_libdir"',g
+   s,@LIB@,'"$opt_lib"',g
+   s,@SUFFIX@,'"$opt_suffix"',g
++  s,@TARGET@,'"$opt_target"',g
+   s,@SQLITE@,'"$opt_sqlite"',g
+   s,@ARCH_FLAGS@,'"$arch_flags"',g
+   s,@DEFAULT_SQLITE@,'"$default_sqlite"',g
+diff --git a/makewrappers b/makewrappers
+index 81d2444..1ac46bf 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -15,6 +15,13 @@ import platform
+ import subprocess
+ from templatefile import TemplateFile
+ 
++# Set from --target=, empty means the machine running this script
++target_arch = ""
++
++def wrapper_arch():
++    """Architecture the wrappers are built for: the --target cpu or the build machine."""
++    return target_arch or platform.machine()
++
+ class ArgumentList:
+     """A (possibly empty) list of arguments"""
+ 
+@@ -316,11 +323,11 @@ class Function:
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
+@@ -664,10 +671,15 @@ def process_wrapfuncs(port):
+ 
+ def main(argv):
+     """Read in function definitions, write out files based on templates."""
++    global target_arch
+     funcs = []
+     sources = []
+ 
+     for arg in argv:
++        if arg.startswith('--target='):
++            # A GNU triplet such as aarch64-poky-linux, only the cpu part is used
++            target_arch = arg[len('--target='):].split('-')[0]
++            continue
+         if '=' not in arg:
+             print("Invalid argument '%s', must be of the form name=value" % arg)
+             exit(1)
+@@ -697,6 +709,7 @@ def main(argv):
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
index ba946ef9c9..4d37bf7942 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -33,9 +33,9 @@ PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback --enable-ep
 # Compile for the local machine arch...
 do_compile () {
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath --target=${TARGET_SYS}
 	else
-	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath
+	  ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --without-rpath --target=${TARGET_SYS}
 	fi
 	oe_runmake ${MAKEOPTS}
 }
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

