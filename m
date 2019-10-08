Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 419F87F3A6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:27:00 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id t3so4592396pga.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6+B+qTcHvCz8CfIGn/+ekenk49OJxhe88MiLP8FmThI=;
	b=h6WK4GFrZbT0X8m6zkfq+b4Sc0uf+Eid3Mxk+12SprJOipmmPaKvukbzyaIBhy1kAF
	IleQKkHcBdUhy3APFEkjI+UCAkojpR6eT2YOhzB9E/v8RYY5sCne/RQKYhm+nV0025m0
	QXXWFtNb2vOkSReqxJG9IILBQr37Do2szOTwXZ+Qep+Z5DJVqn/EA83G87qErAvorbJ1
	4N354bVUPJ6PaNXWwgH+5fmlkg7/1nzE0v5mHiUz/30MyGiSPovCWoCOSYKDhmV3mPsH
	k1vw7OfKoXlye+aDE2Nnz4uv+8EnKKzuc5ZAmQjp+0jZuB7peUXHzmFkyO5CG2d4Se4A
	btdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6+B+qTcHvCz8CfIGn/+ekenk49OJxhe88MiLP8FmThI=;
	b=ESWMz8sWdjQi1picMDu/AlgY0jofEUxpG5a3QurTiG9jRqlvOD3r5ibrHsxXpNLMSG
	LbIhJQin/8f935+8dmmbgzDz43tI7fc02U2r1thAgs7HiLXVsx5++P2tPR2R0olYqH4Y
	nw7Ja8ISuWXVI7MtRy1kdxe6Mgpwo/pdGXiAFxJHkwr8I3LJrNjWbRjgHzMfvyLwTOhj
	5phKajtCgDM/6SkDy0gIUn/TjwOcyAG4vtnX5YSkmrwkBBvU3qlti2Bz2TWZTKbXr46B
	1oEqb9st8IE4/BR5p1FdBnu10smdVmXABpG/+j7KWLQTX6cm6uhWFwnyT9cHdHK9yWU8
	S3bw==
X-Gm-Message-State: APjAAAVJqu8E4aS4d1KR4um5Ixb8O8/kAKNxZQfOrYRjUioEF2yS1+1P
	2LXRoLpqQluxWabqyPxs6Ba62LD0pVI=
X-Google-Smtp-Source: APXvYqwSvOF27t+VPr8AVKJkvs9wy5YM6vUNFTJTyTscqtlcrR239KsVi8MjL36LyT5D4FmRi+MTQw==
X-Received: by 2002:aa7:930f:: with SMTP id 15mr16008431pfj.22.1570548420943; 
	Tue, 08 Oct 2019 08:27:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	x18sm18420763pge.76.2019.10.08.08.27.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:27:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:26:42 -0700
Message-Id: <ff3b021136d7af66f05475da8475495fe7c653ee.1570548180.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570548180.git.akuster808@gmail.com>
References: <cover.1570548180.git.akuster808@gmail.com>
Subject: [thud 10/12] libgpg-error: Fix build with gawk 5.x
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
X-List-Received-Date: Tue, 08 Oct 2019 15:27:00 -0000

From: Sean Nyekjaer <sean@geanix.com>

Based on poky master, but for version 1.35

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
[backported to thud
 yocto# 13580]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libgpg-error-1.35-gawk5-support.patch          | 161 +++++++++++++++++++++
 .../libgpg-error/libgpg-error_1.32.bb              |   1 +
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
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
index e552001..52ae11a 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch \
            file://0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch \
+           file://libgpg-error-1.35-gawk5-support.patch \
 	  "
 SRC_URI[md5sum] = "ef3d928a5a453fa701ecc3bb22be1c64"
 SRC_URI[sha256sum] = "c345c5e73cc2332f8d50db84a2280abfb1d8f6d4f1858b9daa30404db44540ca"
-- 
2.7.4


