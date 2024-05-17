Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D13C25B77
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 01:20:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30549.1715908820212418060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 18:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58671a1b33=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H1EBGD027630
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 01:20:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn55wm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 01:20:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fv+iz6vIucSB7d1t26Itkz+XLQEiJr0CPqnpZWIQoTJamyb0WTILPLJIEcVzavH/ul3F2vr2sfepLfh+bbzz7QQiyUHMW5WphmsLAeb7+w6oEdrlsEOKFez1hsMJciFUGuALbp6IbnHecI6o6IW3jnFDZC9OKrLFhwSaPRaUlwx2hKARLO/MEw+inJaPaGDgvgHREg7E0+8y3OewFA25trDRuK2qmD9/jY3Q9RnfVTKuDcuSEeM86M8+g9Rd1jEzWkFLC2edrLejwKzxduQNbyvibWfmMKvUA5506jayIDD2abnTE3UMYpobfWuwowR21gHv2/kCbDCXZszhts0w4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2yl68ZPx1kTPSoWG7Vsxhr/hAWCbO/LsegU5uGCrfM=;
 b=JPaBq046Bwqd+Ciqm/8Y/3KQvnuNtBeriZ2S3FEbStyyzgxY/vLN1dG0IVmgjsdV6vVzdGGzQojMW09/9/ywigx/mkqddVkrPZDtX7FlAh+eC7Kd5w2np2HVyYb9r3Ay5e7ltq3rF/6UcSxKElLHk/v59yxoGCHpT2olTMggVe2OZQGg+dEK/msUyBYEwnzYTsnD6/uZpCQ12Ax8fAoJHTcPaAGaRc4tar5+YASYw6QpCKO1QE69TvoTGzy4BRNIr+3zsEAaSkaXqSyQI6taPps2yRM0QI2ldOleQYj0yqHap4iO5JPNEpU0H0bXggiRHA6W6Bzi1rvxvxPyvL13KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by SA0PR11MB4528.namprd11.prod.outlook.com (2603:10b6:806:99::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 01:20:01 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658%7]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 01:20:01 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] libsdl2: upgrade 2.30.2 -> 2.30.3
Date: Fri, 17 May 2024 09:19:46 +0800
Message-Id: <20240517011947.3727744-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240517011947.3727744-1-yi.zhao@windriver.com>
References: <20240517011947.3727744-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|SA0PR11MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: 10bd217d-f49e-4b83-72be-08dc760f7928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|52116005|376005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OTWhzHpLaSDXPSU7KUh/Mo1+VCpnhf52x7buTu70MKMzonNVuNZdwZisUT1V?=
 =?us-ascii?Q?2dSbxjyD1HycRCEToWUDIdfUZbv0ztNUm4WzZTPL/QrbVLI0rLCv6bZPvHX2?=
 =?us-ascii?Q?NA1UheX0L6XsjHdbjewbVHpBx8m/QDwAVRCYg2TvNq0pn+FCXYD9KaxQCIpN?=
 =?us-ascii?Q?Eu8SVq4XFQj13aAqV3dInS7Lua/Vw4OwGnC4bg/hrmerZLJ/JWvqVI9gOpRw?=
 =?us-ascii?Q?nfJddOQDWVXOrhkQcoUJMXMREbLVFtTnJfHgetpvp3ImO7ExaD73KWxpVlcx?=
 =?us-ascii?Q?REJAyx203k2F1Ib73wVDKgk5FPKPUGn7rNh+1ZKUyWl1f8I+dWel/l605kV7?=
 =?us-ascii?Q?J3Xkzdzts/Sks5zfEiEjrvZ8dzMO+NwMZpLdmIs9iJgjkDY812MGQOwqyofk?=
 =?us-ascii?Q?ywKougvsFYSFkKR2HeYpHJDecGithYUqjVRr/TezA2wP7pyUMmbdaRjZU0TX?=
 =?us-ascii?Q?bRbou0nHaWB6EYU4aciLflzqlT985YeQ0Jr15P64IHuVN2E5fqoYAYZZy75M?=
 =?us-ascii?Q?IbyA0ATPpZwDD1rVcJ34GutcR299oyAAKBzhGXJcRj16XFePZ5zH4gX4J88W?=
 =?us-ascii?Q?OuNijarBRuM5eGrSOegKtb4b+RT0LrVgTW+412pNTxhwDWnfXucRrZQURead?=
 =?us-ascii?Q?O3hF+CAgGXxcVL3+17myEA7wqtc55qw+t0/81HmcviW99iH3XJW82KhfAaLw?=
 =?us-ascii?Q?qiWKMi+ZM+OpKb13IGe/87nKUR51tqG2AzA9eRNhO4KiP8t3D1cG1ovq2G/S?=
 =?us-ascii?Q?evlkQrXwr/oriAYPA0CdOVAHFo8t4QmIIsgtAsmW+4elEOQi+SzmjA1Ob9Kg?=
 =?us-ascii?Q?cLQZutV0XjjV6PapRxPeqDkosTXvgdPjSCnwoaf83lvmp/0En84UIqROVz5F?=
 =?us-ascii?Q?xh0NShECOL9MqvE0I5fghmvb4U1SSlbcyCMbCZYGkyN0PiYso1dviusoiTqR?=
 =?us-ascii?Q?PT6WwNbhghvVXZKpgBefNw4SLtL1q3fIZsEEcjrRsVJahrWOK1cAQLoMRo5h?=
 =?us-ascii?Q?NHvY5RhzpOXXHnP5+aFyuB6sXcFjU05Y5axIn8X4WYctxO6mpZ/TUY86+jQR?=
 =?us-ascii?Q?Jxc2jJEtRNCHYzrFV0S742C7hBd9PDTN8KGgWUt+riNs4wfyd9hFLQdIUCWa?=
 =?us-ascii?Q?B12NlS4nX45aLE082ZFur9nAv7CG2nOpIXiagihRk+RfQWHW/MRLecGPpn0l?=
 =?us-ascii?Q?TYCDj8fJT8Vs00bjXdGJoW50MXMSrKceFjyekb/mJkUnv8ccybSysKcmvbij?=
 =?us-ascii?Q?i9eCQwhGaoYUL+6kjA0xc090iAg8aOfoTkIxRGrFdw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZXq5SYPoAZpiRccfa7ei0VTilVymHlaRFkRuvooJITY5yjGpCwDAcsK7UHQb?=
 =?us-ascii?Q?vG0506qHKE2s6jSGP3WAxo1t5Q7IZlSgyVSWPFAMPG8zc+8lky2uHj+nilYL?=
 =?us-ascii?Q?nSSIMgN38PpdopKtI11jOi+3lJKxvdDQFn1Por0tW6U62gzVfDYvQbTYai+j?=
 =?us-ascii?Q?ZQUuLm+wMeXlnh3ftVQYnlKPSYwNEfYg5Ga0alNR31KzLtQOsk9Z9RHMQLAO?=
 =?us-ascii?Q?kGZcg1uMrPRJdM6wVVyCImH1L8H5NWzH0Xmq+aRL03afXF7KxAo68UpkNvkv?=
 =?us-ascii?Q?w+iUtvsHfiuzuL1qm65ZZMh6QXFxp1GbvJhCWWG733KM3fI5s/ZTwqrzKX1b?=
 =?us-ascii?Q?hRk2j0YCLwwagIsGLa8OnpkWcF5omxfNS5BFhLj4NSqoviqrbgrlshrXTdWb?=
 =?us-ascii?Q?Dy7sQj5jwe83Cbr88tT04aZu9K/GX6jShomOv81xkJZr6qEmWCYdL5baIJGO?=
 =?us-ascii?Q?lQ9arBSn5yLYIZZtqAWH7nsmADE9WnQ+gOitHCcUq9KnBOeTvCP5xDKZdYcz?=
 =?us-ascii?Q?Sk4X4XGCxkLg6m5ecvRlGQRwSKBbfNjVC6rGuQQZkGCiHvD1g3g5zXGyGHnb?=
 =?us-ascii?Q?XyzLa0S/8O8t+B/PvlNF6dj2HUg3cXKaNOM9NtBf3/dYio9RZq50Dkvezvq7?=
 =?us-ascii?Q?oBnhvs9Uf07P3Z0JbepEupLoc/979yD2E76e85uLlKdW0x+HnOMlCnvEK34B?=
 =?us-ascii?Q?/NuFnGzkmzOK26egH97NlxTN4IrRpCZxpZEYjXg1tkyyHyWJOrjYvAaKz7wF?=
 =?us-ascii?Q?OzQYbK5JmOA++ZqIvRaIAsBuAnY2ol5SRcYq2DU1qRHdPZjbtBYbd3xFTL7L?=
 =?us-ascii?Q?dWB9+nunh5ugD7rsY0eVKJUsWiy3XMoQmizcRddap6sVNqf56Sfp8SurK7cc?=
 =?us-ascii?Q?T/vJtHlE5Og5fWjFBu4ulBO96JEUWNZOtVg5rngwt9JHZUwexnVD2zzJpcg3?=
 =?us-ascii?Q?TsYaP/hRFSir0Dqt/L1pLxtkL8qZev7V81T4Yyi/GEJOFC1zvKkeRaav/3OU?=
 =?us-ascii?Q?wXKGk/cfQfYwpWwQhNZ9+U3LDFQI89eYrEwQQ2tfj4Puo1efYy5/X4DBOqFT?=
 =?us-ascii?Q?21IjOeo2YA7ZDO3YJqlf+eP8A5pqBxlxnbE4yQ/K2u0lBNpy8dXR87zVxK5n?=
 =?us-ascii?Q?iBmMjAreqPl/mcMLArvuy1Sot8bH+9SV+c1w42eO2NIdd2pkGZL5DqEjG7w7?=
 =?us-ascii?Q?4O2kb5NJUPqvDqMPQHi4DLq9VYF0kNJlk+gb/rTQ7vC40gnEooXsF+VyAz+J?=
 =?us-ascii?Q?ng1jeVaA2cj6Gj+lN0X/2AWUiprfKqogtOsXyeqTx9sLJMHV5UYJU0QdzUEO?=
 =?us-ascii?Q?BIAc+K/+TeMElSv4S8XeXG1MhMzuFDcz/kDfvhLv9aQB80qv4yagOMJxgHow?=
 =?us-ascii?Q?6H2bcWXSVdOwp4Q6OWL0MP4L0xHWYmZ1EMAvkxZ56ECkNKcIFwpCinhYuYtn?=
 =?us-ascii?Q?Mzp2ctvF6GyACo3tQ5ezAZak/rzcxdAGM64et1Y4w5qSGHyLACyco852ta41?=
 =?us-ascii?Q?cZ3wY/Ff1n9UhI4UrA6cZ2a2+qqz3qoLLBAxxcQ5Deom0KRCjAb+sPqY0lqg?=
 =?us-ascii?Q?jhZZSwY+MCRwaOWa1lLZhhJ1SEU3VYQ+21bBoyJW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bd217d-f49e-4b83-72be-08dc760f7928
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 01:20:01.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7jazJ8Hg7/fO4ZKQw3LZZWzVwbCY/eDmyY2A2qX/sI14bkhJpU4RhZxXODJpcF1wlw4w1QiO+IfPW0WMteDKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
X-Proofpoint-GUID: QY3DxLAjgsqr1F8abYvamAoRpq_0HLjR
X-Proofpoint-ORIG-GUID: QY3DxLAjgsqr1F8abYvamAoRpq_0HLjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 01:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199501

Changelog:
https://github.com/libsdl-org/SDL/releases/tag/release-2.30.3

This is a stable bugfix release, with the following changes:
 - Fixed Win+V handling (pasting from clipboard history) on Windows
 - Fixed Caps Lock and Backspace key mapping for the Colemak keyboard layout on Windows
 - Fixed mouse warp on XWayland
 - Reduced startup time when scanning for game controllers on Linux
 - Fixed building with C89 compilers
 - Fixed building with the GDK SDK on Windows

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libsdl2/{libsdl2_2.30.2.bb => libsdl2_2.30.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.2.bb => libsdl2_2.30.3.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.2.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.3.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.2.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.3.bb
index f9dacb288c..68cc2790e5 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.2.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.3.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "891d66ac8cae51361d3229e3336ebec1c407a8a2a063b61df14f5fdf3ab5ac31"
+SRC_URI[sha256sum] = "820440072f8f5b50188c1dae104f2ad25984de268785be40c41a099a510f0aec"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.25.1


