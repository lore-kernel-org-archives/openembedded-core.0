Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.65])
 by mx.groups.io with SMTP id smtpd.web11.9797.1602588806814930273
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 04:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=L7H20GZY;
 spf=pass (domain: arm.com, ip: 40.107.20.65, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+5VfBvmaJ7l/rAq5qEZo1iUrWYcAQV/XKDYM2JWQxo=;
 b=L7H20GZYF91aygpVnuZN5BQZxty8uMkQg34rX5VXEz6XoJ/afSiCMi+SwOv4IiTwGgXaqr9Lj7vmFtFAVQDrMvKKS6qnaDoeTYNkKwom9Vh8kSlcScKkiUtRj0I2Vxz8qZdPcrPjeKqlnQbaoZYCVLECkhPEepSwGkKifBL6//A=
Received: from AM7PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:20b:110::11)
 by VI1PR08MB3742.eurprd08.prod.outlook.com (2603:10a6:803:c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27; Tue, 13 Oct
 2020 11:33:23 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::16) by AM7PR04CA0001.outlook.office365.com
 (2603:10a6:20b:110::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Tue, 13 Oct 2020 11:33:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 11:33:23 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Tue, 13 Oct 2020 11:33:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b21ed3f7b5b16407
X-CR-MTA-TID: 64aa7808
Received: from 0939827b2316.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C478EDC2-DFD3-43AB-A7B7-CCED2DADE36E.1;
	Tue, 13 Oct 2020 11:32:45 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0939827b2316.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Oct 2020 11:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoZsjm8D+7mYhh0Uvj0mKkBWJIRFwJO2epFO9Oys0NqLrnF01tWxUo0w5tVnkRBFt6FHzybmDYCKtmhqTcSAe4shv3Up261Ffz+Y/pPesgRHfZyHZw8wqM3yDp0dOw6IBxRo1jJ9T6Ym18RaG6xhi39IAayTkiMkv3d8iGlQji7RJlI5Cp0e54bcZdaT5EgrXlaAtVHESN3QXkThh9tUHbrtKrLGzYs+ADEV4blb5ivxdDstBllzuwL2O7fwKnlUl2+YssoEqIf7yV4YmCNA4w30wvqr52hSuyP2o8k7V6PmsAgrMAWHSQGqJPy5wSixv9u9odoKM2F0npNqfo4c2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+5VfBvmaJ7l/rAq5qEZo1iUrWYcAQV/XKDYM2JWQxo=;
 b=MW2EmsaQix6BWoSfe8bPwGk+4ERFiTlYI6eer2SHOTObHio34km2F+wBmpLVIvqH8QgS4tQ98e8r0jn/i9nDXWuCSLZFE6/DY7UXEH1O0DzKooIA7dEgjp3Tp3t3+LMqtHmSiH/6H4ljXen92BWoRd3CQ7WATFWI4Ejv/SSDGi1KmocF/VER2f2D7q8Zv2gbhF3POf3COsHQs8gyltAaARFdF8wUzTGL6bp8VA6BK0qgOI/FRJheKsVNWHaHYvkmj5SzkbStc4fCDLEOuu/CgOPd616jkN8I3Yx66fNvLMcbfqmFNsPJgvRcOESUUud3jVZu6WtiNh9JeLY0qGQZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+5VfBvmaJ7l/rAq5qEZo1iUrWYcAQV/XKDYM2JWQxo=;
 b=L7H20GZYF91aygpVnuZN5BQZxty8uMkQg34rX5VXEz6XoJ/afSiCMi+SwOv4IiTwGgXaqr9Lj7vmFtFAVQDrMvKKS6qnaDoeTYNkKwom9Vh8kSlcScKkiUtRj0I2Vxz8qZdPcrPjeKqlnQbaoZYCVLECkhPEepSwGkKifBL6//A=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB6PR0802MB2325.eurprd08.prod.outlook.com (2603:10a6:4:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 13 Oct
 2020 11:32:43 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32%5]) with mapi id 15.20.3455.031; Tue, 13 Oct 2020
 11:32:43 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: openembedded-core@lists.openembedded.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [meta-oe][PATCH 2/2] oeqa/selftest/imagefeatures: adding fitImage testcases for initramfs bundle and boot script
Date: Tue, 13 Oct 2020 12:32:32 +0100
Message-Id: <20201013113232.29228-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013113232.29228-1-abdellatif.elkhlifi@arm.com>
References: <20201013113232.29228-1-abdellatif.elkhlifi@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0382.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::34) To DB7PR08MB3531.eurprd08.prod.outlook.com
 (2603:10a6:10:49::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO2P265CA0382.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27 via Frontend Transport; Tue, 13 Oct 2020 11:32:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41cd30d8-7a8b-4b14-4311-08d86f6bcb1e
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2325:|VI1PR08MB3742:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB374276B793D3F8F7CD8496ADFD040@VI1PR08MB3742.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:81;OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Q9LQoRP7vOM8gMUw7985xTZO0QkxftKFICZIfyWac93cE7SaDYewqouSgQnf+rfVG+nFtFKIi2+u1U4eh+2huTXbhefCJzWqwcCwqLNbODpWYgzFnI6tWs86oy+nz28GDL01weKnLHfJyJaPef5NEuGcg43xofSOkNPVcHIM0IrQ0DEu3CEzQqOAr0IST0uBB0CvwT2etC1EkEbt2anJaRcjg4cCAF4XFcYsNXuwz+y5QySGN7KO0z1e/Bi1umaHejiN0A2OpplXazi0CcRjnY9SL2E+S74ST8PlFTXdo/cdoIrU3zFcNfo+z4Wrw5Dp
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(36756003)(66946007)(4326008)(66476007)(66556008)(7696005)(8676002)(478600001)(5660300002)(52116002)(6486002)(2616005)(956004)(6666004)(2906002)(26005)(8936002)(1076003)(9686003)(16526019)(186003)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 kRV0OoGCmfYe8C0rOpEWQhqzzG14xP2SEcTTwVGiNi0obZVMIdu3bznCqBzT863UGY5bp8t5T8LfYdum/GNYWgIg8+8sHu4krBr3kSSEnQmbJJ0kX+4sLCqyiN4vXh5M+wyagxTbpWoZ61kG9SpwggAORUVtcZJC7Xhg6uy0595zKB3XlMo9J+XuN5xBfSowgRekbaDBZKx8D8y2w0wfuvJWiJ0pLv0InTbaJ0zx4wEr1ArEXNathYNI8+0gX3CHwsz/lmjuaBOfE1sE1QimQyGN2s64b5cbAj/I6EozyCZHPovUUOTmle8Eq/e03uSicibNB/53V9G2sb0ERuRlYOo0lv20VZ7hZHQd0kTndVvHEN3jjI1KaKhC2oQEZlzTnu7vexUAcRVNVwx26Wmiv55kMzgpx/N81w2FfOD7quqHQ3Jfmzewu7HevTFs4EVVDdujc/pi+QPcO2C4YucyJgjaxz8FC/HdAQbiXBhOkFHF1H12t1mPXLk/Fcurh3cCdOHxYRwdqZ+wNpIIz3LGENvebwPBioXQWuWQS86zYeayVnJX6zTC+EfghwO/9lB59D8HMI+cDPzO7wyd0n5so1hnM8xrIW5RBsvP49xKhMj6z9e0BM1Rd9snZRZXpwQLhBGwBqWZLBQF/HGHYbiD0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2325
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cbc10ace-76eb-4c03-2f03-08d86f6bb356
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DY3mtMzEQ/ayWEmkQeejIkYWjpYyvOIBkLUG+fbIAoE03b6Gvphro7pXnQreVM97elIKmfHVMSeKW5UFhAZdtMGNFDvLGsDAD5HINqErg/RN8H90IHOIHCxXRtTI+L6XAgjfphdZ/H3fkyYG5pNN+V/8YcYOzbgZuwdmTXSYJkYt0VmbJFMqb0Ag4pLg+q4tr0aMD1bKmBFJWora9JMqM3Jc4vXRgA+FOTG0AuPvAmkKm1145TKjoWtTrxj5vmexTVmqPbGxyL+1Fv8VFho6Pa6XlDpmec19CCwDXP1qaHkK3egUuRhk5H/62mNwz8Oc+xYnd22psznxCHrdrsQ1akQ/JyxfIh2Vn8pUOOTustMdvy9w0uWuSxY8oki56Vvwf++SHPbizAhYhnH1WDYlbw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966005)(356005)(8676002)(82740400003)(47076004)(26005)(336012)(186003)(36756003)(956004)(2616005)(9686003)(16526019)(81166007)(478600001)(5660300002)(6486002)(316002)(2906002)(1076003)(6666004)(7696005)(36906005)(86362001)(70586007)(70206006)(82310400003)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 11:33:23.2087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cd30d8-7a8b-4b14-4311-08d86f6bcb1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3742
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

- This commit allows to test the initramfs bundle feature through a new testcase that  checks
if FIT image and Image Tree Source (ITS) are built and the Image Tree Source has the correct
initramfs bundle fields.
The FIT settings are automatically read from the current machine conf file or from local.conf.

This testcase can be run through the following command:

oe-selftest -r imagefeatures.ImageFeatures.test_signed_fit_image_initramfs

- This commit also allows to test the u-boot script feature through a new testcase that checks
if FIT image and Image Tree Source are built and the Image Tree Source has the correct
uboot script fields.
The FIT settings are automatically read from the current machine conf file or from local.conf.

This testcase can be run through the following command:

oe-selftest -r imagefeatures.ImageFeatures.test_signed_fit_image_bootscr

Change-Id: I2d4e670ca9cd4971194edccf9fa6c5ede6627f31
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 215 ++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index f7a2533746..69c4313c5e 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -7,6 +7,7 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.sshcontrol import SSHControl
 import os
 import json
+import re
 
 class ImageFeatures(OESelftestTestCase):
 
@@ -278,6 +279,7 @@ PNBLACKLIST[busybox] = "Don't build this"
         """
         config = """
 # Enable creation of fitImage
+
 KERNEL_IMAGETYPE = "Image"
 KERNEL_IMAGETYPES += " fitImage "
 KERNEL_CLASSES = " kernel-fitimage "
@@ -337,6 +339,219 @@ UBOOT_ENTRYPOINT = "0x80080000"
                 "Fields in Image Tree Source File %s did not match, error in finding %s"
                 % (fitimage_its_path, its_field_check[field_index]))
 
+    def test_signed_fit_image_initramfs(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are built
+                     and the Image Tree Source has the correct initramfs bundle fields.
+                     The FIT settings are automatically read from the current machine
+                     conf file or from local.conf , no need to set values in this function
+        Expected:    1. fitImage and fitImage ITS are built with initramfs bundle support
+                     2. All the fields in the kernel node are as expected (matching the
+                        conf settings)
+                     3. The kernel is included in all the available configurations and
+                        its hash is included in the configuration signature
+        Usage:      Set the following variables in the machine conf file:
+
+                    INITRAMFS_IMAGE_BUNDLE = "1"
+                    INITRAMFS_IMAGE = "<the initramfs image>"
+                    UBOOT_CONFIG ??= "FIT"
+                    UBOOT_CONFIG[FIT] = "<machine>_defconfig"
+                    KERNEL_CLASSES = " kernel-fitimage "
+                    KERNEL_IMAGETYPES = "fitImage"
+                    UBOOT_SIGN_ENABLE = "1"
+                    UBOOT_SIGN_KEYNAME = "<key name>"
+                    UBOOT_SIGN_KEYDIR ?= "${DEPLOY_DIR_IMAGE}"
+                    UBOOT_DTB_BINARY = "u-boot.dtb"
+                    UBOOT_ENTRYPOINT  = "<initramfs bundle address in RAM>"
+                    UBOOT_LOADADDRESS = "<initramfs bundle address in RAM>"
+                    UBOOT_DTB_LOADADDRESS = "<DTB address in RAM>"
+                    UBOOT_ARCH = "arm"
+                    UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+                    UBOOT_EXTLINUX = "0"
+                    KERNEL_IMAGETYPE_REPLACEMENT = "<the value set in the kernel-fitimage.bbclass>"
+                    FIT_HASH_ALG = "<sha algorithm>"
+
+        Product:     oe-core
+        Author:      Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+        """
+
+        # fitImage is created as part of linux recipe
+        bitbake("virtual/kernel")
+
+        image_type = get_bb_var('INITRAMFS_IMAGE')
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        machine = get_bb_var('MACHINE')
+        fitimage_its_path = os.path.join(deploy_dir_image,
+                    "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
+        fitimage_path = os.path.join(deploy_dir_image,"fitImage")
+
+        self.assertTrue(os.path.exists(fitimage_its_path),
+            "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertTrue(os.path.exists(fitimage_path),
+            "%s FIT image doesn't exist" % (fitimage_path))
+
+        kernel_load = str(get_bb_var('UBOOT_LOADADDRESS'))
+        kernel_entry = str(get_bb_var('UBOOT_ENTRYPOINT'))
+        initramfs_bundle_format = str(get_bb_var('KERNEL_IMAGETYPE_REPLACEMENT'))
+        uboot_arch = str(get_bb_var('UBOOT_ARCH'))
+        initramfs_bundle = "arch/" + uboot_arch + "/boot/" + initramfs_bundle_format + ".initramfs"
+        fit_hash_alg = str(get_bb_var('FIT_HASH_ALG'))
+
+        its_file = open(fitimage_its_path)
+
+        its_lines = [line.strip() for line in its_file.readlines()]
+
+        exp_node_lines = [
+            'kernel@1 {',
+            'description = "Linux kernel";',
+            'data = /incbin/("' + initramfs_bundle + '");',
+            'type = "kernel";',
+            'arch = "' + uboot_arch + '";',
+            'os = "linux";',
+            'compression = "none";',
+            'load = <' + kernel_load + '>;',
+            'entry = <' + kernel_entry + '>;',
+            'hash@1 {',
+            'algo = "' + fit_hash_alg +'";',
+            '};',
+            '};'
+        ]
+
+        node_str = exp_node_lines[0]
+
+        test_passed = False
+
+        if node_str in its_lines:
+            node_start_idx = its_lines.index(node_str)
+            node = its_lines[node_start_idx:(node_start_idx + len(exp_node_lines))]
+            if node != exp_node_lines:
+                self.assertTrue(test_passed == True,"kernel node does not match expectation")
+
+        rx_configs = re.compile("^conf@.*")
+        its_configs = list(filter(rx_configs.match, its_lines))
+
+        for cfg_str in its_configs:
+            cfg_start_idx = its_lines.index(cfg_str)
+            line_idx = cfg_start_idx + 2
+            node_end = False
+            while node_end == False:
+                if its_lines[line_idx] == "};" and its_lines[line_idx-1] == "};" :
+                    node_end = True
+                line_idx = line_idx + 1
+
+            node = its_lines[cfg_start_idx:line_idx]
+            rx_desc_line = re.compile("^description.*1 Linux kernel.*")
+            if len(list(filter(rx_desc_line.match, node))) != 1:
+                self.assertTrue(test_passed == True,"kernel keyword not found in the description line")
+                break
+
+            if 'kernel = "kernel@1";' not in node:
+                self.assertTrue(test_passed == True,"kernel line not found")
+                break
+
+            rx_sign_line = re.compile("^sign-images.*kernel.*")
+            if len(list(filter(rx_sign_line.match, node))) != 1:
+                self.assertTrue(test_passed == True,"kernel hash not signed")
+                break
+
+            test_passed = True
+
+    def test_signed_fit_image_bootscr(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are built
+                     and the Image Tree Source has the correct uboot script fields.
+                     The FIT settings are automatically read from the current machine
+                     conf file or from local.conf , no need to set values in this function
+        Expected:    1. fitImage and fitImage ITS are built with uboot script support
+                     2. All the fields in the uboot script node are as expected (matching the
+                        conf settings)
+                     3. The uboot script is included in all the available configurations and
+                        its hash is included in the configuration signature
+        Usage:      In addition to the settings related to the FIT, make sure the
+                    following variables are set in the machine conf file:
+
+                    UBOOT_ENV_SUFFIX = "scr"
+                    UBOOT_ENV_BINARY = "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
+
+        Product:     oe-core
+        Author:      Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+        """
+
+        # fitImage is created as part of linux recipe
+        bitbake("virtual/kernel")
+
+        image_type = get_bb_var('INITRAMFS_IMAGE')
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        machine = get_bb_var('MACHINE')
+        fitimage_its_path = os.path.join(deploy_dir_image,
+                    "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
+        fitimage_path = os.path.join(deploy_dir_image,"fitImage")
+
+        self.assertTrue(os.path.exists(fitimage_its_path),
+            "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertTrue(os.path.exists(fitimage_path),
+            "%s FIT image doesn't exist" % (fitimage_path))
+
+        uboot_arch = str(get_bb_var('UBOOT_ARCH'))
+        fit_hash_alg = str(get_bb_var('FIT_HASH_ALG'))
+        uboot_env_bin = str(get_bb_var('UBOOT_ENV_BINARY'))
+
+        its_file = open(fitimage_its_path)
+
+        its_lines = [line.strip() for line in its_file.readlines()]
+
+        exp_node_lines = [
+            'bootscr@' + uboot_env_bin + ' {',
+            'description = "U-boot script";',
+            'data = /incbin/("' + uboot_env_bin + '");',
+            'type = "script";',
+            'arch = "' + uboot_arch + '";',
+            'compression = "none";',
+            'hash@1 {',
+            'algo = "' + fit_hash_alg +'";',
+            '};',
+            '};'
+        ]
+
+        node_str = exp_node_lines[0]
+
+        test_passed = False
+
+        if node_str in its_lines:
+            node_start_idx = its_lines.index(node_str)
+            node = its_lines[node_start_idx:(node_start_idx + len(exp_node_lines))]
+            if node != exp_node_lines:
+                self.assertTrue(test_passed == True,"uboot script node does not match expectation")
+
+        rx_configs = re.compile("^conf@.*")
+        its_configs = list(filter(rx_configs.match, its_lines))
+
+        for cfg_str in its_configs:
+            cfg_start_idx = its_lines.index(cfg_str)
+            line_idx = cfg_start_idx + 2
+            node_end = False
+            while node_end == False:
+                if its_lines[line_idx] == "};" and its_lines[line_idx-1] == "};" :
+                    node_end = True
+                line_idx = line_idx + 1
+
+            node = its_lines[cfg_start_idx:line_idx]
+            rx_desc_line = re.compile("^description.*u-boot script.*")
+            if len(list(filter(rx_desc_line.match, node))) != 1:
+                self.assertTrue(test_passed == True,"uboot script keyword not found in the description line")
+                break
+
+            if 'bootscr = "bootscr@' + uboot_env_bin + '";' not in node:
+                self.assertTrue(test_passed == True,"uboot script line not found")
+                break
+
+            rx_sign_line = re.compile("^sign-images.*bootscr.*")
+            if len(list(filter(rx_sign_line.match, node))) != 1:
+                self.assertTrue(test_passed == True,"uboot script hash not signed")
+                break
+
+            test_passed = True
+
     def test_image_gen_debugfs(self):
         """
         Summary:     Check debugfs generation
-- 
2.17.1

