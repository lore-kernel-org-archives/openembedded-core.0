Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1T1TvW-0002XH-1C
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 05:05:46 +0200
Received: from mail253-ch1-R.bigfish.com (10.43.68.250) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Wed, 15 Aug 2012 02:53:49 +0000
Received: from mail253-ch1 (localhost [127.0.0.1])	by
	mail253-ch1-R.bigfish.com (Postfix) with ESMTP id D4DD27000B9	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 02:53:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail253-ch1 (localhost.localdomain [127.0.0.1]) by mail253-ch1
	(MessageSwitch) id 1344999227543119_6707;
	Wed, 15 Aug 2012 02:53:47 +0000 (UTC)
Received: from CH1EHSMHS029.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.254])	by mail253-ch1.bigfish.com (Postfix) with ESMTP id
	79290C0045 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 02:53:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS029.bigfish.com
	(10.43.70.29) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 15 Aug 2012 02:53:47 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Tue, 14 Aug 2012 21:53:46 -0500
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q7F2riaN020466;
	Tue, 14 Aug 2012 19:53:45 -0700
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 11:08:45 +0800
Message-ID: <1345000125-3865-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: udev: update rcS to auto-detect hostname
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
X-List-Received-Date: Wed, 15 Aug 2012 03:05:46 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    the rootfs image can be reused by targets with same core type

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-core/sysvinit/sysvinit/rcS |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS b/meta/recipes-core/sysvinit/sysvinit/rcS
index 080b04f..51425ff 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rcS
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS
@@ -22,6 +22,11 @@ export PATH runlevel prevlevel
 . /etc/default/rcS
 
 #
+#       Update the hostname according to actual board type
+#
+echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "[a-z]"` > /etc/hostname
+
+#
 #	Trap CTRL-C &c only in this shell so we can interrupt subprocesses.
 #
 trap ":" INT QUIT TSTP
-- 
1.7.0.4




