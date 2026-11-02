Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8234.1793606913428460224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 00:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=K04Y2AXc;
 spf=pass (domain: est.tech, ip: 52.101.70.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVX+Mh4G7pXYk3UHqYC+hG0hbXw7rwYlwe0ER9bu0Zo0wwI/r9wMiqealYW0kmGrqck00Y9BDEdCLpF5/tBSP9OhWRNtjDuO2g9hE0fvy3ohAaTdtdqO+doNuCsj/X6ujBcF3tJBtRYAvcXba+s2SsR4aNxG5ViSYAH3giYXFoni3/jsQEXHvRWQBKnR/a2MiUjs435InA+7lsuYn4iHqNWqWERujLhbYfR/QrFNjZrIzyiUoBuWYu+qErid7gMepjfxSjGa3jCC62O+OasIX+EY6RLU4i5KwnWyozMgUnJ+4o/T4dB2lA4XwT+Ir30pgwG1BPiIFfGH5+oF9Akzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDkoUfsQVM/ha0H4wGF1GvBvdybS4QlekT8AA8JTCRc=;
 b=MnTU0rLZ/ssMiun7KgTRCRaSfpDFDECnnp6WrplcB4OkkjjxEXCT631LCyFvFmwp7uQ5JLYbt9v4EcKpIa2utHg3Qn3g4+hyRTzZRQW+Z+ZwL6qBOwHwDyEKYosy+3DFOF9tidMja5n2ThQjEfR309PC2MjJJ4FSzCYCSjCnZmQK4xSEB2YtHIh3lXDjszW1BGxWyvdO+9KpEobgir41PYo1t0Due2/uvSa+gBMr0/W8p/uUsRO89xFiW6/AFFCuRFAIHGw2cYatGEXdNYbgdwi7LrKqI2RrLvIrbMtDYM22v2VmSN/W2i0urak77egrttnlpnxn4kT+WASs5jfc0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDkoUfsQVM/ha0H4wGF1GvBvdybS4QlekT8AA8JTCRc=;
 b=K04Y2AXczJRq02siHbHxf/eWvNQqqdWkoVGvuoY6mhpmxni3KGx1Q4eM1Pv4Jr8D5v5Ipn/rpd1y3oggtj9kdMKwdNJhaOMf798RkwtVXRdZNljjDOCxvSaRYFodbxibXcjLG8SDipP9YU/6Zbu2Y4Dg3ciciI2gwNoMUjAgMNlWKcOc0p/efHdWZPEPAWzwgXonZ9k/BA/MvHQX9FPx+jyq6y8u2iuruaMNnGVs5JN/WU4BvCBFzzN4IV8Cm8KaD0dvBsUkMW4KBktb26/+Fv1mZwpvDRGerg0erVTu1sohfL8kFobKKf+GYyfPvpX1zYlOO1QTn3rnFRi1Ixzg4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2290.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 08:08:29 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 08:08:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 2/3] python3-dbus: Upgrade 1.4.0 -> 1.5.1
Date: Mon,  2 Nov 2026 09:08:22 +0100
Message-ID: <20261102080823.31025-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261102080823.31025-1-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261102080823.31025-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0301.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2290:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6752c9-1a8f-43d3-980f-08df38b87a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|9063799003|6133799003|10067099003|22082099003|12006099003|18002099003|56012099006|11063799006|4143699003|261021135927099003|261021123027099003|261021121427099003|261026140227099003|261022105027099003|261022075727099003|261026121527099003|261009223027099003|261028144727099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: uQ7TLF+o7VEFL+X4HdKqrFObLtwIrB/HP3vsMgOSm/6T3iNCFzqbiSW6kgLrNeClrRVUI96IfllqbYMuuR/gkxNcM426e61PhH2Hgqx+mmS8uKkJDxT5gi0pDjUWbj+lOoM5VePgAy7kdmByYbD5w0B5sKGN/LPf4+V6IQHOzq91QMj7qhkqgSsDjU4Zf8aEnW9z3EihOtO3SEe7XFbPlzDSM3qW7qT1Ky6QZhEvRBNT6D1Ao/sIVnAhIPJxlVGbAiNdIGIUbs/vaC3xkpFFhQseE8ggpY536B4mdtUBkGtmvIbfPA1225Jzy2Bklf2gcyArZK6gJu/j0I6+6epGMtoiQ1bU1u9Wro3BJ2CzYTasyjkiE5nlsiUlXz11IzZft5SV1/FdxwxwRL2y7gRBlaVOD5MVbkBeEC3S0/Dkh3cSN4wiOp1DiIoUsoP05UGpZL1it0VKfQ3KSTBa/lhDRMlOUGUmL9xWq2hnYR+RAZIozV7u79aYtEkicHXNMZgZ/3J1ruCY//Oel9DgRSNEjo9OPJ7DS5kpHptelu5BtpUB4NgUltVspclMTaxZDKDvxaXaqxhp8XF7IdLDOlq8MgK1MYRf9+/7LKOEwnE8T4Jlvya2tULkx0RbC8N5JEYm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(9063799003)(6133799003)(10067099003)(22082099003)(12006099003)(18002099003)(56012099006)(11063799006)(4143699003)(261021135927099003)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261009223027099003)(261028144727099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5qBwrLuurbY2eDBHmOf3pjs2CK08B223G3xOLgimVx6WWtiSSdDQu3k8hNcb?=
 =?us-ascii?Q?iWWQU4WF9RgsbcaNdb366uNEOudr//FB19IEs0bWIRguXPqYPhYb7yqUxTYj?=
 =?us-ascii?Q?KzozeS1JXDwSyUCEx5yTV8VUf7ku6dAVDlu15ogGMg2McCozrmaNiJUN/NES?=
 =?us-ascii?Q?208weYz7vZO72h/xT1yeLGnYAJtJXXVhfM7QcN9U64ebRtiCAcLW5BTt7ero?=
 =?us-ascii?Q?9AOwU9M/p3WamPupLSEj36zaYblJRzRB/G1KsrQrBor66y9vHVwVtKJAYOGH?=
 =?us-ascii?Q?GKlHdLRx+UmTdyUVZdPLzUscV/3/+Q3vK5irvGI/EeKjv27buyppo9/smrjE?=
 =?us-ascii?Q?d3Dwa1vOLMgayzwfNfQriTvGpM1wLgifhKS2QI5CE9tZX8EhSe6ie7j+2cI6?=
 =?us-ascii?Q?L4vDOYmn/fzWBPRdsbuvX/p4VQcJdmY50ey9zzixCbFhTaSXy1hXNF0QtCRT?=
 =?us-ascii?Q?ye25qd1FNQQKDTMPkXvZRp/hLGR+51fOJ9xkV0zJXDm4/o0z/Fo83OtL5Oex?=
 =?us-ascii?Q?yj65ddJrIOpFD10dnEH6QWl4t+cFaDoEW6rpMkT/hHqTHl6/u+xu/JBaiiPB?=
 =?us-ascii?Q?k7XfOWAv4tT8U6syLhZeLSL42dt8AnBzPIsPAgQX7NyWH5v4O6lUq6MtvhLV?=
 =?us-ascii?Q?vTMbPe1qjeYYc2GlRc97pI5sXSh7y9pR6gBNbM8/O3WxQ4ipFIG2Fcv730ZT?=
 =?us-ascii?Q?mlNqL7UH8ivxBg3AQqxTOHRCZaQsseG21oj3X88G58Bce2SyQ0yAJ/u4mvwB?=
 =?us-ascii?Q?6DejknWpG6bW0qRFuprBaue+dwG2ePisHJJjEegrNohxIyI/KoEEILqWrp39?=
 =?us-ascii?Q?7khLEYPDUJfKn/oKrZUO9D8Fl2kIr68w71bVzoSrl5BaiSlqugDMy722FbBb?=
 =?us-ascii?Q?zp2aezFGUEoj1o0TD5LSyL+5glWx7dvfokX0XP1SADn5HNQ0geyyexBUYYIj?=
 =?us-ascii?Q?M0+5Bxlwaz/i6Eeqn24X+ju3HSHGyaQbm3cQovQ/klI+cC6AVRmejWC8J9P1?=
 =?us-ascii?Q?T8naDqhqSXm1wXfwHsu6iPfS8CFq8njMdj6hKOQtfbHeI+FonkXSSktrbDkq?=
 =?us-ascii?Q?+G3BVuGOYszzMIBr8QOhaYcqp2JfNyqnrkP1dkzhwOv2BBHothwT6yrJD4iv?=
 =?us-ascii?Q?VFlv4epPbLlMWlSxlVtbYdIRWS2o12diUlh6meaJQibLjgi/rJKb3jL6QYMm?=
 =?us-ascii?Q?6IgP6MnM5ghOE2tGo2N3+RsUOnhx9ZzchCnQC4+JHo7BrLqPyIizRM+vUZAx?=
 =?us-ascii?Q?6Lo1fsrkUYglBAkFwW7TjhLSxIihW5UsWsvIchrgheQPH+6G74/5mz6yEG/T?=
 =?us-ascii?Q?RS0CYhtkEm0T2IlDXq/hgL+cvcJhxO4DKuuh6g+BPktxs42SFN6xE7VqLG4j?=
 =?us-ascii?Q?sx/E+Z3JUkKYwTkkHOAqnVkywIWEnLvNx1TGocitSC/sb0ewNnxmoco+XiHt?=
 =?us-ascii?Q?MmIWOdZSnzfdMmtooMTknf083h+coWmCPg3MQ9eXdNevP+dHwE7DpPeE7Qmw?=
 =?us-ascii?Q?F3mvLzlmXWcmYEitaexBwSsODQWJ19mV9W5P2CRYwFIvzXxpYyEIgJe2F/59?=
 =?us-ascii?Q?57JcMnyWMVdsTUATxb+tQyubCYjBB5sXo6fjEIZVYAiwf1xV9NgYboQ6tzF9?=
 =?us-ascii?Q?K9Cxnul0740JR/05rSjZ9TGsDfOHqUpA7/0dQLDscqccGvBlJsS/wR7kK2C9?=
 =?us-ascii?Q?jOmAQv5oE3soKs6HBF+JWnbF0NBIZQeP7JU2iJ0T9O5C1YpVuOV1IL1FHEEr?=
 =?us-ascii?Q?jPJ3yYvHUw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6752c9-1a8f-43d3-980f-08df38b87a63
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:08:28.9835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pakVp2vuXilRbqWYZEzTRe7n7njCFYBMRx5L9oL27bVGAlNg/7QrAEmTD81y//9J6VtVMMZTfptgdBMzG+pVhb+jvsTPMoQacJzliiZFMys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 08:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249193

NEWS: https://gitlab.freedesktop.org/dbus/dbus-python/-/raw/dbus-python-1.5=
.1/NEWS

few notable changes:
   - The sdist is now called dbus_python and ships as a .tar.gz (PEP-625),
     so SRC_URI and S need updating.
   - Autotools is gone, but we already build with meson.
     -Dtests=3Dfalse is now deprecated, so switch to -Dtests=3Ddisabled.
   - The tree is REUSE-compliant now, so LICENSE grows to cover the bundled
     dbus-gmain bits (AFL-2.1 or GPL-2.0-or-later) next to dbus-python's ow=
n
     MIT, with LIC_FILES_CHKSUM pointing at the individual license files.

Full NEWS:

dbus Python Bindings 1.5.1 (2026-10-23)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Fixes:

* Fix a memory leak when freeing UnixFd objects
  (dbus-python#62, Nieves Montero Fernandez)

* Avoid libdbus assertion failures in some configurations if attempting
  to write an invalid item into a variant, for example a non-UTF-8 bytestri=
ng
  (dbus-python#60, Nieves Montero Fernandez)

* Be more consistent about how containers are closed, to avoid mistakes
  similar to dbus-python#60 (Simon McVittie)

dbus Python Bindings 1.5.0 (2026-09-27)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Dependencies:

* The Meson build system is required.
  Installation via `pip` and similar PEP-0517 build system frontends
  requires meson-python (mesonpy) and its dependencies.

* Python 3.7 or later is required.

* Python 3.9 or later is strongly recommended.
  Older versions are no longer tested or supported.

Build system changes:

* The source release is now built as a sdist using mesonpy,
  with a name that includes dbus_python, not dbus-python,
  matching the project's name on PyPI and PEP-0625

* The Autotools build system is no longer available

Enhancements:

* Add a `test_socket_dir` build-time option for systems where /tmp is not
  available (dbus-python!38, Emily)

* Documentation and "as-installed" tests (if enabled) are associated with
  `meson install --tags=3Ddoc` and `--tags=3Dtests` respectively (Simon McV=
ittie)

Fixes:

* Revert a broken implementation of weak references that caused crashes,
  especially in Python 3.15
  (regression in 1.4.0; dbus-python#59, Simon McVittie)

* Avoid repeated configuration reloads during unit testing when dbus was
  compiled with kqueue (dbus-python#56, Jakub Kul=C3=ADk)

* Add some unit tests for weak references and object destruction
  (dbus-python#59, Maximiliano Curia)

* Metadata updates (Simon McVittie)

* CI updates (Simon McVittie)

Licensing:

* REUSE metadata is now in TOML format

* After the removal of the Autotools build system,
  all remaining files outside subprojects/ are believed to be MIT-licensed.
  The GLib main loop integration in subprojects/dbus-gmain/
  continues to be under the same "AFL-2.1 OR GPL-2.0-or-later" dual-license
  as libdbus.

License-Update: Add AFL-2.1 OR GPL-2.0-or-later licenses

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...thon3-dbus_1.4.0.bb =3D> python3-dbus_1.5.1.bb} | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbus_1.4.0.bb =3D> python3-db=
us_1.5.1.bb} (50%)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb b/meta/reci=
pes-devtools/python/python3-dbus_1.5.1.bb
similarity index 50%
rename from meta/recipes-devtools/python/python3-dbus_1.4.0.bb
rename to meta/recipes-devtools/python/python3-dbus_1.5.1.bb
index 2854eda30a0..4126c4639a0 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.5.1.bb
@@ -1,20 +1,24 @@
 SUMMARY =3D "Python bindings for the DBus inter-process communication syst=
em"
 SECTION =3D "devel/python"
 HOMEPAGE =3D "http://www.freedesktop.org/Software/dbus"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97f58951300aa52a9f9e3a62bd5c846=
c"
+LICENSE =3D "MIT AND (AFL-2.1 OR GPL-2.0-or-later)"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97f58951300aa52a9f9e3a62bd5c846=
c \
+                    file://LICENSES/MIT.txt;md5=3D7dda4e90ded66ab88b86f761=
69f28663 \
+                    file://subprojects/dbus-gmain/LICENSES/GPL-2.0-or-late=
r.txt;md5=3D3d26203303a722dedc6bf909d95ba815 \
+                    file://subprojects/dbus-gmain/LICENSES/AFL-2.1.txt;md5=
=3Df3ad2f482ec639b440413665cfb9e714 \
+                    "
 DEPENDS =3D "expat dbus glib-2.0 virtual/libintl"
=20
-SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-=
${PV}.tar.xz"
+SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus-python/dbus_python-=
${PV}.tar.gz"
=20
-SRC_URI[sha256sum] =3D "c36b28f10ffcc8f1f798aca973bcc132f91f33eb9b6b890438=
1b4077766043d5"
+SRC_URI[sha256sum] =3D "57423cf87d09b7d084f420b55b737fe654c33339b06df77945=
620d97795c6ac4"
=20
-S =3D "${UNPACKDIR}/dbus-python-${PV}"
+S =3D "${UNPACKDIR}/dbus_python-${PV}"
=20
 inherit setuptools3-base meson pkgconfig
=20
 # requires dbus-run-session
-EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
+EXTRA_OEMESON +=3D "-Dtests=3Ddisabled"
=20
 RDEPENDS:${PN} =3D "python3-io python3-logging python3-stringold python3-t=
hreading python3-xml"
=20
