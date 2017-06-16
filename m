Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DA2FC78518
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 21:40:06 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1dLyyO-0001vV-MK from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Jun 2017 14:40:08 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 16 Jun 2017 14:40:06 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jun 2017 16:39:52 -0500
Message-ID: <20170616213952.35679-4-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170616213952.35679-1-nathan_lynch@mentor.com>
References: <20170616213952.35679-1-nathan_lynch@mentor.com>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH 3/3] lttng-modules: update to 2.9.3
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
X-List-Received-Date: Fri, 16 Jun 2017 21:40:06 -0000
Content-Type: text/plain

Miscellaneous fixes and support for 4.12-rc kernels.
---
 .../lttng/{lttng-modules_2.9.2.bb => lttng-modules_2.9.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.9.2.bb => lttng-modules_2.9.3.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.9.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.9.3.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-modules_2.9.2.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.9.3.bb
index 9b21bb40dcfd..acd76b54b30d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.9.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.9.3.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch"
 
-SRC_URI[md5sum] = "6c02645c77fd4d6475a4f83bda1d75ff"
-SRC_URI[sha256sum] = "9d70d54becd8c34c21eb0d5c1ffe6adadb6be5bec80b6667044c47dfd428dc66"
+SRC_URI[md5sum] = "9abf694dddcc197988189ef65b496f4c"
+SRC_URI[sha256sum] = "f911bca81b02a787474f3d100390dad7447f952525e6d041f50991940246bafe"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.9.4


