Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 675EA7C37F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:23 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id t14so6678519pgs.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=h7xN7jUkQ8j6D1rvWE0FXlYb/vqkmhGp5/D/pKScyGA=;
	b=N92YBS8QNqRyCpuPsTQfjrh7N17XZi/SGYEt6gDDX/ecquXlIt00nIS7xBqfqOw1Ey
	d/VtNQlqatZZdKoRYWGCfr2SXE9a4m/eymke0iSDdUwTeyNBKZqGTZlr7ur2Ocr1jFLU
	XEho80qWZzXvFOVtirCYxBRVquhZ+7BNuCZEDK2mbEGSvKjNpIPccVQ//q0eQN288kIZ
	Siw6vzvxMrH3QDoNN3DYCWEpKjDXQAY+Qu5dLT62ShAtFvGxra0M3kbwOLBe+k0shvaK
	nKF5vbeP4BOCHRIOAAiwEYrJ2KH7y0N+ywOGd4vAnAp4UpbCwBZ9ORSclEpMsO5znNMH
	ey/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=h7xN7jUkQ8j6D1rvWE0FXlYb/vqkmhGp5/D/pKScyGA=;
	b=NrJ2kIUxCw/zvYAgDhVt7UgtSz0ri3xOKb+RNYTtrLZ8RZ0HGnD7qHBZRV1B7Ow4lE
	yVJhZGz2BdUFZoswo8vbA6oE6UFke8O/bznf7/zW0rEgXLplY2GCbvZzV2O74MfVh0S+
	YEafs3esBptLbvoZbFa8QM3fgpY4Z3nikrh0p7KnMIycTPkWk1XeK9pqkElKac0dyA6o
	3lGREAeyhE1UaqbwPWtpVm1gqHyPT5k52BOOA6RolqmUlZrFh25QDcH7K/dzf8VkOgtM
	iVYbbz+j+A8KhxTQS8PvCRXdPez9I5k/606A0ded5rPY9GARuCTN2Ze/Vy4Ui7YK/WGZ
	mJDA==
X-Gm-Message-State: APjAAAVV2IpmrVPtyp6VK8SPcBqQU1ctcv6LBLlxESqzg/jJHQ9erbB2
	vR8zm6ZUdheS7z6g/RP5xntzf5id6yY=
X-Google-Smtp-Source: APXvYqzh5Pp1JpXXRwoAN3fu3P0QJqYNkNKnpbuJsL8kt157U4oEazVIsv1qNDIu8h95pO/1ws5Otw==
X-Received: by 2002:a17:90a:6c90:: with SMTP id
	y16mr25374922pjj.58.1569818904448; 
	Sun, 29 Sep 2019 21:48:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:25 -0700
Message-Id: <0ccf907992a0e3560897ac300ee6b1352d969c42.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 30/54] meson: backport fix for builds with -Werror=return-type
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:23 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc              |  1 +
 ...-return-statements-that-are-seen-with-Wer.patch | 84 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 2d18f72..bfe9851 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://cross-prop-default.patch \
            file://many-cross.patch \
            file://cross-libdir.patch \
+           file://0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch \
            "
 SRC_URI[sha256sum] = "ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd"
 SRC_URI[md5sum] = "0267b0871266056184c484792572c682"
diff --git a/meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch b/meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch
new file mode 100644
index 0000000..1f22755
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch
@@ -0,0 +1,84 @@
+From 7e83cf1edac2a57c08ebb1ce7f21c2a539d5c300 Mon Sep 17 00:00:00 2001
+From: Martin Liska <mliska@suse.cz>
+Date: Mon, 15 Jul 2019 10:06:17 +0200
+Subject: [PATCH] Fix missing return statements that are seen with
+ -Werror=return-type.
+
+Error example:
+
+Code:
+
+        #include <locale.h>
+        int main () {
+            /* If it's not defined as a macro, try to use as a symbol */
+            #ifndef LC_MESSAGES
+                LC_MESSAGES;
+            #endif
+        }
+Compiler stdout:
+
+Compiler stderr:
+ In file included from /usr/include/locale.h:25,
+                 from /tmp/tmpep_i4iwg/testfile.c:2:
+/usr/include/features.h:382:4: warning: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Wcpp]
+  382 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
+      |    ^~~~~~~
+/tmp/tmpep_i4iwg/testfile.c: In function 'main':
+/tmp/tmpep_i4iwg/testfile.c:8:9: error: control reaches end of non-void function [-Werror=return-type]
+    8 |         }
+      |         ^
+cc1: some warnings being treated as errors
+
+Upstream-Status: Backport
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ mesonbuild/compilers/c.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/mesonbuild/compilers/c.py b/mesonbuild/compilers/c.py
+index b0096459..69cf84a4 100644
+--- a/mesonbuild/compilers/c.py
++++ b/mesonbuild/compilers/c.py
+@@ -387,6 +387,7 @@ class CCompiler(Compiler):
+             #ifndef {symbol}
+                 {symbol};
+             #endif
++            return 0;
+         }}'''
+         return self.compiles(t.format(**fargs), env, extra_args=extra_args,
+                              dependencies=dependencies)
+@@ -563,6 +564,7 @@ class CCompiler(Compiler):
+         {prefix}
+         int main(int argc, char **argv) {{
+             {type} something;
++            return 0;
+         }}'''
+         if not self.compiles(t.format(**fargs), env, extra_args=extra_args,
+                              dependencies=dependencies):
+@@ -598,6 +600,7 @@ class CCompiler(Compiler):
+         {prefix}
+         int main(int argc, char **argv) {{
+             {type} something;
++            return 0;
+         }}'''
+         if not self.compiles(t.format(**fargs), env, extra_args=extra_args,
+                              dependencies=dependencies):
+@@ -672,6 +675,7 @@ class CCompiler(Compiler):
+         #include <stdio.h>
+         int main(int argc, char *argv[]) {{
+             printf ("{fmt}", {cast} {f}());
++            return 0;
+         }}'''.format(**fargs)
+         res = self.run(code, env, extra_args=extra_args, dependencies=dependencies)
+         if not res.compiled:
+@@ -823,6 +827,7 @@ class CCompiler(Compiler):
+                 #error "No definition for __builtin_{func} found in the prefix"
+             #endif
+         #endif
++        return 0;
+         }}'''
+         return self.links(t.format(**fargs), env, extra_args=extra_args,
+                           dependencies=dependencies)
+-- 
+2.17.1
+
-- 
2.7.4


