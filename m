Return-Path: <nathan.rossi@xilinx.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0094.outbound.protection.outlook.com [157.56.111.94])
	by mail.openembedded.org (Postfix) with ESMTP id A082C60556
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 03:35:58 +0000 (UTC)
Received: from BL2FFO11HUB050.protection.gbl (10.173.161.126) by
	BL2FFO11HUB025.protection.gbl (10.173.161.49) with Microsoft SMTP
	Server (TLS) id 15.1.99.6; Thu, 19 Feb 2015 03:35:58 +0000
Received: from BL2FFO11FD020.protection.gbl (10.173.160.34) by
	BL2FFO11HUB050.protection.gbl (10.173.161.126) with Microsoft SMTP
	Server (TLS) id 15.1.87.10; Thu, 19 Feb 2015 03:35:43 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD020.mail.protection.outlook.com (10.173.161.38) with
	Microsoft SMTP Server (TLS) id 15.1.99.6 via Frontend Transport;
	Thu, 19 Feb 2015 03:35:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YOHqA-0007Sn-U8
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Feb 2015 19:31:50 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Feb 2015 13:34:35 +1000
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21340.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <1271ca6bd1854156a5b6efcf8a925e0c@BL2FFO11FD020.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; lists.openembedded.org; dkim=none
	(message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(74316001)(19580405001)(19580395003)(6806004)(104016003)(2351001)(110136001)(92566002)(50226001)(50986999)(47776003)(48376002)(77156002)(450100001)(106466001)(46102003)(62966003)(50466002)(53416004)(92726002)(229853001)(86362001)(108616004)(87936001)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB050;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:; UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BL2FFO11HUB025; 
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB050;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BL2FFO11HUB050; 
X-Forefront-PRVS: 0492FD61DD
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB050;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2015 03:35:42.8903 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB050
X-OriginatorOrg: xilinx.com
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH] Revert "kernel-arch.bbclass: add arm64 support to U-Boot architecture map"
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
X-List-Received-Date: Thu, 19 Feb 2015 03:36:01 -0000
Content-Type: text/plain

This reverts commit 0b891265716c414ade29d587fc1a3c4ea7beadbe.

U-Boot does support AArch64, this however was only added to newer
versions of U-Boot and at the time of this original commit the U-Boot in
OE-Core did not support the 'arm64' architecture. OE-Core now has a
newer version of U-Boot for the mkimage recipe and thus supports the
'arm64' architecture.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/classes/kernel-arch.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index bbcfa15..6a6ad91 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -40,7 +40,6 @@ def map_uboot_arch(a, d):
 
     if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
     elif re.match('i.86$', a): return 'x86'
-    elif re.match('arm64$', a): return 'arm'
     return a
 
 export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH', True), d)}"
-- 
2.1.1


