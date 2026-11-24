Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14142.1795510425247227134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=q7jpAC6u;
 spf=pass (domain: est.tech, ip: 40.107.159.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auypRHCxxk79JZ/M6aXtN4ud6KOGW5vdHhr9S6wPeAp4NY4TP8Amk2IXKJ0DPP6dDkYZiO/wBx+C5PVYeF6tha5lppcAW/LEs/t3PuHSB12zUFhpC2Q9PCqnQcxehmSk7V5ZmQbU1Oy5cw/ZUzpHqMkLNC1+1pV7LR+R/kQU5UQIjVkU9iM8X1QAa2rEXnw4AYAxdnXtYUQFtAzfRPPgWBB9+Vl0On9kk0ipUROhWFfUTMO5EHO7DEb0M57lh/J7v12fmsFv+iq9iyVn9suh5GXQV+yKqumTKuoQCD0DlLYYk8nh95IgQIiM0+ZAz8u/0G4PKu7BGNT1ZO/CFHTaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0R8PclXZT7oaLmhWkX9LGwGDZkug5UtNSHeO95iSj8=;
 b=bnv3TFlFMPQx7HT3T/OdXNfVxtwvlLv7nLObvk0jfyYaY0mDFVJFS4MX+8/aU7XBhy1o66FAngD6HMqVjX+ZEg51QvlXFW0dbVeXR7l1sFP9si0+seZLH8Zbfx0JdSLYiCulh6laiS3CAt1/MpmgFXHtEnGOmvDb1jn1Hkgs3vDivVvF0GKT+8N2IB2uSXN9LFITYAxf/NJRELj3IcobioYT7nxESuTxLvPA+AfgKz1va3YPjpL61yJ5Gl60MUNVuqhjUp7I/WA5pKGxtf9DuNjniTcFCoglTok54nYJNkZB3SqmD81Txgbj90veFW57g/H00hjkyT+X+JXxPdBgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0R8PclXZT7oaLmhWkX9LGwGDZkug5UtNSHeO95iSj8=;
 b=q7jpAC6ufEpnUfedmEc10Z92K9gX7zrrl7A//okcCyJlo9QYXumYXtJsqMa2HwFChBEhWgnZdzGu9Qo1B7QsVkyi8puRPW5M6YGO/DSXW145xVRWZtl3RhAL6u0Cd7H7eDgfTCb7Ry5M7ek8GzrZz2sYLw5BEleATpNLlmJEYJF+1FReOGR8HbJKX+BXhVfk0uUYgeUlZ9FK7lrr/peiV2kuRqPYiKBx1Ih8OuuvdVIFvfecvwlELN+WyEq5rSpuIbYQLbcSB0n5HIQX8xHM2K3RO3Dz6LE+2Vkn214rXVU0I3t6gC3TkNAc9Hr3U3ksUq6/nLmLyuHTwU+5eKZrCQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV2P189MB2211.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:53:41 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 08:53:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: adam.duskett@amarulasolutions.com
Subject: [PATCH 2/2] dnf: Update Upstream-Status of bash completion directory patch
Date: Tue, 24 Nov 2026 09:53:35 +0100
Message-ID: <20261124085335.68851-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124085335.68851-1-jaipaul.cheernam@est.tech>
References: <20261124085335.68851-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0265.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV2P189MB2211:EE_
X-MS-Office365-Filtering-Correlation-Id: 234280d4-c733-4441-83c6-08df4a08705c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|6133799003|261009223027099003|11063799006|261026140227099003|10067099003|56012099006|261102123227099003|261028144727099003|261026121527099003|261022105027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: 3qKjsdoDM5xs1EHkmbjHJKZwmJRCB5+L6qjUxPEGbJXCwNSQfDpZ6L5AzKG2wjG/W0pmDREPW/8AchVeHhRJ39DXzt+IlHI3bfBEkYSrtIBZc+UUsIaq/5+jBdfrAldxyOsAtQQ0ipy8yzY1WofDgineTTCYe/WWkwVy2c/yUWg1w4Tt8Wo9jtFkLM3cBeJj6sYgGn/aWeQdBSyFiwFEmGaGRavZEZ3uhfsYvv/EcboMABvWI9Snd6T2Y795duFvzqkM6TyKU0mfY4PbLvOimqIJfYUK4YDQU81pNoqElEXAjoJSl8P//ZxjEyHM5AoNvqPCCTMLJAxff99T9Ar7+n5zNFuamIZO2vc1wTT1FM+zxy8su3CIrmxSoY+df9+8tXTONRjAnmRqIt2RPTyFsjPaqkiXs0bmBdIUqBW7RR4soDmOGnmeA3mxlp54oQmKXiU8PCcBFznx9h80i9QnZT3ftGPSammLjdoKGqVEe/mWvsPgzD4L3o/m1lHDCNHkgtEVztBV5cSOk6moSKy8EFh+KV2Cq2Ttltun04jaP5R5iMKjXXZH07NzILGiRGyOeHCiBBxfw70O3/mH+lG/KjNSxe7s96sHkaA+qk7ertLA/UjKvxPmLLB+msaJmZnEIY2f8YBN0JLMSZ6HBN8gCqFpitngCl4Oiw6vr1nMbc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(261026140227099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HXmvGOLuHgmkptCm56f1MJPjpBqVrzVlRFNB0oN7PBm/mTlbWgOgN4dIY0eQ?=
 =?us-ascii?Q?mMIERp4YuFvtEvYsZPFnMVjplGooPb2O/HKWgCD3frU9J6BbEmlpfZajLz3w?=
 =?us-ascii?Q?QN1c1edOV0tBpuoNAsuzx2ZZV30PfcWnX2+bfQWRTrvhhtm0XUdW0x0KUKp5?=
 =?us-ascii?Q?0eStoDXwHggHTz4aWQ+UC1fn6b2aF9Zvru+uZ8lgKneiwxGuJQxYtXT3OPO3?=
 =?us-ascii?Q?CRaKtoiNqjhzBXHh9kFF7EyrOrAgb8amtYUhQcWCvrFd8cAhRLwqyQn7u6V5?=
 =?us-ascii?Q?HwIW952dflwiM7x5rtvcdXQSr2ONMLbCO/ChucjEJBxc7vlZDp3Qhr673uax?=
 =?us-ascii?Q?tYXfZM8hZ+wdFaJS8TFkPXgVngcSc4UCS/A/8B2ncRjBotPw16No5V3QGZaX?=
 =?us-ascii?Q?/hE8W5hJyxD3XfEfAjuJi+BKm+2uHysUdOT6Iq+P0RF+5z1ErngC2uWpJF6A?=
 =?us-ascii?Q?Th0UxzITka0p0LjMgVpnjoVZ1qO9d6fh4le/aJUyDL6JhSfa13wZ7YsD6plD?=
 =?us-ascii?Q?Dy/ZhCVU7mJ2Kffd6VgpcmPL7OSKrMgkrIPynX/+iyH+8Voso6s7CfkFmTrs?=
 =?us-ascii?Q?a+uB6rEzpV1OycdUqKZMYZTtoFj6KvcyeBuloUO+TCxKTNeVm7zlAHVYS1DO?=
 =?us-ascii?Q?JXynApFcIKkQFwyr9QQYuOAQ+xiWhyFItcfJfnYaztMOOSnPsTFQOJDmQMMq?=
 =?us-ascii?Q?0FYyBPBB6CujJwZfrGRioCg9RQEtoNAUEEOTHTtahG6iFzkTIcnNJfrZtJKq?=
 =?us-ascii?Q?zmwxVW479lJfGJ/lu+Bwi9LW6NhrFCVOOcHXswJzJzi89WaB/d6spvyiGcyE?=
 =?us-ascii?Q?LyA4rX6Z96LhX/OZ8xZawjom2FsImbMoocHPfeJWP+BIV43plfUyJ+XcNCSE?=
 =?us-ascii?Q?UOGqwsaGVcoi7bmZtAiZO4CMCdyy3s62UwYgGRl/q+npTcmy293jYjK+u/Ig?=
 =?us-ascii?Q?z/pZe4DZZpcQK8tgQ+dUkn1EPKRv7GEnQVqqxqml2u67eDi/h75hyhgPIZLj?=
 =?us-ascii?Q?HiV57+BI+d/K3ZFMkqtlFNpQW/qkeYhndPWDkDG79kTmSGQE8716lLw9C5Ht?=
 =?us-ascii?Q?NsPuu7jGewBiuzj5YvEHSra1kK5o4rAlpMx7OSFbhktAvIPyjTayDStYVhbq?=
 =?us-ascii?Q?mdZdj9sAULCMdCUVbnSfdgUrHpe5iHat+Fw1kGKFdHw3PKT5+Gr/1ug5oj3V?=
 =?us-ascii?Q?RC0gJZMAjj57FQnUxZCBrYXy6e1aePRY8qs5X7r8+TcLAi8+IHpJQkZaA10U?=
 =?us-ascii?Q?lUfrzzbM6MByZJUtHbvVaeT84ge8xVOw+kk3cLmbDBaZ2hEjSHmWaP3jqdHe?=
 =?us-ascii?Q?+yU5qknYVdRLyRCORryyg5ja7tWHfL65T/3K2WAIM1X7/c7n5a76Y0s2J0Q9?=
 =?us-ascii?Q?VsY1L+a6tBDsl+jnlEdiL52cQf998qFr4WhRunOtvygSaw3ajfZEnRWP+nry?=
 =?us-ascii?Q?Wqz0M3+fS5MjHrrl68ZYM3jw42qcR6///2xZ3HMD5eBeXROb4V4WP/WcKFuj?=
 =?us-ascii?Q?Ol9zuzjLE0y81XcN3AARFXBtiPepKFixLJHrqypwMTPX4OYbDsYkPzBVDHAr?=
 =?us-ascii?Q?5rejmFvpEl0xZMQr+0MLVoz/BnJlXlTANNGBpjJokkKFV8vtaXmIE5ffCC6r?=
 =?us-ascii?Q?1mo5Y4YM/bWHlaXuLIoveAvAwK/LMknRTuOEB/JcpZfjz1qYwwYpAKcjSDAp?=
 =?us-ascii?Q?WkoYZ2hfgTTruikVViQGRlP2W6TRiat+ET8K+Hr6yIpTj1uvtBGA4DXsEiEJ?=
 =?us-ascii?Q?nL7Lqfo1Gw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 234280d4-c733-4441-83c6-08df4a08705c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:53:41.6616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJj7KNgnv/GYfEjujWDMNx7rkW6sVgx81CiOy+1EcocSL2jqfYOmxpryUvPKihSw1KI1umblV8lzAT4pELx78oOQBtFzRcVVnngNAknpU/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250981
Content-Type: text/plain; charset="utf-8"

The hardcoded /etc/bash_completion.d fallback has been reported to dnf5
upstream, so mark the patch as submitted.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Do-not-hardcode-etc-bash-completion-directory.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-bash-co=
mpletion-directory.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardco=
de-etc-bash-completion-directory.patch
index 51c8d412e3c..9799b5121d8 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-bash-completio=
n-directory.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-bash-completio=
n-directory.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Do not hardcode /etc bash completion direc=
tory
 Same as dnf4's 0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch=
,
 dropped in the dnf5 upgrade.
=20
-Upstream-Status: Inappropriate [oe-core specific]
+Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf=
5/issues/3067]
 Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
  dnf5/CMakeLists.txt | 2 +-
