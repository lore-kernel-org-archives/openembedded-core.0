Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 17905 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Apr 2019 10:31:28 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
	by mail.openembedded.org (Postfix) with ESMTP id 906567DA94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PVj+BB0YKD0BO78csSjexZnGhM0Idoi6eKWlIDYCkdY=;
	b=gun0v7tCA16jKC51Sgwfj1QCYGBXVuEZz7OKsvm/G7+MzPMJ5CkNMCCMQEd6Shz0XV9fTHg0rDg5NugQnRtu7LuzVr131QmUBgmUai0t1TllMGKjKpiAaH0f3E5l2ODI+96C8JJRY2rIOkvlM/Q0rxC+sk5iHdOyorE2fj7v/oA=
Received: from BN7PR02CA0027.namprd02.prod.outlook.com (2603:10b6:408:20::40)
	by BLUPR02MB504.namprd02.prod.outlook.com (2a01:111:e400:88c::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1813.12;
	Thu, 25 Apr 2019 19:56:45 +0000
Received: from SN1NAM02FT018.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by BN7PR02CA0027.outlook.office365.com
	(2603:10b6:408:20::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.12 via
	Frontend Transport; Thu, 25 Apr 2019 19:56:45 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; linuxfoundation.org;
	dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT018.mail.protection.outlook.com (10.152.72.122) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1792.25
	via Frontend Transport; Thu, 25 Apr 2019 19:56:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hJkU8-000649-Si; Thu, 25 Apr 2019 12:56:44 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hJkU3-0008Fu-Px; Thu, 25 Apr 2019 12:56:39 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x3PJuYTU030519; Thu, 25 Apr 2019 12:56:34 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hJkTy-0008F4-88; Thu, 25 Apr 2019 12:56:34 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <manjukum@xilinx.com>,
	<alejandr@xilinx.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 25 Apr 2019 12:56:33 -0700
Message-ID: <1556222193-2780-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(39860400002)(136003)(376002)(2980300002)(189003)(199004)(72206003)(54906003)(478600001)(336012)(426003)(486006)(8936002)(2201001)(106002)(9786002)(16586007)(107886003)(81166006)(81156014)(44832011)(2616005)(356004)(8676002)(50226002)(316002)(4326008)(7696005)(51416003)(110136005)(47776003)(305945005)(77096007)(63266004)(126002)(36386004)(70206006)(50466002)(2906002)(70586007)(476003)(5660300002)(14444005)(186003)(26005)(36756003)(48376002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB504; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42dc7902-b810-4d63-2131-08d6c9b82533
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
	SRVR:BLUPR02MB504; 
X-MS-TrafficTypeDiagnostic: BLUPR02MB504:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BLUPR02MB504491DE3FF1325508EC0CDAF3D0@BLUPR02MB504.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0018A2705B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: REpzLR3yBPxbpa1RYAn0X73ReVPQzvHJI/BH37FhzXONDnKcKbUmvqjhYMW1g6br8X7U6h72q946PzNSG9KCF/sf1qobTid1SUDLHMRR9eTXLtgddXFxlAtV30FbIpzuysV/509LV27CVdWY4HA7rwt/jkRLFHwbc0rRahlvMCW0pMoNKRWwAlCW/aZme5MfHBiZyoLIgJPCfeMqQ1WDuZcXuFeUQaeMKYj+0flUQiaks0cEE0jCBRXSzX9unIuSbYtIC8KMnHH2di/rnlEd9kwT7YLrZFlqOHQWyw20XcF/slnQXtMvv7iujOUl4FZHCGoQPvdIRH1lSWMPeEDkgUMgA0oSw+d/8otxnQaxwnLQguwfwMHiTcy607gLiropsSWKnFJRQNQ9lAED1jWc74Zwvolel536/FTurrqrsek=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2019 19:56:45.3275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dc7902-b810-4d63-2131-08d6c9b82533
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB504
Subject: [master][RFC] Adding back wrapper and using OEPYTHON3HOME variable for python3
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
X-List-Received-Date: Fri, 26 Apr 2019 10:31:28 -0000
Content-Type: text/plain

Adding back the python wrapper and adding a patch to use OEPYTHON3HOME
instead of PYTHONHOME if set, for python3.

If we add back the wrapper as is, we would see the following error that
we also see in Thud:

ImportError: No module named site
OpenEmbedded requires 'python' to be python v2 (>= 2.7.3), not python
v3.
Please upgrade your python v2

This is because python3 would've set PYTHONHOME to use nativesdk
python3 libraries but when the oe-buildenv-internal script tries to call
python2 for the py_v27_check, there will be no python2 libraries in the
PYTHONHOME directory.
In other words, bitbake needs host python2 and the env variable set from
the wrapper contaminates the env and host python2 won't be able to find
its libraries

Creating another variable OEPYTHON3HOME and using this in the python3
wrapper to allow for a way to set a different paths for python3 and
python2

[YOCTO #13208]

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 ...EPYTHON3HOME-is-set-use-instead-of-PYTHON.patch | 35 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.3.bb      |  7 +++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch

diff --git a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
new file mode 100644
index 0000000..12aeab9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
@@ -0,0 +1,35 @@
+From e4363ca1d84b4014184a79a847fb2affb3dfe86e Mon Sep 17 00:00:00 2001
+From: Jaewon Lee <jaewon.lee@xilinx.com>
+Date: Tue, 23 Apr 2019 17:01:08 -0700
+Subject: [PATCH] main.c: if OEPYTHON3HOME is set use instead of PYTHONHOME
+
+There is one variable PYTHONHOME to determine where libraries are coming
+from for both python2 and python3. This becomes an issue if only one has
+libraries in the specified PYTHONHOME path, but they are using the same
+PYTHONHOME. Creating another variable OEPYTHON3HOME to allow for a way
+to set a different path for python3
+
+Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
+---
+ Modules/main.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Modules/main.c b/Modules/main.c
+index a745381..25ca435 100644
+--- a/Modules/main.c
++++ b/Modules/main.c
+@@ -1857,6 +1857,11 @@ config_init_home(_PyCoreConfig *config)
+     }
+ 
+     int res = config_get_env_var_dup(&home, L"PYTHONHOME", "PYTHONHOME");
++
++    const char *oepython3home = config_get_env_var("OEPYTHON3HOME");
++    if (oepython3home) {
++        res = config_get_env_var_dup(&home, L"OEPYTHON3HOME", "OEPYTHON3HOME");
++    }
+     if (res < 0) {
+         return DECODE_LOCALE_ERR("PYTHONHOME", res);
+     }
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
index ea46b05..af7ede1 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
@@ -28,6 +28,9 @@ SRC_URI_append_class-native = " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            "
+SRC_URI_append_class-nativesdk = " \
+           file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
+           "
 
 SRC_URI[md5sum] = "93df27aec0cd18d6d42173e601ffbbfd"
 SRC_URI[sha256sum] = "da60b54064d4cfcd9c26576f6df2690e62085123826cff2e667e72a91952d318"
@@ -131,6 +134,10 @@ do_install_append() {
                 ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
 }
 
+do_install_append_class-nativesdk () {
+    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} OEPYTHON3HOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
+}
+
 SSTATE_SCAN_FILES += "Makefile _sysconfigdata.py"
 PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 
-- 
2.7.4


