Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 86433719B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 23:07:19 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1cR5Vg-0002rW-6e from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2017 15:07:20 -0800
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 10 Jan 2017 15:07:17 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2017 17:06:58 -0600
Message-ID: <1484089620-19725-4-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
References: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH 3/5] lttng-modules: upgrade to 2.9.0
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
X-List-Received-Date: Tue, 10 Jan 2017 23:07:19 -0000
Content-Type: text/plain

Switch to using release tarballs.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 .../lttng/{lttng-modules_git.bb => lttng-modules_2.9.0.bb}     | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_git.bb => lttng-modules_2.9.0.bb} (84%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_2.9.0.bb
similarity index 84%
rename from meta/recipes-kernel/lttng/lttng-modules_git.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.9.0.bb
index 8a287131d06d..e59d6bc1379c 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.9.0.bb
@@ -8,20 +8,18 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=362844633a08753bd96ab322a6c7f9f6 \
 
 inherit module
 
-SRCREV = "6e4fc6f36d68fb3c8d40113f8670eb6e9c8ffd76"
-PV = "2.8.0+git${SRCPV}"
-
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 
-SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.8 \
+SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch"
 
+SRC_URI[md5sum] = "717df375ccb6f32bb297cc2f2e692bbf"
+SRC_URI[sha256sum] = "af914e5954081cfb6bd4c6dcf9390474e0c13fe056b12b3dfc86d1b88b8340a0"
+
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
 EXTRA_OEMAKE += "KERNELDIR='${STAGING_KERNEL_DIR}'"
 
-S = "${WORKDIR}/git"
-
 do_install_append() {
 	# Delete empty directories to avoid QA failures if no modules were built
 	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
-- 
2.7.4


