Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21959.1792672517284513235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 05:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=leo1FNM9;
 spf=pass (domain: est.tech, ip: 52.101.84.39, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ne6UJmPMuO4yCYkHI+M+7Rn7JPGKhyzdpxCM5mK9erecg6eZduoBtVDYOum4F9YVupTLzqLPoMUsVY/Tyi19LKL6dreSuGn4SJUBKi3lPxgE0Wy6TW18Nv/ZkV+6p6TpDpMEi3TMRO1nxDSmDgEB+TrB0sZgYD2DWkx8G+MEOthKBi7t8IVJcvmn7YK29L9oY2xst5b3fzZkrWLrShQ5eSZNLt5lGew8FT6Hffk8+dEkFKKWdIEkgfQBr1fN+RoPzS7WcthPhZaviltzqJhtrTBQxZjJnrbZ16YwyRkptsSsFb1tK+JjV5x5MNHJeRwxJu7L7mDkL+lCTZsIL9SdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KpiasgYZYyKRbS82jeweg7qZfx3tyiBo9k6rjn7OXE=;
 b=I4isz7oltzCjkLw1iAlSspKMQFqfqEITtk78V0ZRLXL2wEiKs1vDCfQ+YgbAQRJqYBhB+c2J1jM9G3pTFcR6+HNthzun4cjwihgDO4aCk8Qkf3ASvBTQnQ06l8g9B5CM3pUHbJA2DuoFtXjGvp3fxnSE4aFs9LqD+KQZcrEJ2mGQl6nZDXh6AQQ/8KxBJYsEdyS3FMz7fPtrrRJcNA9QPJ4JSrk4AU7lfzyrrl78R8LmlWDpqiw5lVPaH+KBNhVnUejncRDzOxQuo2ePyzwtescejaCuDrZbIw8WfTGrA4413IwktKnVbbucFqdKh6ua6FaP2LpsXqt0YxPEYd3WAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KpiasgYZYyKRbS82jeweg7qZfx3tyiBo9k6rjn7OXE=;
 b=leo1FNM9Vs5tOuV7hrPnf2YjlpquykYBIKep+VNzhYO2eAVGuPkzxYfeNPX8gTsQv1wU/8+yYjaTYHCCCN9UWgg/NUHlCrAgWHmDqXjsfesUJU8av5nFpJmJiT3H54ezzwetxIuUnkiLP6TJOMUiFkp7o197MGCN5ItOKHSr4eoCE/7o2N1IrXqlqLzt6y+RjcmADYAqQdlILPEMybw183k9JTXGNvn9XAvOC3BNQjaBIuuwf215AvbuO3+BiMY8VZiM4IgnNhWb3xlYubEgMWWhRqeD4P+f5pVNVGzTL575GK9MhXza4BevwmucXNPqAEDSj+0ru0rj5XIp7RxvmQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM0P189MB0820.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 12:35:12 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 12:35:12 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] liburcu: add ptest support
Date: Thu, 22 Oct 2026 14:35:09 +0200
Message-ID: <20261022123509.14923-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0041.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::19) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AM0P189MB0820:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c400c6f-3618-4dc3-44c4-08df3038eabe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|10067099003|12006099003|261021121427099003|3023799007|13003099007|261021123027099003|260925022911599003|260925021311599003|260925021911599003|261009223027099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: jK/W1cHK3yvJLXF9B0FTG4YzVbSCl/CEY84L2RcxwC8034Sb3aJWHAp3GrjmNnIL6fB99rrKci880V6YM8RgNCl6MmeQzl0MRvmpZTTF2Yzms1P8ltLFxowzdx9Fttd48XEL8QbiHDWdseTH4H5ZMAIJTFcrosfCQMVCbvlECXuQs+uVNqul7JF/LdzKR9fIwAPX/Ag5qGc31Te+S1dao9orMvB1eCrGlqDSwY+BGswA4gbzO7ou+OyuAO5iRbbzPtqhPZ/BGnewWvFH9Hm+Ttr64PM/GlpUrDTVIoUuJpdWOgLYvGzHr8jpkNhvde8sjks6VOhcDGP8E7+Q6zvW0U2tL9c+GRg34WjuJRYwKZkQ+8DB7cHoKF4wwAqTSFT6aSvTdL6CBI7jNpyt/EFSk0mM67Zw40T+aQDldScY71VpAxKbCAp7cWoBJ0uXBGJWVM7lbMmSs3KIfPFm3XInxUywus+MiG7z8YNJ0667h53PkPsn+uw6ozhSrb3vLisL5TDgIPy3fK6PFEg4yYL1DUDlh/QJwPB8qALDxJ7unRiq85/82uzhMrFd4Ni5BiGP1tLqFTaWwbWjn2htb2bSlv8jIghKaKEzc9Pxk3KyMww=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(10067099003)(12006099003)(261021121427099003)(3023799007)(13003099007)(261021123027099003)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x6FwtYptatvyibThr77/sz7OxWiZO5cGwaL7jLGpPakiXGiNKZz1MHepSbze?=
 =?us-ascii?Q?gemP7MvieAHWtrwY1tveet9jy5aVXwews5+qFvMGQX5MUPqbtVktpdb98h/c?=
 =?us-ascii?Q?xTxH/UQixkCuFwpEJ3Le1yJ77F+80FlOBohr6kZhbupDtgBLCqGaAd9uS2q7?=
 =?us-ascii?Q?w7IJPIShMrx+gUcjBZoqCo5S7hn2joHmskP1EFr2DaWiMmuXAbAEE9OM+zxs?=
 =?us-ascii?Q?6DUeg6pl48iCFTV3Enb80rP8SFVQYsWqFg3paJ4Uwj+q1EN+UmlZ2/iR7siA?=
 =?us-ascii?Q?SglOLtq/zzbP7sKtG9s2bgeQnKmRF1tVMvVCty7u/FWoOh3VhXI4L3frrA//?=
 =?us-ascii?Q?LvtzqCmxZHpqkmsX//BHnrSCR8b0dmRt7IPoqc8LoZVcGUPVogCpzTT5xkSg?=
 =?us-ascii?Q?4WCEccGDg1rkMYzx+pv6cy3jvC7Ud0TzQqbzXhHpx852mciyy/Ytj9P2PAvn?=
 =?us-ascii?Q?GLlpjQRb5mQ2eZJxZ2y62VEt5kYuxOTaWiZ6g0/O5F3v28WRxGG/OKWLvc/N?=
 =?us-ascii?Q?nKFmVGWYlOGR8rfA/oJlEGvW+ZiezB/XO5/7PxaOfBN+4sqZWB+krVp1786h?=
 =?us-ascii?Q?xLYEMT3h1PxeHuKQmGxAXq692WLi9Xga3m+L7eY1RKv9bM8vBQAOgrkWvt3H?=
 =?us-ascii?Q?e0BQrWWbsIFkewDbhzWPVSAJEUZD2bo/ECLbufvc16tVN8DkuVfeFVd2f2dJ?=
 =?us-ascii?Q?F4u6xjr7hXaRGjQW/KBFBqBI25ecPocncjZAiZ+24m+HyuTp40gLvIEAwtoe?=
 =?us-ascii?Q?+cWTFyRzSkBiX5fv/2PmAFiakVS1/MoLD38UUblhc1xJXEzz9aoIIxD+fMO9?=
 =?us-ascii?Q?ZS30sldfhN3IhkK1H8PHe24JMRUHMPB8Pm0WvYa3p0fQsRF5dR/H/Ki+jzXw?=
 =?us-ascii?Q?XQLI/rbQvslB+UJ3qiV9I2DMrfOVwzhpscH/HnJwM7jZngkLRL9ACvBdwGvS?=
 =?us-ascii?Q?0q5ybFwMEUS8PQKrktYLxQXTPOORAOplnPY+teY9y/gu0/u+FxfSDegHy8Z1?=
 =?us-ascii?Q?qhaT6qRfjKMtL0o62g7bbI7TrimHE2Hvj9h0eSVQUIE6tSuynuuv/PYKEZlX?=
 =?us-ascii?Q?8UBwTl8/bDG2fonWqjFDuN3c2cU3mMaWnfuz2/rdtLDOtElfHydbqRrTHLWW?=
 =?us-ascii?Q?KNmJzjylH1laH3W8G8fzgNUUJwAqjZfSZoE8ShwyB1iSOUR+Oc9wZTYij0vZ?=
 =?us-ascii?Q?YNE4YgTJcTcoeCWjs/3REC3fQ7qYaJCaTIOCEwdMKLwoXYZnQfYAnBv3NV6a?=
 =?us-ascii?Q?KrYvEPI2PHIalgFdzgMAP/qffEZoInko6pNWqxU/SIILN28ZxLS0jmE78ySj?=
 =?us-ascii?Q?8vZKIyGJaBvNXpaJAOv2alEsaJW0sSjVGkG/vvOqRl+F6x1ZHNs06V5rX8zk?=
 =?us-ascii?Q?wkuWltw4dvF00/7zehQ40zb2Y1/ViXA1/9W9btuWtx00xTqaEbx1/EGgWr4W?=
 =?us-ascii?Q?LeWrttYzpDU2PHo7KDg1S3dGIWgsXppEii0bHayMWRSF4nQ2RwfQ9/aeYFxN?=
 =?us-ascii?Q?3Pmjo8ZYEaijRpSWEJTq5aUUaRwFvggvcbtNXyTt+6KnVx+WXfRVS5WbKdOx?=
 =?us-ascii?Q?dCowAYb5ahBaoR3/57WCgSw3r+lZeo/d3HsO2T2S4PuuD1FUH86Grzy4CuQX?=
 =?us-ascii?Q?i6j3i3FaSlSgrq6Ja2jK42HvPBazyV1PiORb6BVvVeppYAAsTzljz1Qo1cr/?=
 =?us-ascii?Q?LnhujiMMHTlVoAcxEIzAY/Q/TXUMazvitgdLHtGdD+r3wbdF1TNY/TQv1ON3?=
 =?us-ascii?Q?/omn9GtF2Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c400c6f-3618-4dc3-44c4-08df3038eabe
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 12:35:12.5453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKKOXWipyu2tE2o1Hq2u5ivr7pwyilsVWI+/y36pW6R/oe4crJMTnTYCMZQdQ9y54Z9xeXbLz6KIck9AbnmTWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0820
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 12:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248443
Content-Type: text/plain; charset="utf-8"

Build liburcu's upstream unit test suite and run it under ptest. The
test programs and their shell-script wrappers are enumerated from the
Makefile via makefile-getvar and installed with libtool so the real
binaries are resolved from .libs.

Tested on qemuriscv64 with ptest-runner: 24 tests, all pass.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/liburcu/liburcu/run-ptest | 17 ++++++++++
 .../recipes-support/liburcu/liburcu_0.15.7.bb | 32 +++++++++++++++++--
 3 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/liburcu/liburcu/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index a77cf7f5be..74591a34f2 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -51,6 +51,7 @@ PTESTS_FAST =3D "\
     libtimedate-perl \
     libtoml11 \
     libtry-tiny-perl \
+    liburcu \
     libusb1 \
     libxml-namespacesupport-perl \
     libxml-parser-perl \
diff --git a/meta/recipes-support/liburcu/liburcu/run-ptest b/meta/recipes-=
support/liburcu/liburcu/run-ptest
new file mode 100755
index 0000000000..5f8fb4fcfe
--- /dev/null
+++ b/meta/recipes-support/liburcu/liburcu/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+PTEST_PATH=3D$(dirname "$0")
+cd "$PTEST_PATH/tests/unit" || exit 1
+
+export URCU_TESTS_SRCDIR=3D"$PTEST_PATH/tests"
+export URCU_TESTS_BUILDDIR=3D"$PTEST_PATH/tests"
+export URCU_TESTS_OS_TYPE=3D"linux"
+
+for test in $(find . -maxdepth 1 -type f -executable -name "test_*" | sort=
); do
+    testname=3D$(basename "$test")
+    if ./"$test"; then
+        echo "PASS: $testname"
+    else
+        echo "FAIL: $testname"
+    fi
+done
diff --git a/meta/recipes-support/liburcu/liburcu_0.15.7.bb b/meta/recipes-=
support/liburcu/liburcu_0.15.7.bb
index 0aa51903be..18cf6a2e46 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.7.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.7.bb
@@ -11,15 +11,43 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dc2a92498b=
6e88e276f986877995425b8 \
                     file://include/urcu/uatomic/x86.h;beginline=3D1;endlin=
e=3D6;md5=3D358d69272ba7b5f85e29e342430d440c \
                     "
=20
-SRC_URI =3D "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
+SRC_URI =3D "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
+           file://run-ptest \
+           "
=20
 SRC_URI[sha256sum] =3D "2556b83adc0f9b3ac8024e613e17d014d04c4c49110604ce55=
fcb14eae32edd3"
=20
 S =3D "${UNPACKDIR}/userspace-rcu-${PV}"
-inherit autotools multilib_header
+inherit autotools multilib_header ptest
=20
 CPPFLAGS:append:riscv64  =3D " -pthread -D_REENTRANT"
=20
+RDEPENDS:${PN}-ptest +=3D "bash"
+
 do_install:append() {
     oe_multilib_header urcu/config.h
 }
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests/unit check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/unit
+
+    # Compiled test programs (libtool resolves the real binary from .libs)=
.
+    for p in $(makefile-getvar ${B}/tests/unit/Makefile noinst_PROGRAMS); =
do
+        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/unit/$p \
+            ${D}${PTEST_PATH}/tests/unit/
+    done
+
+    # Shell-script test wrappers shipped in the source tree (names come fr=
om
+    # the configured build Makefile; the files live in ${S}).
+    for s in $(makefile-getvar ${B}/tests/unit/Makefile dist_noinst_SCRIPT=
S); do
+        install -m 0755 ${S}/tests/unit/$s ${D}${PTEST_PATH}/tests/unit/
+    done
+
+    install -d ${D}${PTEST_PATH}/tests/utils
+    install -m 0644 ${S}/tests/utils/tap.sh ${D}${PTEST_PATH}/tests/utils/
+    install -m 0644 ${S}/tests/utils/utils.sh ${D}${PTEST_PATH}/tests/util=
s/
+}
--=20
2.43.0

