Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D48AE79617
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:00:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7OF0H4a012341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 08:00:17 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 08:00:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Aug 2018 10:59:56 -0400
Message-ID: <36572836163ff6dd1f145dc8c86d1e593bc0293b.1535118570.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535118570.git.bruce.ashfield@windriver.com>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/12] lttng: uprev to 2.10.7
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
X-List-Received-Date: Fri, 24 Aug 2018 15:00:17 -0000
Content-Type: text/plain

Uprev'ing lttng to 2.10.7 to support 4.18+ kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../lttng/{lttng-modules_2.10.6.bb => lttng-modules_2.10.7.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.6.bb => lttng-modules_2.10.7.bb} (85%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
similarity index 85%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
index d9d5588f9ac9..4f14106047e4 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.7.bb
@@ -11,14 +11,14 @@ inherit module
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 
+#https://lttng.org/files/lttng-modules/lttng-modules-2.10.7.tar.bz2
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
-           file://0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch \
 "
 
-SRC_URI[md5sum] = "8110099f4615fc89a74ffe9189b56cfc"
-SRC_URI[sha256sum] = "04a080c81743eb29d181bac29ceb0c15819a2f4210793f2cc9958d885435029f"
+SRC_URI[md5sum] = "d3cb4520948083bf1573a2e4cb7406aa"
+SRC_URI[sha256sum] = "f049428d3d131e103a7a7038d184731bf7bcdce00503fc19a2c9b5693ecbb3b5"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.5.0


