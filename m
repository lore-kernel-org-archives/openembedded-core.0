Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A73977697
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:49:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBMEnNjM022609
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 22 Dec 2016 06:49:23 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Dec 2016 06:49:23 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 22 Dec 2016 09:49:19 -0500
Message-ID: <81c86de3aa3411f52e74b41b324c0713b347f245.1482415485.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1482415485.git.bruce.ashfield@windriver.com>
References: <cover.1482415485.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-libc-headers: introduce 4.9 headers
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
X-List-Received-Date: Thu, 22 Dec 2016 14:49:24 -0000
Content-Type: text/plain

Bumping the linux-libc-headers to the 4.9 kernel variant. Since 4.9
will be a LTSI kernel, and there will be an associated linux-yocto
it is worth moving to these headers sooner rather than later.

This commit also drops the 4.8 headers and sets 4.9 to be the default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                         | 2 +-
 .../{linux-libc-headers_4.8.bb => linux-libc-headers_4.9.bb}        | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.8.bb => linux-libc-headers_4.9.bb} (64%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index ca3c5ec90a5f..836adaf9dddb 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -28,7 +28,7 @@ BINUVERSION ?= "2.27%"
 GDBVERSION ?= "7.11%"
 GLIBCVERSION ?= "2.24"
 UCLIBCVERSION ?= "1.0%"
-LINUXLIBCVERSION ?= "4.8%"
+LINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
similarity index 64%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
index 77e0870d326f..0a44018f880b 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
@@ -1,12 +1,10 @@
 require linux-libc-headers.inc
 
-PV = "4.8"
-
 SRC_URI_append_libc-musl = "\
     file://0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch \
     file://0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch \
     file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
    "
 
-SRC_URI[md5sum] = "c1af0afbd3df35c1ccdc7a5118cd2d07"
-SRC_URI[sha256sum] = "3e9150065f193d3d94bcf46a1fe9f033c7ef7122ab71d75a7fb5a2f0c9a7e11a"
+SRC_URI[md5sum] = "0a68ef3615c64bd5ee54a3320e46667d"
+SRC_URI[sha256sum] = "029098dcffab74875e086ae970e3828456838da6e0ba22ce3f64ef764f3d7f1a"
-- 
2.5.0


