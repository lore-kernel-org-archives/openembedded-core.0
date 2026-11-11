Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7494.1794396278315459600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 03:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jwvfh/Kc;
 spf=pass (domain: est.tech, ip: 52.101.84.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJoNpSuAynN9rktAl1bxqXEGhvAEb1toHvYsbXMQ5bwExv/inkpVZbKznAVbKcBiCLannVoNaj0PCuZ+QEhLQtKRZpdo9RD06weTcZb+a8VOiOK5tpjnu1dZZEJud+W+nrSkDxrbQvM7UEFCvygQpEXpv7hzAS66at1pTD2Ijo5ppBdesOqbOhQPpKDUNt/hyAV56lF16Fva9XE1IRKrS/C7sIY8iya/tZU+t1QrV59srhuWRbNBKVcDQOgKGlc3puKKgn4Z3cGGjl0i211oO67tZSB75+HX0rACorcaR5EyfD1FlVyeYcP9SfH9LxjLKDapciLvXcLBW4IyM8GvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFh/wz6sDefIz/2ZRRlZzA5vFhMPxEH3zHdFVLSDofc=;
 b=sGCMR5hIwPmu95TYrsQBgR1jAB+nT4Xq9jPbvTzkwkBMh0T4G4CgGNA8wm8OaFDk2KbwCnKniTmskxDTG8ORliy6EQSOj5389RA1oiBVdPF9Zwm8Ggl+2rHABA622r6frD4l2YUyL/dltcoK8wOYNd9m+xgfn7PNOo9u9vnkP9dTBxyAtKY5op0roIBJC1e8/KNDaBWerEfKivX/dICFSoBIvXXPoHxTKOMfnzFnPP019UHtp1MvCVrYZ5J5NGrB12QekV/nbFdNe7bZAHyveLr/xopL3AacsAIlgYp+BwOQRrMBlV4OdfNWypTlCA9A1JFGIEAxBJIJsKyh1C8FcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFh/wz6sDefIz/2ZRRlZzA5vFhMPxEH3zHdFVLSDofc=;
 b=jwvfh/KclJMWWuwMCdBxAhainKYqA7FmwWUXbXRJGXcgF/rHq8QVg9r9Dk+koe2gNimwL7KwXa1YTo+h9Z6x3XIJrFjplh8jm2WQZM83t8BZY7JowdDwsKdKiBalzYV5BlpCofFEOwKg9ZVA3oSyOve1q8fejTg9XPRe8k8ayPI9OJoHfT1jkvZhht921PjzgqFNUf62NhF1cf/dcfOsEZI+SEOxNgkmQ2NCvXgVfCfwgd/xD4AlgpJtO9Vj9eniiFMxO2iv4RSK2ipkfKH6M5jV8fNbsTJnSBjtD6AoVk1rwMoo3l3PKR63Uu8iYu1MEy6h3BbdhfSnCQLVUyNapw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3204.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 11:24:35 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 11:24:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] appstream: upgrade 1.2.1 -> 1.2.3
Date: Wed, 11 Nov 2026 12:24:25 +0100
Message-ID: <20261111112426.85977-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111112426.85977-1-jaipaul.cheernam@est.tech>
References: <20261111112426.85977-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3204:EE_
X-MS-Office365-Filtering-Correlation-Id: 604b0030-f75f-4ad0-e144-08df3fe65cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|261102123227099003|261022105027099003|11063799006|56012099006|261021121427099003|10067099003|261022075727099003|261022113327099003|261021123027099003|261028144727099003|261026140227099003|261026121527099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: NQskZUfSpy5Oh7KcVmfTfSgTghMyeF06D8/H32JRUaylpjZTAKCXlZ9VpxgjX5E0S3qoHjlmcoVRFrHwNccIvxpy0R5VuLbk9WKNogy93MXbN30FNObgA3EGPUqTXggwzWW8L4iZyNWxUF7qc9YvMKfYwz7CmVWWxEvmxZ6Ya036y1Gg86QAY1k4DM9JqYrHct75HTsX6uGMmnS/D0d93V4GXYEyhSbqKDzm0P3ElEwgrFB8MJqvpfm3+PCj1Ey6gHWXoFEASH48GNzyhFvTjBFd8XBN2WzMKXH7K2dGHfDs2dVa0LFMXwZwcEC4xJDakYj4LX0eRdruwQtJH7zyvWGLbApU43GSBEhFEH/EhbEqj5vVjvDVAIYlofdNRFafvKAGwOGcDzRQi45JHkIJCitknxQ5yHeq/sJQStYPpSDhnkvpfUz3zIAXsd5mRcEQ7v8+6C2t93IUg4kp08WJPCuYMPkijH7CUk+LTvpcnQnzUbzT9nd3uO6W7vNr/xWBrxIj5xMl1m/DmiUAV77SF6BMUd2dr6byplLFI4fgG41NnCm0INj+9xOMZVFvnW12wEO455XyhN5ViC4LfDkVT/MzzrZ8iJp/WUFGvMKEhKG5ziMYxq6FwoeVKOoFzwLN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261102123227099003)(261022105027099003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261022075727099003)(261022113327099003)(261021123027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nOynLBHJxpJhksaYAFei0wcE1XoKoqYMHz9Us/mS6qtNScB1u3w2H0bPoSS+?=
 =?us-ascii?Q?P+sBeZOauyKrC5qYtZlTd3RjVSKYh7rqaKE739WJUAK5+KVkWTlw8VheErEX?=
 =?us-ascii?Q?DYFn+Er6LGuDSCm6lUJ9QGoyo4Q6bUSDl5WJ6bzZAyfrBhP9Xpy7MZ8ZZ5HF?=
 =?us-ascii?Q?JV5Q/PkGv5hZK/Boymo3v58k7SBpKDOj/3wYSte5HyqPMsfJD5HfAVbSRVi/?=
 =?us-ascii?Q?/ppdg2rd/ggas4Rtp7uv04bCQhLjGOT2R/u3vVFP00ebWBf5aQOo4dQ4kOGg?=
 =?us-ascii?Q?v02bfqaQH6YUD8IxVpimRjBJYp4Mx38xaCOnmtPXPOixEeOHVML3NIGyEvj4?=
 =?us-ascii?Q?ZG3fjh7hvTIwOBD4rNkMQCWdpjGCZEz0mVEvy6vqZ6/cGhMVo7/o3HTV2nZr?=
 =?us-ascii?Q?nTYTygm6GulIcX0/gkqaxo0cgDoMnRmpuYGLU3RAyBZ236hADJPbdtJeE8c1?=
 =?us-ascii?Q?xTSA3OdLWSqovrgYCSMOU6vgIH7WRrN0eacLyAmIK14FPnbNsqL618oKVSB8?=
 =?us-ascii?Q?BLgOMYg3r00XkZA3F0WDQCmVzNeeD0m9UbyHcQA0Oq3GTlNfZfmMKLZu3wSF?=
 =?us-ascii?Q?tUIbL3SQ9+WMqLwkXYDkWrocA92iZaQgyFqjTKfMQoI3GpXFjr+MOOOd168s?=
 =?us-ascii?Q?tCBgck4J8zFSARu4VMSGaRuD2/XnJTCdsTA+QswLGtovtBZWUP90FAPxl425?=
 =?us-ascii?Q?IZbrnX6nUzNDp77xqYVIyqDJFvnfkjIuYTDFyX5BrRnXrBiefSBOyZu4Ybtj?=
 =?us-ascii?Q?REgIyeIkUU9dZRfrwhLlPFyjcUk/d9fAbOjnZMOK2oi2HOp58IYerNqQq9cJ?=
 =?us-ascii?Q?FGMHZ9+DAwVOJQOr8EGl7fOS46IQ2P4jb4F4ouTtrVgH9o09tjJa8WHi9PN7?=
 =?us-ascii?Q?CHNYV1jnNlOiRe9F4u61bJuZdAC1z0GUj0wutKs9xMLQkHftkJK0I93PH6r6?=
 =?us-ascii?Q?SBLDxMS6czGuc4Ab64Z3ooGP1Gn7GAjeDJckWMzDYYW+T1CdUwzTMiyJe6M9?=
 =?us-ascii?Q?StZozLynfGQANLV5dabgKDu/MlFVHRmYRag1u4aSnGThJD0zTRmfL7SO4noG?=
 =?us-ascii?Q?XbTWM0LJ47/YDzeHVxIxpcazsLm+D//AKLZlnfcg5X3sh/xLqRm7MMinUAT4?=
 =?us-ascii?Q?DmHcrQmXv70ymhm8d1HPazZzXhMl9ABHh7w/qcTfAsx+8ZTGrz2IQgn1xLV4?=
 =?us-ascii?Q?CL4dkRFKygvkplVBRgj/5FlBZh6+dRe1i0tKTpBmXPsWRopTXvOoa92k0dRI?=
 =?us-ascii?Q?mVAH5ntP10mNpRtE02FpEajhmgPW4REGr1EASfW7/VCriWtHziw2+HdzXD35?=
 =?us-ascii?Q?s5mI8ZnWM2ySb+lKCYoOLdVGk0fg8e0i/aGsoA2lPN0jJiVg69OMBXvF84Q2?=
 =?us-ascii?Q?ADZ3eeYZWPsFeEineeovMpu1OgEft9/iWBXqRHPaRhW1FAqkJvhPWCxjIlcn?=
 =?us-ascii?Q?5SXb7WzHWhW6944rK9LxOUgyyeswAGacLMwOhPgYYp2JzA2G7IEzBK/A/wba?=
 =?us-ascii?Q?deypAG0YCYXT6Bb2vPVUKZWhzbNfgqiz18rwSMuzq4pVwGaUhxcPULbiwQrw?=
 =?us-ascii?Q?HZQzGqurh/R7P2GXaWZGH0IWHMUkZc8Y8ZwL5j3hk4EN39DwCnZPNh7BLcWx?=
 =?us-ascii?Q?2fvrB3lvDKOqu40xEzcBFTAmF93rtNYfnNdrld5XqfJVK9rRKDkucQbWp3PN?=
 =?us-ascii?Q?gOhjygRrgDAFR/Gl82pX+SLg4qg+5xqpJa3WnzzuoPDJpB4sxhUePDv8HCCD?=
 =?us-ascii?Q?vui3nrmj5A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 604b0030-f75f-4ad0-e144-08df3fe65cfe
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 11:24:34.6236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaQ/xldTLxzQxHmNz23VGVDeKYtF4ri0UbE7CpJpvZSqGE9IyCdfvH6whoYDq3Rk6C1yVbUaYd5L8u9nULs7vp2LvRu0zjtMwkImQTem+cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250020
Content-Type: text/plain; charset="utf-8"

NEWS: https://github.com/ximion/appstream/blob/v1.2.3/NEWS

Version 1.2.3
~~~~~~~~~~~~
Released: 2026-11-10

Features:
 * search: Make fulltext token search a bit more space and time-efficient
 * xml: Leave out translations we don't need while parsing
 * Reduce allocations in as_locale_is_compatible
 * Avoid some needless copying and folding when writing the cache
 * stemmer: Cache stems in-memory instead of recreating them every time

Bugfixes:
 * release: Don't drop catalog descriptions when reading other translations
 * cache: Do not free a the GError we propagate to the caller
 * Reject loading bundles that do not have an explicit type
 * compose: Actually add the bundle of a unit to its components
 * meson: compose: Run the pkgconf file fixup in the global build root
 * bundle: Add back support for Limba
 * yaml: Handle translated screenshot media like the XML reader does
 * Split words properly when tokenizing values with + or -
 * Validate incoming locale strings more strictly before passing them on
 * compose: Reject Qt locale with non-POSIX names
 * compose: Fix potential crashes when encounterim bad QM translations
 * cli: Fix not used `--datapath` option
 * cli: Make --no-cache work and reject a bad --datapath

Miscellaneous:
 * Move locale-related code into its own unit

Contributors:
 Alexander Vanhee, LeeJiEun, Matthias Klumpp, Vladimir Romanov

Version 1.2.2
~~~~~~~~~~~~
Released: 2026-10-28

Features:
 * content-rating: Add attribute titles and group descriptions
 * pool: Allow adding extra data locations with explicit scope and origin
 * ascli: sysinfo: Print some more information about the OS, like its suppo=
rt period
 * bundle: Drop Limba, add Manifold

Bugfixes:
 * cli: Fail YAML validation for missing input
 * compose: Fix build on a newer kernel with an old glibc
 * pool: Work around all Flatpak origins having the same name
 * pool: Include scope in metadata cache keys for Flatpak
 * apt: Don't hang when tar emits lots of stderr output
 * its: Support MetaInfo files that use the specification's namespace
 * system-info: Don't prefix an OS ID that already is rDNS
 * sysinfo: Also replace `-` with `_` at `dns_to_rdns` function

Contributors:
 Eugenio Depalo, Florian Leander Singer, Matthias Klumpp, Vladimir Romanov

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch    | 6 +++---
 ...x-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 4 ++--
 .../appstream/{appstream_1.2.1.bb =3D> appstream_1.2.3.bb}    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.2.1.bb =3D> appstream_1=
.2.3.bb} (95%)

diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-=
tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt=
-tests.patch
index 5f35a8bf230..b1993f58c2d 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.p=
atch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.p=
atch
@@ -1,4 +1,4 @@
-From 1110cb5c658de30c63642929c1128ab4f9b9b98e Mon Sep 17 00:00:00 2001
+From bdf11270cdd510f119a8be42cad3d417e9aa0072 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -23,10 +23,10 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 2 deletions(-)
=20
 diff --git a/qt/meson.build b/qt/meson.build
-index 488fe60b61c0..83c2715c5fe7 100644
+index 1837c97..131aaef 100644
 --- a/qt/meson.build
 +++ b/qt/meson.build
-@@ -144,5 +144,3 @@ install_data (
+@@ -148,5 +148,3 @@ install_data (
      join_paths(meson.current_build_dir(), 'AppStreamQtConfigVersion.cmake=
'),
      install_dir: join_paths(get_option('libdir'), 'cmake', 'AppStreamQt')
  )
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREF=
IX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream=
/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index 3774bfa7c61..06196f76392 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-=
in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-=
in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From b8d73820cdb685089c0f805c7ca8163b21a78acd Mon Sep 17 00:00:00 2001
+From 393214ea44d02eb83cb186c3864764206727bd39 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmak=
e.in
@@ -39,7 +39,7 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/qt/cmake/AppStreamQtConfig.cmake.in b/qt/cmake/AppStreamQtCon=
fig.cmake.in
-index 63df65f25676..5ab2d0ec7bd3 100644
+index 63df65f..5ab2d0e 100644
 --- a/qt/cmake/AppStreamQtConfig.cmake.in
 +++ b/qt/cmake/AppStreamQtConfig.cmake.in
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-support/appstream/appstream_1.2.1.bb b/meta/recip=
es-support/appstream/appstream_1.2.3.bb
similarity index 95%
rename from meta/recipes-support/appstream/appstream_1.2.1.bb
rename to meta/recipes-support/appstream/appstream_1.2.3.bb
index fcfc1aea6cc..84e5791e650 100644
--- a/meta/recipes-support/appstream/appstream_1.2.1.bb
+++ b/meta/recipes-support/appstream/appstream_1.2.3.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "https://www.freedesktop.org/software/appstre=
am/releases/AppStream-${P
            file://0002-Do-not-build-qt-tests.patch \
            file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfi=
g.patch \
            "
-SRC_URI[sha256sum] =3D "7df664fd3ad3b1640c6a0ff77fa84f9fabe264111bf1fe8f5d=
f3444d6d4caaca"
+SRC_URI[sha256sum] =3D "8daa01a4d66c73f036aa92af9bf76abfe8408eaa76fcda6ca5=
4fa8ef5b93ed17"
=20
 S =3D "${UNPACKDIR}/AppStream-${PV}"
=20
