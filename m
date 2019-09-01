Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 732947F44E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:53 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id x3so272133plr.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=h7xN7jUkQ8j6D1rvWE0FXlYb/vqkmhGp5/D/pKScyGA=;
	b=V86fD/TVna5W16mjpU4mt17RDojbMGmO8FXXHEBgZ8hNyZGnSW+wnLM78GoOB7Lswa
	Zm9MvYb88rzG4Et1GCdqYs0gC81ZLFaWnhjIK5aTfx0blM5FmjevB9yQ0l+ezubkXby6
	zf+EIB7frQLzTW+ro00A+VHK13SqjIQckx98hGnY/wDs5KhRLU0zb4Tk88A1EzquELV4
	1L+dczc0iT5utrus9lzt/1aic73/GWqrYVo6TaC/bD1eHG+3qv7wMvEtBua/+pWFjxxs
	CzXfUaDdBbTLBB6jH6PPluSHw25k40sBIB2QfAPvnfOdq/RE7yZM7N1fs7lZyMR460Im
	UwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=h7xN7jUkQ8j6D1rvWE0FXlYb/vqkmhGp5/D/pKScyGA=;
	b=Ab5EHppFDDQD8doVMF2zVQXEK7USOXEbTIi48rS6bGIxYiszUd+oM9lNY5CtDPAaHv
	t7UYsuAPvORIV3sZgxgyS+46YHrdsT60N4YgYkRBjfBAta+SOyqAcdJsmVkA/b+ku4Ni
	eebOeoZ3bSNfYOdeG7ZroF4tZ0oHEvLqqldyB34ZtNNJSyC6YA/isZv8toVAFZOhvyTh
	DOHrX7oOP8ryTacPjPATSLDN1g5xUYBKQ38jvFraopaJdRVdVjvqhFTsyGX3oSQIfAVq
	VD70qILO+HearAtsAgx7M00yGiR1lGtrOCtdNK9V3JC7hRJ0L/aeeELZkdQzIL0ygYT/
	4B6Q==
X-Gm-Message-State: APjAAAUGIpT+3GMiDM+z8g2G3QMELFGxwEd/wHp+Ryp31jPUbU+RRYUk
	o8w8oGF+KXh5zrstSUVBsELaBzRw
X-Google-Smtp-Source: APXvYqwUIomNLLS0aNS48ttaYgNpw0D+Uei/DuSrnlpQAkhJaGWvGuQOMTmyw9QW8o4XIkNinYs5ig==
X-Received: by 2002:a17:902:1c7:: with SMTP id
	b65mr25037269plb.313.1567348614485; 
	Sun, 01 Sep 2019 07:36:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:09 -0700
Message-Id: <30f9e2e69712ad9f09f330ca001058db936876aa.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 31/43] meson: backport fix for builds with -Werror=return-type
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:53 -0000

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


