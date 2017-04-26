Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5FDC677D0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 21:54:04 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1d3Usv-0002ni-W3 from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Apr 2017 14:54:06 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 26 Apr 2017 14:54:03 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Apr 2017 16:54:01 -0500
Message-ID: <20170426215401.35981-1-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH] lttng-modules: update to 2.9.2
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
X-List-Received-Date: Wed, 26 Apr 2017 21:54:06 -0000
Content-Type: text/plain

This version bump adds support for Linux 4.11.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 .../lttng/{lttng-modules_2.9.1.bb => lttng-modules_2.9.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.9.1.bb => lttng-modules_2.9.2.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.9.2.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.9.2.bb
index abff79d06f26..50426a49abca 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.9.2.bb
@@ -13,8 +13,8 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch"
 
-SRC_URI[md5sum] = "5a16bca52233cc2bdff572b1120a88f6"
-SRC_URI[sha256sum] = "62078fe3254ca65969db4b72e59042cd797dbf2740848f8f82384877ae460d54"
+SRC_URI[md5sum] = "6c02645c77fd4d6475a4f83bda1d75ff"
+SRC_URI[sha256sum] = "9d70d54becd8c34c21eb0d5c1ffe6adadb6be5bec80b6667044c47dfd428dc66"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.9.3


