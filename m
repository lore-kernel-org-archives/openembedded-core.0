Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 01F237FC1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:15:08 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t2so3816623wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TAVlQ3RQK0QgXgokWAcswsm84CRTIpGvoOyfsOqWvyU=;
	b=cQX7bhv0E5X5zBFi/RUGiwVh9hWw9sh1IeUAdxZuWYGSuRlHay+3Q2KOukEfmTt6jY
	gQQ892Pz9v8qDfXjlJhIws315ND2BUzW1JJXONXl9N/gXUQ80gQ64vsBDgcPA+yOMMas
	WxqM+6VRbrjlEgrc3BkGz5mQG+FljG6D26StEzdUmuBvdWU6sP6Fky6dogpBTh+rqyC+
	HDYOIjGUqLmLOyaY3N2eecHQi7+vjZqIEmu2pZx+PMmxMPzNWoCshw61Wd8wsNrHML5r
	Y6hsdqTcHN3mtLIY5xJv6zK3qUJWTypm3ftL9f16QL/4zGx1/fF5pSKOARxL0xoxmeso
	ORbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TAVlQ3RQK0QgXgokWAcswsm84CRTIpGvoOyfsOqWvyU=;
	b=L17wUxEMcoM0mUyvOKeXr/XF6Xc1iUWkibJ0XYjPrrrGFNsTmWsZSXPWVi8//mBm5B
	2U0L68pzkHsyvPag/MODvWPK/IS0bhrggN9QHjtp1/HkDBRozaC7Xg4jiKsQtCg9t9GA
	QUgvCTyR/ftUqJj/8wApdM0YTsmJ5cO1WcALWqsjV3587K72LaQo4ORcVb/edG1DPGBR
	RQdLwcnsY+J+F8zEztn2L7TtPO6nHATqI5+GP1rpAmk+JKicjTtIjpO3LEG1VLA268cY
	WbQJ3z6nNLenNY4hAzQrWGR5ISMdNnE71RWJgBmFZ84bsXl6PdpoJN6dBAeTiwCCQ/9g
	61TA==
X-Gm-Message-State: APjAAAViTT5GIZ6sGATyqibRuHFm3SX11WXO9j+ukhNNJxVPdnjj5/ln
	pBuZYYJE+uUrV7GDUvY0rQkUgpiR
X-Google-Smtp-Source: APXvYqwQbX/Byr4m8EvKv4JNUrmb8Q4y77rqLkMkONE3l8649v7RolsJF2RIvGcAaGixVkZVTu9Ufw==
X-Received: by 2002:adf:e58d:: with SMTP id l13mr7509908wrm.135.1576174509073; 
	Thu, 12 Dec 2019 10:15:09 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.15.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:15:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:33 +0100
Message-Id: <20191212181436.1322-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 27/30] cpio: update to 2.13
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
X-List-Received-Date: Thu, 12 Dec 2019 18:15:09 -0000

Drop a couple of backports.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...2016-2037-1-byte-out-of-bounds-write.patch | 346 ------------------
 .../0001-Fix-segfault-with-append.patch       |  51 ---
 .../0001-Fix-CVE-2015-1197.patch              |   0
 ...charset_alias-when-building-for-musl.patch |   0
 .../cpio/{cpio_2.12.bb => cpio_2.13.bb}       |   6 +-
 5 files changed, 2 insertions(+), 401 deletions(-)
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.12/0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch
 rename meta/recipes-extended/cpio/{cpio-2.12 => cpio-2.13}/0001-Fix-CVE-2015-1197.patch (100%)
 rename meta/recipes-extended/cpio/{cpio-2.12 => cpio-2.13}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 rename meta/recipes-extended/cpio/{cpio_2.12.bb => cpio_2.13.bb} (83%)

diff --git a/meta/recipes-extended/cpio/cpio-2.12/0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch b/meta/recipes-extended/cpio/cpio-2.12/0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch
deleted file mode 100644
index 0a3054483cb..00000000000
--- a/meta/recipes-extended/cpio/cpio-2.12/0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch
+++ /dev/null
@@ -1,346 +0,0 @@
-From ebf9a2d776474181936a720ce811d72bbd1da3b6 Mon Sep 17 00:00:00 2001
-From: Pavel Raiskup <praiskup@redhat.com>
-Date: Tue, 26 Jan 2016 23:17:54 +0100
-Subject: [PATCH] CVE-2016-2037 - 1 byte out-of-bounds write
-
-Ensure that cpio_safer_name_suffix always works with dynamically
-allocated buffer, and that it has size of at least 32 bytes.
-Then, any call to cpio_safer_name_suffix is safe (it requires at
-least 2 bytes in the buffer).
-
-Also ensure that c_namesize is always correctly initialized (by
-cpio_set_c_name) to avoid undefined behavior when reading
-file_hdr.c_namesize (previously happened for tar archives).
-
-References:
-http://www.mail-archive.com/bug-cpio@gnu.org/msg00545.html
-
-* src/copyin.c (query_rename): Drop the hack, as we now work with
-dynamically allocated buffer.  Use cpio_set_c_name.
-(create_defered_links_to_skipped): Use cpio_set_c_name rather than
-manual assignment.
-(read_name_from_file): New function to avoid C&P.
-(read_in_old_ascii, read_in_new_ascii, read_in_binary): Use
-read_name_from_file.
-(process_copy_in): Initialize file_hdr.c_namesize.
-* src/copyout.c (process_copy_out): Use cpio_set_c_name.
-* src/cpiohdr.h (cpio_set_c_name): New prototype.
-* src/tar.c (read_in_tar_header): Use cpio_set_c_name.
-* src/util.c (cpio_set_c_name): New function to set
-file_hdr->c_name and c_namesize from arbitrary string.
-(cpio_safer_name_suffix): Some docs fixes.
-* tests/inout.at: Also test copy-in, and try various formats.
-
-CVE: CVE-2016-2037
-
-Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/cpio.git/commit/?id=d36ec5f4e93130efb24fb9678aafd88e8070095b]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- src/copyin.c   | 68 +++++++++++++++++++---------------------------------------
- src/copyout.c  | 13 +++++------
- src/cpiohdr.h  |  1 +
- src/tar.c      | 10 +++++----
- src/util.c     | 32 ++++++++++++++++++++++++++-
- tests/inout.at | 19 ++++++++++++++--
- 6 files changed, 82 insertions(+), 61 deletions(-)
-
-diff --git a/src/copyin.c b/src/copyin.c
-index cde911e..972f8a6 100644
---- a/src/copyin.c
-+++ b/src/copyin.c
-@@ -76,28 +76,7 @@ query_rename(struct cpio_file_stat* file_hdr, FILE *tty_in, FILE *tty_out,
-       return -1;
-     }
-   else
--  /* Debian hack: file_hrd.c_name is sometimes set to
--     point to static memory by code in tar.c.  This
--     causes a segfault.  This has been fixed and an
--     additional check to ensure that the file name
--     is not too long has been added.  (Reported by
--     Horst Knobloch.)  This bug has been reported to
--     "bug-gnu-utils@prep.ai.mit.edu". (99/1/6) -BEM */
--    {
--      if (archive_format != arf_tar && archive_format != arf_ustar)
--	{
--	  free (file_hdr->c_name);
--	  file_hdr->c_name = xstrdup (new_name.ds_string);
--	}
--      else
--	{
--	  if (is_tar_filename_too_long (new_name.ds_string))
--	    error (0, 0, _("%s: file name too long"),
--		   new_name.ds_string);
--	  else
--	    strcpy (file_hdr->c_name, new_name.ds_string);
--	}
--    }
-+    cpio_set_c_name (file_hdr, new_name.ds_string);
-   return 0;
- }
- 
-@@ -344,8 +323,7 @@ create_defered_links_to_skipped (struct cpio_file_stat *file_hdr,
- 	    d_prev->next = d->next;
- 	  else
- 	    deferments = d->next;
--	  free (file_hdr->c_name);
--	  file_hdr->c_name = xstrdup(d->header.c_name);
-+	  cpio_set_c_name (file_hdr, d->header.c_name);
- 	  free_deferment (d);
- 	  copyin_regular_file(file_hdr, in_file_des);
- 	  return 0;
-@@ -1064,6 +1042,22 @@ read_in_header (struct cpio_file_stat *file_hdr, int in_des)
-     }
- }
- 
-+static void
-+read_name_from_file (struct cpio_file_stat *file_hdr, int fd, uintmax_t len)
-+{
-+  static char *tmp_filename;
-+  static size_t buflen;
-+
-+  if (buflen < len)
-+    {
-+      buflen = len;
-+      tmp_filename = xrealloc (tmp_filename, buflen);
-+    }
-+
-+  tape_buffered_read (tmp_filename, fd, len);
-+  cpio_set_c_name (file_hdr, tmp_filename);
-+}
-+
- /* Fill in FILE_HDR by reading an old-format ASCII format cpio header from
-    file descriptor IN_DES, except for the magic number, which is
-    already filled in.  */
-@@ -1090,14 +1084,8 @@ read_in_old_ascii (struct cpio_file_stat *file_hdr, int in_des)
-   file_hdr->c_rdev_min = minor (dev);
- 
-   file_hdr->c_mtime = FROM_OCTAL (ascii_header.c_mtime);
--  file_hdr->c_namesize = FROM_OCTAL (ascii_header.c_namesize);
-   file_hdr->c_filesize = FROM_OCTAL (ascii_header.c_filesize);
--  
--  /* Read file name from input.  */
--  if (file_hdr->c_name != NULL)
--    free (file_hdr->c_name);
--  file_hdr->c_name = (char *) xmalloc (file_hdr->c_namesize + 1);
--  tape_buffered_read (file_hdr->c_name, in_des, (long) file_hdr->c_namesize);
-+  read_name_from_file (file_hdr, in_des, FROM_OCTAL (ascii_header.c_namesize));
- 
-   /* HP/UX cpio creates archives that look just like ordinary archives,
-      but for devices it sets major = 0, minor = 1, and puts the
-@@ -1152,14 +1140,8 @@ read_in_new_ascii (struct cpio_file_stat *file_hdr, int in_des)
-   file_hdr->c_dev_min = FROM_HEX (ascii_header.c_dev_min);
-   file_hdr->c_rdev_maj = FROM_HEX (ascii_header.c_rdev_maj);
-   file_hdr->c_rdev_min = FROM_HEX (ascii_header.c_rdev_min);
--  file_hdr->c_namesize = FROM_HEX (ascii_header.c_namesize);
-   file_hdr->c_chksum = FROM_HEX (ascii_header.c_chksum);
--  
--  /* Read file name from input.  */
--  if (file_hdr->c_name != NULL)
--    free (file_hdr->c_name);
--  file_hdr->c_name = (char *) xmalloc (file_hdr->c_namesize);
--  tape_buffered_read (file_hdr->c_name, in_des, (long) file_hdr->c_namesize);
-+  read_name_from_file (file_hdr, in_des, FROM_HEX (ascii_header.c_namesize));
- 
-   /* In SVR4 ASCII format, the amount of space allocated for the header
-      is rounded up to the next long-word, so we might need to drop
-@@ -1207,16 +1189,9 @@ read_in_binary (struct cpio_file_stat *file_hdr,
-   file_hdr->c_rdev_min = minor (short_hdr->c_rdev);
-   file_hdr->c_mtime = (unsigned long) short_hdr->c_mtimes[0] << 16
-                       | short_hdr->c_mtimes[1];
--
--  file_hdr->c_namesize = short_hdr->c_namesize;
-   file_hdr->c_filesize = (unsigned long) short_hdr->c_filesizes[0] << 16
-                       | short_hdr->c_filesizes[1];
--
--  /* Read file name from input.  */
--  if (file_hdr->c_name != NULL)
--    free (file_hdr->c_name);
--  file_hdr->c_name = (char *) xmalloc (file_hdr->c_namesize);
--  tape_buffered_read (file_hdr->c_name, in_des, (long) file_hdr->c_namesize);
-+  read_name_from_file (file_hdr, in_des, short_hdr->c_namesize);
- 
-   /* In binary mode, the amount of space allocated in the header for
-      the filename is `c_namesize' rounded up to the next short-word,
-@@ -1297,6 +1272,7 @@ process_copy_in ()
-       read_pattern_file ();
-     }
-   file_hdr.c_name = NULL;
-+  file_hdr.c_namesize = 0;
- 
-   if (rename_batch_file)
-     {
-diff --git a/src/copyout.c b/src/copyout.c
-index 1f0987a..bb39559 100644
---- a/src/copyout.c
-+++ b/src/copyout.c
-@@ -660,8 +660,7 @@ process_copy_out ()
- 	  cpio_safer_name_suffix (input_name.ds_string, false,
- 				  !no_abs_paths_flag, true);
- #ifndef HPUX_CDF
--	  file_hdr.c_name = input_name.ds_string;
--	  file_hdr.c_namesize = strlen (input_name.ds_string) + 1;
-+	  cpio_set_c_name (&file_hdr, input_name.ds_string);
- #else
- 	  if ( (archive_format != arf_tar) && (archive_format != arf_ustar) )
- 	    {
-@@ -670,16 +669,15 @@ process_copy_out ()
- 		 properly recreate the directory as hidden (in case the
- 		 files of a directory go into the archive before the
- 		 directory itself (e.g from "find ... -depth ... | cpio")).  */
--	      file_hdr.c_name = add_cdf_double_slashes (input_name.ds_string);
--	      file_hdr.c_namesize = strlen (file_hdr.c_name) + 1;
-+              cpio_set_c_name (&file_hdr,
-+                               add_cdf_double_slashes (input_name.ds_string));
- 	    }
- 	  else
- 	    {
- 	      /* We don't mark CDF's in tar files.  We assume the "hidden"
- 		 directory will always go into the archive before any of
- 		 its files.  */
--	      file_hdr.c_name = input_name.ds_string;
--	      file_hdr.c_namesize = strlen (input_name.ds_string) + 1;
-+              cpio_set_c_name (&file_hdr, input_name.ds_string);
- 	    }
- #endif
- 
-@@ -866,8 +864,7 @@ process_copy_out ()
-   file_hdr.c_chksum = 0;
- 
-   file_hdr.c_filesize = 0;
--  file_hdr.c_namesize = 11;
--  file_hdr.c_name = CPIO_TRAILER_NAME;
-+  cpio_set_c_name (&file_hdr, CPIO_TRAILER_NAME);
-   if (archive_format != arf_tar && archive_format != arf_ustar)
-     write_out_header (&file_hdr, out_file_des);
-   else
-diff --git a/src/cpiohdr.h b/src/cpiohdr.h
-index b29e6fb..f4c63be 100644
---- a/src/cpiohdr.h
-+++ b/src/cpiohdr.h
-@@ -129,5 +129,6 @@ struct cpio_file_stat /* Internal representation of a CPIO header */
-   char *c_tar_linkname;
- };
- 
-+void cpio_set_c_name(struct cpio_file_stat *file_hdr, char *name);
- 
- #endif /* cpiohdr.h */
-diff --git a/src/tar.c b/src/tar.c
-index a2ce171..e41f89d 100644
---- a/src/tar.c
-+++ b/src/tar.c
-@@ -282,7 +282,7 @@ read_in_tar_header (struct cpio_file_stat *file_hdr, int in_des)
-       if (null_block ((long *) &tar_rec, TARRECORDSIZE))
- #endif
- 	{
--	  file_hdr->c_name = CPIO_TRAILER_NAME;
-+	  cpio_set_c_name (file_hdr, CPIO_TRAILER_NAME);
- 	  return;
- 	}
- #if 0
-@@ -316,9 +316,11 @@ read_in_tar_header (struct cpio_file_stat *file_hdr, int in_des)
- 	}
- 
-       if (archive_format != arf_ustar)
--	file_hdr->c_name = stash_tar_filename (NULL, tar_hdr->name);
-+        cpio_set_c_name (file_hdr, stash_tar_filename (NULL, tar_hdr->name));
-       else
--	file_hdr->c_name = stash_tar_filename (tar_hdr->prefix, tar_hdr->name);
-+        cpio_set_c_name (file_hdr, stash_tar_filename (tar_hdr->prefix,
-+                                                      tar_hdr->name));
-+
-       file_hdr->c_nlink = 1;
-       file_hdr->c_mode = FROM_OCTAL (tar_hdr->mode);
-       file_hdr->c_mode = file_hdr->c_mode & 07777;
-@@ -398,7 +400,7 @@ read_in_tar_header (struct cpio_file_stat *file_hdr, int in_des)
- 	case AREGTYPE:
- 	  /* Old tar format; if the last char in filename is '/' then it is
- 	     a directory, otherwise it's a regular file.  */
--	  if (file_hdr->c_name[strlen (file_hdr->c_name) - 1] == '/')
-+	  if (file_hdr->c_name[file_hdr->c_namesize - 1] == '/')
- 	    file_hdr->c_mode |= CP_IFDIR;
- 	  else
- 	    file_hdr->c_mode |= CP_IFREG;
-diff --git a/src/util.c b/src/util.c
-index 6ff6032..4f3c073 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -1410,8 +1410,34 @@ set_file_times (int fd,
-     utime_error (name);
- }
- 
-+
-+void
-+cpio_set_c_name (struct cpio_file_stat *file_hdr, char *name)
-+{
-+  static size_t buflen = 0;
-+  size_t len = strlen (name) + 1;
-+
-+  if (buflen == 0)
-+    {
-+      buflen = len;
-+      if (buflen < 32)
-+        buflen = 32;
-+      file_hdr->c_name = xmalloc (buflen);
-+    }
-+  else if (buflen < len)
-+    {
-+      buflen = len;
-+      file_hdr->c_name = xrealloc (file_hdr->c_name, buflen);
-+    }
-+
-+  file_hdr->c_namesize = len;
-+  memmove (file_hdr->c_name, name, len);
-+}
-+
- /* Do we have to ignore absolute paths, and if so, does the filename
--   have an absolute path?  */
-+   have an absolute path?  Before calling this function make sure that the
-+   allocated NAME buffer has capacity at least 2 bytes. */
-+
- void
- cpio_safer_name_suffix (char *name, bool link_target, bool absolute_names,
- 			bool strip_leading_dots)
-@@ -1426,6 +1452,10 @@ cpio_safer_name_suffix (char *name, bool link_target, bool absolute_names,
- 	  ++p;
-       }
-   if (p != name)
-+    /* The 'p' string is shortened version of 'name' with one exception;  when
-+       the 'name' points to an empty string (buffer where name[0] == '\0') the
-+       'p' then points to static string ".".  So caller needs to ensure there
-+       are at least two bytes available in 'name' buffer so memmove succeeds. */
-     memmove (name, p, (size_t)(strlen (p) + 1));
- }
- 
-diff --git a/tests/inout.at b/tests/inout.at
-index 60c3716..730cbd2 100644
---- a/tests/inout.at
-+++ b/tests/inout.at
-@@ -35,7 +35,22 @@ while read NAME LENGTH
- do
- 	genfile --length $LENGTH > $NAME
- 	echo $NAME
--done < filelist |
-- cpio --quiet -o > archive])
-+done < filelist > filelist_raw
-+
-+for format in bin odc newc crc tar ustar hpbin hpodc
-+do
-+    cpio --format=$format --quiet -o < filelist_raw > archive.$format
-+    rm -rf output
-+    mkdir output && cd output
-+    cpio -i --quiet < ../archive.$format
-+
-+    while read file
-+    do
-+        test -f $file || echo "$file not found"
-+    done < ../filelist_raw
-+
-+    cd ..
-+done
-+])
- 
- AT_CLEANUP
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch b/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch
deleted file mode 100644
index ec8b303c43a..00000000000
--- a/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-segfault-with-append.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 32d95fe0c90c59352a0ce3102fc9866cbfb0f629 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Sat, 1 Dec 2018 11:40:02 +0200
-Subject: [PATCH] Fix sigfault when appending to archive
-
-Bug reported by Ross Burton. See
-<http://lists.gnu.org/archive/html/bug-cpio/2018-11/msg00000.html>
-
-* src/util.c: Keep static copy of the buffer pointer; always
-assign it to file_hdr->c_name. Use x2realloc for memory management.
----
- src/util.c | 17 ++++-------------
- 1 file changed, 4 insertions(+), 13 deletions(-)
-
-diff --git a/src/util.c b/src/util.c
-index 10486dc..4e49124 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -1413,22 +1413,13 @@ set_file_times (int fd,
- void
- cpio_set_c_name (struct cpio_file_stat *file_hdr, char *name)
- {
-+  static char *buf = NULL;
-   static size_t buflen = 0;
-   size_t len = strlen (name) + 1;
- 
--  if (buflen == 0)
--    {
--      buflen = len;
--      if (buflen < 32)
--        buflen = 32;
--      file_hdr->c_name = xmalloc (buflen);
--    }
--  else if (buflen < len)
--    {
--      buflen = len;
--      file_hdr->c_name = xrealloc (file_hdr->c_name, buflen);
--    }
--
-+  while (buflen < len)
-+    buf = x2realloc (buf, &buflen);
-+  file_hdr->c_name = buf;
-   file_hdr->c_namesize = len;
-   memmove (file_hdr->c_name, name, len);
- }
--- 
-2.18.0
-
diff --git a/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-CVE-2015-1197.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-Fix-CVE-2015-1197.patch
similarity index 100%
rename from meta/recipes-extended/cpio/cpio-2.12/0001-Fix-CVE-2015-1197.patch
rename to meta/recipes-extended/cpio/cpio-2.13/0001-Fix-CVE-2015-1197.patch
diff --git a/meta/recipes-extended/cpio/cpio-2.12/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-Unset-need_charset_alias-when-building-for-musl.patch
similarity index 100%
rename from meta/recipes-extended/cpio/cpio-2.12/0001-Unset-need_charset_alias-when-building-for-musl.patch
rename to meta/recipes-extended/cpio/cpio-2.13/0001-Unset-need_charset_alias-when-building-for-musl.patch
diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
similarity index 83%
rename from meta/recipes-extended/cpio/cpio_2.12.bb
rename to meta/recipes-extended/cpio/cpio_2.13.bb
index 3713bf0b1f4..69615a9a0f5 100644
--- a/meta/recipes-extended/cpio/cpio_2.12.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -9,12 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0001-Fix-CVE-2015-1197.patch \
-           file://0001-CVE-2016-2037-1-byte-out-of-bounds-write.patch \
-           file://0001-Fix-segfault-with-append.patch \
            "
 
-SRC_URI[md5sum] = "fc207561a86b63862eea4b8300313e86"
-SRC_URI[sha256sum] = "08a35e92deb3c85d269a0059a27d4140a9667a6369459299d08c17f713a92e73"
+SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
+SRC_URI[sha256sum] = "e87470d9c984317f658567c03bfefb6b0c829ff17dbf6b0de48d71a4c8f3db88"
 
 inherit autotools gettext texinfo
 
-- 
2.17.1


