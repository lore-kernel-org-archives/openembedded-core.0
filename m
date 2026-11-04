Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4920.1793781306930406574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 00:35:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sjMgyAe3;
 spf=pass (domain: est.tech, ip: 52.101.84.59, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=viEatGJDmgUv0RTajY2ElvD4X1RsOK6Bbc70kKVBIru2v7Jv8nRcv8+0Db+NXsaMLwr7ixK+BZnHWsfeo4ojAFApogbgN62C51QY38nT4dUetLBAhgFHkkaxFP+42EFaqyuMmixzcLXqEr5VIo1kb1c/MpN8FbPnkT71Y+TUxKFGFtYfCP3zjJuqJNhC7nBvAGH936PCcEiHD59tPHG3mVxbj/jvXc47x0txEUWHyGBk/YhsTIe9DNL18kB5T6mPPe6Simxov0lQAiLZhDR1cThOYEBNMnUKRIDt8zQRVchrtOJH6e5yV29fTaPr06Xpc8uoot3bfj6XLc2cRB/o5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYqMz1CQwq5adNcPDdI1jFQSDdSsrH+7JOTWqkhtasM=;
 b=zL4ma8qqtlTyPAMyaiter6uLdWNKi2RYH4ynW8xr9mhQmBmmeCY20spgwoAfZT9qbSyB7DbLDTJYgYNTP3nCBfI2DK3wDjSk5HUKJKamKMQYI1zw3YaIysKWSqWbaecy3WQHcgaWsytfotWoDso8SAkmn15Avwj2p6uLgZ42YZJ8jLcMrc4qhbsAQOOrJuEo/e3gnrxcgPMhyYNb4qTeu1sc6UzkbgzoL3351Ug9MtCReAZlDDp1Fzjybd7EA+vsO5QIvsh40+zyky6PdAcqrnmWy9A6mdXduN/ByIXXULmAPw2j8T8ieBytY9ZSsnDIUY/TfRUua9TROKue9Tc7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYqMz1CQwq5adNcPDdI1jFQSDdSsrH+7JOTWqkhtasM=;
 b=sjMgyAe3l5gbgDhK3zjtajdjZtkGYh9CG/Sbz0hXBwDvZgS5mFkTy68MXxJqno1IsxGiLJSgauqvuUWGOXipNUvETxgzWUxCpPh2uEz9yuzYT0CBGDmOj1aGECbgggTNhvNgBFHZw6F9o8f5cnHaNQe91o8FFyjUFM9m66p0KsJpwag8mylhe3mUpBjBdQ6uXec2k8OGPW+tVun/P06urPUQxV7qn5SADTXVrwRGZGVQ+u05WUeWl697Wk654ljZxFzwESStqFXN3hkjcj68vztF5ROtbM93r2HCUyCeNN+IlLMGWXy5yVoYfbY03OQVzyCYMpGO1o8uYNtLrrUJSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AS8P189MB2490.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 08:35:02 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 08:35:02 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] log4cplus: add ptest support
Date: Wed,  4 Nov 2026 09:34:57 +0100
Message-ID: <20261104083458.12316-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P251CA0026.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::30) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AS8P189MB2490:EE_
X-MS-Office365-Filtering-Correlation-Id: e289ef57-42bb-4448-8fe0-08df3a4e84d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|10067099003|18002099003|56012099006|11063799006|261021123027099003|261022115727099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|261009223027099003|261021121427099003|260925021311599003|261022105027099003|261022075727099003|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: M2ESKsniyXw3JTEIVM5j1z9Zh3S3ys8rsxcTp1C6GTqqxBK7BK2ikjNjB79KnSbAbRWxzQaSXOFtr3oM4ABDuPB/0/QFuJfGHOywi9PD46mYNcS5OAoqDTC3lx+shcg3nHkX8BKDGgJPXSVCNEPEXJoYkue/t+5UdrAfAbxce7v+2BoPTXYz3jUQnu1drIB6A2BvBlrpVyjfwZrfM3CoiHbR4lbvJGeZgIiwxmlMlou0aqz8RPXtAc7vy2lVhjzgbl+BG8WJpwLJG7CfT7DARAcOsKzLAGjTQ0DV3Br1H0z9VqtvR60QAKk4tRxWUxYbT3xBCefqTbjQBh1Laq17uHGYbf9Cj9eKAf9HSUgC26W762yCjslXDdQIrADmfJUhVpsGrl3UxbbQEn8WaFjedws+xa0F9pIpP+bmaChCBtdBCvzW4eo1R4UtgG8XHsGnEewAAhTyYH3a8C2BbIPrI1/Sv4I8l7OSfAEnKpQcmfDV3k5QC6bvVrDdAtEyHw56wAWrR+Y+UumulqJ/HSct1NUdlrzKmyy9bgvH1VXdOCp1ycmf53nYOK4SJSbaUil3KjooKuyPoCp6V2rmJdHhAATZNLFK1X6uJmJi+B/SJ35Kl5pPG8UV0OggDfL7DidbtETyPZ34B1t/r/SC/e6YGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(56012099006)(11063799006)(261021123027099003)(261022115727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(261009223027099003)(261021121427099003)(260925021311599003)(261022105027099003)(261022075727099003)(260925022911599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IMXkDqStqos9A1bWwZobedFoAAO5Ru6pj6cvJMvfZntGjO3q78cE0GTwBC+Y?=
 =?us-ascii?Q?XhYKTdPoeqYk+BvvAQKHmzXLtaom6C/NQWYajcmK2vvWFcJ5gKGQ9x1OtqEw?=
 =?us-ascii?Q?8tqIU5bHtKZdK7mWAagMMEnofW8CxSCeNJ6gUFjztMueEO5BGhdG3dx9Ct0K?=
 =?us-ascii?Q?lph/wgiq2906KLmdIUmMgKUNo+UESMB2/saZsQlHZ8j7H8mcyFEJrUz373Aa?=
 =?us-ascii?Q?B9h5JWwseab5f8ujo5XmL6TeuLr5a3zu6s0H27PryriRPWGBBdItMeWFO9D3?=
 =?us-ascii?Q?GY9zOS+BDpivOHKOyq6lds9vKqDtbzaL9iOkdWW69wzxS4TfKGrXL7Ev5NhR?=
 =?us-ascii?Q?e0mIo9eY2kjShZu+cu/RtQ6CbnoEjapLT1Qth7tBNfNyUMK1Ys4UQnrP10vT?=
 =?us-ascii?Q?GGQbo63v1k2mIJGPnqoM6uiylk/mwS3fakan9gdo7PWdkeLgIBsqir+Qgisk?=
 =?us-ascii?Q?uNkM80EhFwVlJDlPlMPGdAUR7/CQD7dKncbdGGElIm2dx7T230O4EwDTddcP?=
 =?us-ascii?Q?1TSLckN9c37V5X32t7x9rk8Ig/ASjiQRs7sEcBG9p1DqLlrfKT7q1GOcUjb7?=
 =?us-ascii?Q?WS5hiTgOi/c25HfuVY2HsUwD8/aY0mUewOb4vNWSNK10P1pE+go8cX5gMAln?=
 =?us-ascii?Q?Njt0BjVBXMUmeCFHH+yWwHgUJ/caiizJHEfxJUOExN8rcaxBzYGnNWRZ950g?=
 =?us-ascii?Q?YujXuCk5HVYVJgypat2NDITsx4dgU1DxtsJMXVVQDPtHYSrl+BWYW3t5Yi+Y?=
 =?us-ascii?Q?nIlv7KBAfABI2zzFnQfKsiCaFwAONZWXPoIRayABVPrScWnMmhihDyF+Q29H?=
 =?us-ascii?Q?kDD/ppia7tEAwfJPLNOu7JBWQ8f8P22GqNN0+evOxNU49fY3+OJYhTKb2d58?=
 =?us-ascii?Q?U7T4AABSEWrTkBhP1NMXuJBAVxNKl7xT/VR+hFJG5Ys8FlgSHDgCuaLLBAw9?=
 =?us-ascii?Q?NcNsDL0RgnejLvM41j7qPky+WsD5mZJp/RtW6eSU+wPpeWR6wEJcbOF+DVJq?=
 =?us-ascii?Q?/sUltu1F5041HjzwjWxG8ecgNUjqgyXI71At5I/LEpuJ4lwXnNAZILSLKtg+?=
 =?us-ascii?Q?deSDwJL2no5DNu3A24WWBf1v34OeazTORDhY004R0FHzrrT3st8RZC3HwpTm?=
 =?us-ascii?Q?A+pBZ4AVwXy4WQGG/vYlmf1gVlxZMBLX4HEt7MSCa1OiMoTA9NuIx+BoZjX5?=
 =?us-ascii?Q?5R3T6Jxf+PthS4GV6d62mqOfmDuXSBf/NbnJQfbkvlUvbfp0DadtqhKbv2ET?=
 =?us-ascii?Q?Qaolr3FzNhX7i8MY41oO0UOmv8O3mGlSNwhSmhqS1B0a0nctmBT8DiRX8qjF?=
 =?us-ascii?Q?DgQ90QXGykuSgU02qDZL5g0dPY5Q14NS3sFZRc6lU0uj9SeSyXiW1/LIl8Fo?=
 =?us-ascii?Q?Axu5T7VGkF4QY8tsjo6tT2FPsx+bWYMnJqLXjpYUvx5wTe2xkslzWUaEyMCc?=
 =?us-ascii?Q?aKz04aQkvTwiddxDV/rBpiMp6DrUw8rfj2+BY3milcpiH3uCujj+O3Tl9dmQ?=
 =?us-ascii?Q?payaCyLAsTDWubfcuEJ6QWfkeyekG2uzPx52IlYHVL+y2j91j3T0LWEseMMn?=
 =?us-ascii?Q?GR+3B7U/Lklv/4nTPSiBkqbi64Bn0yD1So9PE2SUWJLROsqNnEiz2R0c0Nh6?=
 =?us-ascii?Q?AzlpUVrX5bylEcN2ieJUa10RA6SBjreLAxgg+RauZE5WYtLakrjDTxb542TN?=
 =?us-ascii?Q?RJ1E7WAaA+uyWD9wczDBeUK5kEqX5n7KJoSdgRGjSmpJL9zBC0cKLrkjwlHG?=
 =?us-ascii?Q?0z1xaSEB8Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e289ef57-42bb-4448-8fe0-08df3a4e84d5
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 08:35:02.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwvO+AhzLVuBh59jNcfu0IGKol+517zSrZenomJmiwkbUbR/G2zFwGzk0amGKSgJ1gxG9Nmiw8p+o/DnIPj8Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2490
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 08:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249348
Content-Type: text/plain; charset="utf-8"

Build the GNU Autotest based test suite and run it under ptest, following
the tar ptest pattern: the generated testsuite is shipped together with
atconfig/atlocal, whose build-host paths and tool locations are rewritten
to the on-target ptest directory. The test programs use libtool -no-install=
,
so the real binaries are installed with libtool.

The headers-compilation group is skipped as it recompiles the public
headers, which needs a toolchain that is not present in the image.

Tested on qemuriscv64 with ptest-runner.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../log4cplus/log4cplus/run-ptest             |  5 ++
 .../log4cplus/log4cplus_2.2.0.1.bb            | 70 ++++++++++++++++++-
 3 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/log4cplus/log4cplus/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index d5357d8732..f8d2cb25b0 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -63,6 +63,7 @@ PTESTS_FAST =3D "\
     libxmlb \
     libxslt \
     libyaml \
+    log4cplus \
     logrotate \
     lttng-ust \
     lua \
diff --git a/meta/recipes-devtools/log4cplus/log4cplus/run-ptest b/meta/rec=
ipes-devtools/log4cplus/log4cplus/run-ptest
new file mode 100644
index 0000000000..1f346cc8b1
--- /dev/null
+++ b/meta/recipes-devtools/log4cplus/log4cplus/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+cd @PTEST_PATH@/tests/
+
+./testsuite --am-fmt -k '!headers-compilation'
diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb b/meta/re=
cipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
index a10dd175a2..ac29017a74 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
@@ -16,6 +16,74 @@ SRC_URI[sha256sum] =3D "374175c22fabe752eb1c20138e732b69=
ae191e641f92d32c9432985cd8
 UPSTREAM_CHECK_URI =3D "https://github.com/log4cplus/log4cplus/releases"
 UPSTREAM_CHECK_REGEX =3D "log4cplus-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
+
+SRC_URI +=3D "file://run-ptest"
+
+RDEPENDS:${PN}-ptest +=3D "bash diffutils gawk grep sed ${PN}"
+
+INSANE_SKIP:${PN}-ptest +=3D "buildpaths"
+
+LOG4CPLUS_PTEST_TESTS =3D " \
+    appender_test \
+    configandwatch_test \
+    customloglevel_test \
+    fileappender_test \
+    filter_test \
+    hierarchy_test \
+    loglog_test \
+    ndc_test \
+    ostream_test \
+    patternlayout_test \
+    performance_test \
+    priority_test \
+    propertyconfig_test \
+    thread_test \
+    timeformat_test \
+    unit_tests \
+"
+
+do_compile_ptest() {
+    rm -f ${S}/tests/testsuite
+    oe_runmake -C ${B} tests/testsuite
+    for t in ${LOG4CPLUS_PTEST_TESTS}; do
+        oe_runmake -C ${B} $t ${t}U
+    done
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    install -m 0755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
+
+    install -m 0644 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+    sed -i "/^abs_/d" ${D}${PTEST_PATH}/tests/atconfig
+    cat >> ${D}${PTEST_PATH}/tests/atconfig <<EOF
+abs_builddir=3D'${PTEST_PATH}/tests'
+abs_srcdir=3D'${PTEST_PATH}/tests'
+abs_top_builddir=3D'${PTEST_PATH}'
+abs_top_srcdir=3D'${PTEST_PATH}'
+EOF
+
+    install -m 0644 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
+    sed -i "/^PATH=3D/d" ${D}${PTEST_PATH}/tests/atlocal
+    sed -i "s|^: \${GREP=3D.*|: \${GREP=3D'grep'}|" ${D}${PTEST_PATH}/test=
s/atlocal
+    sed -i "s|^: \${AWK=3D.*|: \${AWK=3D'gawk'}|" ${D}${PTEST_PATH}/tests/=
atlocal
+    sed -i "s|^: \${SED=3D.*|: \${SED=3D'sed'}|" ${D}${PTEST_PATH}/tests/a=
tlocal
+
+    for t in ${LOG4CPLUS_PTEST_TESTS}; do
+        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/$t ${D}${PTEST_=
PATH}/
+        [ -e ${B}/${t}U ] && ${B}/libtool --mode=3Dinstall install -m 0755=
 ${B}/${t}U ${D}${PTEST_PATH}/
+        install -d ${D}${PTEST_PATH}/tests/$t
+        for f in expout experr log4cplus.properties.1 log4cplus.properties=
.2; do
+            [ -e ${S}/tests/$t/$f ] && install -m 0644 ${S}/tests/$t/$f ${=
D}${PTEST_PATH}/tests/$t/
+        done
+        for f in ${B}/tests/$t/*.properties; do
+            [ -e $f ] && install -m 0644 $f ${D}${PTEST_PATH}/tests/$t/
+        done
+    done
+
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+}
=20
 BBCLASSEXTEND =3D "native"
--=20
2.43.0

