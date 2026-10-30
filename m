Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8651.1793357095846489218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hcNO+qL/;
 spf=pass (domain: est.tech, ip: 52.101.84.28, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ee2hJxT0KE57FSwfs6/3cgYPbBKyh1WEZhPLzxOTPN5Xi9dqKluugpwcjuf+HrqXbUaQKWH4jW/YWws6UuYSYOCHi7jU2ZbZFXGlB1icLfSsbdBn+2Y9USXjgMimnqVOA0QgXEh2lvZS02MmSl2wZY5hzXTvxUKtHlDy9FbPAqhceLZeOhuZ5RIsSabrrOG3s7+opy4/28fajLP+TWpJEYPQiG62zvk5hiItNzFtdmr9A32Iie0udgvjYlDF0Cv4ZgkqJXapd1B92jpPYZYG5xMcBEyMrvfDMM77yrTBvMyiypJ4YD8gbhZttMgicdoi3vFNIlQ7e5ytUm13puKeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDzmJ8EKK3bxnLXfoMvomhROSZLsA0juqNtKGB6hCNU=;
 b=j8oq04p/g13yDM2ZtO+oVkknG3udc45+Ly16473H/1Mvkjf1YytgsE5PfNETUmAfqJp5dKNz+Qtl3HkZe6moctdgjSl26C8vJxuYWw3EKm8rftTfxLAhbeiq4zDHnmLQqmMC1Iq5XDZPw2IsiygpDpEur7gzTkNGUzqK+UMOmYz5LflOoB13QnMguKjR6SJ4jwkwrUqfKviYGsZndM2LUiuDt57Y9z96Ts6Pdwuo2s1r/Vrogyjc7rujIwWTRbg5VxqBzTkC6/Pr95okAEPrGQUcWbQ8wl3GEzo1jyPvaD0/gEbXtGTPjJckm+gd4AE20tb4pfb6b8/rfZkQwmwstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDzmJ8EKK3bxnLXfoMvomhROSZLsA0juqNtKGB6hCNU=;
 b=hcNO+qL/eQT9mtP+OP/4OVEVpCjddr2XNUEqoiLhxXraMHUfk87KbHP1hGt/HNZFubDkGlvCNVlpVxebgpBF1wxPPGPQgN63gzXaMf/Z9YbeaqG4gPiH3dwCzZMp8zTyMKyZVTiKBKeMg8FL7yM0bzBxjTtMJoX6XT/fWu3yu+yhc6Q+UP2KsDoK+b1aEUbIyP7Vr5n2PzDOqRY345VK2RuKyZNqggz/vH8xv87Ukes2t7YyywZ5yNz2YQurJVVlwGlyca4T8Lg2OLnMPZxry0INepgZRRwDmeP69TBnFrwROEcL+o+eY2yeK/N+zg8uT+EYOqbnXXbm3kIKaYi3hg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2606.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:44:55 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:44:55 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] libxrender: Upgrade 0.9.12 -> 0.9.13
Date: Fri, 30 Oct 2026 11:44:38 +0100
Message-ID: <20261030104439.18901-9-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
References: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: 483022e8-b04e-4262-6dce-08df3672d5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /FJiwztRWw2SBt/elcBIRW2DVgKVOqUcxoiZdopN8WBkGi5D3Znr+d79iXHje05xxchQA77zLY1nGa5oF6VnvLuEfdUJh/LcOgBmgUVcYHUKa10yo9Jtgpz0HtJ0DC9+mBNXdqfdYPUZ+Jj/vtKUpR9/YFyQT7y2SeXCo5L720NFYg8xwijOMOuUclrvRRGGa5qDt6BqJuSEpt2jUJALnem9hHvDpo1I2p/Ft8L09I+tI4S2Mci2xxOGb+hP1fH7koK6tWjKpQUX9kt2pLlPM+mz2geHtOn2/G4QNfW/uHdCLmwk5iSob9kp4DY48hM9yzAFu45jNHrh639w9tGmP7zLfrrDBx3CZxJtTQl+ZAsDm6c4U6yNytLuQV/PxmpvERoEyD2OTetE0ATfz4pjQDREXZ/Aubv+bqhfk34t87SL/JnM2jWH/SrbpORTUpTk37xZhbZnZ+7ORbtO8FJzdRbnIG2Pu7YF38ezdMUDbdwF9a/jzb+WoX5LEGkdInG/NjxC7Ya9ygPc9DndF0qxkRwi8u4kxsbKc5Yjp7IjkU+aCOjJ9w2Yz+rQ6NUujA9sPjBZoqruCVP9kjWAHKO8JGXk2zKDlDwU0lF9gqLsuVhOWRLT3GVWSyp6FvWQvmzBaNmTAQ1pb5bCz4j6cmYh7ZwyZV5yNiRIdrqFXwpMKes=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pRsL5XNv6m5JMb57Z8bzmV81/L5rW7dAG5suz4DFCPG66QuUjcdgLbbWf9K4?=
 =?us-ascii?Q?IZ0W+7LJuUaKnnSZ8YeipaKR+119uBIjx0NcoYtSkygl3giJrCTAXHOORXiB?=
 =?us-ascii?Q?foEiyquNOPdcLqUQoNVtZoggMtzRSWQzNwnjGHv/SB3IpetjRgXpL0d+IW6F?=
 =?us-ascii?Q?41jGA/vjGD2UsoEYm3pGYibbpZ6fX7MX2YlWDiX3oMNY7RsiH3rU0v3Bty0C?=
 =?us-ascii?Q?YOeczv6ca6fJGZBke4AoAGCapWOJof9XPXrcUl6nqHWmrqWi6+Tt32R1nzOl?=
 =?us-ascii?Q?g0VF1uAfOpNXeTk4VHbThExK1fE2RuGLGU/mbBK6B24+FC9GQDXZsiEQ9HLJ?=
 =?us-ascii?Q?HsbCjoHr+MlGLIhEEU1lE2tzDZF36h4zNm5J8A1r0cmel/s2TEo9EGvWZJb3?=
 =?us-ascii?Q?cJnsL9onj9RUvjgwqnY4VAYtxUc/RRv1wi5GH1q0EwywEbGscrwVBmYRM0s6?=
 =?us-ascii?Q?3g9XUup1niMCaG5e60pH01a1M8u6QzZRzht0PkOdPCZZzEqMhA7cCPPfzaBI?=
 =?us-ascii?Q?xSakPa9VRXzrh4VMtlXYF8UJ0GGayLgIe94tOITissfOXsY8AVAISRL2d62O?=
 =?us-ascii?Q?gPLeN3ffDwSy6R8N7W6egc5ZTq5eLtd6ks1ozSIiaT0J7rsw8AMehRseIPh4?=
 =?us-ascii?Q?bJdvixzeb2cFbLBQSwEunFqoYilKFGzHXq74N0WCYYcftIPBoOCMKqVpxTxs?=
 =?us-ascii?Q?RYB9iGRHao6MAsvKZYEt8bMAwbwCvb8dZ3BxdT6cr9M6ujPOvLo1xOFEcGA3?=
 =?us-ascii?Q?EF2KqxefLVki6t2qW40+CZ7eE4nJ4JhfZj7uHrJMrgGDyTFnLfOnYuqbxO/+?=
 =?us-ascii?Q?i0GI3jKcjOsG8BcVTUmcwcXHwjw4rxeUQKM2gprkib+iaIHAznit9+pxR4z3?=
 =?us-ascii?Q?+4BHuKp8rZjL9N30ORjOg66uQL7cWgwmZu9zdHe9UFqEKH2pUfYd0jf7ve0r?=
 =?us-ascii?Q?pz9fMpzHtxLo69EY6pYeD5DdpTG7Cs16BiqE0/tX5cGGuuDXgbZaqIF6Oe19?=
 =?us-ascii?Q?Ut2kAqBFHZS7RVVjcGJpr3aZlH/XeICyluhkqbNKle+c0ZNQpYBd7+W64MXF?=
 =?us-ascii?Q?08H9zqtvhtWggtwxOzwGSHUmlaCzMuTlV+B8KKhbMABhhC4gcO2X3wrZfhIS?=
 =?us-ascii?Q?aztDvJ642Oc27TmuXM+inJYImxw4mIJnx7s2dPBtVNe81KS7K6yIg+CNVdnh?=
 =?us-ascii?Q?4u/Mxt5z+Wp/iUdGSDxlYi5I8BCmCOA+y63N9KMsuJX7hpr5DpEqKvsPsV09?=
 =?us-ascii?Q?0DHnRxJzO0sjvdEcPFN3S4MHmgLhvmUFVOy3moArlvf1VlCPDQLjCo/wYErN?=
 =?us-ascii?Q?VD8/UaP1ZTX/iy1XrGi5p4gDaoD9BWtsJQqOsANsLIVlAi6fU5+J0rfsSygv?=
 =?us-ascii?Q?WTkpdgv9Pciv6eqp0u4bxTARh0ot6r+h5mpI7taaT2AnxBhIWBQFJukfQpLG?=
 =?us-ascii?Q?xO0MFIa9qdfJ3+gBM/hZ67Fg+24kPZJleWRTMXwhRIeWjlvlIXk3rSBHFeyt?=
 =?us-ascii?Q?jcB/sUUNsKcTDvWXNKcjqSiFFos7YjekCTaqxAqQipH8AWDot2XL6n/YJ2qK?=
 =?us-ascii?Q?J+UUNoK7p10/wdtO2h7Zpc/qTt8aR/xjr3yCXTX3g/bR0QZykgIJPReSAaY5?=
 =?us-ascii?Q?gEOTRpEVpENkwstABxYnLUxgQVHSsFbuT2pa/PYvCVg1tqF1o0uJAb2ZapID?=
 =?us-ascii?Q?32413oOXc+XVfCpuyjmMrkC/Hvcc5Qfy8pvuVUvjXKUDy4FlmtrepnyoRfQx?=
 =?us-ascii?Q?EJCMldpPyQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 483022e8-b04e-4262-6dce-08df3672d5b9
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:44:55.1178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThdXIJ8KKTZri4aOs5J9X9bu94rXGl+ysRPq1KL5R9Rpd2iVfxkNzdV0j98dGoMllu0USftQ+iAqaM5SN1psiXjvLbumNlzyAAuKfTIflJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249024
Content-Type: text/plain; charset="utf-8"

libXrender 0.9.13
Check numSubpixel against numScreens to avoid OOB writes (CVE-2026-88807)
gitlab CI: drop the ci-fairy check-mr job
meson: Add option to build with meson

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../xorg-lib/{libxrender_0.9.12.bb =3D> libxrender_0.9.13.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.12.bb =3D> libxrende=
r_0.9.13.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb b/meta/rec=
ipes-graphics/xorg-lib/libxrender_0.9.13.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb
rename to meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb
index e946d9dd41a..667f469e690 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb
@@ -18,5 +18,5 @@ PE =3D "1"
 XORG_PN =3D "libXrender"
=20
 BBCLASSEXTEND =3D "native nativesdk"
-SRC_URI[sha256sum] =3D "b832128da48b39c8d608224481743403ad1691bf4e554e4be9=
c174df171d1b97"
+SRC_URI[sha256sum] =3D "3fe88c609df6782e1e7af2e4de36b2563d70cd70ff7dcb1cda=
561ad64912bb64"
=20
