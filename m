Return-Path: <prvs=194c68654=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC107FBF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 21:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1572040263; x=1603576263;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=dN7zTQxvQy2A4PVAdINQJDBnFsMb3wJlCbB1w4m2ah8=;
	b=cQJftzqR36i4SmxVrhiNgOcJCHl8/PE+Kh6sv3N33+3Sfo9TqgOwJNUM
	uzUOP23hsOdb7HXRsVeMknAE+dn+IvIW1faLaq7jfezJOd6m98Icsr4Nr
	yzXf3aLzPhPEPagAQ8RAIzuL+uOimUqUOz2dePUBvxKqvDV2whTa7djbc
	gCFVLU2PpCaoYt2En4mmghqMRJ0GwF5DU/5zyPwJJ4U3GbijtAnhNgdTB
	zUcH2fstLLRcD3ecy+nHKItLlpSEgDxJsiKrYWzgz3YLB6erKg8cYLG32
	TOYAgxhwkmxajoqaT5t4UWemkHtUfyxl/Vqpzn5UH9tnlsAKVH25dTlJG w==;
IronPort-SDR: ewikmYB9ton/QcqpetLzdlXCx0aAzzhLj3733yjYv8q8cDAC7Cp/PagIDbsxCeeMTDQ8W6K/ye
	EZk4Xcx0B8NGZSQGne0UMOmUt1hIH9ZsjjxTPkxXNEWUDlSBrd+xQ20JdnhPwyVrqie06OWlrJ
	1+jgJdhS0iWw+PSI7PO+15n3BBoXYMg9qterXCp58GnxLtNqJkDE1holla115Gem2/HFPg/pyL
	mM5DZ0IB8w86bbHuxgEJY8lDe0aL4I7zynxzlZQWpPORQ7KTLj2AmNbVq43FEqa/DE0o2iVOBL
	zCc=
X-IronPort-AV: E=Sophos;i="5.68,230,1569254400"; d="scan'208";a="228516340"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2019 05:51:02 +0800
IronPort-SDR: uNew48gA4he8aAC1BKJQQAti/NAgMcj4V4PknwWZPPFqRGCmjVD/8icEIZt3eZ1E7uSoX5xKpA
	MLcFd9mlUeORn5lWNzz0a87rs8uqAxUsN2y73Oz159Pe7pq6s9Vs+MSoxnan4guw1BlPXB2CZw
	jS9qlFYs3tg7ITpviyKASgfVE7+1huXSN5qquESxyqfhJEJH5rXq02SPTRGzMEXVueNHV4/pKe
	GVaDue+ppsSn16h2aOuqvO485ecq0m15YEOa1ulvOkKObML9e+jW/dbuW2Dlmhv5dvfCf1qKkj
	tOjHl+6r5mKBa6g8r7RbtV5h
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	25 Oct 2019 14:46:28 -0700
IronPort-SDR: dWiynVW491zNy1qPKTGUFqooJbyEq0kDobO2sODOY4Kw35zRulFumkqtykV4bFB5WdA5AHOwXK
	zOB87MJfDKW6/hD3yMJen2+FWTIwA82uKGu3q+002MLDfr71tZRCPqS3retqvUeQZyLiWYYVGm
	3XaneWo1u2yNWonw61yj6XLVgdfP9qD+KMvfnClVFFivt0L8NCGjAMRYCX712uF34gkfwfH3Tz
	/FlDeE5g5cSF3TrsrwQhPCKPLfADW5N4E4EMG02TsIqC9GAC74Cic2QasGEOElQMtqPjnb4Fum
	19o=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2019 14:51:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 14:46:04 -0700
Message-Id: <20191025214605.3957-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH v5 1/2] libsdl2: Fix build failure when using mesa 19.2.1
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
X-List-Received-Date: Fri, 25 Oct 2019 21:51:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v5:
 - Backport upstream fix

 ...DL-fails-to-compile-with-Mesa-Master.patch | 41 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.10.bb                 |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch b/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch
new file mode 100644
index 0000000000..8f5b6a0cef
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch
@@ -0,0 +1,41 @@
+# HG changeset patch
+# User Sylvain Becker <sylvain.becker@gmail.com>
+# Date 1570898876 -7200
+#      Sat Oct 12 18:47:56 2019 +0200
+# Node ID 369b01006eb2f6fd563f7c315d29ae3fe503c432
+# Parent  4cbaffd0083b8cd17070dbd9d4ab1ce0fa9fca2d
+Fixed bug 4797 - SDL fails to compile with Mesa Master (thanks Michael Olbrich!)
+
+fix building with Mesa 19.2
+
+With Mesa 19.2 building fails with:
+
+/include/GLES/gl.h:63:25: error: conflicting types for 'GLsizeiptr'
+
+The same type is defined in include/SDL_opengl.h for OpenGL and the two
+headers should not be included at the same time.
+This was just never noticed because the same header guard '__gl_h_' was
+used. This was changed in Mesa. The result is this error.
+
+Fix this the same way GLES2 already handles this: Don't include the GLES
+header when the OpenGL header was already included.
+(https://hg.libsdl.org/SDL/rev/a60b3c292f0f)
+
+Upstream-Status: Backport [https://hg.libsdl.org/SDL/rev/369b01006eb2]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+
+diff --git a/src/video/SDL_video.c b/src/video/SDL_video.c
+--- a/src/video/SDL_video.c
++++ b/src/video/SDL_video.c
+@@ -37,9 +37,9 @@
+ #include "SDL_opengl.h"
+ #endif /* SDL_VIDEO_OPENGL */
+ 
+-#if SDL_VIDEO_OPENGL_ES
++#if SDL_VIDEO_OPENGL_ES && !SDL_VIDEO_OPENGL
+ #include "SDL_opengles.h"
+-#endif /* SDL_VIDEO_OPENGL_ES */
++#endif /* SDL_VIDEO_OPENGL_ES && !SDL_VIDEO_OPENGL */
+ 
+ /* GL and GLES2 headers conflict on Linux 32 bits */
+ #if SDL_VIDEO_OPENGL_ES2 && !SDL_VIDEO_OPENGL
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index cdc8650e17..862abe1d54 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -15,6 +15,7 @@ PROVIDES = "virtual/libsdl2"
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
            file://0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch \
+           file://0002-Fixed-bug-4797-SDL-fails-to-compile-with-Mesa-Master.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.23.0


