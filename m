Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6323A7BFF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:00:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI70jFq016601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 23:00:45 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:00:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 15:18:02 +0800
Message-ID: <b8d8d675395c7034eea342f1d91f055f8a9d63d2.1545102457.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545102457.git.liezhi.yang@windriver.com>
References: <cover.1545102457.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 02/11] ccache: 3.4.2 -> 3.5
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
X-List-Received-Date: Tue, 18 Dec 2018 07:00:45 -0000
Content-Type: text/plain

The LIC_FILES_CHKSUM is changed because copyright year and zlib version
are changed, others are still the same.

This version supports CCACHE_DEBUG which will make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ccache/ccache_3.4.2.bb | 11 -----------
 meta/recipes-devtools/ccache/ccache_3.5.bb   | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.4.2.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.5.bb

diff --git a/meta/recipes-devtools/ccache/ccache_3.4.2.bb b/meta/recipes-devtools/ccache/ccache_3.4.2.bb
deleted file mode 100644
index 921dc3b..0000000
--- a/meta/recipes-devtools/ccache/ccache_3.4.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=2722abeaf1750dbf175b9491112374e1"
-
-SRC_URI[md5sum] = "07d4324efbb3c216bbd1c512f4553480"
-SRC_URI[sha256sum] = "b2264923c63e2b90a17cf56acb1df3f4229c416fb88e476e5ec7e02919d319c3"
-
-SRC_URI += " \
-            file://0002-dev.mk.in-fix-file-name-too-long.patch \
-"
diff --git a/meta/recipes-devtools/ccache/ccache_3.5.bb b/meta/recipes-devtools/ccache/ccache_3.5.bb
new file mode 100644
index 0000000..89062c4
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.5.bb
@@ -0,0 +1,11 @@
+require ccache.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=39f34d6ff4df51ed718fd7d243fc4e51"
+
+SRC_URI[md5sum] = "6e62bf2fd2c8fdc749efdca74868da41"
+SRC_URI[sha256sum] = "8094f9bc186be4c9db9b480eeac280926bd44039502d1e596f45371b05a85918"
+
+SRC_URI += " \
+            file://0002-dev.mk.in-fix-file-name-too-long.patch \
+"
-- 
2.7.4


