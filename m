Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 10758 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jul 2019 00:00:58 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740075.outbound.protection.outlook.com [40.107.74.75])
	by mail.openembedded.org (Postfix) with ESMTP id 089A57F010
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 00:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=T2gKUzfULi4b/+SHkQsAoNlMe5N6HkgyA0L4Tlc6cXQ=;
	b=KZzMiCFsMafaBj47511o1+ADUm+xjXLhlOJyQsrud4TlGFX9GkRNE+mTXuCupcA5ABJql4lfrkLkTTOXj2541d0Ql6Hl+shd8s2yNPEsM3D9DW6SLt1B9J0LOOKeH5MmoxwLf0PHJba4JO18muOeoTtnB5wZdnXhgWtkUWfc+3Y=
Received: from BYAPR02CA0070.namprd02.prod.outlook.com (2603:10b6:a03:54::47)
	by BL0PR02MB3715.namprd02.prod.outlook.com (2603:10b6:207:47::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19;
	Wed, 10 Jul 2019 18:27:50 +0000
Received: from CY1NAM02FT015.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by BYAPR02CA0070.outlook.office365.com
	(2603:10b6:a03:54::47) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via
	Frontend Transport; Wed, 10 Jul 2019 18:27:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT015.mail.protection.outlook.com (10.152.75.146) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2032.15
	via Frontend Transport; Wed, 10 Jul 2019 18:27:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50508
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hlHJk-0004WZ-T4
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Jul 2019 11:27:48 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hlHJf-00053w-PP
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Jul 2019 11:27:43 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
	be forged))
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x6AIRZXG005424; Wed, 10 Jul 2019 11:27:35 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1hlHJX-00053K-AR; Wed, 10 Jul 2019 11:27:35 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 11:27:33 -0700
Message-Id: <1562783254-14818-3-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562783254-14818-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1562783254-14818-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(199004)(189003)(2906002)(107886003)(50226002)(8676002)(4326008)(76176011)(63266004)(336012)(51416003)(5660300002)(426003)(9786002)(186003)(26005)(36756003)(8936002)(6916009)(81156014)(478600001)(81166006)(54906003)(7696005)(2351001)(70586007)(2361001)(16586007)(50466002)(48376002)(106002)(356004)(70206006)(316002)(2616005)(476003)(446003)(11346002)(305945005)(126002)(486006)(14444005)(47776003)(36386004)(42866002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB3715; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 750af35f-f40d-413b-121a-08d705645018
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
	SRVR:BL0PR02MB3715; 
X-MS-TrafficTypeDiagnostic: BL0PR02MB3715:
X-Microsoft-Antispam-PRVS: <BL0PR02MB37150BBA9D1A898F273848AEB0F00@BL0PR02MB3715.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0094E3478A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: r/pRVOF0pZ50Ur2iMkMGKWfinhIwxbEr8h1fnAU2t0FjjxjNOdTugazLer8AZ8ekIpo4lALYZYsHtT75mihjjxvkZCd3yyMv6UXnPnyiZjCFvql+fiVBTzF/png5RAfD/SOFQ346L6PlBlzjNymJsvPRpD76rX00qPXrkX0Jbov/kzR2+8POPUVOJ2xlF04zKfhHd3s8/H2gxceEZoPhr+DYk7iNaEgzPVpduy6KAodiwywe+1eRABcbxMcsgM0AzqofR10Q/bkwOHsd12NRZpdknAbTqMNH7ltQLVSgzmM1xbSRMwH8QvujIOipmn1sZo36zJtxzzjjAVUXQV153rQIXZnu/bb8JzIkOOuYFFGmupK1J9OOB1fnjxKF84QxWduo76G+lLqyjiOgfzaUbhIq5i6nN3nuCRyAIloJGa8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2019 18:27:49.3156 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 750af35f-f40d-413b-121a-08d705645018
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3715
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH 2/3] devtool/standard.py: Create a copy of kernel source within work-shared if not present
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
X-List-Received-Date: Thu, 11 Jul 2019 00:00:59 -0000
Content-Type: text/plain

If kernel source is not already downloaded i.e staging kernel dir is
empty, place a copy of the source when the user runs devtool modify
linux-yocto.  This way the kernel source is available for other packages
that use it.

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 scripts/lib/devtool/standard.py | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 2ac14b8..0759211 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -491,6 +491,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
     """Extract sources of a recipe"""
     import oe.recipeutils
     import oe.patch
+    import oe.path
 
     pn = d.getVar('PN')
 
@@ -587,7 +588,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         with open(preservestampfile, 'w') as f:
             f.write(d.getVar('STAMP'))
         try:
-            if bb.data.inherits_class('kernel-yocto', d):
+            if is_kernel_yocto:
                 # We need to generate the kernel config
                 task = 'do_configure'
             else:
@@ -614,6 +615,23 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             raise DevtoolError('Something went wrong with source extraction - the devtool-source class was not active or did not function correctly:\n%s' % str(e))
         srcsubdir_rel = os.path.relpath(srcsubdir, os.path.join(tempdir, 'workdir'))
 
+        # Check if work-shared is empty, if yes 
+        # find source and copy to work-shared
+        if is_kernel_yocto:
+              workshareddir = d.getVar('STAGING_KERNEL_DIR')
+              staging_kerVer = get_staging_kver(workshareddir) 
+              kernelVersion = d.getVar('LINUX_VERSION')
+
+              #handle dangling symbolic link in work-shared:
+              if(os.path.islink(workshareddir)):
+                     os.unlink(workshareddir)
+
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


