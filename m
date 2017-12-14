Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0084.outbound.protection.outlook.com [104.47.40.84])
	by mail.openembedded.org (Postfix) with ESMTP id 2C58C78871
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 02:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=uHEAHr3hg1n9PdX4lDoVq6YOEQBHRk0NTnp+RJ/45Yw=;
	b=aQXF7XKnYkrpwt9PxXc7uQsNPKg49J/rMZmppcI9nuQTgYOl6/nt8yfcCWAK7zHwwEeTQcLHfMG8oP/gbExZ0X6NRMAHWE3hz4/HJCFBbJ5jCCPTUpuWM4FVrT7AX7eIhRo33LfSXKqE4QVtr5cjOoAWD+5S44ZK+0hLUOLNRq0=
Received: from SN4PR0201CA0057.namprd02.prod.outlook.com (10.171.31.147) by
	BN6PR02MB3265.namprd02.prod.outlook.com (10.161.152.39) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.9; Thu, 14 Dec 2017 02:23:56 +0000
Received: from SN1NAM02FT049.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::208) by SN4PR0201CA0057.outlook.office365.com
	(2603:10b6:803:20::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.302.9 via
	Frontend Transport; Thu, 14 Dec 2017 02:23:55 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT049.mail.protection.outlook.com (10.152.72.166) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Thu, 14 Dec 2017 02:23:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:48186
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePJBi-0003y6-Rg for openembedded-core@lists.openembedded.org;
	Wed, 13 Dec 2017 18:23:54 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePJBi-0005Qm-Pa for openembedded-core@lists.openembedded.org;
	Wed, 13 Dec 2017 18:23:54 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBE2NrWb018226; Wed, 13 Dec 2017 18:23:53 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1ePJBh-0005QW-KI; Wed, 13 Dec 2017 18:23:53 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Dec 2017 18:23:51 -0800
Message-ID: <1513218231-12626-3-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513218231-12626-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1513218231-12626-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23526.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(396003)(346002)(39860400002)(2980300002)(438002)(189003)(199004)(2906002)(50466002)(8936002)(16586007)(7696005)(63266004)(2950100002)(6916009)(8676002)(81156014)(81166006)(50226002)(478600001)(47776003)(9786002)(72206003)(76176011)(51416003)(106002)(48376002)(316002)(356003)(36386004)(106466001)(2351001)(107886003)(305945005)(5660300001)(36756003)(4326008)(77096006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3265; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT049;
	1:5GL68OF2Rx02OCVCFEbG4miQWqdBbBEi6USiMpdhzqmd0m7ljd8Ews+t9OiW5FKCFN44YP0L2uOfzoXIbQLdid5AVvNKqwVdF8QWEXVrVbY/xhsQXguJvPoGpl4A6EXU
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfb16deb-f19a-49e3-e9bd-08d54299b9a5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307);
	SRVR:BN6PR02MB3265; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3265;
	3:gLQMVSN5HXmano6wmiVN2x7i2ExdN9zyQJMReH3SWky3VXlZlVldRlHKI3KUdBHW4U8FUhMFITnQZcgHgMjzv5/LfjGRSgKeibvKPcSEZIU+fIgb1EYVYC8H+w1ijtizQcG8+8BzruGbeUOzZR0xxBEcuEJBdVpzETdOW2aQeqJbswsD0xqopddTy63u99aGxxH+dtVJvxnkG9PmQNp9Kv+ZBb0zcvbQkGhbxcCFebBkB4MqJM36wv3V7W00sGWFHK9XOzBc1Mjf/7aucmhgqRFk03yFcAgYej4si/M+kLkKwUhbtPYvhzcyyQWGyj4ItMXrR45hJEWH7Ey6s26rjoDVimkzsxg8yPuvIRMQqzc=;
	25:VyzYNbLCGJxr+Rq1+AZlfGFwLXviUSvkOnzrgfTuJbiCL0HQ5DhEBHLgchAYSUIjc18oyldpP+1h5PXive9MmwZiTYgwd6XFHLnFr85/VeIuKFo03FlMTS/sJdrzbV707JWqHmqRSNI/XN3uK7NNPJG9bT2jzg8QnEqxk3t/G/n8h3QMkyZtnnVVEuAFhjtm1Txh0BI56koOw2Hu0bquDmqUpodjZr1waHND1wrDJEt4b94385btztJFvzE5U9vJarq9vnoG+3eC86uituS4d8Atjnszf/5xjf7INpsgnKhh/akk9dxT043Ni1Ciu1bLhSQ1awZE9AoO7LfhMAcPSQ==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3265:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3265;
	31:Ibgz56mIwzkIv31Tu2dyPHhW1af766WsnrOWkh7/5G4NqrTCTqhEWir+zYymYZDXPxr5jGuVoCiRk2wtWGnmDr7t8Ls4tmGPHAH9li5qpubiWTZqKutUTPod+YnbNcuF0R4gFNC1BaMLgjMkJ9py+Wxiw2pWr0c6vNzqWrUCWFpvAlwQkpvX0lY537iBvl9YLCw3li5Fak1Jd77t6it03fgzJwpskOFgL8R4edONg4A=;
	20:vEn0ag0/O8Gb3kEs1r3i8xT64em+7BKDFngEa2XIob4xT7CDSktiP4E9pSrCjwRFaqdK+kM32+ngFMRGa/jF9T/Ghqb3x3L5mo9CUvoZ6pvoyneQYdjZxOA43PAAJYeY7dwn9RrwvZJwnwBg6W5krwERlfeqSAZ+L/dLHFzHh2mCTat/aa3r1CGyGu/cQ8kphDEz7qCnEx4FMY7PNMlaNDCeXTbAa5sgE5gQZa0XMtbHMcsoAFW8bW7EHUQlpshy9eIjEreBB6BUwSkU3BJHoKuzEC7P8cVt+UqEJKqZkXdOL5LQ/An63Q0cojCYYxpAdpoUg5MUBWlmf0kP5btD3gUYe4UwdqjVXlicJOmx/OAlYZEf+6VGopGFkFYcTpHAPVr6gjVzjCaGkaOJw9ybSHZNLUFs4H8Jb7cvwpE4JAUgOY5Jki9RBlO8UXJeuR5dh+JbgFzJHF4gUnLm7ayqjD2Pvg5UzFXo0HKifdPquvuvQ/Rgf0BZvVTWT9dl4tFP
X-Microsoft-Antispam-PRVS: <BN6PR02MB32653B8263190CFACA5889AFB90A0@BN6PR02MB3265.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(3231023)(93006095)(93004095)(10201501046)(3002001)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(20161123562025)(20161123555025)(20161123564025)(6072148)(201708071742011);
	SRVR:BN6PR02MB3265; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR02MB3265; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3265;
	4:oMZs+nZDtgY9BI0c9KKEIrLyYwvty5VlK2t58mGQb/agMxciE6Ah/I84e8P/JNlFUBlgCQQ2Dr/izqD5UzrpsE9XBv5alt6k6rSeDi+fCDjf6RCpEEBAA7S3M3sBzaBGxESnWgDwZcYXRCF9X6UpdsE9dOYqavpBbbMJi6wSTdz3CSEUqR3gkJxKZhfwpAOswpGoaeA5rpzbHG5RbPhs/r+KjLwqrG++nSG0jD3IPUwdDSJHC02b4UflkL92Csf8gVtxAzbJBjV5S/CqT+2vXuQPIPIPUmSdLQmVi5+mN5l2WLq6m6j2D5byktjYEqwT
X-Forefront-PRVS: 05214FD68E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3265;
	23:FgSiIrDaRqtWE8CwhDpAse6n0Q8IrBgzJIMG4lOHM?=
	=?us-ascii?Q?TF42FuGgvt4ioJTrDm20OtCGJrEMUir7tLufvDTvQtvAf0UV2DfzPh5yh6fx?=
	=?us-ascii?Q?BmofJ1hBOWiHPuvu8shvAGxyZYlqbAWazRfDfncmnkOncYkf14hGCALa2MQa?=
	=?us-ascii?Q?q+lsvoLkcWZtOC8lb7fXsf4xNujjE4WLAJCVpga0tr/qQeAHU0dy+87N97Co?=
	=?us-ascii?Q?pKsk1+aqqV5RGBNBHPSzErImLiPXLGvWIF0vTjoMbBhAqhWOwDDQa1oJDu/U?=
	=?us-ascii?Q?la0drE8Mhbew8wH+HW5exjnWksW+XcCIBkL7pHkZvxmR9f+AeQ6uH3M0p8PZ?=
	=?us-ascii?Q?JsEry/ii2F1YEJ+hoHY7YtP8700Y1v8x77bPPsR7AfNLgEZBOh/rbTOfThv/?=
	=?us-ascii?Q?kVtTztmcYjsZRfLOjIVsSH7XDFJG3TDVowWTEVfHqNjYVI3l51FPQKH6Ir54?=
	=?us-ascii?Q?fIWBNt0kRdU+n5hPE7XxXxioCftGnE71PMIUse9NYioEZa4Uud/7Kl7mETXc?=
	=?us-ascii?Q?pAW05uqhDog5Mp54PNV87lVCCSuAs9KvMdo2PFKHOxoSWRpxYzuuPSUrT4Ut?=
	=?us-ascii?Q?ONES5GhUa+IzPzbSReuB7rSbSthP8sYjzxTCRG+IPMh3g4pAvNHIXLaUna8M?=
	=?us-ascii?Q?oI4oFogcAB5J5kifszbiKohwTxHHSJZ8ynQV8h6ZFDJGTPTDYCdm/1rs6fHx?=
	=?us-ascii?Q?C/EmjDYcTqui71bABg1n3a7ymDyHKTcJPSQmnbU0KLuXcYkWEkpqpkR7zj7H?=
	=?us-ascii?Q?KF1wbRI4uyUc/jWzhagDGvkTLUDl/7olxkEejz5JNo6yPfRoaPSWsUmUs9cf?=
	=?us-ascii?Q?YYgv0kaH/H/gYJG4yrHVm2H7LU/eyWHBj5i2ToDTDsaRy8iUXJSqPIJ8j6Dz?=
	=?us-ascii?Q?3kLSM+O9XMw8B1UNoa70UTH10niaG/YRRcrvpZKnREgkC7TWB7gAtw+RnS9k?=
	=?us-ascii?Q?IPA/3fG7Y5TrIKnANjJFgwRQrxUW6F3L9N3BnYSKQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3265;
	6:ZI3f4IhW2WCr1LzhqR7BjelSEM0p7qZiEUDCARhQZNmjHGNOS7cgL1kERF/8ILW91kAriqXNR3RAUeF0Jn4Goqb3aYInbDMmRYu94bLFoaVX2ibBnvpQdVfy/PdjQ+9Vx0Ee4YKtK+YoNYGBXkUscX5jPC1TA3nz5/9T1mpy429rvj4BbjEwRR/t5ObxLjEWKiuULiVzH7pYi7ZCcWr09ZkIgKD0Py2AAcxFhuFfMPa+s0pae9r1wIJ6Z6+ka3P2KkgSsZxvt8JFBQ+Jmtc0rmRlzQNvpUcBmQ67wCR0GUy8prJAxwaPTm9OI6q0/8pdZK4vkLh6t7H0t5f2NdsnShfuO4RRsmZVUCGUWbBCM3c=;
	5:NxJDfzXw2U1XQQcMkFwoQ0u/f3w4A4ZwujrIoVr5DhQBtzEjFm2b0S5OZhHeYmYsnO8SaPMe7YF0RRYlnPtIFgzDDQMJbiDvPa0tQKhC46FiRTqMlWmIGHBCmGFWvK7zgBuNqyjrxZtGLaeFI+QgFzEn53KEWb9q8IriPBPio+Q=;
	24:mvJSl67AuFXLGG8+qTFOYyS/u7e8hROm1KU0RkXREGNsbr+VNMeSu+2/MNs1X4+PfccZ1fNh+lEoNjt8qruOoHrp9JmKz8KZmuyBCWxZisM=;
	7:eVJCk+CekhqqIVs3XFYjtykRYFRpDXizcpR0MN6Cnql/v884oiPYu6GgW/5i9ux/96a+pq7553w79ZukwcT+ESKzBOkUBOK6QVkVs1/pc5aiykA47cog6x9CuOLFW/3Upi2lYunn3b9L5QcDFZMXspGPmq7IQpJ1kP5pNBPC/4JteBDbDgif+nJ6iG6wLzcxKmgZlKrZEumhbpSXLUhvaaawr09YiD3yAx5jl+ZmHWGNAl7o0g+0fzACJcRZmltG
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2017 02:23:55.3630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb16deb-f19a-49e3-e9bd-08d54299b9a5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3265
Subject: [PATCH 2/2] kernel.bbclass: Fix fitimage deploy errors
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
X-List-Received-Date: Thu, 14 Dec 2017 02:38:10 -0000
Content-Type: text/plain

When deploying fitImage with initramfs bundle deploy fails with
following error

| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_deploy
| install: cannot stat 'arch/arm64/boot/fitImage': No such file or
directory

Skip using the do_deploy for fitimage in kernel.bbclass, this is handled
by kernel-fitimage.bbclass

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/kernel.bbclass | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4240752..757bc73 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -630,8 +630,10 @@ MODULE_TARBALL_DEPLOY ?= "1"
 
 kernel_do_deploy() {
 	for type in ${KERNEL_IMAGETYPES} ; do
-		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${DEPLOYDIR}/${base_name}.bin
+		if [ "$type" != "fitImage" ] ; then
+			base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${DEPLOYDIR}/${base_name}.bin
+		fi
 	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
@@ -640,10 +642,12 @@ kernel_do_deploy() {
 	fi
 
 	for type in ${KERNEL_IMAGETYPES} ; do
-		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
-		symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
-		ln -sf ${base_name}.bin ${DEPLOYDIR}/${symlink_name}.bin
-		ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
+		if [ "$type" != "fitImage" ] ; then
+			base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
+			symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
+			ln -sf ${base_name}.bin ${DEPLOYDIR}/${symlink_name}.bin
+			ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
+		fi
 	done
 
 	cd ${B}
-- 
2.7.4


