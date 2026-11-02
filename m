Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7678.1793602913220067938
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 23:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Wv23msrR;
 spf=pass (domain: est.tech, ip: 52.101.66.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmzTADiIGa0Tm8ZqfZhNrZBjeUNlU7Yrijb71QTIdOWXN8YguSPAOo3XV6TrATXt+hAlX3uJ+1TuQ04qkN9DvF53t6tEWm5ONxdpFsk+G+F3hP/3fcNlCfLtfU0+qOoxuNC9ggfdysaI8SETmTFhR9kAjmvPoL4jC9IlloZ7nuMLQygo1dofsgzCsu0Tg3zuS7tbfPRAWBFmG7pg0mWa9F/Ar58XHxvmApcn2ESriCMQj1jxG4HIoyMyuumnZzPev+Wi/Z65FXgQCR03OWVeSniGgmClRu/vx5WOAqKMb0CqvlYBzBtFpekvLVmOH/EapZb0nMrMvczbJohA9rzpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBweokyFPFaDxEfRd49LlXpZBeyQL6tlLXPC9gpEFZY=;
 b=RtGxcIqkb7bMRZWR3KwIibOFh/g09kYF2XADPF1R0HofxE22JCBzhxdFqY/5ruvWcYuy9MC80hbDXM3IvMB6hK7d8ioEraikOqlPR3HutHE/7aJ3iQU+0gGKmkhwENXyTdI4F4w11NkMD36ma0sZ5aI+Qy3ushWNvawu9La4Zph30s7w4QQYVLcJnC2q7uaWiGI4CEBst6y6QTnwOB4xfTrqKVewivKjdLumMkHglLv2JAmBbae/pcKkhPoRAtUQxs+yK8v0/aLvcvNlD9HFPWPu1LW7j2dlNNfrQOmxTDqrOePl5J8PIAH+wLBG31iUe0tbIAJpwMHfODDAalu+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBweokyFPFaDxEfRd49LlXpZBeyQL6tlLXPC9gpEFZY=;
 b=Wv23msrRP9LrYjmeBeffmGgKCDnsZyJuzaI5jO/0dgxh9+v0WLKrVC6UcEXvS/av3lmXeLcriM32EZs/IroLEsPtsOC1+8lL/7lqidirxHQYqkwQHCMvCNNqPRMqq5gmYJfHpoAnENzxuPoeSVyriAYydJPcrdrhVRkoswjm7lEfz3aPOzXEqGPRBqcPLheRDwRfZDXwH3v/v6UvNCmMju0wJXGqY48foC9NDYqCz500ZLQJYypDiCHk52Mu6isM+3/jCb89T8pUPqwM8UCu03RVHXXvrD2oIaKhCq1jfNB9Y9HstNpYhx/211382+cQ2D6+mHWCJ3nrnlqhitHsZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM8P189MB1234.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:247::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:01:49 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 07:01:49 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 2/3] python3-dbus: Upgrade 1.4.0 -> 1.5.1
Date: Mon,  2 Nov 2026 08:01:42 +0100
Message-ID: <20261102070143.30639-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261102070143.30639-1-jaipaul.cheernam@est.tech>
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261102070143.30639-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM8P189MB1234:EE_
X-MS-Office365-Filtering-Correlation-Id: 02197be0-ff0f-475b-4628-08df38af2a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|260925022911599003|260925021311599003|260925021911599003|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261021135927099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|12006099003|18002099003|22082099003|9063799003|6133799003;
X-Microsoft-Antispam-Message-Info: pLIKyH690Oil++jqAZsUD8SQhW3a1ruya6fzYxaz2aos62TvyN7CPovoGo5wggGmUyz6g78UC8thlqf5qNW4oT+tSKj4VNAZhPnBEAwhCkyMMevLEwEcHzp70OIvtTPUOvKBMP13SI3KmDb8oL0M6KMiCrq/4TV76WsBNFKdPlVLQBuPBGnocPrOZW3Qc9ghqHE++6bOOTOmsXE2svJzUl4R1hvVcpvlX16UhV+qLClq1sJ0+A+Xr77edF5CpSBOR2+fhwwOfoXG73rBwXXgBn9TFnDAtfjvCRRiI+LdYFk/qgsXEqZrWQEYdpWhJyxXDsu2xLV9aAhDZBFIsTSMmbrxIZNsLWMxyrLmnQCcYBYHm6WDnb/jXi7+N6HrDAXxjyyykEX7PeVtr6Cy5VaPNoeMSHxUMgyNHW+aIRkuWaHLGFWPWsTfg0olPqKegLaaCZa9+UES+C66HIUtVj95/zBunF1SwHGbl2mCcAqi3hC18JT4xmZAttOVRnz28ind2f9B41VfkaqlNXlsZKm2xdDcJqkrEUyS8f474NUSY33DvUkRpEs1dcyQTsDYQCrAeBzq04T8VwRiLl3/M9URJulekLoP6mD2HLoELGLBNsL0GYU0XiKdiLkaJo7qCKaR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(260925022911599003)(260925021311599003)(260925021911599003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261021135927099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(12006099003)(18002099003)(22082099003)(9063799003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lyjoya2KKJx6w4sg3qLpFBDqB4+2cIE9F4BP9jMKhzvDjLzXn5afZ8ADYIvY?=
 =?us-ascii?Q?IpLJAl77rRbMd3SxOiRDDPzFfp2Wz8m2bHAKiwjiC4tO01W1t8/QDI52WR7G?=
 =?us-ascii?Q?BZgPe/Tnk9C5MGJp0zPjNMMSsTaj6++QffZuX0Plg3qY4xVi0vSFz5yo0Lh0?=
 =?us-ascii?Q?iQqlxsW6xgxGWAqqw3Jdk+Vfsm2iI8SNYRjQdjeUwZxogT3wnPjNTROhFBmQ?=
 =?us-ascii?Q?N1vf96vc8EY/2tk5SwJe825LycHwb1PBx/Z4saSPLWI/rhDo2OH5gz71Huuv?=
 =?us-ascii?Q?JjIGxWIg31GPyYolNJ/nFUQPUItQE0/xCMNcKdqFXpbt/RReLJ3ONr+wUvRo?=
 =?us-ascii?Q?s/7wzWlOJWEpDsS6BXeJP+zb0CJy/jYZFhJ8dvngv/7jN0wLYI6TlpRJh3Cr?=
 =?us-ascii?Q?MAecoVC5xhUyZBA3ppACu7NRW7BNdjMjnxHCgO7ALK6uE6rViYMniY2cp61M?=
 =?us-ascii?Q?BnBQZp70UbvTwZhXS3UpGxbCbweGuUJVXydLFRzPoSTFjJ9rk2xalg7ILGxQ?=
 =?us-ascii?Q?l8Fs/FxHiwZ7s8HoGHHIg32qetb6LzwWalm6G1aKKUr8ZPcWTzVaWiKq2tKn?=
 =?us-ascii?Q?eVbaTiqOVO7Swgbshg0gFN2uYTv2vYgUqJxzpozoYSxUfLgQNJRV8d6FZy+F?=
 =?us-ascii?Q?3xHRzqrbe0D8S2rIwVMbc1vObDt+MtD063snYyBrfFtGPsMC4rTrAW7Tqv33?=
 =?us-ascii?Q?fmE0h6dU5E4C2zfCZer+oweA79ioY5XCb2IHMGhJDrEOoVGxqpyQs9zBe2m0?=
 =?us-ascii?Q?KbuL2GH9+eqiMNRNMVBoWmlAN6RkrZV4gTDDTDdL6w931yDHVf6fdV7tFWaB?=
 =?us-ascii?Q?ejHoFhoX9HZu+GceGIiMuRHP9UxzWiAyY2eihlKBJlYh9dV1e3tRpAHhKcu0?=
 =?us-ascii?Q?zkc78PilEUOCmIkgJcMZjaHr4cVup0JwoYyBpQZ8FcviAkotnXpBhJGDvT4Y?=
 =?us-ascii?Q?V3h6/PxQ7rTjg1/yQm5H1e6YeV88iqYKBRnZ+z3ScLmEMOZV8Drn7w4Ockkt?=
 =?us-ascii?Q?BEDA5vK+41m3Y35sO7eECTQXd2cZdR1HY6IZK1275cQcXcNkfyMEnFjGjI3h?=
 =?us-ascii?Q?jcWxBpC5Ap8O3wh5RBqs9psUedYqQUMKGGQh0hdxRgLBCmUc11xhwgXzkusd?=
 =?us-ascii?Q?Axnhooi91bIH3YnTixhl+QQRQXYfGcWF0uQnvEyqhgnuz55aGiZGotk5L3x2?=
 =?us-ascii?Q?gGGg8YyF3k18EagjH970HPLxR86uh1z30YEu95NAQLYy+YTE7N7KpHC7H2e5?=
 =?us-ascii?Q?p6NQDyGPrtUNvVqb/yXMQeTTqSGzF3fDEy5zOjK+i8yjIF9o7SLQPvx24b8V?=
 =?us-ascii?Q?a5YoL9yzNb3qQMljO9bX/xvR/XsR6oQ85pGYo1t4bN6nw45qePf4j2sk/662?=
 =?us-ascii?Q?ih4SpoWKgppaEWtTMNfvFKUneeY6d+Bsl/0SgZ9MdFMXAkPYWE17VAlum0cD?=
 =?us-ascii?Q?fH7em/KSVrlcGNx7TGBUCMQW4Xa3RzrgU9HOc8rVCTe1WV2J05tG4RUtpZwd?=
 =?us-ascii?Q?kxVh37GUM/FtdPwx9zT5c1XxmmdoAjR8q8fYRNjSjw3z4SdMRQEHK+sidjgL?=
 =?us-ascii?Q?ahFAE97Ox3QCcVhGqxCruDfMVlTUlu/9+1D5J0FDS71QBfHR3cUZzFzY4myU?=
 =?us-ascii?Q?sHdQdg1+74M7eNB6rUOKDog/F5oLY0Ybwj99b4SCQ0l9efwcB8TIZHVJZAtB?=
 =?us-ascii?Q?keJOeZcUZGNvawDV7fRBIrURLJR0mELsBpgGngLIrMyA2Fa5WDfg2w61RXne?=
 =?us-ascii?Q?NfLs/yqbAQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 02197be0-ff0f-475b-4628-08df38af2a38
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:01:48.9818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: payjDj6rkjfIJKOqIBu1J1w4xW5lFxx3uojnOK2dR0SHE+r3vjD2PEhbpB0RyT/fUaKHGkTxlSgUycza+xOHr8cRKEVGwunDJdXBnkxUd/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1234
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 07:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249187

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
