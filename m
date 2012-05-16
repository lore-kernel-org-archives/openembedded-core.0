Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19406@freescale.com>) id 1SUkQ2-0000Ij-4M
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 22:01:58 +0200
Received: from mail77-tx2-R.bigfish.com (10.9.14.243) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Wed, 16 May 2012 19:51:49 +0000
Received: from mail77-tx2 (localhost [127.0.0.1])	by mail77-tx2-R.bigfish.com
	(Postfix) with ESMTP id 1FE9C440120;
	Wed, 16 May 2012 19:51:49 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bh8275dhz2dh2a8h668h839hd24he5bh)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail77-tx2 (localhost.localdomain [127.0.0.1]) by mail77-tx2
	(MessageSwitch) id 1337197906923594_1348;
	Wed, 16 May 2012 19:51:46 +0000 (UTC)
Received: from TX2EHSMHS014.bigfish.com (unknown [10.9.14.242])	by
	mail77-tx2.bigfish.com (Postfix) with ESMTP id DABFA48004E;
	Wed, 16 May 2012 19:51:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS014.bigfish.com
	(10.9.99.114) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 16 May 2012 19:51:43 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Wed, 16 May 2012 14:51:49 -0500
Received: from yocto-build.am.freescale.net (yocto-build.am.freescale.net
	[10.81.4.202])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP
	id q4GJpjkO021953;	Wed, 16 May 2012 12:51:49 -0700
From: Daiane Angolini <daiane.angolini@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 May 2012 14:51:40 -0500
Message-ID: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Daiane Angolini <daiane.angolini@freescale.com>
Subject: [PATCH] evtest: Add evtest 1.30 support
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
X-List-Received-Date: Wed, 16 May 2012 20:01:58 -0000
Content-Type: text/plain

Port recipe from Meta-OE at 4bf0e7e02544e9ffa54aa0ead966c411d7dbd0be
and update to version 1.30 using FreeDesktop GIT as source.

Signed-off-by: Daiane Angolini <daiane.angolini@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-support/evtest/evtest_1.30.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/evtest/evtest_1.30.bb

diff --git a/meta/recipes-support/evtest/evtest_1.30.bb b/meta/recipes-support/evtest/evtest_1.30.bb
new file mode 100644
index 0000000..222d839
--- /dev/null
+++ b/meta/recipes-support/evtest/evtest_1.30.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Simple tool for input event debugging."
+HOMEPAGE = "http://people.freedesktop.org/~whot/evtest/"
+AUTHOR = "Vojtech Pavlik <vojtech@suse.cz>"
+SECTION = "console/utils"
+DEPENDS = "libxml2"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRCREV = "e7dd232287764c0533ea89247ff907f350a12016"
+SRC_URI = "git://anongit.freedesktop.org/evtest;protocol=git"
+S = "${WORKDIR}/git"
+
+inherit autotools
+
-- 
1.7.5.4




