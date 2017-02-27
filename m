Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8EB73070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 03:10:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1R3ABuq006071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 26 Feb 2017 19:10:11 -0800
Received: from yow-dellw-nn.wrs.com (128.224.56.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 26 Feb 2017 19:10:10 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 26 Feb 2017 22:10:03 -0500
Message-ID: <96048f55609e57915ac6602f92d0dd3d25cd6f8d.1488164498.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1488164498.git.bruce.ashfield@windriver.com>
References: <cover.1488164498.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/4] libc-headers: introduce 4.10 and set as default
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
X-List-Received-Date: Mon, 27 Feb 2017 03:10:12 -0000
Content-Type: text/plain

The 4.10 kernel has been released, so we can bump our libc-headers
to match.

We also drop the 4.9 headers, since we only want one variant in the
tree.

Tested against glibc and muslc core-image* variants.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                           | 2 +-
 .../{linux-libc-headers_4.9.bb => linux-libc-headers_4.10.bb}         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.9.bb => linux-libc-headers_4.10.bb} (66%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 9c9fdd67fd08..a4b06c94cadc 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -28,7 +28,7 @@ BINUVERSION ?= "2.27%"
 GDBVERSION ?= "7.12%"
 GLIBCVERSION ?= "2.25"
 UCLIBCVERSION ?= "1.0%"
-LINUXLIBCVERSION ?= "4.9%"
+LINUXLIBCVERSION ?= "4.10%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
similarity index 66%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
index 0a44018f880b..108446aa34f7 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
@@ -6,5 +6,5 @@ SRC_URI_append_libc-musl = "\
     file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
    "
 
-SRC_URI[md5sum] = "0a68ef3615c64bd5ee54a3320e46667d"
-SRC_URI[sha256sum] = "029098dcffab74875e086ae970e3828456838da6e0ba22ce3f64ef764f3d7f1a"
+SRC_URI[md5sum] = "b5e7f6b9b2fe1b6cc7bc56a3a0bfc090"
+SRC_URI[sha256sum] = "3c95d9f049bd085e5c346d2c77f063b8425f191460fcd3ae9fe7e94e0477dc4b"
-- 
2.5.0


