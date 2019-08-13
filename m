Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id A53C060017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:28:57 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id v19so827836wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 02:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HXkHFBdtX073L4jO9gBgYAJLKLpqn3zSCji2zUa8efY=;
	b=T1TBiBXFlzyljwIe2VRgnFoYzNE0JDFLNPVgtcF8matVly2icBqAZdOq/vQF4mIAq9
	at2alfo4KlTDsyb9AlR9wwt6GhXlOPp2+OU+qGkm+A66B9oDwKz3EQHOLO/fvTwG1eD4
	cD6u8tpoNDTT6YguWdqUdN/xYUtsJW7LJLKX99zExDRJ7AJr3I7lOJbgpwZVOULH1zQl
	iy/0DQ+zO04nm2Gu50VYNFzPKnfjOAgcOg6U0baAdFs3M3o9EwuVOUwKFiXXMG6HwEPl
	vuPWr5hTKy1DhOa0zWoUnKARCwnqYgWICWTL1bikrMf1wQ2eJxyxASQ5+t0WBuKPK2pJ
	XVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HXkHFBdtX073L4jO9gBgYAJLKLpqn3zSCji2zUa8efY=;
	b=FKcO0/RwtLuBl9izXC6/2/ER8fiZjW+PqImZHICszNLytk8nji5dK+yrOeAF6CBULL
	UEIBeP4xIgUtpJjmkHr7/sBbQhVPc+LyKKSJnHn2sDPuO6g5tz4o9TTbsbGo5Uwzo5FR
	Jfx9d4wW/cNIH9EOYCD0lNjVC3tyhEzaeAss+Hj8e/8zF9+g9cwRJkpxlR2b07nWBgOo
	jAys+IzMhXl6/Yd4JmHSCFVbEDjWCKwwF3EBEBr3l4HBI6KY1Tfr5grRvMOs2zP+rkVp
	2r/OJPyx4w0SmK86yWwu2X+OvwkolQr7Vyq4KJugumQ/LHv4TlyrqidMvEwaq9YzQ9UT
	udtw==
X-Gm-Message-State: APjAAAVRJveCZTfZG2I8dxzMSDZiCYut8sS66+xxEjudfmrKWbpGluKO
	BHQYC/g9V6KJyosn3y0fRjVvLDKD
X-Google-Smtp-Source: APXvYqw9D9kbmkH+WKOGLSZ7k3Z7Y5im0TgrOEd7HkgDbeyvi/cXgxK2Ih9nKq2iJIMlXQE5eqpjzA==
X-Received: by 2002:a1c:be11:: with SMTP id o17mr2000257wmf.115.1565688537646; 
	Tue, 13 Aug 2019 02:28:57 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id x6sm1000460wmf.6.2019.08.13.02.28.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Aug 2019 02:28:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 09:28:56 +0000
Message-Id: <20190813092856.1354-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCHv2] meson: backport fix for builds with -Werror=return-type
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
X-List-Received-Date: Tue, 13 Aug 2019 09:28:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |   1 +
 ...rn-statements-that-are-seen-with-Wer.patch | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 662368e219..14e5f8a610 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://vala-cross-compile.patch \
+           file://0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch \
            "
 SRC_URI[sha256sum] = "f27b7a60f339ba66fe4b8f81f0d1072e090a08eabbd6aa287683b2c2b9dd2d82"
 SRC_URI[md5sum] = "48787e391ec5c052799a3dd491f73909"
diff --git a/meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch b/meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch
new file mode 100644
index 0000000000..16c6d90761
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch
@@ -0,0 +1,100 @@
+From 15f44be1c7f71cb0a8c6863917acbbc301c621fe Mon Sep 17 00:00:00 2001
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
+/usr/include/features.h:382:4: warning: #warning _FORTIFY_SOURCE
+requires compiling with optimization (-O) [-Wcpp]
+  382 | #  warning _FORTIFY_SOURCE requires compiling with optimization
+(-O)
+      |    ^~~~~~~
+/tmp/tmpep_i4iwg/testfile.c: In function 'main':
+/tmp/tmpep_i4iwg/testfile.c:8:9: error: control reaches end of non-void
+function [-Werror=return-type]
+    8 |         }
+      |         ^
+cc1: some warnings being treated as errors
+
+Upstream-Status: Backport
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ mesonbuild/compilers/c.py     | 1 +
+ mesonbuild/compilers/clike.py | 5 +++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/mesonbuild/compilers/c.py b/mesonbuild/compilers/c.py
+index 3b58a076..9ef92077 100644
+--- a/mesonbuild/compilers/c.py
++++ b/mesonbuild/compilers/c.py
+@@ -70,6 +70,7 @@ class CCompiler(CLikeCompiler, Compiler):
+             #ifndef {symbol}
+                 {symbol};
+             #endif
++            return 0;
+         }}'''
+         return self.compiles(t.format(**fargs), env, extra_args=extra_args,
+                              dependencies=dependencies)
+diff --git a/mesonbuild/compilers/clike.py b/mesonbuild/compilers/clike.py
+index 83f67591..f9cbeabd 100644
+--- a/mesonbuild/compilers/clike.py
++++ b/mesonbuild/compilers/clike.py
+@@ -375,6 +375,7 @@ class CLikeCompiler:
+             #ifndef {symbol}
+                 {symbol};
+             #endif
++            return 0;
+         }}'''
+         return self.compiles(t.format(**fargs), env, extra_args=extra_args,
+                              dependencies=dependencies)
+@@ -554,6 +555,7 @@ class CLikeCompiler:
+         {prefix}
+         int main(int argc, char **argv) {{
+             {type} something;
++            return 0;
+         }}'''
+         if not self.compiles(t.format(**fargs), env, extra_args=extra_args,
+                              dependencies=dependencies)[0]:
+@@ -589,6 +591,7 @@ class CLikeCompiler:
+         {prefix}
+         int main(int argc, char **argv) {{
+             {type} something;
++            return 0;
+         }}'''
+         if not self.compiles(t.format(**fargs), env, extra_args=extra_args,
+                              dependencies=dependencies)[0]:
+@@ -667,6 +670,7 @@ class CLikeCompiler:
+         #include <stdio.h>
+         int main(int argc, char *argv[]) {{
+             printf ("{fmt}", {cast} {f}());
++            return 0;
+         }}'''.format(**fargs)
+         res = self.run(code, env, extra_args=extra_args, dependencies=dependencies)
+         if not res.compiled:
+@@ -819,6 +823,7 @@ class CLikeCompiler:
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
2.17.1


