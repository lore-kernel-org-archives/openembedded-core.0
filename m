Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 58F0F7ED4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 09:04:42 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r3so11563561wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NjdEgLJbYmsMT5mMbDtPvAMVXpRAEqyD6hTQB5/S7S0=;
	b=nyEYXA8jQo4LlgxggbYZEu1XJUSam6SCaBhY/9muJwSr4F04v+VHthyxZJwzWWfkM5
	H72XBxQraxsf8AEND+U8nm5lFYZBE+oDSKKy2pgyLMMxcEuukLPp5T76sKixN53Drx6c
	xXllIGj0KIizxa2XYtEXTObDeFalpRvo39U0uZw12/5VhlWB6vgwutp5a0KSrvPEeOog
	u55kSrU69B+fIr5Q5sC3nShmHFO1o/HJTDpb1lyqV8/8ItoE+4Cc9pOkHX73B/VQ8nk6
	emmWvnOPWeRARJkfpa6Zu1TtkY3xQX7GV3G1cowYWsUMYD0BsJN8aQE411C1MqBUH7++
	lTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NjdEgLJbYmsMT5mMbDtPvAMVXpRAEqyD6hTQB5/S7S0=;
	b=PO6X+ZMiC6HE8sDCCnThkXyR0t4qmk+kpnzZPrSz0qZLbl3MOvcSgTdLgWeVDo/7Uq
	IOUhHPbjsR2KYRmmnUGO/QZSWomq51pzdgIkbwiYGyRrsV1C/rxb9qFgQEyS/uyhP5Hc
	pRIdTlOBo13TZV8/DSk/2rTghrXD81BDGTU4vdJ4mXfrnbz5FCR2ky9iDbOV4prMng5m
	X8kBKDECG0tA1iMqcgHTqAhw23Db48w83doGEYVlJmmM0/5gZD3qdbkSu41QaCWxE1OV
	UbXD6HUPEZLjIcy24Rhzi2A4SyWbe/teeewojLihc2Zi0t0L0slcc7e1+EDNqbAiI5pM
	r32w==
X-Gm-Message-State: APjAAAXJS7nN/BeduUCM6ekrYAXVSEqwjWNq31V3js/aPmSd6SWIya2P
	+zMJ6dNKiunsBSSc12W+k6wJSHBihcQ=
X-Google-Smtp-Source: APXvYqxt04lnDUOG6KA2W/drNZa6GclEpH3rt4TwEA8GOlk05/FYmKUEMbOJTpw+GFi1o/ZjW4+FjQ==
X-Received: by 2002:adf:dcc6:: with SMTP id x6mr32946251wrm.322.1566291883130; 
	Tue, 20 Aug 2019 02:04:43 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	t19sm15100310wmi.29.2019.08.20.02.04.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Aug 2019 02:04:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 09:04:41 +0000
Message-Id: <20190820090442.20-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820090442.20-1-Martin.Jansa@gmail.com>
References: <20190820090442.20-1-Martin.Jansa@gmail.com>
Subject: [warrior][PATCH 2/3] meson: backport fix for builds with -Werror=return-type
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
X-List-Received-Date: Tue, 20 Aug 2019 09:04:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 ...rn-statements-that-are-seen-with-Wer.patch | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 2d18f72c0c..bfe9851e94 100644
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
index 0000000000..1f22755e17
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
2.17.1


