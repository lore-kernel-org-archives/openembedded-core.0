Return-Path: <prvs=1938be1ee=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id B8E3B7F9D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 21:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571952660; x=1603488660;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=iS+ZAXXxL/SRJXDNnENBTmcBa2XpEK6MNzHgndE8Rhg=;
	b=F3hzJbPXGM4vRM77y711TsDNotpC3dT7yr3Ru+km2VNW7UtqI2cwDOMb
	Ikz6KLgSZ4pvLXIULGXIYi1Z9Fnn21D3CCGXoqoJpdELRz05kijzIG9EN
	fe7+4QuDCFv+uz9s48n5tYsgZ4Fr/NL1mpjROpHXS89tWdtl4KHzIgroU
	TWaCvQsMJH8E5L5xdf6+c4p7F/ptCi/+phvenElH/hjRwwz6haU351JRu
	xM/gd8abkQUtfID4hWf2Gx7zd5n536nueO/VhDKQOGRLGP85zpnIf554D
	cI3NsB2y/AQai/dNuM1u4jrSvg5g+6UuL8lRA1AhFq70F0eIcq89KfcJA A==;
IronPort-SDR: 6s91n4DILUjHNiadr9nRcrlh6jC59PRURrUWvkF5p+vyswYjJj206vLNWzn79eBpWKmTlR84Al
	hGnTrsLHEsxSwEqg2rKh1dc/y+96ueEq0YQKiLBwpvwirIcZca3rmcMsLee8MgR27ZDEi/JZem
	8T2Hnf/uUwW36/oIKfHN25Vj758EBc2r6rdJV86PtZKKjZNoWcgk2roEasNGJRi+ZbI3xxYXOW
	GBSM1/lZSS2lcqjopuuy4MftN6YmyS0B0t0j3341u/eXCXUfmOWwzBc7ExwrrjWpAEMbwcJtn1
	Tmo=
X-IronPort-AV: E=Sophos;i="5.68,226,1569254400"; d="scan'208";a="125705394"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2019 05:30:59 +0800
IronPort-SDR: iN7puY59qkR1mRmFIvKLz2IRrxzmjqvHXEb09NkAUQ5CkSTtbiVDs/tgGNJT7Bso3f2fDzVhb3
	HAMBCtZAy2AcS2heqKsFj7ORUp5XJ7nfnau40E2jrIiOqzHS1qa0DBhyWor622yPg6cVVjdKmX
	7KZ+F1j1fx0O8o+GMDMNYEoCtF/uoeq1ub7HjjGTIBqrIazPgESijSR2Q+/c4wdhoJ1xJTpk5x
	As4X+VQNyqgRxPeJNU6LHL0XcKgfi6wPee8c2GFlJaiPGG7NdexjsyNtLlbVzmMoqHJAKjB20c
	RhJg0IZcAd5wGOVhIWXPlN3i
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	24 Oct 2019 14:26:26 -0700
IronPort-SDR: pPpmq+RgYFBALUu7LG5V2jzAaen6fTGHP99YYvB3zz+/yvuvU3v5gGZYZ+mh67v8kxv4FJqU9a
	XII0qGVDiatCeQCmtCH0b5YMZtkYqqq3nyHEfPaOuQ3CRpIVkDrJq8Wv7dZmnEIFpC/UYMz8UT
	V3EQs/8wjHkq7Wz0ERGkSklSrbaen1KrGb1eCxibIXDebi2BmB3y2xZEbZ0N+oGbmPQP/h8YNb
	zruDRSz5XB5AyOZTYcnmk+nG7UTbejcHAdnWo1+NvrNWY1TWcPwOjK5VLxDTGIvGN53jfApTyS
	Ve8=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 24 Oct 2019 14:30:59 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 14:26:02 -0700
Message-Id: <20191024212603.30505-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH v4 1/2] libsdl2: Fix build failure when using mesa 19.2.1
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
X-List-Received-Date: Thu, 24 Oct 2019 21:30:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../0002-Fixed-build-with-mesa-19.2.1.patch   | 53 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.10.bb                 |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-build-with-mesa-19.2.1.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-build-with-mesa-19.2.1.patch b/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-build-with-mesa-19.2.1.patch
new file mode 100644
index 0000000000..874ea401f8
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-build-with-mesa-19.2.1.patch
@@ -0,0 +1,53 @@
+# HG changeset patch
+# User Alistair Francis <alistair.francis@wdc.com>
+# Date 1571948613 25200
+#      Thu Oct 24 13:23:33 2019 -0700
+# Node ID 14a94f6e9e77a5c323741aebade5e484a22236cf
+# Parent  f530cdaaab6261e9942a3ec254273533ed0df08c
+Fixed build with mesa 19.2.1
+
+Fix the following two build failures when building for x86 with mesa 19.2.1
+
+In file included from /include/SDL_opengles.h:33,
+                 from /src/video/SDL_video.c:41:
+/usr/include/GLES/gl.h:63:25: error: conflicting types for 'GLsizeiptr'
+  63 | typedef khronos_ssize_t GLsizeiptr;
+     |                         ^~~~~~~~~~
+In file included from /include/SDL_opengl.h:2105,
+                from /src/video/SDL_video.c:37:
+/include/SDL_opengl_glext.h:472:19: note: previous declaration of 'GLsizeiptr' was here
+ 472 | typedef ptrdiff_t GLsizeiptr;
+     |                   ^~~~~~~~~~
+
+
+In file included from /include/SDL_opengles.h:33,
+                from /src/video/SDL_video.c:41:
+/usr/include/GLES/gl.h:64:26: error: conflicting types for 'GLintptr'
+  64 | typedef khronos_intptr_t GLintptr;
+     |                          ^~~~~~~~
+In file included from /include/SDL_opengl.h:2105,
+                from /src/video/SDL_video.c:37:
+/include/SDL_opengl_glext.h:473:19: note: previous declaration of 'GLintptr' was here
+ 473 | typedef ptrdiff_t GLintptr;
+     |                   ^~~~~~~~
+
+Upstream-Status: Submitted [https://bugzilla.libsdl.org/show_bug.cgi?id=4846]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+
+diff -r f530cdaaab62 -r 14a94f6e9e77 include/SDL_opengl_glext.h
+--- a/include/SDL_opengl_glext.h	Thu Oct 24 18:07:30 2019 +0200
++++ b/include/SDL_opengl_glext.h	Thu Oct 24 13:23:33 2019 -0700
+@@ -468,13 +468,8 @@
+ #ifndef GL_VERSION_1_5
+ #define GL_VERSION_1_5 1
+ #include <stddef.h>
+-#ifdef __MACOSX__
+ typedef long GLsizeiptr;
+ typedef long GLintptr;
+-#else
+-typedef ptrdiff_t GLsizeiptr;
+-typedef ptrdiff_t GLintptr;
+-#endif
+ #define GL_BUFFER_SIZE                    0x8764
+ #define GL_BUFFER_USAGE                   0x8765
+ #define GL_QUERY_COUNTER_BITS             0x8864
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index cdc8650e17..e25f29acb0 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -15,6 +15,7 @@ PROVIDES = "virtual/libsdl2"
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
            file://0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch \
+           file://0002-Fixed-build-with-mesa-19.2.1.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.23.0


