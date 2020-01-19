Return-Path: <alejandro@enedino.org>
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr700085.outbound.protection.outlook.com [40.107.70.85])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF7F7FC4E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 03:02:06 +0000 (UTC)
Received: from BN7PR02CA0025.namprd02.prod.outlook.com (2603:10b6:408:20::38)
	by CH2PR02MB6408.namprd02.prod.outlook.com (2603:10b6:610:3::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.21;
	Sun, 19 Jan 2020 03:02:06 +0000
Received: from SN1NAM02FT004.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by BN7PR02CA0025.outlook.office365.com
	(2603:10b6:408:20::38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.13 via
	Frontend Transport; Sun, 19 Jan 2020 03:02:06 +0000
Authentication-Results: spf=none (sender IP is 149.199.60.83)
	smtp.mailfrom=enedino.org; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=enedino.org;
Received-SPF: None (protection.outlook.com: enedino.org does not designate
	permitted sender hosts)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT004.mail.protection.outlook.com (10.152.72.175) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2644.19
	via Frontend Transport; Sun, 19 Jan 2020 03:02:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1it0qj-0005k1-Us; Sat, 18 Jan 2020 19:02:05 -0800
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1it0qe-0001Oy-MT; Sat, 18 Jan 2020 19:02:00 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1it0qe-0001Ov-A2; Sat, 18 Jan 2020 19:02:00 -0800
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 19:01:59 -0800
Message-Id: <1579402919-14105-1-git-send-email-alejandro@enedino.org>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--2.545-7.0-31-1
X-imss-scan-details: No--2.545-7.0-31-1;No--2.545-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132238765264848381;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39850400004)(136003)(376002)(346002)(428003)(189003)(199004)(5660300002)(86362001)(9786002)(6916009)(36756003)(70586007)(26005)(70206006)(8676002)(2616005)(107886003)(2906002)(4326008)(81156014)(356004)(81166006)(498600001)(8936002)(426003)(316002)(336012);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR02MB6408; H:xsj-pvapsmtpgw01;
	FPR:; SPF:None; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1f6678b-ea17-4f76-716a-08d79c8bf795
X-MS-TrafficTypeDiagnostic: CH2PR02MB6408:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6408D21821D318A509319B99B8330@CH2PR02MB6408.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0287BBA78D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Y+BItQFp1KtODg03ju3zEdGfM4/ZBzEj58xYkLYDWwGutujAbfmH682Dl6WslPFXN2pIaVvDAEkCKdQW7f+izEfcTeNCyFXyCtWKcUffdMG1KB5a/kGwW/ZbgExaSbwoz7wqGuHTEyQBx3QiEL5vESvtsN2g+fGVlvo7jIor2osIE1DTqbuaLm8FM+RZqeOtDiQM9pnYpM+j1QQZA3ODS4c3nsVuXaD6K5XBtqggASeip9FWU5LXBC1/IuYNwop65ZLIQfRsT1W2SJMYJIhHeu8fry3LFn4fBdYn6AoG25jZpCdPv7+SNHVK3u2+jffIol0Auij7x3Al9ipKj7F0EEgo0uLze90fIwg8H/N3qHWAEwKmhiXVX/ITPgdqdpyhZHyZgCQYI/19iVZPdchaVICCL0qDFi41bUH2qCWdZ/qKSW6HnqSSW1Dx0aeSvt0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2020 03:02:06.3247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f6678b-ea17-4f76-716a-08d79c8bf795
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6408
Subject: [PATCH v2] newlib: Enable building libstdc++ for newlib based toolchains
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Jan 2020 03:02:06 -0000
Content-Type: text/plain

Some baremetal applications might require support from libstdc++
On newlib based toolchains, libstdc++ can be built as a static
library that applications can then link against it.

Pass libsdtc++-(static)dev to LIBC_DEPENDENCIES allowing the
library to be present for cross compilation as well as on
sdk builds.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 meta/conf/distro/include/tclibc-newlib.inc | 7 +++----
 meta/recipes-devtools/gcc/gcc-runtime.inc  | 6 ++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/include/tclibc-newlib.inc
index 896c0b1..8338003 100644
--- a/meta/conf/distro/include/tclibc-newlib.inc
+++ b/meta/conf/distro/include/tclibc-newlib.inc
@@ -25,12 +25,11 @@ LIBC_DEPENDENCIES = "\
     libgloss-dbg \
     libgcc-dev \
     libgcc-dbg \
+    libstdc++-dev \
+    libstdc++-staticdev \
     "
 
-# compilerlibs defaults to gcc-runtime, but we get runtime from libgloss
-# we set ASSUME_PROVIDED because we cant set PREFERRED_PROVIDER
-# for compilerlibs since its overridden by tcmode-default
-ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}compilerlibs virtual/crypt"
+ASSUME_PROVIDED += "virtual/crypt"
 
 # Its useful to be able to extend newlib, but we dont provide a native variant of libgloss
 NEWLIB_EXTENDED ?=  "libgloss libgcc"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d3f8ae8..b2c5d43 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -16,10 +16,14 @@ EXTRA_OECONF_PATHS = "\
 
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
+EXTRA_OECONF_append_libc-newlib = " --with-newlib"
 
 # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 
+# Newlib does not support symbol versioning on libsdtcc++
+SYMVERS_CONF_libc-newlib = ""
+
 # Building with thumb enabled on armv6t fails
 ARM_INSTRUCTION_SET_armv6 = "arm"
 
@@ -36,6 +40,8 @@ RUNTIMELIBSSP_mingw32 ?= "libssp"
 RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
 "
+# Only build libstdc++ for newlib
+RUNTIMETARGET_libc-newlib = "libstdc++-v3"
 
 # libiberty
 # libmudflap
-- 
2.7.4


