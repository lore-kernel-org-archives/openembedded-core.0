Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14003.1795777374160616251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 03:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZzTY8lVQ;
 spf=pass (domain: est.tech, ip: 52.101.72.14, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYRKUZu9zxmKRoPS5AxjQdvThROdf0STdtNjCkMo8Mw6iWZr5+91ZCFtQtskeMWAJhhODdJqjIgrNd3MpJn9+D6I0wTe3wJ8fC038HXU3y7Esp4BdXCMSvEd+iTk2ikftRwDGfiQ66FrEmC1hD2Qt1F+lRPIKltwBLDt1nInQ8c/FrB+VVtS5kIfmZudyG2dxVhnxx5mxnCYg0IWYtFcNGdBeNCoLUQGvTbO/mjeYBWAS8iCRKW/Yi4O3K+EJhbxz5ZHhbZgdeBRXzmlCv5wL926Jue40XCDGMn2hh4UqL6AanB2wSYunamr9M/9PL6TksWmNtOZNOqnCtdhxvN58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAxxejhqrIPOn2EnyLZtnPwjrAjn+zzFqLuK6z/bag0=;
 b=lctfM6xXQylzOmSUZtAIIKaA2lbmPjGyiqdGYDhIVxgaOCPvc42ebfMReO8pOiv7rdMiGTsqf+jVgfswJbtBEf/QkSu85r/bwQSlrsogKUZsxxEsdpYliUB/SbzKA+qZPFSdQQwBrbpTUJEmmIYjGYeXEtCxTt76athnLQHjFx7fSrtpZKtgHpJ8e9FGHz6a5+ILI8d20sxrtMNSlKwvLo6qkCq6CRjBojnm3zwrTb62tz5eILjApZya7YlKgsCLyWbqKNBX8GPS+BIck2hczpY3fKtmwZCu9yuq1TcLHMEiDGOFCG56qHW+YjkZmFJPlpHw5xoeEcek1Q002aslhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAxxejhqrIPOn2EnyLZtnPwjrAjn+zzFqLuK6z/bag0=;
 b=ZzTY8lVQyFdVAHZo/bbtbBUi1LiOio9YUfouwr6DchSL/w7nXNHZ7n1/ZSiQM9QMNIEVVLLasNeh+mov4oZ+Hg809baS5xf6WDoyKmxVl98zFZ/81E+N/EgUlPIwB9bQlUeKjgRDacHg3vS+ld+iNyhgRd8izwH1+9t4Cr4KuyK5iU29lZpPbG13vQEFnGkdfK8wAl+CGhbmon+6XnkC6o8M+TssM1NZmXpt4Pca3c3JlEMVx4g4fSptpf2OJ1zF/nQJofoCyh/5tWpgLOrHmq+NwDqhKQlGXVrtbAKNe5QEo/kz5gHnB10tRmkyAkcYxrQjE8i24e9eYPw2JjT2zQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2539.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:643::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 11:02:48 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 11:02:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] blueprint-compiler: Update release branch
Date: Fri, 27 Nov 2026 12:02:44 +0100
Message-ID: <20261127110246.512-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0312.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2539:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c4e816-d48e-4ff8-0fec-08df4c75f912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|261009221227099003|261009223027099003|18002099003|3023799007|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: T9eVbqtbPoGWdpx7MBXbZehayjJfY7vQHk+unrufBpn8hcoDkwFGdJJ8d2X+koMgJMsqnjD7BgvXrFq24Uk24q0+hxvTYneL2l3ibHSC3HZmEM1g7orf74jx/KmOMmfZ3vjGAqBbk9uhc4oH+9K5fC8zfHdEls9i98NOvC2ysSBXRsQCYJ2k70CfZ/FkZiC8FQdjTxxKEKUUIEm3+VuysT5RC+gGhAYn+01xObdl7D/pUogPrhNHw3fEHhq+55U/Se9plTNeCf7PQkKTAhR9Lk5ryYo26gLYnNOos7nMzhBw/4lhbUxv8lpBhwG/LPkKL+JBfawzlx9IMIAq/H60Z3Y0yDDBFv7Ksc8i8liPu/tkqoCjLNfnNX3H9HNGMj7odfit41phMEy6+tm1A+pfQPQjP7jycfV8T64nrL7qfhU5GkifcLtnlfFRyVAs48WOzH7lnXs+RXhyS1mvSwfzP5bLo7CUIIDevNCwrXxvbmHLqqDcLzqwMVjxNp+DtOGAU1PXtefM4N7AKevmEBCA97PE4A+N12aUYWUIqv9PAUEl7J2kL17H/wtIDX0vlOPFAk3BBNHf7VCo9kTiLAbkQLTZ0vzxHEUsSV/YULv2YrRKHAB2Bug/xyc6qI2WrOMW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(261009221227099003)(261009223027099003)(18002099003)(3023799007)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eKyz6YAQC2Pdo/G9IXHqa64IIqnvLbnKZUSq95wZ4JoZLsM7TUKUHpEO84Zq?=
 =?us-ascii?Q?6Rrxjfk3JJgilKoNdSXkET4L/hxCp+Pf5neHWo2H1uu2CiegZu0DTl/Gf6qv?=
 =?us-ascii?Q?k62pWUo5Iz44ibc823hNFG5z7Snklfz/W/L5EEBnSyzNHGUHU2M9WxOsm9gR?=
 =?us-ascii?Q?LXEDawxPi+4ah9H4miTlGpyGtxJ4sWWsh9xtbzGD27NTalLfZh/4t3n7LoPp?=
 =?us-ascii?Q?qaJV/C4mPbFsDWhqzQAi2usEqUAkUblC9erOck9QjqW5bx0L7d//ZTmsDapv?=
 =?us-ascii?Q?ru9Bj3LuU1D3i9Unka2fKzrUbisUR/G3jV8Giqy/HwUqKHY2/W29RdWdx/Tg?=
 =?us-ascii?Q?dea7SrXUfAqG91RpKlxs/gEKk7rQTDOvrFm5k4JXUHac1VZqbJFxI4/DVPQK?=
 =?us-ascii?Q?mGCh940HUSptv8KSJ/r9nk9xQhOwKY25islUFUxvVQg4R8bg8vpi+4e8NQ9j?=
 =?us-ascii?Q?3O1vxnWrP6me1jDZTbZDtNuFMl6wT4jSsMxLS7ikEoOEdipXbN67ihvYGUyg?=
 =?us-ascii?Q?JT3LhDZIY02xFJg/RWDgTtyWr9V29CHA1OboglqdgSPAyeeI+8iniir24Ebg?=
 =?us-ascii?Q?VvT5y9zvOHgAT5QgR1jf0WxOF+pnSGg4Dk6fQpJnk/c50EJO/3HNJk4/Fcn7?=
 =?us-ascii?Q?DjAwzEbwM7of1mUdBa637pxnassYicek7l2B1HIvWx9ieySMAN5ESKgsfCMS?=
 =?us-ascii?Q?dr1EJEgGb4tiE6YGqLnSqL4/hlO7866nMpY8Zd1bte+fhQ8qkSdE+ebfoX8a?=
 =?us-ascii?Q?6oK0j9OlvBQU3pkFplCuxH4BSxN6l75MVGDx+9PTRXw1pGdVGhm99tieLVN3?=
 =?us-ascii?Q?4T1exWjbIvkWnV69H/xh61s9U+31YyJ2GdrnGVfBUhAequ6E207W7jMKdOpb?=
 =?us-ascii?Q?LqY+uxLg6xE/ZkcwGuT917xDx+5ze6uULjgzkiIt9z4N63a1HPrhmxQclKyT?=
 =?us-ascii?Q?bFl9xDmhd/bCx5ETJsc9HKrhbFvVJhljB615/aO9/JbDErROMI5HueOCLKxU?=
 =?us-ascii?Q?IICrwI7tV3GFesENlGnlEGTxWyftCZtJistkp6K3tvUGdklo5tYoyScljGMk?=
 =?us-ascii?Q?Sjrp5mewR4PnR4AR8O48G+YiBu/UsJYyfRDtplJZ0YSt+LjpfYwJoE5Qetfl?=
 =?us-ascii?Q?zl7L5LgVhNEuQ31LxHXFL9EGjz+xpGkqc/6T1XOwUcbhZgO0OOiUPryWHRkq?=
 =?us-ascii?Q?rZdmLJHPo3SmzRFKc8kPXrKNFaMpn/rEBABEJmK2OGdDJE+UkSM95BbC5gzQ?=
 =?us-ascii?Q?P+cd1RZurZ9ABE0Apz/RM1QrKQcd0AbeT/nHeMxf507HKoKLTaXTse2+l/wG?=
 =?us-ascii?Q?ecuzVANA8YpMZP8glomkb+rbcGnZrDIW3gSiUSLy2pCpIXupZPio/cW0OPNB?=
 =?us-ascii?Q?tZDC1ZsmSXXrIpPH5TIhU0L7S+jraebzO8UTOljqOJJo43CPPh1xOpZ5Mt0w?=
 =?us-ascii?Q?WrYk0ho3Be4UL3x6aFFyIbs0gcExvY9gTuHzj77nQDKZIbak6ebcoWoumhP0?=
 =?us-ascii?Q?hHufLF+ap6U+01RyahAOAyGRYHZs+5dw1gBUzSeU1bynQytvWdGkHpXQmkR0?=
 =?us-ascii?Q?gX9Z5AfNXMV7xr1aGBIKzsgwEwW7pJox2w3kibgBloL5P1RPnGhmcoajd+Lk?=
 =?us-ascii?Q?BaTMMXsRpWAyCOqYtyxpJZ7F3ZsYT8tOU/OBFGmh8m2fWPeXAyEiuyDVlqoZ?=
 =?us-ascii?Q?MsoGmOhgZS9/CJ+vk29qqeQ7WJzUGxufVvxnShAFNdcewL5exVkXVu7GlQBm?=
 =?us-ascii?Q?3hI3vydwNA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c4e816-d48e-4ff8-0fec-08df4c75f912
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:02:48.5463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npPJrOHkSB6vOU2S3/raly14sueRiId0E4nSZL/raxoJ2l+cqbQcP41U+uQG6L6KxINYNz+RjPK81TKZB4/qRIYVQ86oycT8wdKpGOcXPy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2539
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 11:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251372
Content-Type: text/plain; charset="utf-8"

Previously release tag has no branch and now upstream added to release bran=
ch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../blueprint-compiler/blueprint-compiler_0.22.2.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.22.=
2.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.22.2.bb
index 7b8204769d9..a9e271f6ad1 100644
--- a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.22.2.bb
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.22.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/blueprint-comp=
iler"
 LICENSE =3D "LGPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec061b899bce1d9ce940=
4"
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=3Dht=
tps;nobranch=3D1;tag=3Dv${PV}"
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=3Dht=
tps;branch=3Dblueprint-0-22;tag=3Dv${PV}"
 SRCREV =3D "ed35ac74de0c1bb1f5e852410b97edd1f08904c9"
=20
 inherit meson pkgconfig python3-dir gobject-introspection-data
