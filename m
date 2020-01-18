Return-Path: <alejandro@enedino.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	by mail.openembedded.org (Postfix) with ESMTP id D3DC27FAB1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 21:22:52 +0000 (UTC)
Received: from BYAPR02CA0003.namprd02.prod.outlook.com (2603:10b6:a02:ee::16)
	by CY4PR02MB2181.namprd02.prod.outlook.com (2603:10b6:903:e::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.19;
	Sat, 18 Jan 2020 21:22:51 +0000
Received: from BL2NAM02FT038.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by BYAPR02CA0003.outlook.office365.com
	(2603:10b6:a02:ee::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.13 via
	Frontend Transport; Sat, 18 Jan 2020 21:22:50 +0000
Authentication-Results: spf=none (sender IP is 149.199.60.83)
	smtp.mailfrom=enedino.org; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=enedino.org;
Received-SPF: None (protection.outlook.com: enedino.org does not designate
	permitted sender hosts)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT038.mail.protection.outlook.com (10.152.77.25) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2644.19
	via Frontend Transport; Sat, 18 Jan 2020 21:22:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1isvYO-0001nj-O4; Sat, 18 Jan 2020 13:22:48 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1isvYJ-00030B-Jc; Sat, 18 Jan 2020 13:22:43 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	00ILMgks025239; Sat, 18 Jan 2020 13:22:43 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1isvYI-0002zr-OD; Sat, 18 Jan 2020 13:22:42 -0800
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 13:22:40 -0800
Message-Id: <1579382560-2540-2-git-send-email-alejandro@enedino.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579382560-2540-1-git-send-email-alejandro@enedino.org>
References: <1579382560-2540-1-git-send-email-alejandro@enedino.org>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--2.145-7.0-31-1
X-imss-scan-details: No--2.145-7.0-31-1;No--2.145-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132238561706955606;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39850400004)(346002)(136003)(376002)(428003)(199004)(189003)(86362001)(9786002)(107886003)(26005)(70586007)(336012)(316002)(426003)(70206006)(2616005)(81166006)(81156014)(8676002)(2906002)(8936002)(498600001)(4326008)(356004)(5660300002)(6916009)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2181; H:xsj-pvapsmtpgw01;
	FPR:; SPF:None; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fd84111-95e2-4861-9667-08d79c5c9294
X-MS-TrafficTypeDiagnostic: CY4PR02MB2181:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2181910B4806A8EDDA94B8BDB8300@CY4PR02MB2181.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0286D7B531
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vjh/EH6UUDxtP7Hgrn50fed3WjOrojXJmSz6kf9zeHZfvAIzfDHp4NCSVpESUnMPOGjGEnSn2KyL2Ad9ZwCaaB1qU4cZaqQaaaykLEGZVYZU3vnV8bXD9laWB4Y8nzgNusB2DtIxli17DRXBEI+AuV7762wRFEQJrSWHPrpvFrDJAlkYSCPZunhoUlH3bblZbL3rI/npRLDqgUzwSaLxjoXtgAy783qIEZk6jFO0QrRI/lE+EPgoF0N8Hai3GRQrHUAc8ts4BIOBMLmhD1mH5hf3/N49Dvqp2lWuiEfjbEU3Mxwa68U2XWBFXikIRlMLks7RCK5uSFRsEDai0awLdt2S4KPjML8Ahqzk7hWWzVfCzgUKq5dKXdxDNIWi1quBZi9xVLxjbaT88rMxdQaT/BuFr+yMRJSWrCet46mcrjpLidKTomPAy2wy9+TaLkbb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2020 21:22:50.4568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd84111-95e2-4861-9667-08d79c5c9294
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2181
Subject: [PATCH] newlib: Enable building libstdc++ for newlib based toolchains
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
X-List-Received-Date: Sat, 18 Jan 2020 21:22:53 -0000
Content-Type: text/plain

Some baremetal applications might require support from libstdc++.

On newlib based toolchains, libstdc++ can be built as a static
library that applications can then link against it.

Pass libsdtc++-(static)dev to LIBC_DEPENDENCIES allowing the
library to be present for cross compilation as well as on
sdk builds.

This also requires to modify the gcc-runtime recipe to
explictly build only libsdtc++ correctly.

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
index d3f8ae8..f035fbd 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -17,6 +17,9 @@ EXTRA_OECONF_PATHS = "\
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
 
+EXTRA_OECONF_remove_libc-newlib = "--enable-symvers=gnu"
+EXTRA_OECONF_append_libc-newlib = " --with-newlib"
+
 # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 
@@ -33,6 +36,9 @@ RUNTIMELIBITM_riscv64 = ""
 RUNTIMELIBSSP ?= ""
 RUNTIMELIBSSP_mingw32 ?= "libssp"
 
+# Only build libstdc++ for newlib
+RUNTIMETARGET_libc-newlib = "libstdc++-v3"
+
 RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
 "
-- 
2.7.4


