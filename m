Return-Path: <nathan.rossi@xilinx.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0077.outbound.protection.outlook.com [65.55.169.77])
	by mail.openembedded.org (Postfix) with ESMTP id E936C60809
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 06:05:23 +0000 (UTC)
Received: from BL2FFO11FD007.protection.gbl (10.173.160.34) by
	BL2FFO11HUB061.protection.gbl (10.173.161.161) with Microsoft SMTP
	Server (TLS) id 15.1.26.17; Tue, 9 Dec 2014 05:50:25 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD007.mail.protection.outlook.com (10.173.161.3) with Microsoft
	SMTP Server (TLS) id 15.1.26.17 via Frontend Transport;
	Tue, 9 Dec 2014 05:50:25 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1XyDeA-0004vX-Sb
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Dec 2014 21:47:42 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Dec 2014 15:50:06 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1418104207-1294-1-git-send-email-nathan.rossi@xilinx.com>
References: <1418104207-1294-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21160.005
X-TM-AS-User-Approved-Sender: Yes;Yes
Message-ID: <62a44dfa0ae244f3bbc0e05e196e9762@BL2FFO11FD007.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(189002)(199003)(20776003)(47776003)(92566001)(74316001)(106466001)(450100001)(77156002)(6806004)(64706001)(62966003)(19580395003)(19580405001)(31966008)(76176999)(108616004)(2351001)(229853001)(107046002)(50986999)(48376002)(46102003)(53416004)(86362001)(99396003)(4396001)(50226001)(92726002)(87936001)(21056001)(89996001)(120916001)(104016003)(50466002)(110136001)(107986001)(24736002)(23106004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB061;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB061;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB061;
X-Forefront-PRVS: 0420213CCD
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB061;
X-OriginatorOrg: xilinx.com
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH 2/3] base-files: Add entry for /dev for cpio compatibility
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
X-List-Received-Date: Tue, 09 Dec 2014 06:05:31 -0000
Content-Type: text/plain

The kernel does not automount devtmpfs for a cpio/ramfs rootfs. Add an
entry to /etc/fstab for the mounting of /dev as a devtmpfs.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/recipes-core/base-files/base-files/fstab | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-core/base-files/base-files/fstab
index 739b844..691ba70 100644
--- a/meta/recipes-core/base-files/base-files/fstab
+++ b/meta/recipes-core/base-files/base-files/fstab
@@ -2,6 +2,7 @@
 
 /dev/root            /                    auto       defaults              1  1
 proc                 /proc                proc       defaults              0  0
+devtmpfs             /dev                 devtmpfs   defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
 tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
-- 
2.1.1


