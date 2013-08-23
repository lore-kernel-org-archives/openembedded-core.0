Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 63E6F6B9EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:08:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7NI8gMU008129
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2013 11:08:42 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 23 Aug 2013 11:08:40 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 23 Aug 2013 14:08:18 -0400
Message-ID: <46a124834eb1e8b047e061ba0cbcd6db32cc97d2.1377280429.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377280429.git.bruce.ashfield@windriver.com>
References: <cover.1377280429.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-libc-headers: update to v3.10
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
X-List-Received-Date: Fri, 23 Aug 2013 18:08:42 -0000
Content-Type: text/plain

Now that the 3.10 kernel has been released we can bump the libc-headers to
that version and remove the 3.8 variant. Userspace compatibility is
maintained through kernel versions, we also make the single 3.10 version the
toolchain default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                    |    2 +-
 .../linux-libc-headers/linux-libc-headers_3.10.bb              |    7 +++++++
 .../linux-libc-headers/linux-libc-headers_3.8.bb               |    8 --------
 3 files changed, 8 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.8.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index aa0db25..fb41d5e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.23.2"
 EGLIBCVERSION ?= "2.18"
 UCLIBCVERSION ?= "0.9.33+git%"
-LINUXLIBCVERSION ?= "3.8"
+LINUXLIBCVERSION ?= "3.10"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
new file mode 100644
index 0000000..eb04367
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
@@ -0,0 +1,7 @@
+require linux-libc-headers.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "72d0a9b3e60cd86fabcd3f24b1708944"
+SRC_URI[sha256sum] = "46c9e55e1fddf40813b8d697d5645037a8e2af5c1a8dff52b3fe82b5021582b8"
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.8.bb
deleted file mode 100644
index 5672bd4..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.8.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require linux-libc-headers.inc
-
-SRC_URI += "file://scripts-Makefile.headersinst-install-headers-from-sc.patch"
-
-PR = "r0"
-
-SRC_URI[md5sum] = "fcd1d2e60e1033c935a13ef81c89ea2d"
-SRC_URI[sha256sum] = "fce774b5313e73949cb35f128e91e7b2ccd7fa2438abc5cff69267e504395a45"
-- 
1.7.10.4


