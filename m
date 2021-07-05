Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.14455.1625510132847213200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 11:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TpKj8S8Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id ga42so12888373ejc.6
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M20WLgv/x1giMzvxHSpnfoJsDRwfkeQwFsnvdm6tgpQ=;
        b=TpKj8S8Y/gQSMlkvAkS8Wj33xGGvOMPJnu+A8NfdepsFMnFd+WV04m5dr3WVhUF3Lw
         mD3Z7KSCo25iU2z16MCjJerbj/4XC82eSViB8UolXuNMN6k7CLvmUKlSCP9MdpEpAZCi
         UQZiPStDs2U+0JuNYl6WXan6u5qMISHbga14zUPF+ULGYbqoiJALmGl3dRIDP4mHhWKS
         HVin3OTwGYlPx2StgC7FVt58zOi54VqoJDNmLQHZ82BOJK+zccBRkinPkkvDtQjpUf2H
         bQ0Hh6TfzUEqpUlq1o2eLnXS397leUqYLetGr7/KxJopAhA7Hc19Y8lCzeVO0JX7z9ym
         sGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M20WLgv/x1giMzvxHSpnfoJsDRwfkeQwFsnvdm6tgpQ=;
        b=EnNtlbAOVLwyUmL5ifPdhWP7gnfYlinJtb8BvfGsfLbOY3xXtcCasxL4ao9Vx6CKYc
         zJ6QFQ0L6X3KdqNjA2CAxmb2p8ScmvMlyPXIATz3bCWKJR0vmjP8XcwOZTmxwKfSykYN
         OXCI5Np1vYiByZFvBx1fSUhvz7w1bFX02eB6gb9x0wNmRTo/CWCil9NepUDMUOU+Vf7y
         Diy2kRzQVt8aikQod0vebK3tUF9UwFtzHr8xxpFDq2v3iftOpMEdBG02hNiC5WjR5alO
         eWd0lFAcOoQVB9NFK5k7vF3B06Z1G1GYIK/NB8yEEvQ5xbY+vauE00Cv9Kxlzk9lZhXS
         Wn1g==
X-Gm-Message-State: AOAM531tbRhE+BsIOHQRLM54YUuhmoNg/fLlirtdp9aPgUAHM4bJfScE
	pzHyAGtHKbWGKmm0DrYZ08LIfq6sQpJabA==
X-Google-Smtp-Source: ABdhPJwhpE4O5hd29A/tdOgNRCUp+e9zh/LvCJqkS/FkIJQieDc4xDCv8MniFj72zW8zsoKhmOaJFA==
X-Received: by 2002:a17:907:720e:: with SMTP id dr14mr14720502ejc.350.1625510131112;
        Mon, 05 Jul 2021 11:35:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id t27sm4656826eje.86.2021.07.05.11.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 11:35:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] texinfo: update 6.7 -> 6.8
Date: Mon,  5 Jul 2021 20:35:26 +0200
Message-Id: <20210705183526.72564-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop texinfo-4.12-zlib.patch as it completely lacks a description,
was added together with the original recipe without an explanation in
the commit message, and is difficult to rebase.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../texinfo/texinfo/texinfo-4.12-zlib.patch   | 254 ------------------
 .../{texinfo_6.7.bb => texinfo_6.8.bb}        |   4 +-
 2 files changed, 1 insertion(+), 257 deletions(-)
 delete mode 100644 meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
 rename meta/recipes-extended/texinfo/{texinfo_6.7.bb => texinfo_6.8.bb} (94%)

diff --git a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch b/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
deleted file mode 100644
index f72097e639..0000000000
--- a/meta/recipes-extended/texinfo/texinfo/texinfo-4.12-zlib.patch
+++ /dev/null
@@ -1,254 +0,0 @@
-From 3d3b66cf398853c666e724c3dbcc37d53a2240d5 Mon Sep 17 00:00:00 2001
-From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
-Date: Tue, 29 Nov 2016 12:27:17 -0600
-Subject: [PATCH] texinfo-4.12-zlib
-
-Upstream-Status: Pending
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
-
----
- install-info/Makefile.in    |  2 +-
- install-info/install-info.c | 79 ++++++++++++++++++++++---------------
- 2 files changed, 48 insertions(+), 33 deletions(-)
-
-diff --git a/install-info/Makefile.in b/install-info/Makefile.in
-index c924509..746df05 100644
---- a/install-info/Makefile.in
-+++ b/install-info/Makefile.in
-@@ -218,7 +218,7 @@ am__installdirs = "$(DESTDIR)$(bindir)" "$(DESTDIR)$(bindir)"
- PROGRAMS = $(bin_PROGRAMS)
- am_ginstall_info_OBJECTS = install-info.$(OBJEXT)
- ginstall_info_OBJECTS = $(am_ginstall_info_OBJECTS)
--ginstall_info_LDADD = $(LDADD)
-+ginstall_info_LDADD = $(LDADD) -lz
- am__DEPENDENCIES_1 =
- ginstall_info_DEPENDENCIES = $(top_builddir)/gnulib/lib/libgnu.a \
- 	$(am__DEPENDENCIES_1) $(am__DEPENDENCIES_1)
-diff --git a/install-info/install-info.c b/install-info/install-info.c
-index 21f4fe3..a7aba82 100644
---- a/install-info/install-info.c
-+++ b/install-info/install-info.c
-@@ -19,6 +19,7 @@
- #include <getopt.h>
- #include <regex.h>
- #include <argz.h>
-+#include <zlib.h>
- 
- #define TAB_WIDTH 8
- 
-@@ -681,15 +682,15 @@ The first time you invoke Info you start off looking at this node.\n\
-    
-    Return either stdin reading the file, or a non-stdin pipe reading
-    the output of the compression program.  */
--FILE *
-+void *
- open_possibly_compressed_file (char *filename,
-     void (*create_callback) (char *),
--    char **opened_filename, char **compression_program) 
-+    char **opened_filename, char **compression_program, int *is_pipe)
- {
-   char *local_opened_filename, *local_compression_program;
-   int nread;
-   char data[13];
--  FILE *f;
-+  gzFile *f;
- 
-   /* We let them pass NULL if they don't want this info, but it's easier
-      to always determine it.  */
-@@ -697,48 +698,48 @@ open_possibly_compressed_file (char *filename,
-     opened_filename = &local_opened_filename;
- 
-   *opened_filename = filename;
--  f = fopen (*opened_filename, FOPEN_RBIN);
-+  f = gzopen (*opened_filename, FOPEN_RBIN);
-   if (!f)
-     {
-       *opened_filename = concat (filename, ".gz", "");
--      f = fopen (*opened_filename, FOPEN_RBIN);
-+      f = gzopen (*opened_filename, FOPEN_RBIN);
-     }
-   if (!f)
-     {
-       free (*opened_filename);
-       *opened_filename = concat (filename, ".xz", "");
--      f = fopen (*opened_filename, FOPEN_RBIN);
-+      f = gzopen (*opened_filename, FOPEN_RBIN);
-     }
-   if (!f)
-     {
-       free (*opened_filename);
-       *opened_filename = concat (filename, ".bz2", "");
--      f = fopen (*opened_filename, FOPEN_RBIN);
-+      f = gzopen (*opened_filename, FOPEN_RBIN);
-     }
-   if (!f)
-     {
-       free (*opened_filename);
-       *opened_filename = concat (filename, ".lz", "");
--      f = fopen (*opened_filename, FOPEN_RBIN);
-+      f = gzopen (*opened_filename, FOPEN_RBIN);
-     }
-   if (!f)
-     {
-      free (*opened_filename);
-      *opened_filename = concat (filename, ".lzma", "");
--     f = fopen (*opened_filename, FOPEN_RBIN);
-+     f = gzopen (*opened_filename, FOPEN_RBIN);
-     }
- #ifdef __MSDOS__
-   if (!f)
-     {
-       free (*opened_filename);
-       *opened_filename = concat (filename, ".igz", "");
--      f = fopen (*opened_filename, FOPEN_RBIN);
-+      f = gzopen (*opened_filename, FOPEN_RBIN);
-     }
-   if (!f)
-     {
-       free (*opened_filename);
-       *opened_filename = concat (filename, ".inz", "");
--      f = fopen (*opened_filename, FOPEN_RBIN);
-+      f = gzopen (*opened_filename, FOPEN_RBIN);
-     }
- #endif /* __MSDOS__ */
-   if (!f)
-@@ -754,7 +755,7 @@ open_possibly_compressed_file (char *filename,
-           (*create_callback) (filename);
- 
-           /* And try opening it again.  */
--          f = fopen (*opened_filename, FOPEN_RBIN);
-+          f = gzopen (*opened_filename, FOPEN_RBIN);
-           if (!f)
-             return 0;
-         }
-@@ -764,26 +765,26 @@ open_possibly_compressed_file (char *filename,
- 
-   /* Read first few bytes of file rather than relying on the filename.
-      If the file is shorter than this it can't be usable anyway.  */
--  nread = fread (data, sizeof (data), 1, f);
--  if (nread != 1)
-+  nread = gzread (f, data, sizeof (data));
-+  if (nread != sizeof (data))
-     {
--      if (nread == 0)
-+      if (nread >= 0)
-         {
-           /* Try to create the file if its empty. */
--          if (feof (f) && create_callback)
-+          if (gzeof(f) && create_callback)
-             {
--              if (fclose (f) != 0)
-+              if (gzclose(f) != 0)
-                 return 0; /* unknown error closing file */
- 
--              if (remove (filename) != 0)
-+              if (remove(filename) != 0)
-                 return 0; /* unknown error deleting file */
- 
-               (*create_callback) (filename);
--              f = fopen (*opened_filename, FOPEN_RBIN);
-+              f = gzopen (*opened_filename, FOPEN_RBIN);
-               if (!f)
-                 return 0;
--              nread = fread (data, sizeof (data), 1, f);
--              if (nread == 0)
-+              nread = gzread(f, data, sizeof (data));
-+              if (nread >= 0)
-                 return 0;
-               goto determine_file_type; /* success */
-             }
-@@ -854,35 +855,40 @@ determine_file_type:
-     *compression_program = NULL;
- 
-   /* Seek back over the magic bytes.  */
--  if (fseek (f, 0, 0) < 0)
-+  if (gzseek (f, 0, SEEK_SET) == -1)
-     return 0;
- 
-   if (*compression_program)
-     { /* It's compressed, so open a pipe.  */
-+      FILE *p;
-       char *command = concat (*compression_program, " -d", "");
- 
--      if (fclose (f) < 0)
-+      if (gzclose (f) < 0)
-         return 0;
--      f = freopen (*opened_filename, FOPEN_RBIN, stdin);
--      if (!f)
-+      p = freopen (*opened_filename, FOPEN_RBIN, stdin);
-+      if (!p)
-         return 0;
--      f = popen (command, "r");
--      if (!f)
-+      p = popen (command, "r");
-+      if (!p)
-         {
-           /* Used for error message in calling code. */
-           *opened_filename = command;
-           return 0;
-         }
-+      else
-+        *is_pipe = 1;
-+      return p;
-     }
-   else
-     {
--#if O_BINARY
-+#if 0 && O_BINARY
-       /* Since this is a text file, and we opened it in binary mode,
-          switch back to text mode.  */
-       f = freopen (*opened_filename, "r", f);
-       if (! f)
- 	return 0;
- #endif
-+      *is_pipe = 0;
-     }
- 
-   return f;
-@@ -901,7 +907,8 @@ readfile (char *filename, int *sizep,
-     void (*create_callback) (char *), char **opened_filename,
-     char **compression_program)
- {
--  FILE *f;
-+  void *f;
-+  int pipe_p;
-   int filled = 0;
-   int data_size = 8192;
-   char *data = xmalloc (data_size);
-@@ -909,14 +916,20 @@ readfile (char *filename, int *sizep,
-   /* If they passed the space for the file name to return, use it.  */
-   f = open_possibly_compressed_file (filename, create_callback,
-                                      opened_filename,
--                                     compression_program);
-+                                     compression_program,
-+                                     &pipe_p);
- 
-   if (!f)
-     return 0;
- 
-   for (;;)
-     {
--      int nread = fread (data + filled, 1, data_size - filled, f);
-+      int nread;
-+
-+      if (pipe_p)
-+        nread = fread (data + filled, 1, data_size - filled, f);
-+      else
-+        nread = gzread (f, data + filled, data_size - filled);
-       if (nread < 0)
-         return 0;
-       if (nread == 0)
-@@ -935,8 +948,10 @@ readfile (char *filename, int *sizep,
-   /* We need to close the stream, since on some systems the pipe created
-      by popen is simulated by a temporary file which only gets removed
-      inside pclose.  */
--  if (f != stdin)
-+  if (pipe_p)
-     pclose (f);
-+  else
-+    gzclose (f);
- 
-   *sizep = filled;
-   return data;
diff --git a/meta/recipes-extended/texinfo/texinfo_6.7.bb b/meta/recipes-extended/texinfo/texinfo_6.8.bb
similarity index 94%
rename from meta/recipes-extended/texinfo/texinfo_6.7.bb
rename to meta/recipes-extended/texinfo/texinfo_6.8.bb
index d421b79a0b..e5046ffbe1 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.7.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.8.bb
@@ -29,15 +29,13 @@ TARGET_PATCH = "file://use_host_makedoc.patch"
 TARGET_PATCH_class-native = ""
 
 SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
-           file://texinfo-4.12-zlib.patch \
            file://disable-native-tools.patch \
            file://link-zip.patch \
            file://dont-depend-on-help2man.patch \
            ${TARGET_PATCH} \
            "
 
-SRC_URI[md5sum] = "f0c1782f68ef73738d74bd1e9e30793a"
-SRC_URI[sha256sum] = "a52d05076b90032cb2523673c50e53185938746482cf3ca0213e9b4b50ac2d3e"
+SRC_URI[sha256sum] = "8e09cf753ad1833695d2bac0f57dc3bd6bcbbfbf279450e1ba3bc2d7fb297d08"
 
 tex_texinfo = "texmf/tex/texinfo"
 
-- 
2.31.1

