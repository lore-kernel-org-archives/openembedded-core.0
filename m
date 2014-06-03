Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id E278C6F509
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 03:29:57 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id p10so4086117pdj.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jun 2014 20:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kGqO/j7p6G6OUw8TP5nDqvd2Bk4h+IMh/BGevsuTPBM=;
	b=mhhUwBhfyXnps5yZZ+MmFG//X29GJ4QzIwdWTShqFgKs9lEt7VLdRNsQtiUP5I5vp0
	S3CeZall//gUIXfzW+higOZ104TjAyxHXiMKXWcdFUt/ojxSg/1Pqr9f7SpiWeQOXo+J
	xDEna73R61+7Wvet6AlCu9wzxZIOPe4DhSgwQJr6cs32Vt6C4wHEfgIP5uto5r4mFv+l
	mqk2p6fRLPCfzaE3UVSbqbDprU0shwEs21U+DMDViLn0/94LFYzyk1TQWJ0JJ8XrC9Xb
	gEzlRr609inK+KV1RJfwgyAAhSnYB1Db1esjQ+3OEPN0euY1CmIY73CMvS8/Z/nwJCkz
	RYZQ==
X-Received: by 10.68.163.100 with SMTP id yh4mr45636951pbb.122.1401766198730; 
	Mon, 02 Jun 2014 20:29:58 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	py7sm22947478pbb.78.2014.06.02.20.29.57 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jun 2014 20:29:58 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:33:14 -0700
Message-Id: <1401766394-8680-3-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1401766394-8680-1-git-send-email-ticotimo@gmail.com>
References: <1401766394-8680-1-git-send-email-ticotimo@gmail.com>
Subject: [PATCH 2/2] clutter: update to 1.18.2
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
X-List-Received-Date: Tue, 03 Jun 2014 03:30:00 -0000

From: Tim Orling <TicoTimo@gmail.com>

* Updated Ross's install-examples.patch to current
  ** AM_CPPFLAGS changes no longer needed
  ** example_DATA = ... redhand.png no longer needed
  ** minor line # changes

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../clutter/clutter-1.0/install-examples.patch             | 14 ++------------
 meta/recipes-graphics/clutter/clutter-1.0_1.16.2.bb        |  8 --------
 meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb        |  8 ++++++++
 3 files changed, 10 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.16.2.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb

diff --git a/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch b/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch
index d96b038..3b6a70e 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch
+++ b/meta/recipes-graphics/clutter/clutter-1.0/install-examples.patch
@@ -7,22 +7,12 @@ diff --git a/examples/Makefile.am b/examples/Makefile.am
 index 4b9b449..232cd19 100644
 --- a/examples/Makefile.am
 +++ b/examples/Makefile.am
-@@ -31,7 +31,7 @@ LDADD = \
- AM_CFLAGS = $(CLUTTER_CFLAGS) $(GDK_PIXBUF_CFLAGS) $(MAINTAINER_CFLAGS)
- 
- AM_CPPFLAGS = \
--	-DTESTS_DATADIR=\""$(abs_top_srcdir)/tests/data"\" \
-+	-DTESTS_DATADIR=\""$(exampledir)"\" \
- 	-DG_DISABLE_SINGLE_INCLUDES \
- 	-DGLIB_DISABLE_DEPRECATION_WARNINGS \
- 	-I$(top_srcdir)	\
-@@ -39,6 +39,8 @@ AM_CPPFLAGS = \
+@@ -38,6 +38,7 @@ AM_CPPFLAGS = \
  	-I$(top_srcdir)/clutter \
  	-I$(top_builddir)/clutter
  
 -noinst_PROGRAMS = $(all_examples)
 +exampledir = $(pkglibdir)/examples
 +example_PROGRAMS = $(all_examples)
-+example_DATA = $(top_srcdir)/tests/data/redhand.png
  
- -include $(top_srcdir)/build/autotools/Makefile.am.gitignore
+ EXTRA_DIST = redhand.png
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.16.2.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.16.2.bb
deleted file mode 100644
index 584f9d0..0000000
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.16.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require clutter-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI[archive.md5sum] = "976614a2f7e60af088a0a460fe9d267e"
-SRC_URI[archive.sha256sum] = "0cb7e88c80f43fc7fb869fc6d34c42e98aa1a0ef7aa02e6aeef1b099ad33df42"
-
-SRC_URI += "file://install-examples.patch"
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
new file mode 100644
index 0000000..452e7ee
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
@@ -0,0 +1,8 @@
+require clutter-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[archive.md5sum] = "471f5ea423e20d4140c7771873daef29"
+SRC_URI[archive.sha256sum] = "f9fe12e6148426063c90e67dfaeb56013bf1aea224ef502223d13eab6c1add63"
+
+SRC_URI += "file://install-examples.patch"
-- 
1.8.3.2


