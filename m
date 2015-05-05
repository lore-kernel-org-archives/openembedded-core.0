Return-Path: <nathan.rossi@xilinx.com>
X-Greylist: delayed 846 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 May 2015 04:44:46 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0058.outbound.protection.outlook.com [207.46.100.58])
	by mail.openembedded.org (Postfix) with ESMTP id 12E556AC56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 04:44:46 +0000 (UTC)
Received: from BN1AFFO11FD016.protection.gbl (10.58.52.33) by
	BN1AFFO11HUB022.protection.gbl (10.58.52.132) with Microsoft SMTP
	Server (TLS) id 15.1.160.8; Tue, 5 May 2015 04:30:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BN1AFFO11FD016.mail.protection.outlook.com (10.58.52.76) with Microsoft
	SMTP Server (TLS) id 15.1.160.8 via Frontend Transport;
	Tue, 5 May 2015 04:30:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59163
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YpUMe-0002yg-29
	for openembedded-core@lists.openembedded.org;
	Mon, 04 May 2015 21:21:48 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 May 2015 14:27:52 +1000
X-Mailer: git-send-email 1.7.10.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21520.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <bce8c2e8-b438-4d9a-bcef-c2a740d15d6e@BN1AFFO11FD016.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(199003)(189002)(47776003)(87936001)(1496007)(104016003)(50986999)(53416004)(229853001)(92566002)(33646002)(46102003)(2351001)(106466001)(70736001)(50466002)(48376002)(74316001)(107886002)(450100001)(5001960100002)(62966003)(110136002)(31696002)(77156002)(50226001)(86362001)(6806004)(107986001)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB022;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en;
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1AFFO11HUB022;
X-Microsoft-Antispam-PRVS: <BN1AFFO11HUB02269F002AF5C6C7240442BF1D10@BN1AFFO11HUB022.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN1AFFO11HUB022; BCL:0;
	PCL:0; RULEID:; SRVR:BN1AFFO11HUB022; 
X-Forefront-PRVS: 0567A15835
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2015 04:30:40.0692 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB022
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH 0/4] Updated MicroBlaze Support
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
X-List-Received-Date: Tue, 05 May 2015 04:44:47 -0000
Content-Type: text/plain

This patch set adds some additional support for the MicroBlaze architecture.

The first three patches add definitions for the MicroBlaze big-endian
'microblazeeb' architecture.

The last patch adds support to the ghostscript recipe for building on both big
and little endian MicroBlaze architectures.

Nathan Rossi (4):
  kernel-arch: Update mapping for MicroBlaze architectures
  insane.bbclass: Add MicroBlaze big endian target info
  siteinfo.bbclass: Add MicroBlaze big endian target info
  ghostscript: Add MicroBlaze support

 meta/classes/insane.bbclass                        |    1 +
 meta/classes/kernel-arch.bbclass                   |    2 +-
 meta/classes/siteinfo.bbclass                      |    1 +
 .../ghostscript/ghostscript/microblazeeb/objarch.h |   40 ++++++++++++++++++++
 .../ghostscript/ghostscript/microblazeel/objarch.h |   40 ++++++++++++++++++++
 5 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/microblazeeb/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h

-- 
1.7.10.4


