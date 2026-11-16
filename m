Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23495.1794818940244309978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 00:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jjyIm0P+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5780073afa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7flXY2176484
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xKXlbkK8OYpxB2lf2+1t9bfpfQnLTJT2Lw2OwDqEMZs=; b=
	jjyIm0P+orqG0FkZVs5iTPeieFUjTinhRKcOodx+vjnKg+016lxr9IY7AMbWmU2l
	O5kdaMkoH37FS6xvGcHZQExuzDLeswuDgepr454oVKtNdVt4CidQDePyg/35etV8
	EGkliUWj0KTs6l58S1avIcCN+IY4hHuEHENKwc1Zwe/GUKkDA3IwSJWHVrTTPZAj
	VrqZPoH+ZmLbJGovGosfpxLQtQ6dVuh+X4aIyXBfKj0KMEZccrddHK/cuyGzvguP
	NE8ffCChgIR2cF5dWVA0cm9E5prXJVAg2kMXThHzRKBYfvEsMbUl15gk8tL/02Zq
	iPF0diP0TOxYaANXAPqpDA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021110.outbound.protection.outlook.com [40.93.194.110])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxgy7jb5n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:48:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJIOrOollTkMy0t6kiZARnuhm1J7VuHPBbnjPAszti19q0gnE3A3t7dtElKfxQHA2Q0WL24avTjasRFQlomLk2M3TsRxhgQNtje0+FTLsGZq9OtErdkRDnS1W0D0fEyRe/xEaBouur7+v0rS7RrzWAX5DvTAZ0CharJ/1pbr8gJbljPlGdEVwrMVdpwPdkIzsQY0spibZda3fpaTmtIHi0HRNGm8/XmiW03OdzdtrS3YhYbESNmS5ZxGHuKvdQluuN01m6HqqqLI/+HPk6xXllM7kqzmGGv0ztyeC7B2uAaboVWurkqG2bwSFxrQbxxWIPieXSGOBw02EeIkKjbbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKXlbkK8OYpxB2lf2+1t9bfpfQnLTJT2Lw2OwDqEMZs=;
 b=VkRovVWv/RP69CS7u7mtQU4238X2NgmYoFCXq7OdiKaMx91QF/f1XPLPxCG+owyVmMJSFJTRnpyk7hyhtyEzE69ufV9qTPFZGh5cwKudvT2WwmhHgEgWA/6sTSfFy1gxbs+d9uod8pwMDuJ1P1kBKisOSI53byELL2zjxUxuUFZdmHFK2ZUa7XZe2iyURWQwCvUwlG2Abbqn9bKGml82XimwXzql8YMBveUvzfBRvhfiaEdjJGvZPIy++laYTGNISQh8DcwXktVbRF1d2sAJ2dTGNc6ulg/cTcsoow9uLsi6gQ2FDmLozT/hQaor0sZ/L94WsZPke3pathMPMm36pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by DS6PR11MB622039.namprd11.prod.outlook.com
 (2603:10b6:8:52b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:48:57 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:48:57 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [wrynose][PATCH 4/4] oeqa/sdk/cases/rust.py: Expand test to verify cargo build builds for target
Date: Mon, 16 Nov 2026 00:48:35 -0800
Message-ID: <20261116084836.2336870-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261116084836.2336870-1-Harish.Sadineni@windriver.com>
References: <20261116084836.2336870-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|DS6PR11MB622039:EE_
X-MS-Office365-Filtering-Correlation-Id: 2992291b-6dab-4bb2-ad21-08df43be73fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|10067099003|261102123227099003|261021123027099003|261021121427099003|261022075727099003|38350700014;
X-Microsoft-Antispam-Message-Info: lod42ODRCQy30m5L1RQbmZ4h0T0E2LpqxbmQAGCJ5+aMlivCAtY+V0xpRp4bjkgNbhgi+AKRRwGCRjKx5NjLm1cYA3r/D9SRIxQevroP7cKtlOlq+lFGmz57/nDrZvA7jV2qsWSzYSzqTSNvaDdwplhb7HZx+8ELYwhVjUB9IVq8X9Xp0nCf93zZkjZdvKhtxXSPBHJaU6S7yopgAT6s5rPaK1siQj65H2zx//j3Ptcprg66KYulVEf+JeeS5NMkjnwJPCXgL3xPnsFk9YlLtF7j0U6uDv4vukh5+DfopbH0D04/7drVGSN6R2YxCDO5LXUsnpj5PTqdIjskuUgRP90f6Tw0/HrkL104Gav8KWHFF1MviqQu1GN4aMYHbUvYJELXRKQ4cm2hUYO1pDz9oc0QQjrErX8yzaul7C3JNOjurVJAxp3zmHfnRH0vehVNQvW/rvmgWNeSKOQmM0N+LfRMGMY+PT5AO+0qu/qS1HTFHwSt0n9XhnVGjfa46dnTL3WsFItUAnqkIzcsH+x4prS9S4TMz4860twY8XjLHQLKrRR1gj7jHdjh8vHttlM060Ue0fAw74E76dh6iSCJfQ/rtmi/EcxbS5ea+Eop8/hcjVq+wyPyFQXP5QkxtBdx2EvxJFlBy4/+qigUcHxeFTOFaIdHwV5rdmHqhRuktms1BwouDXxdiadrGDlpd6prpuHMUy0poQZe9rxdWSV1n9p7UOAbOdWkI8WosyY37KM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(10067099003)(261102123227099003)(261021123027099003)(261021121427099003)(261022075727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fS5jnQ+IcjcBlMQBGmqwN2R/Cxz1gsxcCvSJTrfvY7rqfK/RGJVNIikvtYNQ?=
 =?us-ascii?Q?nwPhPfmKQRM2iTQKYj4qOIy/ZLX8S5lojCF+puFODxPCp3u8sc82yJE3wgYC?=
 =?us-ascii?Q?b5nPfYyxeN7p0d00+0wTnV+0d0zdTcZ3TIyh53te+bteKZwJldYFAQ/MLgkw?=
 =?us-ascii?Q?UeW42F1pw+OeVx7stYOrlEf4gSA9ocBR7JT4aXMCp+umcziOwxERgMBtQ2hq?=
 =?us-ascii?Q?OZppTLaPgzRVNCmCCJrErQz8S1o7pzYd0mfxNYT+wEJ/lszHpCtLMh8sW3Dk?=
 =?us-ascii?Q?os1dmiL2aNr/wtlzraf8Zt5+FzbeXBwvVEMIDefe/u8gAoGTTM2CvJSiS6Me?=
 =?us-ascii?Q?9IuhNtikN4+l20zhdTSfqHb8L2ePyMMlIfVgj1nV8lf+Ce7P2IYZ2po/yPqI?=
 =?us-ascii?Q?tatpeLU1USaWvRK42uZeQc9Si5ijHjmMYJKGqAu4APeH9zrEs51Zxnfmd+p4?=
 =?us-ascii?Q?BhipZpKas3ZyUzWYAZ4zC3g8El29p2e5FQOm/foIEu96+bQ+7qGQ688FMgPv?=
 =?us-ascii?Q?0x3lQDrVVDiq+3LLx9lGhgjr48SZHiEAtV85dCXeBvuXsks6CqT75F2qmnZv?=
 =?us-ascii?Q?BtT0Q2QOHNqwGoXAwsJCwx/TINdGr3k8/Kryy4QFgasCuD7Ij78IvLIUE3Eu?=
 =?us-ascii?Q?TIYb7Y97kXlIhMaZulbd5WLat+Nfbr3bn1NrGJPMLPnVF+uC+TK0Rv96Wbkp?=
 =?us-ascii?Q?HHKpuHxrR0eJGEvXhDqtXse5n4pAehR1lxRanPShQULVWN45mIPWglwtp/io?=
 =?us-ascii?Q?DIQjach5Xb59uYtpDum3ruPmNgvdxQYSbN6aQkyBz4Wi53jTOBVHFPtdZD+f?=
 =?us-ascii?Q?YkxhmXYveC8+PS1VRWlGmYP0KkN6iQJLCd7ziKtKwN+3LR6nJy4TbRHcEdHU?=
 =?us-ascii?Q?ztGt3tCEAQd9MFBLHH/UHubwFfLam+DyVYd/19zfAXoEYKHlfB6IEVsusO9v?=
 =?us-ascii?Q?LErXlS9fOvmb8fuEjpY9LlIoQuUd5AHHNNcUr3UIAc8BpJonpLAkdPxRoNpL?=
 =?us-ascii?Q?kfvCYznqEgjVCUgrgn+h4UJR1WhR0E1pxz4BbZnnoYoAJEPDJNoz/d4e8Zhk?=
 =?us-ascii?Q?Gv8ECCkSuVq+D1w9cQwQzjdIu9acWuh8mOgT3FARtehDqaO2q+BFs/u6101d?=
 =?us-ascii?Q?nSOs+XLJrKwZ7Iqr0WvSTMbI0qRYLN9R0j16lZMJffuMcumUps+jRa0kWKUa?=
 =?us-ascii?Q?LhmJgDjfp+p6oTguR68MVIUQyyWGzqAeoWWnPb9GhHZ3U6X5+HECrl6h//Lg?=
 =?us-ascii?Q?sdKLJM809XsumZk0TvnU6v+HMDf1Lxue4bJrt8NMfyX9KIeAkU6IpZxuTw1W?=
 =?us-ascii?Q?5tl+9skT8cwLKN9qwG8cY503xXd7XlphlCZFLKhuCliTWd1Yn9Ys3rQckcH8?=
 =?us-ascii?Q?jXeY+Pb9RUfQTIsV0bc9fCyj4C1gSjjzkMmpjW8y4rLZ2BGKUsI9s4kMDju5?=
 =?us-ascii?Q?UNg9fv0k6sZ/gZarn7Y4tdm4wW60LHoqhlyR/+m3ScbwiIqPplTnWo3/KARN?=
 =?us-ascii?Q?hPkmyBLPcbMnNf0joONvGBNXKogpzrQykzzvx88bGnjIPNRW0JaPgLT6lhVe?=
 =?us-ascii?Q?QD997V9lTbjdnutoqb6Xn0C/3AmmgjzVcVbSKyxV6aBD2+0PjFpOrZwqWa7C?=
 =?us-ascii?Q?8c2LYlqsRRS+btiOMCP4bsiqrxCYr6kUdpbsLx3VJQip/jTLaOjv9OLEzf1+?=
 =?us-ascii?Q?CInEl1sKHX8YpVNOYtsFpp9cNAd9dwAEcaJ0F7DvHeh68JeNbSKlreQ4yZ5+?=
 =?us-ascii?Q?rvWPONX6gvUX9B/Sx9VcSrNA+PNVcnE=3D?=
X-Exchange-RoutingPolicyChecked: ZVuCn8SfcDhuYGMIrPRHJZcaRkvro2DccWX6uaFkfFjtJ15d2TTOLhgz0TvCmo2iatcZa45RLFGqledtIpuDRziDkxCDF2yU6ShCe6HjpVj+kCu/a9j4mgg3WYjC7J2EEqNTtdrSn1JEdGSpj1FpUbzjq2rJjplzraa3x0aytLijLKuisPE0O/7LHF/E6+o2oMvxwdmm6Uwjf20bLXekRNiBlvyCGTXz5kUL/V5fSaIqBjjqv++aM+YxujpOnMkQM1GMFkSLV1w+2osPpi65N9535COCF31wHIyHbPg+47A+PC6D64BSc9dHef4oo1Gl9yfvGJFT4Hk6as+36BM7dw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2992291b-6dab-4bb2-ad21-08df43be73fb
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:48:57.9073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A23gOaEIvHkG8pik26zW4mOc5AA+2HhxDgRRnmChf0Xta9PvVsK1AnIIy3a/z9qz9b14yz9K6wGyEYbKfSd1jM0BTt99JMZt+JK5BiCcovk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB622039
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX+Tfr4rS43s8r
 RRsH+Oqqukntugs6k4v1XD1EUx3sbPKIpGOoxfeAX/hvWxOveOrNdZQFbo5D5M7XC6Joqe/KU5F
 OLpeB28eWMh6xjGhXHyg8NmcsMDD4PY2d6AoOSe7eotw7LgjYV0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX+aVhO5h1XeSa
 FED1gvxLomCncFmL/q/ASIeqjS895AGGjnT6O+j6AbVJt8MDYyYoEIfKXvrP2UOe6jsOIMUOCrF
 SHkGYijsCMekhG3MTsUgCYmpWpfAZIZHhnSabjNXAg8goe+Tg+yaNo1nF/8qyrfghiYDEvqnYu/
 Zc9uj7ReJ+0zTLBlzZMALd/5pmd5lg7ARAv1O/S5XXCv67PT+284TZiUnL0MhNCEK4sLFf6GU44
 vn5GPsQE+yeGE5PgIh9AE2CinsTvLLe4Jzc1j8rq+U0UrOoKzSjBnUYo8F9q0wFC09R+ntHMARL
 YlQwHNeY4cYNrB4o/TFLtumeO3g+fpGsLm+cqyV6DA5hAdHdNqx6cD+GV89GtBPdLfATsqKp0ZL
 0GXNwucI+6b+HFl9/9n8+wAl9Gl1BvFkSetgat/UwTcaNUywaoD+1wg79cMNSPx/EzN0Yk3QD1n
 3dpX05t7mfLKNc8W0Jg==
X-Proofpoint-ORIG-GUID: HZcjxHJrThCJI9J68VcVfOzwfkbrTboe
X-Authority-Analysis: v=2.4 cv=c9g+0h9l c=1 sm=1 tr=0 ts=6afac37b cx=c_pps
 a=is1TPszdXRKtgCc8Qn4wPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=vbqt8YWObaADYMrP3jIA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: HZcjxHJrThCJI9J68VcVfOzwfkbrTboe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250323
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes [YOCTO #15061]

Ensure that cargo build successfully builds the binary for the target by default.
This test validates whether the default build process produces the expected output
for the specified target.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 482cc0ad714e60adf670b07fdd5bd8b0255ab1f3)
---
 meta/lib/oeqa/sdk/cases/rust.py | 37 ++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index 4b115bebf5..b4a8a1b671 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -7,6 +7,10 @@
 import os
 import shutil
 import unittest
+import json
+import subprocess
+import re
+
 
 from oeqa.sdk.case import OESDKTestCase
 
@@ -32,8 +36,39 @@ class RustCompileTest(OESDKTestCase):
 
     def test_cargo_build(self):
         self._run('cd %s/hello; cargo add zstd' % (self.tc.sdk_dir))
-        self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
+        result_env = self._run("echo $CARGO_BUILD_TARGET")
+        rust_target_sys = result_env.strip()
+        result = self._run(
+            "cd %s/hello; cargo build --message-format=json-render-diagnostics"
+            % self.tc.sdk_dir
+        )
+
+        executable_path = None
+        for line in result.splitlines():
+            try:
+                msg = json.loads(line)
+            except json.JSONDecodeError:
+                continue
+
+            # Cargo emits multiple JSON messages; we want the executable
+            if isinstance(msg, dict) and msg.get("executable"):
+                executable_path = msg["executable"]
+
+        parts = executable_path.split(os.sep)
+        target_index = parts.index("target")
+        path_component = parts[target_index + 1]
+        if path_component in ("debug", "release"):
+            file_output = subprocess.check_output(["file", executable_path]).decode().strip()
+            match = re.search(r"/sysroots/([^/]+)/lib/", file_output)
+            target_triple = match.group(1) if match else None
+        else:
+            target_triple = path_component
 
+        self.assertTrue(
+            rust_target_sys == target_triple,
+            f"Cargo built natively for the nativesdk host instead of '{rust_target_sys}.\n"
+            f"Cargo build needs to build for target by default not nativesdk_host"
+        )
 class RustHostCompileTest(OESDKTestCase):
     td_vars = ['MACHINE', 'SDK_SYS']
 
-- 
2.51.0

