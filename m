Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SM2PG-0006Dw-SU
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Apr 2012 21:25:11 +0200
Received: by mail-vb0-f47.google.com with SMTP id fr13so8416520vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 12:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=dbRv4aouCPQO/lztk+YQfW7wC/O6VprkYghTQq8Up2g=;
	b=oJuEebrhCoGWvYyRL4fky/M7aIC6eC0nQXm6zeC4O1bcPuz07wkfbqcalUMG34jRMi
	IFH3eqIXmmtA2E2HziCLy0MfybNQEaxY0ljuIa96JK0mbZNSsnCNfwWtynw3/phzuLRO
	nr5gh0BQrEtZF1SNbsEayOc2QcLXFB8ikuV2itvi7beUoUXCbQEDxtUok+J8RaD9ORBZ
	aPhKFR5Imsrg+PREkAC+GQA/MnzFNMxoow55pp69j3QBKU+NoyYgYQHXPE+8g7KEVmrx
	rf2ZTa2wa4OL/DMBmDVIKxAw+b2ov+XXibj5TbmxTFesY6QTuI8qddUIPSgcLIyG4KnF
	jBCw==
Received: by 10.52.94.34 with SMTP id cz2mr1238507vdb.100.1335122140510;
	Sun, 22 Apr 2012 12:15:40 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id fd3sm21452715vdc.22.2012.04.22.12.15.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Apr 2012 12:15:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Apr 2012 16:15:26 -0300
Message-Id: <1db29c8298155e247b21addc5d440fb44ad64d09.1335118370.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1335118369.git.otavio@ossystems.com.br>
References: <cover.1335118369.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1335118369.git.otavio@ossystems.com.br>
References: <cover.1335118369.git.otavio@ossystems.com.br>
Subject: [PATCH 5/5] u-boot: add 2012.04 release
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
X-List-Received-Date: Sun, 22 Apr 2012 19:25:11 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-bsp/u-boot/u-boot_2012.04.bb |   30 +++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2012.04.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.bb b/meta/recipes-bsp/u-boot/u-boot_2012.04.bb
new file mode 100644
index 0000000..92c636a
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.bb
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
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.2.5



