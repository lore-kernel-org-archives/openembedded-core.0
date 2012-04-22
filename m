Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SM2PG-0006EA-12
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Apr 2012 21:25:10 +0200
Received: by vcbfl13 with SMTP id fl13so8469283vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 12:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=VJY6FM/Y1TCvHS0XHvExL2o6XVLjQBe2Vf+WFdGSmS0=;
	b=IKUoaoQppEOAhy2PB3Tkfz15SeYTSQyF29Klj4V/5fNhP/HB88ToAS/Lz9h22Xc7Ar
	Qs/6qwETrYs3q1wFncY7deYxgAlhhR7o1CoJz/sPRS+lB2dIkOgyl5BCIOJ8LPlZQ92v
	3d2FSI+Y+Nkk8DUgZIh/9/yO/OqP2F98hoCIe534TI6bxMw70CatGaRBDg6z25B66k3W
	Z069SqopB2L0m0tNbGk5PLs9w92CAEaU9pVU98FmVGlSwmFJgwNg+AdfUlwHvl16uRhd
	8JrAAHRQ2WHhUbHXGPL7OsBt6x+udLmaidrGP5bUEM6N+ub7yARC20wMgrFfp5pAbFTv
	KhMA==
Received: by 10.220.154.2 with SMTP id m2mr2602900vcw.55.1335122137328;
	Sun, 22 Apr 2012 12:15:37 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id fd3sm21452715vdc.22.2012.04.22.12.15.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Apr 2012 12:15:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Apr 2012 16:15:24 -0300
Message-Id: <0d6637cfcd02587fe62c2c550aac5a33ce9cc72d.1335118370.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1335118369.git.otavio@ossystems.com.br>
References: <cover.1335118369.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1335118369.git.otavio@ossystems.com.br>
References: <cover.1335118369.git.otavio@ossystems.com.br>
Subject: [PATCH 3/5] u-boot-fw-utils: add 2012.04 release
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
X-List-Received-Date: Sun, 22 Apr 2012 19:25:10 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb
new file mode 100644
index 0000000..5ddb9f9
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb
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
+# This revision corresponds to the tag "v2012.04"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "2790bf69dc12fb9aeb9836904e5f57c7f83d5552"
+
+PV = "v2012.04+git${SRCPV}"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = 'HOSTCC="${CC}"'
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
1.7.2.5



