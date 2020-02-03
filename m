Return-Path: <Zhe.He@windriver.com>
X-Greylist: delayed 6935 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Feb 2020 06:47:33 UTC
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94C7460BBC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 06:47:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0136lYQM029939
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 2 Feb 2020 22:47:34 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 2 Feb 2020 22:47:34 -0800
From: <zhe.he@windriver.com>
To: <zhe.he@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Feb 2020 14:47:32 +0800
Message-ID: <20200203064732.3923-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] lttng-modules: update to 2.11.1
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
X-List-Received-Date: Mon, 03 Feb 2020 06:47:33 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Fix build failure with kernel v5.5.
Remove patch as issues fixed upstream.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...modules_2.11.0.bb => lttng-modules_2.11.1.bb} | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.0.bb => lttng-modules_2.11.1.bb} (68%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
similarity index 68%
rename from meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
index 3465a43d38..c833ff7009 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
@@ -11,14 +11,10 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           file://0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch \
-           file://0002-Fix-sunrpc-null-rpc_clnt-dereference-in-rpc_task_que.patch \
-           file://0003-Fix-sunrpc-use-signed-integer-for-client-id.patch \
-           file://0004-sunrpc-introduce-lttng_get_clid-helper.patch \
            "
 
-SRC_URI[md5sum] = "46ec6c566e65cf27b391a1bb643e11b4"
-SRC_URI[sha256sum] = "98af92d8c2e00f4eb63bc637a6967103cf6997434493f36e7a535a491e4fad5f"
+SRC_URI[md5sum] = "0d964723c8765b39835e5e6efc60a604"
+SRC_URI[sha256sum] = "d3e5648937e59dee983ef844f9316c55e9961f9dc8515b9260c473bbb70696c1"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
@@ -35,13 +31,13 @@ python do_package_prepend() {
 }
 
 BBCLASSEXTEND = "devupstream:target"
-LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=c4613d1f8a9587bd7b366191830364b3"
+LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.10 \
+SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.11 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
-SRCREV_class-devupstream = "624aca5d7507fbd11ea4a1a474c3aa1031bd9a31"
-PV_class-devupstream = "2.10.10+git${SRCPV}"
+SRCREV_class-devupstream = "6ad0e68b43c3e52fcb3d47c4d823a7b84aeb443a"
+PV_class-devupstream = "2.11.1+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.17.1


