Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14350.1794291393425707471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 22:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NLHzxYxY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5774fcad27=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4sbZL3687919
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 06:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=qbWoqp7bIxCf8+GEcLjI8PnKB5Adz7i9CiqYpv06zRY=; b=
	NLHzxYxYHe118Q2FAEL0eLP4EeaL9mBZaRM1OiyYiOJmdt3vOjFJpNiT9KZDgYeT
	UItJLtsXS06d4e0ihln25u/ZBFhQZGFvomybgPRsG6YfC93wGoC6TvFkBrYsJNBM
	fpe+nDhzy2YpKTVuLlrbLN7quMR5hH96SFJ8ru2wWa4g2xKRz1aCoMFx3Hb9emsG
	45P/o457wYXe5L/Kw+4YOiejmnGFKJ54u62OFqDsDAjoaxhWJNWYqw1TT3hK94+r
	qSDZEguzeh221KgNUOoXrOUBMs3byuLKK8WzWLq+df5lIcE5+7hXL2e7NmiBBeF7
	jK/zm3yK/ZbYumJdbSTgvw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020087.outbound.protection.outlook.com [52.101.85.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hss70nnnt-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 06:16:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENJ18UjB4HizZCsw0NMa2ZlZOyQQAXVNNEjcWuZcbhts4dmQSnz9uEeSCKku44cSez5oMCBnZRYW0+1M6CcMljWiMZXDlmuWSif+1XCBd7XKJd+FR8x0lSxauDSnQKwJ+FJw1gFNphahNyHednnNKgLhWFtlyX6F/zOSLJJUwasyx6PJ9TVj4pwRe7jmyY0i0U0xwc3JEiDeu44BZChAxLaEHdbevguxnxGpssQpUcgEnjyudUTfhUKqiRJoIIqMqkZCduA2yZ2ayRNeuNU+KfXZfBtLxctCXfVcJq3gio4djD3llqEhzGxKojVJtZR6c6yCq4YMDlSxkbh3YgUMIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbWoqp7bIxCf8+GEcLjI8PnKB5Adz7i9CiqYpv06zRY=;
 b=ofO9cFNT+WPfwHRGUogttSqsTRnCG4rSNFRoKxHFNrs2KCydwqKb4jeRG5RfcEoGsnfWA5u/bVX9zm/AKvq3l2kuILTRyzW6GIazF7lK6EmOcg8WZd79N/ryLctB9mJzJmRG7tFCTsf6qY+m9F9eSKSEVroSE+hptxK99iV+uy65g5AUk0vs/9mqOGvNpPp6SmtgDWCBMsK3WIyoqNNIzI4r2NaqiweKeyY7Yl2gJflyaZRhbj9Bu+aFn3nBKk1ZNybweRxutwuB/0/7VIxvEimRxN1Mn3beg1sktsiO/3G4+tLEDl2HrgWo/o3wmeFIWC++X5zXdxNuX2uUXxn4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA4PR11MB9060.namprd11.prod.outlook.com (2603:10b6:208:56d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 06:16:29 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0592.007; Tue, 10 Nov 2026
 06:16:29 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, sunilkumar.dora@windriver.com,
        raj.khem@gmail.com
Subject: [PATCH 3/3] oeqa/selftest/clang: Re-enable tests that only needed the target python
Date: Mon,  9 Nov 2026 22:16:08 -0800
Message-ID: <20261110061608.4043909-4-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261110061608.4043909-1-sunilkumar.dora@windriver.com>
References: <20261110061608.4043909-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA4PR11MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 174fa5cc-f2be-45d0-5181-08df3ef22862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|261009221227099003|261009223027099003|10067099003|3023799007|261028144727099003|261022105027099003|261102123227099003|261026121527099003|261026140227099003|261022115727099003|261021123027099003|261021121427099003|261022075727099003|38350700014|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: g1DsKHqnEkQkTqkrQGNno80w6jM/2HLdIMHHbWPFBl0Zo3A+PJkcUBn/WcEesQHQJGXzNvLOvNh4zUuqAbByGAVENS1VOd0MjljYvRWPEy2ljQF2traibmCfs5w96xWHIlAMhMUk6UlX7n2AzCE+thQYokPQ9QFCo424IoRO1Ur8PqZHtq5CGJigUt9wNFX4FXH21Hli8/UPt1E++Y3FhwoompIpcb3eiRrzQboBiI4FgzqFohQP7L9VEvy1o5nwWy3//zI2Gfr9UOZJa9LLqghbFpV2qmKUZXv9p13JVVnOV6pkS3j6rXLjVJN2aN2NBestk+igf51WEt0U/C6Etbgl/NkA1dGbWv7dd1Fhcv2P2npX2jtl1d+naR16gpsMFZd7DA9wmR4cFVsfAJvm/7U5D2dx3vfsUchvtIbSQZ6YVB+aO5szR4TDOAkhOjTcRDy4z7XAUAoS5jPbjNEjXBDMjH58pBmhPkBCOc2FJJyrKinQRytZhsf6AlFSmAQ2nTfFZD+bS80wxTcfjVwhg08oEDpupY52cbJM9C+bNcPpRj5cGoCC1RNfDvQz3NnVGZw8zbVjTsZs0UhpKPJJ+eTHXOoubwYB25msGcE9/sUwpIhHfeM6RZEdqjC/3HSKl0wDlwYQyxtQA/ZMMapHux1XKMl+RZnXe3AeioiNY0ZRLpiJpCw8PC0HppDP2IiUg4FMc7aP8qXoAVCbHnjagCHuUPTY6CnIV7zwbnA+VLs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(261009221227099003)(261009223027099003)(10067099003)(3023799007)(261028144727099003)(261022105027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022115727099003)(261021123027099003)(261021121427099003)(261022075727099003)(38350700014)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iwS6XvgTkJUaAqwMKNp9rMibuu56HAN1NqqWruwGaHl+2WmQQwNcoIxG97Fu?=
 =?us-ascii?Q?BcS+MSmM9fNGYTgdM+3sHGYZjXqwcoMTEyTOlLanzQd3WSJXcmVDRTdBiJXm?=
 =?us-ascii?Q?0iu0yQ/gsd03TqeJ033cid58MTPKYeA+DQBqMsK96jYaFfr8oLP4W4kNJqT+?=
 =?us-ascii?Q?HBf9xwRhzCSN2tgQLtZWARRvbvHVD2usKM7xWZY/sxy5kYDCA5IKTDTFvRWd?=
 =?us-ascii?Q?dnB6B2FrOdtxTCYuFjXAwlwgZA6exyCdgNDjs/zo8ZvfHCUp+szeKWDuUb7B?=
 =?us-ascii?Q?ek1rtv5fabvD7EQiQ6Z7npgMphSVESx0aLgLZIxnw+5voFRmAXqAuuew2hNE?=
 =?us-ascii?Q?BPYvij4M41qR8ccuB09GPNKLmX56VqsuttzJmDnqxqQdEAMu5E+Z0nr3Jxb4?=
 =?us-ascii?Q?/srwZebL2VdT/7wyxg1WGZBfXu3h/JYV6ly8MMhgwCj0pR9RGccvLqXLP7sH?=
 =?us-ascii?Q?tx3lTM9UIwUiL23o2wYhJPttWWwCMeQnFSH2ghBwx9wdBYGp60xyS2Cp/QBD?=
 =?us-ascii?Q?+t36iQjP8e14Aj8GAAxTn4Kw0yhAQkma5z47P8NIKl0zONXoq5A0JyAwmpIW?=
 =?us-ascii?Q?Oz99lErCwhPOO1ppCIhKcuIOaPjaM7wCsC6l1RoUTJKcSgYRKAQZH5I9DuS7?=
 =?us-ascii?Q?K0wb3/3KgobaS4e4AZCDg79GJfNbNP4tGbCy3ZGH1uf7JTpi1uLjS50n1JaV?=
 =?us-ascii?Q?kRR0AytNO/rVeXnyHRGmOnkicdP+H5veV6o+M4BCTjQD3xnXoG7FlIECB1gR?=
 =?us-ascii?Q?LcLN81pIQl9nwj3cVUc+GOk1M0dr3BBoqoPq2Ldq4qy+JFHuBZQnsLM5keg9?=
 =?us-ascii?Q?pdnOqIGX7cDCVCufgde746uSliY2i5fFyVr0sbaKdGAKIhga1ZvQyUsoZ4nL?=
 =?us-ascii?Q?xeMlisJ5ZkTO7RF6NW2B48Vyl8kUbM5SvTX1IWrtR2ff6gJC9Ll8dRe1N0qX?=
 =?us-ascii?Q?3iHEyCve1N5H4ySdyq1Eb+lUXYbLDfD+nRiEvHlfn0arG+Em27C04zNtrTzh?=
 =?us-ascii?Q?e1Dw2CCLwH/clNiNRV+FEI3BE8JONkdjXhvA7IrxJJByUdPJavQFiMza28YW?=
 =?us-ascii?Q?cSGQflDU6xhzECxMcyYV5a3Ih/yKC7H8ij8kaNBO8GwOlTOV2XGlcYKACkad?=
 =?us-ascii?Q?Eh3fY5JeG4n5iwA+mo5EXZqcukgmQhVm3xj3kkE9Qp2U3DgCACkXAIs3sLhq?=
 =?us-ascii?Q?7iSQNiGIwnbZQBEIOzyKO1cEdc4wNpKZgWNSsFZKS/VfhUN2SDQOrSvh2S7F?=
 =?us-ascii?Q?tjz2ODa/NmyHzmYyU7kFg9kZ6OSw+B2xSCfs7AIKE53IKlYC4ygkddjdHkTP?=
 =?us-ascii?Q?KA36dqyhINcrrvp9/nT9148Ld23KtEMcDSsVjlbXYNSAKQr4Oro2rzGjePRu?=
 =?us-ascii?Q?vCFVzvgDE+Yj3mZTMAo5BoiqpIUyy7dL71sEgdgiustaHlbCBwFhW36WrEcL?=
 =?us-ascii?Q?LARztvkVJIvGY4T4fN8IzVKAzhhNb6vlemwjG9oEBC94oLKbL7x7BfQ6qGA7?=
 =?us-ascii?Q?Yy/JoPmrs/m1TLKLsfOAlPQW4gIbdO4u1BVlcruz9ehV0POIqCINrXcESDiT?=
 =?us-ascii?Q?eBvKGm9nS0qj5Qql8TZDADbsGtJ+C9kx+U92PaHFOwpstocS3dfV37a1Q1en?=
 =?us-ascii?Q?zH1s/FxRTAcFwV8Dn9ND0XmaDzZnPENWiA+Hm43Y/hRqkMljeq3vplzMgIBt?=
 =?us-ascii?Q?sHBHdzneCpyx34ELKQYt/v+Pj5BP3z1pSgt0tUhbW/aKgtKmazdthUWS9oQR?=
 =?us-ascii?Q?gZJM53zur1o7TBgDiVW9CQt9wdj+iEI=3D?=
X-Exchange-RoutingPolicyChecked: ecvTWnmurWHhGeGGeM8Wm/sNpZPd4dqE68l7qiV3JshxLRyukMNk8IYF1DL+2lM4cXN4IB2ZyJYUIBR5fxMb05Ao2Prpo90nMOXKPd3Xo9NBNGKeveg/621E6ym6xXMFM0YE0LAvQQbb9dRDKHWO/RMtBI6Aqa14yLe3WqpfpLNnz/xzpCH/zVtZwkTMKz40REinBXzqozbXd53M+b7Ldo4XiEolvaICFsLHOR7TVQrfl0X+spprIY+a79Zh16u99GwtZg8Og8ka8SMDNAZHSmzEA4+mNPNpEzRceZl4BVhbd1Qg7aauHHpk8FI1TUuLYX9u3/7rZI2lb2GhI/JA8w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 174fa5cc-f2be-45d0-5181-08df3ef22862
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 06:16:29.2136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FhfMl4e4XycZJn7dhJGa+TMxLloBotzQ6EwLXDFqiJzfXxYJpT+0ToKmcdzKtjf/fDsSvs62H01B0+clD3oyj30xdAPe+/lSIiIAoj2/Do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9060
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=fvlJ914f c=1 sm=1 tr=0 ts=6af2b6c0 cx=c_pps
 a=R61xy7Sxgg6fOHg0EL+J9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=bs28CpRe6caqHxYVOQoA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNCBTYWx0ZWRfX6Ccwse/pOO6k
 AfZjJH9aaAMyFQ5ePd8a1HW4357+JP1KpXzPnz//I5aXV6SlxLothX+2YuYQPWDsP6kmYTQ+cRc
 yiw5O9oI/abnLnvaHgjBkFViJdNFxq3h5LWmtYFTkoTUfXhKgXXTAXif6h92O3ypdytKfviL0hy
 XG1a3rzcGphPfFihVyO6iXTkPiGuRJz2bOGMEvjATHf527r7oGCK8sdrNhmmgo8sGJz5brwd+2E
 SS2KWDi+V9SDdBaebVLXW/yPHMPnuBKuxKppaVVYdGn2mi2N4LUS14lxb5QiUDnx/DE0pFkOg4z
 jsU0mLCuoBx8hCSpW6o694ntor/ZUJZMghZ5Ea3C1imETRPKkJKmLHCfuBYwHQNyfBYRtCMMR1B
 tVIS+idIvf3c5eznQNWwHJTTt6e1cHoUHOBydbNvLvWmybYFPeeSg59ZzOCmo8cYRm0kZDtJ36e
 JJVHgjrlQ6Fdfn2Wo7A==
X-Proofpoint-ORIG-GUID: QlQGZaIPxLEoOV1qNwfEW2tnR9tlYjpn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNCBTYWx0ZWRfX1lKzVLVrFdM/
 pL/qjCLahIMQaHqmrfY8EgkYWr8kYyze/R8y96UlqPFCl/Hsm28x2PjLWVfa5YoATNf+I5Epeqv
 S1a+2M8kyjyedVruigXL6R3LHSueM9e+vnk3vtmzm4PsZ3KHhZ88
X-Proofpoint-GUID: LTkllJOJYlEsWl0v-fpjCVS_nRIkw59m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 06:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249902
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

These tests were excluded because they run python through lit
substitutions built from config.python_executable: %llvm-locstats,
%llvm-original-di-preservation and UpdateTestChecks in llvm,
%deps-to-rsp, %scan-deps-filter, %hmaptool, %check_analyzer_fixit and
exploded-graph-rewriter in clang. Now that lit uses the target python
they pass on target, 67 in llvm and 99 in clang, on qemux86-64 and
qemux86. The remaining 9 UpdateTestChecks tests are unsupported as they
need an assertions build or the AVR, Lanai or SystemZ targets.

tools/opt-viewer stays excluded, it needs python modules the image does
not have.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/lib/oeqa/selftest/cases/clang.py | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/clang.py b/meta/lib/oeqa/selftest/cases/clang.py
index 93ef781453..e636846e39 100644
--- a/meta/lib/oeqa/selftest/cases/clang.py
+++ b/meta/lib/oeqa/selftest/cases/clang.py
@@ -156,8 +156,6 @@ class LLVMSelfTestSystemEmulated(ClangFamilyBase):
         "tools/llvm-cgdata/merge-hashtree-concat\\.test$",
         "tools/llvm-cgdata/merge-hashtree-double\\.test$",
         "tools/llvm-cgdata/merge-hashtree-single\\.test$",
-        "tools/llvm-locstats/locstats\\.ll$",
-        "tools/llvm-locstats/no_scope_bytes\\.ll$",
         "tools/llvm-objcopy/DXContainer/dump-section\\.yaml$",
         "tools/llvm-objcopy/DXContainer/dump-section-priv\\.yaml$",
         "tools/llvm-objcopy/ELF/basic-binary-copy\\.test$",
@@ -175,12 +173,9 @@ class LLVMSelfTestSystemEmulated(ClangFamilyBase):
         "tools/llvm-objcopy/ELF/strip-sections-only-section\\.test$",
         "tools/llvm-objcopy/ELF/strip-sections\\.test$",
         "tools/llvm-objcopy/ELF/update-section\\.test$",
-        "tools/llvm-original-di-preservation/acceptance-test\\.test$",
-        "tools/llvm-original-di-preservation/basic\\.test$",
         "tools/llvm-reduce/temporary-files-as-bitcode-split\\.ll$",
         "tools/not/disable-symbolization\\.test$",
         "tools/opt-viewer/.*",
-        "tools/UpdateTestChecks/.*",
         "tools/yaml2obj/ELF/custom-fill\\.yaml$",
         "tools/yaml2obj/ELF/header-elfdatanone\\.yaml$",
         "tools/yaml2obj/ELF/header-sh-fields\\.yaml$",
@@ -239,8 +234,6 @@ class ClangSelfTestSystemEmulated(ClangFamilyBase):
         "AST/ByteCode/records\\.cpp$",
         "AST/ByteCode/spaceship\\.cpp$",
         "AST/ByteCode/unions\\.cpp$",
-        "Analysis/dead-stores\\.c$",
-        "Analysis/exploded-graph-rewriter/.*",
         "Analysis/scan-build/cxx-name\\.test$",
         "Analysis/scan-build/deduplication\\.test$",
         "Analysis/scan-build/exclude_directories\\.test$",
@@ -250,19 +243,9 @@ class ClangSelfTestSystemEmulated(ClangFamilyBase):
         "Analysis/scan-build/plist_output\\.test$",
         "Analysis/scan-build/rebuild_index/rebuild_index\\.test$",
         "Analysis/scan-build/silence-core-checkers\\.test$",
-        "Analysis/virtualcall-fixits\\.cpp$",
         "C/C23/n3018\\.c$",
         "ClangScanDeps/build-session-validation-outdated-module\\.c$",
         "ClangScanDeps/build-session-validation-relocated-modules\\.c$",
-        "ClangScanDeps/diagnostics\\.c$",
-        "ClangScanDeps/module.*",
-        "ClangScanDeps/multiple-commands\\.c$",
-        "ClangScanDeps/optimize-vfs-edgecases\\.m$",
-        "ClangScanDeps/optimize-vfs-pch\\.m$",
-        "ClangScanDeps/prebuilt-modules-in-stable-dirs\\.c$",
-        "ClangScanDeps/tu-buffer\\.c$",
-        "ClangScanDeps/visible-modules\\.c$",
-        "ClangScanDeps/Wsystem-headers-in-module\\.c$",
         "CodeGen/builtins\\.c$",
         "CodeGen/compound-literal\\.c$",
         "CodeGenCUDA/device-const-var-linkage\\.cu$",
@@ -275,15 +258,7 @@ class ClangSelfTestSystemEmulated(ClangFamilyBase):
         "Frontend/rewrite-includes-bom\\.c$",
         "Interpreter/cxx20-modules\\.cppm$",
         "Modules/crash-vfs-umbrella-frameworks\\.m$",
-        "Modules/double-quotes\\.m$",
-        "Modules/framework-public-includes-private\\.m$",
-        "Modules/implicit-module-header-maps\\.cpp$",
         "Preprocessor/embed_constexpr\\.c$",
-        "Preprocessor/header-search-crash\\.c$",
-        "Preprocessor/headermap-rel\\.c$",
-        "Preprocessor/headermap-rel2\\.c$",
-        "Preprocessor/include-header-missing-in-framework-with-headermap\\.c$",
-        "Preprocessor/search-path-usage\\.m$",
         "PCH/cxx20-template-args\\.cpp$",
         "Sema/arithmetic-fence-builtin\\.c$",
         "Sema/atomic-expr\\.c$",
-- 
2.49.0

