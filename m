Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <woglinde@rhein.zuhause.netz>) id 1R7ug6-0007nF-Bj
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 21:47:54 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 19A7B1100120;
	Sun, 25 Sep 2011 21:42:33 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 93A301100245;
	Sun, 25 Sep 2011 21:42:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g225144251.adsl.alicedsl.de
	[92.225.144.251]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sun, 25 Sep 2011 21:42:30 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 1CE163000D; Sun, 25 Sep 2011 21:42:30 +0200 (CEST)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 21:42:24 +0200
Message-Id: <1316979745-758-3-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.6.3
In-Reply-To: <1316979745-758-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1316979745-758-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 2/3] feature-arm-d16.inc: add feature for arm cores which do not have a neon unit or no support for it in the kernel
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
X-List-Received-Date: Sun, 25 Sep 2011 19:47:54 -0000

* call it d16 because of the -mfpu=vfpv3-d16 gcc option and
  avoid naming conflicts with vfp feature

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 meta/conf/machine/include/arm/feature-arm-d16.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/feature-arm-d16.inc

diff --git a/meta/conf/machine/include/arm/feature-arm-d16.inc b/meta/conf/machine/include/arm/feature-arm-d16.inc
new file mode 100644
index 0000000..1230ee9
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-d16.inc
@@ -0,0 +1,3 @@
+TUNEVALID[d16] = "Enable SIMD accelerator unit on cores which don't have neon."
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "d16", "-mfpu=vfpv3-d16", "" ,d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "d16", "-d16", "" ,d)}"
-- 
1.7.6.3


