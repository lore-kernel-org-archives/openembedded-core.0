Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2805C61507
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:00:58 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id j9so9102371pfa.8
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AwZ8tKhes6FF4fxR7PdcO27xy6wr/B2n3+hSbs/GJB8=;
	b=hGyVa80OlIuTlFAnd3zdbbKejAIYwgIoDe3qdIoFhEVWJaRwMjRo5Z16hGZXCBKG4g
	dLN39X3tRWpz3EaUepwI28pEJaOuuHD18vF1EIKoYDg6aX5QGGOOqRSL6EnR7huy5qf5
	lAs9kx6i3H6+0Y8uFEZk4fHbGCXPpTpoJJms7k4wSZi9OP8KdJymYa+BB3573Ft8XZT9
	j944bcIM+4CxK0slh2xDif4F6OLNpm66W+jF92ayLU2JPQYEwrUCslGglo7WdKxRlu8A
	aA6PR7MXmIKLn53Ywg9IoehUmFZz5cJUVcWb7oEfpwRwbYV4/9ki0MD9URfGYeI1+g4c
	O8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AwZ8tKhes6FF4fxR7PdcO27xy6wr/B2n3+hSbs/GJB8=;
	b=nKfTkAaP5EDGIvaXzXILjcaJgGEnzx7jW242bapJ0V2t7bAqTYmkRZnsqHj9tq+2zu
	0GpU4vAbEqG2sebixqtqnUNaQvVEYPVTp/bfOaMROMxzFdnsfRj3xKPIDhQRAaXN8znW
	+AerbjzYfrPRtCboKWaRXZYmRfExtKRz7nloMW25tnqKVqw0BRAXMfWyzF/tBIIVNCBr
	DFP3xzVOvPqBa9bvLN4PSnD8pLEM0d5GbS14AxRodQEwWRvVZjXuQl97aicN/W71z/GF
	GoVH3WbWtc/U321bl5zph7rtxmtiwrFw35g6SWnfaHBQYnND6bmYVklC735i8YizpocP
	EvZQ==
X-Gm-Message-State: APjAAAVS6TEVI765RtEaW/xWmHk9NlH+o/4UDdgLCogUV/3x0Bc9O3il
	tPdKE+QbyoJXS2IYcF5r0RV5j1cC
X-Google-Smtp-Source: APXvYqwIlwk63KX6HbPAQE+XFlBDSjHpL96xxQiX4n18FS/oPburq0bekqlgb1X2GH5SfkQcn/VX8w==
X-Received: by 2002:a62:188:: with SMTP id 130mr17409615pfb.249.1581955259306; 
	Mon, 17 Feb 2020 08:00:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.00.58
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:00:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:41 -0800
Message-Id: <ea0553398a2882a7a6e3c276dd3d81129a417a25.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
Subject: [warrior 03/14] cpio: fix CVE-2019-14866
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
X-List-Received-Date: Mon, 17 Feb 2020 16:00:59 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit 3a9872c664cdc5c5a6ac712142ce1d28d6fcd6d1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../cpio/cpio-2.12/CVE-2019-14866.patch       | 316 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.12.bb       |   1 +
 2 files changed, 317 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.12/CVE-2019-14866.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.12/CVE-2019-14866.patch b/meta/recipes-extended/cpio/cpio-2.12/CVE-2019-14866.patch
new file mode 100644
index 0000000000..5d587fc832
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.12/CVE-2019-14866.patch
@@ -0,0 +1,316 @@
+CVE: CVE-2019-14866
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=7554e3e42cd72f6f8304410c47fe6f8918e9bfd7]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+From a052401293e45a13cded5959b258204dae6d0af5 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sun, 3 Nov 2019 23:59:39 +0200
+Subject: [PATCH] Fix CVE-2019-14866
+
+* src/copyout.c (to_ascii): Additional argument nul controls whether
+to add the terminating nul character.
+(field_width_error): Improve diagnostics: print the actual and the
+maximum allowed field value.
+* src/extern.h (to_ascii, field_width_error): New prototypes.
+* src/tar.c (to_oct): Remove.
+(to_oct_or_error): New function.
+(TO_OCT): New macro.
+(write_out_tar_header): Use TO_OCT and to_ascii. Return 0 on
+success, 1 on error.
+---
+ src/copyout.c | 49 ++++++++++++++++++++++--------------
+ src/extern.h  | 15 +++++++++--
+ src/tar.c     | 69 ++++++++++++++++++++++++---------------------------
+ 3 files changed, 75 insertions(+), 58 deletions(-)
+
+diff --git a/src/copyout.c b/src/copyout.c
+index 1f0987a..1ae5477 100644
+--- a/src/copyout.c
++++ b/src/copyout.c
+@@ -269,26 +269,32 @@ writeout_final_defers (int out_des)
+    so it should be moved to paxutils too.
+    Allowed values for logbase are: 1 (binary), 2, 3 (octal), 4 (hex) */
+ int
+-to_ascii (char *where, uintmax_t v, size_t digits, unsigned logbase)
++to_ascii (char *where, uintmax_t v, size_t digits, unsigned logbase, bool nul)
+ {
+   static char codetab[] = "0123456789ABCDEF";
+-  int i = digits;
+-  
+-  do
++
++  if (nul)
++    where[--digits] = 0;
++  while (digits > 0)
+     {
+-      where[--i] = codetab[(v & ((1 << logbase) - 1))];
++      where[--digits] = codetab[(v & ((1 << logbase) - 1))];
+       v >>= logbase;
+     }
+-  while (i);
+ 
+   return v != 0;
+ }
+ 
+-static void
+-field_width_error (const char *filename, const char *fieldname)
++void
++field_width_error (const char *filename, const char *fieldname,
++		   uintmax_t value, size_t width, bool nul)
+ {
+-  error (0, 0, _("%s: field width not sufficient for storing %s"),
+-	 filename, fieldname);
++  char valbuf[UINTMAX_STRSIZE_BOUND + 1];
++  char maxbuf[UINTMAX_STRSIZE_BOUND + 1];
++  error (0, 0, _("%s: value %s %s out of allowed range 0..%s"),
++	 filename, fieldname,
++	 STRINGIFY_BIGINT (value, valbuf),
++	 STRINGIFY_BIGINT (MAX_VAL_WITH_DIGITS (width - nul, LG_8),
++			   maxbuf));
+ }
+ 
+ static void
+@@ -303,7 +309,7 @@ to_ascii_or_warn (char *where, uintmax_t n, size_t digits,
+ 		  unsigned logbase,
+ 		  const char *filename, const char *fieldname)
+ {
+-  if (to_ascii (where, n, digits, logbase))
++  if (to_ascii (where, n, digits, logbase, false))
+     field_width_warning (filename, fieldname);
+ }    
+ 
+@@ -312,9 +318,9 @@ to_ascii_or_error (char *where, uintmax_t n, size_t digits,
+ 		   unsigned logbase,
+ 		   const char *filename, const char *fieldname)
+ {
+-  if (to_ascii (where, n, digits, logbase))
++  if (to_ascii (where, n, digits, logbase, false))
+     {
+-      field_width_error (filename, fieldname);
++      field_width_error (filename, fieldname, n, digits, false);
+       return 1;
+     }
+   return 0;
+@@ -371,7 +377,7 @@ write_out_new_ascii_header (const char *magic_string,
+ 			 _("name size")))
+     return 1;
+   p += 8;
+-  to_ascii (p, file_hdr->c_chksum & 0xffffffff, 8, LG_16);
++  to_ascii (p, file_hdr->c_chksum & 0xffffffff, 8, LG_16, false);
+ 
+   tape_buffered_write (ascii_header, out_des, sizeof ascii_header);
+ 
+@@ -388,7 +394,7 @@ write_out_old_ascii_header (dev_t dev, dev_t rdev,
+   char ascii_header[76];
+   char *p = ascii_header;
+   
+-  to_ascii (p, file_hdr->c_magic, 6, LG_8);
++  to_ascii (p, file_hdr->c_magic, 6, LG_8, false);
+   p += 6;
+   to_ascii_or_warn (p, dev, 6, LG_8, file_hdr->c_name, _("device number"));
+   p += 6;
+@@ -492,7 +498,10 @@ write_out_binary_header (dev_t rdev,
+   short_hdr.c_namesize = file_hdr->c_namesize & 0xFFFF;
+   if (short_hdr.c_namesize != file_hdr->c_namesize)
+     {
+-      field_width_error (file_hdr->c_name, _("name size"));
++      char maxbuf[UINTMAX_STRSIZE_BOUND + 1];
++      error (0, 0, _("%s: value %s %s out of allowed range 0..%u"),
++	     file_hdr->c_name, _("name size"),
++	     STRINGIFY_BIGINT (file_hdr->c_namesize, maxbuf), 0xFFFFu);
+       return 1;
+     }
+ 		      
+@@ -502,7 +511,10 @@ write_out_binary_header (dev_t rdev,
+   if (((off_t)short_hdr.c_filesizes[0] << 16) + short_hdr.c_filesizes[1]
+        != file_hdr->c_filesize)
+     {
+-      field_width_error (file_hdr->c_name, _("file size"));
++      char maxbuf[UINTMAX_STRSIZE_BOUND + 1];
++      error (0, 0, _("%s: value %s %s out of allowed range 0..%lu"),
++	     file_hdr->c_name, _("file size"),
++	     STRINGIFY_BIGINT (file_hdr->c_namesize, maxbuf), 0xFFFFFFFFlu);
+       return 1;
+     }
+ 		      
+@@ -552,8 +564,7 @@ write_out_header (struct cpio_file_stat *file_hdr, int out_des)
+ 	  error (0, 0, _("%s: file name too long"), file_hdr->c_name);
+ 	  return 1;
+ 	}
+-      write_out_tar_header (file_hdr, out_des); /* FIXME: No error checking */
+-      return 0;
++      return write_out_tar_header (file_hdr, out_des);
+ 
+     case arf_binary:
+       return write_out_binary_header (makedev (file_hdr->c_rdev_maj,
+diff --git a/src/extern.h b/src/extern.h
+index e27d662..f9ef56a 100644
+--- a/src/extern.h
++++ b/src/extern.h
+@@ -117,6 +117,10 @@ void print_name_with_quoting (char *p);
+ /* copyout.c */
+ int write_out_header (struct cpio_file_stat *file_hdr, int out_des);
+ void process_copy_out (void);
++int to_ascii (char *where, uintmax_t v, size_t digits, unsigned logbase,
++	      bool nul);
++void field_width_error (const char *filename, const char *fieldname,
++			uintmax_t value, size_t width, bool nul);
+ 
+ /* copypass.c */
+ void process_copy_pass (void);
+@@ -145,7 +149,7 @@ int make_path (char *argpath, uid_t owner, gid_t group,
+ 	       const char *verbose_fmt_string);
+ 
+ /* tar.c */
+-void write_out_tar_header (struct cpio_file_stat *file_hdr, int out_des);
++int write_out_tar_header (struct cpio_file_stat *file_hdr, int out_des);
+ int null_block (long *block, int size);
+ void read_in_tar_header (struct cpio_file_stat *file_hdr, int in_des);
+ int otoa (char *s, unsigned long *n);
+@@ -204,9 +208,16 @@ void cpio_safer_name_suffix (char *name, bool link_target,
+ int cpio_create_dir (struct cpio_file_stat *file_hdr, int existing_dir);
+ void change_dir (void);
+ 
+-/* FIXME: These two defines should be defined in paxutils */
++/* FIXME: The following three should be defined in paxutils */
+ #define LG_8  3
+ #define LG_16 4
++/* The maximum uintmax_t value that can be represented with DIGITS digits,
++   assuming that each digit is BITS_PER_DIGIT wide.  */
++#define MAX_VAL_WITH_DIGITS(digits, bits_per_digit) \
++   ((digits) * (bits_per_digit) < sizeof (uintmax_t) * CHAR_BIT \
++    ? ((uintmax_t) 1 << ((digits) * (bits_per_digit))) - 1 \
++    : (uintmax_t) -1)
++
+ 
+ uintmax_t from_ascii (char const *where, size_t digs, unsigned logbase);
+ 
+diff --git a/src/tar.c b/src/tar.c
+index a2ce171..ef58027 100644
+--- a/src/tar.c
++++ b/src/tar.c
+@@ -79,36 +79,17 @@ stash_tar_filename (char *prefix, char *filename)
+   return hold_tar_filename;
+ }
+ 
+-/* Convert a number into a string of octal digits.
+-   Convert long VALUE into a DIGITS-digit field at WHERE,
+-   including a trailing space and room for a NUL.  DIGITS==3 means
+-   1 digit, a space, and room for a NUL.
+-
+-   We assume the trailing NUL is already there and don't fill it in.
+-   This fact is used by start_header and finish_header, so don't change it!
+-
+-   This is be equivalent to:
+-   sprintf (where, "%*lo ", digits - 2, value);
+-   except that sprintf fills in the trailing NUL and we don't.  */
+-
+-static void
+-to_oct (register long value, register int digits, register char *where)
++static int
++to_oct_or_error (uintmax_t value, size_t digits, char *where, char const *field,
++		 char const *file)
+ {
+-  --digits;			/* Leave the trailing NUL slot alone.  */
+-
+-  /* Produce the digits -- at least one.  */
+-  do
++  if (to_ascii (where, value, digits, LG_8, true))
+     {
+-      where[--digits] = '0' + (char) (value & 7); /* One octal digit.  */
+-      value >>= 3;
++      field_width_error (file, field, value, digits, true);
++      return 1;
+     }
+-  while (digits > 0 && value != 0);
+-
+-  /* Add leading zeroes, if necessary.  */
+-  while (digits > 0)
+-    where[--digits] = '0';
++  return 0;
+ }
+-
+ 
+ 
+ /* Compute and return a checksum for TAR_HDR,
+@@ -134,10 +115,22 @@ tar_checksum (struct tar_header *tar_hdr)
+   return sum;
+ }
+ 
++#define TO_OCT(file_hdr, c_fld, digits, tar_hdr, tar_field) \
++  do							    \
++    {							    \
++       if (to_oct_or_error (file_hdr -> c_fld,		    \
++			    digits,			    \
++			    tar_hdr -> tar_field,	    \
++			    #tar_field,			    \
++			    file_hdr->c_name))		    \
++	 return 1;					    \
++    }							    \
++  while (0)
++
+ /* Write out header FILE_HDR, including the file name, to file
+    descriptor OUT_DES.  */
+ 
+-void
++int
+ write_out_tar_header (struct cpio_file_stat *file_hdr, int out_des)
+ {
+   int name_len;
+@@ -166,11 +159,11 @@ write_out_tar_header (struct cpio_file_stat *file_hdr, int out_des)
+ 
+   /* Ustar standard (POSIX.1-1988) requires the mode to contain only 3 octal
+      digits */
+-  to_oct (file_hdr->c_mode & MODE_ALL, 8, tar_hdr->mode);
+-  to_oct (file_hdr->c_uid, 8, tar_hdr->uid);
+-  to_oct (file_hdr->c_gid, 8, tar_hdr->gid);
+-  to_oct (file_hdr->c_filesize, 12, tar_hdr->size);
+-  to_oct (file_hdr->c_mtime, 12, tar_hdr->mtime);
++  TO_OCT (file_hdr, c_mode & MODE_ALL, 8, tar_hdr, mode);
++  TO_OCT (file_hdr, c_uid, 8, tar_hdr, uid);
++  TO_OCT (file_hdr, c_gid, 8, tar_hdr, gid);
++  TO_OCT (file_hdr, c_filesize, 12, tar_hdr, size);
++  TO_OCT (file_hdr, c_mtime, 12, tar_hdr, mtime);
+ 
+   switch (file_hdr->c_mode & CP_IFMT)
+     {
+@@ -182,7 +175,7 @@ write_out_tar_header (struct cpio_file_stat *file_hdr, int out_des)
+ 	  strncpy (tar_hdr->linkname, file_hdr->c_tar_linkname,
+ 		   TARLINKNAMESIZE);
+ 	  tar_hdr->typeflag = LNKTYPE;
+-	  to_oct (0, 12, tar_hdr->size);
++	  to_ascii (tar_hdr->size, 0, 12, LG_8, true);
+ 	}
+       else
+ 	tar_hdr->typeflag = REGTYPE;
+@@ -208,7 +201,7 @@ write_out_tar_header (struct cpio_file_stat *file_hdr, int out_des)
+ 	 than TARLINKNAMESIZE.  */
+       strncpy (tar_hdr->linkname, file_hdr->c_tar_linkname,
+ 	       TARLINKNAMESIZE);
+-      to_oct (0, 12, tar_hdr->size);
++      to_ascii (tar_hdr->size, 0, 12, LG_8, true);
+       break;
+ #endif /* CP_IFLNK */
+     }
+@@ -227,13 +220,15 @@ write_out_tar_header (struct cpio_file_stat *file_hdr, int out_des)
+       if (name)
+ 	strcpy (tar_hdr->gname, name);
+ 
+-      to_oct (file_hdr->c_rdev_maj, 8, tar_hdr->devmajor);
+-      to_oct (file_hdr->c_rdev_min, 8, tar_hdr->devminor);
++      TO_OCT (file_hdr, c_rdev_maj, 8, tar_hdr, devmajor);
++      TO_OCT (file_hdr, c_rdev_min, 8, tar_hdr, devminor);
+     }
+ 
+-  to_oct (tar_checksum (tar_hdr), 8, tar_hdr->chksum);
++  to_ascii (tar_hdr->chksum, tar_checksum (tar_hdr), 8, LG_8, true);
+ 
+   tape_buffered_write ((char *) &tar_rec, out_des, TARRECORDSIZE);
++
++  return 0;
+ }
+ 
+ /* Return nonzero iff all the bytes in BLOCK are NUL.
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
index 3713bf0b1f..5abe494ebc 100644
--- a/meta/recipes-extended/cpio/cpio_2.12.bb
+++ b/meta/recipes-extended/cpio/cpio_2.12.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Fix-CVE-2015-1197.patch \
            file://0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch \
            file://0001-Fix-segfault-with-append.patch \
+           file://CVE-2019-14866.patch \
            "
 
 SRC_URI[md5sum] = "fc207561a86b63862eea4b8300313e86"
-- 
2.17.1


