Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.447.1795018919893809780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 08:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bVPatUhZ;
 spf=pass (domain: est.tech, ip: 52.101.66.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcgDtYy8r1EvnsIF4xb0UqzEn+9mvA2ZfDwfanQdRgLZ0dKoYSM/0M8kru0f6b6e2x+SFnsjevGXN0yz5hI6X6PAz2tVzhKM2GqEI7Pdo7zvSvxhVjaNAEA5IduW5mPwDPBVsssFtSCEt8Iy4r33HhC11vucDI8fsRnP2nXLWgTwbifQ7QYE7uv3y+gdhERS5JHnu9j8ZDCFWeZJt7h3ipGikeuL/Lb46EQzZSvfP5ad5izfKqtm9EG1LFRp0x6RPU07RXwywndYK2J0e2xJRM8jXUPYTpJkKQ32+qfvRxklW+GoZ353+sG8aMvTz44T40vjIKMUWhLGlCBRLfzayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6co5PuU+i8vDHtJh6gf7nNlV1on6td+yzuvIKvDRzI=;
 b=VGm5cHf+wLRt4DaKe2Nb80tUdHSntwuBYvxfhdQy0bHyirQMB03JDIec4FU/zQCYdWUF0sNRh+yxtfoKiL1IOrtJ+2Kvo29i45DpQOjIfWEpb8wLP4jCubAt042y1OMH7xAuS7f1cBnuW9/ztgWhHuGv1LvuU5WcOH7D9P7/VQ7PkxkifIehgj0e7uCkgPUmipjLF1h3lxmh7xABJayXQPmQSVdNBDipwMZV6Rudx54/v+vkY3C1k1Il2EOX1l6m/TTR0Km4GFdL3BQDiJ55gO92XZdW4mcvW6fRjhEbQ42OrpkVKWiW91+x33Zno2MHmWUjJBkvRTAjfQ//Xd+VuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6co5PuU+i8vDHtJh6gf7nNlV1on6td+yzuvIKvDRzI=;
 b=bVPatUhZzYO9zm4lX6XobQKblWebMN1QgTZr7eHQWkLbIPtdlDImEm2MKigW6SbaVDm0wWUTFypmnsZ5aeohjOLgDYUpN/N4Joz0ICeEKsqeqk8e85mVM2pAFkrhmmz+CtuJ835SslwGKy2wAGmX42CWusbzhBjTjORp/YHirq3pcOWTp7Cygu/IAMuQwsZKSxFjJq4Qseh2EfPjqSeqD7rnTiqLMDFmiXSY0PcTk43yNg4DNDBuxAen66wnYVyogjbiVu+78hEvE48iaihGieUFmPEnFLqxUyJAUSrkaIKtlII8Up5O/iQPdM2LWDjEorPEBVqoV3sJuzbvnHj88g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0935.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:165::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:21:55 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:21:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 0/3] binutils CVE fixes for CVE-2026-91781, CVE-2026-91782 and CVE-2026-90828 for scarthgap
Date: Wed, 18 Nov 2026 17:21:50 +0100
Message-ID: <20261118162153.25025-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0935:EE_
X-MS-Office365-Filtering-Correlation-Id: 704fff11-69a7-4827-c1c4-08df45900f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: GHuNypXHa+A/X3Mtitr2JUzsV/3QnIFsycL/473f52BWTTXIfxDNtIvYdQDU78IdU74rUK5DSYtTq3M6JimwewIZAd/BXlhKO+UdAWtm6JVQ+NFIio/hrjLQ6dNDI+l1/kk7P4QhahivqUkeouKTM0hMpR0x/bZGAc/VDpb9D4GBIY/FknWX/uefya/dUlqmOPIeFCtmVqPFYF1hjCTbyy9DTFMIl5/r8mSfKop3RM4nOmKtCrWsYdhg1lFJNXzpB0qZ0nkuaTg90Sh0xpiNolyi5WMbuIad56SyP10Mr5cKSbT9kbaJQ53AzAuXsg7ggbXGXkj9WS5KgliN2ycR/2TiSH91iFdogIUDYKh65HbaBuFohim2WUhTpLPbO6z1DYvARG9G2j4yO/v94sfx/IdVyhftz3I8OoQxK/ryJNxRomjE2pxpqyiek85wCnybqxuxyGBUTZLvlpoV1rWNNKk+i9ij5+CR/Ji7Hmh1yiMYxyP/8koIio8TcgN0wLuj7qSZhZQ2Q6yvPlrxD8mDBikAtTxIXH/rc0etSibXQkwGd6M4LyQ1Jbcnktn/k0m4VkIreGjh9bTx4EZBduUa1FIUXwqbeEnSB503sG6nUFcelkXXmHDGZY+e8RqKlsxoAlCaooJ8Vt5GAu+uSpTNB6utYgn4QP3jSoJ2ysGrMIo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4IuVbCK936euq0bELMd3f4A50nO4G2E8Nsz2ujWsb8208h+mVEs7oRmA9H/R?=
 =?us-ascii?Q?vGlhKrBpJN1hpuxU0POHQfuOpkXra5F04rAnhnYqEjvwfdJhfVmWCrNvSP/O?=
 =?us-ascii?Q?CRdpJpMwYmwCmYifWp2Wx23e6gmwGWfW7DTi26YeAEpkNHeZ8cmE87wJd7yB?=
 =?us-ascii?Q?PpBvOxAJc9+G0A3JXzfwYFqVWak13+Mlrz7AfIkWW+RDN9KUqMZBsjEsmBaY?=
 =?us-ascii?Q?C8aACHSYyt2Jd3YmDsEZQQPh5B03dtii4P7uqXzk+apTEVOVWBpFLptFr0EJ?=
 =?us-ascii?Q?Th9wjqerV2dqk8bXP77x2GE4687VyX1GN0g3ZkvWSYn6E2rTSAFsemValKc/?=
 =?us-ascii?Q?/9C4bV8c+GkxWbRHflhzdKjjmAaSkrJq40PPN9FCm05DcjAK2gK9vwDECySn?=
 =?us-ascii?Q?9hbF7iSgWOzPcjHEBN3z3G/34rLEaHb/O5gGRKdueSjPHTKZ6EZ0ho4o+S9E?=
 =?us-ascii?Q?CrIfyAT1iUXtnA+KoJJAr3ONJwjx7+UUtBMxS+C4HOIkqL+Qd0LGz8RDPvj3?=
 =?us-ascii?Q?F6nWa1lWv3+zyCyv+TwWqTJtbVZ/2HYz6yXSE4NjXPqrvZ+KL9PkLOrgYBLX?=
 =?us-ascii?Q?65dEFh7Q+u5HpAG6fXyFJx/t6Ook1NDUg19k5NIxTNykO/RBiWJqYggzPd2G?=
 =?us-ascii?Q?Nd3si5Awk4S1c7VXeWqx6LlPL7CpQYpcl8ZEJX/2HRX0yeAfi24gcp8/FtDd?=
 =?us-ascii?Q?wnm2l82dVvIXKRiTTD1qtYuNU/crKhR5DnMFW1ic2+4fbFgaBdogN4dBuh4H?=
 =?us-ascii?Q?Pmrme4lZ3thzDbmYOqQesmVKdETOGO1yNZQig+9lTjTvxNBWqjXYElp11P9J?=
 =?us-ascii?Q?hWGC1hY/2+fbqJVKQ4IK6vA/RELHJd/KkYIX31LYiLJH6Aebiam+2uXdrcRQ?=
 =?us-ascii?Q?fsT52g2BeD2q4bNJ4E8HUDXb2gm5PPU28syyS1gOBlytIbdcOfSIGZFwEj9/?=
 =?us-ascii?Q?rBU9rTNxJk5V43DXiFCmTkhAezpJvROCrS/bYmFASC7mlEGZE/Pvgt4W47XF?=
 =?us-ascii?Q?EV+vVab+6UooAYSXSZnApMdPHLHGZHAbZh1MXhIGzzeE33/cYGKPkTGmXRog?=
 =?us-ascii?Q?mDmk5dqSTdCONFag8OPp1sdSCLpPN4gaYUQW1sRTrUJKXUEJuiVlXA7R5ZGD?=
 =?us-ascii?Q?dpyWXo/2JhaCbePdiXwjDtk2MsGaXyrzk2jUwWDcm7sxKthx2VCLDW0KA4Iu?=
 =?us-ascii?Q?HNNqIz5ElPCMcmUHkk2Wj7beGC+qgqT+hToJuHLvymUIXCU0V04mttQymRmp?=
 =?us-ascii?Q?cSFHUsffRKUN+Jhelegnn76YVJerXn2ISu1+gTd3ikgb/89aNNGSH+2dIRP3?=
 =?us-ascii?Q?U3vneNp88+9wR/YFjb+fJCJh9FkGaocddmvFNfCFKq9LQ9NDgV7fjdx+hcNK?=
 =?us-ascii?Q?+OjZEGhX61gUpTfaNQUkzPl7wQ0FejDWIs9KfWaUP8q3R+Go4A3LrsWMOkrZ?=
 =?us-ascii?Q?jZRseo1XeJzFLVM0WKda+z5KwXkdP8CkF4wO3WQDf265OroI4kChjkISE/fR?=
 =?us-ascii?Q?KEi7YfFyaovSfI5STrW9RtWaT36scucn8Lf+AeLXHMZlGlc0Bc6hW0Nbrll/?=
 =?us-ascii?Q?61s7UFMiugmEMbwiX4zrTiaiujmiB1nYlgQJH1BldSGUqcN6GgrHlU/Lta06?=
 =?us-ascii?Q?zVpLRNnbyMH6p5jjsqJPSOmcHQvZNBS/OlCp1V8qIn3JMdAkHqIu33HsPFqu?=
 =?us-ascii?Q?rBgUuU5ItwphbyDoTqrR58QUv1MpHOc6jCQ+xUQeLkcTWNxCGvjdLqK7yXKq?=
 =?us-ascii?Q?ZXn707W2CQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 704fff11-69a7-4827-c1c4-08df45900f67
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:21:54.7410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXGWNxWaqkpgIFuk9sXHAWvzroMI/32XGsjcjmtk9VtOAl2r/4/kGPxgSHnwl3bNYSRcWA96vpFUc8ZXvfQ9vSgvnHkC3zRoaR7YJjtOdro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 16:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250571
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (3):
  binutils: Patch CVE-2026-91781
  binutils: Patch for CVE-2026-90828
  binutils: Patch for CVE-2026-91782

 .../binutils/binutils-2.42.inc                |   9 +
 .../binutils/CVE-2026-90828-pre.patch         |  30 ++
 .../binutils/binutils/CVE-2026-90828.patch    |  29 ++
 .../binutils/binutils/CVE-2026-91781.patch    |  36 ++
 .../binutils/binutils/CVE-2026-91782-1.patch  |  80 ++++
 .../binutils/CVE-2026-91782-2-pre.patch       | 161 +++++++
 .../binutils/binutils/CVE-2026-91782-2.patch  | 430 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-91782-3.patch  | 132 ++++++
 .../binutils/binutils/CVE-2026-91782-4.patch  |  49 ++
 .../binutils/binutils/CVE-2026-91782-5.patch  |  67 +++
 10 files changed, 1023 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-90828-=
pre.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-90828.=
patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91781.=
patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
2-pre.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
3.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
4.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-91782-=
5.patch

