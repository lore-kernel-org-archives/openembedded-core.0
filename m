Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id CB8B973211
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:09 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id n128so142172777pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=qCtkanenKUtaTP7JjmPZVFaOYg3G1+pdreaVfGAcbTU=;
	b=g4HRoI0YaWP+We5bxJQ/Pq7onp+kVZ3toeZdO9P46tcS2Do3rHHQt7gMUn0l/jkdaX
	8950lGPpCLwcBzii1yq+D8/WY9E5Na4Nwd35cQUNyYAzYuC8wyt3CXR0BgIUSXTLhmt2
	Vy04uTJNMCCFjD+Xm4/6c/KaIbWbJl4hIeM0RgTsSdgI6PruKTaW4wTjuEOLwfFDcReZ
	bpoA1ryIHx5og8UtMMGzl5StWlsXewip00Ol62MraOpWPRjg1uzXHZmXgIOGhB8v+ccp
	V6q8L7LmA91U4o3+T7DX4cgYgDZUsSL7i+VjRnnqdQtREb8HXnKl8dwQ9r5Urdmv+9pv
	K1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=qCtkanenKUtaTP7JjmPZVFaOYg3G1+pdreaVfGAcbTU=;
	b=cmUHtJ/9sTKkbxfrSl5QaO609pTBdFbSC6RRCuUYLpoIgPOORNHUPlwoBKjre5/Ga+
	jGH+FVw4R6LauqVKiSgtSWB5RHOzt+zUeMK5i+Ud1xeQeEevXI7pAqfj4SiI+ILHFAmq
	I2YI3q6jzSc0imCPm8Tb1tIIcoqdpI/L8hYSp1Ph4HdIsofaIgI9n3CYWjwv4x+0w6nw
	KeimUMJRKeCdn/MUMIruk8eM75xnUagbJh3UflwHwG9VvLuIlH+C2wM33/5jS4uL0+Ic
	aGJHhWRPsQIcK6CwoM2vKuLTrcf244jvztH39D2sxcuywf+OQv/6/gzdO1gokuVPAgbI
	waJw==
X-Gm-Message-State: AG10YOQvzGAi2j9VhA19dOGMLy+2l9fWK2YcHpIQcUDORPtJRfMjvB+uIwGWAL0lwtyzhg==
X-Received: by 10.98.11.209 with SMTP id 78mr25828515pfl.92.1453030630307;
	Sun, 17 Jan 2016 03:37:10 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:44 -0800
Message-Id: <94623ccd492c0f8b3489193d8be3966e69cce355.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 11/73] argp-standalone: Add recipe
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:10 -0000

This helps packages like gnutls to compile with musl
any package that needs glibc's implementation of argp
can link to this library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../argp-standalone/argp-standalone_1.3.bb         | 28 ++++++++
 .../files/0001-throw-in-funcdef.patch              | 84 ++++++++++++++++++++++
 .../argp-standalone/files/0002-isprint.patch       | 51 +++++++++++++
 3 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
 create mode 100644 meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
 create mode 100644 meta/recipes-support/argp-standalone/files/0002-isprint.patch

diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
new file mode 100644
index 0000000..a5d20d3
--- /dev/null
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
@@ -0,0 +1,28 @@
+# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Glibc hierarchical argument parsing standalone library"
+HOMEPAGE = "http://www.lysator.liu.se/~nisse/misc/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://argp.h;beginline=1;endline=20;md5=008b7e53dea6f9e1d9fdef0d9cf3184a"
+SECTION = "libs"
+
+SRC_URI = "http://www.lysator.liu.se/~nisse/misc/argp-standalone-${PV}.tar.gz \
+           file://0001-throw-in-funcdef.patch \
+           file://0002-isprint.patch \
+          "
+SRC_URI[md5sum] = "720704bac078d067111b32444e24ba69"
+SRC_URI[sha256sum] = "dec79694da1319acd2238ce95df57f3680fea2482096e483323fddf3d818d8be"
+
+inherit autotools
+
+CFLAGS += "-fPIC -U__OPTIMIZE__"
+
+do_install() {
+	install -D -m 0644 ${B}/libargp.a ${D}${libdir}/libargp.a
+	install -D -m 0644 ${S}/argp.h ${D}${includedir}/argp.h
+}
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST = ".*-musl.*"
diff --git a/meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch b/meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
new file mode 100644
index 0000000..a6e2759
--- /dev/null
+++ b/meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
@@ -0,0 +1,84 @@
+# --- T2-COPYRIGHT-NOTE-BEGIN ---
+# This copyright note is auto-generated by ./scripts/Create-CopyPatch.
+# 
+# T2 SDE: package/.../rng-tools/throw-in-funcdef.patch.argp-standalone
+# Copyright (C) 2006 The T2 SDE Project
+# 
+# More information can be found in the files COPYING and README.
+# 
+# This patch file is dual-licensed. It is available under the license the
+# patched project is licensed under, as long as it is an OpenSource license
+# as defined at http://www.opensource.org/ (e.g. BSD, X11) or under the terms
+# of the GNU General Public License as published by the Free Software
+# Foundation; either version 2 of the License, or (at your option) any later
+# version.
+# --- T2-COPYRIGHT-NOTE-END ---
+
+
+No __THROW in function implementation.
+	--jsaw
+
+Taken from buildroot
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- argp-standalone-1.4-test2/argp.h.orig	2006-01-06 02:29:59.000000000 +0100
++++ argp-standalone-1.4-test2/argp.h	2006-01-06 02:41:10.000000000 +0100
+@@ -560,17 +560,17 @@
+ # endif
+ 
+ # ifndef ARGP_EI
+-#  define ARGP_EI extern __inline__
++#  define ARGP_EI extern inline
+ # endif
+ 
+ ARGP_EI void
+-__argp_usage (__const struct argp_state *__state) __THROW
++__argp_usage (__const struct argp_state *__state)
+ {
+   __argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
+ }
+ 
+ ARGP_EI int
+-__option_is_short (__const struct argp_option *__opt) __THROW
++__option_is_short (__const struct argp_option *__opt)
+ {
+   if (__opt->flags & OPTION_DOC)
+     return 0;
+@@ -582,7 +582,7 @@
+ }
+ 
+ ARGP_EI int
+-__option_is_end (__const struct argp_option *__opt) __THROW
++__option_is_end (__const struct argp_option *__opt)
+ {
+   return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
+ }
+--- argp-standalone-1.4-test2/argp-parse.c.orig	2006-01-06 02:47:48.000000000 +0100
++++ argp-standalone-1.4-test2/argp-parse.c	2006-01-06 02:48:16.000000000 +0100
+@@ -1290,13 +1290,13 @@
+ /* Defined here, in case a user is not inlining the definitions in
+  * argp.h */
+ void
+-__argp_usage (__const struct argp_state *__state) __THROW
++__argp_usage (__const struct argp_state *__state)
+ {
+   __argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
+ }
+ 
+ int
+-__option_is_short (__const struct argp_option *__opt) __THROW
++__option_is_short (__const struct argp_option *__opt) 
+ {
+   if (__opt->flags & OPTION_DOC)
+     return 0;
+@@ -1310,7 +1310,7 @@
+ }
+ 
+ int
+-__option_is_end (__const struct argp_option *__opt) __THROW
++__option_is_end (__const struct argp_option *__opt) 
+ {
+   return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
+ }
diff --git a/meta/recipes-support/argp-standalone/files/0002-isprint.patch b/meta/recipes-support/argp-standalone/files/0002-isprint.patch
new file mode 100644
index 0000000..1c07eea
--- /dev/null
+++ b/meta/recipes-support/argp-standalone/files/0002-isprint.patch
@@ -0,0 +1,51 @@
+Subject: restrict value range passed to isprint function
+
+According to C standards isprint argument shall be representable as an
+unsigned char or be equal to EOF, otherwise the behaviour is undefined.
+
+Passing arbitrary ints leads to segfault in nm program from elfutils.
+
+Restrict isprint argument range to values representable by unsigned char.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+
+Taken from buildroot
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+Index: b/argp.h
+===================================================================
+--- a/argp.h
++++ b/argp.h
+@@ -23,6 +23,7 @@
+ 
+ #include <stdio.h>
+ #include <ctype.h>
++#include <limits.h>
+ 
+ #define __need_error_t
+ #include <errno.h>
+@@ -577,7 +578,7 @@
+   else
+     {
+       int __key = __opt->key;
+-      return __key > 0 && isprint (__key);
++      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
+     }
+ }
+ 
+Index: b/argp-parse.c
+===================================================================
+--- a/argp-parse.c
++++ b/argp-parse.c
+@@ -1292,7 +1292,7 @@
+       int __key = __opt->key;
+       /* FIXME: whether or not a particular key implies a short option
+        * ought not to be locale dependent. */
+-      return __key > 0 && isprint (__key);
++      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
+     }
+ }
+ 
-- 
2.7.0


