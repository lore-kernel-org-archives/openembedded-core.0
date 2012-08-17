Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T2Puv-0003DQ-98
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 19:01:01 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so4180511pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=kUlxkn/xnt+zBCD7xHEcM3A3c30uQ+NNfDbcFJnlWGY=;
	b=FGBKcgKkzmtVKB/qehb+TJ/OojivnsghiJ5V978+b0DW4gm6l4KPadQ8UlCpGpll6F
	F6Qyo+/Mz5KZVOQGByitgjRij//oHqThFpoHh/iGJA+T8S6SnfTs+rTpFM9OIObpvV1F
	Q05Sf6P/1jPSzfyMqcVVF/15+2F8iWKazKZojVWmVIMEbmowkjZGKJGFBISY27jconkN
	jZLzUeRekMtS1UcQL3z1jbhyUIeMEiAc7maEDM3XVpUtZibQqBQFk0lrPbmPJ/0Aiq39
	eQr9azcH0/G6gQagwkNJGe21T94iXAYiwz787gTttMUfr50GcYVD5DWboRZa2r4Fk9yr
	lZMg==
Received: by 10.68.234.169 with SMTP id uf9mr6164344pbc.105.1345222144402;
	Fri, 17 Aug 2012 09:49:04 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id vh7sm5248664pbc.22.2012.08.17.09.49.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 09:49:03 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 09:48:56 -0700
Message-Id: <1345222136-24839-5-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345222136-24839-1-git-send-email-trini@ti.com>
References: <1345222136-24839-1-git-send-email-trini@ti.com>
Subject: [PATCH 5/5] u-boot: Update to v2012.07
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
X-List-Received-Date: Fri, 17 Aug 2012 17:01:01 -0000

Signed-off-by: Tom Rini <trini@ti.com>
---
 meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |   29 --------------------------
 meta/recipes-bsp/u-boot/u-boot_2012.07.bb    |   29 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2012.07.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
deleted file mode 100644
index c4ec50d..0000000
--- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
+++ /dev/null
@@ -1,29 +0,0 @@
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
-# This revision corresponds to the tag "v2012.04.01"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
-
-PV = "v2012.04.01+git${SRCPV}"
-PR = "r1"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.07.bb b/meta/recipes-bsp/u-boot/u-boot_2012.07.bb
new file mode 100644
index 0000000..91f32e6
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2012.07.bb
@@ -0,0 +1,29 @@
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
+# This revision corresponds to the tag "v2012.07"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "190649fb4309d1bc0fe7732fd0f951cb6440f935"
+
+PV = "v2012.07+git${SRCPV}"
+PR = "r1"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.9.5



