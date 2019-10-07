Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4B11160116
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 14:44:18 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t10so6973761plr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6+B+qTcHvCz8CfIGn/+ekenk49OJxhe88MiLP8FmThI=;
	b=l2C+ahQQfJkQ4DGwsITZigk+KlB3uoVPq2WLHYJg3WPwWAPdX44rAWayUH9k4aplcV
	+aAuvaAdS/OcACn9LemTacAuW/0r2SgwLMlPIqsIQzF3i9e/kgHx7GHExzUCCYzGfegc
	mOJuF9PoGV9/Ug/7HkS/bQeUtCq+E45seiG7uFYS5ONf3O+xX7ngm3NjuJMBtiZoPWhO
	WkwROZRQuFEqSWdGIgd71rigmte2iDmSSOKMouR3eyEAkIZb+Q4UjP454C0Q4/Nab9YI
	pEqTeJdNQckfiDsfuBsx80sDe8GxGiTtn3B+fyteqMibw1mFNogUgxYqhQp9CShzm4Sp
	Tpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6+B+qTcHvCz8CfIGn/+ekenk49OJxhe88MiLP8FmThI=;
	b=CbvGO6PgkUHVR8HM67crSMkaj7vzqw+EEykxhD+sr2Zt/p/FyuDCZ6l/ep+GyuF7NB
	gz2xUkmTM78cGqvBKzfucN+Om5k+b+pjb/qlhTkuOybZdYVi94ycysHxVxt+weul7RRk
	Hr0V3ndmnRIGiFrl5td/Dn6BmJklZIduF9bhJb2fRqhEFdt6qrl3fWgLeKh8s+yWakl6
	adXLA0OSZ9jWWbgM9B4lBGaqtG4mP5iMGdCM636tZt9KJeDHHtl+zXmxjuOG+Nat+PlT
	Y05CNUGdLQsxUXMvFHkNu/8wyf4KNhN2ROdgZAzyr9j2v7HqNC0fbU3da/kODiF4GiXS
	JIuA==
X-Gm-Message-State: APjAAAX50aE7exCP+wSC1ZI6mfJfAuJYt7km4y1IbbdiK3vWT5xC/9kt
	DpsYeXxnMTV7rUSVcNGLqCq7fqYNqoE=
X-Google-Smtp-Source: APXvYqz4OctQyf4az164gDjIZbvhII7xq5+KYAZXMJ6L+cOz53F04S2X8p747+uStK2SCQgad9Bx2Q==
X-Received: by 2002:a17:902:322:: with SMTP id
	31mr29951414pld.150.1570459459103; 
	Mon, 07 Oct 2019 07:44:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	o9sm16627561pfp.67.2019.10.07.07.44.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 07:44:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 07:44:15 -0700
Message-Id: <1570459455-21306-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570459455-21306-1-git-send-email-akuster808@gmail.com>
References: <1570459455-21306-1-git-send-email-akuster808@gmail.com>
Subject: [thud][PATCH 2/2] libgpg-error: Fix build with gawk 5.x
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
X-List-Received-Date: Mon, 07 Oct 2019 14:44:18 -0000

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


