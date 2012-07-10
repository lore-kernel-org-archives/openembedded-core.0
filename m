Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SogYG-0007w3-Hj
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 21:56:52 +0200
Received: from mail150-va3-R.bigfish.com (10.7.14.235) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jul 2012 19:43:21 +0000
Received: from mail150-va3 (localhost [127.0.0.1])	by
	mail150-va3-R.bigfish.com (Postfix) with ESMTP id 5A3334802EC	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 19:43:21 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail150-va3 (localhost.localdomain [127.0.0.1]) by mail150-va3
	(MessageSwitch) id 1341949400370482_31910;
	Tue, 10 Jul 2012 19:43:20 +0000 (UTC)
Received: from VA3EHSMHS024.bigfish.com (unknown [10.7.14.241])	by
	mail150-va3.bigfish.com (Postfix) with ESMTP id 54ABB4E00B1	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 19:43:20 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS024.bigfish.com
	(10.7.99.34) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 19:43:18 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Tue, 10 Jul 2012 14:45:36 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6AJjale007612 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 12:45:36 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 14:45:35 -0500
Message-ID: <1341949535-2466-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] openjade-native_1.3.2.bb: fix typo and change the deps exclusion to correct var
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
X-List-Received-Date: Tue, 10 Jul 2012 19:56:52 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/openjade/openjade-native_1.3.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index a539c35..266210d 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -33,7 +33,7 @@ CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--datadir=${datadi
 # CONFIGUREOPTS has hard coded paths so we need to ignore it's vardeps
 # there are other bits in there too but they are picked up by other variable
 # dependencies so it all works out
-do_configure[vardepsexclude] += "CONNFIGUREOPTS"
+oe_runconf[vardepsexclude] += "CONFIGUREOPTS"
 
 CFLAGS =+ "-I${S}/include"
 
-- 
1.7.10




