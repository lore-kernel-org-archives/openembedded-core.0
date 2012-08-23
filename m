Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T4ccC-0002Gu-WF
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 20:58:49 +0200
Received: from mail91-am1-R.bigfish.com (10.3.201.237) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.23; Thu, 23 Aug 2012 18:46:42 +0000
Received: from mail91-am1 (localhost [127.0.0.1])	by mail91-am1-R.bigfish.com
	(Postfix) with ESMTP id 1581960252	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 18:46:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 7
X-BigFish: VS7(z37d4lzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1155h)
Received: from mail91-am1 (localhost.localdomain [127.0.0.1]) by mail91-am1
	(MessageSwitch) id 1345747601212726_7915;
	Thu, 23 Aug 2012 18:46:41 +0000 (UTC)
Received: from AM1EHSMHS013.bigfish.com (unknown [10.3.201.238])	by
	mail91-am1.bigfish.com (Postfix) with ESMTP id 284E9180045	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 18:46:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS013.bigfish.com
	(10.3.207.151) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 23 Aug 2012 18:46:40 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Thu, 23 Aug 2012 13:46:38 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q7NIkcdE013697 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 11:46:38 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2012 13:46:37 -0500
Message-ID: <1345747597-18078-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] distutils-common-base.bbclass: Pick up additional .debug folders:
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
X-List-Received-Date: Thu, 23 Aug 2012 18:58:49 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/distutils-common-base.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index f66a5cd..e650d93 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -18,4 +18,7 @@ FILES_${PN}-dbg += "\
   ${PYTHON_SITEPACKAGES_DIR}/.debug \
   ${PYTHON_SITEPACKAGES_DIR}/*/.debug \
   ${PYTHON_SITEPACKAGES_DIR}/*/*/.debug \
+  ${libdir}/${PYTHON_DIR}/.debug \
+  ${libdir}/${PYTHON_DIR}/*/.debug \
+  ${libdir}/${PYTHON_DIR}/*/*/.debug \
 "
-- 
1.7.9.7




