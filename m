Return-Path: <nathan.rossi@xilinx.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0075.outbound.protection.outlook.com [157.56.111.75])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4B873C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 04:45:09 +0000 (UTC)
Received: from BN1BFFO11FD036.protection.gbl (10.58.144.34) by
	BN1BFFO11HUB056.protection.gbl (10.58.144.203) with Microsoft SMTP
	Server (TLS) id 15.1.160.8; Tue, 5 May 2015 04:30:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BN1BFFO11FD036.mail.protection.outlook.com (10.58.144.99) with
	Microsoft SMTP Server (TLS) id 15.1.160.8 via Frontend Transport;
	Tue, 5 May 2015 04:30:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59157
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YpUMd-0002yf-VX
	for openembedded-core@lists.openembedded.org;
	Mon, 04 May 2015 21:21:48 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 May 2015 14:27:53 +1000
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1430800076-15800-1-git-send-email-nathan.rossi@xilinx.com>
References: <1430800076-15800-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21520.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <a46bda8a-741b-4c0d-9b78-0923f0ed31a7@BN1BFFO11FD036.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(199003)(189002)(70736001)(77156002)(107886002)(2950100001)(450100001)(6806004)(110136002)(47776003)(92566002)(62966003)(5001960100002)(53416004)(76176999)(50986999)(48376002)(50466002)(74316001)(106466001)(104016003)(33646002)(87936001)(19580405001)(19580395003)(1496007)(86362001)(2351001)(229853001)(46102003)(5001920100001)(31696002)(50226001)(107986001)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1BFFO11HUB056;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en;
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1BFFO11HUB056;
X-Microsoft-Antispam-PRVS: <BN1BFFO11HUB0568FB9FE7B09E6AC951519F1D10@BN1BFFO11HUB056.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN1BFFO11HUB056; BCL:0;
	PCL:0; RULEID:; SRVR:BN1BFFO11HUB056; 
X-Forefront-PRVS: 0567A15835
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2015 04:30:39.9466 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1BFFO11HUB056
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH 1/4] kernel-arch: Update mapping for MicroBlaze architectures
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
X-List-Received-Date: Tue, 05 May 2015 04:45:11 -0000
Content-Type: text/plain

* Add pattern matching for the 'microblazeeb' architecture which maps to
  'microblaze' in the same way as 'microblazeel'

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/classes/kernel-arch.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 6a6ad91..6650870 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -28,7 +28,7 @@ def map_kernel_arch(a, d):
     elif re.match('p(pc|owerpc)(|64)', a):      return 'powerpc'
     elif re.match('sh(3|4)$', a):               return 'sh'
     elif re.match('bfin', a):                   return 'blackfin'
-    elif re.match('microblazeel', a):           return 'microblaze'
+    elif re.match('microblazee[bl]', a):        return 'microblaze'
     elif a in valid_archs:                      return a
     else:
         bb.error("cannot map '%s' to a linux kernel architecture" % a)
-- 
1.7.10.4


