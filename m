Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SN82R-00078z-Ab
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 21:38:07 +0200
Received: by vcbfl13 with SMTP id fl13so384179vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 12:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=mBZzaaet0v4S8OhIjyHVaimePcnEkimSkf8qnkEu+NE=;
	b=BJWDRQbVqGFY6muKVQgLc6dK+YzC+Mcdt8FrpWzzX4J4A8WpH9BHsUKAHWyM2f88nI
	bxJc9VY4+4eUl8bl5E+uVBeMLUA2jY7Qdfe/2UlPX8vrLyWHbdbEmzvcfSS0y4LC78V9
	2fbKHRlRJQo7+rxVN3P5XVHThf2UTtrddtilVkDyppw/h4Lo+rISx+NK58TFehnhlgVH
	rHM9yGanNHurqwuTMiZ/G37tLIVRzorqxbxp1KlR/GqJQ+3VfDKKmXcRtNLlJSTZo6ad
	GhBICl1Um+UJUSmMuis5mBOH7oiY/2INcnTKMwwRtFNCx11tkGk7newlToY2XnGm6Pf8
	2mjw==
Received: by 10.220.226.68 with SMTP id iv4mr3817198vcb.21.1335382110776;
	Wed, 25 Apr 2012 12:28:30 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id c17sm886075vdj.12.2012.04.25.12.28.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Apr 2012 12:28:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2012 16:28:09 -0300
Message-Id: <1335382089-18056-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1335382089-18056-1-git-send-email-otavio@ossystems.com.br>
References: <1335382089-18056-1-git-send-email-otavio@ossystems.com.br>
Subject: [PATCH 3/3] u-boot: update 2012.04 to 2012.04.01 release
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
X-List-Received-Date: Wed, 25 Apr 2012 19:38:07 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |   30 ++++++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2012.04.bb    |   30 --------------------------
 2 files changed, 30 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2012.04.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
new file mode 100644
index 0000000..dbdc663
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
@@ -0,0 +1,30 @@
+require u-boot.inc
+
+# This is needs to be validated among supported BSP's before we can
+# make it default
+DEFAULT_PREFERENCE = "-1"
+
+# To build u-boot for your machine, provide the following lines in
+# your machine config, replacing the assignments as appropriate for
+# your machine.
+# UBOOT_MACHINE = "omap3_beagle_config"
+# UBOOT_ENTRYPOINT = "0x80008000"
+# UBOOT_LOADADDRESS = "0x80008000"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
+
+# This revision corresponds to the tag "v2012.04.01"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
+
+PV = "v2012.04.01+git${SRCPV}"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.bb b/meta/recipes-bsp/u-boot/u-boot_2012.04.bb
deleted file mode 100644
index 92c636a..0000000
--- a/meta/recipes-bsp/u-boot/u-boot_2012.04.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-require u-boot.inc
-
-# This is needs to be validated among supported BSP's before we can
-# make it default
-DEFAULT_PREFERENCE = "-1"
-
-# To build u-boot for your machine, provide the following lines in
-# your machine config, replacing the assignments as appropriate for
-# your machine.
-# UBOOT_MACHINE = "omap3_beagle_config"
-# UBOOT_ENTRYPOINT = "0x80008000"
-# UBOOT_LOADADDRESS = "0x80008000"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
-
-# This revision corresponds to the tag "v2012.04"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "2790bf69dc12fb9aeb9836904e5f57c7f83d5552"
-
-PV = "v2012.04+git${SRCPV}"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.2.5



