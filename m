Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 856 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Nov 2017 01:02:27 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0053.outbound.protection.outlook.com [104.47.38.53])
	by mail.openembedded.org (Postfix) with ESMTP id 50E2578842
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 01:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=215sGFkt5bScdicV8pwGlyT6x+54/lelZJn6DsPXtWY=;
	b=kk25gxf2Gt+0xrG9/TbT1bzgojttVwIqnX4rRRKZ3wJsEPF3l4G73/8/DAUnUPXcqcf0Zhb6DbNROY8hvGwv/1sGW5ik76xCWZ7ruxZAbPChoMbA2Qal8reSuuNSQ7HUrboyNeSEyBbA35Ceq10NqWu7SaG2e9xmCPmU0LAKuZc=
Received: from BN6PR02CA0025.namprd02.prod.outlook.com (10.173.146.139) by
	CY1PR02MB1335.namprd02.prod.outlook.com (10.161.170.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.239.5; Wed, 22 Nov 2017 00:48:12 +0000
Received: from SN1NAM02FT037.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BN6PR02CA0025.outlook.office365.com
	(2603:10b6:404:5f::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.239.5 via
	Frontend Transport; Wed, 22 Nov 2017 00:48:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT037.mail.protection.outlook.com (10.152.72.89) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.218.12
	via Frontend Transport; Wed, 22 Nov 2017 00:48:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45093
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eHJD0-0005tM-Q8; Tue, 21 Nov 2017 16:48:10 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eHJD0-0002xp-NO; Tue, 21 Nov 2017 16:48:10 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vAM0m4Mp011226; Tue, 21 Nov 2017 16:48:04 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eHJCu-0002wG-0W; Tue, 21 Nov 2017 16:48:04 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Nov 2017 16:43:57 -0800
Message-ID: <20171122004357.28163-2-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171122004357.28163-1-alistair.francis@xilinx.com>
References: <20171122004357.28163-1-alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23478.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(199003)(189002)(356003)(50466002)(8936002)(9786002)(47776003)(189998001)(2906002)(33646002)(106466001)(36386004)(305945005)(50226002)(48376002)(6666003)(36756003)(54906003)(4326008)(8676002)(81156014)(2351001)(81166006)(5660300001)(2950100002)(39060400002)(77096006)(107886003)(50986999)(6916009)(106002)(76176999)(5003940100001)(16586007)(478600001)(316002)(63266004)(1076002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1335; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT037;
	1:yxiR4REo95Gjx5vPETqsyeLdFfh8HEvi1VJ5U6yXJ7QA1KpNezq9FVRi816gQwEFzmRkVeJDztt7B909dXhoh9GxOBeHBI7aPobOC32R7Qdp2iZj0RH5ZhRzr4+8koUr
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3103c1f-31bb-459f-f7c8-08d53142b4e0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:CY1PR02MB1335; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	3:cEkGZKTf0afdq1SlY9+m07eySftYUvgoeKlZoq5573Kx0tEdF1JsTQ3Tau01NR058sm5Xj+Ee8jh9fpcwpWoXFtOHwkKw8vkLcdNO6SovK5rp2YYVabeaR0igpXcBFeqwP4SjuTdj10XQG0Lymlx/ddvDMObABDr3udDw5QAazlavE0sJVpEf7z8jo8nnUAvrn2wPtncqL05wq0iHE2Dy2XSuAP63J0WtpgNDzXUuas+6weVVir3Z/WgD9pVMbA97nzPusPH02VAxLP2fdSckiqkVnWmJ6TuxY0YG0q0s7YLqHkJAji6zCdHJm7eLDTtahBxly1P8WhRQF/aoFUk6ERee6Dj/e/MGBvg7tuRxPs=;
	25:n3nxNAlIZaP6IZ8q7OHZPdHN1FssRiCRKpm4iGNCy3ZIX6cXYZeZi8tXi0o02unsF2S8CUpgFX5NMwQkT9OB/H+ohqiJ0zTxtNMCUCL7vsmRwzXv60Z0Qxpf1LVvtLsdK1Ot0U4kaqzCN2F+H8YYIq0H2pku7TM9HuLplwGOWoq2oRTP018l7guwA5bFgcb0r3l4OTjwbIo5taqr+NQqSl138bTxJiF1PwWc71DaUwKEvsYOQQ4RiNnLTMCyN0FW13GS0PPccI8G/W9GK5iLdUlrwNOxnUhrW1HjHB+lOrlrDT9BSRGkbEvY4YL/CypyTfyBeLAcGfgmfydAlED7iv8P7p7fli9zBBXpBd4KISo=
X-MS-TrafficTypeDiagnostic: CY1PR02MB1335:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	31:ftmMd3E2hBR5UAglHu/bwRaZ/+Pks2X6HN9KAZueXYQusCzHNLAdV5mxchbNPijhOvC8X7//cyKu/yNktz9ouxz5rLjAJF03DB4f8YwmJPrkrryOWnhIhrdD9gciLSl1imfgoLluuOYhhq/3ihqkcQ0mw4xo+R33/Qxk8bcXZiL3Y5MozgJKu7ATHN08tB2Q+O6wgN+0U03Bas6GIBytwnTXH+VFuSBL0suZtcMqAJM=;
	20:eg8FGGdaFHkfsCt84eNt3UBTZWNZTKms5yrFK2NLVM6dTzHTD4dUKEqTkQO/rZ+BhomEq2d7NnGnxzUtG2YYFLHwV1DoGhIPlMbXFb9dbO80HrlDPhWZhaoeCHHAiwF0Mogo0QxIHnusesxrsZrVA68XDz/iZmzoQUtivIKPnLG1TUfkupbEEnAflqPcEfOCw0EaHjQvxTYMbJEnBASqeV1EEmH9bckEe9s9fX12trGlvp3Zdo5XNjFiyxWJkC/ZHGeaqR4mt8n9hS1puxjW0H7dlJNaKPshcRS1gr//0SWNEPSeK/uMHnuGNPeGsFReodVAHuQgwrjbTAwohK+vLUrUp6G4S3NnkeHaEXcJ8dHUBEKhCrgssC80ZB2bm1ofDhepkWF8vN/cdLeVAqLsqaDfWQLMkvsn3f4ICauF04hy8MTyoyeNE31sL5aD7cASftNTJObZTO4DlyAFkiDZ3Z2k7CWv17ISOmtAGzp3Av9zgDFd2LwSaEq+dkCtnrG+
X-Microsoft-Antispam-PRVS: <CY1PR02MB133578E1A051D505E4586ECFDC200@CY1PR02MB1335.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93004095)(3231022)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(20161123558100)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR02MB1335; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR02MB1335; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	4:OKO34VibZVqPeKXCqXEXOPY1lpo7p78/NckyvM9Fw3RKXY42+A6wXlyWePvc8ehpx8fcICUEqdf7WTqVv3fQUJ8XAJp53i47Fvm9rryFWQEexVeB9Rsv6JPe6qY0Tje9427CFTdhhH18Mg+t4KcSqqK+ISfYovvSl1HCFj8779fqio5sGFNaGTPXxSQyulz66g3zTb9BSEBjxDVSjmeACSJADZjjoaK9WG9xUdAfWSwZ7M65JVJzWri6H7AoS6PeZ+iv5reAMd1Ps3j/d1sCI5jbRs9FdokW2re5Jsu+LoL289vK8jhfbplSKv2ifvB8
X-Forefront-PRVS: 0499DAF22A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1335;
	23:byHkGv3R3FS+iZV4jCSxVoEizCcjk/sdPobCAk3Bk?=
	=?us-ascii?Q?HC5nO+WHW+6JwGIxzYM7X3kasl6rP2I+EtyAuwrELn04+cEtgB/tak/b5JFk?=
	=?us-ascii?Q?qbYxrBB8lr2tNYMM1k7KO2O1K4KPOFrQcVgr3F8zIk2tACOzCaPhg8lqtC/d?=
	=?us-ascii?Q?9IP6HtBlCK9rR03cZrJAeehwIGExpkUkiBD1sK4YuCXxWtaG5UtQl7VkHcgF?=
	=?us-ascii?Q?1grezkrCvqKl80edKCA7WOc8Z773QpDzOXNZM/APqr3UfyRahjiIQ9VpDqWC?=
	=?us-ascii?Q?hP2M/qN6PDzxxPdnl8uzOCj2TC/TtKKqoMRcNrxbTNyY0rZVW0/kuFIUSZBc?=
	=?us-ascii?Q?cXHXs58+HQnclMTqdNRYlNrbdbWzQaSYP52oUhon8UDSxmFGedNLtPx01Ljd?=
	=?us-ascii?Q?K8IlPbJ51vOm18FfcpIFKaNoRfChiEK1EAvCEO3LaUYQ4c/k93UlR+DDtc/W?=
	=?us-ascii?Q?ix7VqeaGKS4KNwewAXamhuz22XntMKPp+tSgr9GCrMRKHBIGdYtpWPvJOR1i?=
	=?us-ascii?Q?W6Ue8/mTBgxn+2uSBdwtZZ9YsAogCDpc7g4FSSWFhvBPK45JL7g5XoFrK/qw?=
	=?us-ascii?Q?RxR+Ig7S7sIOY6XjgpiYJLwTUuWDJX7TjblOLNegzIFlkfXAsjGyqxUWJFVQ?=
	=?us-ascii?Q?wCaM3wGVMmkXjLpm79fSa4ZggpmcJ0/c81/dGCwY9/F/TGhhCys8BfJdLYRi?=
	=?us-ascii?Q?OWvWwgNJSj74Ze4URKdnsAaCRq/80fVlwMeg9IWSuWR3iA1JKKsvB9b8sIdD?=
	=?us-ascii?Q?IrPiZn3uaKR935Rxh8jVui9caB/cY3scr1/Wn5uUlBYN+MqHyX5QzDQh8eVZ?=
	=?us-ascii?Q?7hBNBthc7VKQ6Mjw7afiJHBincJwk+aiO9gwmuWcwR6QLwVYo7LTbCWNQw38?=
	=?us-ascii?Q?wlfGuyGQMNJ2B72Ux0m7izCFHwla5gY9zQ4Zxm5pMIFtv6oVKJJJiclRZWrM?=
	=?us-ascii?Q?aMo82YNIp+qgco3/5Qh1HW1RAfSwj8OAOUWgsj52K3CHqPCd/4qqvQu45RmX?=
	=?us-ascii?Q?DXgusCWexyNaR57HuTAMvbdUYQkpqpiTusRn7pkxHm4m8uYzVA3XCCAyzDS6?=
	=?us-ascii?Q?jyy8yO97ulFmZ/VqIwf0IjdwYD3OoCMocjNb1EFmGbkBi74mg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1335;
	6:nXtjGv49ID/URDxivOLh4Ubm68u0z6b3tF90UwL5Rwmj1BhQ5zK51Ev9v4fYVil2DnHddPa06bh7gXko0a8K5I/3ls/IyTwm1fcXw7x1Q1qF7u4h55YvZ22vgDxmZd75nsByAO0DmMwdXXSEmCyrWE3ZFuneMn6h8G2/XWeshXx7bbOV/Zm2SCZ2vuqlqTLyQjcH0cd3cgtrnq2zaBlPn5ETbW4NWsfRAbS9k3EY6Y6Uvnel1Hm79WgIBRzV3cDt8N8ds90l5x7aXaVE2x6DSmJyGQJTqIGah7O9AKDnLtJ1VOTGltHG3HBtVGuFRMahhIx0JqapdH7R9piUcu1lnBF7ssfvV8ob/ebR1z5ZVIM=;
	5:7ju5ZV+zNSaf6y3VOxdS0RVUy3PiCoo5QHiWWZuq8Q+UkWvm9mSZewMgJAXENgFCu0hRbgNReR2jzGwdOktHVFb5t7h7Hw3Vn0rcWVfi5mhbwoEer6K2nqCjqaSR/U39ND+YUbC7mte/rrp58Iq3YderQgzrCcP8qDPhLrfg1G0=;
	24:rYisbvW+IgGHOJpB3vefsjrKaeq6BM0otWpeofiF0EjmuF+fORogiZpn8Lzaxf/9NFXLCVuO0//06cXb88qXBSwi+HrCaMPqdefkoBE2DjU=;
	7:GbYoSRmvz+qkgrxCxdMfsINRy9cKSijhDPR98w0Mkj45mCaBoG0t2I0EjRNG9uEa4hK4ROTtFTV7wizyIGogBX9FQ2QDNN+UREzzwGoGMenLg6SR+GbQJk+jlXnjyWNkzgRi2ADAfxBEm3CmsLctPW6VuZ1OLRAAFT8QM1p2zaiWIr6sjEB1ZoU0y+4Yr8gc8rszRFii91cTNuOaX+gQAtEl/KcH03yQmkQNlk8b/wYfO41ugp5M68V3WLT+892p
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2017 00:48:11.3319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3103c1f-31bb-459f-f7c8-08d53142b4e0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1335
Cc: Ben Levinsky <ben.levinsky@xilinx.com>
Subject: [PATCH v3 2/2] runqemu: Allow the user to override the device tree option
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
X-List-Received-Date: Wed, 22 Nov 2017 01:02:29 -0000
Content-Type: text/plain

Update the runqemu script to allow the user to specify a device tree
to boot when calling runqemu.

This involves creating a seperate check_dtb() function incase the user
has specified 'none' for the kernel but still wants a device tree.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Ben Levinsky <ben.levinsky@xilinx.com>
Cc: Ben Levinsky <ben.levinsky@xilinx.com>
---
V3:
 - Fix running without setting DEVICE_TREE

 scripts/runqemu | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 44cf39f7f0..85e7258efd 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -69,6 +69,7 @@ Usage: you can run this script with any valid combination
 of the following environment variables (in any order):
   KERNEL - the kernel image file to use
   ROOTFS - the rootfs image file or nfsroot directory to use
+  DEVICE_TREE - the device tree blob to use
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
@@ -178,6 +179,7 @@ class BaseConfig(object):
         self.env_vars = ('MACHINE',
                         'ROOTFS',
                         'KERNEL',
+                        'DEVICE_TREE',
                         'DEPLOY_DIR_IMAGE',
                         'OE_TMPDIR',
                         'OECORE_NATIVE_SYSROOT',
@@ -579,7 +581,7 @@ class BaseConfig(object):
                 raise RunQemuError("Can't find OVMF firmware: %s" % ovmf)
 
     def check_kernel(self):
-        """Check and set kernel, dtb"""
+        """Check and set kernel"""
         # The vm image doesn't need a kernel
         if self.fstype in self.vmtypes:
             return
@@ -608,8 +610,18 @@ class BaseConfig(object):
         if not os.path.exists(self.kernel):
             raise RunQemuError("KERNEL %s not found" % self.kernel)
 
+    def check_dtb(self):
+        """Check and set dtb"""
+        # Did the user specify a device tree?
+        if self.get('DEVICE_TREE'):
+            self.dtb = self.get('DEVICE_TREE')
+            if not os.path.exists(self.dtb):
+                raise RunQemuError('Specified DTB not found: %s' % self.dtb)
+            return
+
         dtb = self.get('QB_DTB')
         if dtb:
+            deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
             cmd_match = "%s/%s" % (deploy_dir_image, dtb)
             cmd_startswith = "%s/%s*" % (deploy_dir_image, dtb)
             cmd_wild = "%s/*.dtb" % deploy_dir_image
@@ -678,6 +690,7 @@ class BaseConfig(object):
         self.check_rootfs()
         self.check_ovmf()
         self.check_kernel()
+        self.check_dtb()
         self.check_biosdir()
         self.check_mem()
         self.check_tcpserial()
-- 
2.14.1


