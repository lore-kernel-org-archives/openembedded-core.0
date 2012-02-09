Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RvZpD-0005Ra-9j
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 20:38:35 +0100
Received: from mail57-tx2-R.bigfish.com (10.9.14.252) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Thu, 9 Feb 2012 19:30:29 +0000
Received: from mail57-tx2 (localhost [127.0.0.1])	by mail57-tx2-R.bigfish.com
	(Postfix) with ESMTP id DD6574604D5	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2012 19:30:28 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail57-tx2 (localhost.localdomain [127.0.0.1]) by mail57-tx2
	(MessageSwitch) id 132881582767683_8903; Thu,  9 Feb 2012 19:30:27 +0000
	(UTC)
Received: from TX2EHSMHS039.bigfish.com (unknown [10.9.14.248])	by
	mail57-tx2.bigfish.com (Postfix) with ESMTP id 02A091E0046	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2012 19:30:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS039.bigfish.com
	(10.9.99.139) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 9 Feb 2012 19:30:26 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 9 Feb 2012 13:30:25 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	q19JUOE2010362	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2012 13:30:25 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2012 13:30:24 -0600
Message-ID: <1328815824-5541-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <4F33FF4F.2090309@linux.intel.com>
References: <4F33FF4F.2090309@linux.intel.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] powerpc64-linux: Update cached autoconf values for libpcap on powerpc64
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
X-List-Received-Date: Thu, 09 Feb 2012 19:38:35 -0000
Content-Type: text/plain

Without this fix, libpcap will fail to build on powerpc64

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: include filename is patch description

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




