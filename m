Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SomrH-00036U-FI
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 04:40:55 +0200
Received: from mail129-tx2-R.bigfish.com (10.9.14.236) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Wed, 11 Jul 2012 02:27:23 +0000
Received: from mail129-tx2 (localhost [127.0.0.1])	by
	mail129-tx2-R.bigfish.com (Postfix) with ESMTP id AF8EBC009B	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 02:27:22 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail129-tx2 (localhost.localdomain [127.0.0.1]) by mail129-tx2
	(MessageSwitch) id 1341973641276289_2528;
	Wed, 11 Jul 2012 02:27:21 +0000 (UTC)
Received: from TX2EHSMHS033.bigfish.com (unknown [10.9.14.241])	by
	mail129-tx2.bigfish.com (Postfix) with ESMTP id 3726280044	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 02:27:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS033.bigfish.com
	(10.9.99.133) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 11 Jul 2012 02:27:21 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Tue, 10 Jul 2012 21:29:40 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6B2TeKT010128 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 19:29:40 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 21:29:40 -0500
Message-ID: <1341973780-4638-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] dtc.inc: fix for libdir == /usr/lib64
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
X-List-Received-Date: Wed, 11 Jul 2012 02:40:55 -0000
Content-Type: text/plain

On 64bit systems dtc will still install libaries in /usr/lib
unless we havet this override

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-kernel/dtc/dtc.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index fab91dc..18847c6 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -10,8 +10,8 @@ SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git \
            file://make_install.patch \
 	  "
 
-EXTRA_OEMAKE='PREFIX="${prefix}"'
-INC_PR = "r2"
+EXTRA_OEMAKE='PREFIX="${prefix}" LIBDIR="${libdir}"'
+INC_PR = "r3"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10




