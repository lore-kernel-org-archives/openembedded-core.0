Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 113463 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Apr 2019 07:29:33 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800052.outbound.protection.outlook.com [40.107.80.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF2D6B180
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Plpnd4/qC/Y2xGGIQnQGBiAtzgfZxakRkaAYAeNTPZA=;
	b=aebwg9sOJiNeOomvT9qaNVTU7Yq5HdevXxmHj9pWU7WNwIWCoYr7MlAmNN/+jpgVUwI1ZmolwGovZgMjeA8P47H5GxtIF+7CnxJY+iK+pHPOO9teUlolD6KhwBzlSa0+3crtv3D6n2tHclsQp73cpJxn4k4IQcwbs62CJpVvti4=
Received: from BYAPR02CA0045.namprd02.prod.outlook.com (2603:10b6:a03:54::22)
	by SN6PR02MB5245.namprd02.prod.outlook.com (2603:10b6:805:70::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1750.17;
	Mon, 1 Apr 2019 23:58:30 +0000
Received: from BL2NAM02FT019.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::204) by BYAPR02CA0045.outlook.office365.com
	(2603:10b6:a03:54::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1750.17 via
	Frontend Transport; Mon, 1 Apr 2019 23:58:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT019.mail.protection.outlook.com (10.152.77.166) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1750.16
	via Frontend Transport; Mon, 1 Apr 2019 23:58:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1hB6ou-0005Wu-Qd
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2019 16:58:28 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1hB6op-0002b7-Me
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2019 16:58:23 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x31NwDP4007302; Mon, 1 Apr 2019 16:58:13 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1hB6oe-0002Zr-Tu; Mon, 01 Apr 2019 16:58:12 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <alejandr@xilinx.com>,
	<manjukum@xilinx.com>, <brucea@xilinx.com>
Date: Mon, 1 Apr 2019 16:58:12 -0700
Message-ID: <1554163092-21464-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39860400002)(346002)(136003)(396003)(2980300002)(189003)(199004)(2906002)(63266004)(4326008)(6636002)(7696005)(316002)(126002)(8676002)(106466001)(2201001)(14444005)(426003)(2616005)(110136005)(77096007)(81166006)(81156014)(5660300002)(16586007)(476003)(186003)(26005)(72206003)(51416003)(478600001)(36386004)(106002)(36756003)(47776003)(50226002)(305945005)(336012)(44832011)(8936002)(356004)(486006)(48376002)(50466002)(9786002)(107886003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5245; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e60eb736-eefe-4555-bc9e-08d6b6fdf069
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:SN6PR02MB5245; 
X-MS-TrafficTypeDiagnostic: SN6PR02MB5245:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB5245D639D3B393B2B233C6DBAF550@SN6PR02MB5245.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0994F5E0C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: e1R+QBpcd/RdH0okOt5w+fGvXPwDLzOCogomcU+UaFLZ3pHtx8YfvSnIweEcfjaTDktrs0FWsvYS2n6885JqiOIQaVyoF8C5O/8bDpk+4vu2i4eQdh25TwrB3yIOOwr8QOofG7p+4XEGr+K8A8pXi66bZxW6yis32jA3fwo8EmjBwB5X8RR5WT6YNyr3pzQ4j7JMdBl0KaF5FYv9mW1rNd6vUOEQXs4cqPLzf7DiDkTJgpTfpnlPuqHtIoOTLRF+27drHSr9bJYOi1+HXRkgRWArnLZjOinKizO6H6D8tzA74Lw6UkHcPmKLijF4AB3THtdNhyViITLXjbaN8cv1PSy0MICFWkKAqjXkK+9Wl4mMpqTahLTIkVQJG8q1+leWxi1Eq4mIVCx0M7FtSxFF9m73bEuoWecYuc9UgK5dzKE=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2019 23:58:29.3544 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e60eb736-eefe-4555-bc9e-08d6b6fdf069
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5245
Subject: [THUD][PATCH] Introduce mechanism to keep nativesdk* sstate in esdk
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
X-List-Received-Date: Wed, 03 Apr 2019 07:29:34 -0000
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


