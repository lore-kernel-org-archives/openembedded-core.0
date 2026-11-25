Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39356.1795602930591598192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 02:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uwFa+vof;
 spf=pass (domain: est.tech, ip: 52.101.70.33, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blUIWwu64U4qKjX+OtQ3JMj3RtF6W2YE4dJRTzD/ROtmgTJX4SRiMbV/r+5QmDnoBN9f/DN+E5NzISNPwAhQT/RHlV03YtVajfRl8LRf/S+W+DREPkMXNqgNQ4BfcnSwJG/AoQhiWXKcVnRuoel02ehBiBxayNM57ZMjj8az7A0j191OyoqagXMpVMHdIh7Grvr5PtU4M6UJ65dm9VUDPnfpVOrGDgW7bHB0Ly6RTgmC6XO1mLSciPp5o/UieTaXJyqdEp9z9yIMD49zs8+RuvIPrBGSAg/NV8QpIGvKR7DRN2UBmlzHExNIYM4/8AICpOwao0tHZ7oPilEU5V8Rzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDiZy2W6/yXJpZ5lX39jazW5BYT1VPJRrZI14GZN/Ms=;
 b=aEMRpo+Y4YATowF0Tjr/W/D9cTcFiBCEwAHvZ2XHWVQzZAi/tOIlt9Bd9F58RK+lpbXl5BDPw0FYftZeKKWRmAUk2kM0fEpVM30QAOingycYzwphkOJYr5Q/7zH0hRFTror5XQQjOdfB6kGtNxm7auY17gxSplCTXdCszZOG3pCts3PELKCh6NdD0q2fpM5ikQB8851Zkj0VLUoKB+m+z1exHkw8nuODs7uC1WZsC4gCtYj2O1GM32vtpq8r33aIGSGPFfrt0VP8sO7gXHEqGhdy2cKrGjj9Sa+fo8Mf9LDuPaYEUsT8D6qBa2RMa8mYMKPvR6vqIcfEFk9jkwyAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDiZy2W6/yXJpZ5lX39jazW5BYT1VPJRrZI14GZN/Ms=;
 b=uwFa+vofh8L2UVIkNm59v+BXO2oIHwE4RAI+fSToE4F8Jrua7qPAsrHvX/3B2L9Pb1PS82jNsDmdKM+Uds+IVCnVd3eHBFqE0b5ezfYBrDjzl0Bro32pkyO5hW3kVnAlAPKqBhj2YQJAkpNEozRhsDnSwH2GKKIbm1KjSMgZVcBhzlwF3AkJ86BkCmIJ1PhFWwLsDnKW4bGSoX1pZwgeBCQeZMLDs7KZj61uN9g3Nl/e4GLrHsma8/M5GGrcEkVQ2WbZ2+dnqgLd5OYR89DP+7dROoPXnyj0s03GbhTGK3R/f+jCPgsRhPHsonWu0fu49WE1RM7l4mJFmZPZSxwWVw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:138::10)
 by DB5P189MB2551.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:489::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 10:35:26 +0000
Received: from PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7]) by PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 ([fe80::53aa:751:3d59:b6b7%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 10:35:25 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: tim.orling@konsulko.com,
	henrik.b.nilsson@est.tech,
	Anders Heimer <anders.heimer@est.tech>
Subject: [scarthgap][PATCH v2] python3-certifi: correct license to MPL-2.0
Date: Wed, 25 Nov 2026 11:35:22 +0100
Message-ID: <20261125103522.554652-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF0004682B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::333) To PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:138::10)
Return-Path: anders.heimer@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP189MB1776:EE_|DB5P189MB2551:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0b9901-9c0f-4d47-d326-08df4adfd12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|261022105027099003|261028144727099003|261026140227099003|261021135927099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: l9pRi1sroVMI+JUX9WXh530X3kNhjeypQANFiPgio4BId/eLHqWL9tyDLzjSnmgrKSi5mDJHxsK8c3wsSmZ80DjgDf5qQYr19yy8jgX6GXGcbYczUV7Kmm1dhiSbmPOAwwKi/+e2/qhsMdd0jTeYCEy8FMUO656oQpOcCggoygbaxVX903aKLKERp2h9yBnrBqVHa45uRy1Jm3XsslKifRg/wrbva90fXTIqRm9xGnSYlzc2ksKfLjWqpHB/KqBAERT6gbNf152vWNFCQKPOlsljT9H++jsZrPPnssoQdrDoJReozOUpUzU9u5S7oETI3wkM5/L7p9Qr9Je47HFNbB9v2IQWdb24BC5BgBDy+YAyK/UZ2KBP2TJes9helB5WDmY43xuEM/LqjHCt3NP2cA46GuVoSo54jzCDtEtCCypYSavzHZKoHwkzOwmwQR8O1oH/TmFCJNId+fIzZM27A/jzNWvWUKgGfsJtbksZ4k752jiOgIFq4XkfQ5un/mgUFxbrGqsv26J0zhTnWL3zZZH+ERjl8oIM6um1s+RqYUzni7zIi7JLyzPWJci1/pZA1u/AXw5MV3aOoDTsOMiEVqRAhcy4qQKuz20rDMqRBOg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP189MB1776.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(261022105027099003)(261028144727099003)(261026140227099003)(261021135927099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9/QVMZFyu9pLmLvlpQ/a+fyMh9e6tKBv2d1jOiMUq5fv8eDVr0JsluftQAyC?=
 =?us-ascii?Q?/q/fyOdJs3lqhk74cbEpS9Ae8wCM1+OoRkeqslMeUVQOUed56wWOWmEbGGEz?=
 =?us-ascii?Q?vmmfvjHzwyw4uTwuEFULfY5eV9xMLEGLESB0KzjaviZfR3bsScx3RMw+dAQh?=
 =?us-ascii?Q?NleN3xhJHXj5sZsKmBRcY3QXl8wkQO3UhCuDjKrqm4geGwspuMJcSvf6hzyG?=
 =?us-ascii?Q?Drk1qTdb5ELG5+bTgOSgCh0hdbjB//I8ldihDjiDQEV/TPzz8tthR+CwD7XC?=
 =?us-ascii?Q?3TMr/U0F2QGkREZTOloa5nZH31FidUNFkzAItnGPHmdvKjOJVO4H/m/1yPqH?=
 =?us-ascii?Q?a9WnsBZYoo8f1Fn7Hi7SsqUap6CjCSpA/VlCuOBe2IuA5kT68hkarHcyxUhQ?=
 =?us-ascii?Q?j0Sc8xNqJyAWT0yepk4qCETnnELppzV6qjBwFEZ3OojPjijLUan5K6mXt8Nv?=
 =?us-ascii?Q?Vus69LZZ00XEFOVAusyE1WwYNoUHKlxQxAuYjbFjG5PSx12xf7CIXk2cQBuf?=
 =?us-ascii?Q?9P6fpgTcDMK1rkxDz8NI6pErU9UAR6nFATAB3n2Fse8HmG8ZQyy38MUXJ/P3?=
 =?us-ascii?Q?oIOB43ITH0iICSp8fjveWfXd6zMZ8haDlSfAUDEq0dR8o++DqjwRv4+FyNIn?=
 =?us-ascii?Q?c34fPFhRyOxCFIYblW0Jz5D2cDsdQwSO25oOdOUU43SDuARYRs8ivv8vkkex?=
 =?us-ascii?Q?I/9ta6Of/YQMclGjkvgis+jGhf3KhPM5Lzhn8txnBZiIJcC2L/D3sS99qWio?=
 =?us-ascii?Q?VnDGr1nM5tbhuW2xc4kS0/p4d/pLT4M/mjxHBPDPyhStJjpXXsczeZDrS9uU?=
 =?us-ascii?Q?oPoDFtf3HgaruewxxlLdusfIvUqtdcLEeRTEjawJo1maG3FXyVcZ1HCIcHh4?=
 =?us-ascii?Q?nYnFwEz53/3fug5BRA50z2uDIIw0i1/72dnQJ7Q3DdmxLy1xkADQkQ0j6eN/?=
 =?us-ascii?Q?hKnzM/4j9X1kA0WBkj8Bbh8m77WZZ/FkeCAC3jR2FH3N1tVK81YLSzKQGoQW?=
 =?us-ascii?Q?gSGFbIHKmpOFSa3fWxN0YJ0ZL0Y42OuViovsIqy+tRo/w50dD4EqBejOIyro?=
 =?us-ascii?Q?CmvpqfevmkPKHZJAOtgXtS72ItyxyiwJ8TZkp1JG/WEdQpDHmjl/t2NNRqPI?=
 =?us-ascii?Q?Kyq7NNn+66/a42H6Kym68PJpBGyKE1BqqSfuRNJostUuXsHWY8nMQYqkO53K?=
 =?us-ascii?Q?FlHbQBDgNQHGcFV+YXNS7ivtFzJgKyTttD/3M0T+DT0LU+AyLsqKHw5llWP7?=
 =?us-ascii?Q?aCxRYnbiAKOX6/YEtdvCNQsLGcaQ4jld2DZ5m9aLZo/9ZlV+VYR3MJ6aCMjE?=
 =?us-ascii?Q?WWU05q7piXNcvL4OYNsY1pH/dqA2jDmhEboHJAHbEvMwIBqo2dL693k3a5Lp?=
 =?us-ascii?Q?IEET9htruIKIohCsu6+4i04ilsu8yo6oTpXuQpPdZw0SMbvMQNJbeiYBBQu8?=
 =?us-ascii?Q?GpwKKle4ThvRyq/+ivRiNo2wBEc1ruimjjUDO1Fba0qvEtzRiTBBPs8FrzzQ?=
 =?us-ascii?Q?1iMigEynz5vXNdCQX2R3g84HYqGn12JIjI3OBYVOWuI7pAyiXNWa57gg4Irz?=
 =?us-ascii?Q?a3whYoNMU8A7STdJhzLf0mIUfygXAjtvMRxFmcy9xfX+SUxrypq320tDBdoL?=
 =?us-ascii?Q?HqUAt2/sembQwpsGO3hDBXpwmsDqSB8rgHBsbWHJE1snU6A27cDFiKEiwR1H?=
 =?us-ascii?Q?6JqffLci/cpMAU8qh/4JnVf1PBIwoBhCdvo+sWlYFCC3ernFMDqit0WDWn0o?=
 =?us-ascii?Q?qs3z55t8Cw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0b9901-9c0f-4d47-d326-08df4adfd12e
X-MS-Exchange-CrossTenant-AuthSource: PAXP189MB1776.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:35:25.8414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/GBPQnVguFkpIa5aT5DgMkzQ9tR4MhkT1JO8VUGuBDyNxwqihBWdhjWfk0IxF7eKS+Jub+GcCENNbLmbkE3lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P189MB2551
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251179
Content-Type: text/plain; charset="utf-8"

Correct the LICENSE variable to match upstreams MPL 2.0.
The LICENSE file and checksum remain the same.

License-Update: Change declared license from ISC to MPL 2.0

Reviewed-by: Henrik Nilsson <henrik.b.nilsson@est.tech>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
(cherry picked from commit 6b270958cab94f1fa117b5eee36157cf5b14d3cf)
---
v2: Correct the cherry-pick reference to the OE-Core master commit.

 meta/recipes-devtools/python/python3-certifi_2026.10.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb b/m=
eta/recipes-devtools/python/python3-certifi_2026.10.19.bb
index 749894f56a..b80044b399 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
@@ -4,7 +4,7 @@ Python code. This is useful for verifying HTTP requests, fo=
r example.  This is t
 which ships with the Requests codebase, and is derived from Mozilla Firefo=
x's canonical set."
 HOMEPAGE =3D "http://certifi.io/"
=20
-LICENSE =3D "ISC"
+LICENSE =3D "MPL-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D11618cb6a975948679286b1211bd573=
c"
=20
 SRC_URI[sha256sum] =3D "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075f=
f8d2fea780a1ae"
