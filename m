Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Soy3h-00014m-Ah
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 16:38:29 +0200
Received: from mail116-va3-R.bigfish.com (10.7.14.242) by
	VA3EHSOBE003.bigfish.com (10.7.40.23) with Microsoft SMTP Server id
	14.1.225.23; Wed, 11 Jul 2012 13:54:43 +0000
Received: from mail116-va3 (localhost [127.0.0.1])	by
	mail116-va3-R.bigfish.com (Postfix) with ESMTP id 721A74032B	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 13:54:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail116-va3 (localhost.localdomain [127.0.0.1]) by mail116-va3
	(MessageSwitch) id 1342014881502150_31887;
	Wed, 11 Jul 2012 13:54:41 +0000 (UTC)
Received: from VA3EHSMHS003.bigfish.com (unknown [10.7.14.252])	by
	mail116-va3.bigfish.com (Postfix) with ESMTP id 770321C004C	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 13:54:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS003.bigfish.com
	(10.7.99.13) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 11 Jul 2012 13:54:38 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Wed, 11 Jul 2012 08:56:58 -0500
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q6BDuu1C001454;
	Wed, 11 Jul 2012 06:56:57 -0700
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 22:14:03 +0800
Message-ID: <1342016043-29802-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [oe-core v2] task-core-sdk.bb: add libgomp and libgomp-dev by RECOMMENDS
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
X-List-Received-Date: Wed, 11 Jul 2012 14:38:29 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-core/tasks/task-core-sdk.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-sdk.bb b/meta/recipes-core/tasks/task-core-sdk.bb
index ec6cdcc..fe95236 100644
--- a/meta/recipes-core/tasks/task-core-sdk.bb
+++ b/meta/recipes-core/tasks/task-core-sdk.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 DEPENDS = "task-core-console"
-PR = "r7"
+PR = "r8"
 
 ALLOW_EMPTY = "1"
 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
@@ -48,6 +48,10 @@ RDEPENDS_task-core-sdk = "\
     file \
     tcl"
 
+RRECOMMENDS_task-core-sdk = "\
+    libgomp \
+    libgomp-dev"
+
 #python generate_sdk_pkgs () {
 #    poky_pkgs = read_pkgdata('task-core', d)['PACKAGES']
 #    pkgs = d.getVar('PACKAGES', True).split()
-- 
1.7.0.4




