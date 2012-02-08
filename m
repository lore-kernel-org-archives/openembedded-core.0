Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RvEPe-0000Ok-5T
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 21:46:46 +0100
Received: from mail67-db3-R.bigfish.com (10.3.81.252) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.23; Wed, 8 Feb 2012 20:38:41 +0000
Received: from mail67-db3 (localhost [127.0.0.1])	by mail67-db3-R.bigfish.com
	(Postfix) with ESMTP id 8703B34044B	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2012 20:38:41 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail67-db3 (localhost.localdomain [127.0.0.1]) by mail67-db3
	(MessageSwitch) id 1328733519345961_15262;
	Wed,  8 Feb 2012 20:38:39 +0000 (UTC)
Received: from DB3EHSMHS011.bigfish.com (unknown [10.3.81.252])	by
	mail67-db3.bigfish.com (Postfix) with ESMTP id 478B210004B	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2012 20:38:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS011.bigfish.com
	(10.3.87.111) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 8 Feb 2012 20:38:39 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Wed, 8 Feb 2012 14:38:37 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	q18Kcak3001343	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2012 14:38:36 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Feb 2012 14:38:36 -0600
Message-ID: <1328733516-30021-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] Update cached autoconf values for libpcap on powerpc64
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
X-List-Received-Date: Wed, 08 Feb 2012 20:46:46 -0000
Content-Type: text/plain

Without this fix, libpcap will fail to build on powerpc64

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/site/powerpc64-linux |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/site/powerpc64-linux b/meta/site/powerpc64-linux
index a49c717..2b147d7 100644
--- a/meta/site/powerpc64-linux
+++ b/meta/site/powerpc64-linux
@@ -31,4 +31,5 @@ screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
 screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
 screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
 
-
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
-- 
1.7.6.1




