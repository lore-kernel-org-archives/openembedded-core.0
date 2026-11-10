Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21137.1794321319759166082
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 06:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gNCjfIq0;
 spf=pass (domain: est.tech, ip: 40.107.162.59, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBW73v1f6QQ41wmbn1pK184Ql1ZU9Ar7QkeHWAA322RKdpWW5OXtNutTbPx7UvZWW0ekfn+2pAJCqgIK7E+mhxYXBMzBerCQ4XiqvkLeohAjP+TMRbmLPzWPl3ykK2vfBn+Km5/lJ4FIMGkZyA9hWOz9QlRUTY9/9wptkszojxz3+zYRZIqX2p7CAwmhc8GHxaYmIzp9FrjTl+pBwADDVWmNAm6Z6GCyVl6JgLymQAhCcFxn4LVS5zsbwZXnSrfdx0mAxD2pVQx6A4w1mzxKlNNAdPJjlNP3eAcNV7BhoHH7tRlr1/2c5G8gUcYcrxSJS2XovG0Eetqw7M89+G+BGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3jYu6wNplwX6R37g+PJH8zW0Uw14fWNz1uElXmOgT0=;
 b=nXbSOUt8U1r2w9gxjoInXOMerU7qv72F58wSEiDppPp1Mqu0/yMASR9OeyXiJZmNwzXsy06/VEi8uLYcaL/pd02uL4bvTZ7ap4UfEcuAHAEjoWGR4myT+L4v9TsOZN6ya5hl5PUeJfKLfMenJlcpUpy4X38lOFKcLT1cboGBa+KlJabHb+eNZPYt+49/nEq+EAUSGRc49+hw7XsHatUN0N/MdMOyIRKdtUI3MD6RMYhYIydkBNVMgKJz7ZAG1TDBUQJkuqviycvzjbnvsJQcJRkhIr+Pyj5wE0+mw4E/NNWWA/x/aNzTjvnkwm2jHOquGxiKA1jKF9JQ+MUcJw2e4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3jYu6wNplwX6R37g+PJH8zW0Uw14fWNz1uElXmOgT0=;
 b=gNCjfIq03+7564Fn5pS8Sxf27TnqjHfJEg3RwzOAuZeLDSbbVzcxdvAZ/vCuIbLOP8bs1TSKBloGDuuE7ff0nnOybOkC/P2tur/zuYigDo/RvQvPHaRWD11UZ6dQAWas3O7vIblb3QY8lJbgu/chkaH7rIAWz8vyv75xDFBsnud0pBoeQ2s9jh01ZVcGbNQ+qr5Wms0qncYE2T4vIbg/hdBeXnPh0IA8kxvtKYaMSlvPEIBtJ3+yBKV86Amx2UAJeSJcOQhOgJDZgzi4fnKsdFPgZFrGwsk6NXfs4vrGp2dfHutW2vQ+L4hYEJmLSDRLZK4hptmgdoSdeN2Nhh/9RA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GVXP189MB2795.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 14:35:11 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 14:35:10 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] groff: Correct LICENSE and HOMEPAGE
Date: Tue, 10 Nov 2026 15:35:08 +0100
Message-ID: <20261110143508.81887-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CWLP123CA0259.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:1d5::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GVXP189MB2795:EE_
X-MS-Office365-Filtering-Correlation-Id: 637a74b5-4bf3-4942-4401-08df3f37d311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|18002099003|10067099003|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: IzmsHeBKym7J0d/bz/eP6soFYNdyYlsDleBvsrhUre2hRmOzF48gzyGtvLul01RekrfhTn5LGESNODMHUWaeeBrV93a69qz+ChlcJjaFJXU2QvkMTbh53u4pULwTeAlFGPWXo3wBcJpQDrSK1F2r9Vv8PLG9FUnePTusJSLMLYkxp0nN3hITQGAD0dsCwcZqzlX0h5qynfl4vg2xSIJAX6eZGq0xuoHfEh+s8LStFzyd13WJfWmW8n/oVXfrjFe7ye/F2BLtiTPS+2Vl5FwBLX/TeXUsZgRREoBtVqxlIkFCpDGCld9mLDHqNyHUxsBKbYJmO0kG8iBIYre+PF0zi1iZEBbvs/hJcSDOTBlkbiHCXm2qCOcZLNHk6UlrvTpDOidMsSGgV8psZZEQz4R3dP4Ib2EMbKCI/6Q9KerOwNSwb7LRpDCVeZOEtoYzPT2Ri/yV6G25uqJxiayV8DATjVE22dvp5YoXQqc12skbemFUWCODJCKWn0kRQDW9I2yB0pOyCdaFtZ0xS1DAYRD3frZxGv2r27BXi0rfYu/mkkckMu5aNMY4O0dll5cyn91+FWcOLOvr8Fo1bdTMneaU+OjULPFLyCSbifc7b3Czx9rsN0pusjY9wcLEA1sjvR4Ppn8lajYTgL6NlgNM1spge2jVTzQFmpvSwv1Pm0Sr2L0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(18002099003)(10067099003)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1saDgaz6A0w2s2Kj2c7uLOTkcg06MZph/zSmcZup+52FYbmToId7tZdM0v9G?=
 =?us-ascii?Q?UaoJttZPEBFNiOTtv1rRnxHwMh+3CyN8X+zkAS2z6mNR0iJFiCaFgptZFqBm?=
 =?us-ascii?Q?uZqLyg6v5kJploViygeASDa1K97PiE/+Ln7iQYiLPquuLw+JWqd+Z/00yF4B?=
 =?us-ascii?Q?QK0+a17Du5CRLyT8KSuCunruXysLO1pRhgri9z1N+HnvugjhCK/qtdLUOxQz?=
 =?us-ascii?Q?o9fe6vEwSBmC5vodpVRsZU2z+zEUlvpWAn/i22ZrNZpsmERn0p23eEDR24D+?=
 =?us-ascii?Q?AK1hLUS0QcUGppkhsJNELZXQRXDT8GZgWzj/fzoBQj1steO2O8cr9QQ+C70+?=
 =?us-ascii?Q?W9GWtucZ8uhZiBY0RlwcRDfJVZXfEQxZyL1a5iHDtQOxsV4K6fd/Bthn3JRl?=
 =?us-ascii?Q?SvHI0tb+jCqOIboCDTAL06MvmJFS3AY8sziE5sSYc7d5wtC8UIkISHMUPxD0?=
 =?us-ascii?Q?kiMi/2+Ha4YLk0d17dQVwshwvA1Q9W3qxOcKV9Bhi3aXvOIC7g24y5G6STBy?=
 =?us-ascii?Q?/WStiWyQ9V0Dpi41PMibMnWyxXgflgG4TPsHJ/2Exwh6sVeDLXvjT8Ih4ug6?=
 =?us-ascii?Q?/6kRBsJNfpm+5yb4duTIlAJMxkT/3p4eFkXmLWQGxEDzhuLY9blmrTcmu83o?=
 =?us-ascii?Q?Vm+nCGGt9CvWPExJ8eM6LGShPatZXPPl+iYnT8UuNE9k63w0EO3HAHtOxBDX?=
 =?us-ascii?Q?jSqIk6D3/3s17w9euC0bJ1ufybFoLbQ+RLyvcUuUiYriB91VvoRTmMDNO8Ih?=
 =?us-ascii?Q?1a0G7A33VD208nQ8YAeCdjRF2sM1YQKWPi2pDbFtuPiU8hBkG8Km9nhBL+sq?=
 =?us-ascii?Q?TEi2MHNMptME7+klGoBcxjrkEU8mBaAOaSXsEXzg2QlTHdtYHcFgoDs24XsE?=
 =?us-ascii?Q?NFZeDgVz/sb3zr1FvoHsPbVPSPgkP9VjG1GgUpjzCTVHZYKQelgj2FjNc4ho?=
 =?us-ascii?Q?MMTDSj0IQ0R1xiajhBF/nOvXzn7W4ye5jXFCzDdOGi2S8gB5Yu9iY7DcYzon?=
 =?us-ascii?Q?NG3FAhcFPPAlHIOgzgPVPnBhp7OwMKu8+uBI/qdXVo+4dXxaSHgip7QY4h3N?=
 =?us-ascii?Q?CMrG74oEuDfqxA/sgBCRIEDY+DTG7m6UlSWpsgzrsx1XFNqcMJOCInL+Iltd?=
 =?us-ascii?Q?8LmKHAF515aUKI76Dn3pnt20z21qht5P+A47gbJR5UIUCmDDdTGZZT7/CDDg?=
 =?us-ascii?Q?YXfYDx1WXDDy1NlkAmlG6WOWDve04u0y7xqmpnh+3AW2zFFdsCTzsBbrSRrw?=
 =?us-ascii?Q?aOwY095J91u34nOtf361cJG2iAjGHYTQ3aFpufsGutDlf1DPsmXO0X7XDtKW?=
 =?us-ascii?Q?nVw5MxX3oyRQcTl5oOQsssLVIsn57l1LnJ98FNvwYFJPChP+z+rc4ydfPzjb?=
 =?us-ascii?Q?ulYf2fvZBVcOrK+ID3xOnvW/I0DRk6YZsA8tf47yszaFCEuCoHW0P0E3DfKW?=
 =?us-ascii?Q?D/8UQgi3KFP/T+54ukJ0rXiJb6bUcHKle7pnxAGaMpMAFmTWappZl5maTefP?=
 =?us-ascii?Q?fDXuGG/jTubb/7cEL0YBWEPkCBblkv/Mp05sq9DbahU5I93+XLSt/OA+bzmR?=
 =?us-ascii?Q?8roahllW3MOv4qtVUKQYQ8bJMywp8RhL692AWaMTcAYL9sayS+CdypW3j96x?=
 =?us-ascii?Q?1tqz0MwJZGufN5nMNPR9FPi0eiLwglEjiAfVF7eJD+6U93MER8AYF89KtPGj?=
 =?us-ascii?Q?/Jxp1tbKskYqrLBi8YLachpudL4VYDPZRwtgH55X4Ei68VELYkkf6wCWa6xv?=
 =?us-ascii?Q?6ILwVlcDSnqmR0uDVpr2Y8k6+n3NU20=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 637a74b5-4bf3-4942-4401-08df3f37d311
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:35:10.7995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cepWIsE07iPf6qGRcleHKjzUNqpsLcLVJsLsnNI8XY3GxB/LtIVnef5ZnAygWwNadR1fGoxdr4YfTYN8H3R31zrwHgbPoAQjaqo158AWH0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2795
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 14:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249921
Content-Type: text/plain; charset="utf-8"

- Upstream LICENSE file explicitly mentioned
  groff is a free software project.  It is licensed under the GNU General
  Public License (GPL), version 3 or later.

- Update HOMEPAGE to use HTTPS instead of HTTP.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-extended/groff/groff_1.24.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/groff/groff_1.24.2.bb b/meta/recipes-ext=
ended/groff/groff_1.24.2.bb
index e13996500f..213b94b866 100644
--- a/meta/recipes-extended/groff/groff_1.24.2.bb
+++ b/meta/recipes-extended/groff/groff_1.24.2.bb
@@ -2,8 +2,8 @@ SUMMARY =3D "GNU Troff software"
 DESCRIPTION =3D "The groff (GNU troff) software is a typesetting package w=
hich reads plain text mixed with \
 formatting commands and produces formatted output."
 SECTION =3D "base"
-HOMEPAGE =3D "http://www.gnu.org/software/groff/"
-LICENSE =3D "GPL-3.0-only"
+HOMEPAGE =3D "https://www.gnu.org/software/groff/"
+LICENSE =3D "GPL-3.0-or-later"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e44046=
4"
=20
