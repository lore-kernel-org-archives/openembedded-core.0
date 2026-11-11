Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7335.1794396272438301399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 03:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=nHnrxK0N;
 spf=pass (domain: est.tech, ip: 40.107.162.11, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krlsA7SiJPezunVJt/QAdGVa7DydHdkNoxS9fwiXogp5Rx8uNJKQYVzkmw4r4cpDV26BJrMa2MsmflRcUmcF/WE+3kvhu1h24Vp5WSVzUxHWqDrs8KIQX4NMRpfmhOSniIC+8lDQ67NQ0vj17Y+M63/z+imyWZY5YDVa5IQWMdiKDGuJibPvMw0dA1rcIB1ZIVr9yfgYlBvoCdw+9mwPM/Bx3nBQZW9fRmWFu1PIyEgh+SoCS0wnt0c9QF04TK9K/XlD+qNC5bF35iZEo94RSdyMF0XVJB8rFiTt/e6NjRvNxlYI6SM14jbj9OongPeEAFrjBY0RRj2UMXPfnzL9IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAbGUnsG6XKw3kdRb+jOY16sf6rKkUqx45TYYHfdO8c=;
 b=BdnfP/jsMnR/LkLz/9d1MZUzoMb58ro10Ls7DPggIRC4XT6KSmdn3UHb2U5AVTjHUiwaQBAm/irDSnE7Y31Hu60TKse5zo0b+mLA80dzRvA7chp8xFqPTygwT2KuxqrXNzTrNALc+xEe9ShHsAC9ncEMX71sKTCpka90kPg7EBJBi9ZDyKAUtWgbza2RdUNCZe//MdQFNSv6qM0HlbDj8R+7SHC0eW18zoPfuf6zw6EJy2uZWn1J0esqT/YAkeuYgyQUmhMtrgO+fne1gky2nlYPZNSHIBbU5rCsBcFJ+9oAo3y9nAwiS6Axxa+oJlnHWgEJVMkg9xh3fvZRdNRrlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAbGUnsG6XKw3kdRb+jOY16sf6rKkUqx45TYYHfdO8c=;
 b=nHnrxK0N/3Q6IheJVe0TkZ+062fEpWWM5nOkX9/MLyxajwXte1aYRdMkxJRoW8Lg6Vs8QrRbJsmO/uJy82YEcMvI9ChAY9PbkMWyTXuWIZwKfsgiiNMUWuzFdiVLF49SW5P0ZqE0MWZOpaW0midFAoTvf9fiop9AI/hveV10eQYKe1DxIKDv3GH1nyvIfDXns1M+StLGbLyNnHOqETrmnEd+Ml6VyO+7rwZwCC3lPYW6e6MfJpGk9dpdUDE3kIycmDS8/HK4KqcnnThDyo0w/ZrkX+oI9IYw2EojgqZu08CqNKTFzYxnt/xN51p5/ZWibrbIx9GjnXE7gYyR4oE1hg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3204.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 11:24:30 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 11:24:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] libcomps: upgrade 0.1.24 -> 0.1.25
Date: Wed, 11 Nov 2026 12:24:22 +0100
Message-ID: <20261111112426.85977-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111112426.85977-1-jaipaul.cheernam@est.tech>
References: <20261111112426.85977-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR05CA0018.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::23) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3204:EE_
X-MS-Office365-Filtering-Correlation-Id: 6721f988-1623-48ad-67cc-08df3fe65a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|260925021911599003|261102123227099003|260925021311599003|260925022911599003|261022105027099003|11063799006|56012099006|261021121427099003|10067099003|261021123027099003|261028144727099003|261026140227099003|261026121527099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: IxdQsd6WV5G9AuHcRtTjrCqX+niUQjibDTHtJWAB6tgp0AGUfrTlNaW6lVgh3ebFmRFh/bOrXSXr12hz93Pg/2E6kHdtlkHOGTCN066D76tQvgbtvCfW3UL6gXh4CS/svzdLhwI/0x59w0CZG3L18Z83cJOXoEhqhrbYyc9WawoFSP0UBr+8HyXbb1NC38TSdEn2M/RU8ay9KUcmMCDkspoomba6u1Fq/JT86lPu3dPesbUCrskJZKFuX4wA6mAYgnTKop6cgRL4w1VCllBEHP89OmhP5krRYTgrDAy7hFmJKq4WTrqVwQLZxQ0UGW9MjQPw+FmaJL5reFbSB4XSwM+cBtvL/TL6VEWPreCkWmNzVIXHm0sJhmlgbKrym+YDrjVejeB/5cRfkGdJH2roE6ZerJP8kvIvjhA5/Z7N0BZM3cL5Yr2mSHSLPLVLhmII6gvAVZYlfsk3JlexDjm1IM8J3f/ZnceLSFj8+OGBlHTcdiINOFiZggoQLxGeHuAfE99+QsW6hjr+c7iwq3LwOTBBTvZzyCzkNT7caBEgnaPxkWuS7KL3Lkq5ItPijDAmvlO3RwUX4izPGUeHi6phtFHe3G1mcy2wRHuI1yjKRw04bLwtrpI6o6T9dH2xk9DJ6mwGrVfJ7G2LjRuG+UCM1IeRb70siXOu4QRmINMKoJg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(260925021911599003)(261102123227099003)(260925021311599003)(260925022911599003)(261022105027099003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261021123027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/svhv2DL/q4ZXY/kSLKR9qnuG8TcB0nUEU/kY5Vyjjo8lxH0qY5bMAbYakdk?=
 =?us-ascii?Q?BSY2TqUeMv8kqBXToiIIMzMkuccuKJhydpjfn4MVB99m/Awqzu2ogAxJJLwz?=
 =?us-ascii?Q?qUgUVVzehwzG9n5Zs6pRqaTzG0THK5TRjSSsA5D4N09F8iBrmjK81vlRnYNi?=
 =?us-ascii?Q?Dz6M4XqFDpvUybuONxZ7x/m6+RhOYsTVb1MDbxmBbuZFOlKKOeZIBEiTaFfj?=
 =?us-ascii?Q?LMcVMbnU6KsI5lhKN/OK6XXwAmAif8JyLhMHr4LDHp4j7EeYokEkrmKCtHum?=
 =?us-ascii?Q?nUsnc0sNNG/AiaPL+DCnTq9/LHxCGP/sEoKpunBrd/uLoqQtzGjyE8ftFKXy?=
 =?us-ascii?Q?jZbJ3nYkUf+hVcegFxkepvRDa6KGGjUSz1f/XpzYN8JzyEJUQMRzRt0UnQxE?=
 =?us-ascii?Q?4rQbHpA0vBzrLVbhzyH5X3eikOvxZybFOsd1yYbetyM5taQk8CtVdGnw9Xkk?=
 =?us-ascii?Q?LU1SeZRS1DvrIxNO7suERK/taasDntz4cO1IZ9v9h6+Wp6lIUXVX5sMqgevD?=
 =?us-ascii?Q?G+jWb22Csp3kK/njGR5+JBkVM9xWpeJEctcMO1glimQzq7FNQP99gK4ytRDF?=
 =?us-ascii?Q?8xfewCMd+maisSJkUlNQo+GBH9hAeWfVv8bzEeGs5ZT4nrevtaJT79GO5AFj?=
 =?us-ascii?Q?YpvhnwmmfT5oMqsIvKiTdYGNNYzpzCV1sF127XPlQFmECvNS2n3G386y/eI8?=
 =?us-ascii?Q?9YX0dXrUGWbTZIZq7gsJKa8PZIPxHKhqF7pMYpo8wOVu0rom0kLZXOhyNb7u?=
 =?us-ascii?Q?c6QmUWHQ7LAlyP8BshFkfIhA/QT3n21Eu4MAOE7+TU/xsJ/n+K2S2MhEayIz?=
 =?us-ascii?Q?/WfGLLqByZe5vNN8na4VM84R68LMICZ/7qYMxRh7Is8Z7+Notu/icpGz3+o0?=
 =?us-ascii?Q?ihr12K2HGb5wtr5TeQMsenEgQjnjBo9DjnyGMjKZEQevpOZ/1i+EP0zl+e8z?=
 =?us-ascii?Q?h/JphfFP4Iai4mREvXEfMRF73ylkeHRxCJ1jSYfLTTV0ReB8eNw6tSQuW1en?=
 =?us-ascii?Q?SPwHT6YqKLA1qDJPxhAgNP25nX59Quy9npj5a/OInjbDTVQ76z+SMgAsGTZr?=
 =?us-ascii?Q?YHzBNhn5a7CM3HlYy40UfGw/mZjvEzWg3JfnT9jlQ0atjGkxp0T3uNjof5Uo?=
 =?us-ascii?Q?9T4r1UxH9kpYEvQr4IU0P/X+v+wmR5LY1AI2jnAxumNgScU+zLaJ13RD7NdF?=
 =?us-ascii?Q?3zTg/GFMf55ZbHQo6S/H2wrCgQHlGoyBHrOW5T3yKJG1DHcne756Znofmwe/?=
 =?us-ascii?Q?AET8SIaf0m6EQkgdDdHirUSVEUux+5gvfH7ejdARsKGC4VXjrh8gnQFoHEEo?=
 =?us-ascii?Q?6VmfIm0qrSIDA4wxG+65yeDdLxVEoTI/pkhzszG9n6XRCbwz31rM9CAagCdk?=
 =?us-ascii?Q?xw9RpSTtQueqoEPB+6a3/XqdEUAhYnPJN5GPJbOAD6NSPyWzpID13jBK1/bK?=
 =?us-ascii?Q?BDuk1HgRyx2KjwCIYNE28PBSznyX/dQAEI3MZeR4eAN1BqPuJ19HzOoIoYiM?=
 =?us-ascii?Q?3gMNFYdlsN6aybXJhnxi9GjLLL3M+10CZh5aZUG/oKKsX9F//Dj8DWZTLW/2?=
 =?us-ascii?Q?CBH9ir3L5vC92vqwWKxtrkK26yLMk2zKi+7h5AltMfi95T0GDXmm1ODSI0hC?=
 =?us-ascii?Q?SqNQizGCSG2jayNCofifOyCxL8551fiH9n4aVhTbRze6EYnIPXiZg58H0fOl?=
 =?us-ascii?Q?3w/cYYdAfjd6iDTLbQ6HK4rCIxBS3U4UJhaSsOVzwtIvoF8ZVM/mttGwpb6J?=
 =?us-ascii?Q?wt+OPHjKFw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6721f988-1623-48ad-67cc-08df3fe65a3b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 11:24:29.9779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fwNloP1Hv92+XyAIKwpT7JVgbv0ADb069AqinPZV0IKISw4LAPyvDI6dOktwAYu8nVNOdqBf8CNl1o/pX/aXQswYfze5UFzLycBBK3FtZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250017
Content-Type: text/plain; charset="utf-8"

Release 0.1.25
Fix explicit basearchonly=3Dfalse serialization
Fix comparison of COMPS_ObjMRTree values
Fix double free after comps_objmrtree_copy_shallow()
Count values set on inner nodes of COMPS_ObjRTree
Do not write empty arch/package attributes for blacklist and whiteout
Fix values of multi-value radix trees after a node split
Keep the item count when copying COMPS_ObjRTree
Fix COMPS_HSList tail pointer in comps_hslist_prepend()
Run all Python tests from run_tests.sh
Use the real element name for <optionlist> in parser messages
Decrement the item count in comps_objrtree_unset()
Fix memory leak in radix tree values_walk functions
Make radix tree set functions reentrant
Fix crash when copying a COMPS_ObjMDict
Fix COMPS_OBJECT_DESTROY() called on a wrong address
Clear node data in rtree/brtree unset without a data destructor
Remove debug output from comps_mrtree_unset() and comps_brtree_unset()
Run the Python binding tests in the pytest target
Fix crash on empty display_order, uservisible and biarchonly elements
Fix NULL pointer dereference in comps_parse_validate_dtd()
Fix undefined behaviour of isspace() on non-ASCII text
Fix inverted cleanup in comps_parse_parsed_init()
Initialize COMPS_Elem.ancestor
Fix reference leak on a repeated <display_order> element
Check the result of XML_ParserCreate()
Fix NULL pointer dereference on nested <comps> element
Fix Python bindings build with Python < 3.11
Mirror the changes made to createrepo_c
Configure packit to use caret notation for postrelease snapshots
fix: correct typos in README and test files
fix: avoid `%u` when dealing with signed variables in `printf`
fix: use `%u` when dealing with unsigned variabnles in `printf`

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ot-set-PYTHON_INSTALL_DIR-by-running-python.patch | 12 ++++++------
 .../{libcomps_0.1.24.bb =3D> libcomps_0.1.25.bb}       |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.24.bb =3D> libcomps_0.=
1.25.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON=
_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libco=
mps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 6fc0a4177f3..9e5e99be26c 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTAL=
L_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTAL=
L_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 159ad0e19f4c5d7fe357378c00db19c1106e62c4 Mon Sep 17 00:00:00 2001
+From 04c89e1af497514b6b7023620962cfb97e752cc9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:22:09 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
@@ -10,15 +10,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/=
src/CMakeLists.txt
-index d22b84e..ad67309 100644
+index 6d3d4c0..396c725 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
-@@ -85,7 +85,7 @@ IF (SKBUILD)
-     INSTALL(FILES libcomps/__init__.py DESTINATION libcomps/src/python/sr=
c/libcomps)
-     INSTALL(TARGETS pycomps LIBRARY DESTINATION libcomps/src/python/src/l=
ibcomps)
+@@ -78,7 +78,7 @@ IF (SKBUILD)
+     INSTALL(FILES libcomps/__init__.py DESTINATION libcomps)
+     INSTALL(TARGETS pycomps LIBRARY DESTINATION libcomps)
  ELSE ()
 -    EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdo=
ut; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTP=
UT_VARIABLE PYTHON_INSTALL_DIR)
 +    #EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import std=
out; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUT=
PUT_VARIABLE PYTHON_INSTALL_DIR)
 =20
      INSTALL(FILES ${pycomps_SRCDIR}/libcomps/__init__.py DESTINATION ${PY=
THON_INSTALL_DIR}/libcomps)
-     #INSTALL(FILES ${pycomps_SRCDIR}/tests/__test.py DESTINATION
+     INSTALL (TARGETS pycomps LIBRARY DESTINATION ${PYTHON_INSTALL_DIR}/li=
bcomps)
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.24.bb b/meta/recip=
es-devtools/libcomps/libcomps_0.1.25.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.24.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.25.bb
index c26fc71b3b4..47bcd078a1e 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.24.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.25.bb
@@ -8,7 +8,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/libco=
mps.git;branch=3Dmaster;t
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.pat=
ch \
            "
=20
-SRCREV =3D "8d439dd015d4c6f637e64e1160201345883138e9"
+SRCREV =3D "08340d1783f3b1f064fa08264b5d25706e3bb7ea"
=20
 inherit cmake setuptools3-base
=20
