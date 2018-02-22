Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E8D6478711
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 12:50:35 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id 191so3495477wmm.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 04:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9xJ59IIwuAg26QBIxTTwpvdSW11cWDQWNJ268T9LH6k=;
	b=TlYj0X9XriydXQoCbyMPxwbdPl3S2JgphNerdXZZhN90mmCC/6h3O3Qi4f9bvVrXRj
	VdBo6PBTBjzdBU2IipW03G8ti03jXVUx3J8wNtkEH+8R7FM9bxl3VWXKC2cLcnQZ7aev
	wV2Yt1v7p28YgAuHmfyMW5u8H3drzyfZwg1cHJ4F6MD659T5Z38kV1I9w1xbUjG7JZcm
	URMhhG5efSAcKL1Q/pJwPgGbphHn2FPNq79GiTDmF0rTSs1tkbg0oVYPwUoY2rkoxJUl
	JmfwwE35xILz0k4zdovRHQubWa+HeAEgr1kCZiclHrnJlfFAH8gvYqRjLTE0d89QCI68
	O0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9xJ59IIwuAg26QBIxTTwpvdSW11cWDQWNJ268T9LH6k=;
	b=k8dtYitbXx5w1IQR2GVYW0evAnjnfxerfMoWK7CB3+Ne3judKE6w6vXGKTVsC4rz/+
	lcJzh+bVQ1TnKLCHMqr4gKWHjQlNi8nwni34BZqMo+wdboMJ6xk41CynI7jlIZ7HRv0/
	k98innH9I/XRybRs63mIntu4UejnZeWioCGWxKcakSbTfAmS4c22doV5wc2S+oxGDsNS
	MDThiAB1wRoFhfoyYk7EyFBsqbOEoB5sph7J/aT3CeRy/koPdUuOiNk1pZ4v3OjJ8NPN
	ELFWNf7xdLoGkds43ufbYWcHuT473cqgyyx0ExjghlALcCsiUoq6mW9yjKhrPvTP7rcW
	lUxA==
X-Gm-Message-State: APf1xPA3aMFCysq0KYhr20UKYNj5w3qWyEVi+g1nGlzbXzS/giRFDn1h
	+4a322oq3n7fo14dgwSHsghwpJIQ
X-Google-Smtp-Source: AH8x225j1YXZF9r3J/jxOkdEaxRiRPNd7oeSyffllWoJ0F0IwdOiqhy6TX/Iy8w1sfjwEKQnqmyh8Q==
X-Received: by 10.28.39.67 with SMTP id n64mr4850006wmn.71.1519303832632;
	Thu, 22 Feb 2018 04:50:32 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j132sm391879wmd.27.2018.02.22.04.50.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 04:50:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Feb 2018 12:50:28 +0000
Message-Id: <20180222125028.21620-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] man-db: replace the outdated man implementation
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
X-List-Received-Date: Thu, 22 Feb 2018 12:50:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Until now oe-core has been using a well obsolete implementation of man.

Man-db on the other hand is used by all modern Linux distros, is actively
maintained, has a standard build system, and does not require 30 patches
to build.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/man-db/man-db_2.8.1.bb       |  42 ++++++
 meta/recipes-extended/man/man/configure_sed.patch  |  32 -----
 .../man/man/man-1.5g-nonrootbuild.patch            |  16 ---
 .../man/man/man-1.5h1-gencat.patch                 |  14 --
 meta/recipes-extended/man/man/man-1.5h1-make.patch |  17 ---
 .../man/man/man-1.5i2-initial.patch                |  19 ---
 .../man/man/man-1.5i2-newline.patch                |  15 --
 .../man/man/man-1.5i2-overflow.patch               |  16 ---
 meta/recipes-extended/man/man/man-1.5j-i18n.patch  |  16 ---
 .../man/man/man-1.5j-nocache.patch                 |  16 ---
 meta/recipes-extended/man/man/man-1.5j-utf8.patch  |  61 --------
 .../man/man/man-1.5k-confpath.patch                |  15 --
 .../man/man/man-1.5k-nonascii.patch                |  18 ---
 meta/recipes-extended/man/man/man-1.5k-sofix.patch |  24 ----
 .../man/man/man-1.5m2-bug11621.patch               |  15 --
 .../man/man/man-1.5m2-buildroot.patch              |  52 -------
 .../man/man/man-1.5m2-no-color-for-printing.patch  |  15 --
 .../man/man/man-1.5m2-sigpipe.patch                |  30 ----
 .../man/man/man-1.6e-i18n_whatis.patch             | 145 -------------------
 .../man/man/man-1.6e-mandirs.patch                 |  31 ----
 .../man/man/man-1.6e-new_sections.patch            |  15 --
 .../recipes-extended/man/man/man-1.6e-ro_usr.patch |  33 -----
 .../man/man/man-1.6e-security.patch                |  62 --------
 .../man/man-1.6e-use_i18n_vars_in_a_std_way.patch  | 160 ---------------------
 .../man/man/man-1.6e-whatis2.patch                 |  59 --------
 .../man/man/man-1.6g-compile-warnings.patch        | 105 --------------
 .../man/man/man-1.6g-configure.patch               |  68 ---------
 .../man/man/man-1.6g-parallel.patch                |  30 ----
 .../man/man/man-1.6g-whatis3.patch                 |  20 ---
 meta/recipes-extended/man/man/man.1.gz             | Bin 12323 -> 0 bytes
 meta/recipes-extended/man/man/man.7.gz             | Bin 6192 -> 0 bytes
 meta/recipes-extended/man/man/man.conf             | 141 ------------------
 meta/recipes-extended/man/man/manpath.5.gz         | Bin 2133 -> 0 bytes
 meta/recipes-extended/man/man_1.6g.bb              |  86 -----------
 34 files changed, 42 insertions(+), 1346 deletions(-)
 create mode 100644 meta/recipes-extended/man-db/man-db_2.8.1.bb
 delete mode 100644 meta/recipes-extended/man/man/configure_sed.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5g-nonrootbuild.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5h1-gencat.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5h1-make.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5i2-initial.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5i2-newline.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5i2-overflow.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5j-i18n.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5j-nocache.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5j-utf8.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5k-confpath.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5k-nonascii.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5k-sofix.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5m2-bug11621.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5m2-buildroot.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5m2-no-color-for-printing.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.5m2-sigpipe.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6e-i18n_whatis.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6e-mandirs.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6e-new_sections.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6e-ro_usr.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6e-security.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6e-use_i18n_vars_in_a_std_way.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6e-whatis2.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6g-compile-warnings.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6g-configure.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6g-parallel.patch
 delete mode 100644 meta/recipes-extended/man/man/man-1.6g-whatis3.patch
 delete mode 100644 meta/recipes-extended/man/man/man.1.gz
 delete mode 100644 meta/recipes-extended/man/man/man.7.gz
 delete mode 100644 meta/recipes-extended/man/man/man.conf
 delete mode 100644 meta/recipes-extended/man/man/manpath.5.gz
 delete mode 100644 meta/recipes-extended/man/man_1.6g.bb

diff --git a/meta/recipes-extended/man-db/man-db_2.8.1.bb b/meta/recipes-extended/man-db/man-db_2.8.1.bb
new file mode 100644
index 00000000000..528903d6fab
--- /dev/null
+++ b/meta/recipes-extended/man-db/man-db_2.8.1.bb
@@ -0,0 +1,42 @@
+SUMMARY = "An implementation of the standard Unix documentation system accessed using the man command"
+HOMEPAGE = "http://man-db.nongnu.org/"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://docs/COPYING;md5=eb723b61539feef013de476e68b5c50a"
+
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz"
+SRC_URI[md5sum] = "51842978e06686286421f9498d1009b7"
+SRC_URI[sha256sum] = "a6aec641ca3d9942b054cc0e9c3f05cb46a3a992bc0006795755e2fed1357f3e"
+
+DEPENDS = "libpipeline gdbm groff-native"
+
+# | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
+USE_NLS_libc-musl = "no"
+
+inherit gettext pkgconfig autotools
+
+EXTRA_OECONF = "--with-pager=less --disable-cache-owner"
+
+do_install_append_libc-musl() {
+        rm -f ${D}${libdir}/charset.alias
+}
+
+FILES_${PN} += "${prefix}/lib/tmpfiles.d"
+
+FILES_${PN}-dev += "${libdir}/man-db/libman.so ${libdir}/${BPN}/libmandb.so"
+
+RRECOMMENDS_${PN} += "less"
+RPROVIDES_${PN} += " man"
+
+def compress_pkg(d):
+    if bb.utils.contains("INHERIT", "compress_doc", True, False, d):
+         compress = d.getVar("DOC_COMPRESS")
+         if compress == "gz":
+             return "gzip"
+         elif compress == "bz2":
+             return "bzip2"
+         elif compress == "xz":
+             return "xz"
+    return ""
+
+RDEPENDS_${PN} += "${@compress_pkg(d)}"
diff --git a/meta/recipes-extended/man/man/configure_sed.patch b/meta/recipes-extended/man/man/configure_sed.patch
deleted file mode 100644
index d49e6831d9a..00000000000
--- a/meta/recipes-extended/man/man/configure_sed.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-man: replace ',' with '#'
-
-Sometimes, the parameters of CC/BUILD_CC contains the ',', which
-cause the sed command failed, so replace the ',' with '#'
-
-Upstream-Status: Pending
-
-Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- configure | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 9f62cf9..9a565ae 100755
---- a/configure
-+++ b/configure
-@@ -1321,9 +1321,9 @@ do
-   echo "Creating $infile from $infile.in"
-   sed -e '
- s,@version@,$version,
--s,@CC@,$CC,
-+s#@CC@#$CC#
- s,@EXEEXT@,$EXEEXT,
--s,@BUILD_CC@,$BUILD_CC,
-+s#@BUILD_CC@#$BUILD_CC#
- s,@INSTALL@,$INSTALL,
- s,@DEFS@,$DEFS,
- s,@LIBS@,$LIBS,
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/man/man/man-1.5g-nonrootbuild.patch b/meta/recipes-extended/man/man/man-1.5g-nonrootbuild.patch
deleted file mode 100644
index 6f834bd01bd..00000000000
--- a/meta/recipes-extended/man/man/man-1.5g-nonrootbuild.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -u -r man-1.5g.old/configure man-1.5g/configure
---- man-1.5g.old/configure	Wed Apr  7 04:16:05 1999
-+++ man-1.5g/configure	Mon May 15 15:22:44 2000
-@@ -791,7 +791,7 @@
-     read mode
-     if test "$mode" != ""; then man_mode=$mode; fi
-   fi
--  man_install_flags="-m $man_mode -o $man_user -g $man_group"
-+  man_install_flags=""
- fi
- 
- # What sections do we anticipate?
diff --git a/meta/recipes-extended/man/man/man-1.5h1-gencat.patch b/meta/recipes-extended/man/man/man-1.5h1-gencat.patch
deleted file mode 100644
index 044b14c5099..00000000000
--- a/meta/recipes-extended/man/man/man-1.5h1-gencat.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- gencat/genlib.c	2006-08-02 20:11:44.000000000 +0200
-+++ gencat/genlib.c.oden	2008-12-21 19:18:50.000000000 +0100
-@@ -47,6 +47,7 @@ up-to-date.  Many thanks.
- 01/14/91   4 nazgul	Off by one on number specified entries
- */
- 
-+#undef _GNU_SOURCE
- #include <stdio.h>
- #include <stdlib.h>
- #ifdef SYSV
diff --git a/meta/recipes-extended/man/man/man-1.5h1-make.patch b/meta/recipes-extended/man/man/man-1.5h1-make.patch
deleted file mode 100644
index 8631eb2c539..00000000000
--- a/meta/recipes-extended/man/man/man-1.5h1-make.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.5g/man/Makefile.in.mike	Fri Apr  9 13:35:54 1999
-+++ man-1.5g/man/Makefile.in	Fri Apr  9 13:36:45 1999
-@@ -1,8 +1,8 @@
- # only executed from a subdir
- MAN1 = man whatis apropos
--MAN5 = man.conf
-+MAN5 = man.config
- MAN8 = makewhatis
--ALL = man.1 whatis.1 apropos.1 man.conf.5
-+ALL = man.1 whatis.1 apropos.1 man.config.5
- MAYBE8 = makewhatis
- 
- .SUFFIXES: .man .1 .5 .8
diff --git a/meta/recipes-extended/man/man/man-1.5i2-initial.patch b/meta/recipes-extended/man/man/man-1.5i2-initial.patch
deleted file mode 100644
index fe56c0706ca..00000000000
--- a/meta/recipes-extended/man/man/man-1.5i2-initial.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.5i2/src/makewhatis.sh.initial	Tue Jul  3 15:38:39 2001
-+++ man-1.5i2/src/makewhatis.sh	Tue Jul  3 15:39:39 2001
-@@ -81,8 +81,10 @@
- 	continue;;
-     -s) setsections=1
- 	continue;;
--    -u) findarg="-newer /var/cache/man/whatis"
--	update=1
-+    -u) if [ -e /var/cache/man/whatis ]; then
-+	  findarg="-newer /var/cache/man/whatis"
-+	  update=1
-+	fi
- 	continue;;
-     -v) verbose=1
- 	continue;;
diff --git a/meta/recipes-extended/man/man/man-1.5i2-newline.patch b/meta/recipes-extended/man/man/man-1.5i2-newline.patch
deleted file mode 100644
index 611df5d2594..00000000000
--- a/meta/recipes-extended/man/man/man-1.5i2-newline.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- src/man.c	2008-12-21 19:17:31.000000000 +0100
-+++ src/man.c.oden	2008-12-21 19:17:38.000000000 +0100
-@@ -391,7 +391,7 @@ again:
- 	  beg++;
- 
-      end = beg;
--     while (*end != ' ' && *end != '\t' && *end != '\n' && *end != '\0')
-+     while (*end != ' ' && *end != '\t' && *end != '\n' && *end != '\0' && (end-buf)<BUFSIZE)
- 	  end++;		/* note that buf is NUL-terminated */
-      *end = '\0';
- 
diff --git a/meta/recipes-extended/man/man/man-1.5i2-overflow.patch b/meta/recipes-extended/man/man/man-1.5i2-overflow.patch
deleted file mode 100644
index 52d2881a893..00000000000
--- a/meta/recipes-extended/man/man/man-1.5i2-overflow.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.5i2/src/man.c.overflow	Mon Jun 25 00:01:45 2001
-+++ man-1.5i2/src/man.c	Mon Jun 25 00:01:45 2001
-@@ -381,6 +381,9 @@
- 	  strcat(name, "/");
- 	  strcat(name, beg);
-      }
-+     /* If this is too long, bad things have already happened. *
-+      * we should quit IMMEDIATELY.                            */
-+     if(strlen(name)>sizeof(ultname)) _exit(1);
- 
-      goto again;
- }
diff --git a/meta/recipes-extended/man/man/man-1.5j-i18n.patch b/meta/recipes-extended/man/man/man-1.5j-i18n.patch
deleted file mode 100644
index 2ae09c0ea49..00000000000
--- a/meta/recipes-extended/man/man/man-1.5j-i18n.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.5j/msgs/inst.sh.i18n	Wed Apr 25 10:40:50 2001
-+++ man-1.5j/msgs/inst.sh	Wed Apr 25 10:41:17 2001
-@@ -27,8 +27,7 @@
- for j in $M; do
-   if [ -f $j ]; then
-     i=`echo $j | sed -e 's/mess.//; s/.cat//'`
--    dest=`echo $locdir | sed -e "s/%N/man/; s/%L/$i/"`
--    dest=${PREFIX}$dest
-+    dest=${PREFIX}/`echo $locdir | sed -e "s/%N/man/; s/%L/$i/"`
-     echo "mkdir -p `dirname $dest`"
-     mkdir -p `dirname $dest`;
-     echo "install -c -m 644 $j $dest"
diff --git a/meta/recipes-extended/man/man/man-1.5j-nocache.patch b/meta/recipes-extended/man/man/man-1.5j-nocache.patch
deleted file mode 100644
index 751dddd53b5..00000000000
--- a/meta/recipes-extended/man/man/man-1.5j-nocache.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.5j/src/man.conf.in.nocache	Thu Nov 22 15:07:12 2001
-+++ man-1.5j/src/man.conf.in	Thu Nov 22 15:07:12 2001
-@@ -81,6 +81,9 @@
- # 
- #NOCACHE
- #
-+# NOCACHE keeps man from creating cache pages
-+NOCACHE
-+#
- # Useful paths - note that COL should not be defined when
- # NROFF is defined as "groff -Tascii" or "groff -Tlatin1";
- # not only is it superfluous, but it actually damages the output.
diff --git a/meta/recipes-extended/man/man/man-1.5j-utf8.patch b/meta/recipes-extended/man/man/man-1.5j-utf8.patch
deleted file mode 100644
index 33d3e4c9745..00000000000
--- a/meta/recipes-extended/man/man/man-1.5j-utf8.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.5j/configure.utf8	Thu Nov 22 15:02:35 2001
-+++ man-1.5j/configure	Thu Nov 22 15:03:15 2001
-@@ -408,9 +408,9 @@
-   Fgawk=/bin/gawk
-   Fawk=/bin/gawk
-   Fmawk=missing
--  troff=""
--  nroff=""
--  jnroff=""
-+  troff=/usr/bin/troff
-+  nroff=/usr/bin/nroff
-+  jnroff=/usr/bin/nroff
-   eqn=""
-   neqn=""
-   jneqn=""
-@@ -453,6 +453,8 @@
-     done
-   done
-   Fgroff=/usr/bin/groff
-+  Fnroff=/usr/bin/nroff
-+  Fjnroff=/usr/bin/nroff
-   Fgeqn=/usr/bin/geqn
-   Fgtbl=/usr/bin/gtbl
-   Fcol=/usr/bin/col
-@@ -485,25 +487,25 @@
-   then
-     if test $Fnroff = "missing"
-     then
--      nroff="nroff -Tlatin1 -mandoc"
-+      nroff="nroff -Tutf8 -mandoc"
-     else
--      nroff="$Fnroff -Tlatin1 -mandoc"
-+      nroff="$Fnroff -Tutf8 -mandoc"
-     fi
-     troff="troff -mandoc"
-     echo "Warning: could not find groff"
-   else
-     if test $Fnroff = "missing"
-     then
--      nroff="$Fgroff -Tlatin1 -mandoc"
-+      nroff="$Fgroff -Tutf8 -mandoc"
-     else
--      nroff="$Fnroff -Tlatin1 -mandoc"
-+      nroff="$Fnroff -Tutf8 -mandoc"
-     fi
-     troff="$Fgroff -Tps -mandoc"
--    jnroff="$Fgroff -Tnippon -mandocj"
-+    jnroff="$Fjnroff -Tutf8 -mandocj"
-   fi
-   eqn="$Fgeqn -Tps"
--  neqn="$Fgeqn -Tlatin1"
--  jneqn="$Fgeqn -Tnippon"
-+  neqn="$Fgeqn -Tutf8"
-+  jneqn="$Fgeqn -Tutf8"
-   tbl="$Fgtbl"
-   col="$Fcol"
-   vgrind="$Fvgrind"
diff --git a/meta/recipes-extended/man/man/man-1.5k-confpath.patch b/meta/recipes-extended/man/man/man-1.5k-confpath.patch
deleted file mode 100644
index b5746c2df80..00000000000
--- a/meta/recipes-extended/man/man/man-1.5k-confpath.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- configure	2006-05-01 19:56:14.000000000 +0200
-+++ configure.oden	2008-12-21 19:16:50.000000000 +0100
-@@ -198,7 +198,7 @@
-     confdir="${confprefix}/share/misc"
-   fi
- fi
--conffilename="man.conf"
-+conffilename="man.config"
- 
- if test "$RANDOM" = "$RANDOM"; then
-   # Plain old Bourne shell.
diff --git a/meta/recipes-extended/man/man/man-1.5k-nonascii.patch b/meta/recipes-extended/man/man/man-1.5k-nonascii.patch
deleted file mode 100644
index d662d9b6a70..00000000000
--- a/meta/recipes-extended/man/man/man-1.5k-nonascii.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- ./src/apropos.sh.nonascii	2001-11-23 00:30:42.000000000 +0100
-+++ ./src/apropos.sh	2002-08-13 15:44:53.000000000 +0200
-@@ -18,9 +18,9 @@
- 
- # When man pages in your favorite locale look to grep like binary files
- # (and you use GNU grep) you may want to add the 'a' option to *grepopt1.
--aproposgrepopt1='i'
-+aproposgrepopt1='ia'
- aproposgrepopt2=''
--whatisgrepopt1='iw'
-+whatisgrepopt1='iwa'
- whatisgrepopt2='^'
- grepopt1=$%apropos_or_whatis%grepopt1
- grepopt2=$%apropos_or_whatis%grepopt2
diff --git a/meta/recipes-extended/man/man/man-1.5k-sofix.patch b/meta/recipes-extended/man/man/man-1.5k-sofix.patch
deleted file mode 100644
index 50b925288ec..00000000000
--- a/meta/recipes-extended/man/man/man-1.5k-sofix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.5j/src/man.c.sofix	Thu Nov 22 14:51:44 2001
-+++ man-1.5j/src/man.c	Thu Nov 22 14:52:44 2001
-@@ -300,7 +300,7 @@
- 
-      if (strlen(name0) >= sizeof(ultname))
- 	     return name0;
--     strcpy(ultname, name0);
-+     strncpy(ultname, name0, BUFSIZE-32);
-      name = ultname;
- 
- again:
-@@ -332,7 +332,7 @@
- 	   * .so files - we could glob for all possible extensions,
- 	   * for now: only try .gz
- 	   */
--	  else if (fp == NULL && get_expander(".gz") &&
-+	  if (fp == NULL && get_expander(".gz") &&
- 		   strlen(name)+strlen(".gz") < BUFSIZE) {
- 	       strcat(name, ".gz");
- 	       fp = fopen (name, "r");
diff --git a/meta/recipes-extended/man/man/man-1.5m2-bug11621.patch b/meta/recipes-extended/man/man/man-1.5m2-bug11621.patch
deleted file mode 100644
index 051299906b8..00000000000
--- a/meta/recipes-extended/man/man/man-1.5m2-bug11621.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- ./configure.ad	2003-12-11 19:17:10.000000000 +0100
-+++ ./configure	2003-12-11 19:17:27.000000000 +0100
-@@ -26,7 +26,7 @@
- # (Indeed, -r may cause the terminal to get into funny states.
- # Very inconvenient. For viewing pages in strange locales, set LC_*.)
- #
--DEFAULTLESSOPT="-is"
-+DEFAULTLESSOPT="-isr"
- #
- # Note that not creating any cat directories (/var/cache/man or so)
- # and not making man suid or sgid is recommended.
diff --git a/meta/recipes-extended/man/man/man-1.5m2-buildroot.patch b/meta/recipes-extended/man/man/man-1.5m2-buildroot.patch
deleted file mode 100644
index bc97f56b9af..00000000000
--- a/meta/recipes-extended/man/man/man-1.5m2-buildroot.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- ./configure.less	2003-12-11 19:18:15.000000000 +0100
-+++ ./configure	2003-12-11 19:20:03.000000000 +0100
-@@ -401,18 +401,13 @@
- 
- if test "$ans" = "false"
- then
--  for i in more less cmp cat awk gawk mawk
--  do
--    eval F$i="missing"
--    for j in $DEFPATH
--    do
--      if test -f $j/$i
--      then
--	eval F$i=$j/$i
--	break
--      fi
--    done
--  done
-+  Fmore=/bin/more
-+  Fless=/usr/bin/less
-+  Fcmp=/usr/bin/cmp
-+  Fcat=/bin/cat
-+  Fgawk=/bin/gawk
-+  Fawk=/bin/gawk
-+  Fmawk=missing
-   troff=""
-   nroff=""
-   jnroff=""
-@@ -457,6 +452,19 @@
-       fi
-     done
-   done
-+  Fgroff=/usr/bin/groff
-+  Fgeqn=/usr/bin/geqn
-+  Fgtbl=/usr/bin/gtbl
-+  Fcol=/usr/bin/col
-+  Fgrefer=/usr/bin/grefer
-+  Fgpic=/usr/bin/gpic
-+  Fmore=/bin/more
-+  Fless=/usr/bin/less
-+  Fcmp=/usr/bin/cmp
-+  Fcat=/bin/cat
-+  Fgawk=/bin/gawk
-+
-+
-   for i in eqn tbl refer pic
-   do
-     if test `eval echo \\$Fg$i` = "missing"
diff --git a/meta/recipes-extended/man/man/man-1.5m2-no-color-for-printing.patch b/meta/recipes-extended/man/man/man-1.5m2-no-color-for-printing.patch
deleted file mode 100644
index c85ff1d8c72..00000000000
--- a/meta/recipes-extended/man/man/man-1.5m2-no-color-for-printing.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.5m2/configure.color	2006-09-16 18:27:37.000000000 +0200
-+++ man-1.5m2/configure	2006-09-16 18:28:44.000000000 +0200
-@@ -539,6 +539,8 @@
-     troff="$troff -c"
-     nroff="$nroff -c"
-     jnroff="$jnroff -c"
-+else
-+    troff="$troff -c"
- fi
- 
- if [ x$default = x ]; then
diff --git a/meta/recipes-extended/man/man/man-1.5m2-sigpipe.patch b/meta/recipes-extended/man/man/man-1.5m2-sigpipe.patch
deleted file mode 100644
index 8af78eab7b1..00000000000
--- a/meta/recipes-extended/man/man/man-1.5m2-sigpipe.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.5m2/src/util.c_sigpipe	2006-12-09 13:43:21.000000000 +0100
-+++ man-1.5m2/src/util.c	2006-12-09 13:53:13.000000000 +0100
-@@ -116,11 +116,14 @@
- static int
- system1 (const char *command) {
- 	void (*prev_handler)(int) = signal (SIGINT,catch_int);
-+	signal (SIGPIPE,SIG_IGN);
- 	int ret = system(command);
- 
- 	/* child terminated with signal? */
- 	if (WIFSIGNALED(ret) &&
--	    (WTERMSIG(ret) == SIGINT || WTERMSIG(ret) == SIGQUIT))
-+	    (WTERMSIG(ret) == SIGINT ||
-+		 WTERMSIG(ret) == SIGPIPE ||
-+		 WTERMSIG(ret) == SIGQUIT))
- 		exit(1);
- 
- 	/* or we caught an interrupt? */
-@@ -128,6 +131,7 @@
- 		exit(1);
- 
- 	signal(SIGINT,prev_handler);
-+	signal(SIGPIPE,SIG_DFL);
- 	return ret;
- }
- 
diff --git a/meta/recipes-extended/man/man/man-1.6e-i18n_whatis.patch b/meta/recipes-extended/man/man/man-1.6e-i18n_whatis.patch
deleted file mode 100644
index e321325d63f..00000000000
--- a/meta/recipes-extended/man/man/man-1.6e-i18n_whatis.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -Naur man-1.6e.orig/src/apropos.sh man-1.6e/src/apropos.sh
---- man-1.6e.orig/src/apropos.sh	2007-05-18 13:49:31.000000000 -0300
-+++ man-1.6e/src/apropos.sh	2007-05-18 14:24:33.000000000 -0300
-@@ -60,16 +60,56 @@
-     esac
- done
- 
-+# list of languages to look for
-+LANG_LIST=`echo $LANGUAGE:$LC_ALL:$LC_MESSAGES:$LANG | tr ':' ' '`
-+DIR_LIST=""
-+for d in /var/cache/man $manpath /usr/lib
-+do
-+    for l in $LANG_LIST
-+    do
-+        if [ -d $d/$l ]
-+        then
-+            # check that the path is not already in the list
-+            if ! echo "$DIR_LIST" | grep " $d/$l\b" > /dev/null
-+            then
-+                DIR_LIST="$DIR_LIST $d/$l"
-+            fi
-+        fi
-+    done
-+    DIR_LIST="$DIR_LIST $d"
-+    # check that the path is not already in the list
-+    if ! echo "$DIR_LIST" | grep " $d\b" > /dev/null
-+    then
-+        DIR_LIST="$DIR_LIST $d/$l"
-+    fi
-+done
-+
- while [ "$1" != "" ]
- do
-     found=0
--    for d in /var/cache/man $manpath /usr/lib
-+    # in order not to display lines in more than one language for
-+    # a same man page; we check that a given man page name
-+    # hasn't already been displayed
-+    BAZ=""
-+    for d in $DIR_LIST
-     do
-         if [ -f $d/whatis ]
-         then
--            if grep -"$grepopt1" "$grepopt2""$1" $d/whatis
-+            if FOO=`grep -"$grepopt1" "$grepopt2""$1" $d/whatis`
-             then
--                found=1
-+                # the LC_ALL=C is needed in case the text is
-+                # in a different encoding than the locale
-+                BAR=`echo -e "$FOO" | LC_ALL=C sed 's/ - .*$//' | tr ' []' '_' | sort -u`
-+                for i in $BAR
-+                do
-+                    if ! echo "$BAZ" | grep "$i" > /dev/null
-+                    then
-+                        BAZ="$BAZ $i"
-+                        i="^`echo $i | sed 's:_\+:\\\(\[_ \]\\\|\\\[\\\|\\\]\\\)\\\+:g'`"
-+                        echo -e "$FOO" | grep "$i"
-+                        found=1
-+                    fi
-+                done
- # Some people are satisfied with a single occurrence
- # But it is better to give all
- #               break
-diff -Naur man-1.6e.orig/src/makewhatis.sh man-1.6e/src/makewhatis.sh
---- man-1.6e.orig/src/makewhatis.sh	2007-05-18 13:49:31.000000000 -0300
-+++ man-1.6e/src/makewhatis.sh	2007-05-18 13:50:07.000000000 -0300
-@@ -41,12 +41,32 @@
- 
- program=`basename $0`
- 
-+# this allows to define language specific values fro NAME, DESCRIPTION
-+# if not defined, using those default values
-+if [ -z "$MAN_NAME" ]
-+then
-+	MAN_NAME="ИМЕ|NOM|JMÉNO|NAVN|ΟΝΟΜΑ|NOMBRE|NIME|IZENA|NIMI|IME|\
-+NÉV|NOME|名前|이름|NAAM|NAZWA|NUME|ИМЯ|MENO|НАЗВА|名称|名稱"
-+fi
-+if [ -z "$MAN_DESCRIPTION" ]
-+then
-+	MAN_DESCRIPTION="ОПИСАНИЕ|DESCRIPCIÓ|POPIS|BESKRIVELSE|BESCHREIBUNG|\
-+ΠΕΡΙΓΡΑΦΗ|DESCRIPCIÓN|KIRJELDUS|AZALPENA|KUVAUS|OPIS|LEÍRÁS|DESCRIZIONE|\
-+説明|설명|BESCHRIJVING|DESCRIÇÃO|DESCRIERE|ОПИС|描述"
-+fi
-+# make them into awk regexp
-+MAN_NAME="^(${MAN_NAME})";
-+MAN_DESCRIPTION="^(${MAN_DESCRIPTION})";
-+
- # In case both /usr/man and /usr/share/man exist, the former is local
- # and should be first.
- # It is a bug to add /var/cache/man to DEFCATPATH.
- dm=
- for d in /usr/share/man /usr/man /usr/X11R6/man /usr/local/man
- do
-+    if [ -n "$LANG" -a -d "$d/$LANG" ]; then
-+	if [ x$dm = x ]; then dm="$d/$LANG"; else dm=$dm:"$d/$LANG"; fi
-+    fi
-     if [ -d $d ]; then
- 	if [ x$dm = x ]; then dm=$d; else dm=$dm:$d; fi
-     fi
-@@ -55,6 +75,9 @@
- dc=
- for d in /var/cache/man /usr/share/man/preformat /usr/man/preformat /usr/share/man /usr/man
- do
-+    if [ -n "$LANG" -a -d "$d/$LANG" ]; then
-+	if [ x$dc = x ]; then dm="$d/$LANG"; else dm=$dc:"$d/$LANG"; fi
-+    fi
-     if [ -d $d ]; then
- 	if [ x$dc = x ]; then dc=$d; else dc=$dc:$d; fi
-     fi
-@@ -194,7 +217,7 @@
- 	    section=$i
- 	    curdir=$mandir/${pages}$i
- 	    export section verbose curdir
--	    find $mandir/${pages}$i/. -name '*' $findarg0 $findarg -print | $AWK '
-+	    find $mandir/${pages}$i/. -name '*' $findarg0 $findarg -print | LC_ALL=C $AWK -v MAN_NAME="$MAN_NAME" -v MAN_DESCRIPTION="$MAN_DESCRIPTION" '
- 
- 	    function readline() {
- 	      if (use_zcat || use_bzcat) {
-@@ -261,13 +284,7 @@
- 		gsub(/.\b/, "");
- 		if (($1 ~ /^\.[Ss][Hh]/ &&
- 		  ($2 ~ /[Nn][Aa][Mm][Ee]/ ||
--		   $2 ~ /^JM�NO/ || $2 ~ /^NAVN/ || $2 ~ /^NUME/ ||
--		   $2 ~ /^BEZEICHNUNG/ || $2 ~ /^NOMBRE/ ||
--		   $2 ~ /^NIMI/ || $2 ~ /^NOM/ || $2 ~ /^IME/ ||
--		   $2 ~ /^N[�E]V/ || $2 ~ /^NAMA/ || $2 ~ /^̾��/ ||
--		   $2 ~ /^̾��/ || $2 ~ /^�̸�/ || $2 ~ /^NAZWA/ ||
--		   $2 ~ /^��������/ || $2 ~ /^����/ || $2 ~ /^�W��/ ||
--		   $2 ~ /^NOME/ || $2 ~ /^NAAM/ || $2 ~ /^���/)) ||
-+		   $2 ~ MAN_NAME )) ||
- 		  (pages == "cat" && $1 ~ /^NAME/)) {
- 		    if (!insh) {
- 		      insh = 1;
-@@ -278,6 +295,7 @@
- 		  if ($1 ~ /^\.[Ss][HhYS]/ ||
- 		    (pages == "cat" &&
- 		    ($1 ~ /^S[yYeE]/ || $1 ~ /^DESCRIPTION/ ||
-+		     $1 ~ MAN_DESCRIPTION ||
- 		     $1 ~ /^COMMAND/ || $1 ~ /^OVERVIEW/ ||
- 		     $1 ~ /^STRUCTURES/ || $1 ~ /^INTRODUCTION/ ||
- 		     $0 ~ /^[^ ]/))) {
diff --git a/meta/recipes-extended/man/man/man-1.6e-mandirs.patch b/meta/recipes-extended/man/man/man-1.6e-mandirs.patch
deleted file mode 100644
index b240064c980..00000000000
--- a/meta/recipes-extended/man/man/man-1.6e-mandirs.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.6e.orig/src/man.conf.in	2005-08-20 20:26:06.000000000 -0300
-+++ man-1.6e/src/man.conf.in	2007-05-18 10:30:29.000000000 -0300
-@@ -36,11 +36,12 @@
- #
- # Every automatically generated MANPATH includes these fields
- #
--MANPATH	/usr/man
- MANPATH	/usr/share/man
-+MANPATH	/usr/X11R6/man
- MANPATH	/usr/local/man
- MANPATH	/usr/local/share/man
--MANPATH	/usr/X11R6/man
-+MANPATH	/usr/kerberos/man
-+MANPATH	/usr/man
- #
- # Uncomment if you want to include one of these by default
- #
-@@ -67,6 +68,9 @@
- MANPATH_MAP	/usr/X11R6/bin		/usr/X11R6/man
- MANPATH_MAP	/usr/bin/X11		/usr/X11R6/man
- MANPATH_MAP	/usr/bin/mh		/usr/share/man
-+MANPATH_MAP	/usr/kerberos/bin		/usr/kerberos/man
-+MANPATH_MAP	/usr/kerberos/sbin		/usr/kerberos/man
-+
- #
- # NOAUTOPATH keeps man from automatically adding directories that look like
- # manual page directories to the path.
diff --git a/meta/recipes-extended/man/man/man-1.6e-new_sections.patch b/meta/recipes-extended/man/man/man-1.6e-new_sections.patch
deleted file mode 100644
index fb9773c646e..00000000000
--- a/meta/recipes-extended/man/man/man-1.6e-new_sections.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- man-1.6e.orig/configure	2006-05-01 14:56:14.000000000 -0300
-+++ man-1.6e/configure	2007-05-18 14:35:43.000000000 -0300
-@@ -960,7 +960,7 @@
- 
- # What sections do we anticipate?
- 
--tmpsections="1 1p 8 2 3 3p 4 5 6 7 9 0p tcl n l p o"
-+tmpsections="1 1p 8 2 3 3p 3pm 4 5 6 7 9 0p tcl n l p o"
- 
- if [ x$default = x ]; then
-   echo ""
diff --git a/meta/recipes-extended/man/man/man-1.6e-ro_usr.patch b/meta/recipes-extended/man/man/man-1.6e-ro_usr.patch
deleted file mode 100644
index 1d1cb0c724c..00000000000
--- a/meta/recipes-extended/man/man/man-1.6e-ro_usr.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: man-1.6f/src/makewhatis.sh
-===================================================================
---- man-1.6f.orig/src/makewhatis.sh	2010-12-29 13:42:34.000000000 -0800
-+++ man-1.6f/src/makewhatis.sh	2010-12-29 13:42:35.667428347 -0800
-@@ -124,7 +124,7 @@
- 	continue;;
-     -s) setsections=1
- 	continue;;
--    -u) findarg="-ctime 0"
-+    -u) findarg="-newer /var/cache/man/whatis"
- 	update=1
- 	continue;;
-     -v) verbose=1
-@@ -165,14 +165,7 @@
- # first truncate all the whatis files that will be created new,
- # then only update - we might visit the same directory twice
- if [ x$update = x ]; then
--   for pages in man cat
--   do
--      eval path="\$$pages"path
--      for mandir in $path
--      do
--	 cp /dev/null $mandir/whatis
--      done
--   done
-+   cp /dev/null /var/cache/man/whatis
- fi
- 
- for pages in man cat
diff --git a/meta/recipes-extended/man/man/man-1.6e-security.patch b/meta/recipes-extended/man/man/man-1.6e-security.patch
deleted file mode 100644
index 312a882f063..00000000000
--- a/meta/recipes-extended/man/man/man-1.6e-security.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -Naur man-1.6e.orig/src/makewhatis.sh man-1.6e/src/makewhatis.sh
---- man-1.6e.orig/src/makewhatis.sh	2006-07-19 01:58:08.000000000 -0300
-+++ man-1.6e/src/makewhatis.sh	2007-05-18 10:18:31.000000000 -0300
-@@ -45,7 +45,7 @@
- # and should be first.
- # It is a bug to add /var/cache/man to DEFCATPATH.
- dm=
--for d in /usr/man /usr/share/man /usr/X11R6/man /usr/local/man
-+for d in /usr/share/man /usr/man /usr/X11R6/man /usr/local/man
- do
-     if [ -d $d ]; then
- 	if [ x$dm = x ]; then dm=$d; else dm=$dm:$d; fi
-@@ -53,7 +53,7 @@
- done
- DEFMANPATH=$dm
- dc=
--for d in /usr/man/preformat /usr/man /usr/share/man/preformat /usr/share/man
-+for d in /var/cache/man /usr/share/man/preformat /usr/man/preformat /usr/share/man /usr/man
- do
-     if [ -d $d ]; then
- 	if [ x$dc = x ]; then dc=$d; else dc=$dc:$d; fi
-@@ -76,12 +76,12 @@
- # We try here to be careful (and avoid preconstructed symlinks)
- # in case makewhatis is run as root, by creating a subdirectory of /tmp.
- 
--TMPFILEDIR=/tmp/whatis.tmp.dir.$$
--rm -rf $TMPFILEDIR
--if ! mkdir -m 0700 $TMPFILEDIR; then
--    echo Could not create $TMPFILEDIR
--    exit 1;
-+TMPFILEDIR=`mktemp -d /tmp/makewhatisXXXXXX`
-+if [ $? -ne 0 ]; then
-+   echo "$0: Can't create temp file, exiting..."
-+   exit 1
- fi
-+chmod 0700 $TMPFILEDIR
- TMPFILE=$TMPFILEDIR/w
- 
- # make sure TMPFILEDIR is deleted if program is killed or terminates
-diff -Naur man-1.6e.orig/src/man.c man-1.6e/src/man.c
---- man-1.6e.orig/src/man.c	2006-05-01 17:34:22.000000000 -0300
-+++ man-1.6e/src/man.c	2007-05-18 10:11:33.000000000 -0300
-@@ -1234,7 +1234,6 @@
- #endif
- 
- 
--#if 0
-      {
- 	/* There are no known cases of buffer overflow caused by
- 	   excessively long environment variables. In case you find one,
-@@ -1257,7 +1256,6 @@
- 	   MAN_ICONV_PATH, MAN_ICONV_OPT, MAN_ICONV_INPUT_CHARSET,
- 	   MAN_ICONV_OUTPUT_CHARSET, NLSPATH, PATH */
-      }
--#endif
- 
- 
- #ifndef __FreeBSD__ 
diff --git a/meta/recipes-extended/man/man/man-1.6e-use_i18n_vars_in_a_std_way.patch b/meta/recipes-extended/man/man/man-1.6e-use_i18n_vars_in_a_std_way.patch
deleted file mode 100644
index 568f742100c..00000000000
--- a/meta/recipes-extended/man/man/man-1.6e-use_i18n_vars_in_a_std_way.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -Naur man-1.6e.orig/catopen/catopen.c man-1.6e/catopen/catopen.c
---- man-1.6e.orig/catopen/catopen.c	2005-08-20 20:26:06.000000000 -0300
-+++ man-1.6e/catopen/catopen.c	2007-05-18 11:31:05.000000000 -0300
-@@ -9,22 +9,63 @@
- extern char *index (const char *, int);         /* not always in <string.h> */
- extern char *my_malloc(int);	/* in util.c */
- 
-+/* if the program has sgid/suid privileges then getenv doesn't return
-+ * NLSPATH; so we set here a good default value.
-+ */
- #ifndef DEFAULT_NLSPATH
- # if __GLIBC__ >= 2
--#  define DEFAULT_NLSPATH "/usr/share/locale/%L/%N"
-+#  define DEFAULT_NLSPATH "/usr/share/locale/%L/%N:/usr/share/locale/%l_%t/%N:/usr/share/locale/%l/%N"
- # else
- #  define DEFAULT_NLSPATH "/usr/lib/locale/%N/%L"
- # endif
- #endif
- 
--static nl_catd my_catopenpath(char *name, char *path);
-+static nl_catd my_catopenpath(char *name, char *path, char *lang);
- 
- static				/* this source included in gripes.c */
- nl_catd
- my_catopen(char *name, int oflag) {
--  nl_catd fd;
-+  nl_catd fd = (nl_catd) -1;
-+
-+  /* using first the my_catopenpath, which looks with LANGUAGE
-+   * and only if it fails ressort to catopen, it gives better i18n
-+   */
-+  {
-+    char *nlspath, *lang, *s;
- 
--  fd = catopen(name, oflag);
-+    /*
-+     * "If NLSPATH does not exist in the environment, or if a
-+     * message catalog cannot be opened in any of the paths specified
-+     * by NLSPATH, then an implementation defined default path is used"
-+     */
-+    nlspath = getenv("NLSPATH");
-+    if (!nlspath)
-+      nlspath = DEFAULT_NLSPATH;
-+ 
-+    lang = getenv("LANGUAGE");
-+    if (!lang)
-+      lang = getenv("LC_ALL");
-+    if (!lang)
-+      lang = getenv("LC_MESSAGES");
-+    if (!lang)
-+      lang = getenv("LANG");
-+    if (!lang)
-+      lang = "";
-+ 
-+    while(*lang && (fd == (nl_catd) -1)) {
-+      s = index(lang, ':');
-+      if (s) *s = 0;
-+        fd = my_catopenpath(name, nlspath, lang);
-+      if (s) lang=s+1;
-+      else lang = "";
-+    }
-+    if (fd == (nl_catd) -1)
-+      fd = my_catopenpath(name, nlspath, "en");
-+  }
-+
-+  /* still not found, use the system catopen */
-+  if (fd == (nl_catd) -1)
-+    fd = catopen(name, oflag);
- 
-   if (fd == (nl_catd) -1 && oflag) {
-     oflag = 0;
-@@ -32,8 +73,6 @@
-   }
- 
-   if (fd == (nl_catd) -1) {
--    char *nlspath;
--
-     /* The libc catopen fails - let us see if we can do better */
-     /* The quotes below are from X/Open, XPG 1987, Vol. 3. */
- 
-@@ -58,17 +97,6 @@
- #endif
-     }
- 
--    /*
--     * "If NLSPATH does not exist in the environment, or if a
--     * message catalog cannot be opened in any of the paths specified
--     * by NLSPATH, then an implementation defined default path is used"
--     */
--
--    nlspath = getenv("NLSPATH");
--    if (nlspath)
--      fd = my_catopenpath(name, nlspath);
--    if (fd == (nl_catd) -1)
--      fd = my_catopenpath(name, DEFAULT_NLSPATH);
-   }
-   return fd;
- }
-@@ -90,15 +118,13 @@
-  *
-  */
- static nl_catd
--my_catopenpath(char *name, char *nlspath) {
--  int fd;
-+my_catopenpath(char *name, char *nlspath, char *lang) {
-   nl_catd cfd = (nl_catd) -1;
--  char *path0, *path, *s, *file, *lang, *lang_l, *lang_t, *lang_c;
-+  char *path0, *path, *s, *file, *lang_l, *lang_t, *lang_c;
-   int langsz, namesz, sz, lang_l_sz, lang_t_sz, lang_c_sz;
- 
-   namesz = strlen(name);
- 
--  lang = getenv("LANG");
-   if (!lang)
-     lang = "";
-   langsz = strlen(lang);
-@@ -194,14 +220,9 @@
-       path = s+1;
-     } else
-       path = 0;
--    fd = open(file, O_RDONLY);
--    if (fd != -1) {
--      /* we found the right catalog - but we don't know the
--	 type of nl_catd, so close it again and ask libc */
--      close(fd);
--      cfd = catopen(file, 0);
--      break;
--    }
-+	cfd = catopen(file, 0);
-+	if (cfd != (nl_catd) -1)
-+			break;
-   }
- 
-   free(path0);
-diff -Naur man-1.6e.orig/src/manpath.c man-1.6e/src/manpath.c
---- man-1.6e.orig/src/manpath.c	2006-08-03 18:18:33.000000000 -0300
-+++ man-1.6e/src/manpath.c	2007-05-18 11:02:48.000000000 -0300
-@@ -282,13 +282,14 @@
- 		/* We cannot use "lang = setlocale(LC_MESSAGES, NULL)" or so:
- 		   the return value of setlocale is an opaque string. */
- 		/* POSIX prescribes the order: LC_ALL, LC_MESSAGES, LANG */
--		if((lang = getenv("LC_ALL")) != NULL)
-+	        /* LANGUAGE is GNU/Linux and overrules all */
-+		if((lang = getenv("LANGUAGE")) != NULL)
- 			split2(dir, lang, add_to_mandirlist_x, perrs);
--		if((lang = getenv("LC_MESSAGES")) != NULL)
-+		else if((lang = getenv("LC_ALL")) != NULL)
- 			split2(dir, lang, add_to_mandirlist_x, perrs);
--		if((lang = getenv("LANG")) != NULL)
-+		else if((lang = getenv("LC_MESSAGES")) != NULL)
- 			split2(dir, lang, add_to_mandirlist_x, perrs);
--		if((lang = getenv("LANGUAGE")) != NULL)
-+		else if((lang = getenv("LANG")) != NULL)
- 			split2(dir, lang, add_to_mandirlist_x, perrs);
- 		add_to_mandirlist_x(dir, 0, perrs);
- 	}
diff --git a/meta/recipes-extended/man/man/man-1.6e-whatis2.patch b/meta/recipes-extended/man/man/man-1.6e-whatis2.patch
deleted file mode 100644
index fc4ed3135dd..00000000000
--- a/meta/recipes-extended/man/man/man-1.6e-whatis2.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: man-1.6f/src/makewhatis.sh
-===================================================================
---- man-1.6f.orig/src/makewhatis.sh	2010-12-29 13:51:45.000000000 -0800
-+++ man-1.6f/src/makewhatis.sh	2010-12-29 13:59:35.399799412 -0800
-@@ -164,10 +164,15 @@
- fi
- catpath=`echo ${catpath} | tr : ' '`
- 
-+#WHATIS_DIR=$DESTDIR/var/cache/man/`echo $here|sed -e 's!.*/man/!!g'`
-+WHATIS_DIR=$DESTDIR/var/cache/man/$LANG
-+[[ -d $WHATIS_DIR ]] || mkdir -p $WHATIS_DIR/
-+
- # first truncate all the whatis files that will be created new,
- # then only update - we might visit the same directory twice
- if [ x$update = x ]; then
--   cp /dev/null /var/cache/man/whatis
-+   mkdir -p $WHATIS_DIR/
-+   /bin/echo -n > $WHATIS_DIR/whatis
- fi
- 
- for pages in man cat
-@@ -180,13 +185,7 @@
- 	echo "about to enter $mandir" > /dev/stderr
-      fi
- 
--     # kludge for Slackware's /usr/man/preformat
--     if [ $mandir = /usr/man/preformat ]
--     then
--	mandir1=/usr/man
--     else
--	mandir1=$mandir
--     fi
-+     mandir1=$WHATIS_DIR
- 
-      # if $mandir is on a readonly partition, and the whatis file
-      # is not a symlink, then let's skip trying to update it
-@@ -207,11 +206,6 @@
- 	fi
-      fi
- 
--     if [ -s ${mandir}/whatis -a $pages = man -a x$update = x ]; then
--	if [ x$verbose != x ]; then
--	   echo skipping $mandir - we did it already > /dev/stderr
--	fi
--     else      
-        here=`pwd`
-        cd $mandir
-        for i in $sections
-@@ -447,7 +447,6 @@
-
-        chmod 644 ${mandir1}/whatis
-        rm $TMPFILE
--     fi
-    done
- done
diff --git a/meta/recipes-extended/man/man/man-1.6g-compile-warnings.patch b/meta/recipes-extended/man/man/man-1.6g-compile-warnings.patch
deleted file mode 100644
index 4631d2d0635..00000000000
--- a/meta/recipes-extended/man/man/man-1.6g-compile-warnings.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-Fix a build error when building man.config.5 (a remnant of a long
-ago previous patch). Optimized the manpages Makefile for parallel
-builds. Also, fix compile warnings in a couple other files.
-
-Upstream-Status: Pending
-
-Signed-off-by: Bill Randle <william.c.randle@intel.com>
-
---- man-1.6g/man/Makefile.in.orig	2016-03-28 17:31:08.723949180 -0700
-+++ man-1.6g/man/Makefile.in	2016-03-28 17:46:12.866910386 -0700
-@@ -5,6 +5,13 @@
- ALL = man.1 whatis.1 apropos.1 man.config.5
- MAYBE8 = makewhatis
- 
-+SUBDIRS := $(shell echo @languages@)
-+
-+.PHONY: subdirs $(SUBDIRS)
-+
-+man.config.man: man.conf.man
-+	@cp $< $@
-+
- .SUFFIXES: .man .1 .5 .8
- 
- .man.1:
-@@ -19,11 +26,11 @@
- INSTALL = @INSTALL@ -c -m 644
- 
- # Where to put the manual pages.
--mandir = $(DESTDIR)$(PREFIX)@mandir@$(SLANG)
-+mandir := $(DESTDIR)$(PREFIX)@mandir@$(SLANG)
- 
- all:	$(ALL)
- 	for i in $(MAYBE8); \
--		do if test -f $$i.man; then make -f ../Makefile $$i.8; fi; done
-+		do if test -f $$i.man; then $(MAKE) -f ../Makefile $$i.8; fi; done
- 
- install: $(ALL)
- 	mkdir -p $(mandir)/man1 $(mandir)/man5 $(mandir)/man8
-@@ -38,24 +45,27 @@
- 	rm -f core *.in *.@man1ext@ *.@man5ext@ *.@man8ext@ *~
- 
- spotless:
-+	rm -f man.config.man
- 
- subdirs:
--	@for i in @languages@; do if test -d $$i; then echo; \
--		echo "==== Making the `cat $$i.txt` man pages. ===="; \
--		cd $$i; make -f ../Makefile; cd ..; \
--		else echo "==== No $$i man pages found. ===="; fi; done
-+subdirs: $(SUBDIRS)
-+$(SUBDIRS):
-+	if test -d $@; then echo; \
-+		echo "==== Making the `cat $@.txt` man pages. ===="; \
-+		$(MAKE) -C $@ -f ../Makefile all; \
-+		else echo "==== No $@ man pages found. ===="; fi
- 
- installsubdirs:
- 	@for i in @languages@; do if test -d $$i; then echo; \
- 		echo "==== Installing the `cat $$i.txt` man pages. ===="; \
- 		cd $$i; SLANG=/$$i; if test $$SLANG = /en; then SLANG= ; fi; \
--		export SLANG; make -f ../Makefile install; cd ..; \
-+		export SLANG; $(MAKE) -f ../Makefile install; cd ..; \
- 		else echo "==== No $$i man pages found. ===="; fi; done
- 
- cleansubdirs:
--	@for i in ??; do cd $$i; make -f ../Makefile clean; cd ..; done
-+	@for i in ??; do $(MAKE) -C $$i -f ../Makefile clean; done
- 	rm -f core *~
- 
- spotlesssubdirs:
--	for i in ??; do cd $$i; make -f ../Makefile spotless; cd ..; done
-+	for i in ??; do $(MAKE) -C $$i -f ../Makefile spotless; done
- 	rm -f Makefile
-
---- man-1.6g/src/gripes.c.orig	2006-11-21 11:53:44.000000000 -0800
-+++ man-1.6g/src/gripes.c	2016-03-30 16:32:31.601103487 -0700
-@@ -7,8 +7,6 @@
- 
- extern char *msg[];
- 
--static char *mantexts = "man";		/* e.g. /usr/lib/locale/%L/man.cat */
--
- #ifdef NONLS
- 
- static char *
-@@ -30,6 +28,8 @@
- #include <nl_types.h>
- #include "../catopen/catopen.c"
- 
-+static char *mantexts = "man";		/* e.g. /usr/lib/locale/%L/man.cat */
-+
- nl_catd catfd = (nl_catd) -1;
- int cat_is_open = 0;
- 
---- man-1.6g/src/manfile.c.orig	2005-08-20 16:26:06.000000000 -0700
-+++ man-1.6g/src/manfile.c	2016-03-29 09:10:21.527841285 -0700
-@@ -299,7 +299,7 @@
- 	const char *((*tocat)(const char *man_filename, const char *ext,
- 			      int flags))) {
-      char **sl;
--     struct manpage *res;
-+     struct manpage *res = 0;
- 
-      standards = (flags & (FHS | FSSTND | DO_HP | DO_IRIX));
-      to_cat_filename = tocat;
diff --git a/meta/recipes-extended/man/man/man-1.6g-configure.patch b/meta/recipes-extended/man/man/man-1.6g-configure.patch
deleted file mode 100644
index 106cc987819..00000000000
--- a/meta/recipes-extended/man/man/man-1.6g-configure.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Use BUILD_CC and target include files for configuration tests.
-If cross-compiling, force pathnames for helper programs, since
-autodiscovery by the configure script will not work.
-
-Upstream-Status: Pending
-
-Signed-off-by: Bill Randle <william.c.randle at intel.com>
-
---- man-1.6g/configure.orig	2016-03-28 17:46:12.734910976 -0700
-+++ man-1.6g/configure	2016-03-30 21:47:45.110572908 -0700
-@@ -216,7 +216,8 @@
- INCLUDEDIR=${INCLUDEDIR-/usr/include}
- 
- rm -f conftest conftest.c
--compile="$CC $DEFS conftest.c -o conftest $LIBS >/dev/null 2>&1"
-+# since we are interested in target feature support, use that sysroot
-+compile="$BUILD_CC -isystem/${PKG_CONFIG_SYSROOT_DIR}/usr/include $DEFS conftest.c -o conftest $LIBS >/dev/null 2>&1"
- 
- # Check for various header files.
- 
-@@ -455,19 +456,23 @@
-       fi
-     done
-   done
--  Fgroff=/usr/bin/groff
--  Fnroff=/usr/bin/nroff
--  Fjnroff=/usr/bin/nroff
--  Fgeqn=/usr/bin/geqn
--  Fgtbl=/usr/bin/gtbl
--  Fcol=/usr/bin/col
--  Fgrefer=/usr/bin/grefer
--  Fgpic=/usr/bin/gpic
--  Fmore=/bin/more
--  Fless=/usr/bin/less
--  Fcmp=/usr/bin/cmp
--  Fcat=/bin/cat
--  Fgawk=/bin/gawk
-+  if [ $BUILD_CC != $CC ]; then
-+    # cross compiling => target fs not available, so force defaults
-+    Fgroff=/usr/bin/groff
-+    Fnroff=/usr/bin/nroff
-+    Fjnroff=/usr/bin/nroff
-+    Fgeqn=/usr/bin/eqn
-+    Fgneqn=/usr/bin/neqn
-+    Fgtbl=/usr/bin/tbl
-+    Fcol=/usr/bin/col
-+    Fgrefer=/usr/bin/refer
-+    Fgpic=/usr/bin/pic
-+    Fmore=/bin/more
-+    Fless=/usr/bin/less
-+    Fcmp=/usr/bin/cmp
-+    Fcat=/bin/cat
-+    Fgawk=/usr/bin/gawk
-+  fi
- 
- 
-   for i in eqn tbl refer pic
-@@ -507,8 +512,8 @@
-     jnroff="$Fjnroff -Tutf8 -mandocj"
-   fi
-   eqn="$Fgeqn -Tps"
--  neqn="$Fgeqn -Tutf8"
--  jneqn="$Fgeqn -Tutf8"
-+  neqn="$Fgneqn -Tutf8"
-+  jneqn="$Fgneqn -Tutf8"
-   tbl="$Fgtbl"
-   col="$Fcol"
-   vgrind="$Fvgrind"
diff --git a/meta/recipes-extended/man/man/man-1.6g-parallel.patch b/meta/recipes-extended/man/man/man-1.6g-parallel.patch
deleted file mode 100644
index 72a88b898a1..00000000000
--- a/meta/recipes-extended/man/man/man-1.6g-parallel.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-The Makefile for man has a rule to create two generated targets with
-a program run from the shell. Because the rule was run twice, with
-parallel make, the generated files were being overwritten at the same
-time they were being compiled. This patch forces the rule to be run
-only once.
-
-Upstream-Status: Pending
-
-Signed-off-by: Bill Randle <william.c.randle at intel.com>
-
---- man-1.6g/src/Makefile.in.orig	2010-12-31 12:28:46.000000000 -0800
-+++ man-1.6g/src/Makefile.in	2016-03-28 09:09:16.845458798 -0700
-@@ -43,8 +43,10 @@
- makemsg:
- 	$(BUILD_CC) -o makemsg makemsg.c
- 
--msg.c gripedefs.h: ../msgs/mess.en makemsg
-+msg.c gripedefs.h: genfiles-stamp
-+genfiles-stamp: ../msgs/mess.en makemsg
- 	./makemsg ../msgs/mess.en gripedefs.h msg.c
-+	touch genfiles-stamp
- 
- # glob.c does not have prototypes
- glob.o: glob.c ndir.h
-@@ -117,4 +119,4 @@
- 
- spotless: clean
- 	rm -f Makefile config.status paths.h version.h man.conf
--	rm -f gripedefs.h msg.c mess.*.cat
-+	rm -f gripedefs.h msg.c mess.*.cat genfiles-stamp
diff --git a/meta/recipes-extended/man/man/man-1.6g-whatis3.patch b/meta/recipes-extended/man/man/man-1.6g-whatis3.patch
deleted file mode 100644
index 63344568575..00000000000
--- a/meta/recipes-extended/man/man/man-1.6g-whatis3.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Do not use absolute path for awk while getting the path of awk
-when running makewhatis.
-This can avoid errors if path of awk changes.
-
-Upstream-Status: Submitted [man-1.6g]
-
-Signed-off-by: Jian Liu <jian.liu@windriver.com>
-
-diff -Nur man-1.6g.orig/src/makewhatis.sh man-1.6g/src/makewhatis.sh
---- man-1.6g.orig/src/makewhatis.sh	2015-02-25 16:13:12.657611419 +0800
-+++ man-1.6g/src/makewhatis.sh	2015-02-25 16:14:49.334694815 +0800
-@@ -67,7 +67,7 @@
- # but that leads to problems and bugs.
-
- # AWK=/usr/bin/gawk
--AWK=@awk@
-+AWK=`which awk`
-
- # Find a place for our temporary files. If security is not a concern, use
- #	TMPFILE=/tmp/whatis$$; TMPFILEDIR=none
diff --git a/meta/recipes-extended/man/man/man.1.gz b/meta/recipes-extended/man/man/man.1.gz
deleted file mode 100644
index c368045153406ab730aad35bfc7ffd91238bd47d..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 12323
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
J#~S#D004`l-XQ=0

diff --git a/meta/recipes-extended/man/man/man.7.gz b/meta/recipes-extended/man/man/man.7.gz
deleted file mode 100644
index e85af82426507521badb6f5c425896385f469b5a..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 6192
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
OO8yVmcsMtKI{*OKZ6#>{

diff --git a/meta/recipes-extended/man/man/man.conf b/meta/recipes-extended/man/man/man.conf
deleted file mode 100644
index fc10be2758d..00000000000
--- a/meta/recipes-extended/man/man/man.conf
+++ /dev/null
@@ -1,141 +0,0 @@
-#
-# Generated automatically from man.conf.in by the
-# configure script.
-#
-# man.conf from man-1.5p
-#
-# For more information about this file, see the man pages man(1)
-# and man.conf(5).
-#
-# This file is read by man to configure the default manpath (also used
-# when MANPATH contains an empty substring), to find out where the cat
-# pages corresponding to given man pages should be stored,
-# and to map each PATH element to a manpath element.
-# It may also record the pathname of the man binary. [This is unused.]
-# The format is:
-#
-# MANBIN		pathname
-# MANPATH		manpath_element	[corresponding_catdir]
-# MANPATH_MAP		path_element	manpath_element
-#
-# If no catdir is given, it is assumed to be equal to the mandir
-# (so that this dir has both man1 etc. and cat1 etc. subdirs).
-# This is the traditional Unix setup.
-# Certain versions of the FSSTND recommend putting formatted versions
-# of /usr/.../man/manx/page.x into /var/catman/.../catx/page.x.
-# The keyword FSSTND will cause this behaviour.
-# Certain versions of the FHS recommend putting formatted versions of
-# /usr/.../share/man/[locale/]manx/page.x into
-# /var/cache/man/.../[locale/]catx/page.x.
-# The keyword FHS will cause this behaviour (and overrides FSSTND).
-# Explicitly given catdirs override.
-#
-# FSSTND
-FHS
-#
-# This file is also read by man in order to find how to call nroff, less, etc.,
-# and to determine the correspondence between extensions and decompressors.
-#
-# MANBIN		/usr/local/bin/man
-#
-# Every automatically generated MANPATH includes these fields
-#
-MANPATH	/usr/man
-MANPATH	/usr/share/man
-MANPATH	/usr/local/man
-MANPATH	/usr/local/share/man
-MANPATH	/usr/X11R6/man
-#
-# Uncomment if you want to include one of these by default
-#
-# MANPATH	/opt/*/man
-# MANPATH	/usr/lib/*/man
-# MANPATH	/usr/share/*/man
-# MANPATH	/usr/kerberos/man
-#
-# Set up PATH to MANPATH mapping
-#
-# If people ask for "man foo" and have "/dir/bin/foo" in their PATH
-# and the docs are found in "/dir/man", then no mapping is required.
-#
-# The below mappings are superfluous when the right hand side is
-# in the mandatory manpath already, but will keep man from statting
-# lots of other nearby files and directories.
-#
-MANPATH_MAP	/bin			/usr/share/man
-MANPATH_MAP	/sbin			/usr/share/man
-MANPATH_MAP	/usr/bin		/usr/share/man
-MANPATH_MAP	/usr/sbin		/usr/share/man
-MANPATH_MAP	/usr/local/bin		/usr/local/share/man
-MANPATH_MAP	/usr/local/sbin		/usr/local/share/man
-MANPATH_MAP	/usr/X11R6/bin		/usr/X11R6/man
-MANPATH_MAP	/usr/bin/X11		/usr/X11R6/man
-MANPATH_MAP	/usr/bin/mh		/usr/share/man
-#
-# NOAUTOPATH keeps man from automatically adding directories that look like
-# manual page directories to the path.
-#
-#NOAUTOPATH
-#
-# NOCACHE keeps man from creating cache pages ("cat pages")
-# (generally one enables/disable cat page creation by creating/deleting
-# the directory they would live in - man never does mkdir)
-# 
-#NOCACHE
-#
-# Useful paths - note that COL should not be defined when
-# NROFF is defined as "groff -Tascii" or "groff -Tlatin1";
-# not only is it superfluous, but it actually damages the output.
-# For use with utf-8, NROFF should be "nroff -mandoc" without -T option.
-# (Maybe - but today I need -Tlatin1 to prevent double conversion to utf8.)
-#
-# If you have a new troff (version 1.18.1?) and its colored output
-# causes problems, add the -c option to TROFF, NROFF, JNROFF.
-#
-TROFF		/usr/bin/groff -Tps -mandoc
-NROFF		/usr/bin/nroff -Tlatin1 -mandoc
-JNROFF		/usr/bin/groff -Tnippon -mandocj
-EQN		/usr/bin/eqn -Tps
-NEQN		/usr/bin/eqn -Tlatin1
-JNEQN		/usr/bin/eqn -Tnippon
-TBL		/usr/bin/tbl
-# COL		/usr/bin/col
-REFER		/usr/bin/refer
-PIC		/usr/bin/pic
-VGRIND		
-GRAP		
-PAGER		/usr/bin/less -isR
-CAT		/bin/cat
-#
-# The command "man -a xyzzy" will show all man pages for xyzzy.
-# When CMP is defined man will try to avoid showing the same
-# text twice. (But compressed pages compare unequal.)
-#
-CMP		/usr/bin/cmp -s
-#
-# Compress cat pages
-#
-COMPRESS	/bin/bzip2
-COMPRESS_EXT	.bz2
-#
-# Default manual sections (and order) to search if -S is not specified
-# and the MANSECT environment variable is not set.
-#
-MANSECT		1:1p:8:2:3:3p:4:5:6:7:9:0p:tcl:n:l:p:o
-#
-# Default options to use when man is invoked without options
-# This is mainly for the benefit of those that think -a should be the default
-# Note that some systems have /usr/man/allman, causing pages to be shown twice.
-#
-#MANDEFOPTIONS	-a
-#
-# Decompress with given decompressor when input file has given extension
-# The command given must act as a filter.
-#
-.gz		/bin/gunzip -c
-.bz2		/usr/bin/bunzip2 -c
-.xz		/usr/bin/unxz -c
-.z		
-.Z		/bin/zcat
-.F		
-.Y		
diff --git a/meta/recipes-extended/man/man/manpath.5.gz b/meta/recipes-extended/man/man/manpath.5.gz
deleted file mode 100644
index c012ff89763bb057afaaaed3b616244748354fec..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 2133
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
L!Vpl2a}xjn5ok8&

diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
deleted file mode 100644
index ff603f842c1..00000000000
--- a/meta/recipes-extended/man/man_1.6g.bb
+++ /dev/null
@@ -1,86 +0,0 @@
-SUMMARY = "Online documentation tools"
-DESCRIPTION = "A set of documentation tools: man, apropos and whatis"
-SECTION = "console/utils"
-HOMEPAGE = "http://primates.ximian.com/~flucifredi/man"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-
-PR = "r1"
-
-DEPENDS = "groff less"
-
-def compress_pkg(d):
-    if "compress_doc" in (d.getVar("INHERIT") or "").split():
-         compress = d.getVar("DOC_COMPRESS")
-         if compress == "gz":
-             return "gzip"
-         elif compress == "bz2":
-             return "bzip2"
-         elif compress == "xz":
-             return "xz"
-    return ""
-
-RDEPENDS_${PN} += "${@compress_pkg(d)}"
-
-SRC_URI = "http://pkgs.fedoraproject.org/lookaside/pkgs/man2html/${BP}.tar.gz/ba154d5796928b841c9c69f0ae376660/${BP}.tar.gz \
-           file://man-1.5k-confpath.patch;striplevel=0 \
-           file://man-1.5h1-make.patch \
-           file://man-1.5k-nonascii.patch \
-           file://man-1.6e-security.patch \
-           file://man-1.6e-mandirs.patch \
-           file://man-1.5m2-bug11621.patch \
-           file://man-1.5k-sofix.patch \
-           file://man-1.5m2-buildroot.patch \
-           file://man-1.6e-ro_usr.patch \
-           file://man-1.5i2-newline.patch;striplevel=0 \
-           file://man-1.5j-utf8.patch \
-           file://man-1.5i2-overflow.patch \
-           file://man-1.5j-nocache.patch \
-           file://man-1.5i2-initial.patch \
-           file://man-1.5h1-gencat.patch;striplevel=0 \
-           file://man-1.5g-nonrootbuild.patch \
-           file://man-1.5j-i18n.patch \
-           file://man-1.6e-whatis2.patch \
-           file://man-1.6e-use_i18n_vars_in_a_std_way.patch \
-           file://man-1.5m2-no-color-for-printing.patch \
-           file://man-1.5m2-sigpipe.patch \
-           file://man-1.6e-i18n_whatis.patch \
-           file://man-1.6e-new_sections.patch \
-           file://man.1.gz;unpack=false \
-           file://man.7.gz;unpack=false \
-           file://man.conf \
-           file://manpath.5.gz;unpack=false \
-           file://man-1.6g-whatis3.patch \
-           file://configure_sed.patch \
-           file://man-1.6g-parallel.patch \
-           file://man-1.6g-compile-warnings.patch \
-           file://man-1.6g-configure.patch \
-"
-
-SRC_URI[md5sum] = "ba154d5796928b841c9c69f0ae376660"
-SRC_URI[sha256sum] = "ccdcb8c3f4e0080923d7e818f0e4a202db26c46415eaef361387c20995b8959f"
-
-CFLAGS += "-DSYSV"
-
-do_configure () {
-        ${S}/configure -default -confdir /etc +sgid +fhs +lang all
-}
-
-
-do_install() {
-        oe_runmake install DESTDIR=${D}
-}
-
-do_install_append(){
-	mkdir -p  ${D}${sysconfdir}
-        mkdir -p ${D}${datadir}/man/man5
-        mkdir -p ${D}${datadir}/man/man7
-	cp ${WORKDIR}/man.conf ${D}${sysconfdir}/man.config
-        cp ${WORKDIR}/man.1.gz ${D}${datadir}/man/man1/
-        cp ${WORKDIR}/man.7.gz ${D}${datadir}/man/man7/
-        cp ${WORKDIR}/manpath.5.gz ${D}${datadir}/man/man5/
-}
-
-
-RDEPENDS_${PN} = "less groff"
-FILES_${PN} += "${datadir}/locale ${sysconfdir}/man.config"
-- 
2.11.0


