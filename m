Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B501F65CC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 16:31:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0KGVR7B005217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Jan 2016 08:31:27 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 20 Jan 2016 08:31:26 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 20 Jan 2016 11:31:24 -0500
Message-ID: <d47b79cddcf01b2b333a7004d205d9c0f09a1a68.1453304929.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1453304929.git.bruce.ashfield@windriver.com>
References: <cover.1453304929.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-libc-headers: update to 4.4
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
X-List-Received-Date: Wed, 20 Jan 2016 16:31:29 -0000
Content-Type: text/plain

Updating the lib-headers to match the 4.4 LTSI kernel version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                      | 2 +-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb | 4 ----
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb | 4 ++++
 3 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6df737c53063..9010127a2afd 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -28,7 +28,7 @@ BINUVERSION ?= "2.25%"
 GDBVERSION ?= "7.10%"
 GLIBCVERSION ?= "2.22"
 UCLIBCVERSION ?= "1.0%"
-LINUXLIBCVERSION ?= "4.1"
+LINUXLIBCVERSION ?= "4.4"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
deleted file mode 100644
index 01037c10bf8b..000000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require linux-libc-headers.inc
-
-SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
-SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb
new file mode 100644
index 000000000000..4433db75151e
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb
@@ -0,0 +1,4 @@
+require linux-libc-headers.inc
+
+SRC_URI[md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
+SRC_URI[sha256sum] = "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
-- 
2.1.0


