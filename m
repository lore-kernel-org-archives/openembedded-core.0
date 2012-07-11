Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1SowEK-00067R-PE
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 14:41:20 +0200
Received: from mail105-db3-R.bigfish.com (10.3.81.227) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.23; Wed, 11 Jul 2012 11:42:31 +0000
Received: from mail105-db3 (localhost [127.0.0.1])	by
	mail105-db3-R.bigfish.com (Postfix) with ESMTP id A6E4626042A	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:42:31 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail105-db3 (localhost.localdomain [127.0.0.1]) by mail105-db3
	(MessageSwitch) id 1342006949935377_31159;
	Wed, 11 Jul 2012 11:42:29 +0000 (UTC)
Received: from DB3EHSMHS008.bigfish.com (unknown [10.3.81.245])	by
	mail105-db3.bigfish.com (Postfix) with ESMTP id E2BC61A0046	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:42:29 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS008.bigfish.com
	(10.3.87.108) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 11 Jul 2012 11:42:29 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Wed, 11 Jul 2012 06:44:47 -0500
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q6BBiieb030832;
	Wed, 11 Jul 2012 04:44:45 -0700
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 20:01:51 +0800
Message-ID: <1342008111-24810-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] task-core-sdk.bb: add libgomp and libgomp-dev
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
X-List-Received-Date: Wed, 11 Jul 2012 12:41:20 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-core/tasks/task-core-sdk.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-sdk.bb b/meta/recipes-core/tasks/task-core-sdk.bb
index ec6cdcc..3ee29ce 100644
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
@@ -34,6 +34,8 @@ RDEPENDS_task-core-sdk = "\
     gettext \
     make \
     intltool \
+    libgomp \
+    libgomp-dev \
     libstdc++ \
     libstdc++-dev \
     libtool \
-- 
1.7.0.4




