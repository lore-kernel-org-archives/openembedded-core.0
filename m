Return-Path: <alistai@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0059.outbound.protection.outlook.com [104.47.42.59])
	by mail.openembedded.org (Postfix) with ESMTP id D93CA78038
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UIZsHxLVXLfCpp0ivXq6mPrtTvjxWF63+wH+WcssMjg=;
	b=bG78pjh5OIuP5EoFEablMpB4cLYU+UFZfZ3FbKFuZMJHvLb2Tgb6sSl9h6MIYY1adyKxPv2nWlMAY53xin+nYP1BZaUPY5zfx/LxEQ7ujt5Cd1o9mJFFsjLUov6ZRvFabCshGg3lDX/hHxPOQLfzLqHL2Amba3ZhDxr/SKh7Opc=
Received: from BY2PR02CA0114.namprd02.prod.outlook.com (10.163.44.168) by
	DM5PR02MB3386.namprd02.prod.outlook.com (10.164.152.162) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Thu, 12 Oct 2017 23:35:58 +0000
Received: from BL2NAM02FT060.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by BY2PR02CA0114.outlook.office365.com
	(2a01:111:e400:5261::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.77.7 via
	Frontend Transport; Thu, 12 Oct 2017 23:35:58 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT060.mail.protection.outlook.com (10.152.76.124) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Thu, 12 Oct 2017 23:35:57 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:40718
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e2n1B-0006rf-85; Thu, 12 Oct 2017 16:35:57 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e2n1B-00041Q-4H; Thu, 12 Oct 2017 16:35:57 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v9CNZsk1007798; Thu, 12 Oct 2017 16:35:54 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e2n18-00041F-As; Thu, 12 Oct 2017 16:35:54 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Oct 2017 16:32:02 -0700
Message-ID: <20171012233202.1281-2-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171012233202.1281-1-alistair.francis@xilinx.com>
References: <20171012233202.1281-1-alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23390.004
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(2980300002)(438002)(199003)(189002)(77096006)(106002)(1076002)(4326008)(63266004)(50226002)(575784001)(6916009)(2906002)(50466002)(106466001)(76176999)(5660300001)(2950100002)(6666003)(50986999)(33646002)(2351001)(36756003)(189998001)(54906003)(9786002)(39060400002)(356003)(5003940100001)(47776003)(16586007)(48376002)(478600001)(8936002)(36386004)(316002)(305945005)(81166006)(81156014)(107886003)(8676002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3386; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT060;
	1:KXMEMfihNMAlHJDx1zwMUiMDYdrV00SKX4Gksgx4+IEHxwBsf9jRBEuwj9KylSIWcKvEzxZ6KB24yP8ix7WXFYVxmH1gFHKB1lX/kMOoa/CBbRCozyK2WJhvgk8lVgsD
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81938342-c605-436e-5c52-08d511c9fd76
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:DM5PR02MB3386; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3386;
	3:7Z7OxMgdLDYn8/9p1hZwVFsuapP2CX4+lwRXeI0vh68kQxCV+o39FedHPeVCITz0POp22zLdg1NgcPYdrhYimvMLM2AsoxT8IZkt6uqVYV3TsBbBQVRyIqe30I3OVKoCqD9OQKCikgcNAeRsgvlKVeEN8vidLdmJaWa6HV9AOPbTVxuvJRriAAshpJLU6twRru2O+yQNoABWsAaGJnI/DYAj0rZ3FjHrsbCO7X4ZW2jXAQlnBLW5FGdmzc6xUQsCrrAElcgQIY9QLHRhrpyYKrjMR7CAzHdQ+Q9qkuJYsTWtTaaraghjeHcPSp3jYtTLGPghqKIgXgfJnJbZ+r5lcdHBdZsQSCPMXbjI3fMA65Q=;
	25:laWs5F28CkJJ+tGqnkEJmrvlkFUBf+0GEzSsRZK9Rg3UHmO7vpCInDvx+AUxhzzOY+l8fG7LB8u9MKgcXvxywts2JKJX3mKuo0XA1uSoW7Lz3o7qb9frdcCXZp7HDKedEnnbiDRBgcCavdBnF8AFaHB/C2hvtNSxfRmQkq/b3NwihRna/Kjc3mjnz+WP/k0E8h9oOMUl7FobqwImnusoVOdn7ICBWYo3qNM2dpV3Rd6X/6PMGbkDXN+D/5csaV0XNEFcM2dc3ZaMYGe/sv8VQ/oTn70okz35QyMTPXcfdLR0IULvVPQxHIdqOq/1bWCheNtBlQkUv7EB7Fm4s5mdbYtEtCljoJfXpw8SJHDVUIc=
X-MS-TrafficTypeDiagnostic: DM5PR02MB3386:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3386;
	31:9pEHvq+tUyHiZz4V+XIAG7tWDqSISlFwEgXBtz8hfL101u1k8lVdEiLVw66aW0PR0oj0vFx9JyakARO7i5gshUhz36uLEPIL1GQXRPAhw4PP+abXCl6AixKiIq/SNi9nV/rrhN1DA8gRAOQp/qCmktFSoFY+/qK72bpYXAte9M0HVR7lE5j8rP4LUtB9imuELTqiLVBJgFndD1sWDGtAA4T6/4LHl/guepzOMX901k0=;
	20:2h+5QRMXMbg5pp6wOeq2m1aVfg4Y1OYlZHA+JeGEPoj++HEO7uXr7IRsU9FT3EW6r5HBjHzfqC5wkLx72Hg2ngJCHTB9vOO1DvedG9Qb5Ca7CRXWDryvNpbp+8YpUXf6BgJFrfYV00dTVUYmi4JA+43ELYtA4rDoUg7rdsG+ybqvG7IXG42HaR7UAXsCw5IsEd62m9HmmsGig6jA/T3kweatSaP53EGjfsKtLJg2b4h1m1oAmTbix2ophsUGL6r8l3PziHJ0JeMs7VZC1KLOt2C5qx1HWw7W8l9tm6mFeQw3pJFvREDLZqyZhKAuuTBq+O2i4Ir2x5JPvD33H/TlEy1suZbgHvegDbemMn+RjWj/+hV+/E/+SzAn0QkO8998DTMyTCIx9Qqyu8iHag8MtE6S7MyJKyjfA+UO/k/pFNjG/W8Wo36BTFJCBxLD1IYbsybC7NMu2xqKeWEO+L3KsbpoQNmwH4lLTU0izgrsE9ArrNR8AojVX9P/MC0Zq+JW
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <DM5PR02MB338648A60F72582922B3E1BADC4B0@DM5PR02MB3386.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(93006095)(93004095)(10201501046)(3002001)(6055026)(6041248)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123560025)(20161123555025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR02MB3386; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR02MB3386; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3386;
	4:Q0wGFu73YDd0w2vJikbVPPrzuUdQMs1zy8Bci5Woo6WbAu5OTvyj8fNUt2J/rqdnSsWRXRNMNLsYxqZUJvmlbmAf1OECO8y2qI1fbpUvLNhvykep3aysVH1szw7BSnA6wtZnKBFjoiW3PtLKkhbRrlzFbVtXFEKnAOCV1cEfSHX2JorKi7PzJZsFQefFftwKGBX4HliGojiErhk1L+HcBSUv6iIYQLQXrsTHjITQStRVYSU+vSk9ASdq1QeTPyZvsXRm7hXjB2iVqOnu4Sff3tm6w7eC1g9nytEGDbmkU/w=
X-Forefront-PRVS: 04583CED1A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB3386;
	23:EnGvMf6fgGKyoHILcLeJ2j0xaOFnzmMacG9G4yxsi?=
	=?us-ascii?Q?PQtchSaenbRV2anhMFSjeKSn+mz11q1CaWDX7oXZmegRDktuUDwTPPfKMOpI?=
	=?us-ascii?Q?ye7C1MOHcxdW+ZMQzM6HTM+XMEDZoiW6hQoHraTKs2eRkvXps1B2ccTnb/wv?=
	=?us-ascii?Q?eDx2eAX+62KbPoNtdpEgn/q/Ia25iSAg78CevJJUrtwbSPyqrZzu3iWIWGhP?=
	=?us-ascii?Q?joABi7Ni9+Hbt3G86r6qh3TyVYX7kxSCNpzbD9Ajem3UIeqNeIDqIZp9jltq?=
	=?us-ascii?Q?gpT++XtdfiPOr4Uhz81KLlf353gz6Kq6Mdwg1v43NpwLScUxa1UnCRoYmoEb?=
	=?us-ascii?Q?FfhWIz0K0WYRhLJzrBJEWSKq+NWx00xeDIPBf/vAffaxcQ1K5k4Ljb1gD6cq?=
	=?us-ascii?Q?8jF5Ejlrqpjiy2z+mu3tKt3LNhzm4UwLpe8l3wm+W1mJtvIPVvY5vLeKVU0q?=
	=?us-ascii?Q?aFvJuXgnBU0W7RVWJ5uTBu6fAe1kCcdVootKYQGD6SXnguyx2iOPq81+a9Jj?=
	=?us-ascii?Q?VJYR9GRXgcl3h02hfWUge8agPn8qLSX+aI/Xmm2pJNMJbqNsdFv7VUBxoxj3?=
	=?us-ascii?Q?u/O4j4RhnxgsebcFVyWzv0x7rzKn/wU7OEzR0elNljIuboeulw9PjqxEMqV3?=
	=?us-ascii?Q?eH8JjK8oVtLnlVEhYqYa0AD5Vs4PRwQ/MqrWSBZVQrcUzxNA8StOX9cofJFN?=
	=?us-ascii?Q?AJLV44GpPrx7cdrcmOMIfuPSB2IGsbV3MLxK/uZNx+Pyf9LxsI8q7DGXWmHW?=
	=?us-ascii?Q?LzxOJ3cb22FbxWT0iVe4FxDJcOyiEOFo8xC8eG5qJzmi4MU/jkC2VlDzY32P?=
	=?us-ascii?Q?HU7GdDak84+4S+H6o4E8RvR1zb6CBgOtFMqkgqV1fIQvtdEZHgEfTmV8WxXe?=
	=?us-ascii?Q?S0RSwxbL1A8FckR49n+2sd9Bxe2ZWOiTuMGA8Jy/kzZwbcu3JYCwVe9GC+oq?=
	=?us-ascii?Q?5OxnawWhSxzKc/eA6RyYd/zElFOlu9pAfyCVCuEU/H5BlSUvpgqT+lJ657Y8?=
	=?us-ascii?Q?HktJqLqBjjCy2mR8r3VRDyPnFdl12NGcDbS5F5GbQNfyjn7YDPm/326EgauL?=
	=?us-ascii?Q?44oCP0NwxXBZh5qYNE4RcFB+M7FNM06o4G09VEV/EeTBFRn8HrVEtsfBXVB2?=
	=?us-ascii?Q?Gclu2jlSyA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3386;
	6:7BjceM1SwHdTdvKbIFHTDoLSBw/M3PldcKxKjaACQn+jxXeQ8pGJiYfJUViTg30dWJ2JxY9fihutVXspRNuhW4qzNNoAw+Yb/gl1QhX8FAbsqxHAgdCtsYjO/rkKxJXB9pDhrxbKGOoPEgPQSbxOSRjKm76UFPKC8ghZOOyjiWuSEeOM1ZsQqlTsaYXZVl1Ac7Nnh+ABlo/n8ttWD9QP+DGvP3D0UIpXe+FaH5dp4Hq3acACvAvMmSj7zSpvn/N798HcxhCDBvc7ZhgMo3BwvdfwnDh4wisfLwkgblWBaeJmbN5omUyYW1se6MkrqW6/oRWI/q8rB+k0M+1TzVbwoA==;
	5:5/S/5VsLfMl2U/g/BwzxCS9azQvdOOAJjZaR01JFx6CIsY1QDk3EwG5ORx0Xjxup0i556ppS21DL33PkcmOIYT65Iw6iQiLMRrvg83SqJkVc3ogWYxaElMoWYgDYQIKRMLBUsMKU1c+Y2Dl21QOOGEuV9enqHFEZU+WxZ9yqw2s=;
	24:MkFJzAc99SSTYkEGQwZXP2IIqCUEFFuzMcAF78vnomuzKcn2pWfbzD5QUMEWr1BBK8xnN0uw9XYp/0ecL7dwb8sgalDUlh9E7WeOc5hr8cQ=;
	7:210ZaDPb0nK2UFzI9k1JH4222vKUb+oYMa1Mi0wZC0xyQbMFN0aT/Fm8PU3wDRmZUpZV+OLGthjoTOY/4lF8FNLcb4DL7/AKvdWR/32VhwBRzAZ8OTjtzJI6oyGkMzWB31Gain5A+NNCbaEDibpayil+O/e+pENZaIIrhhxLNPQ8ZgX+NwTYgjlzzvQxcq7Xh9CeUqxiVznXUiTsenHlvZLEtcj0y927jsf47nhxdEs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2017 23:35:57.9409 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3386
Cc: ben.levinsky@xilinx.com
Subject: [PATCH v2 2/2] runqemu: Allow the user to override the device tree option
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
X-List-Received-Date: Thu, 12 Oct 2017 23:35:59 -0000
Content-Type: text/plain

Update the runqemu script to allow the user to specify a device tree
to boot when calling runqemu.

This involves creating a seperate check_dtb() function incase the user
has specified 'none' for the kernel but still wants a device tree.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Ben Levinsky <ben.levinsky@xilinx.com>
Cc: Ben Levinsky <ben.levinsky@xilinx.com>
---
 scripts/runqemu | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c3719a86f7..1be6db0eea 100755
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
@@ -608,6 +610,15 @@ class BaseConfig(object):
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
             cmd_match = "%s/%s" % (deploy_dir_image, dtb)
@@ -678,6 +689,7 @@ class BaseConfig(object):
         self.check_rootfs()
         self.check_ovmf()
         self.check_kernel()
+        self.check_dtb()
         self.check_biosdir()
         self.check_mem()
         self.check_tcpserial()
-- 
2.11.0


