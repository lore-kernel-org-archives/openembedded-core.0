Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11609.1793279525977239266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 06:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0Zmcs5NZ;
 spf=pass (domain: est.tech, ip: 52.101.70.67, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgyO6qnd2+27kUB0kPwCb3fx8LRjcNslZoWbJ8to3ihQmHKtGppK3yHrxIN5GmVEYlNgaEOINpAfBAZpBVpyKNp0Gll/9cn/wRHoipnRUgmO3hI1XzHIbC3kIqCfFVTkN2LdymCn+eR/C+u17jJ1A6+acf4S0lQX3hWNEoQmnyF3+1wm04tgkA3ZizLGOrXloWWdtzIBWc6Ai0w1xpjkd3c5ljGmdXu1Cr8tjyBpOOaXeYQ5f8sUQe0otgu/e2VF9IZIRdHuxWV7NVoCAkuHjMMx4nsOo+58A8U8+YoYCPF/hmSWA7nrCuWzjMKJcdVi8awBLOwD/pcn5L2mzFZ8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8JxwJcmxHWSaUzM7KoNrJuJwC22pJ2PFw0WQ78Cp5k=;
 b=OiNqmCykMUNI1e1iCh7kEEdXIFfQ4dZOj4bVzTOo8SxPHUKaqzhjJSTBeU2gExwiFaGSfOUc9lhrZLK3+fqrKN1e1N2o8n3aZgLTWM4cajOuPv8naemzk84eSTLICuVol+pve6f1ZXeXvX/X7XrNZV6suHlM8MjwFaiit/HZekug6m7B5zfPUS26F4x5Sli0jAn9LNlRmtSr2Xu76fa1j0b7veXVx7cq+1JuxKU0DxSNjDta7Kj9rD3AmnxXoBqcqSzacAB0pFsdVHNr/8y0oJ0r8n5WxRMnp//I+an3VwR+GQLM+/sh0ylg3S/F7wfj5fXc4vK2n7s/4Ai8ITUmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8JxwJcmxHWSaUzM7KoNrJuJwC22pJ2PFw0WQ78Cp5k=;
 b=0Zmcs5NZsJO9NxxBYxP+JC+ggLmQ0cIpHl/eNjusI/b9jLlNDDO2zwLsPJ0V4rtz9ov8bPlG5pcl0OYTmxQlCY7Yww2L3fm4ipby9RMyrXTzWoO/ryZcuBKGbVOJNwNOsjXtgVHF4HfmtkbGCICzcTfMiuwY/UOFNM5rnQbseM8ctizw4RWwZA3zn2jTVaPCoUaUNb7p2tJpJWBad+K1HQxdByeq5caUQvXYCoT3D6GzOEBepUPbIK5VupYxv9RpZaf17HIcjl57sQ7uQ9zZgzzZmQyIRO5q1NBiBpJwIqRZJIrTJNLehZbHJ2RzwS4Rqftgm7HnL0a0WozN2fM4Og==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB9P189MB3137.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5eb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:12:01 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 13:12:01 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] lttng-ust: add ptest support
Date: Thu, 29 Oct 2026 14:11:53 +0100
Message-ID: <20261029131154.7487-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF0001DC3E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2e5) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB9P189MB3137:EE_
X-MS-Office365-Filtering-Correlation-Id: f828882b-4c26-4f54-5cce-08df35be37e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|12006099003|261028144727099003|56012099006|5023799004|11063799006|10067099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|261021123027099003|261009223027099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: xVOyel+JKhnp8vLrqe03PKGdbO0JFkLao/aMi+o5a+q3qDaS6VXJukmIOl0x4OWt+eQtvIW4LZZbbef0RFe/zISa17sIAtDwRHnsZVbhxuY+Ow1l+EcODKxmsjNK8w8OF+oazcwZu5rfwOoXqkLNZiHwCv9c64AB/zWW4fah7cG3w8ebhPY1vbd+LiiyUhGN0yUGvgFS0ZqlGh/Yr6WwwcJ1f/io0yiPV5GzPoJRPJu+yZi945htSS41/SaJ+C4x2gqla4/e2TqLDzTb1XmTIwUWy+MWJoC/xyQIo08pQDb5/MTYrOvL1Z/ntsEwMfVXr7npmU6rHrotloo63AiSKmWEmOMZSdw7KYm19qPbrh3FNPku/232/AYR1NiOFF1gh3kCsqEvbRR5mjkxxBgG5oQ95kfC/70wMjR9/NEao5J3Tu67cly5WD3WN/bKEnpjAWUXY3v3orpQ1hJyY5mhxigjh+Rt0d4wpDsxnwkYezZkRkP+hUnYTmY3mNdr5HZBeAo8E+F93XNdAcfoBaAZCB/HXwbxvFw8mtfCBCIqagurSYqNRkwqAE14hznLuO20UXvt7+PcUmlXLkVsYDlJZ6Ny5VVo4AqYaHbaTs50xHA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(12006099003)(261028144727099003)(56012099006)(5023799004)(11063799006)(10067099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(261021123027099003)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZL83yQBNcdoxHfKAqWdN2uPAS3tyErcx4Pnp/q3hAtNfl5ktZIZIg2eRiFZN?=
 =?us-ascii?Q?l1e5c1QnT1mk91P66xwZVeix4MS5Ne7XpwQVBCR9r2Tz6uNeg3LbF9F8Ns9M?=
 =?us-ascii?Q?GR8tQJfTYyjGIPYM2CQSbx3itha8t13klkCdQrz3Rjcq+6HjHg5ogvzzbh7x?=
 =?us-ascii?Q?Cnh21oPPKeaeEE1za6wQbtTKJ9LQJtC4XlM32GxpVk6xjfQyk2ppyphU/hW3?=
 =?us-ascii?Q?Jz+3758Nx9UTH+PxnalnvPfF+UFASYoi4csWflNRzpOCOAIYd87zd6O1o55T?=
 =?us-ascii?Q?D3Ih89MehCSObfHohVFVISXWntP2DcePbbalNavUASD+dSiXOPpmmc81jnnj?=
 =?us-ascii?Q?7gyPVMQqfWqxK7Nqmm2Gg/ayyjdgV0PdvZWILWnz0xeU86vy9VF0QLNtES9N?=
 =?us-ascii?Q?GBWsBSjZatYTdyZrfpNNZuhF7CYD7PSOBLYvjAKrf6rn5bEygyfyjuy4Gl7l?=
 =?us-ascii?Q?o2TaPkstdQ7BFM9xqsNBpbMd6CPeyFA2C/oOzmPvo9e6PfGD8xB1f4dCXE7P?=
 =?us-ascii?Q?0ngyI7EIxRZYl3XO/OotSZp9pjOGjP4t7TxqBhIlERP2PcQKpRX9zBfq/uao?=
 =?us-ascii?Q?jvjb14eEe9Cf/FY9paqtHqkZdzjeY3uabHDj415ZaiKbWxk/AejV2DQzyrfK?=
 =?us-ascii?Q?5jCbl5NGQKd0Zs42u+X8biEUf63DozNqTwaElUBgpGVEDws88ltgSF9aWIxe?=
 =?us-ascii?Q?mCq46o8R7AMvYoziZlXeN5YYpfxmZu+I9xg96PV30/osei/HS7LTvmz4Iljq?=
 =?us-ascii?Q?XPTBJa6HjdiSUdhYkxLBacHJm8i3wCGi+dqY9Oxfh1Y3+97XlAps1qztFuqy?=
 =?us-ascii?Q?6P8w1rcHvKc/YvbrzyNLTpv9yWCR+4CdxcOz4VeLE9Y8b2YuazKks9HgpaFT?=
 =?us-ascii?Q?BFLzqzs1KI7CxD8YVMcUBeqCto3AWEsrX73gqzJSMCYW2DU9FCE3UOJ55JmZ?=
 =?us-ascii?Q?5MKNMhzJe5ORgasjX8j/K4t5AFWp/soyctzBJyqX/rcEqmuZLycG5qsSxfxr?=
 =?us-ascii?Q?XK/d4QAZSwJpcW2GuYwQwpIelKN05/Cn05VwYlhukV0mzag8qHx2wAheLVcy?=
 =?us-ascii?Q?4WZ0ikWzScWHPNtr7N2JWR8FxtIuy17lWsqSpqSDCQAHZsfLKxNUya0BJROs?=
 =?us-ascii?Q?AuaoDZrZymhKbjcG1AHVU7RyqiihOtd4v0lgtN2D82YrGHX2RfYf6HksiTKW?=
 =?us-ascii?Q?lnpEF1k35+I46qdwY9hG50ozjL9cQYWXLrxmZhjQboXi3hbEvWhf35QWnBop?=
 =?us-ascii?Q?UzP/w2hkpScko5udZTB9nXokjBUNp2skHBZxCCJ5D3NNMwWPIF90VK2UBWYj?=
 =?us-ascii?Q?e6rhu8ZOra7UqhcHAjkj6E8NKwHMbjWraLsq1pIrhcgIHcwEQ+28ue8Qh5Ht?=
 =?us-ascii?Q?nCOtjRdzJb7Qa8t+uHMp7WVjHftbk+/jVOWnyRNyV9x43HjkEBZ8dnizKrif?=
 =?us-ascii?Q?VKHq8XXlscRKvA3qnQbMQV+w8a5GNb6uX46libIOkeaWYnUVa8ovOyzYERUN?=
 =?us-ascii?Q?r4E1ayVkFUuf7BP55S25eEDGbG+je4u6nmrpj8/MnRfMqs1UF11EngeMwmNv?=
 =?us-ascii?Q?wlvMcHihFEYu19k8wKS5ozIqkl6Phx1ZMVnvHB0mumNSKqM6XHPoN31f4owX?=
 =?us-ascii?Q?LIy5K6tmlhiXI2nhkvQqIITdfcsAyIb5nc8DfXwhh3PRdKM/xBEn9a+hnHSj?=
 =?us-ascii?Q?lW625EX76+tShQg/SIRPqaFUFkhg/7ScWcA09RF73BZpveiVx8B5Dl/6xxgg?=
 =?us-ascii?Q?bie7AlYemA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f828882b-4c26-4f54-5cce-08df35be37e6
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:12:00.9172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZEGOMRSai7P51IlaxATym+YlAG0XPWNngUivjjPTje9kEAfW5aWArRh456W9keOUi2aGbQa73zJsmU69r2Tfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 13:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248948
Content-Type: text/plain; charset="utf-8"

Build and run the lttng-ust unit test suite under ptest, modelled on the
liburcu ptest support: the run-ptest script executes each TAP test from
the tests/unit subdirectories and reports PASS/FAIL. The compile tests,
benchmarks and the abi0-conflict regression test (unstable under QEMU)
are excluded.

The ust-elf test ships prebuilt, intentionally foreign-architecture ELF
fixtures, so they are kept from being stripped and the related QA checks
are relaxed for the ptest package.

Tested on qemuriscv64 with ptest-runner.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-kernel/lttng/lttng-ust/run-ptest | 31 ++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb | 58 ++++++++++++++++++-
 3 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 74591a34f2..d5357d8732 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -64,6 +64,7 @@ PTESTS_FAST =3D "\
     libxslt \
     libyaml \
     logrotate \
+    lttng-ust \
     lua \
     lzo \
     m4 \
diff --git a/meta/recipes-kernel/lttng/lttng-ust/run-ptest b/meta/recipes-k=
ernel/lttng/lttng-ust/run-ptest
new file mode 100644
index 0000000000..468562eb70
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/run-ptest
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+PTEST_PATH=3D$(dirname "$0")
+cd "$PTEST_PATH/tests" || exit 1
+
+export UST_TESTS_SRCDIR=3D"$PTEST_PATH/tests"
+export UST_TESTS_BUILDDIR=3D"$PTEST_PATH/tests"
+
+TESTS=3D"
+unit/libringbuffer/test_shm
+unit/gcc-weak-hidden/test_gcc_weak_hidden
+unit/libcommon/test_get_cpu_mask_from_sysfs
+unit/libcommon/test_get_max_cpuid_from_mask
+unit/libcommon/test_get_max_cpuid_from_sysfs
+unit/libcommon/test_get_possible_cpus_array_len
+unit/libmsgpack/test_msgpack
+unit/pthread_name/test_pthread_name
+unit/snprintf/test_snprintf
+unit/ust-elf/test_ust_elf
+unit/ust-error/test_ust_error
+unit/ust-utils/test_ust_utils
+"
+
+for test in $TESTS; do
+    [ -x "$test" ] || continue
+    if ( cd "$(dirname "$test")" && ./"$(basename "$test")" ); then
+        echo "PASS: $test"
+    else
+        echo "FAIL: $test"
+    fi
+done
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb b/meta/recipes-k=
ernel/lttng/lttng-ust_2.16.0.bb
index abc701cb79..13842535b9 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb
@@ -13,7 +13,7 @@ PYTHON_OPTION =3D "am_cv_python_pyexecdir=3D'${PYTHON_SIT=
EPACKAGES_DIR}' \
=20
 # lttng-ust publishes bugfix/security-only releases on its per-minor
 # stable-X.Y branches, the same upstream and release model as lttng-tools.
-inherit autotools lib_package manpages python3native pkgconfig upstream-st=
able-release-point
+inherit autotools lib_package manpages python3native pkgconfig upstream-st=
able-release-point ptest
=20
 include lttng-platforms.inc
=20
@@ -33,6 +33,7 @@ PE =3D "2"
 SRC_URI =3D "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setu=
p.patch \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch=
 \
+           file://run-ptest \
            "
=20
 SRC_URI[sha256sum] =3D "1e84e02fa1fc1261eb6cf3d14d64006506a29f7c605ac85de0=
2180318c6aa38a"
@@ -52,3 +53,58 @@ do_install:append() {
         # still refer to Python 2 in the shebang
         sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${bindir}/ltt=
ng-gen-tp
 }
+
+RDEPENDS:${PN}-ptest +=3D "bash liburcu"
+
+INHIBIT_PACKAGE_STRIP_FILES =3D "\
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/x86_64/main.elf \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/x86_64/main.elf.debug \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/x86/main.elf \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/x86/main.elf.debug \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/armeb/main.elf \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/armeb/main.elf.debug \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/aarch64_be/main.elf \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/aarch64_be/main.elf.debug=
 \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/pic/hello.exec \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/pic/hello.pic \
+    ${PKGD}${PTEST_PATH}/tests/unit/ust-elf/data/pic/hello.pie \
+"
+
+INSANE_SKIP:${PN}-ptest +=3D "arch ldflags buildpaths"
+SKIP_FILEDEPS:${PN}-ptest =3D "1"
+
+LTTNG_UST_PTEST_DIRS =3D " \
+    unit/libringbuffer \
+    unit/gcc-weak-hidden \
+    unit/libcommon \
+    unit/libmsgpack \
+    unit/pthread_name \
+    unit/snprintf \
+    unit/ust-elf \
+    unit/ust-error \
+    unit/ust-utils \
+"
+
+do_compile_ptest() {
+    for d in ${LTTNG_UST_PTEST_DIRS}; do
+        oe_runmake -C ${B}/tests/$d check TESTS=3D
+    done
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/utils
+    install -m 0644 ${S}/tests/utils/tap.sh ${S}/tests/utils/utils.sh ${D}=
${PTEST_PATH}/tests/utils/
+
+    for d in ${LTTNG_UST_PTEST_DIRS}; do
+        mf=3D${B}/tests/$d/Makefile
+        install -d ${D}${PTEST_PATH}/tests/$d
+        for p in $(makefile-getvar $mf noinst_PROGRAMS); do
+            ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/$d/$p=
 ${D}${PTEST_PATH}/tests/$d/
+        done
+        for s in $(makefile-getvar $mf dist_noinst_SCRIPTS dist_check_SCRI=
PTS); do
+            install -m 0755 ${S}/tests/$d/$s ${D}${PTEST_PATH}/tests/$d/
+        done
+    done
+
+    cp -R --preserve=3Dmode ${S}/tests/unit/ust-elf/data ${D}${PTEST_PATH}=
/tests/unit/ust-elf/
+}
--=20
2.43.0

