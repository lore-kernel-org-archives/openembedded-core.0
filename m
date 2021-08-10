Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.75])
 by mx.groups.io with SMTP id smtpd.web11.4865.1628579293512469052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 00:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=WFYCvMnr;
 spf=pass (domain: kpit.com, ip: 40.107.138.75, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEC+59PM3zncDpDbr9n8ejm1EIqIKhR1eQ06bzDQi1eDskWA5PXY1E9B+eHDTzPIrgWk5GQI9291bs0rCtaVF3qukKue66u+2jmTJHqK2LEvCjyUz12EljkMh+gGaaVXwiYG29PcrU14EiDeLcGEi0siDXwj2o/mmK9hypSWeoTzXHncDDGfMGhfOVnWLDbd1ANNzQYkuRphDjWGOJDiDlyWwOzRtQkhdvdWqHSfus0vNHxL0ODO6gxw6h9HTfSs7I7RkOgxpDdpOHv+YFI/cBWODO56AcQeW0QGZ7iShQezDFQ8KUfVQIHRdxiru3UkkgfzRknp1NqMK8odTXkWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bqo/d9eQLp4N8/UeF3HGQvhsyVMKItc28ianIaMpbeQ=;
 b=i/lPAxqZ7kCb2MiX1G4sgMmxwkhrdw/TCxXGLVhk2E3D4Dcxi9/EDhcQuDs8pP2e4k4kDw9zOdVqO5FCgHXHsriA4JjLdQ1VtiT9vcAq4/QFYpaXJANZiyZkMlUcT6mVq8gRZ76hrGk1uH6toEDpcfqSh+BABSgWPEG8v3FwwlwZoUj44QmamnXt7TjqJDUEg+3riBFyHQ2tzJv1mxJwpLSRLqjW+sj+26sKZ5ECJ3M52s+0EfWlNTxMImoL5pfCNYR/vBHJLolBo4d2ECYTFbC6fMeQfZ1muG0Db4wHAKYTLTLG89t2mxnMxPNDKXuBobzRommOHoilCnFxW6uUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bqo/d9eQLp4N8/UeF3HGQvhsyVMKItc28ianIaMpbeQ=;
 b=WFYCvMnrl+CGSrcUkZ4m7MZrLANiJxMWW7UIATVj1LOSq3oJg0dEXaR6KOfHWYGlt2Y6bb/WqDpM/SUwwwm4Z4lW+WdnsZtkUSxOIoahMRX3jXmomgg1VNujgGPBZ0tuyLhAawobiUFbC9zWz/NgMWqc112QYRrILFoYVtUMwc8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2e::19)
 by PN2PR01MB4569.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.23; Tue, 10 Aug
 2021 07:08:08 +0000
Received: from PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f11e:1343:761a:58a1]) by PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f11e:1343:761a:58a1%6]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 07:08:08 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Mikko.Rapeli@bmw.de
Subject: [poky][dunfell][PATCH] python3: Remove unused python3 recipe
Date: Tue, 10 Aug 2021 12:37:41 +0530
Message-Id: <1628579261-7380-1-git-send-email-purushottam.choudhary@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: PN2PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::16) To PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2e::19)
Return-Path: purushottam.choudhary@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2405:201:a410:a032:87a:39cd:504:7902) by PN2PR01CA0101.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:27::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 07:08:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7764cdb8-aacb-4b25-9a92-08d95bcd9a94
X-MS-TrafficTypeDiagnostic: PN2PR01MB4569:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB4569A5E3AEB79AEC6AC525C690F79@PN2PR01MB4569.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7cnH8qV7k5W3QzgdhQQjDOk2YzOXyYf9wdYUcx+BwUInqhdzeXaq3VYAH/ggvArmfS7AJVBRSh3OtGXzwAhWWoth491ai26O2UXGZnxlU+VTKHNtw0N4rP4/H32YGzs0MsVxBTy91Mx2GJikuFuekdeciii9/bJvnqqPi6GFEVpatoFWt9vg5+KEPrcc1cnvNPfmAK47qBdCesG7FwkvZUJfNfvoovkttah8IwewTLDxCTmhzHhkrpmJ7X4qJ/n9LyyFYjqluYumSf22LPgH0Ew2esKAxR1m5Q6HNkNRK3ctRtIF0b+d1uhu8i+iAT7N3GK7hDs9R27oiMPG+j02X/5G53KIYzttHrE3VGiyHxQRYgoc4FyickfBGOEz2Hc8EHhlClMEB9QBV7a0idbkMd/67l9/mO7eujHDuAhlfBmDOoAIYq5z+KWa/C7rZpfPFoWJ5uTw4JtWCid6m6ShclDLrrdoUl3+ZaCBYUpm9idGS/tAYxhRiUXnE9BxCvZndxxBB0busUvTHY3gk6IsY16epKOzJtl8RGZKcdjiFO3VuVQawaAi7RWDFAhiJ3cExzBv8dgUAknPKHCXYgqqIhpdj0v24Aesm+Vla9c2Wkegbf0LPNIT1HhfVNFSDTCE/pLBrd4yLb8dtISBw9kyd2ehTYrqVz7QyHKC6UTdWucPf35jiGdFr/TXDkLS/vqf07vLBp2rdh11dmXmJe7p9WR+cMwohUBuiDa68Ox/xpM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39850400004)(346002)(136003)(44832011)(2616005)(5660300002)(316002)(52116002)(66574015)(2906002)(4326008)(6506007)(83380400001)(966005)(478600001)(66946007)(30864003)(8936002)(36756003)(86362001)(6666004)(6486002)(8676002)(186003)(6512007)(66476007)(66556008)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uMf0iB63EYrQ2Pcvf/8G6y8x7fHn3ON40nIUN/g01AJSuHgNK1rUa/So62C5?=
 =?us-ascii?Q?o8i/V9Gs8udBni4GWqh13CJiaBpWx27weCro/VccIugjvimPgBoyLpl3PSX+?=
 =?us-ascii?Q?iAdSbN9YZ6YIWVsCM/JSDp4a4CtSddIemi2iH4aMHj5d2qUMHS+JInwJgRIx?=
 =?us-ascii?Q?QYWVZSu+hEqkZ315N61TY2QRXjmk19ht/nifAoF6UzRbgPY6esXqLbIHM1aR?=
 =?us-ascii?Q?/INx2/3fpKtewzUr51O/3UjA8CJB10reZLfAa8vY09xB8/2ibwCOZAg1rMRk?=
 =?us-ascii?Q?yA99TdPqRq45kz0PvhREUFKjH7c5XNnUZHzYfhsw8pSSxd19ifNleEv1K/IT?=
 =?us-ascii?Q?9bKqGIjO8tfFHcvBGQ1MpAaUZLtRvCqgZQLiO/0Y/36pN/cnb966DbMqJOxD?=
 =?us-ascii?Q?+9PLzOVP/dwsMMqIpF8G23XacR+K+/k2T9PnrIUyO1CkMPmg42dtRPd0LOc0?=
 =?us-ascii?Q?zYWaHYOG/5/t8OJMnCqb0wgzIKrzpINx8dkTEoJXg4Mwyoo9rcJuHC7Y+pOf?=
 =?us-ascii?Q?xIGo4ZpcBb/LOtfjZ2ZiF8fLLRnCmxBhfAOgTH+zekbyNSkM03J16PyIEpyN?=
 =?us-ascii?Q?9QQQO4XEprUENc5V4d4xefnKy/0qXnrLlaoMeiAvoFSopb18ZsLKU/l6n/jf?=
 =?us-ascii?Q?2JetpA+JAtFnWy5ti+aFEgHEMJk0MFQkvx8gYTpdcN8zHLFktdzfa/oi1sUz?=
 =?us-ascii?Q?gBR8aoBkNrBSj6a5NMKuqMMOtTwirqcU9ROvpXIljxTHEL1ijccAjpJRQoCy?=
 =?us-ascii?Q?KXjtro/eVSt/AWKhVekFVI5o2llBtpHN6m19exGFwhSTg/fIehO3vuEOCqUe?=
 =?us-ascii?Q?wjCqjP8mpOZnyrYIpvCL3j+8iuseqzr+4z7irj0Y9/S3KQIFH2onaA4/Nmtn?=
 =?us-ascii?Q?a4lpXG2cJbgvcVRQEDnKuvbxz/TJMP/hU6iZm3CxVoIKeoR1oeoftTG16BnG?=
 =?us-ascii?Q?vAdIzYKdiJywaq7DzF0eP17m4pRyN8ebscqodCWGQON4uAvY4gAaQmK6SmO0?=
 =?us-ascii?Q?Y5qECkgpAY1GW5Mm7E7QjkVXelYQD2AkY2+kDmcTi5AIJmQFeeE/qwU7BC+H?=
 =?us-ascii?Q?S89R9jrcsqZQq2W3nbdjrPvULqug4Pq5A8w1gxJK+PHx97GoymBqPm10q/hv?=
 =?us-ascii?Q?VzhU+hOSSE/iCvuGbOOaVBDC0b5pe3iDqm3xGtcmuzqb38JWSLWnETGT9JEM?=
 =?us-ascii?Q?oSl18GSDmvL5lu4ecWcNKEzOfRI5WLFWhUQzS7zuchbyiR2D+g6YGA0ARicZ?=
 =?us-ascii?Q?4DqVXS+ca3GiUR/PEU/jOxCJfUDWbvomSnMhMqRqbiYgZ8QvoSiL7iC833Ua?=
 =?us-ascii?Q?r0Jqo/l23HsAQSU5g3gIyf47aD9GBuG+mGrRmUhCh3kuQbvhU6E+OU023fKb?=
 =?us-ascii?Q?EAW1bF6SqUodyDod0n2whm73fMj6?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7764cdb8-aacb-4b25-9a92-08d95bcd9a94
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4944.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:08:07.1598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPN7nkv7IVbC3QYckVYmTtuZSYmJwz4NqcgVvypUjOhIbl61UbomVjxp/cO3rWE8mn6g2ZK/q60QYnAtupL2tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4569
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Currently in dunfell branch python3 version is 3.8.11.
so, python3_3.8.10.bb is not needed.
Hence, removed.
---
 meta/recipes-devtools/python/python3_3.8.10.bb | 363 ---------------------=
----
 1 file changed, 363 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3_3.8.10.bb

diff --git a/meta/recipes-devtools/python/python3_3.8.10.bb b/meta/recipes-=
devtools/python/python3_3.8.10.bb
deleted file mode 100644
index 7295c63..0000000
--- a/meta/recipes-devtools/python/python3_3.8.10.bb
+++ /dev/null
@@ -1,363 +0,0 @@
-SUMMARY =3D "The Python Programming Language"
-HOMEPAGE =3D "http://www.python.org"
-DESCRIPTION =3D "Python is a programming language that lets you work more =
quickly and integrate your systems more effectively."
-LICENSE =3D "PSF-2.0 & BSD-0-Clause"
-SECTION =3D "devel/python"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc22d2438294c784731bf9dd224a467b=
7"
-
-SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
-           file://run-ptest \
-           file://create_manifest3.py \
-           file://get_module_deps3.py \
-           file://python3-manifest.json \
-           file://check_build_completeness.py \
-           file://cgi_py.patch \
-           file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid=
-.patch \
-           ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_w=
arning_about_tkinter.patch', d)} \
-           file://0001-Do-not-use-the-shell-version-of-python-config-that-=
w.patch \
-           file://python-config.patch \
-           file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profil=
e.patch \
-           file://0001-Do-not-hardcode-lib-as-location-for-site-packages-a=
n.patch \
-           file://0001-python3-use-cc_basename-to-replace-CC-for-checking-=
c.patch \
-           file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-har=
d.patch \
-           file://0001-Makefile-fix-Issue36464-parallel-build-race-problem=
.patch \
-           file://0001-bpo-36852-proper-detection-of-mips-architecture-for=
-.patch \
-           file://crosspythonpath.patch \
-           file://reformat_sysconfig.py \
-           file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
-           file://0001-test_locale.py-correct-the-test-output-format.patch=
 \
-           file://0017-setup.py-do-not-report-missing-dependencies-for-dis=
a.patch \
-           file://0001-setup.py-pass-missing-libraries-to-Extension-for-mu=
l.patch \
-           file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
-           file://0001-configure.ac-fix-LIBPL.patch \
-           file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
-           file://0020-configure.ac-setup.py-do-not-add-a-curses-include-p=
a.patch \
-           file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch =
\
-           "
-
-SRC_URI_append_class-native =3D " \
-           file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sy=
s.patch \
-           file://12-distutils-prefix-is-inside-staging-area.patch \
-           file://0001-Don-t-search-system-for-headers-libraries.patch \
-           "
-
-SRC_URI[md5sum] =3D "d9eee4b20155553830a2025e4dcaa7b3"
-SRC_URI[sha256sum] =3D "6af24a66093dd840bcccf371d4044a3027e655cf24591ce26e=
48022bc79219d9"
-
-# exclude pre-releases for both python 2.x and 3.x
-UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-
-CVE_PRODUCT =3D "python"
-
-# Upstream consider this expected behaviour
-CVE_CHECK_WHITELIST +=3D "CVE-2007-4559"
-# This is not exploitable when glibc has CVE-2016-10739 fixed.
-CVE_CHECK_WHITELIST +=3D "CVE-2019-18348"
-
-# This is windows only issue.
-CVE_CHECK_WHITELIST +=3D "CVE-2020-15523"
-
-PYTHON_MAJMIN =3D "3.8"
-
-S =3D "${WORKDIR}/Python-${PV}"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-inherit autotools pkgconfig qemu ptest multilib_header update-alternatives
-
-MULTILIB_SUFFIX =3D "${@d.getVar('base_libdir',1).split('/')[-1]}"
-
-ALTERNATIVE_${PN}-dev =3D "python3-config"
-ALTERNATIVE_LINK_NAME[python3-config] =3D "${bindir}/python${PYTHON_MAJMIN=
}-config"
-ALTERNATIVE_TARGET[python3-config] =3D "${bindir}/python${PYTHON_MAJMIN}-c=
onfig-${MULTILIB_SUFFIX}"
-
-
-DEPENDS =3D "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib vi=
rtual/libintl xz virtual/crypt util-linux libtirpc libnsl2 autoconf-archive=
"
-DEPENDS_append_class-target =3D " python3-native"
-DEPENDS_append_class-nativesdk =3D " python3-native"
-
-EXTRA_OECONF =3D " --without-ensurepip --enable-shared"
-EXTRA_OECONF_append_class-native =3D " --bindir=3D${bindir}/${PN}"
-
-export CROSSPYTHONPATH=3D"${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/=
lib-dynload/"
-
-EXTRANATIVEPATH +=3D "python3-native"
-
-CACHED_CONFIGUREVARS =3D " \
-                ac_cv_file__dev_ptmx=3Dyes \
-                ac_cv_file__dev_ptc=3Dno \
-                ac_cv_working_tzset=3Dyes \
-"
-python() {
-    # PGO currently causes builds to not be reproducible, so disable it fo=
r
-    # now. See YOCTO #13407
-    if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False,=
 d) and d.getVar('BUILD_REPRODUCIBLE_BINARIES') !=3D '1':
-        d.setVar('PACKAGECONFIG_PGO', 'pgo')
-    else:
-        d.setVar('PACKAGECONFIG_PGO', '')
-}
-
-PACKAGECONFIG_class-target ??=3D "readline ${PACKAGECONFIG_PGO} gdbm"
-PACKAGECONFIG_class-native ??=3D "readline gdbm"
-PACKAGECONFIG_class-nativesdk ??=3D "readline gdbm"
-PACKAGECONFIG[readline] =3D ",,readline"
-# Use profile guided optimisation by running PyBench inside qemu-user
-PACKAGECONFIG[pgo] =3D "--enable-optimizations,,qemu-native"
-PACKAGECONFIG[tk] =3D ",,tk"
-PACKAGECONFIG[gdbm] =3D ",,gdbm"
-
-do_configure_prepend () {
-    mkdir -p ${B}/Modules
-    cat > ${B}/Modules/Setup.local << EOF
-*disabled*
-${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
-${@bb.utils.contains('PACKAGECONFIG', 'readline', '', 'readline', d)}
-EOF
-}
-
-CPPFLAGS_append =3D " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uui=
d"
-
-EXTRA_OEMAKE =3D '\
-  STAGING_LIBDIR=3D${STAGING_LIBDIR} \
-  STAGING_INCDIR=3D${STAGING_INCDIR} \
-  LIB=3D${baselib} \
-'
-
-do_compile_prepend_class-target() {
-       if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false', d)=
}; then
-                qemu_binary=3D"${@qemu_wrapper_cmdline(d, '${STAGING_DIR_T=
ARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
-                cat >pgo-wrapper <<EOF
-#!/bin/sh
-cd ${B}
-$qemu_binary "\$@"
-EOF
-                chmod +x pgo-wrapper
-        fi
-}
-
-do_install_prepend() {
-        ${WORKDIR}/check_build_completeness.py ${T}/log.do_compile
-}
-
-do_install_append_class-target() {
-        oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
-}
-
-do_install_append_class-native() {
-        # Make sure we use /usr/bin/env python
-        for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/=
${PN}`; do
-                sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
-        done
-        # Add a symlink to the native Python so that scripts can just invo=
ke
-        # "nativepython" and get the right one without needing absolute pa=
ths
-        # (these often end up too long for the #! parser in the kernel as =
the
-        # buffer is 128 bytes long).
-        ln -s python3-native/python3 ${D}${bindir}/nativepython3
-}
-
-do_install_append() {
-        mkdir -p ${D}${libdir}/python-sysconfigdata
-        sysconfigfile=3D`find ${D} -name _sysconfig*.py`
-        cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdat=
a.py
-
-        sed -i  \
-                -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
-                -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}'\=
,,g" \
-                -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_I=
NCDIR}'\,,g" \
-                -e "/^ 'INCLDIRSTOMAKE'/{N; s,/usr/include,${STAGING_INCDI=
R},g}" \
-                -e "/^ 'INCLUDEPY'/s,/usr/include,${STAGING_INCDIR},g" \
-                ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
-}
-
-do_install_append_class-nativesdk () {
-    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS=3D'$=
{sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/ter=
minfo:/lib/terminfo' PYTHONNOUSERSITE=3D'1'
-}
-
-SSTATE_SCAN_FILES +=3D "Makefile _sysconfigdata.py"
-PACKAGE_PREPROCESS_FUNCS +=3D "py_package_preprocess"
-
-py_package_preprocess () {
-        # Remove references to buildmachine paths in target Makefile and _=
sysconfigdata
-        sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e s:'--with-li=
btool-sysroot=3D${STAGING_DIR_TARGET}'::g \
-                -e 's|${DEBUG_PREFIX_MAP}||g' \
-                -e 's:${HOSTTOOLS_DIR}/::g' \
-                -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-                -e 's:${RECIPE_SYSROOT}::g' \
-                -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_M=
AJMIN}${PYTHON_ABI}*/Makefile \
-                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.p=
y \
-                ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
-
-        # Reformat _sysconfigdata after modifying it so that it remains
-        # reproducible
-        for c in ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.=
py; do
-            python3 ${WORKDIR}/reformat_sysconfig.py $c
-        done
-
-        # Recompile _sysconfigdata after modifying it
-        cd ${PKGD}
-        sysconfigfile=3D`find . -name _sysconfigdata_*.py`
-        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-             -c "from py_compile import compile; compile('$sysconfigfile')=
"
-        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-             -c "from py_compile import compile; compile('$sysconfigfile',=
 optimize=3D1)"
-        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-             -c "from py_compile import compile; compile('$sysconfigfile',=
 optimize=3D2)"
-        cd -
-
-        mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bindi=
r}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
-
-        #Remove the unneeded copy of target sysconfig data
-        rm -rf ${PKGD}/${libdir}/python-sysconfigdata
-}
-
-# We want bytecode precompiled .py files (.pyc's) by default
-# but the user may set it on their own conf
-INCLUDE_PYCS ?=3D "1"
-
-python(){
-    import collections, json
-
-    filename =3D os.path.join(d.getVar('THISDIR'), 'python3', 'python3-man=
ifest.json')
-    # This python changes the datastore based on the contents of a file, s=
o mark
-    # that dependency.
-    bb.parse.mark_dependency(d, filename)
-
-    with open(filename) as manifest_file:
-        manifest_str =3D  manifest_file.read()
-        json_start =3D manifest_str.find('# EOC') + 6
-        manifest_file.seek(json_start)
-        manifest_str =3D manifest_file.read()
-        python_manifest =3D json.loads(manifest_str, object_pairs_hook=3Dc=
ollections.OrderedDict)
-
-    # First set RPROVIDES for -native case
-    # Hardcoded since it cant be python3-native-foo, should be python3-foo=
-native
-    pn =3D 'python3'
-    rprovides =3D d.getVar('RPROVIDES').split()
-
-    # ${PN}-misc-native is not in the manifest
-    rprovides.append(pn + '-misc-native')
-
-    for key in python_manifest:
-        pypackage =3D pn + '-' + key + '-native'
-        if pypackage not in rprovides:
-              rprovides.append(pypackage)
-
-    d.setVar('RPROVIDES_class-native', ' '.join(rprovides))
-
-    # Then work on the target
-    include_pycs =3D d.getVar('INCLUDE_PYCS')
-
-    packages =3D d.getVar('PACKAGES').split()
-    pn =3D d.getVar('PN')
-
-    newpackages=3D[]
-    for key in python_manifest:
-        pypackage =3D pn + '-' + key
-
-        if pypackage not in packages:
-            # We need to prepend, otherwise python-misc gets everything
-            # so we use a new variable
-            newpackages.append(pypackage)
-
-        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
-        d.setVar('FILES_' + pypackage, '')
-        for value in python_manifest[key]['files']:
-            d.appendVar('FILES_' + pypackage, ' ' + value)
-
-        # Add cached files
-        if include_pycs =3D=3D '1':
-            for value in python_manifest[key]['cached']:
-                    d.appendVar('FILES_' + pypackage, ' ' + value)
-
-        for value in python_manifest[key]['rdepends']:
-            # Make it work with or without $PN
-            if '${PN}' in value:
-                value=3Dvalue.split('-', 1)[1]
-            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
-
-        for value in python_manifest[key].get('rrecommends', ()):
-            if '${PN}' in value:
-                value=3Dvalue.split('-', 1)[1]
-            d.appendVar('RRECOMMENDS_' + pypackage, ' ' + pn + '-' + value=
)
-
-        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
-
-    # Prepending so to avoid python-misc getting everything
-    packages =3D newpackages + packages
-    d.setVar('PACKAGES', ' '.join(packages))
-    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
-    d.setVar('ALLOW_EMPTY_${PN}-pkgutil', '1')
-}
-
-# Files needed to create a new manifest
-
-do_create_manifest() {
-    # This task should be run with every new release of Python.
-    # We must ensure that PACKAGECONFIG enables everything when creating
-    # a new manifest, this is to base our new manifest on a complete
-    # native python build, containing all dependencies, otherwise the task
-    # wont be able to find the required files.
-    # e.g. BerkeleyDB is an optional build dependency so it may or may not
-    # be present, we must ensure it is.
-
-    cd ${WORKDIR}
-    # This needs to be executed by python-native and NOT by HOST's python
-    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
-    cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
-}
-
-# bitbake python -c create_manifest
-# Make sure we have native python ready when we create a new manifest
-addtask do_create_manifest after do_patch do_prepare_recipe_sysroot
-
-# manual dependency additions
-RRECOMMENDS_${PN}-core_append_class-nativesdk =3D " nativesdk-python3-modu=
les"
-RRECOMMENDS_${PN}-crypt_append_class-target =3D " openssl ca-certificates"
-RRECOMMENDS_${PN}-crypt_append_class-nativesdk =3D " openssl ca-certificat=
es"
-
-# For historical reasons PN is empty and provided by python3-modules
-FILES_${PN} =3D ""
-RPROVIDES_${PN}-modules =3D "${PN}"
-
-FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
-FILES_${PN}-idle +=3D "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
-
-# provide python-pyvenv from python3-venv
-RPROVIDES_${PN}-venv +=3D "python3-pyvenv"
-
-# package libpython3
-PACKAGES =3D+ "libpython3 libpython3-staticdev"
-FILES_libpython3 =3D "${libdir}/libpython*.so.*"
-FILES_libpython3-staticdev +=3D "${libdir}/python${PYTHON_MAJMIN}/config-$=
{PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
-INSANE_SKIP_${PN}-dev +=3D "dev-elf"
-INSANE_SKIP_${PN}-ptest +=3D "dev-deps"
-
-# catch all the rest (unsorted)
-PACKAGES +=3D "${PN}-misc"
-RDEPENDS_${PN}-misc +=3D "python3-core python3-email python3-codecs python=
3-pydoc python3-pickle python3-audio"
-RDEPENDS_${PN}-modules_append_class-target =3D " python3-misc"
-RDEPENDS_${PN}-modules_append_class-nativesdk =3D " python3-misc"
-FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${P=
YTHON_MAJMIN}/lib-dynload"
-
-# catch manpage
-PACKAGES +=3D "${PN}-man"
-FILES_${PN}-man =3D "${datadir}/man"
-
-# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue=
37395
-RDEPENDS_libpython3_append_libc-glibc =3D " libgcc"
-RDEPENDS_${PN}-ctypes_append_libc-glibc =3D " ${MLPREFIX}ldconfig"
-RDEPENDS_${PN}-ptest =3D "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 =
libgcc tzdata-europe coreutils sed"
-RDEPENDS_${PN}-ptest_append_libc-glibc =3D " locale-base-tr-tr.iso-8859-9"
-RDEPENDS_${PN}-tkinter +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk', '=
tk tk-lib', '', d)}"
-RDEPENDS_${PN}-dev =3D ""
-
-RDEPENDS_${PN}-tests_append_class-target =3D " bash"
-RDEPENDS_${PN}-tests_append_class-nativesdk =3D " bash"
-
-# Python's tests contain large numbers of files we don't need in the recip=
e sysroots
-SYSROOT_PREPROCESS_FUNCS +=3D " py3_sysroot_cleanup"
-py3_sysroot_cleanup () {
-       rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
-}
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
