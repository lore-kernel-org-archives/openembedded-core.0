Return-Path: <JAEWON@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780087.outbound.protection.outlook.com [40.107.78.87])
	by mail.openembedded.org (Postfix) with ESMTP id A7D9E90043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 17:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Fikl/k/k6kqlO5aUU62n6RxMHFO0UNfXNLJeS4B0NgSCDbFz+gtywPuqCgccry1cOdJtpwp0mI2r4zBnFz19jbFd4VaXpVMQtpolJqrZPAgZOeyOpqpz/VxGuhcG4BQWoX8NW9FxNXifBku3COzJx8DmIELNSz7XQKWFlFXOe5nhB85v7NZWbRHefj7xZxqQQxh7iJrTgs6aS4wvWJADN7WscdUBYEgUpZSVkO6InqdyX8CtA+4/ih1765jq+MQD/lYWdPgz836KcQ7zxAvBPh9O/pd7hUeQt7EsqZMTbXYLugquMa4J0tyGkOFdy9GxB9qraxIXNeVrdTZn4tXDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bGMByV4Yh1t5GT+B75iw8X/CipjzsXqkHobNSu6wwSI=;
	b=JpL3f0IRsizSGlNtGv0ijk39/ICEQR2/ByiS5bPOFh0CsC4iFu4x1PMdTkVHihXtREf2D3+q4mEjN1JSa90EoOFOW6oaaNxhYbzK8l27UC7qaGCH9PGwFCJ6Hp4+PKzfcEEDEdtTWpI3Dka/NUcVcL0A5IwiwrjuYzijiCxsymwYQf9qXiFXbzRw3c+5h6yekV8RXmGf9ltYSp8jeRUTfrXY2362TMQ1x3hxlMXnNfMFCDzvLGN5W8u7nVojOqj77iO+JaS9sPd4yQE81kvI1HyrZPL6usRytAcMwwtY51KBkFKGjhUPBxKUJBo6brSIN8yb3IpNy+eS9/1pLbLUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=linux.intel.com
	smtp.mailfrom=xilinx.com; 
	dmarc=bestguesspass action=none header.from=xilinx.com;
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bGMByV4Yh1t5GT+B75iw8X/CipjzsXqkHobNSu6wwSI=;
	b=dTEtzMgg3TseaBRkOhAa+MihThZqYb4PPZoYQnWecpqEtxm3LRTxjVz//cKZyJ95GpX3B/Cymeott9Xf547+YGZqYUTLA9dTHevOS5qSsvyU6KSs7Gki8s7PP98fUX6LphMBTL0cX2xhB7BoJfw2U96zSZICpxnpEr1bDEc6kOM=
Received: from DM6PR02CA0138.namprd02.prod.outlook.com (2603:10b6:5:1b4::40)
	by BN7PR02MB5249.namprd02.prod.outlook.com (2603:10b6:408:2a::31) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20;
	Wed, 18 Sep 2019 17:43:01 +0000
Received: from SN1NAM02FT026.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by DM6PR02CA0138.outlook.office365.com
	(2603:10b6:5:1b4::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17 via
	Frontend Transport; Wed, 18 Sep 2019 17:43:01 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; linux.intel.com;
	dkim=none (message not signed)
	header.d=none;linux.intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT026.mail.protection.outlook.com (10.152.72.97) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2263.17
	via Frontend Transport; Wed, 18 Sep 2019 17:43:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iAdym-00038H-31; Wed, 18 Sep 2019 10:43:00 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iAdyg-0007dI-Ua; Wed, 18 Sep 2019 10:42:54 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x8IHgnoH028594; Wed, 18 Sep 2019 10:42:50 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iAdyb-0007cw-ND; Wed, 18 Sep 2019 10:42:49 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: majukum@xilinx.com, alejandr@xilinx.com,
	openembedded-core@lists.openembedded.org, paul.eggleton@linux.intel.com
Date: Wed, 18 Sep 2019 10:42:49 -0700
Message-Id: <1568828569-19552-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(189003)(199004)(4326008)(305945005)(8676002)(356004)(8936002)(486006)(426003)(70586007)(44832011)(2906002)(26005)(186003)(478600001)(2616005)(336012)(476003)(126002)(50226002)(14444005)(7696005)(51416003)(316002)(36756003)(9786002)(81166006)(81156014)(70206006)(47776003)(16586007)(36386004)(48376002)(106002)(107886003)(50466002)(5660300002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR02MB5249; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db44eed9-2779-4524-de67-08d73c5fa670
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(4709080)(1401327)(4618075)(2017052603328);
	SRVR:BN7PR02MB5249; 
X-MS-TrafficTypeDiagnostic: BN7PR02MB5249:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5249349FF183D210E367727FAF8E0@BN7PR02MB5249.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: d3UWGjS7I/Pg63iDBbI6qWnQ7ycgdc3dWcH2UdbEqERDcIi+RYN/18cqPrWyXo8tdvPXDNwmYjNunWE+1QyByt8KwMj4zbCI6h3lWfU8aLX2ETSGMAoAzED29/CLbsxBLHKsqmbpP8ISftBtjbpKzBjubyUadL+XgYJPY5dC4znnVY1sl9Ugmvs5qPtdzqg+XQ5MGp4/NsD56nMpnb8ltyxUlZfMFbouB9bmnH+Beh9Qh8Ab9m3CXYa4zqulVYxQ1ELVcGbACsrb+mHyihrDIppfU08eIWs6Z6IQxz+KhSsBf/P5SO6niKwE3DwQVWIJ5+eSdQVvvt66ppeDxBXgfOLTjTtRyRGyyU8SjLue1k9DndiIBgp9u7/UEkd5MH7gwiuaOsGtICkWSN3N9D2kIsAP5KSrZUBkYZznCsAXqcU=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 17:43:00.6707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db44eed9-2779-4524-de67-08d73c5fa670
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5249
Subject: [master][PATCH v3] esdk: Introduce mechanism to keep nativesdk* sstate in esdk
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
X-List-Received-Date: Wed, 18 Sep 2019 17:43:03 -0000
Content-Type: text/plain

When doing a devtool build-sdk from within an esdk all nativesdk
components would be rebuilt. This patch introduces SDK_INCLUDE_NATIVESDK
flag to toggle the inclusion of nativesdk packages when creating the
esdk sstate

Currently locked-sigs.inc is generated during do_sdk_depends which
doesn't pull in nativesdk packages. Generating another locked-sigs.inc
in do_populate_sdk_ext and pruning it to only nativesdk* packages by
using a modified version of the already existing function
prune_locked_sigs and merging it with the current locked-sigs.inc
Also adding SDK_INCLUDE_NATIVESDK tasklistfn to the logic surrounding
setting tasklist file to not prune esdk sstate during creation

Fixes [YOCTO #13261]

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
---
changes in v2:
    change to commit message to include reason
    got rid of some tabs
    rebased to apply on master
changes in v3:
    fix patchwork failure for format of short commit message
---
 meta/classes/populate_sdk_ext.bbclass | 28 +++++++++++++++++++++++++++-
 meta/lib/oe/copy_buildsystem.py       |  8 ++++++--
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 800e117..086f55d 100644
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
+                                             excluded_targets.split(),
+                                             nativesigfile,
+                                             True,
+                                             nativesigfile_pruned)
+
+        oe.copy_buildsystem.merge_lockedsigs([],
+                                             sigfile,
+                                             nativesigfile_pruned,
+                                             sigfile)
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
@@ -657,9 +676,16 @@ fakeroot python do_populate_sdk_ext() {
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
index cb663b2..31a84f5 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -177,7 +177,7 @@ def generate_locked_sigs(sigfile, d):
     tasks = ['%s:%s' % (v[2], v[1]) for v in depd.values()]
     bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
 
-def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, pruned_output):
+def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, onlynative, pruned_output):
     with open(lockedsigs, 'r') as infile:
         bb.utils.mkdirhier(os.path.dirname(pruned_output))
         with open(pruned_output, 'w') as f:
@@ -187,7 +187,11 @@ def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, pruned_output
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


