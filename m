Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id E9D1B7E53A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:23:07 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id gn20so4647244plb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 07:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lx2c85Db37E914J1JIjcC5UGHAcCoQc6ihfqguc9q8U=;
	b=jYKTAElDV1zuZZ5HxkTQZntOC6QzHtVOltxWCgG9IEV48JpiBRBUCODoNpc6X4AGel
	KndWFIJT32AEzytfaPMDOd2RVZs07VZrYAUd1WxVlae4ZXXR4X5NKfbTYOb6cBgJcEhV
	Nwiqf1+GpLaX4vXp90UHDgBgvXoFWr4OJUz2iGMV8fyblp3afvD/LKtQuzZnHoGBXP5e
	vhfVQcNon7Moi34TAw4HnqM8m8ZGDc3uJjxThTpeMfAH0diRscQ1O8X+sI8hUCB6h6ez
	khVhtY8X6HEF1iTXUygBLIJa3u3iLAlYF4XFKVlj8TgYY0Kl1QmEf4W3nM0ur4XfNoeq
	Joiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lx2c85Db37E914J1JIjcC5UGHAcCoQc6ihfqguc9q8U=;
	b=ru/apoZH1LG2bFBDzShfR5f6sNTOIm0Fh9Jo7ZVcJFsCMMIX/PYkzuofLR4p2YCe4i
	lk9huVGr0Hm2bLkwLAmXFe18C4PWEZYY1Oh8Tm5k/1cord4hE0eyJEbRVI8HNhENTzUi
	m87IbOeJLNex/xjpwp4oAhpmv00fRFZuLQ7h44KQAFUXvrrFooeC8R0q6yi8UFWi97Yp
	fpRG+kXJzaUCZODj9M0yY0IEdCa31wWXE3Ap8eXzsoa2OYb+67j9F+9pGFPb2vO1P1J3
	Vuj0raJK1/YC4VHwUMAElqFA3/P0tvGDJAlPskzl7j7IXsiGgJnw15ho0R6Cy16MKPHm
	TLgA==
X-Gm-Message-State: APjAAAUIQpXqGb4hVPJiL9VOxl3UNlstQOyKAYZkXlLs0PNyNJlVogYq
	J1PVxePi0YltG4AcSdjhQrIqVOcnpZI=
X-Google-Smtp-Source: APXvYqzoYyyasb+SbsMjwzzkji/b42Z7jqeuVyZ36MR1q9ArhAQST1tfHN6/ZThFkiGlJ6e+vTzpig==
X-Received: by 2002:a17:902:6842:: with SMTP id
	f2mr21811976pln.39.1567261388467; 
	Sat, 31 Aug 2019 07:23:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	z16sm21502399pfr.136.2019.08.31.07.23.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 31 Aug 2019 07:23:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Aug 2019 07:22:52 -0700
Message-Id: <20190831142252.7204-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] libgpg-error: Fix build with gawk 5.x
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
X-List-Received-Date: Sat, 31 Aug 2019 14:23:08 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgpg-error-1.36-gawk5-support.patch     | 142 ++++++++++++++++++
 .../libgpg-error/libgpg-error_1.36.bb         |   1 +
 2 files changed, 143 insertions(+)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
new file mode 100644
index 0000000000..2db11b2176
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
@@ -0,0 +1,142 @@
+From 7865041c77f4f7005282f10f9b6666b19072fbdf Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://dev.gnupg.org/T4459]
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
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -293,7 +293,7 @@ code-from-errno.h: mkerrcodes$(EXEEXT_FO
+ 
+ errnos-sym.h: Makefile mkstrtable.awk errnos.in
+ 	$(AWK) -f $(srcdir)/mkstrtable.awk -v textidx=2 -v nogettext=1 \
+-		-v prefix=GPG_ERR_ -v namespace=errnos_ \
++		-v prefix=GPG_ERR_ -v pkg_namespace=errnos_ \
+ 		$(srcdir)/errnos.in >$@
+ 
+ 
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
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
index 2db544a12e..b11ab0548d 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
@@ -14,6 +14,7 @@ SECTION = "libs"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
+           file://libgpg-error-1.36-gawk5-support.patch \
 	  "
 
 SRC_URI[md5sum] = "eff437f397e858a9127b76c0d87fa5ed"
-- 
2.23.0


