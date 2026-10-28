Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37402.1793171046344595740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 00:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Kd817qpC;
 spf=pass (domain: est.tech, ip: 40.107.162.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynwQF9mCo8FIU5OBBdiag5mSiFgZr/Rz5szdCGpGo4WWXB6d9EnROCqNxGKkbG4c9e/ZB/kUC9OE870gfWjt/WZZqTK3GjZjyDwBI/sw1dwI66PWm4TZLloa+aTgGzvKJDoPnc5qdzrxfdUFpcFN9Xb+M37j767E9xJcR+8qUe1quUdAvtapBd36v69665ARrTP2dSLqIG/tj3sg2HFlYv8rK7CjnwCp+p0PvfdQ+9yt6+7aZif31MK77sapVIn9tx4ipbhrnhRUfLPrYZPssZ8of6HVL5DMT7QwuWhPCA8plZLNuGEtFpxxZLf3QlcGlgmWEiWuG3g7UdDYiHv/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRGjM1PEyXHxv9bkDLKdAXP02Fa4xKSs6SEa5+TtvXM=;
 b=jPD+CZP62WrzLKSB9fXO5WIu4oybCEvMT9l2WT5V86iiFHCRpxTKqcwJyywEyKbimdzOSCja8ateUFVJB+yc59Rx8zsgNiTDQNKf3KXGsSHC0uj98TeIpib/QnJs4Q6qeg56uRbAwi00DPi72TFURyWbMsDttWG/pEuqb83Vz22Uz5j9n9LXffbwrnhDZl+kOnoeylUPVuPDStHR+NPhS2n2EQvBP9F0UPCA4XDNC1r7KkS77sf0J3DO7ids7/WuCek2mp1w6hBg2DZWSdbUBjOM7koIZhS6E1n3SMCgyNvnNeC0TypGu+SNUrn/dn2BLiHo4pPrZfLj/RMWOvrovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRGjM1PEyXHxv9bkDLKdAXP02Fa4xKSs6SEa5+TtvXM=;
 b=Kd817qpC8myLG16Qm2U4vIgU0T4W6nTSCzk59w01QzjGxL1EPMD4f61LEaUkRvElMVwJj1t0zgZb4Ik3FmkiDICPkb3A14ukKq7Ioq7Ao61fGtGlV0luRpqrBs1uwV1a4pPHmnZqTQwxFCmLL6/DM9fUZUB/ffWK1xyTgsTUE/47HBpLZff7pftwGsOW3BbAhQkzJvGzBVUTgEHiiadh8ynkeiYOwxwYXrNj0/cZq2nXi/RPQkTOhpMRMJONC1K/w6+IjvQ9XFiC8DFOig7zpwpCNdCXabcEeSPpCIYgxSBuppxdXSK4iJolYscnXyuR9xzLA3jtO4Hw58Vb3qGzgg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2318.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 07:04:06 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 07:04:06 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] python3-pdm: upgrade 2.29.2 -> 2.29.4
Date: Wed, 28 Oct 2026 08:03:50 +0100
Message-ID: <20261028070350.13243-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
References: <20261028070350.13243-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0083.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2318:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be03e87-854d-4869-f1aa-08df34c1a819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261009223027099003|261022105027099003|261026140227099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: CPE24va+4ulC0PL7TdcwTxjDNQ0LDEGGhnJrO9z7NMUg1KTLxf5gXgLGoZLT5GrjFq/RqTTFahuLUOgn8ggJc6pCbbiRMXJA9+rXqG7VbaSLf9JCVfFgtvFztAnKJAHBfYujuPk6a0+KUr11R5dfL/1mBmCYUF8yMecNd1+jKQHqDFxE06KfH3kpEfr6P8nBnrFrVITImwV3I8H75kN/9X2elQW70lbSxOEBOMN+1UmbiK0DQCKmkSWpTw1Feh48cKyQ+ovc9CDKqX+0iGIHeEi6AadPk9DzCudj+PRxz13V23ZVVyehIRmQ3QuIuZ+4Y2AV/fcFL0uIsNBdsC/+UJrI3UcbaRA6maqOgCCWXaarnWzbOXiLQsiPmEOBqZEz8FcoiJ6zbVCFBxv2CvZ75rDzVLpnplZ1U88XGxHocrFPFxfk6D7E/FEzaG+riCnShPMkGHZ7OBjHy+Ej/cakqcZKaKAqu2G6ByNaKiiAOlmNizhNW9s/IOH0iel35LL1Q5tZoqJ9D5+Q/FllTVpNY9mdhnOmONGY+3X+IKoHa9Wfk7nxK2/xAYO/LjIy7KY0IGKCayhY65KaM6CSBcOCHXjIJZQlKj1A3lEsR7QQRu9u0tyTBKP/L7bGVtor17UmysdkLYcBAzQmx6cDGoLbMCMCzLYNykYCrtn7Uen5qvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bFb1YMjiT2ESt5voEHf0O1nycvzIAN2LfBs1/lp2Ky1cHv0ssu8C6/2oehDS?=
 =?us-ascii?Q?8PpAdnnXWkpdjZGrN5DpEGtxbAnUDetfSQQSPMZreyok0tpnWS0ur+Hg8+dC?=
 =?us-ascii?Q?uZ3maYbr3hY0DxoGUAHdX1TS3geSOj1W1KHWh0lTESY5KBuCivJp9z6kyjK6?=
 =?us-ascii?Q?qkT5nPbXfi8zkP9ORHc9InGq5osJ/1kS9UyrKD54GfQy5LEpC3rtGRhshvOc?=
 =?us-ascii?Q?KHxcqkMBaX1iWmdP9I1o2K3xO00ua93cBGhx9k7UMy6GPKS7X1c37tdXZ7pt?=
 =?us-ascii?Q?nWCbUlAr+7omBrBwJncua7yfzMmGvNl/KoqTn9/iWDf/sCqI17rGnoT+sHpP?=
 =?us-ascii?Q?yithKzd7qlfwzts+pwzu89AP4RXwBswkO1JcZdsdcGQAc06i/XXO7iH1xANA?=
 =?us-ascii?Q?dt/006MKxOP10GaGuf+b/zNa/Kb+uDakgDZwF+BhwfOEUCeG1UOx5WBpRtSV?=
 =?us-ascii?Q?ByRrLPpm+9eVALIsVISc4/J7fZaBlQFUvuWRjoko9JdAFYKevok4NZ+9S2r4?=
 =?us-ascii?Q?eozZV1vjnbl9aLpdF7l6LYtsoLdstQgeJCHOY/iC6rWG02kJSX1MTlaO6/1B?=
 =?us-ascii?Q?j/3V+5u8+Cqje7HRO7ufa4jXoX3euDD29TO3oDCFJSI2oumfdG+h1LBE9bBf?=
 =?us-ascii?Q?HkySwSpKlP+5XUMo7f+WlHFCjtDdwSLJntV8TGMTzBoYvduyUOjueSvT1H4n?=
 =?us-ascii?Q?KpaHT4/n0/8v37VVcRgmYJta/TDAO4grZYWyn+5xMtt8Is/vesUvALIYenW2?=
 =?us-ascii?Q?5ujN0WiRVH3d38mOtX9Fxm6s5cUV9zyag8oseQEoaZrZ6EJLv5o0YS05B/Zb?=
 =?us-ascii?Q?owV5a8dCMRseYb9NcN2vN8UlAsDX/paO9sFJjX4odK9gZNPjO2Z0+oecJKVA?=
 =?us-ascii?Q?xn1+ts8ER4OYNxZKNhbi9sqifnJdPY9sy57AErrL+EGF67nf51a47figJDQ0?=
 =?us-ascii?Q?HGprWMpuTVGU7PFBwyKUMi/5FzrqUmkeFndQ6C8qjrfi/Svgw6fdVt0rhB6v?=
 =?us-ascii?Q?EXOFN05+d80xQmFjat9b+hatWGI+ty/bP43BKT5gytKasmmnjrIp75eq8UnE?=
 =?us-ascii?Q?K25dIczVHAEjgvaqtw0kXXQ9tGxIaSPl0ix54sa5nbcRgesnlizIjHEzWfnd?=
 =?us-ascii?Q?SMq8doV/3CSYzkFBvkPsx0fNx8vNJrqmdB9fgiDTUwIY0itIhOMy4k5XELTW?=
 =?us-ascii?Q?v+sX8BlgDrr18eGex9PmKjYoaHFeMV5Whi8webllLm89RH4PDW4AHCxmich9?=
 =?us-ascii?Q?l4Ny9KN2vet0i2c0o3Qu1fMf+hLLkK8ao3i7DV89Lvav6kAcmJOKyL6MMBAz?=
 =?us-ascii?Q?95I0X2K5lBPBFrmcO84GEIRAXNSkBWWcA+iIbiDNZ1A7jgqaeAamOr+Ug0DZ?=
 =?us-ascii?Q?ykzwjQhTtco4lqGCjCbCPXRWGcSRYGzqne5RQ4R9N0yhZ/UzpqOxEKxPGQq2?=
 =?us-ascii?Q?vdXeC8lTAvEJO5luECUaQaEh95BkQLYjV23S4E3BQaFXVBmXm1JODmZ6Beku?=
 =?us-ascii?Q?09yPMqHzwdm0IAN68PPO+xUpr3aFC+OLC1Oylx683n4dMAarhlczWSa61zvR?=
 =?us-ascii?Q?abEWp6f/EGcasdDG5iX07FN2yHNVE14fZ0QstlA5PsJjwxqzwJSdrKxXismQ?=
 =?us-ascii?Q?8zxcZuIUgttyuLF4Ub5OmAfePZgpFl+UzUVzYDd/7fUF8hUIq6PWYRmDTmB6?=
 =?us-ascii?Q?rOax9IZl1ydf8WCQtUUmQ+O9J7R+25MBfK0rsntdyNZ5jZKtS6WA10O/9AJe?=
 =?us-ascii?Q?2YxEByAd+A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be03e87-854d-4869-f1aa-08df34c1a819
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 07:04:06.4167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcddIRnyUiU2FAKWPBSOafAWG2maemVfn+STS2VHPzx32N3ruZdexT9VzcN0PWmDCesIpXFihfbB8dRrNy1HjRKXCWZBfOnq0H667FwQ/ZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248792
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://github.com/pdm-project/pdm/releases/tag/2.29.4

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-pdm_2.29.2.bb =3D> python3-pdm_2.29.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.29.2.bb =3D> python3-pd=
m_2.29.4.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.29.2.bb b/meta/reci=
pes-devtools/python/python3-pdm_2.29.4.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.29.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.29.4.bb
index 83e9508612..2a2c6d4c82 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.29.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.29.4.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 SECTION =3D "devel/python"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2eb31a2cc1a758c34b499f287dd04ef=
2"
=20
-SRC_URI[sha256sum] =3D "bad9705e9482e7d877a53380ff25273b01e9c1d313ee6ce7b2=
15a6562a9d8bdd"
+SRC_URI[sha256sum] =3D "48d013ba869b85538fea268107cd7a2c18fd91a6abf785fa4d=
7ed5951808582d"
=20
 inherit pypi python_pdm
=20
