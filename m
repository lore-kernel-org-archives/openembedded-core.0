Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RJIO0-0001JO-21
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 07:20:16 +0200
Received: from mail49-tx2-R.bigfish.com (10.9.14.235) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.22; Thu, 27 Oct 2011 05:14:10 +0000
Received: from mail49-tx2 (localhost.localdomain [127.0.0.1])	by
	mail49-tx2-R.bigfish.com (Postfix) with ESMTP id 7C4491700129	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 05:14:13 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275ch8275bhz2dh2a8h668h839h64h)
X-Spam-TCS-SCL: 3:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail49-tx2 (localhost.localdomain [127.0.0.1]) by mail49-tx2
	(MessageSwitch) id 1319692453127673_11510;
	Thu, 27 Oct 2011 05:14:13 +0000 (UTC)
Received: from TX2EHSMHS036.bigfish.com (unknown [10.9.14.252])	by
	mail49-tx2.bigfish.com (Postfix) with ESMTP id 10C8455004E	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 05:14:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS036.bigfish.com
	(10.9.99.136) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 27 Oct 2011 05:14:09 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.339.2; Thu, 27 Oct 2011 00:14:16 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p9R5EFqX005995	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2011 00:14:15 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Oct 2011 00:14:13 -0500
Message-ID: <1319692454-20226-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/2] Add new strace-graph package to avoid making perl a dependecy for all of strace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2011 05:20:16 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/strace/strace_4.5.20.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_4.5.20.bb b/meta/recipes-devtools/strace/strace_4.5.20.bb
index b3d2aa5..0e22657 100644
--- a/meta/recipes-devtools/strace/strace_4.5.20.bb
+++ b/meta/recipes-devtools/strace/strace_4.5.20.bb
@@ -3,9 +3,13 @@ HOMEPAGE = "http://strace.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4535377ede62550fdeaf39f595fd550a"
-PR = "r2"
+PR = "r3"
+
+PACKAGES = "${PN} ${PN}-graph"
+FILES_${PN} = "${bindir}/strace"
+FILES_${PN}-graph = "${bindir}/strace-graph"
+RDEPENDS_${PN}-graph = "perl"
 
-RDEPENDS = "perl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
            file://sigmask.patch \
-- 
1.7.6.1




