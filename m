Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id B50357F36F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:40 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 205so4873513pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FhGPA1pCT+0PwFrJuGG6LphgTWvDov/U+8xgnBDEz+E=;
	b=FT2JcKWsflIVkOTz9jaBlnN4STU8D5pZ22csxLut8gF2SJMG0p8+QsBrdcDZnTCwi5
	ZPLBw6Av3EU6igpgYkoSvHN8c29GqUBJx68oiWG5/Yc02c9Jy3H3MpZriuEvXwNK+Vih
	itYBiSshlEoYQNGdJuGhtdSYizRJswf5sD278iIZm39FSTLFhkAZauZBVPqDz36kDgFi
	fZBokoOwe+kJYjtNuBe8wR8fP2je3QiMzADh7wSdbsMiU3WCa2YeNu2HDBZETo6Tl6qC
	HKdKedQMldipekEecb+u3yQuCQ1mlX7TcWh3Em1INLI3Wy5FMcX1T2uqIPHRduqASo0G
	mWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FhGPA1pCT+0PwFrJuGG6LphgTWvDov/U+8xgnBDEz+E=;
	b=m1MSXESspBZ1oc0O/8JovpySnaCqP+z/egJgiFNG7I/oyjfUncKIhtEd0mJE61oYVb
	0mht2bRyg8vWuAjkZ9Jv6tYn/24dZ5izN9cR7NjuBtey5Ge2R+iMX2pVg0Yp7P6MdWMP
	/x5Sa0OHn2G+csirvKUir6cP3wFj8svriE6zp7DWrwiWy+SSEfP7amHFXJnBWPB3zwv1
	XNJ67l54egFhGoqlXNtuelWf6t53RuA+Tol2UAPSpWOqETLdHKCfApWL8ZbF2QUwPj1z
	C9dnml4Z0wE1ICZECRtR1xHWZEiXevhEed47MI7fnM3uyrNlxA+RC0GN8moToWuZgWdA
	fedA==
X-Gm-Message-State: APjAAAVsVU2kezDWlF5GIWP8DM5nXE0fXgDwHRUgn1OS2h/aQIOOxFP7
	7oiw37OJN2IK4760I4dHOIlMitkgBO8=
X-Google-Smtp-Source: APXvYqzo6Glu5xgVIxrafwjdQgFJGSKQLDU1na9bEtKxs7HW+oYEFZIPPgXXvdJ7jXUr/sRHEGQyWg==
X-Received: by 2002:a63:ec13:: with SMTP id j19mr11256060pgh.36.1569818921704; 
	Sun, 29 Sep 2019 21:48:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:41 -0700
Message-Id: <4e110b7d3b6e84015249f4174766dd3790f9bbbe.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 46/54] libgpg-error: Fix build with gawk 5.x
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:42 -0000

From: Sean Nyekjaer <sean@geanix.com>

Based on poky master, but for version 1.35

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libgpg-error-1.35-gawk5-support.patch          | 161 +++++++++++++++++++++
 .../libgpg-error/libgpg-error_1.35.bb              |   1 +
 2 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch
new file mode 100644
index 0000000..dc3d558
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch
@@ -0,0 +1,161 @@
+Upstream-Status: Backport [https://dev.gnupg.org/T4459]
+Signed-off-by: Sean Nyekjaer <sean@geanix.com>
+
+From 37069826e497d6af01e3e48fe5d2220ae7f85449 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Mon, 15 Apr 2019 15:10:44 +0900
+Subject: [PATCH] awk: Prepare for Gawk 5.0.
+
+* src/Makefile.am: Use pkg_namespace (instead of namespace).
+* src/mkerrnos.awk: Likewise.
+* lang/cl/mkerrcodes.awk: Don't escape # in regexp.
+* src/mkerrcodes.awk, src/mkerrcodes1.awk, src/mkerrcodes2.awk: Ditto.
+
+--
+
+In Gawk 5.0, regexp routines are replaced by Gnulib implementation,
+which only allows escaping specific characters.
+
+GnuPG-bug-id: 4459
+Reported-by: Marius Schamschula
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+---
+ lang/cl/mkerrcodes.awk |  2 +-
+ src/Makefile.am        |  2 +-
+ src/mkerrcodes.awk     |  2 +-
+ src/mkerrcodes1.awk    |  2 +-
+ src/mkerrcodes2.awk    |  2 +-
+ src/mkerrnos.awk       |  2 +-
+ src/mkstrtable.awk     | 10 +++++-----
+ 7 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/lang/cl/mkerrcodes.awk b/lang/cl/mkerrcodes.awk
+index ae29043..9a1fc18 100644
+--- a/lang/cl/mkerrcodes.awk
++++ b/lang/cl/mkerrcodes.awk
+@@ -122,7 +122,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 42998e4..0ceac9f 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -281,7 +281,7 @@ code-from-errno.h: mkerrcodes Makefile
+ 
+ errnos-sym.h: Makefile mkstrtable.awk errnos.in
+ 	$(AWK) -f $(srcdir)/mkstrtable.awk -v textidx=2 -v nogettext=1 \
+-		-v prefix=GPG_ERR_ -v namespace=errnos_ \
++		-v prefix=GPG_ERR_ -v pkg_namespace=errnos_ \
+ 		$(srcdir)/errnos.in >$@
+ 
+ 
+diff --git a/src/mkerrcodes.awk b/src/mkerrcodes.awk
+index 46d436c..e9c857c 100644
+--- a/src/mkerrcodes.awk
++++ b/src/mkerrcodes.awk
+@@ -85,7 +85,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+diff --git a/src/mkerrcodes1.awk b/src/mkerrcodes1.awk
+index a771a73..4578e29 100644
+--- a/src/mkerrcodes1.awk
++++ b/src/mkerrcodes1.awk
+@@ -81,7 +81,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+diff --git a/src/mkerrcodes2.awk b/src/mkerrcodes2.awk
+index ea58503..188f7a4 100644
+--- a/src/mkerrcodes2.awk
++++ b/src/mkerrcodes2.awk
+@@ -91,7 +91,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+diff --git a/src/mkerrnos.awk b/src/mkerrnos.awk
+index f79df66..15b1aad 100644
+--- a/src/mkerrnos.awk
++++ b/src/mkerrnos.awk
+@@ -83,7 +83,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+diff --git a/src/mkstrtable.awk b/src/mkstrtable.awk
+index c9de9c1..285e45f 100644
+--- a/src/mkstrtable.awk
++++ b/src/mkstrtable.awk
+@@ -77,7 +77,7 @@
+ #
+ # The variable prefix can be used to prepend a string to each message.
+ #
+-# The variable namespace can be used to prepend a string to each
++# The variable pkg_namespace can be used to prepend a string to each
+ # variable and macro name.
+ 
+ BEGIN {
+@@ -102,7 +102,7 @@ header {
+       print "/* The purpose of this complex string table is to produce";
+       print "   optimal code with a minimum of relocations.  */";
+       print "";
+-      print "static const char " namespace "msgstr[] = ";
++      print "static const char " pkg_namespace "msgstr[] = ";
+       header = 0;
+     }
+   else
+@@ -110,7 +110,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+@@ -150,7 +150,7 @@ END {
+   else
+     print "  gettext_noop (\"" last_msgstr "\");";
+   print "";
+-  print "static const int " namespace "msgidx[] =";
++  print "static const int " pkg_namespace "msgidx[] =";
+   print "  {";
+   for (i = 0; i < coded_msgs; i++)
+     print "    " pos[i] ",";
+@@ -158,7 +158,7 @@ END {
+   print "  };";
+   print "";
+   print "static GPG_ERR_INLINE int";
+-  print namespace "msgidxof (int code)";
++  print pkg_namespace "msgidxof (int code)";
+   print "{";
+   print "  return (0 ? 0";
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
index 57ac143..37c298e 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
@@ -14,6 +14,7 @@ SECTION = "libs"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
+           file://libgpg-error-1.35-gawk5-support.patch \
 	  "
 
 SRC_URI[md5sum] = "2808a9e044f883f7554c5ba6a380b711"
-- 
2.7.4


