Return-Path: <ezra.savard@xilinx.com>
X-Greylist: delayed 87366 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Dec 2014 18:32:17 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0081.outbound.protection.outlook.com [207.46.100.81])
	by mail.openembedded.org (Postfix) with ESMTP id 08659601A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 18:32:17 +0000 (UTC)
Received: from BY2FFO11FD057.protection.gbl (10.1.14.33) by
	BY2FFO11HUB009.protection.gbl (10.1.14.165) with Microsoft SMTP Server
	(TLS) id 15.1.6.13; Tue, 2 Dec 2014 18:32:15 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BY2FFO11FD057.mail.protection.outlook.com (10.1.15.185) with Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Tue, 2 Dec 2014 18:32:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <ezra.savard@xilinx.com>) id 1XvsCi-0006OM-FI
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Dec 2014 10:29:40 -0800
From: Ezra Savard <ezra.savard@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Dec 2014 10:31:57 -0800
X-Mailer: git-send-email 2.1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21146.001
X-TM-AS-Result: No--4.543-7.0-31-1
X-imss-scan-details: No--4.543-7.0-31-1;No--4.543-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
Message-ID: <c8cce9c951214be48689c2a40c2d6203@BY2FFO11FD057.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(189002)(199003)(46102003)(450100001)(50986999)(74316001)(15395725005)(53416004)(575784001)(4396001)(77156002)(120916001)(110136001)(106466001)(48376002)(88136002)(15202345003)(62966003)(50226001)(20776003)(64706001)(86362001)(92566001)(93916002)(104016003)(19580405001)(50466002)(19580395003)(108616004)(89996001)(47776003)(21056001)(15975445006)(6806004)(99396003)(87286001)(31966008)(44976005)(107046002)(102836001)(229853001)(2351001)(95666004)(87936001)(104166001)(107986001)(24736002)(23106004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2FFO11HUB009;
	H:xsj-pvapsmtpgw01; FPR:; MLV:sfv; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB009;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB009;
X-Forefront-PRVS: 0413C9F1ED
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=ezra.savard@xilinx.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB009;
X-OriginatorOrg: xilinx.com
Subject: [recipes-kernel][PATCH v3] powertop: update version number from 2.6.1 to 2.7
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
X-List-Received-Date: Tue, 02 Dec 2014 18:32:23 -0000
Content-Type: text/plain

The v2.7 release of powertop fixes devfreq support for ARM, along with
other bug fixes.

v2: deletes old file
v3: fixed SRC_URI and checksums

Signed-off-by: Ezra Savard <ezra.savard@xilinx.com>
---
 meta/recipes-kernel/powertop/{powertop_2.6.1.bb => powertop_2.7.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/powertop/{powertop_2.6.1.bb => powertop_2.7.bb} (82%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.6.1.bb b/meta/recipes-kernel/powertop/powertop_2.7.bb
similarity index 82%
rename from meta/recipes-kernel/powertop/powertop_2.6.1.bb
rename to meta/recipes-kernel/powertop/powertop_2.7.bb
index 58216c2d1516..dce5d715fdd2 100644
--- a/meta/recipes-kernel/powertop/powertop_2.6.1.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.7.bb
@@ -6,10 +6,10 @@ DEPENDS = "ncurses libnl pciutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.gz"
+SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4391e7b0af854ecf722cdf712f24b631"
-SRC_URI[sha256sum] = "034cde6d5bb433fe0d29251d5cde5d4c2948abf05fe29ef10966b659331b20e4"
+SRC_URI[md5sum] = "e0d686e47daaf7e9d89031f7763432ef"
+SRC_URI[sha256sum] = "8d4b1490e2baad4467c0ded3c423db4472dcbf7b2dd8f8f2a928f54047c678ca"
 
 inherit autotools gettext pkgconfig
 
-- 
2.1.0


