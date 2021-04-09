Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10646.1617980418911207153
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 08:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39B901FB
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Apr 2021 08:00:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEC393F694
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Apr 2021 08:00:16 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glslang: strip whitespace in pkgconfig file
Date: Fri,  9 Apr 2021 16:00:14 +0100
Message-Id: <20210409150014.3643624-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Whilst pkg-config is fine with .pc files containing leading whitespace,
pkgconf is less forgiving.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-generate-glslang-pkg-config.patch    | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-=
pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-gl=
slang-pkg-config.patch
index ef092f17a1..cddd330971 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-con=
fig.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-con=
fig.patch
@@ -34,14 +34,14 @@ index 00000000..64b6882d
 --- /dev/null
 +++ b/glslang/glslang.pc.cmake.in
 @@ -0,0 +1,11 @@
-+    prefix=3D@CMAKE_INSTALL_PREFIX@
-+    exec_prefix=3D@CMAKE_INSTALL_PREFIX@
-+    libdir=3D${exec_prefix}/@CMAKE_INSTALL_LIBDIR@
-+    includedir=3D${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
-+   =20
-+    Name: @PROJECT_NAME@
-+    Description: OpenGL and OpenGL ES shader front end and validator
-+    Requires:
-+    Version: @GLSLANG_VERSION@
-+    Libs: -L${libdir} -lglslang -lOSDependent -lHLSL -lOGLCompiler -lSP=
VRemapper
-+    Cflags: -I${includedir}
++prefix=3D@CMAKE_INSTALL_PREFIX@
++exec_prefix=3D@CMAKE_INSTALL_PREFIX@
++libdir=3D${exec_prefix}/@CMAKE_INSTALL_LIBDIR@
++includedir=3D${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
++
++Name: @PROJECT_NAME@
++Description: OpenGL and OpenGL ES shader front end and validator
++Requires:
++Version: @GLSLANG_VERSION@
++Libs: -L${libdir} -lglslang -lOSDependent -lHLSL -lOGLCompiler -lSPVRem=
apper
++Cflags: -I${includedir}
--=20
2.25.1

