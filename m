Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 10711 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Apr 2019 02:43:45 UTC
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730051.outbound.protection.outlook.com [40.107.73.51])
	by mail.openembedded.org (Postfix) with ESMTP id B29DC7D2DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 02:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Plpnd4/qC/Y2xGGIQnQGBiAtzgfZxakRkaAYAeNTPZA=;
	b=aZGz9k0vGTH/80Wo4bzyHMZJd0bM9YU6nrbu/vlDk0bymAZ6UFjhLvs0CuqN/yG4WY3/zu+ntJnMGKi7zOb/4AT2TZcr9L+FF3vICWApR0qK4HPQj4a1nLcRGJ9halmNe+Fqb43aAOAJUf4T4NY7SAjPxLT+LLKVBdKTvOOJUgE=
Received: from DM6PR02CA0065.namprd02.prod.outlook.com (2603:10b6:5:177::42)
	by SN6PR02MB5246.namprd02.prod.outlook.com (2603:10b6:805:70::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1750.16;
	Tue, 2 Apr 2019 00:07:12 +0000
Received: from CY1NAM02FT062.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by DM6PR02CA0065.outlook.office365.com
	(2603:10b6:5:177::42) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1750.15 via
	Frontend Transport; Tue, 2 Apr 2019 00:07:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT062.mail.protection.outlook.com (10.152.75.60) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1750.16
	via Frontend Transport; Tue, 2 Apr 2019 00:07:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53539
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1hB6xL-0007RS-0F
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2019 17:07:11 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1hB6xF-00071z-Sm
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2019 17:07:05 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x32070aN009640; Mon, 1 Apr 2019 17:07:01 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hB6xA-000707-T3; Mon, 01 Apr 2019 17:07:00 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <alejandr@xilinx.com>,
	<manjukum@xilinx.com>, <brucea@xilinx.com>
Date: Mon, 1 Apr 2019 17:06:53 -0700
Message-ID: <1554163613-2791-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(199004)(189003)(6666004)(77096007)(2616005)(81156014)(478600001)(14444005)(106002)(186003)(336012)(476003)(106466001)(486006)(316002)(47776003)(2201001)(8936002)(9786002)(48376002)(50226002)(50466002)(8676002)(16586007)(81166006)(44832011)(72206003)(4326008)(7696005)(305945005)(126002)(426003)(110136005)(26005)(2906002)(63266004)(5660300002)(107886003)(51416003)(36756003)(356004)(36386004)(6636002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5246; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d456c9c-3b5a-4645-3983-08d6b6ff278d
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:SN6PR02MB5246; 
X-MS-TrafficTypeDiagnostic: SN6PR02MB5246:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB52464E531C2F51F5080E45BEAF560@SN6PR02MB5246.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0995196AA2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rAKSvmNUWQ5tc1sHPBOFxRigTLxzNdLGRdlV9e4wghf1ttTFCNUPy8vSa7ORunpGhJ2HiK1/TSEQCKJ6vhaHQDKeGQbpHoxYGlFnjj7kcyS6UCBHzLda/nGq0x4brhakpLIAEddrhixCUKwqXROWYVo3AZ5wudf/2Q3uBrqb0MuWMoxR8JvYTdH6vj+5bYg3zZ6Ti0pbuPbvYj7Taw46Ln0ysJtcAVFvZRBewVS9rZSGLg4tA12/Qq3ZzucdpdUq5eyc+iyoFHpUAHoxscQosGt6w9uFcDa35jbRkGQLoXesTkK8KkUvQU7TdXB1jMbKdmYJCPXoDfafg/2bhQtFnthEP8gm+xLjBbv0eR0jAVebrb2XQzQpnGyfARLp0cvaCudjv02RW9lOtz73FX4Jy9JTVNkdqNAReSxmE3Q4lhs=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2019 00:07:11.4304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d456c9c-3b5a-4645-3983-08d6b6ff278d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5246
Subject: [master][PATCH] Introduce mechanism to keep nativesdk* sstate in esdk
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
X-List-Received-Date: Wed, 03 Apr 2019 02:43:46 -0000
Content-Type: text/plain

Using SDK_INCLUDE_NATIVESDK flag to toggle inclusion of all nativesdk*
sstate into esdk
Currently locked-sigs.inc is generated during do_sdk_depends which
doesn't pull in nativesdk packages. Generating another locked-sigs.inc
in do_populate_sdk_ext and pruning it to only nativesdk* packages by
using a modified version of the already existing function
prune_locked_sigs and merging it with the current locked-sigs.inc
Also adding SDK_INCLUDE_NATIVESDK tasklistfn to the logic surrounding
setting tasklist file to not prune esdk sstate during creation

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
---
 meta/classes/populate_sdk_ext.bbclass | 28 +++++++++++++++++++++++++++-
 meta/lib/oe/copy_buildsystem.py       |  8 ++++++--
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 40b0375..d98b0e5 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -20,6 +20,7 @@ SDK_EXT_task-populate-sdk-ext = "-ext"
 SDK_EXT_TYPE ?= "full"
 SDK_INCLUDE_PKGDATA ?= "0"
 SDK_INCLUDE_TOOLCHAIN ?= "${@'1' if d.getVar('SDK_EXT_TYPE') == 'full' else '0'}"
+SDK_INCLUDE_NATIVESDK ?= "0"
 
 SDK_RECRDEP_TASKS ?= ""
 
@@ -401,9 +402,27 @@ python copy_buildsystem () {
     excluded_targets = get_sdk_install_targets(d, images_only=True)
     sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
+    #nativesdk-only sigfile to merge into locked-sigs.inc
+    sdk_include_nativesdk = (d.getVar("SDK_INCLUDE_NATIVESDK") == '1')
+    nativesigfile = d.getVar('WORKDIR') + '/locked-sigs_nativesdk.inc'
+    nativesigfile_pruned = d.getVar('WORKDIR') + '/locked-sigs_nativesdk_pruned.inc'
+
+    if sdk_include_nativesdk:
+        oe.copy_buildsystem.prune_lockedsigs([],
+    	                                     excluded_targets.split(),
+    	                                     nativesigfile,
+                                             True,
+                                             nativesigfile_pruned)
+
+        oe.copy_buildsystem.merge_lockedsigs([],
+    	                                     sigfile,
+    	                                     nativesigfile_pruned,
+    	                                     sigfile)
+
     oe.copy_buildsystem.prune_lockedsigs([],
                                          excluded_targets.split(),
                                          sigfile,
+                                         False,
                                          lockedsigs_pruned)
 
     sstate_out = baseoutpath + '/sstate-cache'
@@ -414,7 +433,7 @@ python copy_buildsystem () {
 
     sdk_include_toolchain = (d.getVar('SDK_INCLUDE_TOOLCHAIN') == '1')
     sdk_ext_type = d.getVar('SDK_EXT_TYPE')
-    if sdk_ext_type != 'minimal' or sdk_include_toolchain or derivative:
+    if (sdk_ext_type != 'minimal' or sdk_include_toolchain or derivative) and not sdk_include_nativesdk:
         # Create the filtered task list used to generate the sstate cache shipped with the SDK
         tasklistfn = d.getVar('WORKDIR') + '/tasklist.txt'
         create_filtered_tasklist(d, baseoutpath, tasklistfn, conf_initpath)
@@ -658,9 +677,16 @@ fakeroot python do_populate_sdk_ext() {
     d.setVar('SDKDEPLOYDIR', '${SDKEXTDEPLOYDIR}')
     # ESDKs have a libc from the buildtools so ensure we don't ship linguas twice
     d.delVar('SDKIMAGE_LINGUAS')
+    if d.getVar("SDK_INCLUDE_NATIVESDK") == '1':
+        generate_nativesdk_lockedsigs(d)
     populate_sdk_common(d)
 }
 
+def generate_nativesdk_lockedsigs(d):
+    import oe.copy_buildsystem
+    sigfile = d.getVar('WORKDIR') + '/locked-sigs_nativesdk.inc'
+    oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
+
 def get_ext_sdk_depends(d):
     # Note: the deps varflag is a list not a string, so we need to specify expand=False
     deps = d.getVarFlag('do_image_complete', 'deps', False)
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 7cb784c..5bc728e 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -168,7 +168,7 @@ def generate_locked_sigs(sigfile, d):
     tasks = ['%s.%s' % (v[2], v[1]) for v in depd.values()]
     bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
 
-def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, pruned_output):
+def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, onlynative, pruned_output):
     with open(lockedsigs, 'r') as infile:
         bb.utils.mkdirhier(os.path.dirname(pruned_output))
         with open(pruned_output, 'w') as f:
@@ -178,7 +178,11 @@ def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, pruned_output
                     if line.endswith('\\\n'):
                         splitval = line.strip().split(':')
                         if not splitval[1] in excluded_tasks and not splitval[0] in excluded_targets:
-                            f.write(line)
+                            if onlynative:
+                                if 'nativesdk' in splitval[0]:
+                                    f.write(line)
+                            else:
+                                f.write(line)
                     else:
                         f.write(line)
                         invalue = False
-- 
2.7.4


