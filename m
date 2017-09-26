Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 87472 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Sep 2017 23:18:56 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0046.outbound.protection.outlook.com [104.47.42.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3565F71AC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 23:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=g0ui8tmqxfH73tSJRo1z2/rC/Vd0s6NFjSNAcjAGzHk=;
	b=FQLHPQIi8EV7J9p7/gHtvpBI4MtpNgt0oF/DPJ7fiwpHbo3r1BxrFc/2/wh/rcPexZPKruyo9hG93RlLwhEXKqpUNqe5kd7jQacDZZFnLNNDq8wQRg/ObAZ5brBcUwcPBHQS2Kb5S2PZKF1aOAZNzWIm5Bfa8lGWpFufHOEAv1w=
Received: from MWHPR0201CA0094.namprd02.prod.outlook.com (10.167.161.35) by
	CY1PR02MB1135.namprd02.prod.outlook.com (10.163.15.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 26 Sep 2017 23:18:56 +0000
Received: from CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by MWHPR0201CA0094.outlook.office365.com
	(2603:10b6:301:75::35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11 via
	Frontend Transport; Tue, 26 Sep 2017 23:18:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT006.mail.protection.outlook.com (10.152.74.104) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.56.11
	via Frontend Transport; Tue, 26 Sep 2017 23:18:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwz7v-0003w6-7w; Tue, 26 Sep 2017 16:18:55 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwz7v-0000Cs-4I; Tue, 26 Sep 2017 16:18:55 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8QNIqxd005590; Tue, 26 Sep 2017 16:18:52 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwz7s-0000Ch-NN; Tue, 26 Sep 2017 16:18:52 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Sep 2017 16:15:06 -0700
Message-ID: <20170926231506.13672-2-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170926231506.13672-1-alistair.francis@xilinx.com>
References: <20170926231506.13672-1-alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23352.004
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(199003)(189002)(76176999)(2351001)(2950100002)(106466001)(6666003)(6916009)(316002)(16586007)(33646002)(478600001)(5003940100001)(50986999)(36386004)(4326008)(81156014)(8676002)(5660300001)(54906003)(63266004)(77096006)(47776003)(8936002)(189998001)(2906002)(1076002)(36756003)(9786002)(50466002)(48376002)(39060400002)(305945005)(356003)(81166006)(107886003)(50226002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1135; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT006;
	1:HFM9Gd/1E/LpKZxVl2XK+rPRySiU7fnqiH98CExVgSYCOgc+ThL1Q7AHN2vEnYbAFYRcRKcNwvOx24mUg13XkIRTnxVVgx5ST6xMA2nIs+E6aIUK/m3ukB+7oP0MU3+v
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4d92ef5-1322-452d-031b-08d50534f5aa
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:CY1PR02MB1135; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	3:2MgR0uE+Uoe3MmgyiWP+Abrthz/93a8T2p9W4ehPUwjnLpIlJfZjZ7BAf06CQKB9qAXG7GrJdHKo5n+iPrpANKgrQIswYyUwTWkLh/cOGBUVGo0HupaCa+MvWMuryRJFt9McZyMUkDoMYg6ZZBGNp5zjkBssbKS82tnQ1UwEzSCg1KYARGYrdmSoqfjJexoidHxqqUPdnufxxvgg42v0VOEBGGkR71jyyIK0qb34ilDHzW/KTR+rEK9w8pAHmqksgmh79C1qYZI/S6W7S4uqmwE0M70nfooZ0Axl30WUr1hJFsiV3N4cEwDBDwowTcAT+bPy6Pz/Kob0lGlH+x3kj+wOqFnZRHr1RlICdMRP2fg=;
	25:BHl/SUFv2g6vb/1iE1vZj40JF0FnT798VWUWhltsfKNjaACnBveVs2//0giRs4JktAe8fGe6RM8LA/ViShmtXK4pJNl4qbz6vObwZkKKTBvRMQfWOdNMd4fNidgrjxWo91CJrmXpElTpw5MkSvdMFj6ki38rI7w2Qp9vN+cA47k3rVzIH/aGKKPzKyP5KXCg+ALN+XeqH8RubY7AWfqUZFdvBxQ6D6qZ3FFDoI7Y+C1NcSGF42hl4gzsMIckqduHNn3UOMvZihwXLGF8kPbvPfLLLMorT3jwvAgO+1U9ljYNi1yHX8rpEaY7UoRSszO6jAh34KbVnZgRX2S21y1/sQ==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1135:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	31:G9V8oldeBxkqSG1JiPePP1n5D1L59s05/udniKzR5kwbOJhFN+32TOwLUcJBLhr0Gddyv+WWi/IMgU94k072CYGfb1OfQKfxHFc43ooW3ztdgloWuzlhQYnhHHVxJ9I7LiH76NQXC3no1TZwVsZItWveDBTnkO/x7X/g1p0++JGvt2tXwiamUY8qkcGJeyNCeBHNgkyqe3H38zBZLora6bBQGq1KWUJ+b2Wtgpza3HA=;
	20:+yn35Off64vhZ8NJoNHJCkFhC19rvHP33qd7WqWU5JLBKemk56yeQSvpD+w0RhIY8bxXZGj3c1v8B6ML5rsKWsEiazYWXwLlhDFVAtb64wmEQAqThUvRYrUBOXf8W1I9xxCBHX20XbE9hdZHD94WgXH6gV0V0WRzP0QsXxFbYlhE1M57lftMFJk/t5cG8h4lnXqJqbVJwV9NLsCdEHMGRHmdxT/gHYSRBha/l4dpQUCJbKqo+kkEuQ+z5gPEiovnIug8ASZT7L6CvfMloqZZkZLeHsgvgyHR5F5FmptX1QER3i4inCf+e3qpoe2zjC4AdjmfQguTl3CQN8rZnocc/S+pDK1BOSF9iAQz2c5iAbjVDQazXDRN7SUrU1AxjYSbOOo6/F4+/tlE+QY3oZkf6l+ihf3u1k+KVMtUPom0aUsoF5RUekBr8Rds4q5imHZrpXrVUpyLAe8eqI6P36063On4Pniz7SH24AoFmYQD4ZoVXBFSDQ6Y7c8AYB3unvnb
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY1PR02MB113593FC67CB4CCF89E34F09DC7B0@CY1PR02MB1135.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR02MB1135; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR02MB1135; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	4:2K+OKt5mxq3gwWNYZKqZntH6ItoslL8j6QZTTssLSYDKYxbvlsesYAG7dB+nmsiJqhSigmbWaTnJGlnjNN7cBVb8mKle+lMkk459v/L2kOJAa4SsIcP/ydf0WHww/A0O9N2LbazVKD6VSRobwYy/g0NY9KBVo3UrduJX0YKI/BvvzwwaD1QeUZGrRBWtuk5ntB3lMnE55MjJO5JWXgq0/CnH5qXgpWsKTH/Qi2xkwbKK/yn+3ZTaRhdzGdy0IHWtjnM2b0HypYjtjB6MPyagcVtH67wNirOJFytoJMwnXIU=
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1135;
	23:L6jBd9KhfLmCUceeKtA6q3Fu8ToASrLIEsuNXcwKt?=
	=?us-ascii?Q?S5BELPbYk7193m27gmQOOaMOtauuFoRhCGFAmpgPvrTndj1FWNVPThulvghM?=
	=?us-ascii?Q?rJypALimDbfu+n862EleaH7vTF5j3GkXuEPU0XSilGLupQaP6uKubG4HVMSX?=
	=?us-ascii?Q?CdQuHgJK18PepDO4oALQ+IdGpsR6EReGnDwqXLQlfJGhrklhFzUKz88PxJ8C?=
	=?us-ascii?Q?Q/4iovfeh/eS/IEI/2IFr6HuAvWzKV33/y9XplnLI2lB6ekncI3kDLvVNqQF?=
	=?us-ascii?Q?7s4eRI12TWFWfXiTPmQe2BArFNAS+cqO/MITiGnnXLze2oVCJJBTyVZoxOfQ?=
	=?us-ascii?Q?Rryw7tCecbQqeZqE4vI3Ez1aYV9o+cnOS4dHzS7BFuDQ6h8m+ywftAtRUBwz?=
	=?us-ascii?Q?kqSst3dvKj1uuqrIUstwLVlYJKEx7ISVbB2uzXg3oV6qQubz0wp0QwlheQo1?=
	=?us-ascii?Q?LEJLDVSy6dL+5rENSQ8itveGXBB2oVgn8y7Ia0f4Bwt8HyA1FvaLKthucpcE?=
	=?us-ascii?Q?U5XPq2E8/xDRylH9+W4UOyTV5fMBU/jtxdtzeX8kFVnF6S/g3JzIju/XEJvm?=
	=?us-ascii?Q?gh/np/JgDZeUtQNavzUMXpAQYwXPPOu2lHuVlLvEReL24SQCmPFvRjF1+YZo?=
	=?us-ascii?Q?3tCSmW8SbxKWMnzDYrOxVvCbDaQ3cygNlWJJg98e9NqPR9QTqfeIt8HcZ+Sw?=
	=?us-ascii?Q?gtqjmmy2rTF6UdJ0H0+01KDVAuncPw6GFD9Vjdgk9MCGGG6EkhJBY7Fn33sV?=
	=?us-ascii?Q?CmtMRz6cvKrHMnaqJOR1RS+uf96tn5NlNVQ/hflx8QHaefEVGo7JEqnV3knO?=
	=?us-ascii?Q?Lgfa8CPLwl1P5WbpS/C5NNF9z6IIqdeCKG7z+NR2rVe623sdcPqyoA7e2l8X?=
	=?us-ascii?Q?q59m8rLpUpb9RnWB6R1B52DZorVWp4ElwWHeXjdrrReQUIxTvt7QVWyjmBod?=
	=?us-ascii?Q?mBoxZmof5FlQ3cy2zy/1LnJNMq5ReRiox4/Lf20KH0z5GoI4/ZCj/ALe6yqX?=
	=?us-ascii?Q?Rrv0SPNI6k3mlZZYWEsTJS9D/oxx7P8CBpZ2/+PeFvMf9jxZ2qrCN+dHPMzD?=
	=?us-ascii?Q?MsplBI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1135;
	6:sPlY5yd2NIeJjkdI7efSc0K8GVsneg9utWaSnQgwq+fZx1N/F8DCWPP6/i/4DlNm/h4NLSl28x2zbd7R/zDxmoCK6qyedjf7JSG9LyzX7A3zplOm0t59HQQZZEvrxLU4o+rDzghBcYOi4MpDHYppPa6lbgShzCoqx86MX9SMITiJ4se55AWTQ4fYz6w60M4vGGhbA1pXuGfCTCJ/HjpYJ3wfQzTGrLaHstYHDnuMXLBtp5jTgteCsMjh0wyoVf0eeLGv/RWELibMp8Ccb3aIsF6u6Cbg7xRGixcbhj4R3R1a1UHG5spSgnVSiq0ajitldZXuLRBB4gRx9dhJwHOnpQ==;
	5:cifh06pmfL/Ud1Nu3HQv2XG/xbUp5uH5rmCtaLu9BrXEbe6OcW9Q4RAgN/qtfsrjdcyWbxpjRDRAhednzv4rluSd0AjrlU6UaCt+WdkhpF6s/NZtjVjJDTnH1SNOY5L3+uOJejx7DxAHuhbV8UPiRA==;
	24:QX6KzfkXniahOHoW0TMqtf0mtexP7GJ56ikqq4uroxDl0yULJA3L8d2N1uGAHT7TcN3E2O4SY1NyLOL0FAi7tDo9jnv/FCF443GAjfitcG0=;
	7:qPnYTUpxS3/fCKYQEhoE5c7KeiK+ymiSxL828FQNJLlgrKZGBpwhbRhZuDbK2m/1CKs8TjfSOrF7iFscuklFRARTnamv5xQ7OjQVHFSklH6KFt96H7yEclQrqJcrodCHP0GbLqEqzrg8GfE0yCCobUVbyeAbGKrA1hG/0tB/ZLUe2lr8AteekoxoC8YmKq9QLUyi9pgm9QoRGnTeGRy8mH4QDBWGoPwZ7CI0NVqN+UQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2017 23:18:55.8916 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1135
Cc: Ben Levinsky <ben.levinsky@xilinx.com>
Subject: [PATCH 2/2] runqemu: Allow the user to override the device tree option
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
X-List-Received-Date: Tue, 26 Sep 2017 23:18:57 -0000
Content-Type: text/plain

Update the runqemu script to allow the user to specify a device tree
to boot when calling runqemu.

This involves creating a seperate check_dtb() function incase the user
has specified 'none' for the kernel but still wants a device tree.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Ben Levinsky <ben.levinsky@xilinx.com>
---
 scripts/runqemu | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c3719a86f7..45722a18ef 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -178,6 +178,7 @@ class BaseConfig(object):
         self.env_vars = ('MACHINE',
                         'ROOTFS',
                         'KERNEL',
+                        'DEVICE_TREE',
                         'DEPLOY_DIR_IMAGE',
                         'OE_TMPDIR',
                         'OECORE_NATIVE_SYSROOT',
@@ -579,7 +580,7 @@ class BaseConfig(object):
                 raise RunQemuError("Can't find OVMF firmware: %s" % ovmf)
 
     def check_kernel(self):
-        """Check and set kernel, dtb"""
+        """Check and set kernel"""
         # The vm image doesn't need a kernel
         if self.fstype in self.vmtypes:
             return
@@ -608,6 +609,15 @@ class BaseConfig(object):
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
@@ -678,6 +688,7 @@ class BaseConfig(object):
         self.check_rootfs()
         self.check_ovmf()
         self.check_kernel()
+        self.check_dtb()
         self.check_biosdir()
         self.check_mem()
         self.check_tcpserial()
-- 
2.11.0


