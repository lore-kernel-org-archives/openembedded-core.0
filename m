Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcQnK-0004mS-EH
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:37:14 +0200
Received: by iwn4 with SMTP id 4so2604243iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 16:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=U9IksSD0ceaNfnxd7mYKDI/8ePWB4wlTH6aBt5Oevrs=;
	b=GrHKFKzSXBkys5o0EmME+FPiQbdgK5fL8aFph0TKqvZjvoRHbWPCWAkDHZ9QFekKaj
	5d0Ty1FRWQ7VeWn2D2Sh6C1mRHroXG0Wi70zkQt+pZxdi7/rVUiRomkc5fFq/9pQbhWo
	DclnyWuUhekSqCAwHdyk0z6YjmIKUvekv+JMU=
Received: by 10.42.144.195 with SMTP id c3mr2820975icv.9.1309476809690;
	Thu, 30 Jun 2011 16:33:29 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id e1sm2643797icv.20.2011.06.30.16.33.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 16:33:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 16:33:17 -0700
Message-Id: <1309476797-16325-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] uclibc: Add default uClibc.machine files
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
X-List-Received-Date: Thu, 30 Jun 2011 23:37:14 -0000

Add generic machine config file

uClibc.machine in topdir should work mostly
and odd ones like mips should have a copy
of their own as explained

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-git/mips/uClibc.machine          |   16 ++++++++++++++++
 meta/recipes-core/uclibc/uclibc-git/uClibc.machine |   14 ++++++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/uClibc.machine

diff --git a/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
new file mode 100644
index 0000000..7d7ab3f
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
@@ -0,0 +1,16 @@
+# in OE we use TARGET_CC_ARCH="-march=mips32" but by
+# default uclibc uses mips1 ISA for o32 ABI which ends
+# up with conflicting march options to gcc. Here we
+# ask for MIPS32 ISA to match the OE defaults
+
+CONFIG_MIPS_ISA_MIPS32=y
+
+# Below options are exact copy of general
+# uClibc.machine file
+#
+FORCE_OPTIONS_FOR_ARCH=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/uClibc.machine
new file mode 100644
index 0000000..595f444
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.machine
@@ -0,0 +1,14 @@
+#
+# Automatically generated make config: don't edit
+# Version: 0.9.32-git
+# Mon Jul 19 01:34:29 2010
+#
+#
+# Using ELF file format
+#
+FORCE_OPTIONS_FOR_ARCH=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
-- 
1.7.4.1



