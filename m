Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 26102 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Apr 2019 10:45:09 UTC
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720051.outbound.protection.outlook.com [40.107.72.51])
	by mail.openembedded.org (Postfix) with ESMTP id B58507DA94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 10:45:09 +0000 (UTC)
Received: from BN6PR02MB2676.namprd02.prod.outlook.com (10.175.95.14) by
	DM5PR02MB2684.namprd02.prod.outlook.com (10.175.85.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1835.14; Fri, 26 Apr 2019 10:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VDLyr/YzMGO3UBYgTLuLmyYsWBXiqJAw4QjUSChHpUg=;
	b=FqWMQntFKJfmiv17z7bc3CqX6SghOovegm8oo6temKcg5/eUfrV3s8RIlxSVidQyOr3oVCiTDcI2PwAF7utvXokBmvndJUhmwVhOIvrq2Yx4I6MawFOwxfkUPaGbn4caNvZy9ln4ZC0ANxqIQ9HMD/UxglR0yRVnhoTmfBsNE3I=
Received: from BYAPR02CA0011.namprd02.prod.outlook.com (2603:10b6:a02:ee::24)
	by BN6PR02MB2676.namprd02.prod.outlook.com (2603:10b6:404:fa::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1813.19;
	Thu, 25 Apr 2019 23:02:31 +0000
Received: from CY1NAM02FT034.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by BYAPR02CA0011.outlook.office365.com
	(2603:10b6:a02:ee::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.12 via
	Frontend Transport; Thu, 25 Apr 2019 23:02:30 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT034.mail.protection.outlook.com (10.152.75.190) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1792.25
	via Frontend Transport; Thu, 25 Apr 2019 23:02:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hJnNt-0001Z2-D6; Thu, 25 Apr 2019 16:02:29 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hJnNo-0004bZ-9X; Thu, 25 Apr 2019 16:02:24 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hJnNm-0004b9-6H; Thu, 25 Apr 2019 16:02:22 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <manjukum@xilinx.com>,
	<alejandr@xilinx.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 25 Apr 2019 16:02:21 -0700
Message-ID: <1556233341-13827-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(199004)(189003)(54534003)(54906003)(106002)(63266004)(7696005)(77096007)(50226002)(26005)(2906002)(5660300002)(8936002)(9786002)(16586007)(186003)(476003)(2616005)(47776003)(72206003)(126002)(110136005)(36386004)(44832011)(316002)(486006)(356004)(51416003)(70586007)(70206006)(426003)(36756003)(48376002)(14444005)(2201001)(81166006)(478600001)(4326008)(305945005)(50466002)(81156014)(107886003)(8676002)(336012);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2676; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b060e2c8-284e-4446-de2d-08d6c9d217e5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
	SRVR:BN6PR02MB2676; 
X-MS-TrafficTypeDiagnostic: BN6PR02MB2676:|BN6PR02MB2676:|DM5PR02MB2684:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN6PR02MB2676E77097E5D427539C1C74AF3D0@BN6PR02MB2676.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0018A2705B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: nt+lACiqGJ7eI7V3Ai8gz+j3vGTd7FKvO95Z3TpZktTwCG0kWTXdBQy19s1t4DtdbtPJ6SdnqxFlwWcK3F0anOuXV/tfNNwfL5x97AKYsPhFPLLg6eP5oNNkENXSRoZbM7TqqLKuzleMBfyQkxqzfRi5ebqyFMnN2Ymyrtq2k2do+g3he4XyLYdM4zaMfe+b+PMKLzqGKnLqpdOcXJXleIvo87Ibgr7MrLgscHmDItDzDw+uPsQmJy8O4pb3EkAMlVBiFGLhnzaXfJ/D84MmfsIYu5IOKd2MWP5CxawGfqD7ewSJjX5beKOmuuYgAnYsln2rTnpeqXIV6gUMYGeeQ6pNgnbujP9IoOOl+3bqYFrJsQYJ2PKHjy4nvZ7CI7qHdN7DHO0A/jvO2srkEIkGg8vlBNHK4upDUCwQX8rE1PA=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2019 23:02:29.8637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b060e2c8-284e-4446-de2d-08d6c9d217e5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2676
X-OriginatorOrg: xilinx.com
Subject: [master][RFC v3] Adding back wrapper and using OEPYTHON3HOME variable for python3
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
X-List-Received-Date: Fri, 26 Apr 2019 10:45:10 -0000
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
changelog:
    v2: change python3 patch to avoid mem leak
    v3: fix tabs and spaces issue

---
 ...EPYTHON3HOME-is-set-use-instead-of-PYTHON.patch | 47 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.3.bb      |  7 ++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch

diff --git a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
new file mode 100644
index 0000000..06eb2bd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
@@ -0,0 +1,47 @@
+From ffe7797637f08cd6ee4c82e2d67462c5e194d30a Mon Sep 17 00:00:00 2001
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
+index a745381..b553e30 100644
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
++        res = config_get_env_var_dup(&home, L"PYTHONHOME", "PYTHONHOME");
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


