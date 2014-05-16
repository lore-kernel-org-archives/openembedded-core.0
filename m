Return-Path: <Zongchun.Yu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.144])
	by mail.openembedded.org (Postfix) with ESMTP id D79F76A5B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 07:59:42 +0000 (UTC)
Received: from BY2PR03CA035.namprd03.prod.outlook.com (10.242.234.156) by
	BY2PR03MB298.namprd03.prod.outlook.com (10.141.139.17) with Microsoft
	SMTP Server (TLS) id 15.0.949.11; Fri, 16 May 2014 07:45:07 +0000
Received: from BY2FFO11FD046.protection.gbl (2a01:111:f400:7c0c::185) by
	BY2PR03CA035.outlook.office365.com (2a01:111:e400:2c2c::28) with
	Microsoft SMTP Server (TLS) id 15.0.944.11 via Frontend Transport;
	Fri, 16 May 2014 07:45:07 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD046.mail.protection.outlook.com (10.1.15.170) with Microsoft
	SMTP Server (TLS) id 15.0.939.9 via Frontend Transport;
	Fri, 16 May 2014 07:45:07 +0000
Received: from localhost.localdomain (b40527-01.ap.freescale.net
	[10.193.20.90])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s4G7j52i012851;
	Fri, 16 May 2014 00:45:06 -0700
From: <b40527@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 15:45:21 +0800
Message-ID: <1400226321-5201-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.7.0.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(6009001)(199002)(189002)(74662001)(36756003)(31966008)(77982001)(68736004)(69596002)(50466002)(33646001)(46102001)(77156001)(44976005)(83322001)(19580405001)(19580395003)(6806004)(88136002)(89996001)(87936001)(81156002)(99396002)(83072002)(76482001)(50986999)(49486002)(87286001)(4396001)(81542001)(48376002)(62966002)(85852003)(81342001)(74502001)(97736001)(93916002)(92566001)(86152002)(92726001)(50226001)(77096999)(21056001)(80022001)(102836001)(84676001)(20776003)(79102001)(47776003)(64706001);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB298;
	H:az84smr01.freescale.net; FPR:; PTR:InfoDomainNonexistent; A:1;
	MX:1; LANG:en; 
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
X-List-Received-Date: Fri, 16 May 2014 07:59:45 -0000
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


