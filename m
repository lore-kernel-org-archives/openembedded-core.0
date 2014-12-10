Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 709C272512
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:16:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAEGLbh014093
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 06:16:21 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.92.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 06:16:20 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 09:16:09 -0500
Message-ID: <b18c4c9970004784d031a0776245fad792fc6a28.1418220684.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418220684.git.bruce.ashfield@windriver.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-libc-headers: update to 3.17
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
X-List-Received-Date: Wed, 10 Dec 2014 14:16:30 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                       | 2 +-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb | 7 -------
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb | 7 +++++++
 3 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 99d6df9c182a..1ee3c6a768cd 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.24"
 GLIBCVERSION ?= "2.20"
 UCLIBCVERSION ?= "0.9.33+git%"
-LINUXLIBCVERSION ?= "3.16"
+LINUXLIBCVERSION ?= "3.17"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb
deleted file mode 100644
index cedaced2da50..000000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-KORG_ARCHIVE_COMPRESSION = "xz"
-
-require linux-libc-headers.inc
-
-SRC_URI[md5sum] = "5c569ed649a0c9711879f333e90c5386"
-SRC_URI[sha256sum] = "4813ad7927a7d92e5339a873ab16201b242b2748934f12cb5df9ba2cfe1d77a0"
-
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb
new file mode 100644
index 000000000000..3417697ed3de
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb
@@ -0,0 +1,7 @@
+KORG_ARCHIVE_COMPRESSION = "xz"
+
+require linux-libc-headers.inc
+
+SRC_URI[md5sum] = "fb30d0f29214d75cddd2faa94f73d5cf"
+SRC_URI[sha256sum] = "f5153ec93c5fcd41b247950e6a9bcbc63fa87beafd112c133a622439a0f76251"
+
-- 
2.1.0


