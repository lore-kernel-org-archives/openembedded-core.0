Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 081986FF78
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 04:29:49 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1chqT1-0004uO-Mh from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2017 20:29:51 -0800
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Sat, 25 Feb 2017 20:29:48 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Feb 2017 22:29:44 -0600
Message-ID: <20170226042945.40308-1-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH 1/2] lttng-modules: update to 2.9.1
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
X-List-Received-Date: Sun, 26 Feb 2017 04:29:51 -0000
Content-Type: text/plain

This includes a significant fix for kernel tracing on 32-bit systems;
kernel and user space events may be uncorrelated without it.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 .../lttng/{lttng-modules_2.9.0.bb => lttng-modules_2.9.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.9.0.bb => lttng-modules_2.9.1.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.9.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-modules_2.9.0.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb
index e59d6bc1379c..8e47c6f0a1bc 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.9.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb
@@ -13,8 +13,8 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch"
 
-SRC_URI[md5sum] = "717df375ccb6f32bb297cc2f2e692bbf"
-SRC_URI[sha256sum] = "af914e5954081cfb6bd4c6dcf9390474e0c13fe056b12b3dfc86d1b88b8340a0"
+SRC_URI[md5sum] = "5a16bca52233cc2bdff572b1120a88f6"
+SRC_URI[sha256sum] = "62078fe3254ca65969db4b72e59042cd797dbf2740848f8f82384877ae460d54"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.9.3


