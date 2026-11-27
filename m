Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17738.1795793018053585980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=or9qBMjh;
 spf=pass (domain: est.tech, ip: 52.101.70.59, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiiuWmCv8h90Xr1hVf3xqNL8UF0KMkpP16BVAjG3RwxvLC/Cppi2toasxAc/BV/8Xwq8IHHqlLc4RE0HTNzw/tocN3tzD0u85uJkz4/ONrzLZNy3dGsujmsrz0c8PoRdLuai6D8S+vh4pKSUkyz4odFBSqQLA1n9fQXP/iU+vqqRjXCklisWmR3rRHLDLmkiDg0PV4klD9DyDlVN0P5NqwDdtEFD604jBGAT2hAvmQY4jfHNbzsc2s4/xV7Lhir1xVDrmSsvs/jR1RJ07ZnADFpX2HX2t4dT/GcadlA9Rrzlq1VZUJ/7XE32qwOY4yaEAFIHQqwUAmgFytlS3Lj6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yF+DJ2GJQdGx0nCnNFExx89Gq/Rh6l4CYL/aQh09mc=;
 b=oUml4pQ2FfC5QLWdWjC7t2trL8WPujedgqd6qvm/VSG172JYPR5+K6hFYVDl+6+XWrE0l38JGL3u9zY7Q7K1TN+5QEbUjVfp/wuG51kBjKOphZ6QZCr+IxkDVdwVu1Dyv6EF6bwyuCYRybBKc+jJuYyHOFbpe6cUgLbBEHedAlg/51+MSjFrrRmcjMAfI73etcqNB67sZLXD2rogUwzqHVLFxiBj7rEqU3IpaftF2GpAatkN3lQZI6pZA2qdZ8NW4W7tSkFf3+gUtuaXmXG9iBVzOfRn3FZ7AC6q801XqvZuX0xhGeXg7sikKgEp29Hqmt/GakOWV3KxrlnehgxG5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yF+DJ2GJQdGx0nCnNFExx89Gq/Rh6l4CYL/aQh09mc=;
 b=or9qBMjhnEhyaPAOsPKwY9pC8RAoRvriA18zJ/J7CgogVWOuia0hY1V1Ic4sCNY5E9hue1cED6pXUvxZs+U4vIhLw9XVpCzpDpVYm2IfdUPMyhK0x5Tl12qXwiQO3X6vnfKY5TQSoCV3wgZjN/gnAxK0pD9JjTNPZcsRNqRHfrjzETJuCV8JsIayen043Mfyyug46PVZqW2XANPkExNVL0ul/6CBUOiK4yvbjBCzXYU/t7cyPjBTkBXjd22UpPiWnz1UyvDCKJMY+saZpTilv+8cYsJrm+vRUOtCRx5Lgk9mGplwSDiDCxY8A3E2fjtN4637sd3vY3gfAWaFzwLqZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0834.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 15:23:34 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:23:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libxfont2: upgrade 2.0.9 -> 2.0.10
Date: Fri, 27 Nov 2026 16:23:31 +0100
Message-ID: <20261127152331.5349-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261119141333.34492-3-jaipaul.cheernam@est.tech>
References: <20261119141333.34492-3-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0195.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::26) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0834:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5f71fa-4d6c-4818-8e1f-08df4c9a664c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|5023799004|261009223027099003|18002099003|22082099003|260925022911599003|260925021311599003|260925021911599003|10067099003|56012099006|261102123227099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: q2OqEZSu5s83afWVbdZBu7ZuBqJzyrSpmASr5J/H2CctFK+8g9w+xvfg10B61haXSZ43skIToYGUxTKnRHg95fGSLmTL5IGs8wIXJGsiqDXb4YTvgHhkFI053MYJtbFRTK90+Ll+nu/DsKwav/HF+P97bkGs2LudZsY8JrJz4o7mbhM77gPQDaSHC1mELj5HEjFtrASudRf0vPlX6sgHrTHLpaYKs052Rv/eh65kW0L8wu1wsXLe5W8TPfBOc3x513vfQ5nfjtbSvUWBNiqLTGNdLdwuYViVLKFEjlkXqYXe11K7tRCDG4t10MadBytftQ7APrb8QT2NrLhOPPgCH3XYldo01n2uQYNho068n1gEg8o0VTGa2zhIWHq1pKWaNICc51eiIH9mcozdGgaOp+GeexDWLrzMCW4lSZvgt601ziRwgjJmrbYpIYDUTBvQtn6NGXegjL8niV/7PcXZo4JhmBEHYbyaWj/0NqeXrzcoy2NHYPYV3/vEPwIVDqTyRxWt3zLcS8ZU2hHziYzJBurlPKrgoeaRXbKHIpMo3PpkUR+QgqQaqZ/4Vc5JJ5MbWA0Oj+qnyoLQHuVNNjuN7/nVlL6Jy5WHm3Xh4QrK/zg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(5023799004)(261009223027099003)(18002099003)(22082099003)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(56012099006)(261102123227099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4SRVKbxYXceH2Nko7JyL2/cMi0S2j4gyunStlL84z8TfJCnNhqm88tHR6w1N?=
 =?us-ascii?Q?gxTp+68PtdFh/stL87+C066d+ftbTql5ctJPvdFgNL9YJc8gyuCpY0fpwKy2?=
 =?us-ascii?Q?00HDWLCdU/6vA0F6ricMOVv1dgvy0Dpu0d1X4+5qQu0Ap7VeikSuqkULSn0+?=
 =?us-ascii?Q?dzL3uzH5d0Br29WHGR/aRq01ClBZVcB8jvm0FFQXjVHoFKN1LGllAA0YXwpr?=
 =?us-ascii?Q?q2n9qGR4SjgNfWRFFhXF0h2FkLjQ88MYhnB3ABS8Tvavn4BdQNj9i4virRlz?=
 =?us-ascii?Q?VsCGMlSyypWhy5H9B02Q2BjogdW5ikJTmsiVV/Lgl0DGsEHk+KbetVUtgwHr?=
 =?us-ascii?Q?TViXNWSGjUHCMqlRLamU0CNjkSjsPTJOxzKxRShECF9R7u4hxcSupFR0MZmn?=
 =?us-ascii?Q?sBM1HZWZe8YpICOGkrmtQAFrQa4pjXtrMG7AFwGb2k2QZa9dXKlte+RDFPu/?=
 =?us-ascii?Q?Zns/tyQXawdk3Z1Ie+12fo0XUmylzChRe4ZEdpGExZorx8gjQV0/k6ttGkug?=
 =?us-ascii?Q?rX26xBi6PQyD0eFVtGQWAVjOfWY6OrBF0qx8ETHQvK8Un5WjlQti/m0H2nFN?=
 =?us-ascii?Q?YWnaY7fCdjOVXEjvNA/SYZn0FFh2bxbTK/iP6KFW6cAPf6j8iDAeRWuNqqvz?=
 =?us-ascii?Q?Mmd6+VLHuN3BnTYTCrqI5kp26ScVkmZKeaWXRZ01A2dAvkDRSta+4SJaQptw?=
 =?us-ascii?Q?nvaTr+5UmvfD/gS5tU6bv+kryh8FyK1R0EgVSE/I03fwU0DbZ89Z/LVdzooe?=
 =?us-ascii?Q?1HZ7N7Na82lQln5gCH14jBM0R789gU2Ggd4Z8xVXmOAMQp2S2swyVchi80qU?=
 =?us-ascii?Q?RT7CU7LAe2ySn8lGQY4JcpkIyHTXBfXLghXZl4bgro2Kuma6ovUhAswrSMsD?=
 =?us-ascii?Q?Fq5WhdPJ0FUkI3EH6qK0Wdzz4EpBU4JCnWoECE8VsNUGw7kn0VeLvDuB8RB9?=
 =?us-ascii?Q?UfybIO8+xmqI9pP5X5zYhknoc/sNVIMAKqkBbadDyT07gEiyL/8LIR9V7jRW?=
 =?us-ascii?Q?dzzhHg9H6W6sb9lQ3EH/p0Sdo+ufuj9PWfBlyac/iYSp3HHh0wmJpN0zrpnv?=
 =?us-ascii?Q?SFkYu4fj6VZbryh+KC58iOtCsdqwvAx3wHckoh4vIvjRiiYiRvylgRpZcWfX?=
 =?us-ascii?Q?kiAwdMXNLz0J/Wf5iS8OVbamh45MuJpca4UEMB8bIlycuw3uGzT9c5OX8Tis?=
 =?us-ascii?Q?KHPlf40e5JZpd6lUk21zxNuqpKh6zyrIqSy+o1ENpRMyCmEsdU/xT2RXdtTd?=
 =?us-ascii?Q?BKmE5/KIyWdSw78gcC+czhHiT06Gh0ORcVoUyv+SQpg8HBf+h4rqSePat01j?=
 =?us-ascii?Q?cb70M9M0rSPXSGkNHepbC8sGIF1sNQ2lQAG/neJOVV/qzfvjb4ZT7QBUIEhR?=
 =?us-ascii?Q?jnkfu3IJrFTuTJ+eRkieUzIhlFdduW1kvn8v3g/v9RLPcPilqydyKc+ue0aT?=
 =?us-ascii?Q?YgetBGOFm+6crnFEatqJLSniatea8ZMLWIEZMUP6m4DeI+9ad0E3e0HE3A8e?=
 =?us-ascii?Q?XvqMR4IkLX0VNCwKAXH9o4o9Ot0aCum8R+J20dn0B5+h0AGUXGZyqM8DBu1x?=
 =?us-ascii?Q?CGnyir4bWf0MmMDtPicp2pHXCEF4XHQTLBvvle8+DH7f7YF+pPYPfg96G33+?=
 =?us-ascii?Q?/VJGfMuUlgXR5ohwHx1NGd/s6G632/sgCO0J4eKWre3KnfBHS4vPgzYJcLpv?=
 =?us-ascii?Q?2PkL9YHxLSJVMS/mxU+Tr5H0s+hEzaCesKvBA9sFAewsWkAa5lTFalQAiMM1?=
 =?us-ascii?Q?QqxT/ZzVzw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5f71fa-4d6c-4818-8e1f-08df4c9a664c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:23:33.6681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfQ8bIcI/FAXwjA1hs8m0zZHyEZh40qIpgxphutwze1SBfRJOfXpHNMYU0EhnRzEObOiUTnz5j4FFWOu5nwqiIrErV17mhHhpqPTwJWTd+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0834
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 15:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251398
Content-Type: text/plain; charset="utf-8"

libXfont2 2.0.10
FreeType: always initialise strike_index
bufio,pcf: reject negative skip count in BufFileRawSkip
Remove support for SNF
license: complete the XFree86 License

CVE fixes: CVE-2026-109909, CVE-2026-109920 as per [2]

License-Update: The gunzip.c block in COPYING is now the full XFree86
License 1.0 text [1]. gunzip.c has no copyright notice of its own, so
upstream applies the XFree86 default license to it [3]. The XFree86
block has no acknowledgment clause, so it is not XFree86-1.1. SPDX has
no 1.0 ID, and the text matches X11 apart from the licensor name.
So, LICENSE in recipe is unchanged

[1] https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/1531de719edf7=
4ad76f21f0afcd94db450c65cce
[2] https://seclists.org/oss-sec/2026/q4/763
[3] https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/37

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
- Update clarification on License-Update

 .../xorg-lib/{libxfont2_2.0.9.bb =3D> libxfont2_2.0.10.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.9.bb =3D> libxfont2_2=
.0.10.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb b/meta/recip=
es-graphics/xorg-lib/libxfont2_2.0.10.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.10.bb
index 18e822aebd1..752c94743cd 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.10.bb
@@ -7,7 +7,7 @@ such as freetype)."
 require xorg-lib-common.inc
=20
 LICENSE =3D "BSD-2-Clause AND BSD-4-Clause-UC AND MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da5d1388c9d40be70dbad35fa440443f=
7"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D26bd56a601ea26e1f38a72471dbfa56=
1"
=20
 DEPENDS +=3D "freetype xtrans xorgproto libfontenc zlib"
=20
@@ -15,7 +15,7 @@ XORG_PN =3D "libXfont2"
=20
 BBCLASSEXTEND =3D "native"
=20
-SRC_URI[sha256sum] =3D "f042a370666815e7b941e9b7019024755bd1c6c2954afbfa51=
5af378251799e2"
+SRC_URI[sha256sum] =3D "cef1f4ad9cd69f439bb1ac484bdc8f9d7f8e70215b92d8ca86=
b96e31513e5f9c"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
