Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D8C278257
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 02:58:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L2wTCV017250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Aug 2017 19:58:29 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 20 Aug 2017 19:58:29 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 20 Aug 2017 22:58:19 -0400
Message-ID: <031a604a989858d916f7b6fa7c9008fa1fe79627.1503283308.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1503283308.git.bruce.ashfield@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] libc-headers: update to 4.12
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
X-List-Received-Date: Mon, 21 Aug 2017 02:58:29 -0000
Content-Type: text/plain

The fall 2017 kernel will have 4.12 as the reference kernel, so
we update the libc-headers to match.

Build tested against glibc and muslc systems.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                           | 2 +-
 .../{linux-libc-headers_4.10.bb => linux-libc-headers_4.12.bb}        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.10.bb => linux-libc-headers_4.12.bb} (71%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4a820a0939f6..1787a8248d75 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.29%"
 GDBVERSION ?= "8.0%"
 GLIBCVERSION ?= "2.26%"
-LINUXLIBCVERSION ?= "4.10%"
+LINUXLIBCVERSION ?= "4.12%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb
similarity index 71%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb
index 29262789a8ca..f0d0abfa4836 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.10.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb
@@ -7,5 +7,5 @@ SRC_URI_append_libc-musl = "\
     file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
    "
 
-SRC_URI[md5sum] = "b5e7f6b9b2fe1b6cc7bc56a3a0bfc090"
-SRC_URI[sha256sum] = "3c95d9f049bd085e5c346d2c77f063b8425f191460fcd3ae9fe7e94e0477dc4b"
+SRC_URI[md5sum] = "fc454157e2d024d401a60905d6481c6b"
+SRC_URI[sha256sum] = "a45c3becd4d08ce411c14628a949d08e2433d8cdeca92036c7013980e93858ab"
-- 
2.5.0


