Return-Path: <nathan.rossi@xilinx.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0058.outbound.protection.outlook.com [157.56.111.58])
	by mail.openembedded.org (Postfix) with ESMTP id 566F273C7D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 04:46:32 +0000 (UTC)
Received: from BN1AFFO11FD010.protection.gbl (10.58.52.33) by
	BN1AFFO11HUB022.protection.gbl (10.58.52.132) with Microsoft SMTP
	Server (TLS) id 15.1.160.8; Tue, 5 May 2015 04:30:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BN1AFFO11FD010.mail.protection.outlook.com (10.58.52.70) with Microsoft
	SMTP Server (TLS) id 15.1.160.8 via Frontend Transport;
	Tue, 5 May 2015 04:30:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59330
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YpUMo-0002zO-I3
	for openembedded-core@lists.openembedded.org;
	Mon, 04 May 2015 21:21:58 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 May 2015 14:27:54 +1000
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1430800076-15800-1-git-send-email-nathan.rossi@xilinx.com>
References: <1430800076-15800-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21520.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <a6987fc9-7630-4f01-a658-2a200a1cf441@BN1AFFO11FD010.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(199003)(189002)(47776003)(87936001)(1496007)(104016003)(50986999)(53416004)(229853001)(2950100001)(92566002)(33646002)(76176999)(19580395003)(46102003)(2351001)(106466001)(70736001)(50466002)(48376002)(74316001)(107886002)(450100001)(5001960100002)(62966003)(110136002)(19580405001)(31696002)(77156002)(50226001)(86362001)(6806004)(107986001)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB022;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en;
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1AFFO11HUB022;
X-Microsoft-Antispam-PRVS: <BN1AFFO11HUB022DEFEEB4FE2184237B8A1F1D10@BN1AFFO11HUB022.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN1AFFO11HUB022; BCL:0;
	PCL:0; RULEID:; SRVR:BN1AFFO11HUB022; 
X-Forefront-PRVS: 0567A15835
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2015 04:30:50.4097 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB022
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH 2/4] insane.bbclass: Add MicroBlaze big endian target info
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
X-List-Received-Date: Tue, 05 May 2015 04:46:36 -0000
Content-Type: text/plain

* Add the target info for the 'microblazeeb' target which matches the
  default MicroBlaze target info

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/classes/insane.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 56ee37d..ab4bd78 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -85,6 +85,7 @@ def package_qa_get_machine_dict():
                         "sh4":        (42,     0,    0,          True,          32),
                         "sparc":      ( 2,     0,    0,          False,         32),
                         "microblaze":  (189,   0,    0,          False,         32),
+                        "microblazeeb":(189,   0,    0,          False,         32),
                         "microblazeel":(189,   0,    0,          True,          32),
                       },
             "linux-uclibc" : { 
-- 
1.7.10.4


