Return-Path: <Zongchun.Yu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.181])
	by mail.openembedded.org (Postfix) with ESMTP id F036965EA8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 09:01:23 +0000 (UTC)
Received: from BY2PR03CA079.namprd03.prod.outlook.com (10.141.249.52) by
	BY2PR03MB297.namprd03.prod.outlook.com (10.141.139.14) with Microsoft
	SMTP Server (TLS) id 15.0.949.11; Fri, 16 May 2014 09:01:22 +0000
Received: from BY2FFO11FD047.protection.gbl (2a01:111:f400:7c0c::111) by
	BY2PR03CA079.outlook.office365.com (2a01:111:e400:2c5d::52) with
	Microsoft SMTP Server (TLS) id 15.0.939.12 via Frontend Transport;
	Fri, 16 May 2014 09:01:22 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD047.mail.protection.outlook.com (10.1.15.175) with Microsoft
	SMTP Server (TLS) id 15.0.939.9 via Frontend Transport;
	Fri, 16 May 2014 09:01:22 +0000
Received: from localhost.localdomain (b40527-01.ap.freescale.net
	[10.193.20.90])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s4G91K18021802;
	Fri, 16 May 2014 02:01:20 -0700
From: <b40527@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 17:01:36 +0800
Message-ID: <1400230896-5902-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.7.0.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(6009001)(199002)(189002)(77156001)(77982001)(81542001)(99396002)(74502001)(48376002)(64706001)(87936001)(81156002)(31966008)(85852003)(6806004)(88136002)(74662001)(46102001)(83072002)(44976005)(83322001)(19580405001)(89996001)(19580395003)(62966002)(76482001)(47776003)(20776003)(102836001)(50466002)(49486002)(50986999)(33646001)(21056001)(77096999)(87286001)(80022001)(81342001)(93916002)(92566001)(86152002)(79102001)(50226001)(92726001)(84676001)(69596002)(68736004)(36756003)(97736001)(4396001);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB297;
	H:az84smr01.freescale.net; FPR:; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Forefront-PRVS: 02135EB356
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=Zongchun.Yu@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>
Subject: [PATCH 2/2] Add api-doc class
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
X-List-Received-Date: Fri, 16 May 2014 09:01:26 -0000
Content-Type: text/plain

From: Zongchun Yu <Zongchun.Yu@freescale.com>

this class use doxygen to generate api docs from source code

Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
---
 meta/classes/api-doc.bbclass |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/api-doc.bbclass

diff --git a/meta/classes/api-doc.bbclass b/meta/classes/api-doc.bbclass
new file mode 100644
index 0000000..0879c3e
--- /dev/null
+++ b/meta/classes/api-doc.bbclass
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
+addtask generate_doc before do_install after do_patch
-- 
1.7.0.4


