Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T2Puv-0003DS-Ll
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 19:01:01 +0200
Received: by pbcwy7 with SMTP id wy7so4180566pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 09:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=liX82YtCW2biIAvZ3wHOhvR3kyHfYrbVl4bqQe0TNVU=;
	b=g0UUmyPppuAyUzKjiCSyXuLJAY2F+t1Vt+7W42JBUV1aQYCDPMPlZRL4q3UrvkXcVn
	H/pZNHgbwo9O0FAZyFhZfyiUEQ6Lgu2ZvtQ7OAzWQmDJs8azALQKwvn3rpaGaiSxpE27
	W7SGM+EdkSlh8l+gQGRZHojagg3S3a/Ctrfw1X8sCunBL8AXAVWxze1V29ykPtAn5P2i
	IeGfxjnwLptU+uJnp57cQSj/flL1k0a3EsFHxPMU9c0wJQrO6bhWBgpdqvdKeTK/VIeD
	8CxSLcDtYDxFZG6GfVBA15VtRcxKX2TC2eMc0hTdiO+UTsFpDRyAHNScHry2Z9RI+YLj
	Sq4A==
Received: by 10.68.193.196 with SMTP id hq4mr13238861pbc.32.1345222142214;
	Fri, 17 Aug 2012 09:49:02 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id vh7sm5248664pbc.22.2012.08.17.09.49.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 09:49:01 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 09:48:54 -0700
Message-Id: <1345222136-24839-3-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345222136-24839-1-git-send-email-trini@ti.com>
References: <1345222136-24839-1-git-send-email-trini@ti.com>
Subject: [PATCH 3/5] u-boot-fw-utils: Update to v2012.07
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
X-List-Received-Date: Fri, 17 Aug 2012 17:01:02 -0000

Signed-off-by: Tom Rini <trini@ti.com>
---
 .../u-boot/u-boot-fw-utils_2012.04.01.bb           |   35 --------------------
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.07.bb |   33 ++++++++++++++++++
 2 files changed, 33 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.07.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
deleted file mode 100644
index 364f8a5..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-SECTION = "bootloader"
-
-DEPENDS = "mtd-utils"
-
-PR = "r1"
-
-# This is needs to be validated among supported BSP's before we can
-# make it default
-DEFAULT_PREFERENCE = "-1"
-
-# This revision corresponds to the tag "v2012.04.01"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
-
-PV = "v2012.04.01+git${SRCPV}"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
-
-do_compile () {
-  oe_runmake env
-}
-
-do_install () {
-  install -d ${D}${base_sbindir}
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
-}
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.07.bb
new file mode 100644
index 0000000..8ec8ac1
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.07.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+SECTION = "bootloader"
+
+DEPENDS = "mtd-utils"
+
+# This is needs to be validated among supported BSP's before we can
+# make it default
+DEFAULT_PREFERENCE = "-1"
+
+# This revision corresponds to the tag "v2012.07"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "190649fb4309d1bc0fe7732fd0f951cb6440f935"
+
+PV = "v2012.07+git${SRCPV}"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
+
+do_compile () {
+  oe_runmake env
+}
+
+do_install () {
+  install -d ${D}${base_sbindir}
+  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+}
-- 
1.7.9.5



