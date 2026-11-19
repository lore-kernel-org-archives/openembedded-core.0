Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15436.1795097621061115589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 06:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GCK55d85;
 spf=pass (domain: est.tech, ip: 52.101.65.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i91nHgLZlJWjkEH3oB0JiHqNP7DaOw6b9v+cIVzjomQ6F8wNUfKoOFufthM2E6o88PhpqS66oQaRNhSt9XDR14NkOAreTIIs762JHn1ttn8ZKRsuo33wVV2qnQYe/2fwXmW5m6NH57PXwQBwneKdtzVnK7XX/a6iaIDKH7GYoKnwz2j8QeDqJcZVui6JmttdN4hMiP5kNjTM08WdUgVVlF8eWdvtgNLS+iBXWLbNvnE8ZgkJEVI+5yDttcjBa9eyt0DNZDY6VkYiZ8rHulnxlh2gFkJ33qfBABecjSGsZd785eGsGwdjKWZaTKKhlaLXjln+wGGK9NdK541ruMCuvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIX2SdHMHNW+Jc4nUvzALdyiPfCYBVAZ/PYy5iopxmc=;
 b=C3By4YmWJranvPW6E58xwc4OGpQriIy1qwfs9CKcrtdiZk+9SBRvDR+3EeKtTFOwzogwvwBmRlpBhEc/tSGA5HFc3zZtoiG2jsLPJ8PPr9eUdvlgoOEIotYXCmrqfdF3d+3YhTLMLxZR7uPsMGzWn0EtXs0D/EwzDwTl0BplKdbQT9v5vuS4dlWBAIXuWaHs+yJ/XgnlcBDpxZpPeq119mGYwc3/H3tbfOdTROdjp0CnoW/1CtxWIswWCz8+mo3bjtJnVJefZ4oALjOguIbeetrXqt3h9LaBMNyJz/5bbF6JJC5h1/f03ptrKW91AomJa/qYQ0IILwornjHGdXcVxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIX2SdHMHNW+Jc4nUvzALdyiPfCYBVAZ/PYy5iopxmc=;
 b=GCK55d85pwGGXMl6YdS/3yviuGVnJ96Xrwsl1lmL/TtpCU1EiabUsDTWxqZ6UXoXu00m41k8txQd2t1oeNFbK4D6F7sD+MUj8rhJpc+xMG0+VWUHQfqNuPElJsyn629L9jAMIxWephsTotwTB8wsQkl6b5RbZqZIKUT7ZA+bmKs5R7tiOoSR+A2UV4eK9JfEKmiyxkB9EU4VSYlFiLQkKKGeZ/N1Wyn9gQLeLBnbDCT4CP+lwAfacELvGDr4Xzs5O8uHfIhPzskoV//JKgRRufYjETOON1A1lnL//SWkdXw6DvSYSzXYVllz56jPRGWSjKEqHGykST0H0cmxg8YjfA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2785.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:13:39 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 14:13:39 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] libxfont2: upgrade 2.0.9 -> 2.0.10
Date: Thu, 19 Nov 2026 15:13:28 +0100
Message-ID: <20261119141333.34492-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2785:EE_
X-MS-Office365-Filtering-Correlation-Id: 1674cd79-0b43-4c8b-7017-08df46474eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|11063799006|260925021311599003|260925022911599003|260925021911599003|56012099006|261102123227099003|261026140227099003|261021121427099003|261022105027099003|261028144727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: CzWmxMOG+e7HF95S+esTk/MZV+aBwsgqUVAltwA1iM9wRz0BC5QZFGnLHHhDLwW0X7eeQv4kDMj390YnDHTxha0uM3/qJVOA6ZgOO4AvGq0P1jvVq/nJiPAtleRiudhxPgKCN/0JxZG7ajpHwkYR15Y1QSSeMSyrURBB7jGkkm3VaiTYc5j+Uu3yUvGlWlGFHm8NmOtqjMiCRSPpunFwptl8z/EOFaTxnne4ILK/1Gbm+uHaZHes5WXuCGo9Q7Ag2/pc1ngyiWztPMRbA4q8lmrIqq00Hc7fjA2V/ECGctYrNHjuzOaIuaxNG1U5O+vsZCrNRVpz0JEflN14S3gGwZyWvzRViVO6pYJXZ0RPwZiqtP5flHlRZGndnRlfBq01zxb0K0N4+LCb86ZD3xBPrfSIY6H33esTuWCsPfxbWJRr+iKph2QiJxsMA5+dhgU0X+SJuASVy5yX9V00YPFtCFzONMpHyqSvP5kLgZtKyAhHftIjH85uB7Z63t6UkA4fTasxJBuViPdK24c9xwj9U+9X4w5CD6hTeNzX7StqhKDt6TDsjbdfOz+Na6zlAn3EGyvvyEzdRU+8CaLOL2ZMOLUVn8ePMnhBh0U6HgomQW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(261102123227099003)(261026140227099003)(261021121427099003)(261022105027099003)(261028144727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X6WrHMtdkyLPDthwlPmt2bX7aXW9QFVhtOIRE2Bsr9gbCMNmJkgoToQmxOcf?=
 =?us-ascii?Q?BnUD9hFHBScnAMIFuKDYEg6+dOLpN+JFVohx4eBUHRoTlGe5oeUciiOvS3mS?=
 =?us-ascii?Q?oaSV/i5hcGdtzRNf5zDvQu6qFChuRXKoo4grIuNyPlkM7PPDSSO2mW70iXXF?=
 =?us-ascii?Q?2beSky/ttnZdNQbCp9qXcRwP3k6wgosXE+sQH5g3pP2hJYUqdulPDbTbmUTv?=
 =?us-ascii?Q?7gzrzxTQFitvntoiCrNIDDmOzUHq5aA/SfC7o075AcerYMT/UR/8WbVxzuna?=
 =?us-ascii?Q?75hjZcopBy7XGe/AJo8Nog7Ztbj3tE2m0hq44Iu8am9nVy0wciHxdZOyo8Nk?=
 =?us-ascii?Q?L7mNflQrMLgkDiQZxTALflYXY3nV/+Sa0oDamnZ5liVxVdWHPSKgLDE0V4Gv?=
 =?us-ascii?Q?YmcngYOsxnuSGmguA7P5Pq9iMq1KfeOSuMd2MG0tbFQsRsoKeMxutXNvGEVc?=
 =?us-ascii?Q?2DqLizTBikYbSLJrYTpeNAU8TFrTp8/Y59wdZdlt/YjMo0d94xNNHhRebQBq?=
 =?us-ascii?Q?+X7eU0UbsCdPjLhQDuYMl+7EvdEfo5xwrWe8ZkZuf5e6Hzli+Vum5GvtlXJA?=
 =?us-ascii?Q?m/fak5tVjr+qwcU4JZOsrNZ3Sw52WFB4mnT4IDIeRLMEiUA6lErg0I0ImC3C?=
 =?us-ascii?Q?ZdIGdW9rUdGnNrZch8hhuRkGHBjzrft6USYhA13H5plDrmSb6lfqeRGuN7ed?=
 =?us-ascii?Q?n6Xg9zjaq0IBoR6TfR9uvkh41KYoMH3Aw1h9jr+lcI2KFTDC83voEdOqxKeR?=
 =?us-ascii?Q?JzGpjnTj4xnU2c0r2dInHSxoeTyBbFzHIIWfm4pkms5yZurRKyPcbYDjnhHS?=
 =?us-ascii?Q?VHTkZQjs0c2C/7tZ1KjSxnJx2OEmOjwhkZsbAjO7fjY7/6xKhrtPp+6miAzG?=
 =?us-ascii?Q?mj34gP1yq+xWWMfS2sHoBgHqJ7+wh5RjpzzDUCFPSizgnqrWzKHH8kK+Xf1r?=
 =?us-ascii?Q?YCVOGOb2v2laa0RfwyjGH/wjjTJtcPpJ0JeyyoEvV+9BTyl9rSellN8VqUiz?=
 =?us-ascii?Q?FyE+qjHgAHPKecVJmcZLvmAjRk8vAVrg70WDfeIDFqY/4Mmt/oSYb7Nrb99V?=
 =?us-ascii?Q?3gw4+4CNdFEq9YQbZyLKMk1I+De7l7DGRS66I24bagENJzjwnVHCCSgHRmM3?=
 =?us-ascii?Q?9x8jGuGz3tYxqT3FA4ELiQZTrOXIeGmM5FDpeMycbUvZZiVW5QYOJsWYA3zV?=
 =?us-ascii?Q?Ac14UWCLzGU0P3TkcujAL0tkS3WVwchmANUPZXoTjccOsrlNbgwXxdPgZvv/?=
 =?us-ascii?Q?7k82W493hg3F28oohp60hRBKFkFYkbsym0iH0eV37IMxNQyxpZy4JoNIDHvB?=
 =?us-ascii?Q?8Hn/TQq3yKppwlRbjEklp8JC9NGo/VkvC0NomBON6yeENmtVh0FVhgDEYI+O?=
 =?us-ascii?Q?hFKuzTHAMGpU4cq7tN+edZJl4t1qsGAs4H37Oy/AuxTpxME7lYsQnE/dv+Vh?=
 =?us-ascii?Q?dTsKQEvZMUrGakOYkoXV0O9s//5s/gDxW/Rxqd+Az9D+6FPHo96TPgAytiIL?=
 =?us-ascii?Q?QXYRRxFlStF8fOQW3YspyPqTg2wxO5KG4mMeCSDiTVmjGzo/Iptswhm0DGTU?=
 =?us-ascii?Q?kbbg0dZvEGvpDuwqSoGwhmlRBAHrEYHk6k4pws4jnGzj9rco68AJRsVPZ7WE?=
 =?us-ascii?Q?quZY5NaNAmi0htCItXtuwPI/MN/RYtNiRwTfxIU7LNLHn9VGtU/apgnqu/mx?=
 =?us-ascii?Q?BmVaBc8r/5oUrwyINEgrVnSIuoz6HJIa+DSsjUXv+yywm/pDvqTATz9sNeND?=
 =?us-ascii?Q?MN4a4j0LVQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1674cd79-0b43-4c8b-7017-08df46474eeb
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:13:39.1977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYye0rHyJBCMQWqQN/a+e7/EHDk3tBD69N31xqRFr6GRsbFi5sRPwNo+2qtZbk1XjuHHHZEvZ6+oWo2HbMxwTLZVIkSPtqjuvg9d+jaS6o4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 14:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250674
Content-Type: text/plain; charset="utf-8"

libXfont2 2.0.10
FreeType: always initialise strike_index
bufio,pcf: reject negative skip count in BufFileRawSkip
Remove support for SNF
license: complete the XFree86 License

CVE fixes: CVE-2026-109909, CVE-2026-109920 as per [2]

License-Update: Update License text [1]

[1] https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/1531de719edf7=
4ad76f21f0afcd94db450c65cce
[2] https://seclists.org/oss-sec/2026/q4/763

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
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
