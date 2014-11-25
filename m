Return-Path: <ezra.savard@xilinx.com>
X-Greylist: delayed 1978 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Nov 2014 18:26:17 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0070.outbound.protection.outlook.com [157.56.110.70])
	by mail.openembedded.org (Postfix) with ESMTP id C847D70A7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 18:26:17 +0000 (UTC)
Received: from BN1AFFO11FD033.protection.gbl (10.58.52.32) by
	BN1AFFO11HUB038.protection.gbl (10.58.52.149) with Microsoft SMTP
	Server (TLS) id 15.1.6.13; Tue, 25 Nov 2014 17:53:19 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11FD033.mail.protection.outlook.com (10.58.52.246) with
	Microsoft SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Tue, 25 Nov 2014 17:53:19 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <ezra.savard@xilinx.com>) id 1XtKGH-0002u7-Ll
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Nov 2014 09:50:49 -0800
From: Ezra Savard <ezra.savard@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Nov 2014 09:52:43 -0800
X-Mailer: git-send-email 2.1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21130.000
X-TM-AS-Result: No--11.073-7.0-31-1
X-imss-scan-details: No--11.073-7.0-31-1;No--11.073-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
Message-ID: <54183e481450413484c1441603cf77cc@BN1AFFO11FD033.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(189002)(199003)(64706001)(44976005)(47776003)(110136001)(575784001)(50986999)(88136002)(53416004)(229853001)(120916001)(104016003)(107046002)(33646002)(31966008)(20776003)(19580395003)(106466001)(108616004)(74316001)(87936001)(77156002)(21056001)(46102003)(6806004)(2351001)(77096003)(87286001)(104166001)(95666004)(89996001)(19580405001)(15975445006)(50226001)(86362001)(62966003)(48376002)(102836001)(450100001)(50466002)(15395725005)(93916002)(4396001)(15202345003)(92566001)(2420400002)(99396003)(107986001)(24736002)(23106004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB038;
	H:xsj-pvapsmtpgw01; FPR:; MLV:sfv; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1AFFO11HUB038;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB038; 
X-Forefront-PRVS: 040655413E
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=ezra.savard@xilinx.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB038; 
X-OriginatorOrg: xilinx.com
Subject: [PATCH] powertop: update version number from 2.6.1 to 2.7
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
X-List-Received-Date: Tue, 25 Nov 2014 18:26:26 -0000
Content-Type: text/plain

The v2.7 release of powertop fixes devfreq support for ARM, along with
other bug fixes.

Signed-off-by: Ezra Savard <ezra.savard@xilinx.com>
---
 meta/recipes-kernel/powertop/powertop_2.7.bb | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-kernel/powertop/powertop_2.7.bb

diff --git a/meta/recipes-kernel/powertop/powertop_2.7.bb b/meta/recipes-kernel/powertop/powertop_2.7.bb
new file mode 100644
index 000000000000..58216c2d1516
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop_2.7.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Power usage tool"
+DESCRIPTION = "Linux tool to diagnose issues with power consumption and power management."
+HOMEPAGE = "http://01.org/powertop/"
+BUGTRACKER = "http://bugzilla.lesswatts.org/"
+DEPENDS = "ncurses libnl pciutils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "4391e7b0af854ecf722cdf712f24b631"
+SRC_URI[sha256sum] = "034cde6d5bb433fe0d29251d5cde5d4c2948abf05fe29ef10966b659331b20e4"
+
+inherit autotools gettext pkgconfig
+
+# we need to explicitly link with libintl in uClibc systems
+LDFLAGS += "${EXTRA_LDFLAGS}"
+EXTRA_LDFLAGS_libc-uclibc = "-lintl"
+
+# we do not want libncursesw if we can
+do_configure_prepend() {
+    # configure.ac checks for delwin() in "ncursesw ncurses" so let's drop first one
+    sed -i -e "s/ncursesw//g" ${S}/configure.ac
+    mkdir -p ${B}/src/tuning/
+}
+
+inherit update-alternatives
+ALTERNATIVE_${PN} = "powertop"
+ALTERNATIVE_TARGET[powertop] = "${sbindir}/powertop"
+ALTERNATIVE_LINK_NAME[powertop] = "${sbindir}/powertop"
+ALTERNATIVE_PRIORITY = "100"
-- 
2.1.0


