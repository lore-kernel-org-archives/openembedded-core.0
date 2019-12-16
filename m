Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id A2CAC7FDA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:14 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id 2so5813817pfx.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=r4us8G8LpB6pyx558ucBo/F4NlLD35mVTyP2iNi1vJU=;
	b=k7wSKugmVqSlDg0tVjq13NnPewGavRgF+NIhpB6LFUbtybhiPoZ1JQHPZvMQEuSJtq
	cNr5Jm4sO03SVJxiL4PS8mZTlJMzntPkPYDoDoYCqhZqqRd3HiNRL9M0iYRLH7UFtggv
	M6uLIVnnkU8/iISB6E9hKRnYUWUsMLeChF6v1yjVqF5pzL5JJUskxB5QDHvblL8IEDi8
	N30vPwYwykNe9kfmMXSd1TczTS1pMpk9XsqYcmuh9dJlTQwqGMzU2m61OiJRymt3RtKJ
	FxFi4EgPa0tEsdLeglx1kxqi9zDSTHhb8nwABwI3FZeeJ4VPMclmgu4Wp2Z/fIsU+eAz
	XAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=r4us8G8LpB6pyx558ucBo/F4NlLD35mVTyP2iNi1vJU=;
	b=CFsmUCG/VfpR0WJ+QCsf430w3vNppL2pHUX2D8Witt/xXfkoDHU8pCivlMPEcpP1/G
	bdA3+8nHaCNE1ENlpZM7wDj3/kV3pCxr89ueXj05B7+lchBdaQtjAYMWeJURyE5Mp+OU
	yYSGdHWyFvAUPAr8uWhXHXDnrpRdvuuWLj4Gij/cGVWstZCr3zZQNI0QG4PoZLZBlIcx
	vlxx+l3mEZHyiTIsp8u5RcffuF17do3jAX5lLoY8O7K+V/RPUGYmM53Ma9kd9/cAASt7
	N/B8vNXLvBq/DFh+txt1lt215iHQ7OIcPr+tKkG9IRuTT4W3YrH3DLsUBLEtrhGsr73H
	Dy3A==
X-Gm-Message-State: APjAAAVEctKaItTnpxcO32piB+6Buohp/g90FUeRX2Ro4nUvDdjthdog
	L58SoucpC0zaHclw3aOJZ1uE0eFUKOI=
X-Google-Smtp-Source: APXvYqymGXIxEVMUVbvvLZbhdfDR5GzxqdnwUEg2TY7nY8c+YihBmG1DDGaATMNv0skpyayWVFZA2Q==
X-Received: by 2002:a63:e0f:: with SMTP id d15mr18982674pgl.255.1576512015130; 
	Mon, 16 Dec 2019 08:00:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 07:59:54 -0800
Message-Id: <95ab1519ea5f1a0ed73f6f484bcf15fde5de8140.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 04/18] tar: Fix CVE-2018-20482
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:14 -0000

From: Dan Tran <dantran@microsoft.com>

Signed-off-by: Dan Tran <dantran@microsoft.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tar/tar/CVE-2018-20482.patch | 405 +++++++++++++++++++++
 meta/recipes-extended/tar/tar_1.30.bb              |   1 +
 2 files changed, 406 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2018-20482.patch

diff --git a/meta/recipes-extended/tar/tar/CVE-2018-20482.patch b/meta/recipes-extended/tar/tar/CVE-2018-20482.patch
new file mode 100644
index 0000000..2a13148
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2018-20482.patch
@@ -0,0 +1,405 @@
+From 331be56598b284d41370c67046df25673b040a55 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Thu, 27 Dec 2018 17:48:57 +0200
+Subject: [PATCH] Fix CVE-2018-20482
+
+* NEWS: Update.
+* src/sparse.c (sparse_dump_region): Handle short read condition.
+(sparse_extract_region,check_data_region): Fix dumped_size calculation.
+Handle short read condition.
+(pax_decode_header): Fix dumped_size calculation.
+* tests/Makefile.am: Add new testcases.
+* tests/testsuite.at: Likewise.
+
+* tests/sptrcreat.at: New file.
+* tests/sptrdiff00.at: New file.
+* tests/sptrdiff01.at: New file.
+
+CVE: CVE-2018-20482
+Upstream-Status: Backport
+[http://git.savannah.gnu.org/cgit/tar.git/commit/?id=c15c42ccd1e2377945fd0414eca1a49294bff454]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ src/sparse.c        | 50 +++++++++++++++++++++++++++++++-----
+ tests/Makefile.am   |  5 +++-
+ tests/sptrcreat.at  | 62 +++++++++++++++++++++++++++++++++++++++++++++
+ tests/sptrdiff00.at | 55 ++++++++++++++++++++++++++++++++++++++++
+ tests/sptrdiff01.at | 55 ++++++++++++++++++++++++++++++++++++++++
+ tests/testsuite.at  |  5 +++-
+ 6 files changed, 224 insertions(+), 8 deletions(-)
+ create mode 100644 tests/sptrcreat.at
+ create mode 100644 tests/sptrdiff00.at
+ create mode 100644 tests/sptrdiff01.at
+
+diff --git a/src/sparse.c b/src/sparse.c
+index 0830f62..e8e8259 100644
+--- a/src/sparse.c
++++ b/src/sparse.c
+@@ -1,6 +1,6 @@
+ /* Functions for dealing with sparse files
+ 
+-   Copyright 2003-2007, 2010, 2013-2017 Free Software Foundation, Inc.
++   Copyright 2003-2007, 2010, 2013-2018 Free Software Foundation, Inc.
+ 
+    This program is free software; you can redistribute it and/or modify it
+    under the terms of the GNU General Public License as published by the
+@@ -427,6 +427,30 @@ sparse_dump_region (struct tar_sparse_file *file, size_t i)
+ 			     bufsize);
+ 	  return false;
+ 	}
++      else if (bytes_read == 0)
++	{
++	  char buf[UINTMAX_STRSIZE_BOUND];
++	  struct stat st;
++	  size_t n;
++	  if (fstat (file->fd, &st) == 0)
++	    n = file->stat_info->stat.st_size - st.st_size;
++	  else
++	    n = file->stat_info->stat.st_size
++	      - (file->stat_info->sparse_map[i].offset
++		 + file->stat_info->sparse_map[i].numbytes
++		 - bytes_left);
++	  
++	  WARNOPT (WARN_FILE_SHRANK,
++		   (0, 0,
++		    ngettext ("%s: File shrank by %s byte; padding with zeros",
++			      "%s: File shrank by %s bytes; padding with zeros",
++			      n),
++		    quotearg_colon (file->stat_info->orig_file_name),
++		    STRINGIFY_BIGINT (n, buf)));
++	  if (! ignore_failed_read_option)
++	    set_exit_status (TAREXIT_DIFFERS);
++	  return false;
++	}
+ 
+       memset (blk->buffer + bytes_read, 0, BLOCKSIZE - bytes_read);
+       bytes_left -= bytes_read;
+@@ -464,9 +488,9 @@ sparse_extract_region (struct tar_sparse_file *file, size_t i)
+ 	  return false;
+ 	}
+       set_next_block_after (blk);
++      file->dumped_size += BLOCKSIZE;
+       count = blocking_write (file->fd, blk->buffer, wrbytes);
+       write_size -= count;
+-      file->dumped_size += count;
+       mv_size_left (file->stat_info->archive_file_size - file->dumped_size);
+       file->offset += count;
+       if (count != wrbytes)
+@@ -598,6 +622,12 @@ check_sparse_region (struct tar_sparse_file *file, off_t beg, off_t end)
+ 			     rdsize);
+ 	  return false;
+ 	}
++      else if (bytes_read == 0)
++	{
++	  report_difference (file->stat_info, _("Size differs"));
++	  return false;
++	}
++      
+       if (!zero_block_p (diff_buffer, bytes_read))
+ 	{
+ 	  char begbuf[INT_BUFSIZE_BOUND (off_t)];
+@@ -609,6 +639,7 @@ check_sparse_region (struct tar_sparse_file *file, off_t beg, off_t end)
+ 
+       beg += bytes_read;
+     }
++
+   return true;
+ }
+ 
+@@ -635,6 +666,7 @@ check_data_region (struct tar_sparse_file *file, size_t i)
+ 	  return false;
+ 	}
+       set_next_block_after (blk);
++      file->dumped_size += BLOCKSIZE;      
+       bytes_read = safe_read (file->fd, diff_buffer, rdsize);
+       if (bytes_read == SAFE_READ_ERROR)
+ 	{
+@@ -645,7 +677,11 @@ check_data_region (struct tar_sparse_file *file, size_t i)
+ 			     rdsize);
+ 	  return false;
+ 	}
+-      file->dumped_size += bytes_read;
++      else if (bytes_read == 0)
++	{
++	  report_difference (&current_stat_info, _("Size differs"));
++	  return false;
++	}
+       size_left -= bytes_read;
+       mv_size_left (file->stat_info->archive_file_size - file->dumped_size);
+       if (memcmp (blk->buffer, diff_buffer, rdsize))
+@@ -1213,7 +1249,8 @@ pax_decode_header (struct tar_sparse_file *file)
+       union block *blk;
+       char *p;
+       size_t i;
+-
++      off_t start;
++      
+ #define COPY_BUF(b,buf,src) do                                     \
+  {                                                                 \
+    char *endp = b->buffer + BLOCKSIZE;                             \
+@@ -1229,7 +1266,6 @@ pax_decode_header (struct tar_sparse_file *file)
+        if (src == endp)                                            \
+ 	 {                                                         \
+ 	   set_next_block_after (b);                               \
+-           file->dumped_size += BLOCKSIZE;                         \
+            b = find_next_block ();                                 \
+            if (!b)                                                 \
+              FATAL_ERROR ((0, 0, _("Unexpected EOF in archive"))); \
+@@ -1242,8 +1278,8 @@ pax_decode_header (struct tar_sparse_file *file)
+    dst[-1] = 0;                                                    \
+  } while (0)
+ 
++      start = current_block_ordinal ();
+       set_next_block_after (current_header);
+-      file->dumped_size += BLOCKSIZE;
+       blk = find_next_block ();
+       if (!blk)
+         FATAL_ERROR ((0, 0, _("Unexpected EOF in archive")));
+@@ -1282,6 +1318,8 @@ pax_decode_header (struct tar_sparse_file *file)
+ 	  sparse_add_map (file->stat_info, &sp);
+ 	}
+       set_next_block_after (blk);
++
++      file->dumped_size += BLOCKSIZE * (current_block_ordinal () - start);
+     }
+ 
+   return true;
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 2d7939d..ac3b6e7 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1,6 +1,6 @@
+ # Makefile for GNU tar regression tests.
+ 
+-# Copyright 1996-1997, 1999-2001, 2003-2007, 2009, 2012-2015 Free Software
++# Copyright 1996-1997, 1999-2001, 2003-2007, 2009, 2012-2018 Free Software
+ 
+ # This file is part of GNU tar.
+ 
+@@ -228,6 +228,9 @@ TESTSUITE_AT = \
+  spmvp00.at\
+  spmvp01.at\
+  spmvp10.at\
++ sptrcreat.at\
++ sptrdiff00.at\
++ sptrdiff01.at\
+  time01.at\
+  time02.at\
+  truncate.at\
+diff --git a/tests/sptrcreat.at b/tests/sptrcreat.at
+new file mode 100644
+index 0000000..8e28f0e
+--- /dev/null
++++ b/tests/sptrcreat.at
+@@ -0,0 +1,62 @@
++# Process this file with autom4te to create testsuite. -*- Autotest -*-
++
++# Test suite for GNU tar.
++# Copyright 2018 Free Software Foundation, Inc.
++
++# This file is part of GNU tar.
++
++# GNU tar is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
++# (at your option) any later version.
++
++# GNU tar is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
++
++# Tar up to 1.30 would loop endlessly if a sparse file had been truncated
++# while being archived (with --sparse flag).
++#
++# The bug has been assigned id CVE-2018-20482 (on the grounds that it is a
++# denial of service possibility).
++# 
++# Reported by: Chris Siebenmann <cks.gnutar-01@cs.toronto.edu>
++# References: <20181226223948.781EB32008E@apps1.cs.toronto.edu>,
++#   <http://lists.gnu.org/archive/html/bug-tar/2018-12/msg00023.html>
++#   <https://utcc.utoronto.ca/~cks/space/blog/sysadmin/TarFindingTruncateBug>
++#   <https://nvd.nist.gov/vuln/detail/CVE-2018-20482>
++
++AT_SETUP([sparse file truncated while archiving])
++AT_KEYWORDS([truncate filechange sparse sptr sptrcreat])
++
++AT_TAR_CHECK([
++genfile --sparse --block-size=1024 --file foo \
++  0 ABCDEFGHIJ 1M ABCDEFGHIJ 10M ABCDEFGHIJ 200M ABCDEFGHIJ
++genfile --file baz
++genfile --run --checkpoint 3 --length 200m --truncate foo -- \
++ tar --checkpoint=1 \
++     --checkpoint-action=echo \
++     --checkpoint-action=sleep=1 \
++     --sparse -vcf bar foo baz
++echo Exit status: $?
++echo separator
++genfile --file foo --seek 200m --length 11575296 --pattern=zeros
++tar dvf bar],
++[1],
++[foo
++baz
++Exit status: 1
++separator
++foo
++foo: Mod time differs
++baz
++],
++[tar: foo: File shrank by 11575296 bytes; padding with zeros
++],
++[],[],[posix, gnu, oldgnu])
++
++AT_CLEANUP
+diff --git a/tests/sptrdiff00.at b/tests/sptrdiff00.at
+new file mode 100644
+index 0000000..c410561
+--- /dev/null
++++ b/tests/sptrdiff00.at
+@@ -0,0 +1,55 @@
++# Process this file with autom4te to create testsuite. -*- Autotest -*-
++#
++# Test suite for GNU tar.
++# Copyright 2018 Free Software Foundation, Inc.
++#
++# This file is part of GNU tar.
++#
++# GNU tar is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
++# (at your option) any later version.
++#
++# GNU tar is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
++
++# While fixing CVE-2018-20482 (see sptrcreat.at) it has been discovered
++# that similar bug exists in file checking code (tar d). 
++# This test case checks if tar correctly handles a short read condition
++# appearing in check_sparse_region.
++
++AT_SETUP([file truncated in sparse region while comparing])
++AT_KEYWORDS([truncate filechange sparse sptr sptrdiff diff])
++
++# This triggers short read in check_sparse_region.
++AT_TAR_CHECK([
++genfile --sparse --block-size=1024 --file foo \
++  0 ABCDEFGHIJ 1M ABCDEFGHIJ 10M ABCDEFGHIJ 200M ABCDEFGHIJ
++genfile --file baz
++echo creating
++tar --sparse -vcf bar foo baz
++echo comparing
++genfile --run --checkpoint 3 --length 200m --truncate foo -- \
++ tar --checkpoint=1 \
++     --checkpoint-action=echo='Write checkpoint %u' \
++     --checkpoint-action=sleep=1 \
++     --sparse -vdf bar 
++],
++[1],
++[creating
++foo
++baz
++comparing
++foo
++foo: Size differs
++baz
++],
++[],
++[],[],[posix, gnu, oldgnu])
++
++AT_CLEANUP
+diff --git a/tests/sptrdiff01.at b/tests/sptrdiff01.at
+new file mode 100644
+index 0000000..2da2267
+--- /dev/null
++++ b/tests/sptrdiff01.at
+@@ -0,0 +1,55 @@
++# Process this file with autom4te to create testsuite. -*- Autotest -*-
++#
++# Test suite for GNU tar.
++# Copyright 2018 Free Software Foundation, Inc.
++#
++# This file is part of GNU tar.
++#
++# GNU tar is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
++# (at your option) any later version.
++#
++# GNU tar is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
++
++# While fixing CVE-2018-20482 (see sptrcreat.at) it has been discovered
++# that similar bug exists in file checking code (tar d). 
++# This test case checks if tar correctly handles a short read condition
++# appearing in check_data_region.
++
++AT_SETUP([file truncated in data region while comparing])
++AT_KEYWORDS([truncate filechange sparse sptr sptrdiff diff])
++
++# This triggers short read in check_data_region.
++AT_TAR_CHECK([
++genfile --sparse --block-size=1024 --file foo \
++  0 ABCDEFGHIJ 1M ABCDEFGHIJ 10M ABCDEFGHIJ 200M ABCDEFGHIJ
++genfile --file baz
++echo creating
++tar --sparse -vcf bar foo baz
++echo comparing
++genfile --run --checkpoint 5 --length 221278210 --truncate foo -- \
++ tar --checkpoint=1 \
++     --checkpoint-action=echo='Write checkpoint %u' \
++     --checkpoint-action=sleep=1 \
++     --sparse -vdf bar 
++],
++[1],
++[creating
++foo
++baz
++comparing
++foo
++foo: Size differs
++baz
++],
++[],
++[],[],[posix, gnu, oldgnu])
++
++AT_CLEANUP
+diff --git a/tests/testsuite.at b/tests/testsuite.at
+index 2a83757..23386f7 100644
+--- a/tests/testsuite.at
++++ b/tests/testsuite.at
+@@ -1,7 +1,7 @@
+ # Process this file with autom4te to create testsuite. -*- Autotest -*-
+ 
+ # Test suite for GNU tar.
+-# Copyright 2004-2008, 2010-2017 Free Software Foundation, Inc.
++# Copyright 2004-2008, 2010-2018 Free Software Foundation, Inc.
+ 
+ # This file is part of GNU tar.
+ 
+@@ -405,6 +405,9 @@ m4_include([sparsemv.at])
+ m4_include([spmvp00.at])
+ m4_include([spmvp01.at])
+ m4_include([spmvp10.at])
++m4_include([sptrcreat.at])
++m4_include([sptrdiff00.at])
++m4_include([sptrdiff01.at])
+ 
+ AT_BANNER([Updates])
+ m4_include([update.at])
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-extended/tar/tar_1.30.bb b/meta/recipes-extended/tar/tar_1.30.bb
index ab1b33b..7cf0522 100644
--- a/meta/recipes-extended/tar/tar_1.30.bb
+++ b/meta/recipes-extended/tar/tar_1.30.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://remove-gets.patch \
            file://musl_dirent.patch \
            file://CVE-2019-9923.patch \
+           file://CVE-2018-20482.patch \
 "
 
 SRC_URI[md5sum] = "8404e4c1fc5a3000228ab2b8ad674a65"
-- 
2.7.4


