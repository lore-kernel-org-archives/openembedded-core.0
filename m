Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: q1uLpq9lKV768LuulJWUlZ4tN2683Kz6JQFW/93zAka/6VmEhKgbvT63Uqrh5rHXR0y19DZ64Q
 hOJ4hxPvAtag==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818236"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818236"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:51 -0700
IronPort-SDR: TwVnLEs3pw9tTnP6kM5fO9BWK47hBf5M6DgGWyR0enOQAJD0RAiKTrH1c0Sugfu/XFfSwtqyvN
 znD9OqwayIIQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067462"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:49 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 41/64] glslang: strip whitespace in pkgconfig file
Date: Mon, 26 Apr 2021 08:53:12 +0800
Message-Id: <bece9af0991776926004fc12c4d6ec542bc9957c.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Whilst pkg-config is fine with .pc files containing leading whitespace,
pkgconf is less forgiving.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 14bfe5f15f78c1bc049868633fd6fa19feb5a70c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-generate-glslang-pkg-config.patch    | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index ef092f17a1..cddd330971 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -34,14 +34,14 @@ index 00000000..64b6882d
 --- /dev/null
 +++ b/glslang/glslang.pc.cmake.in
 @@ -0,0 +1,11 @@
-+    prefix=@CMAKE_INSTALL_PREFIX@
-+    exec_prefix=@CMAKE_INSTALL_PREFIX@
-+    libdir=${exec_prefix}/@CMAKE_INSTALL_LIBDIR@
-+    includedir=${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
-+    
-+    Name: @PROJECT_NAME@
-+    Description: OpenGL and OpenGL ES shader front end and validator
-+    Requires:
-+    Version: @GLSLANG_VERSION@
-+    Libs: -L${libdir} -lglslang -lOSDependent -lHLSL -lOGLCompiler -lSPVRemapper
-+    Cflags: -I${includedir}
++prefix=@CMAKE_INSTALL_PREFIX@
++exec_prefix=@CMAKE_INSTALL_PREFIX@
++libdir=${exec_prefix}/@CMAKE_INSTALL_LIBDIR@
++includedir=${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
++
++Name: @PROJECT_NAME@
++Description: OpenGL and OpenGL ES shader front end and validator
++Requires:
++Version: @GLSLANG_VERSION@
++Libs: -L${libdir} -lglslang -lOSDependent -lHLSL -lOGLCompiler -lSPVRemapper
++Cflags: -I${includedir}
-- 
2.30.2

