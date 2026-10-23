Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3912.1792751183236716095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=M+Fe/94S;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4756f743e6=roopa.kalmath@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NABUxw2477850
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NJRx9X2yjX8i6QZFE7ET
	kXNUju98cTZdX2Qu2I3l/00=; b=M+Fe/94Sj0dlTFkmJE8i7jIinOjaR8vdAonF
	AS12T2QiNBIPucfOQXLgnjjzs3Kk2+3e0ewIdKNQ+3jAywTPlhVmhW86Gtv81YKx
	+uFTRf33gOgrGl3nWqTybcbrV5ehPaT8gKbBG+0cB8iOUbABFF9HK6GoEV2dJ1Z7
	REhE8kJKWwfIC7czxMYtKkiRtjOOx+/kW5g/vmuj5zOmchd1xy2yFFsjlFkn+Rqg
	GWzZiJvCwIXLYucsPCu/eXGBBdNWzD6N0fh3uOAd46I9CmKW65BFnasP7S4T3TB7
	jjTJm2FBM3zM+7l4Jo7e/mppIYJ4PxwMQ1cPacmzyC4QVstuQw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023090.outbound.protection.outlook.com [40.107.201.90])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hf9h1tkvq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:26:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oquh2knV/36elrUrWZ8o9TlwwnQksnVAOCbyszxM4BA59ew8VzqKYWzbBYNwXfcyJ97bnufI1bbf4SS+4TzvZmLycnJP4d5iop88ZLGG4HI+wkBIRP4w25s3FUlxQeADnyUb23ocJ+LbCf6klYRyOCHG6lvHaBo4QrjprfqTpz73NVktjqYZ3ZrQseMkuf7BcljBllPsvQzkS3pvMSyHMwNNblK1+epOWCQUzSdiKsDp096PorsGYBzexYY4yZholT6Yk+H4eEONq4q44f2UCoBCz87djvzkAj2lzOO+t3+/31yPlB+YE9XoQWf1vT2zvwkVsUzggbCL5u8gb4KY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJRx9X2yjX8i6QZFE7ETkXNUju98cTZdX2Qu2I3l/00=;
 b=TX0Yvg2/sVqtICwiwN0ThzhGrR3QPZRKnkCWCfLKsrn5urZw4rChqi1uPjr/tFlLCqHM6FPbxjM/kx+ULtvTHnNmSGzL2ET2EoRRwM9DZ+VfLoPXhMgFWBfZlwTqvkmkDTLoZzU6ltzJ9MeJiVrFSxaFBkZ1IdlYbl/YXWUDbGCKQ66N6ROjLjKmm2Zems+SfZ309edfS9ztqWxdsMBZxBaVnQQqAienVdcWE/sZu+ZZ7yuFHBdiRvNz7k4YLu3ftWRODzG+ohmNjNCy9gIcAO1iwvcQGlExgVpAs8bjZhdFyCkgHDJipW4NqYI/GGgrIape20HLJoLUyfq1uwT/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24) by PH7PR11MB8455.namprd11.prod.outlook.com
 (2603:10b6:510:30d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 10:26:17 +0000
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb]) by SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb%5]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 10:26:16 +0000
From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] rsync: upgrade 3.4.1 -> 3.4.2
Date: Fri, 23 Oct 2026 15:55:54 +0530
Message-ID: <20261023102555.920503-1-Roopa.Kalmath@windriver.com>
X-Mailer: git-send-email 2.49.1
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0110.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::10) To SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB796993:EE_|PH7PR11MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d36aed5-0f7c-48bd-bda9-08df30f01243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|376014|1800799024|23010399003|38350700014|11063799006|56012099006|260925022911599003|261021123027099003|261021121427099003|260925021311599003|260925021911599003|261009223027099003|10067099003|12006099003|18002099003|6133799003|3023799007|261022105027099003;
X-Microsoft-Antispam-Message-Info: kZCb0JNF54SffLTV9pRfciv2kU9Y1zpMXwzrfM4Zz2Ab/lwmSuz7n+Wglduw/KhcxK6+QPdDb/mO9uOXxLoZNiUVE3WEQp34xBjkZnUfrCKPAfJshSzGtps/1pd+tbyHogwopjKtknbbYo5xhTb6Xyh3dpqmYiv/Qh34gxtC4W+N8Ihv0v/InlkFXYFr5m6GxhyJO3joWwzOIuKaY+gGQo0cCJrYog/sxwrWgK7P/djBlkAfrW/8GVswD4iSpOR19DmFnp5nV7zsbTWJNbkZi/aUBXU3jMmyJe+Y80H/sFats6OMS4BI9j4TjNxaBNB5uZIcQuHlNngXIkcgDMa5vNDvHoIiVFCcDQBTpASKD8UIPVmweXXFYXb4vvXj3btUbj29110atFiZKXpIyzySZVU9e8Zrsl5wq4jkvK4lThF+dyFNkKsZnPcK8I1JWFJYw8+HoV21Cn4kgCCET85Oi3mxnspz/UeP2NOL06kVN+3+cpiNV1FlSIz5zsJSzc/Pvw/ZKEvllnlkJXvuyAaghR+xWqFHG0JRj8NdLaZBHgVHitZfpRitEmiZ5KDUf6/QLKt7EXxHRZqxQz7tcvjV/JubqCiITqW8aAUX20dgA8PN6tLkUB8cW6e+0I3G19LtY29NF2gMUw9N456jHt2Fu3xJNbxyuHEtldXK2T0c4FM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB796993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(23010399003)(38350700014)(11063799006)(56012099006)(260925022911599003)(261021123027099003)(261021121427099003)(260925021311599003)(260925021911599003)(261009223027099003)(10067099003)(12006099003)(18002099003)(6133799003)(3023799007)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Ae62N0kubpY+kKXisnVa77UA339I21Kl7xhDOo/LESpr6mG7x6VWvG6XMgQ?=
 =?us-ascii?Q?SlUV8oUcnljlU7r7jT9rw16MzNFTVq7zECrWJgW8rFgR11JZxyXuqX1vjjrM?=
 =?us-ascii?Q?aeopLlFoCGVr15SyDVZzkCbgtEHk2QNZqchFWVYU1ULiZu4Alwlh/55lU2ck?=
 =?us-ascii?Q?igP8jednBLlyuouViOB8ReMeVWFVvkG6+LVfch6HftZkMelpwvsznlfUh7I6?=
 =?us-ascii?Q?5dWjSk+tdHSYDcDZMefg/nZIGSQTMCH0+kkPAJR6bAiYkshUqyw4RzU2qnaQ?=
 =?us-ascii?Q?X/HJ13sidRG9eb75ZFZiQso1J7wluFYj9K1ixMzHxX/yAaAhyoBrH4/wNVNf?=
 =?us-ascii?Q?0Q/cCqcttlvJjSTG/FeOgvmaTUsKUVElmNyp2Ar2EjAlSf9DcGAEGm3yih8k?=
 =?us-ascii?Q?Gu6lUCpocPQqmQ/rac4CXToBCk0pDLp2CfB2HY4VOVMEcgWFaJH0RpBSmnKD?=
 =?us-ascii?Q?D/SKLiR/Mi2GFiunQe2zd6DbQAuQ8NjHGfUkVEB2FvFcBe4sfXdibq9cIsQo?=
 =?us-ascii?Q?sQ/WzyHWoPJiI9/jX2epFpnJIuZP1jHCg+o8eHe2PG8n/IUjY2OnE1qGTfiC?=
 =?us-ascii?Q?WKtrooiWIDEgehVwjNUf8iDBHuy5i0/Poo2up0BbYF24cKAZjj/s3AJm8fPc?=
 =?us-ascii?Q?lhr8dz3N2PxLSKPgEwTOIJ4nJmm00/Al5iNOsA4cY9zjUvhnO/76kHDSEZp5?=
 =?us-ascii?Q?CzBnHsC0GhvxF/w8MBCwFH3JvjxJ1EjMq5pj0sgo1J1VS8DYvCTb4KpJazc1?=
 =?us-ascii?Q?9WGBawQVUspVZQfNCJqmpWrfW1OKBVNicSAvEHV6UsR1maKDBTyYX7cEds/m?=
 =?us-ascii?Q?UZ6ARU59UWgJk2QvnQltu589yzFjHU018DQtoWmshvA37Nu8GLBOANFNkv/U?=
 =?us-ascii?Q?VweHt9OjCp5zs5PXuhGkLOt/mGSu+U1S7xWyBHH8c/bDwWic+PckHSGm7xX0?=
 =?us-ascii?Q?sDBX5HgS9pQcXW8y7dsrnweTJfwKOJE6QTFkS0e/2puHjwr6XhAtgXD/wRcK?=
 =?us-ascii?Q?wjNranBINfXVGwswRbwt2on4FnQP5fqcXwZyDfP/AcBi8MzGqO651tw/D60e?=
 =?us-ascii?Q?4E3p7oTZp6eSHNpFd27xsEG3OSIXNtHUvckHt2TFrnCg8dcMfQyAq014+PRX?=
 =?us-ascii?Q?tqPd+daVO0if6FYdgtxQuOXZIrxFuQJvIqNmEbYkFphI7Uuap4jX/VDzclqr?=
 =?us-ascii?Q?np/xQO7bFMhI0/yEkv+l2SxoEkOArEvdQGYf0m4tdM8a44mMVUXEGbS8bFYD?=
 =?us-ascii?Q?PaU1OaTQ4wam9/dGO4glOJr35PYug6Zki5CUDS498SGc7sr4saeUDYOtZ64u?=
 =?us-ascii?Q?IXKkOZ7zQKw53zg7afjYBhSAhusmBHZzwLJH0j+efw6kvphcilMJ6CL795hs?=
 =?us-ascii?Q?gDOLEpYXpdN/pAl4DAFbB9sMmoBy2tgg2UINvlmxJOakne/Xp8uchOiowRHe?=
 =?us-ascii?Q?ndzR6Hikz0H1etmbwo/zR/SmhSiBy4hUbSvgXXx6OWGGpplQlcY6Xvk4HX9b?=
 =?us-ascii?Q?TokzcbW0/4LL1HKLnV8+/ucqYPqYXNvpqEXwT4m3N6eW9ONOT85HK+ctX8qA?=
 =?us-ascii?Q?nAw4D5ZEODUH2heu4o1bhVbbRvxODMh2nk4POzEAxL2lG1Q0V3n3VqEp9O9v?=
 =?us-ascii?Q?hXbB2FF2l67q/oPvNfzuganSlE0r+r+42lxg2hpzUuOBCwrh9mJG4ELzTmQk?=
 =?us-ascii?Q?F4I2dbHlp3jEIFAOEeTXO+dPLAxWwJpRELAqrFJ9YHcF8n+bSBMKoOCZGqrF?=
 =?us-ascii?Q?TBGm2N1UjB43ECzRf4o8CsdmZtZPauU=3D?=
X-Exchange-RoutingPolicyChecked: kx1Ftg9KJXsof7lhn1L/uCKrLEPl3p/M0xco2SLu6N3y1YxOHncM0e8yjXBAA4roc33Fp08kjavtqUNCbkJiFftWIMWyDAm34PXbgxiKI84phmD5NDFkp46+lGB6jtzmD6MpVP7zEQbEdOfpAYgtSbPAih2ELirx4VAu8JYJTCe3Yha0jJLc5QzLeQ1hpYXK9BQyHPpseza9DJviqq3Dw130cXlk/Fd8AEuLUH5K1kLBtPzxDgPjljcOyhBgs8E+zJxgGERkNibu49tvdnRx7VbnEJCnMZ4wppr1BiLVk3yh68ef8wmdKQQdNVnXGHNs1sSzEIyZ1gk8PV/0eS9KCA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d36aed5-0f7c-48bd-bda9-08df30f01243
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB796993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:26:16.8659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TShTVLGwRrINNrLE8Lm5gKhfSnVeffwOCaR8ZUStVv/a0BIGX4WvVC1t6mR1RXaypI4fgVmg1mtn7mv+GdGoI58KviQ26EyihNZ/ScwUNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8455
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX4gCyDoXh93AE
 P3zaMJ/Bh15sOEairZp0eF0brGn9VqNnbDSfZHTM/c6SgP5NeJCqO7F2XNCA6puxQgdvZuOqxUM
 iQP84GIJ2jT4drwXjd35ce2xhyq5xzUI/9qtVQPl0A/c+AHeTbDOnxjn6kyhfTJW7zJYsfoyegJ
 jRKRYvcoU2rzOm+1l7x3qDQzz739HodRD3zyucmJEwaAICKSYv7/1V5LYI1+Ieq735clzePC8vu
 7PeSH4+TwT5ubYpzRDS8MieTDAfJwaPbOs7x0fsu0mgAeibyIvg7cI43RikquaFDS3xH2GBYTJd
 10nAdOjfCKTCbRVHAYS1MVeiqWo4ZtalPANJ7B++rxH0XmVs+uxbF4kQr3mBpmAFQFJ3w4b3hXV
 dSVlZXb6OaW9n5z97Vt0CwIOUXNoUl1edRWYkWJTXYiC0T4mQzl6B6c5MagMVZTP/fac+HQvdEH
 mF+DhwTmNt155B7m7wA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX8p/QKOPNCbLg
 KPE2jlkQFl8tARECxYdrxm83CQJ1Nu+R4Z58AQr1mMjMpmY215ksudhoS7ob24qQUouB7oR46cr
 HDECHL2avSAN1RjP6pF8QSFrTHFK+G7C9pz6wIEaHNef/QrLUohj
X-Authority-Analysis: v=2.4 cv=Ro1QvymK c=1 sm=1 tr=0 ts=6adb364d cx=c_pps
 a=1es5Iy7n+cWvltLRflzOuA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=hGzw-44bAAAA:8
 a=NEAV23lmAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=oq-7gxcSAAAA:8 a=QyXUC8HyAAAA:8 a=G2TjL6rrMn10Yt7nW7YA:9
 a=HvKuF1_PTVFglORKqfwH:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=UIhn0zqP03opOuWSx-ON:22
X-Proofpoint-GUID: 4U9S_49ksFMj-5W7kSoysyVd_PMZPZ-9
X-Proofpoint-ORIG-GUID: 4U9S_49ksFMj-5W7kSoysyVd_PMZPZ-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248504
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Drop backported CVE patch included in this release.

Parts of the prototypes patch were fixed upstream (in zlib) but some sections
were not, drop the merged sections of the patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
---
 ...-prototypes-to-function-declarations.patch | 68 +++----------------
 .../rsync/files/CVE-2025-10158.patch          | 36 ----------
 .../rsync/files/determism.patch               |  4 +-
 .../rsync/files/makefile-no-rebuild.patch     |  6 +-
 .../rsync/{rsync_3.4.1.bb => rsync_3.4.2.bb}  |  3 +-
 5 files changed, 16 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb => rsync_3.4.2.bb} (95%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 3011308c61..e6d3578e85 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 073caa67f2aa221de113a21f8105940421a2da90 Mon Sep 17 00:00:00 2001
+From 46cbe5b70b5cbf981cf693137ac081cacbbb2e2a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -17,20 +17,17 @@ Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/03
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- checksum.c   | 2 +-
- exclude.c    | 2 +-
- log.c        | 2 +-
- main.c       | 2 +-
- zlib/crc32.c | 2 +-
- zlib/trees.c | 2 +-
- zlib/zutil.c | 4 ++--
- 7 files changed, 8 insertions(+), 8 deletions(-)
+ checksum.c | 2 +-
+ exclude.c  | 2 +-
+ log.c      | 2 +-
+ main.c     | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index 66e8089..b24b202 100644
+index 24e46bf..6ae3178 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -779,7 +779,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
+@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
  #endif
  
@@ -40,7 +37,7 @@ index 66e8089..b24b202 100644
  #if defined SUPPORT_XXH3 || defined USE_OPENSSL
  	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index 87edbcf..ae0de2f 100644
+index 24de64f..a787488 100644
 --- a/exclude.c
 +++ b/exclude.c
 @@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
@@ -66,7 +63,7 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 4f070ac..f59eaec 100644
+index ccad28a..bbb09ba 100644
 --- a/main.c
 +++ b/main.c
 @@ -246,7 +246,7 @@ void read_del_stats(int f)
@@ -78,48 +75,3 @@ index 4f070ac..f59eaec 100644
  {
  	char *gname;
  	uid_t uid;
-diff --git a/zlib/crc32.c b/zlib/crc32.c
-index 05733f4..50c6c02 100644
---- a/zlib/crc32.c
-+++ b/zlib/crc32.c
-@@ -187,7 +187,7 @@ local void write_table(out, table)
- /* =========================================================================
-  * This function can be used by asm versions of crc32()
-  */
--const z_crc_t FAR * ZEXPORT get_crc_table()
-+const z_crc_t FAR * ZEXPORT get_crc_table(void)
- {
- #ifdef DYNAMIC_CRC_TABLE
-     if (crc_table_empty)
-diff --git a/zlib/trees.c b/zlib/trees.c
-index 9c66770..0d9047e 100644
---- a/zlib/trees.c
-+++ b/zlib/trees.c
-@@ -231,7 +231,7 @@ local void send_bits(s, value, length)
- /* ===========================================================================
-  * Initialize the various 'constant' tables.
-  */
--local void tr_static_init()
-+local void tr_static_init(void)
- {
- #if defined(GEN_TREES_H) || !defined(STDC)
-     static int static_init_done = 0;
-diff --git a/zlib/zutil.c b/zlib/zutil.c
-index bbba7b2..61f8dc9 100644
---- a/zlib/zutil.c
-+++ b/zlib/zutil.c
-@@ -27,12 +27,12 @@ z_const char * const z_errmsg[10] = {
- ""};
- 
- 
--const char * ZEXPORT zlibVersion()
-+const char * ZEXPORT zlibVersion(void)
- {
-     return ZLIB_VERSION;
- }
- 
--uLong ZEXPORT zlibCompileFlags()
-+uLong ZEXPORT zlibCompileFlags(void)
- {
-     uLong flags;
- 
diff --git a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
deleted file mode 100644
index 1c5661d35b..0000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c2ff1647b1d9a0b92b73af106ce133490306e886 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Aug 2025 17:26:53 +1000
-Subject: [PATCH] fixed an invalid access to files array
-
-this was found by Calum Hutton from Rapid7. It is a real bug, but
-analysis shows it can't be leverged into an exploit. Worth fixing
-though.
-
-Many thanks to Calum and Rapid7 for finding and reporting this
-
-CVE: CVE-2025-10158
-
-Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]
-
-Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
----
- sender.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sender.c b/sender.c
-index a4d46c39..b1588b70 100644
---- a/sender.c
-+++ b/sender.c
-@@ -262,6 +262,8 @@ void send_files(int f_in, int f_out)
- 
- 		if (ndx - cur_flist->ndx_start >= 0)
- 			file = cur_flist->files[ndx - cur_flist->ndx_start];
-+		else if (cur_flist->parent_ndx < 0)
-+			exit_cleanup(RERR_PROTOCOL);
- 		else
- 			file = dir_flist->files[cur_flist->parent_ndx];
- 		if (F_PATHNAME(file)) {
--- 
-2.51.2
-
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index f915d658c8..fd96b873c8 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From 41b859a9df9611b7b3f6cbe28af47118d947080f Mon Sep 17 00:00:00 2001
+From b810d78a9327b5b313ebc0aa1a0b155de7c10afd Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 1d13e8c..2c5cf99 100644
+index 80e9d72..a7d313c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 42af4c55d0..fb195b1e68 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 603e5862cca832ae925d0c92a8654a57caff5910 Mon Sep 17 00:00:00 2001
+From 0608f5ebb26e2e474867bec6c3d67dfd0a7663f0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 7c75c26..1d13e8c 100644
+index c2fe775..80e9d72 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -184,60 +184,6 @@ conf: configure.sh config.h.in
+@@ -185,60 +185,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
similarity index 95%
rename from meta/recipes-devtools/rsync/rsync_3.4.1.bb
rename to meta/recipes-devtools/rsync/rsync_3.4.2.bb
index 509be486b8..5fe1bc2c2b 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
@@ -15,9 +15,8 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
-           file://CVE-2025-10158.patch \
            "
-SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
+SRC_URI[sha256sum] = "ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-- 
2.49.1

