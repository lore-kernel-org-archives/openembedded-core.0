Return-Path: <alistair.francis@xilinx.com>
X-Greylist: delayed 949 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Jun 2016 18:49:33 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0062.outbound.protection.outlook.com [104.47.36.62])
	by mail.openembedded.org (Postfix) with ESMTP id 18BB86FF23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 18:49:33 +0000 (UTC)
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(10.152.72.58) by SN1NAM02HT111.eop-nam02.prod.protection.outlook.com
	(10.152.73.52) with Microsoft SMTP Server (TLS) id 15.1.497.8;
	Tue, 7 Jun 2016 18:33:44 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with
	Microsoft SMTP Server (TLS) id 15.1.497.8 via Frontend Transport;
	Tue, 7 Jun 2016 18:33:44 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:56628
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bALot-0005JE-Ga; Tue, 07 Jun 2016 11:33:43 -0700
Received: from [127.0.0.1] (port=37235 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bALot-0001Ps-C0; Tue, 07 Jun 2016 11:33:43 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u57IRHbh019770; Tue, 7 Jun 2016 11:27:17 -0700
Received: from [172.19.74.182] (port=35084 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bALos-0001Pp-BU; Tue, 07 Jun 2016 11:33:42 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Jun 2016 11:33:37 -0700
Message-ID: <1465324417-4421-1-git-send-email-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22376.005
X-TM-AS-Result: No--7.475-7.0-31-10
X-imss-scan-details: No--7.475-7.0-31-10
X-TMASE-MatchedRID: HTYSRpF5WrSS4DzS2ivoRbCvlllU7Dl1FKliqHKCaOlcU0dNErOD+izy
	bVqWyY2N9ypTh0ieeukJ6YyG1PaEahnY2g+sHKWUyeVujmXuYYUfbG+50hrCQ2HZ+cd7VyKXU8S
	+/fFbuZNlOlHOYjWNJsryHmYBFZ7RdJA2e9q2V6fEgr2xSHtUG30tCKdnhB589yM15V5aWpj6C0
	ePs7A07fyjtizU0rhjLlaUAUEIR35JAbPJpxvCm4toMxYZ6Zk/7LztVmZEw20=
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(81156014)(9786002)(19580395003)(50986999)(81166006)(19580405001)(107886002)(189998001)(8676002)(106466001)(92566002)(85426001)(8936002)(105606002)(71366001)(2351001)(110136002)(229853001)(33646002)(4001430100002)(586003)(50226002)(6806005)(64026002)(11100500001)(5003600100002)(5003940100001)(2906002)(48376002)(86362001)(4326007)(5008740100001)(87936001)(50466002)(77096005)(47776003)(36756003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT111; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 4f6d9f27-42ff-48bc-9142-08d38f0241ca
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT111;
X-Microsoft-Antispam-PRVS: <b615f7dd91e24f9d85d551e9836d655a@SN1NAM02HT111.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(13018025)(5005006)(13017025)(8121501046)(13023025)(13024025)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT111; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT111; 
X-Forefront-PRVS: 09669DB681
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2016 18:33:44.3685 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT111
Cc: star@gmx.li
Subject: [PATCH] runqemu-internal: Update the qemuzynq boot options
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
X-List-Received-Date: Tue, 07 Jun 2016 18:49:34 -0000
Content-Type: text/plain

The current qemuzynq options were causing QEMU to exit instead of
booting as the QEMU Zynq-7000 machine does not have virtio or
display devices.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reported-by: Arno <star@gmx.li>
---
 scripts/runqemu-internal | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index ac1c703..9cc30d4 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -489,7 +489,8 @@ config_qemush4() {
 config_qemuzynq() {
     set_mem_size 1024
     QEMU=qemu-system-arm
-    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xilinx-zynq-a9 -serial null -serial mon:stdio -dtb $KERNEL-$MACHINE.dtb"
+    QEMU_NETWORK_CMD="-net nic -net nic $QEMU_TAP_CMD"
+    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xilinx-zynq-a9 -serial null -serial mon:stdio -nographic -dtb $KERNEL-$MACHINE.dtb"
     # zynq serial ports are named 'ttyPS0' and 'ttyPS1', fixup the default values
     SCRIPT_KERNEL_OPT=$(echo "$SCRIPT_KERNEL_OPT" | sed 's/console=ttyS/console=ttyPS/g')
     if [ "${FSTYPE:0:3}" = "ext" -o "${FSTYPE:0:4}" = "cpio" ]; then
-- 
2.7.4


