Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6162.1792499211640567692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jecbScrB;
 spf=pass (domain: est.tech, ip: 40.107.159.30, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5G1BH7U+LnJL1Nswxij13ExBHvaJvmwzrTFqvW0HnxdSi7Qc9CfbTf4eYXZHgF/lKIx8OkoihpLyiBbDASAoB5LDLVdsI4TAdiYMMM+92CStznfMql+rJarCnN2ls3gn8qCmzbB5003DN69CSYRyod4cEYmaxtDIfzdBE95Xp8Af6yrynHum9R6qAApMputnHOgIGnCWGNOLcmNZ9KjIfxatgdcrRh+I0mBWM8KhKPMC4GxGxro0nCaIJVJ1Ncr82IvtraMyBGhaa7i6KjSPZoD3FeYsVfHm/MepsKHGCRnpANS1We5U8q7Qvh+zd8q7uFXNVJa7rAwQIBAg8f/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgs+cDbHt5rSmPoJntMctrP9wJR8kNjpejZps5XRM/Q=;
 b=GvwO1tHN3Z8Z/eHAYoaMG+mSDIHNw0+6gxxBI4BK+3e7+pBY+sHROtNj0V4TmEbubpVBRd7efLfpUAdKfZJmU1NdTjmbOtLf/KAc6+5pSSEiAppWwPxinYy1tPViArUyjK/HCZQX2StG4ywzFgj8O29xFiZXZwdVvQga9WmpJj5m0ze+QZuFz6Z2luBSAtX+nKcDno8Z5aUJsqy8wg3nl3yMGIHcHKXr8ITIFKmYgG/FQu6nVLsU5jNL0HjmxGQR2KIjiKjrZd6Q+EWbZd+8AiHWopnNJlOWBVhPBLLZ7BkuI7QQeNc0xaA4Jn6KlqR9WZEHiUdmfCWEa7YT9ZRD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgs+cDbHt5rSmPoJntMctrP9wJR8kNjpejZps5XRM/Q=;
 b=jecbScrBdHcV/wJcfK4gt+EHEg/hfkQj6R6gScnywpmes+7eqbHa3Iv4PaYz4OC/hhOJClf7R4WGNbUCmP1k/zwGVBh3BI/RVX3qNZ0E2+lBsoxPPcqiWzqnGdpe024VKZjIL2SwdC3EgYmbuCGAPYyBphYQtfQs6bncx1a4eHNoLYddtA2xQGgnGr2sYHGPfDVjUh43yPi1Lqt3X53BTD2jC5DRMDUmEh/Jzpq4UVBXqC6xL4ujbL59TiXI20UFp8LgCMkWMcCbMGvJpnf/qy2mJ8at+uaH7+0+Uo4SAc1iEBRZt3xeSh1Y8P1nmb3Iv7Hz7QJvH0y9CAEl+xQ8kg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AMBP189MB3297.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 12:26:46 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 12:26:46 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v4] libsoup: add ptest support
Date: Tue, 20 Oct 2026 14:26:42 +0200
Message-ID: <20261020122642.28387-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014085044.14497-1-pratik.farkase@est.tech>
References: <20261014085044.14497-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AMBP189MB3297:EE_
X-MS-Office365-Filtering-Correlation-Id: 119aa6d4-01cb-4e0c-315f-08df2ea5680b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|56012099006|10067099003|260925021911599003|261009223027099003|261009223327099003|260925021311599003|261009221727099003|260925022911599003|261009220027099003|261009221227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: iNKpAKrH1ZAIELMHSMaxvP1EoBNFhC/qrIZe2hy5YLwqGXDa/ZKZ/vi7B26osIeK/QlReUV+gzHvhMmiB9tXE5uHg1AqoT8r73lj2K4K5Z/+sQ7ZfHKJI5s/BI1wWKsVKSXv+oSaWug2oBdjtYa9YIXEyOljyGMFaRz+AuovYZ6QoptKfyovD4eXGD9hHegM3djd8PWj+bh430tLucOS1OI5aErtU8eB6M56+eWlF8QEapX+m5T1WlPVkQuF9FmivE44pzAr1PZqP1kDbT+tfQhRhrEBBvmAm9G0CxAKQOmEAUWcIlZ9mIYBeFhvFe+avhm7yoaymFqXOEBr/zYrnLU////2lo0NJXpM/VoRSyGdgHCpgKnu1GBBLZbFm9R4scRane0eDsh8RQWDPszXsxSG6B2zOIKGXfNbEPobvqZScVbdWHxd6JiEVFcE9T0X3wVWNBlDgPyW/BaLkaUNpZGaq2gax2WFIOXSyu3OdozQsHjxu9A6P5PoplzT66TxPiulELtYVqHod6SDpiL+cTl5wR8nqhWDWhxNnd2e89jfDv5NvoINVZ6lbRgJkk/BetMIs2WVx7tdOuJ6APL+r3N/HzSARavvbDAs5jlqTv8/LV+JluG8CqH72GNTgT3tcVY65KiTmov7UMESQOAHFFYj0FMqY3x9Q+7YB29clKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(56012099006)(10067099003)(260925021911599003)(261009223027099003)(261009223327099003)(260925021311599003)(261009221727099003)(260925022911599003)(261009220027099003)(261009221227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J+FVTvmBJrLlXVbGjFxjOK2aPbbf6GU55gtfrva/sdp8wtoJg8wsohLwsmIa?=
 =?us-ascii?Q?YP4CUepMnWDn/NwO+7RsO/9kLSj/hIdQzkWq5tu0hCtU6wwmSQnkLkI2ubJR?=
 =?us-ascii?Q?gOMyIynIdemNFC5tCiNNCCzflo0LwWz5cmUJETt/GaClTthXg00ItmU1ROvx?=
 =?us-ascii?Q?tfOqlvwaqtnLXAvylvhUnpxx6uDqaYTS7xYOojLIbyMglhykR/ofw5DdrLZo?=
 =?us-ascii?Q?MLflxV3erwO8kZKkFy3gN89gSbyOTCTtflUmgDSaQ3/U40dSnfvc7OzPsQDx?=
 =?us-ascii?Q?kANAmdKqltLzV7o3tK9LLTZJiGp6YnUwWdmzPIRJRQgSauQMIGS65Tbh2HR+?=
 =?us-ascii?Q?iMCCWBfO5JNwFoAVsnMOzD5YtKLcpyzoMr7yXTmTl8F2Jl8C8KOpu3owWUne?=
 =?us-ascii?Q?ApjSUm9mUX0Oui9NFA5BnfuL9GBRHpOzoa5vSm1valYizMDfLZDdGEcPXzr0?=
 =?us-ascii?Q?+TAhjRgammC4yXYT3DUsHmlvlsz1CDkYqU/ZLGrGlOe7Dg+czcmFEGLHmgrY?=
 =?us-ascii?Q?h9zSH3YK7zX12Xi7hK3LfC0LDT+XTOoXBxYvK4pvejFXZBGSJ47TIGyrXU8i?=
 =?us-ascii?Q?AFKA+G5cqLYSspokdkJQSZC9tBBXJfexXs6RGS5Y9fyOa1Un1MmR4wqVNtK7?=
 =?us-ascii?Q?WPY5dlOcq9Saz1SpYkKqvz6XxpLf96l45qhZ8Z27V52k6FelKBHLSa+PQ+Yu?=
 =?us-ascii?Q?miVJt1RGZ/hqCxRZ5KOUjvSlTjXYC0glEH2zgQvssDI7Cbo1JyPLl3BAkLTw?=
 =?us-ascii?Q?D5StmTtE5xAe4tvtCoFFo3+XP3SO8zNAIr9D6+OUjJVla95wUrblZhlbDiaO?=
 =?us-ascii?Q?SlI96KyCVy/pVu90eKugsVjsmA2r7wD2f6kPhfJ4AlZUdZzzMYuIm0kcHTOZ?=
 =?us-ascii?Q?SmhR1nTchtGmMM49NjkjdRniZxW1VPF3TkBeMPHw8HwMMm8i8VOKOOkdhDzD?=
 =?us-ascii?Q?gobMCCT54X+Agvkv9fCy1BMHm024BMavuAYNhTrSveVQebe5njSgC2JVYHNO?=
 =?us-ascii?Q?jH5mFBaGm/a9EUdk5JV/w3jMWJUyRD7et+gazyZCG2/YD6swOxd6V3HN22BX?=
 =?us-ascii?Q?WrsZcuPreCY/+TBa8/4G0H5m2gBE8JcogX0Cp0VY6m2ChfZ+jMZJY2+DiaZ9?=
 =?us-ascii?Q?0XkreGySJYChKr4EjaBvxOpRLVKf8hN/z27T7Vj+IWruGxampZMeiElmPkQZ?=
 =?us-ascii?Q?1bojCDizlnYiHbZuQ+WUEZrGki/rzS0CV7GopT48sMGc30VTKKbGm6HKxB2U?=
 =?us-ascii?Q?kjU4wl93JZsDn+4nNa7C9f49yXbNSgAUhJu7omtds5MUaajIoG/hvhSjR0Sl?=
 =?us-ascii?Q?NNyj+OXxo8DVWemZARtCo1ywZzZZzRKTGDttq8x6yrpC6o3NduWBVyROY+WC?=
 =?us-ascii?Q?RGoixTw1iB+XocdUkVkBB3Myhqn37nOKjqW3FsA5RHWP8eau0BiAntPOQNSo?=
 =?us-ascii?Q?Y1hgnajsHaFN+4IQXqXv4nUKxO99/7E4tZRHpPvJO50CHIlVxY1Sw7dY6yzh?=
 =?us-ascii?Q?sEt+UO2Tum6hjq22QFM5MMAxEmvjht+Fj6J9tnzFFL3EaRWHqgARZOAYWsDy?=
 =?us-ascii?Q?zh/uu+VTDmTLbM8BTydWEWjbDhwjtfqsuRjTcIGbA03su31EqI7TSJ5ZEsZe?=
 =?us-ascii?Q?2iM2Qcxu8xVGs1JGctQBEV7gM6VvfwAnBq7PeFNrvFJRvwCD7S/6/03cJOvQ?=
 =?us-ascii?Q?YsT9MKOPGY1dMv42yu69IyMjEQbkajIscyOJY82dPLhvSUTtlFgXoaPkIlSz?=
 =?us-ascii?Q?ZVxDKpB2hQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 119aa6d4-01cb-4e0c-315f-08df2ea5680b
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 12:26:46.1158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGnJoXkbWWgQ5hsN4l279GvoMC4bJVhswkwWSCpAmh4myHKClOX4m5tFwcnc1NBAv89ALFrujzNOJNxYRRmTgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3297
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 12:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248276
Content-Type: text/plain; charset="utf-8"

Build the installed-tests via the meson tests/installed_tests options
(enabled through a new 'tests' PACKAGECONFIG when ptest is in
DISTRO_FEATURES) and run them under ptest with
gnome-desktop-testing-runner.

Some tests are excluded via PTEST_SKIP_TESTS:
- header-parsing-test hits a glib parameter-list parsing assertion.
- logger-test and http2-body-stream-test allocate multiple GiB and are
  OOM-killed on the ptest machines.
- http2-test (riscv64) and multithread-test (aarch64) intermittently
  abort during teardown on the slower emulated targets.

Tested on qemux86-64 with ptest-runner.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---

Notes:
    Changes in v4:
    - Skip http2-test on riscv64 and multithread-test on aarch64: both
      intermittently abort (SIGABRT) during teardown on the slower emulated
      targets (seen on the autobuilder over several days).
   =20
    Changes in v3:
    - Drop the QB_MEM bump; exclude logger-test and http2-body-stream-test
      instead, as 4 GiB was still OOM-killed on the autobuilder.
   =20
    Changes in v2:
    - Rebased onto master after the libsoup 3.6.6 -> 3.8.0 upgrade.

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/libsoup/libsoup/run-ptest |  3 ++
 meta/recipes-support/libsoup/libsoup_3.8.0.bb | 37 +++++++++++++++++--
 3 files changed, 37 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 2bd11b1706..992d3666b9 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -138,6 +138,7 @@ PTESTS_SLOW =3D "\
     libmodule-build-perl \
     libpcap \
     libpng \
+    libsoup \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'libseccomp', '',d)=
} \
     lttng-tools \
     lz4 \
diff --git a/meta/recipes-support/libsoup/libsoup/run-ptest b/meta/recipes-=
support/libsoup/libsoup/run-ptest
new file mode 100644
index 0000000000..efe975cf3f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner libsoup-3.0
diff --git a/meta/recipes-support/libsoup/libsoup_3.8.0.bb b/meta/recipes-s=
upport/libsoup/libsoup_3.8.0.bb
index 2a40eecaea..1ca40423f0 100644
--- a/meta/recipes-support/libsoup/libsoup_3.8.0.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.8.0.bb
@@ -9,20 +9,23 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0=
d91eb439ebec522ec2"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
=20
-inherit gettext gnomebase upstream-version-is-even gobject-introspection g=
i-docgen vala
+inherit gettext gnomebase upstream-version-is-even gobject-introspection g=
i-docgen vala ptest-gnome
=20
 SRC_URI[archive.sha256sum] =3D "bbf08fa3e03a88c31a3d27a0d87cb422e9490f2d08=
e149211103df6d638a2238"
=20
+SRC_URI +=3D "file://run-ptest"
+
 PROVIDES =3D "libsoup-3.0"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)}"
 PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,brotli"
 PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisabled,krb5"
 PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
 PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisabled,syspr=
of"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue -Dinstalled_tests=3Dtrue,-Dtests=
=3Dfalse -Dinstalled_tests=3Dfalse"
=20
 # Tell libsoup where the target ntlm_auth is installed
 do_write_config:append:class-target() {
@@ -34,13 +37,35 @@ EOF
 EXTRA_OEMESON:append:class-target =3D " --cross-file ${WORKDIR}/soup.cross=
"
=20
 EXTRA_OEMESON +=3D "-Dtls_check=3Dfalse"
-# Disable the test suites
-EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dautobahn=3Ddisabled -Dpkcs11_tests=
=3Ddisabled"
+# tests are controlled via the 'tests' PACKAGECONFIG (enabled for ptest)
+EXTRA_OEMESON +=3D "-Dautobahn=3Ddisabled -Dpkcs11_tests=3Ddisabled"
=20
 GIDOCGEN_MESON_OPTION =3D 'docs'
 GIDOCGEN_MESON_ENABLE_FLAG =3D 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG =3D 'disabled'
=20
+# These tests abort under ptest and leave the binaries in place:
+# - header-parsing-test: a g_hash_table_size() assertion in
+#   do_param_list_tests() does not hold (returns one entry instead of thre=
e)
+#   with the current glib.
+# - logger-test (long-invalid-body-length) and http2-body-stream-test
+#   (large_data) exercise multi-GiB allocations and are killed by the OOM
+#   killer on the memory-constrained ptest machines.
+PTEST_SKIP_TESTS =3D "header-parsing-test logger-test http2-body-stream-te=
st"
+
+# These tests intermittently abort (SIGABRT) during teardown under the slo=
wer
+# emulated targets, so skip them there:
+# - http2-test on qemuriscv64.
+# - multithread-test on qemuarm64 (glibc and musl).
+PTEST_SKIP_TESTS:append:riscv64 =3D " http2-test"
+PTEST_SKIP_TESTS:append:aarch64 =3D " multithread-test"
+
+do_install_ptest:append() {
+    for t in ${PTEST_SKIP_TESTS}; do
+        rm -f ${D}${datadir}/installed-tests/libsoup-3.0/$t.test
+    done
+}
+
 # When built without gnome support, libsoup will contain only one shared l=
ib
 # and will therefore become subject to renaming by debian.bbclass. Prevent
 # renaming in order to keep the package name consistent regardless of whet=
her
@@ -50,6 +75,10 @@ DEBIAN_NOAUTONAME:${PN} =3D "1"
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS:${PN} =3D "glib-networking"
=20
+# The TLS-based tests (ssl, server-auth, websocket, hsts) need a glib TLS
+# backend at runtime.
+RDEPENDS:${PN}-ptest +=3D "glib-networking"
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_STATUS[CVE-2026-1467] =3D "fixed-version: fixed in 3.6.6"
--=20
2.43.0

