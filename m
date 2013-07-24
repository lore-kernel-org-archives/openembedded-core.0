Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A11F60629
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 08:02:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6O82iOt010613
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 01:02:44 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 24 Jul 2013 01:02:43 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jul 2013 16:02:46 +0800
Message-ID: <c71e648eb322ca4f57b7bb1c666382b8b5a05666.1374652867.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1374652867.git.rongqing.li@windriver.com>
References: <cover.1374652867.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemu: block to build it on mips64 arch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2013 08:02:43 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

qemu packages can NOT be built for mips64, Set COMPATIBLE_HOST to null to
block build them for such platform.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/qemu/qemu_1.5.0.bb |    2 ++
 meta/recipes-devtools/qemu/qemu_git.bb   |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
index 9b9d0d7..ed6cd2c 100644
--- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
@@ -9,3 +9,5 @@ SRC_URI += "file://fdt_header.patch \
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
 SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
 SRC_URI[sha256sum] = "b22b30ee9712568dfb4eedf76783f4a76546e1cbc41659b909646bcf0b4867bb"
+
+COMPATIBLE_HOST_mips64 = "null"
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index 328e3bf..f061dc9 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -12,3 +12,5 @@ SRC_URI_prepend = "git://git.qemu.org/qemu.git;protocol=git"
 S = "${WORKDIR}/git"
 
 DEFAULT_PREFERENCE = "-1"
+
+COMPATIBLE_HOST_mips64 = "null"
-- 
1.7.10.4


