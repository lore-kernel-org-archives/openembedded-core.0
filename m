Return-Path: <Zongchun.Yu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF1E65E58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 06:08:30 +0000 (UTC)
Received: from CH1PR03CA006.namprd03.prod.outlook.com (10.255.156.151) by
	BL2PR03MB290.namprd03.prod.outlook.com (10.141.68.19) with Microsoft
	SMTP Server (TLS) id 15.0.949.11; Fri, 23 May 2014 06:08:31 +0000
Received: from BL2FFO11FD057.protection.gbl (10.255.156.132) by
	CH1PR03CA006.outlook.office365.com (10.255.156.151) with Microsoft SMTP
	Server (TLS) id 15.0.944.11 via Frontend Transport;
	Fri, 23 May 2014 06:08:30 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.1) by
	BL2FFO11FD057.mail.protection.outlook.com (10.173.161.185) with
	Microsoft
	SMTP Server (TLS) id 15.0.949.9 via Frontend Transport; Fri, 23 May 2014
	06:08:30 +0000
Received: from localhost.localdomain (b40527-01.ap.freescale.net
	[10.193.20.90])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s4N68Mie012592; Thu, 22 May 2014 23:08:23 -0700
From: <b40527@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 May 2014 14:09:10 +0800
Message-ID: <1400825350-3995-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.7.0.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.1; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(49486002)(4396001)(89996001)(6806004)(99396002)(88136002)(48376002)(81542001)(86152002)(44976005)(33646001)(21056001)(77982001)(50466002)(50986999)(76482001)(87936001)(87286001)(26826002)(77096999)(93916002)(92566001)(64706001)(92726001)(102836001)(85852003)(19580395003)(36756003)(19580405001)(50226001)(83322001)(31966008)(74662001)(74502001)(47776003)(62966002)(77156001)(81342001)(80022001)(46102001)(20776003)(83072002)(79102001);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB290;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:gate-tx3.freescale.com; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Forefront-PRVS: 0220D4B98D
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.168.1
	as permitted sender) receiver=; client-ip=192.88.168.1;
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.1)
	smtp.mailfrom=Zongchun.Yu@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>
Subject: [PATCH 2/2][v2] add doxygen class
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
X-List-Received-Date: Fri, 23 May 2014 06:08:31 -0000
Content-Type: text/plain

From: Zongchun Yu <Zongchun.Yu@freescale.com>

Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
---
 meta/classes/doxygen.bbclass |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/doxygen.bbclass

diff --git a/meta/classes/doxygen.bbclass b/meta/classes/doxygen.bbclass
new file mode 100644
index 0000000..13b9f79
--- /dev/null
+++ b/meta/classes/doxygen.bbclass
@@ -0,0 +1,16 @@
+# Helper class to pull in the right dependencies and generate
+# api documentation from sources code
+
+DEPENDS += "doxygen-native"
+
+# Doxygen configuration file
+DOXYGEN_CFG ?= "Doxyfile"
+
+do_generate_doc () {
+    if [ -e ${S}/${DOXYGEN_CFG} ]; then
+        doxygen ${S}/${DOXYGEN_CFG}
+    else
+        bbfatal "no doxygen configuration file found"
+    fi
+}
+addtask generate_doc before do_compile after do_patch
-- 
1.7.0.4


