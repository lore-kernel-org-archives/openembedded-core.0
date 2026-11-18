Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7167.1794983663812211637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 22:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cF1x8CFN;
 spf=pass (domain: est.tech, ip: 52.101.72.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwnD2z0WC8ynRAj/kcTZhcaaqwzbw4TYObRMtNy1qGbWiBdaOQgD6oIPAnRe609R5JNBaBz9Natpl0EB6erOpbHlCTev/hYVI2e9eHkcpmIFFnFDcIacZtUIdaYNJBRvXpxrL4tn3q5QolojZmhPQojkWEoNLl1QOL1zXFT8rFWgTd1Db/VfpLGsUzGH8k55Ir3+JZaVqfLQ/ucJtMtuA0p2PEV2lDkdsrhRRa7kubCnwuQY/THPSvGFNTZP1FZLz+H10ozOIzqEsCcTbMurC3eDmPl5iOzn62O1RhnsLuND4YfoZYyFfg5VJBFEkLtvhMPy6f/Y3jfENV15HqErGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JusY5akUAMAL1hA2ge8So6riy7b2Z0ohzKy2IAjlQlc=;
 b=Wiz8OzZQHQkWnlioTrF4CO4408gBc7CkBG92yrCs3lOBU4qKZMYaqgU2W+trMRJk7VzldpMymw4pJ5jDPLDxLJPq9PbZQx8kim+2saFYJYXVNDRp8tZR69o6CkVjQ9IqKtzSshMUAYGbzAf5079vrZqFkeB1YDanRdc5tpZw+G+35e04ZNG57u/T3KqpzcLMbOmxvh365qZhm3qWmqH7wjhWN2aIaqOkJmaUqUKQpqVkE9L6Yi3A17absRSjA2X9gKsvb5es4wNsEnTHpvdQVZFD3cXQ63vdn8ck1KoFBx9PDE3yp6bAaTSxJ1FLxj+2IVG53Xb2cyj3v5V4L7n/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JusY5akUAMAL1hA2ge8So6riy7b2Z0ohzKy2IAjlQlc=;
 b=cF1x8CFNk9WdICH7bSJufpNYu3yjoFcH1yvRSenLOEUlgMwpthMVkuRxj0y9v9m3b5Z1MqZgqKCLSXx5nQ/vRHfcmmt2Unc2BAOwIP2mTpJgxYbtsebmNe6cCMj/rsE6CtFAFHYgjWe452LHogGHleIkXbLrknNrW/bn2SE2Ow2koTBan7kvvag25G0u531fiQVRxGP2LZmaNo+tTZmrwurQfoqTg9wzraGIOUXDHYL427N0iysRes0yD8hIBgU6K1lUscvpxdJmXjR2ZrKw7OekOKT41bfhp/QS59LD5IKU7VsvVPFZ4m7ulYwfmxSNaqyo4aRTcKlp7K8AAgZapA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2606.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 06:34:21 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 06:34:20 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] gstreamer1.0-plugins-rs: fix annotated tag match
Date: Wed, 18 Nov 2026 07:34:14 +0100
Message-ID: <20261118063416.18496-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261118063416.18496-1-jaipaul.cheernam@est.tech>
References: <20261118063416.18496-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF0001A321.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::686) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: eaeb855a-cdc2-46d3-6693-08df453dfa7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|6133799003|18002099003|3023799007|11063799006|56012099006|10067099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|261009223027099003|261009223327099003|261009221227099003|261009220027099003|261009221727099003;
X-Microsoft-Antispam-Message-Info: Xd5S4+vU/C2HgVggNnzsCcn4iaYfGvh4IbZCwq+L4D7fXmJ6L84f6Yj3T+BWRA3v2vjawKGdqMFD9J/hR1xFpGJ6sjbtgkQhBTHfFG1TYBOauqnE2HAbpqgx5cskyUf8T5RkXwS+m/c+yh5HvGxkplojbrwkcKmdafQqu/9rRh7ofYfcEwNpP1ruaHZHPpM/4YWZvAFESnhuQMB39g82w3jsjpmScHFSFTn5wRYq4DBOX2lRcfiY5Deiv6ecWTGzaZ3ZZ0RV8oaDbERHHb19rdFzRt8fArHUfqBUUtWpqWRrNP2KjNAXqqdH2NjQRDkmHIVV59wVMRrYEZhTI90iD4FSeVfgdIeLabJS8vCvAploz3jHRv/2rUfhSmON7JH4B+bAfNevszBCej+tV3/3U5l4w1qj8KboReqOHFcAEbTkvbsmZxjBjWbPPwl6ExWrTPm88yBQBfzvHSjnzBv2+J97ENwISODCCUsGKq74HXFX94BZ8dWjGkzeQSrTWqqhL72YVL9Gar+cqVmkuBL4nSHxpZ9ufTrRIOyl+1fi2wIH8vRMCTxENBuLGQQRDGleZCojiaQqPBCqzvNe9ZJY1hbB6UCYeNyuscXd1QX6ASbpF7axmLumr1u+fUJj4aOF2uIIuuxhVZVEeQLobMLzN8zbFMvtgG+EctaozPI3bSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(6133799003)(18002099003)(3023799007)(11063799006)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(261009223027099003)(261009223327099003)(261009221227099003)(261009220027099003)(261009221727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gTbmsYWlp0XcJdf3D/QfC79uQ5ppqCbSmV9i7o78lM6/RkGFHbjc+C2lxjw0?=
 =?us-ascii?Q?fnHHpJf5EDSiwE0jLZkJznYWuMY3lMzw3h4o5FJSbt+5f2EnkeSUMO+BMtrH?=
 =?us-ascii?Q?pHBJKB8/5fpsgPxKCVhSgtJQG8I80N2Pmsalx2PFaoGBuUGu6eEViPpFpgHl?=
 =?us-ascii?Q?ev2e6dVmI/YYFHb3oUwGLAq+igfJbv4SzmMkjYIyUhNZdTDaEVt3xSrAU4N9?=
 =?us-ascii?Q?e/EXLihgKmGrj6IlBJVnuIwztAhwavzkgVsnTV1RyNdcwIPg+uj/ljLLkvVt?=
 =?us-ascii?Q?CXQQOAq3M1sWoFUOycOffBPPPINt/AVZ5s2cw6NvqK9otYaFAiAQUgwlvCPa?=
 =?us-ascii?Q?dFonH5ABhdyogY3dF/OTiqLCPqj9zJsX/vMC1uisXmW+IJfoGBpoE8+HRFuk?=
 =?us-ascii?Q?Iqy5Hgej7kBUXbylykTI4d3Yt2XqBr51kZGiIQDWWiljMeaF13ysiRfdecX/?=
 =?us-ascii?Q?LKEfqmTluInRDdt1MR0U3ZuU8xTHsahsJpNDdtXRHI4Ywf9XjcaLRpDsu80N?=
 =?us-ascii?Q?7Q9+bq9Ohla97rKNi4bYHz+USdFfoxFU3JtM/5sYvkBYlqOD6wuA15W7dXvd?=
 =?us-ascii?Q?s8WijDzRH0s+QIXANJU9Py0OYZWp7GIKgg483JsjdLG0ZgteN4eOkyJFXpVA?=
 =?us-ascii?Q?oBavb6jdbPrCQZqx7nkmmwszAbgFKGPJJ9benLnOcioVwJFLGrOcVzZORn9L?=
 =?us-ascii?Q?OM/R9jq+ZFg3GzJU60QaMnvZQV1CVJIkVsQ615h7fUzuQ410Ww++fHQUz0f7?=
 =?us-ascii?Q?OcrCmTHsHoG6S9I9d0mvtOfzEaAVTSQq5SXq4myc5MqYjvAbwRuu0BG4AVlt?=
 =?us-ascii?Q?0zF4DW3sCS9zU8XuRz++GCjiiN8/dyRJp6K7KN6h52llwskfx3dGC2lZIsZp?=
 =?us-ascii?Q?EHT6Bsb//VD0eiouPi9qa7sY3rxQsp3Z88tQnTdkmMuZMZlXcx2ak0dLEzfZ?=
 =?us-ascii?Q?upGPCkvooaD6g2xmMdnGmlwih9dCPevBXJ0zvUgSosJyb5NcZnIgyUJZjTV/?=
 =?us-ascii?Q?gihm1A6pdFV0iGELCVkWPW/8+vVyFHfsR9eAjedCmMjRzB7QsHPF22mK7V02?=
 =?us-ascii?Q?IaFlL9k87XauVWd13eMMWLADYAig6s6JFhkml4y7rTX7uOytEaQyMpJrpG2m?=
 =?us-ascii?Q?phip5lGVStfjLjrq0e9RT0qz/qha6HQA01TCdGkQzXEI7yaYtm8sCIq6wG14?=
 =?us-ascii?Q?ovmMyIIMgOxl379asPQWg1ZBIkd78puQkMzY3pYERX7GNbDR7fcG2mx2a3ne?=
 =?us-ascii?Q?ZOWJQYKfyl9/T5XRUx0I1AI1vufe5S2V3NmPeeyXYn4vUhma163T2wrl/gb2?=
 =?us-ascii?Q?slaXUqKpQWvfN7+ezXNlVgEjwiDk25UjHUScgpYVGtu1G7YUb0ZcPHBDYnBI?=
 =?us-ascii?Q?StoHHjyuo0TXllgEfgQXb5Z1bX7xuz4dxQQABjUFREXURDKfTgQH42H8xwIG?=
 =?us-ascii?Q?30BjfSgOf/bDuo3ef1Bkvsa/GVr8NtQSzRBG+n2ScIUzh0NtpsRdY+rqqxFj?=
 =?us-ascii?Q?EoOjyS+J86UI7z1QrGMhBBvK8DGIvOEQnhRB2PXhw23lJweANqBu6N8ARwe0?=
 =?us-ascii?Q?W9kB2IB+1LgebsjZJ2JODMHUoWGVYd2mlx5CdxZQ5gPKZr1p4kHWgRjkq7Xp?=
 =?us-ascii?Q?QuvDIxX7hdXaj89X+AZORQuQ4rMIpJuyjjSlOz/hBt1DGWoYOfJ69XGxFiYo?=
 =?us-ascii?Q?Opu9iVsqnFqbX9/Wggyltuy6UGjUR329jmAk+SzpcUHZ4bNHNnotLnCJKpd1?=
 =?us-ascii?Q?AtrymKJChw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eaeb855a-cdc2-46d3-6693-08df453dfa7e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:34:20.9219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeLLuorVVTu6K1Wkl1ImTXtOGRYdkf/yZEncqvewepuH4lvigrwdELWRZJejs3LbpeIaowPOCiUdO9j1LYQm7i071Rv3lsubYHamjdRbuk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 06:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250516
Content-Type: text/plain; charset="utf-8"

Upstream release tags are annotated, so `git ls-remote` returns both tag ob=
jects and peeled commits.

Allow `^{}` before the regex anchor to match peeled commits while ignoring =
`+fixup` tags.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15=
.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
index 5f4db41c136..294e3373437 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
@@ -7,7 +7,7 @@ SRC_URI +=3D "\
 git://gitlab.freedesktop.org/gstreamer/gst-plugins-rs;protocol=3Dhttps;tag=
=3D${PV};nobranch=3D1;name=3Ddefault \
 "
 SRCREV =3D "6302bea23b53e6461c104f9543df887a63b2d6ec"
-UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)(\^\{\})?$"
=20
 LIC_FILES_CHKSUM =3D  " \
     file://${BPN}-${PV}/LICENSE-MPL-2.0;md5=3D815ca599c9df247a0c7f619bab12=
3dad \
