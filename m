Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 39407 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Apr 2019 21:12:05 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790080.outbound.protection.outlook.com [40.107.79.80])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9126BCA9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 21:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZQSdWQH6dFRli061MA2LBbP8R1cXyLCwT+X16uA33Wo=;
	b=bJs78uXJi+v6NH4hplAHX2ep8VO6FoWvz5oHkSWkq0n/NhIBEnCe7KIu0EGzzhEWd5aQe0DQpCd4KdGXsEYuCawAwy4NQQtadyhDr7aBdrh5w5FDyU509v6UdddD1jeYdNkL1u255Cmj9qUCOgdzjW8VDORnSo/BSlV2Y3P50Uw=
Received: from SN6PR02CA0030.namprd02.prod.outlook.com (2603:10b6:805:a2::43)
	by BN1PR02MB152.namprd02.prod.outlook.com (2a01:111:e400:20::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1792.15;
	Wed, 17 Apr 2019 22:43:10 +0000
Received: from BL2NAM02FT004.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by SN6PR02CA0030.outlook.office365.com
	(2603:10b6:805:a2::43) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1813.12 via
	Frontend Transport; Wed, 17 Apr 2019 22:43:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT004.mail.protection.outlook.com (10.152.76.168) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1771.16
	via Frontend Transport; Wed, 17 Apr 2019 22:43:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hGtGn-0003hB-Ly
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2019 15:43:09 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hGtGi-0003j6-If
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2019 15:43:04 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1hGtGe-0003h6-I4; Wed, 17 Apr 2019 15:43:00 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2019 15:42:58 -0700
Message-ID: <1555540979-27879-3-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555540979-27879-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1555540979-27879-1-git-send-email-chandana.kalluri@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(136003)(396003)(39860400002)(2980300002)(199004)(189003)(81166006)(5660300002)(4326008)(47776003)(107886003)(51416003)(50226002)(36386004)(63266004)(16586007)(356004)(9786002)(316002)(305945005)(36756003)(106002)(54906003)(7696005)(336012)(446003)(76176011)(126002)(478600001)(8936002)(50466002)(48376002)(426003)(11346002)(476003)(26005)(6916009)(8676002)(2616005)(77096007)(486006)(2351001)(81156014)(186003)(2906002)(14444005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR02MB152; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a448a280-76b2-480c-addc-08d6c3861162
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:BN1PR02MB152; 
X-MS-TrafficTypeDiagnostic: BN1PR02MB152:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN1PR02MB1529E0CABE04BB8C67C4CCEB0250@BN1PR02MB152.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0010D93EFE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HsA/VSIeqd0/v+lrUqVSZkJ8yvRtIyDmPcUyzTKREuoSNSgGx+iXLo96VLZrw6tO5Sv2pUn+aibYFI5q26LqypR47FCnY3URU1iAveCaNLTMqUBNnYUExIzioz54ku4iqEJ6rnf69r/sM7DRzplG/g2uk2pP3Dd0N0ns0f7LL75YIsqqJBdI9Tg92ioc4qucp2Fw9Ag5Nh8DenjEm8d+4prr7DefEhPQWp/6j6eRSTBW+r7lVCwU0hGp1xVEFpMzqqIiyKKGpYuOImqM6vX6rOgzpEdoazJAP9byXerWoXnQdX/FYtKYxIL3VpnLa3fyXQICtTXHLXxNDxSyy6RC/b5W3iAajIMmd6VzQ/gcegmj+FmUq62eiruok87k3Ab0wH4fqbvMosf0GnD37YvKsEayY3DGYVCtIEeIQurcEc8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2019 22:43:10.2496 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a448a280-76b2-480c-addc-08d6c3861162
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR02MB152
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH v4 2/3] devtool/standard.py: Create a copy of kernel source within work-shared if not present
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
X-List-Received-Date: Thu, 18 Apr 2019 21:12:05 -0000
Content-Type: text/plain

If kernel source is not already downloaded i.e staging kernel dir is
empty, place a copy of the source when the user runs devtool modify
linux-yocto.  This way the kernel source is available for other packages
that use it.

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 scripts/lib/devtool/standard.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 33193f8..9267d6e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -500,6 +500,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
     """Extract sources of a recipe"""
     import oe.recipeutils
     import oe.patch
+    import oe.path
 
     pn = d.getVar('PN')
 
@@ -596,7 +597,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         with open(preservestampfile, 'w') as f:
             f.write(d.getVar('STAMP'))
         try:
-            if bb.data.inherits_class('kernel-yocto', d):
+            if is_kernel_yocto:
                 # We need to generate the kernel config
                 task = 'do_configure'
             else:
@@ -623,6 +624,18 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
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


