Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 58642 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Apr 2019 15:19:53 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820080.outbound.protection.outlook.com [40.107.82.80])
	by mail.openembedded.org (Postfix) with ESMTP id EDA307D8E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 15:19:53 +0000 (UTC)
Received: from CY4PR02MB2679.namprd02.prod.outlook.com (10.175.81.16) by
	DM5PR02MB2684.namprd02.prod.outlook.com (10.175.85.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1835.14; Fri, 26 Apr 2019 06:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=b5g80vEDSvhWebqGGgIritlG6nXBx49HqZAYUOJ1i0E=;
	b=oYP/vIVh5WidjoE9SF+HmqZC6IqkeBRZwWVpjWAXvNMDyCYmAScw2nz2ID+rgGheWMBKbj+u/J+xmvy+zpVCSW+nQ4bENF769dktRAgXp3Z0aFYF948o6TZXUDRIlkqC4jcB38BFiXo2ferHCfr3fEYhMGNGqm+ZDGId9ZO55Y0=
Received: from MWHPR0201CA0018.namprd02.prod.outlook.com
	(2603:10b6:301:74::31) by CY4PR02MB2679.namprd02.prod.outlook.com
	(2603:10b6:903:126::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1813.16;
	Thu, 25 Apr 2019 22:58:49 +0000
Received: from SN1NAM02FT049.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by MWHPR0201CA0018.outlook.office365.com
	(2603:10b6:301:74::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.12 via
	Frontend Transport; Thu, 25 Apr 2019 22:58:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; linuxfoundation.org;
	dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT049.mail.protection.outlook.com (10.152.72.166) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1792.25
	via Frontend Transport; Thu, 25 Apr 2019 22:58:48 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46354
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hJnKK-0005Hc-5K; Thu, 25 Apr 2019 15:58:48 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hJnKF-0001nD-1e; Thu, 25 Apr 2019 15:58:43 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x3PMwcDT011787; Thu, 25 Apr 2019 15:58:38 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hJnKA-0001mm-1l; Thu, 25 Apr 2019 15:58:38 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <manjukum@xilinx.com>,
	<alejandr@xilinx.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 25 Apr 2019 15:58:37 -0700
Message-ID: <1556233117-12801-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(199004)(189003)(106002)(16586007)(14444005)(2201001)(336012)(110136005)(5660300002)(50226002)(316002)(26005)(47776003)(186003)(8676002)(54906003)(77096007)(305945005)(426003)(107886003)(51416003)(7696005)(356004)(8936002)(9786002)(48376002)(63266004)(44832011)(70206006)(81156014)(486006)(50466002)(72206003)(70586007)(126002)(476003)(4326008)(478600001)(2616005)(36386004)(36756003)(2906002)(81166006)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2679; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 612005b2-7cfa-4360-fbef-08d6c9d193ee
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
	SRVR:CY4PR02MB2679; 
X-MS-TrafficTypeDiagnostic: CY4PR02MB2679:|CY4PR02MB2679:|DM5PR02MB2684:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB26793AE3DC1E6FA5354A386DAF3D0@CY4PR02MB2679.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0018A2705B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7b7voZzkNMhli+xrUVQjz6p2j7EDpIBbw7nc15DbeN9fs8QwYnGH5ireNEOmeei3quLSWoHPFJ0GkhX5NWzr3OctyNkSa1XmlkamcFpCNsSZExOErqz4kwcI28XF4q8uuH7hVeXuS3H9kUYS98yrCUYqBzFiuZM1oawA/fW4EQxe19tL488hj3GFqHx37LgbsBvdueRt2DUUzcR+sU7bcrQeQQiUXcJgkkBxed6TI+E5g1418Hk0w4l8l2am0o9UrVU88x1ccoLyvN0aU03s/6Rs0FQCMAgJP6iZL+rrd2Mxh99pkrTPZ6bruvwtO2ImaHdmGsS4epQ/UZklMfFqe+/vhf3IXi5j/uBFBsJFDWXusIElfWT3hEpvCtBCgbI40qL0fK7gvKt+eSidY1C/yR5zDR5271NLZrwFLXq/j2w=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2019 22:58:48.5263 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 612005b2-7cfa-4360-fbef-08d6c9d193ee
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2679
X-OriginatorOrg: xilinx.com
Subject: [master][RFC v2] Adding back wrapper and using OEPYTHON3HOME variable for python3
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
X-List-Received-Date: Fri, 26 Apr 2019 15:19:54 -0000
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
 ...EPYTHON3HOME-is-set-use-instead-of-PYTHON.patch | 47 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.3.bb      |  7 ++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch

diff --git a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
new file mode 100644
index 0000000..5a59a67
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
@@ -0,0 +1,47 @@
+From 347e5e080f5bbd2e18562d5f99ec61d706cb1cd8 Mon Sep 17 00:00:00 2001
+From: Jaewon Lee <jaewon.lee@xilinx.com>
+Date: Thu, 25 Apr 2019 15:34:26 -0700
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
+ Modules/main.c | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/Modules/main.c b/Modules/main.c
+index a745381..27ce112 100644
+--- a/Modules/main.c
++++ b/Modules/main.c
+@@ -1855,10 +1855,19 @@ config_init_home(_PyCoreConfig *config)
+         }
+         return _Py_INIT_OK();
+     }
+-
+-    int res = config_get_env_var_dup(&home, L"PYTHONHOME", "PYTHONHOME");
+-    if (res < 0) {
+-        return DECODE_LOCALE_ERR("PYTHONHOME", res);
++    int res;
++    const char *oepython3home = config_get_env_var("OEPYTHON3HOME");
++    if (oepython3home) {
++        res = config_get_env_var_dup(&home, L"OEPYTHON3HOME", "OEPYTHON3HOME");
++        if (res < 0) {
++            return DECODE_LOCALE_ERR("OEPYTHON3HOME", res);
++        }
++    }
++    else {
++	res = config_get_env_var_dup(&home, L"PYTHONHOME", "PYTHONHOME");
++        if (res < 0) {
++            return DECODE_LOCALE_ERR("PYTHONHOME", res);
++        }
+     }
+     config->home = home;
+     return _Py_INIT_OK();
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


