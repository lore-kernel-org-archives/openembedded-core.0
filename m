Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 53306 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Mar 2019 21:16:44 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr810043.outbound.protection.outlook.com [40.107.81.43])
	by mail.openembedded.org (Postfix) with ESMTP id ED0F06D409
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nHxGque+99acsO1yZjlhprMqP5QgUQAlGsZViIgcHqk=;
	b=K6U0rBCPHGpSBWd8/gjmsnDMrCQQu5qs7PTYneXZWqrGJ4A8bldHT4ASak7eJXVe/8qG9RPlUDPvpTi+05h+JdOGReRcChTBJVsJ1id9QKz7q+tP4RkoMBKnBF+/dmhwlrtKJVd9yS3zOipHzSYEm/ZgMnQW45FcgLghgXdV4jg=
Received: from CY4PR02CA0017.namprd02.prod.outlook.com (2603:10b6:903:18::27)
	by BN7PR02MB5236.namprd02.prod.outlook.com (2603:10b6:408:2a::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1750.15;
	Thu, 28 Mar 2019 18:55:35 +0000
Received: from CY1NAM02FT012.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by CY4PR02CA0017.outlook.office365.com
	(2603:10b6:903:18::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1750.17 via
	Frontend Transport; Thu, 28 Mar 2019 18:55:35 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT012.mail.protection.outlook.com (10.152.75.158) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1750.16
	via Frontend Transport; Thu, 28 Mar 2019 18:55:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1h9aBa-0004Fl-OK
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2019 11:55:34 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1h9aBV-0007Ob-LF
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2019 11:55:29 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
	be forged))
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x2SItSm6030848; Thu, 28 Mar 2019 11:55:28 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1h9aBU-0007OK-LD; Thu, 28 Mar 2019 11:55:28 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 11:55:20 -0700
Message-ID: <1553799321-17585-3-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553799321-17585-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1553799321-17585-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(396003)(136003)(39850400004)(346002)(2980300002)(189003)(199004)(77096007)(11346002)(26005)(9786002)(426003)(446003)(81156014)(81166006)(8676002)(476003)(2616005)(63266004)(486006)(126002)(107886003)(5660300002)(356004)(8936002)(4326008)(186003)(336012)(50226002)(305945005)(106466001)(2351001)(6666004)(51416003)(316002)(16586007)(36756003)(14444005)(6916009)(478600001)(2906002)(36386004)(7696005)(48376002)(106002)(47776003)(76176011)(50466002)(54906003)(42866002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR02MB5236; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85c42615-bbf2-4c5c-cf82-08d6b3aef60b
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4709054)(2017052603328)(7153060);
	SRVR:BN7PR02MB5236; 
X-MS-TrafficTypeDiagnostic: BN7PR02MB5236:|BN7PR02MB5236:|BN7PR02MB5236:|BN7PR02MB5236:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN7PR02MB52365944DE66D9EABAF0996DB0590@BN7PR02MB5236.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0990C54589
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VLMpUMgho3GwJ1fiJZ7VF7ndxnRezrUvEdw9OfKjlKydx56Ci07uVg8opdl+V6Elk9Z9CmypTLC3ze+HxhAkQQxL52mxtjWieDxrWuz2r4C2i2aJtCQA1oC9NM8kcaAi3Eawp393fXwm4UbyuxZew7guXrCMdoS9mmz2hO8SIW20G4RIMAoKtJ+vjVAJz7ZNotnrJEeoclpNfIkfL1xE12M2YymrFj35uIIw6GxKkftVLg2lwqZpe/VAPzmEDDXJxw5ZWpkpLB/sHxxTYMS9mzABb/ftMcwzIK15ABEZuPFWJ5KFNscO/BKoL1i08VyUNwF4DIc2wmCSRATLMSlXgVTI6IRPVrz+AJVv66eCpBKpfW6ZSSz3GVKJecOnrFbnkG3MGz3HQRXsA/zWRWjvDdMP0EMzZRi0xZMFjbnaxXw=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2019 18:55:35.1473 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c42615-bbf2-4c5c-cf82-08d6b3aef60b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5236
X-OriginatorOrg: xilinx.com
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH v3 2/3] devtool/standard.py: Create a copy of kernel source within work-shared if not present
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
X-List-Received-Date: Fri, 29 Mar 2019 21:16:45 -0000
Content-Type: text/plain

If kernel source is not already downloaded i.e staging kernel dir is
empty, place a copy of the source when the user runs devtool modify
linux-yocto. This way the kernel source is available for other packages
that use it.

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 scripts/lib/devtool/standard.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 2338135..dc15c89 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -476,6 +476,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
     """Extract sources of a recipe"""
     import oe.recipeutils
     import oe.patch
+    import oe.path
 
     pn = d.getVar('PN')
 
@@ -572,7 +573,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         with open(preservestampfile, 'w') as f:
             f.write(d.getVar('STAMP'))
         try:
-            if bb.data.inherits_class('kernel-yocto', d):
+            if is_kernel_yocto:
                 # We need to generate the kernel config
                 task = 'do_configure'
             else:
@@ -599,6 +600,18 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             raise DevtoolError('Something went wrong with source extraction - the devtool-source class was not active or did not function correctly:\n%s' % str(e))
         srcsubdir_rel = os.path.relpath(srcsubdir, os.path.join(tempdir, 'workdir'))
 
+        # Check if work-shared is empty, if yes 
+        # find source and copy to work-shared
+        if is_kernel_yocto:
+              workshareddir = d.getVar('STAGING_KERNEL_DIR')
+              staging_kerVer = get_staging_kver(workshareddir) 
+              kernelVersion = d.getVar('LINUX_VERSION')
+              if (os.path.exists(workshareddir) and (not os.listdir(workshareddir) or kernelVersion!=staging_kerVer)): 
+                   shutil.rmtree(workshareddir)
+                   oe.path.copyhardlinktree(srcsubdir,workshareddir)
+              elif (not os.path.exists(workshareddir)):
+                   oe.path.copyhardlinktree(srcsubdir,workshareddir)
+
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
         srctree_localdir = os.path.join(srctree, 'oe-local-files')
 
-- 
2.7.4


