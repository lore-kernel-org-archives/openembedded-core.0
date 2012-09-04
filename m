Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T8yi4-0000qx-Pl
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 21:22:53 +0200
Received: from mail215-co1-R.bigfish.com (10.243.78.235) by
	CO1EHSOBE004.bigfish.com (10.243.66.67) with Microsoft SMTP Server id
	14.1.225.23; Tue, 4 Sep 2012 19:10:29 +0000
Received: from mail215-co1 (localhost [127.0.0.1])	by
	mail215-co1-R.bigfish.com (Postfix) with ESMTP id 96E7A7E00F0	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2012 19:10:29 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1155h)
Received: from mail215-co1 (localhost.localdomain [127.0.0.1]) by mail215-co1
	(MessageSwitch) id 134678580194102_23297;
	Tue,  4 Sep 2012 19:10:01 +0000 (UTC)
Received: from CO1EHSMHS017.bigfish.com (unknown [10.243.78.239])	by
	mail215-co1.bigfish.com (Postfix) with ESMTP id F0250D60048	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2012 19:10:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS017.bigfish.com
	(10.243.66.27) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 4 Sep 2012 19:09:59 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Tue, 4 Sep 2012 14:09:58 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q84J9vPn025379
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Sep 2012 12:09:58
	-0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Sep 2012 14:09:54 -0500
Message-ID: <1346785794-18278-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] qmake: add linux-qnuspe to the list of supported targets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 19:22:53 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/qmake_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
index d1008b6..f972b27 100644
--- a/meta/classes/qmake_base.bbclass
+++ b/meta/classes/qmake_base.bbclass
@@ -48,7 +48,7 @@ addtask generate_qt_config_file after do_patch before do_configure
 
 qmake_base_do_configure() {
 	case ${QMAKESPEC} in
-	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceabi-oe-g++)
+	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceabi-oe-g++|*linux-gnuspe-oe-g++)
 		;;
 	*-oe-g++)
 		die Unsupported target ${TARGET_OS} for oe-g++ qmake spec
-- 
1.7.9.7




