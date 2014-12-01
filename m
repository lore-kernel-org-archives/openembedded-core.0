Return-Path: <ezra.savard@xilinx.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0071.outbound.protection.outlook.com [157.56.110.71])
	by mail.openembedded.org (Postfix) with ESMTP id 5C1B9722DD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 18:50:00 +0000 (UTC)
Received: from BL2FFO11FD013.protection.gbl (10.173.160.32) by
	BL2FFO11HUB027.protection.gbl (10.173.161.51) with Microsoft SMTP
	Server (TLS) id 15.1.26.17; Mon, 1 Dec 2014 18:16:10 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD013.mail.protection.outlook.com (10.173.160.221) with
	Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport; Mon, 1 Dec 2014
	18:16:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <ezra.savard@xilinx.com>) id 1XvVTa-0005rV-DB
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Dec 2014 10:13:34 -0800
From: Ezra Savard <ezra.savard@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Dec 2014 10:16:06 -0800
X-Mailer: git-send-email 2.1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21144.001
X-TM-AS-Result: No--1.555-7.0-31-1
X-imss-scan-details: No--1.555-7.0-31-1;No--1.555-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
Message-ID: <f939838557a84721bbcf7fe509ef4c8c@BL2FFO11FD013.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=ezra.savard@xilinx.com; 
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(189002)(199003)(110136001)(74316001)(92566001)(88136002)(87286001)(19580405001)(46102003)(62966003)(19580395003)(20776003)(47776003)(229853001)(107046002)(89996001)(120916001)(104016003)(104166001)(87936001)(48376002)(2351001)(108616004)(6806004)(44976005)(50466002)(450100001)(102836001)(77156002)(93916002)(86362001)(50986999)(106466001)(4396001)(50226001)(21056001)(64706001)(53416004)(99396003)(31966008)(77096004)(95666004)(107986001)(24736002)(23106004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB027;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB027;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB027;
X-Forefront-PRVS: 0412A98A59
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB027;
X-OriginatorOrg: xilinx.com
Subject: [recipes-kernel][PATCH v2] powertop: update version number from 2.6.1 to 2.7
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
X-List-Received-Date: Mon, 01 Dec 2014 18:50:08 -0000
Content-Type: text/plain

The v2.7 release of powertop fixes devfreq support for ARM, along with
other bug fixes.

Signed-off-by: Ezra Savard <ezra.savard@xilinx.com>
---
 meta/recipes-kernel/powertop/{powertop_2.6.1.bb => powertop_2.7.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-kernel/powertop/{powertop_2.6.1.bb => powertop_2.7.bb} (100%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.6.1.bb b/meta/recipes-kernel/powertop/powertop_2.7.bb
similarity index 100%
rename from meta/recipes-kernel/powertop/powertop_2.6.1.bb
rename to meta/recipes-kernel/powertop/powertop_2.7.bb
-- 
2.1.0


