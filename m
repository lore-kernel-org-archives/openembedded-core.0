Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TsF5p-0000wv-Sx
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 16:58:30 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r07FhFFq014487;
	Mon, 7 Jan 2013 07:43:17 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  7 Jan 2013 10:43:06 -0500
Message-Id: <ab5aea63b975a4ae84de90702af55468a410311a.1357572952.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357572952.git.bruce.ashfield@windriver.com>
References: <cover.1357572952.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1357572952.git.bruce.ashfield@windriver.com>
References: <cover.1357572952.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-libc-headers: make 3.7 the default and remove older libc-header recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 15:58:30 -0000

Switch the default libc-headers to the 3.7 version. At the same time, remove
older versions of the headers to keep things simple and clear. All userspace
and kernel combinations should build and boot against this single lib-headers
version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                     |    2 +-
 .../linux-libc-headers/linux-libc-headers_3.0.8.bb              |    7 -------
 .../recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.bb |    6 ------
 .../linux-libc-headers/linux-libc-headers_3.4.3.bb              |    6 ------
 4 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1d6cd8b..8f3ba2b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.23.1"
 EGLIBCVERSION ?= "2.16"
 UCLIBCVERSION ?= "0.9.33"
-LINUXLIBCVERSION ?= "3.4.3"
+LINUXLIBCVERSION ?= "3.7"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
deleted file mode 100644
index 7bb5895..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require linux-libc-headers.inc
-
-PR = "r1"
-
-SRC_URI += " file://connector-msg-size-fix.patch"
-SRC_URI[md5sum] = "eac4d398a0ecd98214487cd47a228998"
-SRC_URI[sha256sum] = "4ed16da319848f681f711dbda2ac2cf1b306a280ec22f90bae190cf23b533add"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.bb
deleted file mode 100644
index 9bee02b..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require linux-libc-headers.inc
-
-PR = "r1"
-
-SRC_URI[md5sum] = "7ceb61f87c097fc17509844b71268935"
-SRC_URI[sha256sum] = "c881fc2b53cf0da7ca4538aa44623a7de043a41f76fd5d0f51a31f6ed699d463"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
deleted file mode 100644
index 6f8d9e8..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require linux-libc-headers.inc
-
-PR = "r0"
-
-SRC_URI[md5sum] = "3aefa02db55715d627ed23a01667057d"
-SRC_URI[sha256sum] = "17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc"
-- 
1.7.10.4



