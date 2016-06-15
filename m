Return-Path: <alistair.francis@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0068.outbound.protection.outlook.com
	[104.47.37.68])
	by mail.openembedded.org (Postfix) with ESMTP id 177D665CB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 20:43:36 +0000 (UTC)
Received: from CY1NAM02FT015.eop-nam02.prod.protection.outlook.com
	(10.152.74.56) by CY1NAM02HT064.eop-nam02.prod.protection.outlook.com
	(10.152.75.76) with Microsoft SMTP Server (TLS) id 15.1.517.7;
	Wed, 15 Jun 2016 20:43:36 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none; nathanrossi.com;
	dmarc=none action=none header.from=xilinx.com; 
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT015.mail.protection.outlook.com (10.152.75.146) with
	Microsoft SMTP Server (TLS) id 15.1.517.7 via Frontend Transport;
	Wed, 15 Jun 2016 20:43:36 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:39872
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bDHex-00034z-GS; Wed, 15 Jun 2016 13:43:35 -0700
Received: from [127.0.0.1] (port=48713 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bDHex-0004HQ-Cl; Wed, 15 Jun 2016 13:43:35 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u5FKb6WY015434; Wed, 15 Jun 2016 13:37:06 -0700
Received: from [172.19.74.182] (port=42612 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bDHew-0004HN-JF; Wed, 15 Jun 2016 13:43:34 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 15 Jun 2016 13:43:23 -0700
Message-ID: <1466023403-1976-1-git-send-email-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22392.005
X-TM-AS-Result: No--5.915-7.0-31-10
X-imss-scan-details: No--5.915-7.0-31-10
X-TMASE-MatchedRID: yvDAzrttxFXnC5LyYJwD34SvKOGqLLPKe7tp/FN02HXuc7XfuTYENizy
	bVqWyY2NztUjazButmH8rcEheM6HGxwYhqcijEJpxZQoGMRGhhNflOpBqBHTt0uCjz4ggdtwhN/
	FHIaRE87SCt9R+gwKWoAy6p60ZV62fJ5/bZ6npdg7AFczfjr/7MYWoZklcm60RPKy1xDXgux5PM
	ywjw6sOB8p+WLYzcl0T5A11X1Td2s=
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(8936002)(4326007)(71366001)(356003)(9786002)(50986999)(87936001)(4001430100002)(106466001)(81156014)(6806005)(586003)(2906002)(92566002)(47776003)(189998001)(64026002)(33646002)(107886002)(5003940100001)(86362001)(5008740100001)(77096005)(50226002)(19580405001)(19580395003)(5001770100001)(36756003)(85426001)(11100500001)(48376002)(105606002)(8676002)(5003600100002)(81166006)(50466002)(229853001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT064; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1;
	CAT:NONE; LANG:en; CAT:NONE; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: b32619a6-c1ac-4136-b202-08d3955db94e
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT064;
X-Microsoft-Antispam-PRVS: <15649c1fd36c49838b60b6949759af41@CY1NAM02HT064.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13024025)(13015025)(8121501046)(13018025)(13023025)(13017025)(10201501046)(3002001)(6055026);
	SRVR:CY1NAM02HT064; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT064; 
X-Forefront-PRVS: 09749A275C
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2016 20:43:36.0623 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT064
Subject: [PATCH] runqemu: qemuzynqmp: Add Linux boot support
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
X-List-Received-Date: Wed, 15 Jun 2016 20:43:40 -0000
Content-Type: text/plain

Add support to direct boot Linux instead of just booting u-boot.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 scripts/runqemu          | 3 +--
 scripts/runqemu-internal | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index de05035..d52ea15 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -350,8 +350,7 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
 QEMUZYNQ_DEFAULT_KERNEL=uImage
 QEMUZYNQ_DEFAULT_FSTYPE=cpio
 
-# Default to booting u-boot as a direct Linux boot isn't supported yet.
-QEMUZYNQMP_DEFAULT_KERNEL=u-boot-qemuzynqmp.elf
+QEMUZYNQMP_DEFAULT_KERNEL=Image
 QEMUZYNQMP_DEFAULT_FSTYPE=cpio
 
 setup_path_vars() {
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index ea1a307..ecc5e63 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -514,7 +514,7 @@ config_qemuzynqmp() {
     QEMU_NETWORK_CMD="-net nic -net nic -net nic -net nic -net user,net=10.10.70.0,dhcpstart=10.10.70.1,host=10.10.70.101"
     QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xlnx-ep108 -serial mon:stdio -dtb $DEPLOY_DIR_IMAGE/${QEMU_DTB}.dtb"
 
-    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -tftp $DEPLOY_DIR_IMAGE"
+    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -initrd $ROOTFS"
 }
 
 config_qemumicroblaze() {
-- 
2.7.4


