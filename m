Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 653827F849
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:50:11 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z7so4139827wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=A0DtLP90QW3uZZ9LqEGOZyAIMPy59f7+Lbjg1auGgLk=;
	b=XAGbeWKIUfO1rxDkXZ0l7P+VJiGnp0jzzoLeib8lzUZ5RcYUxBFscUSd1BaK0ReXVs
	nKSr9XdT5KltLvqYZxW4GpFtcYDD8566jXZQ4Ll33NqJHn4DJWdG9HlpSxqWPfo5hhnx
	4//d86opIvL7Wwc9F2srDiBdOHiCJTHkOsqOST/OEUzmI3Guc0sNE5DtJHOHmI2dT8U4
	qmisqvFL3QvpP8AmG/Xl1UDWXs13PXeBP9zehiqvDUak5vsfvj2pddEDSj2HRpmqZLa5
	B54rUBxvuaEz6ziq4juFF5fT6mYoylzIF9xGNkNtsYXj3pn/Pli10SnU8p9dbgeL6CUI
	X9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A0DtLP90QW3uZZ9LqEGOZyAIMPy59f7+Lbjg1auGgLk=;
	b=Jqde2NT/L3+8/6hNohLy3QDaqS51p3cfCO4FoPKUsSrvLcJxsN/6m+itZiqhOtqdc1
	hMBcu4zB6IStfyVN+KG5iaguGo15Cwt4+/RD9FgMzP8z6V9oopLwnjAjARKatozIHK3U
	vy5eviQAwf3azG2WqTH5JWm/XCofRCQ+A/hH2+qICLlCt5BhR/Azfz03AlUdel53OqjL
	j+rGnU6+kRsyrJSDV/1bfA1/JkqVsmdE0rZjqFYc1cd5J23JT2T+58wc0mJhVV4xaAsv
	EevOHolVlgfWrjdpTXAyHyeQgwpWQZzmbPM/z1xRm/wMpPRD01grHIvOf3yRwmpOGccW
	TR9g==
X-Gm-Message-State: APjAAAUN2ZjxnjKjzEQdRxMptIqTxnPzR7B2lw0wHHrIKugLmUlFwdT3
	4xlQTt/LiHzwQG19UFHsQEZOy3gW
X-Google-Smtp-Source: APXvYqw6eB6MjzXNEsyIWQb0ZgDGpcVBQrv5CDjtVM/9pj5SQSJD1l3D/g+mO5UT0BNu7xhqG2/SoA==
X-Received: by 2002:a5d:61cf:: with SMTP id q15mr11218826wrv.231.1575561011812;
	Thu, 05 Dec 2019 07:50:11 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	e16sm12908821wrj.80.2019.12.05.07.50.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:50:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:50:05 +0100
Message-Id: <20191205155005.121749-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] texinfo: update to 6.7
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
X-List-Received-Date: Thu, 05 Dec 2019 15:50:11 -0000

Drop 0001-Unset-need_charset_alias-when-building-for-musl.patch
as the problematic code is gone.

Rebase the other patches.

License-Update: http links changed to https
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...charset_alias-when-building-for-musl.patch | 30 ---------------
 .../texinfo/dont-depend-on-help2man.patch     | 23 +++++------
 .../texinfo/texinfo/link-zip.patch            | 23 +++++++----
 .../texinfo/texinfo/texinfo-4.12-zlib.patch   | 38 +++++++++----------
 .../{texinfo_6.5.bb => texinfo_6.7.bb}        |  9 ++---
 5 files changed, 49 insertions(+), 74 deletions(-)
 delete mode 100644 meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch
 rename meta/recipes-extended/texinfo/{texinfo_6.5.bb => texinfo_6.7.bb} (90%)

diff --git a/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index c7338aa470f..00000000000
--- a/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: texinfo-5.2/gnulib/lib/Makefile.am
-===================================================================
---- texinfo-5.2.orig/gnulib/lib/Makefile.am
-+++ texinfo-5.2/gnulib/lib/Makefile.am
-@@ -378,7 +378,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch b/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
index f4184399c79..0d6bbafaddc 100644
--- a/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
+++ b/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
@@ -1,4 +1,4 @@
-From e89b1c57d76f5cf5acbb0d0187374f7a77bce1e2 Mon Sep 17 00:00:00 2001
+From 63a803ead3656353329a801846a9a3beb7210c46 Mon Sep 17 00:00:00 2001
 From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 Date: Tue, 29 Nov 2016 13:43:24 -0600
 Subject: [PATCH] dont-depend-on-help2man
@@ -7,29 +7,30 @@ Upstream-Status: Inappropriate
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
+
 ---
  doc/Makefile.am |  2 +-
  man/Makefile.am | 12 ++++++------
  2 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/doc/Makefile.am b/doc/Makefile.am
-index 39db834..1bb2a4f
+index 732833e..041cb9b 100644
 --- a/doc/Makefile.am
 +++ b/doc/Makefile.am
-@@ -38,7 +38,7 @@ refcard_files = refcard/Makefile refcard/txicmdcheck \
+@@ -37,7 +37,7 @@ refcard_files = refcard/Makefile refcard/txicmdcheck \
  # Include our texinfo.tex, not Automake's.
  EXTRA_DIST = epsf.tex texinfo.tex \
               fdl.texi \
 -	     $(man_MANS) $(TXI_XLATE) \
 +	     $(TXI_XLATE) \
-              $(refcard_files) texinfo-tex-test.texi \
+              $(refcard_files) \
+ 	     texinfo-tex-test.texi texinfo-tex-test.WIDOWs \
               texinfo-ja.tex short-sample-ja.texi
- 
 diff --git a/man/Makefile.am b/man/Makefile.am
-index 6bfcb3d..a820c96
+index d0cd72c..a19e52a 100644
 --- a/man/Makefile.am
 +++ b/man/Makefile.am
-@@ -13,24 +13,24 @@
+@@ -11,27 +11,27 @@
  # implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  
  # These are generated using help2man.
@@ -47,10 +48,13 @@ index 6bfcb3d..a820c96
 -man_MANS += info.5 texinfo.5
 +#man_MANS += info.5 texinfo.5
  
- # This is generated by pod2man, but let's just run it by hand.
 -man_MANS += pod2texi.1
 +#man_MANS += pod2texi.1
  
+ pod2texi.1: $(top_srcdir)/Pod-Simple-Texinfo/pod2texi.pl
+ 	$(POD2MAN) $(top_srcdir)/Pod-Simple-Texinfo/pod2texi.pl >"$@"
+ 
+ 
  # These are just .so's to the common program.
 -man_MANS += texi2any.1 texi2pdf.1 pdftexi2dvi.1
 +#man_MANS += texi2any.1 texi2pdf.1 pdftexi2dvi.1
@@ -60,6 +64,3 @@ index 6bfcb3d..a820c96
  
  # Maintainers should be able to regenerate.
  MAINTAINERCLEANFILES = $(man_MANS)
--- 
-2.9.3
-
diff --git a/meta/recipes-extended/texinfo/texinfo/link-zip.patch b/meta/recipes-extended/texinfo/texinfo/link-zip.patch
index 0b6e9fd7ea0..15c030c0c61 100644
--- a/meta/recipes-extended/texinfo/texinfo/link-zip.patch
+++ b/meta/recipes-extended/texinfo/texinfo/link-zip.patch
@@ -1,16 +1,23 @@
-install-info uses symbols from zlib so must link against it.
+From c1002138033fcccb2d1abfc41f5c2e46c836f7a0 Mon Sep 17 00:00:00 2001
+From: Joshua Lock <josh@linux.intel.com>
+Date: Mon, 29 Jul 2013 15:02:34 -0700
+Subject: [PATCH] install-info uses symbols from zlib so must link against it.
 
 Upstream-Status: Pending
 
 Signed-off-by: Joshua Lock <josh@linux.intel.com>
 
-Index: texinfo-5.1/install-info/Makefile.am
-===================================================================
---- texinfo-5.1.orig/install-info/Makefile.am
-+++ texinfo-5.1/install-info/Makefile.am
-@@ -34,4 +34,4 @@ AM_CPPFLAGS = 					\
+---
+ install-info/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/install-info/Makefile.am b/install-info/Makefile.am
+index 9bcff71..68247f9 100644
+--- a/install-info/Makefile.am
++++ b/install-info/Makefile.am
+@@ -33,4 +33,4 @@ AM_CPPFLAGS = 					\
    -I$(top_srcdir)/gnulib/lib			\
    -I$(top_builddir)/gnulib/lib			\
    -DLOCALEDIR=\"$(localedir)\"
--LDADD = $(top_builddir)/gnulib/lib/libgnu.a $(LIBINTL)
-+LDADD = $(top_builddir)/gnulib/lib/libgnu.a $(LIBINTL) -lz
+-LDADD = $(top_builddir)/gnulib/lib/libgnu.a $(LIBINTL) $(LIBTHREAD)
++LDADD = $(top_builddir)/gnulib/lib/libgnu.a $(LIBINTL) $(LIBTHREAD) -lz
diff --git a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch b/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
index f25352c636f..f72097e6394 100644
--- a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
+++ b/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
@@ -1,4 +1,4 @@
-From fe4f00459601efe0cfa75d92749a32237800a530 Mon Sep 17 00:00:00 2001
+From 3d3b66cf398853c666e724c3dbcc37d53a2240d5 Mon Sep 17 00:00:00 2001
 From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 Date: Tue, 29 Nov 2016 12:27:17 -0600
 Subject: [PATCH] texinfo-4.12-zlib
@@ -7,16 +7,17 @@ Upstream-Status: Pending
 
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
+
 ---
- install-info/Makefile.in    | 12 ++-----
- install-info/install-info.c | 79 +++++++++++++++++++++++++++------------------
- 2 files changed, 49 insertions(+), 42 deletions(-)
+ install-info/Makefile.in    |  2 +-
+ install-info/install-info.c | 79 ++++++++++++++++++++++---------------
+ 2 files changed, 48 insertions(+), 33 deletions(-)
 
 diff --git a/install-info/Makefile.in b/install-info/Makefile.in
-index 837d020..ba96579 100644
+index c924509..746df05 100644
 --- a/install-info/Makefile.in
 +++ b/install-info/Makefile.in
-@@ -216,7 +208,7 @@ am__installdirs = "$(DESTDIR)$(bindir)" "$(DESTDIR)$(bindir)"
+@@ -218,7 +218,7 @@ am__installdirs = "$(DESTDIR)$(bindir)" "$(DESTDIR)$(bindir)"
  PROGRAMS = $(bin_PROGRAMS)
  am_ginstall_info_OBJECTS = install-info.$(OBJEXT)
  ginstall_info_OBJECTS = $(am_ginstall_info_OBJECTS)
@@ -24,12 +25,12 @@ index 837d020..ba96579 100644
 +ginstall_info_LDADD = $(LDADD) -lz
  am__DEPENDENCIES_1 =
  ginstall_info_DEPENDENCIES = $(top_builddir)/gnulib/lib/libgnu.a \
- 	$(am__DEPENDENCIES_1)
+ 	$(am__DEPENDENCIES_1) $(am__DEPENDENCIES_1)
 diff --git a/install-info/install-info.c b/install-info/install-info.c
-index e58189c..8617787 100644
+index 21f4fe3..a7aba82 100644
 --- a/install-info/install-info.c
 +++ b/install-info/install-info.c
-@@ -22,6 +22,7 @@
+@@ -19,6 +19,7 @@
  #include <getopt.h>
  #include <regex.h>
  #include <argz.h>
@@ -37,7 +38,7 @@ index e58189c..8617787 100644
  
  #define TAB_WIDTH 8
  
-@@ -684,15 +685,15 @@ The first time you invoke Info you start off looking at this node.\n\
+@@ -681,15 +682,15 @@ The first time you invoke Info you start off looking at this node.\n\
     
     Return either stdin reading the file, or a non-stdin pipe reading
     the output of the compression program.  */
@@ -56,7 +57,7 @@ index e58189c..8617787 100644
  
    /* We let them pass NULL if they don't want this info, but it's easier
       to always determine it.  */
-@@ -700,48 +701,48 @@ open_possibly_compressed_file (char *filename,
+@@ -697,48 +698,48 @@ open_possibly_compressed_file (char *filename,
      opened_filename = &local_opened_filename;
  
    *opened_filename = filename;
@@ -113,7 +114,7 @@ index e58189c..8617787 100644
      }
  #endif /* __MSDOS__ */
    if (!f)
-@@ -757,7 +758,7 @@ open_possibly_compressed_file (char *filename,
+@@ -754,7 +755,7 @@ open_possibly_compressed_file (char *filename,
            (*create_callback) (filename);
  
            /* And try opening it again.  */
@@ -122,7 +123,7 @@ index e58189c..8617787 100644
            if (!f)
              return 0;
          }
-@@ -767,26 +768,26 @@ open_possibly_compressed_file (char *filename,
+@@ -764,26 +765,26 @@ open_possibly_compressed_file (char *filename,
  
    /* Read first few bytes of file rather than relying on the filename.
       If the file is shorter than this it can't be usable anyway.  */
@@ -158,7 +159,7 @@ index e58189c..8617787 100644
                  return 0;
                goto determine_file_type; /* success */
              }
-@@ -857,35 +858,40 @@ determine_file_type:
+@@ -854,35 +855,40 @@ determine_file_type:
      *compression_program = NULL;
  
    /* Seek back over the magic bytes.  */
@@ -206,7 +207,7 @@ index e58189c..8617787 100644
      }
  
    return f;
-@@ -904,7 +910,8 @@ readfile (char *filename, int *sizep,
+@@ -901,7 +907,8 @@ readfile (char *filename, int *sizep,
      void (*create_callback) (char *), char **opened_filename,
      char **compression_program)
  {
@@ -216,7 +217,7 @@ index e58189c..8617787 100644
    int filled = 0;
    int data_size = 8192;
    char *data = xmalloc (data_size);
-@@ -912,14 +919,20 @@ readfile (char *filename, int *sizep,
+@@ -909,14 +916,20 @@ readfile (char *filename, int *sizep,
    /* If they passed the space for the file name to return, use it.  */
    f = open_possibly_compressed_file (filename, create_callback,
                                       opened_filename,
@@ -239,7 +240,7 @@ index e58189c..8617787 100644
        if (nread < 0)
          return 0;
        if (nread == 0)
-@@ -938,8 +951,10 @@ readfile (char *filename, int *sizep,
+@@ -935,8 +948,10 @@ readfile (char *filename, int *sizep,
    /* We need to close the stream, since on some systems the pipe created
       by popen is simulated by a temporary file which only gets removed
       inside pclose.  */
@@ -251,6 +252,3 @@ index e58189c..8617787 100644
  
    *sizep = filled;
    return data;
--- 
-2.9.3
-
diff --git a/meta/recipes-extended/texinfo/texinfo_6.5.bb b/meta/recipes-extended/texinfo/texinfo_6.7.bb
similarity index 90%
rename from meta/recipes-extended/texinfo/texinfo_6.5.bb
rename to meta/recipes-extended/texinfo/texinfo_6.7.bb
index 50eae77ad0a..d421b79a0b9 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.5.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.7.bb
@@ -5,7 +5,7 @@ GNU Project uses the Texinfo file format for most of its documentation."
 HOMEPAGE = "http://www.gnu.org/software/texinfo/"
 SECTION = "console/utils"
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 PROVIDES_append_class-native = " texinfo-replacement-native"
 
@@ -33,12 +33,11 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            file://disable-native-tools.patch \
            file://link-zip.patch \
            file://dont-depend-on-help2man.patch \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            ${TARGET_PATCH} \
-          "
+           "
 
-SRC_URI[md5sum] = "94e8f7149876793030e5518dd8d6e956"
-SRC_URI[sha256sum] = "d34272e4042c46186ddcd66bd5d980c0ca14ff734444686ccf8131f6ec8b1427"
+SRC_URI[md5sum] = "f0c1782f68ef73738d74bd1e9e30793a"
+SRC_URI[sha256sum] = "a52d05076b90032cb2523673c50e53185938746482cf3ca0213e9b4b50ac2d3e"
 
 tex_texinfo = "texmf/tex/texinfo"
 
-- 
2.17.1


