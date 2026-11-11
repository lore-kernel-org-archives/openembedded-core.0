Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7335.1794396272438301399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 03:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Pal8D751;
 spf=pass (domain: est.tech, ip: 40.107.162.11, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIs7bOcywVZtSzxS4rNjPWOT8MRjYcX+NMckvTKzKPlxX4yOhASl6P8P6rKcFBWhZNOwckI9+YhToNy9zupbjSCDHZBsKlUtzYh2fMxjuZzx+Cxim+pI21np9+MbLxxD5JP6rRrVTnarugRJ1DjX9RkVS9f2m+Mxkj/x6pME5vh0eQbxd1nAgJptbsOfAcXmpRcdTrTW6coe7pgT5IOw3xl/oaAx2/2pZKZ7qcXfLxGRXmSNRP/PPNXsQGUkWNS/iqpiiT5sL2CVCUEWlSgq2FZA9nsgb0wgLonrIPsaKUa7Vlp5D3EG/EWSKsRflofMKQBn+quUK4nvPljRZshzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/+V4XrmsvlioMaUUKSDG0S6PC57LZEnFVlzpxJ2FLY=;
 b=xbjy4IzF+G1xduCucwVQ+FrsLmRHGUfMiQb+0mqqLLtBtUxXNitgqAWWd8fIvkufVHNTrqmGlW+mD0B8gLGRBvoiBcIGul5JXp6QElqg15f3A3VQuBmkc033KUIy+Fuk382M/s1gTQvvT2BQ19nceoIRb9mWoy+/0X7M+vUB65ZD0FHsgnN4xGsD6yRZOpOmN9WDJvlWfXuf5AvTybw2HL3eHIml3RCuE4UqXYo2prhm9XQ0zfcBLvcbOw5BWii9D8KrkzAAW2xIdDW5VwYefLiltgBRcuausSvWBEH2pmRjb7K+LuJO3s/RkH1f5XuwuNjyst8cKtPSX0HlLO/oOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/+V4XrmsvlioMaUUKSDG0S6PC57LZEnFVlzpxJ2FLY=;
 b=Pal8D751BjcBOlky0t/w8WbzubFb345vnVCRKnrC1PSaObvF1ETHM9ioAgrNvGd56ibf+jFU8ADREQIgqsHLQyWRwDFHHOPauciOiYV3yfozLTmmYhxXY4PA9no8os89Egydu1TUA4goDTZ9jWo0fOxc8bS9Yq9uNb75z73W+pKD4NCRdbCjuzvxO8ehFSw5B9Ic3UHLtxR82agaj/sXj9gQv6U7Zr88IBYlQVS/4p/3l+xJIm7fjrEqYHzOFwfeu13D9XqTXb2aH5kNsg0KzjSiOUXRQxfV5/sxLt4EmxYHGNJXN5dsq1ZcKIAHX1q722ctlGvk1kAelDDuFX5Y5Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3204.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 11:24:28 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 11:24:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] Upgrades on 11th Novemember
Date: Wed, 11 Nov 2026 12:24:21 +0100
Message-ID: <20261111112426.85977-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:10:110::24) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3204:EE_
X-MS-Office365-Filtering-Correlation-Id: 66946874-4f9f-4303-738c-08df3fe65942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|261102123227099003|261022105027099003|11063799006|56012099006|261021121427099003|10067099003|261021123027099003|261028144727099003|261026140227099003|261026121527099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: keIEBqOgTGMcTudy8Xj9D12+PpNq9rbVD+aAxrdaurI+MPUR9p40pNjY1PdPyhgArm7S8NLKkDwsUW8p5RYYxn7Y0IJc6Wep6YYV+mRvDM1ucBTXjIHB+qj9i/0dv04eQDpd7GoyN24icDGb4her6BYjeJQle6FsgJp6h8T0pLJZ2e7nyApAlZwQOUCDWmEhmO4WO2swf6hFE3hol4Kj1kH1aR7WrdRvUBGyp4F7RX6Ei3hUqDx2XtOIrx3UK8/B3APsyJtqXfEKnthUvr2/lcIaa+OnltYUPFgNSio7HxUbKh56EY1Kc8HKf2eh2eXD8dlaB0vinKvi5HEGpLopewH8kSjnvR13r/8WEn1zhJ151DHyhyUJlBx7cuMWnCqESYYunjIp1sD0T1D0OhzTfZaq8bCcqcPSeHhb8RFv/RXo/yzjUMTlpPwdeHnNDk+46N3HYdXBrqU3ZyWloWCuPrUWVo3E9394RMbzAD0DgUloWXIQf6164/7RzVKtlVQ8w1oZAc17KqvQN6pGz99noy2C1ckg4KWg4Zb+dL15iUdbN+LwMfqr4f6E1wjoQbAWbJsJv61uIxJy1md+j289B2rj3+Z3GDUYVUM7jpqKJoqEtfpVKb9coDZW4AMM2iVmFsV0VxPm8ywlT+ylO+fU94MaWlcXMJUx6NdO0rP94s4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261102123227099003)(261022105027099003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261021123027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7YF3N4TemZXwvnnMdXqzT/CB9Babm67TYdodAsN6VNnyXFbUtMFpmjwxuK6q?=
 =?us-ascii?Q?tclVv69fANFghaB31ZrZTeylyTeFtO6x84/6GBOrEg5Bp6MufXHCwvHbYOoI?=
 =?us-ascii?Q?z3p3Vyjw5s4DbtQtRhjvVg4+gpleB2eRDjE5LAqrQ/2IIVSzD5Ox/+UgCm68?=
 =?us-ascii?Q?BgrwV9gDe1Kb2rWeXDRA5Cwi62R4nM4koHk6CQLQh3rZkL3JxUqacltZYK0D?=
 =?us-ascii?Q?cMIIucGE83N2u/SBies0ptNlU1ZOVq1Jm93m5Vku6a1cTlpY0AN4fHIQCfBO?=
 =?us-ascii?Q?ambzoXvkcu4jtIkvEgUv0/r5wfawHO9LCeSpDOPdIMg71Pi5IdkHVD0TMFwI?=
 =?us-ascii?Q?oV7RCjhI1AwP44Y69qd+HGiatAhNuFip/GOItWZ35dN60uXxXZIMkkCYL60m?=
 =?us-ascii?Q?2k4YO/vY7NuR1KRQuF/l21h6uU91XI4MG/VEh8HARxSLhoUr3aAGaL/eySFo?=
 =?us-ascii?Q?1P202MGuOGRML30XC5dlDanWjrMgZIiMacLZ7Qo7J3mUl7fKf+mRz7T0W2qw?=
 =?us-ascii?Q?emwii7o5sc4hov7gQSwSttLgJBTUA2qWzb5UqSe4PCb8ovglNAwtZMkHQgKy?=
 =?us-ascii?Q?U2/vlwE0qXgqh/1W2xC0/Bwsfwub834qQOlgYaBsY20gVNkZE+VbnkBlVhG1?=
 =?us-ascii?Q?naO6yJ1AdPJjavyOZ2loHTwOeDN0iXfbjfjfs5QRLEIu6vmNE/DuY4VCG0fz?=
 =?us-ascii?Q?iSLDDYBBTnTCpx3bDdXGU7+nVgQ6aAmGGUwfifmkEI3nwpRc1hjqpalyMhlS?=
 =?us-ascii?Q?wViMoMoI+VT/590teMk753b8IzAZQFwjGrAzPtmZeuL5br65zWbKSOFXU3Qb?=
 =?us-ascii?Q?CwcYG3gFpkPdtZrmfyq50FARbN/5uyrsCheGOPDSb40ao2ar4tLOZ4wJ08qe?=
 =?us-ascii?Q?jN4smEKhzHcuWacv5eI6p3BVDTbqpNkMZ5UjrxKN6YetGZqyoG96Pzxq93QM?=
 =?us-ascii?Q?soedUgSc1lJHECU8hgeoarD9z0UfT581zxyrSld2bJCalZBemjlVNQYX1kH7?=
 =?us-ascii?Q?VjKxByqoKJBRO7pF+Mrem/EVdtmn5KT0XKqj36emwMW/ER2AgS8pnBXnOMGI?=
 =?us-ascii?Q?fFTKsFEBLp8a/dZEuumLhDrpn/2HAkPSPTdxmZjinykoqyNZwrhjotH68flx?=
 =?us-ascii?Q?DEqo3BDVLBC/PssUGOca1hxmukuyZXqWZp151zlEJDsN/LlNb43AWF37mB21?=
 =?us-ascii?Q?N0GBNgKoymlJZpQiGEL+axzlNcASjEOOKmArEIQsUmeRis5WnIwqUUWcIGX8?=
 =?us-ascii?Q?0wqOMNzYbxsPCVSvtAadObT0KFjtgca/3D/wJFMM9jtVhh0hlB0Z3PEs4kwI?=
 =?us-ascii?Q?3eWe7AwnbGpQnBZbx7f66Q8g8y9pkf6NliYvhglHgd9Tc6LrmzycfrcT0M67?=
 =?us-ascii?Q?KTaO06+JvSapZAvF/s0ZV/Q1M6IGaxuKHOA137vEG+elDZHOAwRGzKy5cXo+?=
 =?us-ascii?Q?roLII8xg4EOsz8c+eRCuVV3jRdTcxwOVAiEJS4KMJ6xKoB54fxMVo0xS8cLq?=
 =?us-ascii?Q?Yzh22al9fAypsxizcFf4ngU+PNusNuAgn8kNSK3VdWMAyQ7ZbFRV4ZDs7+CB?=
 =?us-ascii?Q?B5+coDv45hnNQSdgjXRrGeEJI13gVr9+ojMUue18kbI1QfZ7PKOtdqzeb9MV?=
 =?us-ascii?Q?MPxBbb6D5cpF4GqjChGjirCVFDKia2+3Gyhnv5qpCBtuGJm6h3vUoH3JptEN?=
 =?us-ascii?Q?j/CJC6kISSXicrhfy441AmixGxD8TYmwd9uASGgE4F70p7HzIzQKalycm+qP?=
 =?us-ascii?Q?9/Wp8oQQdw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 66946874-4f9f-4303-738c-08df3fe65942
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 11:24:28.4010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpgCDWzCUC6ssTO3C+mhCTDdy9wx5E/aHNs2NfbrNExcQMadUWnMxNj1PeuUxADwuaRl/Y2hUKKu5hVkNogtQivduINr0YY0OMJGlEpvWB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250016
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (5):
  libcomps: upgrade 0.1.24 -> 0.1.25
  repo: upgrade 2.72 -> 2.73
  git: upgrade 2.56.0 -> 2.56.1
  appstream: upgrade 1.2.1 -> 1.2.3
  libxmlb: upgrade 0.3.29 -> 0.3.30

 meta/recipes-devtools/git/git/fixsort.patch          |  2 +-
 .../git/{git_2.56.0.bb =3D> git_2.56.1.bb}             |  2 +-
 ...ot-set-PYTHON_INSTALL_DIR-by-running-python.patch | 12 ++++++------
 .../{libcomps_0.1.24.bb =3D> libcomps_0.1.25.bb}       |  2 +-
 .../repo/{repo_2.72.bb =3D> repo_2.73.bb}              |  2 +-
 .../0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch  |  6 +++---
 .../libxmlb/{libxmlb_0.3.29.bb =3D> libxmlb_0.3.30.bb} |  2 +-
 .../appstream/0002-Do-not-build-qt-tests.patch       |  6 +++---
 ...GE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch |  4 ++--
 .../{appstream_1.2.1.bb =3D> appstream_1.2.3.bb}       |  2 +-
 10 files changed, 20 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/git/{git_2.56.0.bb =3D> git_2.56.1.bb} (98%)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.24.bb =3D> libcomps_0.=
1.25.bb} (94%)
 rename meta/recipes-devtools/repo/{repo_2.72.bb =3D> repo_2.73.bb} (94%)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.29.bb =3D> libxmlb_0.3.30.b=
b} (93%)
 rename meta/recipes-support/appstream/{appstream_1.2.1.bb =3D> appstream_1=
.2.3.bb} (95%)

