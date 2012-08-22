Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4FPp-0004wO-VB
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 20:12:30 +0200
Received: by daks35 with SMTP id s35so946910dak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=njT2t3KN7vBElgcs6nHnJzXZMXcSi0u4nLbPaagWDh8=;
	b=Rzz6Hg2PsSlBR5xIUTbPkbGj2GlxFu6QDF2QiW9k9zl3MLJRFrxeEvw8L08YCCMTI7
	bLHziiJvwq0Bwp3Y6NplbwUFMYZy5gAWJI0NCY+2/uw7M40nSOgexPb5xDOLuwh4SGvi
	X/NLe2judcP08z+Zzog73+KMnguqs8XTwD0T5TdN2X633/KvBneSSnNY8CjaH7Y9ncaG
	dMh/CNBwD7w/lcGH1PmaWpB+Qhr6xiXoW+3gqClDtSN8RWlh/7X1nqGp3oYOkmfyZVQp
	30aZw/nteMEmPfX846PNzaXjzJH4xflST0wXkN60/xtNGVrC/fwOCXQI876SsNTQo/GJ
	c4oQ==
Received: by 10.68.136.137 with SMTP id qa9mr54447536pbb.140.1345658423867;
	Wed, 22 Aug 2012 11:00:23 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pn4sm4142276pbb.50.2012.08.22.11.00.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 11:00:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2012 10:59:47 -0700
Message-Id: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/4] runqemu: Honor KERNEL and ROOTFS settings from environment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 18:12:30 -0000

Expand the usage to be able to specify KERNEL and ROOTFS
on commandline. This helps in using the script for booting
images that are essentially not part of OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 90998ae..290f9cc 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -54,9 +54,9 @@ error() {
 }
 
 MACHINE=${MACHINE:=""}
-KERNEL=""
+KERNEL=${KERNEL:=""}
+ROOTFS=${ROOTFS:=""}
 FSTYPE=""
-ROOTFS=""
 LAZY_ROOTFS=""
 SCRIPT_QEMU_OPT=""
 SCRIPT_QEMU_EXTRA_OPT=""
-- 
1.7.9.5



