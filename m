Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1U6qgu-0004aW-LO
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 23:57:11 +0100
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id E55802543431;
	Sat, 16 Feb 2013 22:57:09 +0000 (UTC)
Received: from localhost.lan ([127.0.0.1] helo=xiaoyu.lan)
	by sangmingze-mail.local with esmtp (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>)
	id 1U6qRK-0000bM-Dx; Sat, 16 Feb 2013 23:41:02 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2013 23:41:00 +0100
Message-Id: <1361054460-21397-1-git-send-email-holger@moiji-mobile.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Subject: [PATCH] conf: Remove unused ROOT_FLASH_SIZE variable from the config
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
X-List-Received-Date: Sat, 16 Feb 2013 22:57:12 -0000

This variable is set but never used in OE-core and meta-oe. It
was historically used for the Opie collection but seems to be
unused now.
---
 meta/conf/bitbake.conf             |    3 ---
 meta/conf/machine/include/qemu.inc |    2 --
 2 files changed, 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5f4a412..b1c8dac 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -721,9 +721,6 @@ OES_BITBAKE_CONF = "1"
 
 DISTRO_FEATURES ?= ""
 
-# This is used to limit what packages goes into images built, so set big by default
-ROOT_FLASH_SIZE ?= "256"
-
 DISTRO_EXTRA_RDEPENDS ?= ""
 DISTRO_EXTRA_RRECOMMENDS ?= ""
 MACHINE_EXTRA_RDEPENDS ?= ""
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index f68bf32..52215b3 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -16,8 +16,6 @@ MACHINEOVERRIDES .= ":qemuall"
 
 IMAGE_FSTYPES += "tar.bz2 ext3"
 
-ROOT_FLASH_SIZE = "280"
-
 # Don't include kernels in standard images
 RDEPENDS_kernel-base = ""
 
-- 
1.7.10.4



