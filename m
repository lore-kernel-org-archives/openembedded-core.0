Return-Path: <JAEWON@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr810075.outbound.protection.outlook.com [40.107.81.75])
	by mail.openembedded.org (Postfix) with ESMTP id BE1207FD4D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 00:37:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=M8oa1NuO1GGM6Em+d3UbKJHhBGnNlYLFL1bSVszMbmSuj5kChDHc/q58qEnH+lE6RH8w53QN4py3DLrHO+RrTHyXfHiSgriABuf+Mng1cETLmxh8rurK6305Pk5TCep/vaqgeut85Xqx5Vq//5SFEkzb5s7D+5de+VPNDThWNsjroAZVKNbnV5NiegL4dus21iJcQp91wndYBAY+Y4gMN/JVcApG4VMM2OXnD8pQ/00cZVmwm5imlxnErbHeBl98pQKZvJIc6plZY+xFHE+ocl/HPMJx+XrGEieTiaSMoSZ93LP9A+LYn2Y3Ce+/i6xYSgrI9oxroVCa45dXGMlJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FRS87xxFNah23tfrbSZBt7PA41g2DTryhm8iShYdUu0=;
	b=Mm5CQJZJgOT3fsyuP0mYNe8KDFHw5xbAA3FCFq6moHwHggsutloacjFsekkq95f4JCaxYsOpA0+n3IqXKw4PE1mLssuaK+u4qoUHPpHo4FsAtouYXFObw89IAV3FiMXEGEX5IRUqD3FJLx9RVhOPtaXwCpCqs5XwBHE/LyrD+JWHhKidD6Cgbk0BzGa7jHh0mCngdnkgJvVj6ykj9zCAMpVUSLdRKFjI2QfpVWhP6uBB8Jz9k3rSETBjN2ojJ9UB/l6AI5p5tyoUW7rqebIu9s8eUQUVdPyfpAkBqDVRwOIEbGBQrIpOojhb4KyinsB5eDVB8jzJJiQttqikNiLuuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=linux.intel.com
	smtp.mailfrom=xilinx.com; 
	dmarc=bestguesspass action=none header.from=xilinx.com;
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FRS87xxFNah23tfrbSZBt7PA41g2DTryhm8iShYdUu0=;
	b=EakU43JANTJBRwYeM9dd1BhGO+J8ghrHmfrbbH8f7GhAqaMoSra9KZWkU0YBlGKzmLPDZQe8jhbFn3DlRsG/u16UnmCuZl7KG1hoSsl9WpTDgxnpfgQKknYsYG767w/lXXb7JckBx9TN7ghAsZyXhLssk6+TZm8/RIYIPNkb8TU=
Received: from SN4PR0201CA0069.namprd02.prod.outlook.com
	(2603:10b6:803:20::31) by DM6PR02MB5338.namprd02.prod.outlook.com
	(2603:10b6:5:47::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.24;
	Wed, 18 Sep 2019 00:37:47 +0000
Received: from SN1NAM02FT059.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::205) by SN4PR0201CA0069.outlook.office365.com
	(2603:10b6:803:20::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19 via
	Frontend Transport; Wed, 18 Sep 2019 00:37:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; linux.intel.com;
	dkim=none (message not signed)
	header.d=none;linux.intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT059.mail.protection.outlook.com (10.152.72.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2263.17
	via Frontend Transport; Wed, 18 Sep 2019 00:37:46 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iANyc-0006ty-G8; Tue, 17 Sep 2019 17:37:46 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iANyX-0007op-CZ; Tue, 17 Sep 2019 17:37:41 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x8I0bYbQ016932; Tue, 17 Sep 2019 17:37:34 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iANyQ-0007nI-2g; Tue, 17 Sep 2019 17:37:34 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: openembedded-core@lists.openembedded.org, manjukum@xilinx.com,
	alejandr@xilinx.com, paul.eggleton@linux.intel.com
Date: Tue, 17 Sep 2019 17:37:33 -0700
Message-Id: <1568767053-29469-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(199004)(189003)(48376002)(478600001)(70206006)(70586007)(4326008)(305945005)(36756003)(2906002)(107886003)(50226002)(14444005)(50466002)(81166006)(8676002)(36386004)(81156014)(47776003)(336012)(5660300002)(44832011)(316002)(486006)(106002)(356004)(8936002)(16586007)(2616005)(126002)(51416003)(476003)(186003)(7696005)(426003)(26005)(9786002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB5338; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67af97ec-d972-431a-b6c5-08d73bd06d69
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(4709080)(1401327)(4618075)(2017052603328);
	SRVR:DM6PR02MB5338; 
X-MS-TrafficTypeDiagnostic: DM6PR02MB5338:
X-Microsoft-Antispam-PRVS: <DM6PR02MB53382487D19A637AE37A7754AF8E0@DM6PR02MB5338.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 01644DCF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: PCSBGTYi8UWGPYlbq6BSlLDg5xRtK4Pgsqur0AoryDPX2iW6zDtTzQOxTwNA9rG9lrGSi3Eekcl0BPhTBjEiJvKurK9Dbiy1nxMT7jRyNaw0nSk/ZKunh/JnSnm/T4w79ctumOI3WGh+hE6ayj7GrTCMwvGunCQ8qLsoD6PKHKa3CdggRS4ThsCgnpbipoZgNW7/Wpmvzi2vbxhpVr/fKMT1vIBF9J9I1RLETavvUo6jmiCMp19sefwAKMOts9CgnZC48zQfDJ9Ku7NV3NZ42Xsh20dVz19NAhHcB7zhTu24z8r2QYnjsAjmTwAgfAjToFAM+uXoBCSsqHTHlGtfCKgy5wGYlFV128Ck9JQcekQTBGkkWZp+cHmPit0dIf4ncX/et0689SNRLZlyI0P7uqE1IXaqrR5KHBMKXENppKw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2019 00:37:46.9474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67af97ec-d972-431a-b6c5-08d73bd06d69
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5338
Subject: [master][PATCH v2] Introduce mechanism to keep nativesdk* sstate in esdk
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
X-List-Received-Date: Wed, 18 Sep 2019 00:37:48 -0000
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
Changes in v2:
    change to commit message to include reason
    got rid of some tabs
    rebased to apply on master
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


