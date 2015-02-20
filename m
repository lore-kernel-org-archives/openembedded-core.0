Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2F77368B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 18:38:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1KIc5xn015755
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Feb 2015 10:38:05 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 20 Feb 2015 10:38:05 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 20 Feb 2015 13:37:59 -0500
Message-ID: <ee39811c9dc775643ee7f743ef26fbaf684f8590.1424456540.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424456540.git.bruce.ashfield@windriver.com>
References: <cover.1424456540.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-libc-headers: update to 3.19
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
X-List-Received-Date: Fri, 20 Feb 2015 18:38:12 -0000
Content-Type: text/plain

Updating the libc-headers now that the kernel has released.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                        | 2 +-
 .../recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb | 7 -------
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb  | 7 +++++++
 3 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 9e25bf0225de..6b602d2f9412 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.24"
 GLIBCVERSION ?= "2.21"
 UCLIBCVERSION ?= "0.9.33+git%"
-LINUXLIBCVERSION ?= "3.17.7"
+LINUXLIBCVERSION ?= "3.19"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb
deleted file mode 100644
index 73325973326f..000000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-KORG_ARCHIVE_COMPRESSION = "xz"
-
-require linux-libc-headers.inc
-
-SRC_URI[md5sum] = "59cc7d0a236b08de743d6d9421f0f2c6"
-SRC_URI[sha256sum] = "a3c8e6aee912bfd2e69abf9df5a06058434a8771bcaa1784b5980bf1b5298e1c"
-
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb
new file mode 100644
index 000000000000..078df4512ba1
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.19.bb
@@ -0,0 +1,7 @@
+KORG_ARCHIVE_COMPRESSION = "xz"
+
+require linux-libc-headers.inc
+
+SRC_URI[md5sum] = "d3fc8316d4d4d04b65cbc2d70799e763"
+SRC_URI[sha256sum] = "be42511fe5321012bb4a2009167ce56a9e5fe362b4af43e8c371b3666859806c"
+
-- 
2.1.0


