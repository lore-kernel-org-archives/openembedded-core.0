Return-Path: <alistair.francis@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0087.outbound.protection.outlook.com
	[104.47.37.87])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5A960616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 21:41:07 +0000 (UTC)
Received: from CY1NAM02FT010.eop-nam02.prod.protection.outlook.com
	(10.152.74.51) by CY1NAM02HT176.eop-nam02.prod.protection.outlook.com
	(10.152.74.164) with Microsoft SMTP Server (TLS) id 15.1.492.8;
	Thu, 12 May 2016 21:41:07 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT010.mail.protection.outlook.com (10.152.75.50) with Microsoft
	SMTP Server (TLS) id 15.1.492.8 via Frontend Transport;
	Thu, 12 May 2016 21:41:07 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:56157
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1b0yLy-0007fj-V3; Thu, 12 May 2016 14:41:06 -0700
Received: from [127.0.0.1] (port=36764 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1b0yLy-0004OH-RU; Thu, 12 May 2016 14:41:06 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u4CLYpdD008146; Thu, 12 May 2016 14:34:51 -0700
Received: from [172.19.74.182] (port=34468 helo=xsjalistai50.xlnx.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1b0yLy-0004OE-1G; Thu, 12 May 2016 14:41:06 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 May 2016 14:37:39 -0700
Message-ID: <1463089059-10156-1-git-send-email-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22316.005
X-TM-AS-Result: No--4.259-7.0-31-10
X-imss-scan-details: No--4.259-7.0-31-10
X-TMASE-MatchedRID: 77cn8eSK/E7HQuauwt+FXCmjEOrcO6AyTJDl9FKHbrnN7tD9WAah5e7M
	OzRzPXBzztUjazButmHUFV++pr+0jFAxeO3Kg0K1EdFsavUQKAe5JJEy92I4jM7EPIkVcg+OXHO
	xqxutZofbn8uPtIBRS+DDek7sFEnXLaP72qTz0h7k7k9yXJiqqofsPVs/8Vw6I4EI6J8vTC89x4
	XwP8NZQK3UZWGqSu7znBGTyVCejrC9XBcmqjeTJ54CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOHezWERYZTeaf0KMi8ya2i0ODVFI1OjCBI8zlCF/4VrQsYd0uUiSIjKGL0qOXTNIsZK2a
	r2/d/i/jB5Y/qcr6iXZ2g9frPcAagr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(50466002)(5003600100002)(48376002)(77096005)(229853001)(11100500001)(1220700001)(71366001)(47776003)(5003940100001)(50226002)(81166006)(2351001)(86362001)(105606002)(33646002)(9786002)(92566002)(106466001)(19580405001)(50986999)(4001430100002)(85426001)(87936001)(2906002)(19580395003)(4326007)(189998001)(6806005)(64026002)(586003)(8936002)(107886002)(5008740100001)(36756003)(110136002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT176; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; MLV:sfv; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 6083e814-ee21-4167-3828-08d37aae206a
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT176;
X-Microsoft-Antispam-PRVS: <39e9dc20dc6b4e868dbf15b325064763@CY1NAM02HT176.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13023025)(8121501046)(13024025)(5005006)(13018025)(13015025)(13017025)(10201501046)(3002001)(6055026);
	SRVR:CY1NAM02HT176; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT176; 
X-Forefront-PRVS: 0940A19703
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2016 21:41:07.4383 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT176
Cc: alistair23@gmail.com
Subject: [PATCH v1] runqemu: Add suport for qemuzynqmp
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
X-List-Received-Date: Thu, 12 May 2016 21:41:10 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 scripts/runqemu          |  9 ++++++++-
 scripts/runqemu-internal | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index d7fa941..de05035 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -121,7 +121,7 @@ while true; do
     arg=${1}
     case "$arg" in
         "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \
-        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
+        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq" | "qemuzynqmp")
             [ -z "$MACHINE" -o "$MACHINE" = "$arg" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
@@ -350,6 +350,10 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
 QEMUZYNQ_DEFAULT_KERNEL=uImage
 QEMUZYNQ_DEFAULT_FSTYPE=cpio
 
+# Default to booting u-boot as a direct Linux boot isn't supported yet.
+QEMUZYNQMP_DEFAULT_KERNEL=u-boot-qemuzynqmp.elf
+QEMUZYNQMP_DEFAULT_FSTYPE=cpio
+
 setup_path_vars() {
     if [ -z "$OE_TMPDIR" ] ; then
         PATHS_REQUIRED=true
@@ -382,6 +386,9 @@ setup_path_vars() {
         if [ -z "$DEPLOY_DIR_IMAGE" ] ; then
             DEPLOY_DIR_IMAGE=`sed -n 's/^DEPLOY_DIR_IMAGE=\"\(.*\)\"/\1/p' $BITBAKE_ENV_TMPFILE`
         fi
+        if [ -z "$QEMU_DTB" ] ; then
+            QEMU_DTB=`sed -n 's/^QEMU_DTB=\"\(.*\)\"/\1/p' $BITBAKE_ENV_TMPFILE`
+        fi
         if [ -z "$OE_TMPDIR" ]; then
             # Check for errors from bitbake that the user needs to know about
             BITBAKE_OUTPUT=`cat $BITBAKE_ENV_TMPFILE | wc -l`
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index ac1c703..5671b4f 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -498,6 +498,24 @@ config_qemuzynq() {
     fi
 }
 
+config_qemuzynqmp() {
+    set_mem_size 2048
+    QEMU=qemu-system-aarch64
+
+    export QEMU_AUDIO_DRV="none"
+    if [ "x$SERIALSTDIO" = "x" ] ; then
+        QEMU_UI_OPTIONS="-nographic"
+    else
+        QEMU_UI_OPTIONS=""
+    fi
+
+    # Networking and system options required for QEMU ZynqMP machine
+    QEMU_NETWORK_CMD="-net nic -net nic -net nic -net nic -net user,net=10.10.70.0,dhcpstart=10.10.70.1,host=10.10.70.101"
+    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xlnx-ep108 -serial mon:stdio -dtb $DEPLOY_DIR_IMAGE/${QEMU_DTB}.dtb"
+
+    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -tftp $DEPLOY_DIR_IMAGE"
+}
+
 config_qemumicroblaze() {
     set_mem_size 256
     QEMU=qemu-system-microblazeel
@@ -533,6 +551,9 @@ case "$MACHINE" in
     "qemuzynq")
         config_qemuzynq
         ;;
+    "qemuzynqmp")
+        config_qemuzynqmp
+        ;;
     "qemumicroblaze")
         config_qemumicroblaze
         ;;
-- 
2.7.4


