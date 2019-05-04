Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id B6FB77DD8C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:28:00 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id p6so4206838pgh.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=H1yhHvNaEMLwmRgZdwveeCfz+qERzrJ1S+mwzWZwNCE=;
	b=mwPlVTLADL1QyJAx1nrXxrykXU3Ei11+g/C7zgCcyjGaa99OyqlBUSa3x/5cVzotsJ
	UwcaHGr7fq+LYaR4TwUbsLyIKvxtmSWkPXZLmmf7pBhmXaGuJLdI34sRieGOBQ79I428
	G0OfXURg5eKRn/Cjtdh38PSIvqF10XOo9GAygDVNZdHPbPz4jQ/fZxwnPyuEq3PBvYp9
	qWBKWuI5erJxvRuO0Wi7L+HhwcH/rLPoySlYp77EMQClDlv3mks+AWejlJ8ID5GuuAlU
	tDNYKCmQ4t8qKjTmo4sZNt4ol7pleTp5lQUsVqONF8GfduBWHiVQ9y1RJ/VNi7CY10Bz
	A34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=H1yhHvNaEMLwmRgZdwveeCfz+qERzrJ1S+mwzWZwNCE=;
	b=fXSnZvjFQb3Bjtvz5LiiO9Nvtf+mSXew+T+prh2Rpe/wW6QA7uStC1p124xMuGGARb
	P4w72bjKTK9gpOTQpFSu1O6+tPZ1nlVehyK1FC6Tc7QyQY847gJpjU3OHdFyyLJOK7nG
	caz98ypJivJ8fW9Pf4mRN69CfoOXRLcZwTw9uZssYclAQVjZAttnv2g6aCCwh2Ql212W
	4gbBkfttS2L9tRPiqfsf9/XE9ZAGvyD8Q3D7VsdOgHC3jKAi0aQjCmghB2txTKuWLDJv
	mddik5oE4JZiWTRrzLviEvaA/nS/nxleqAMNA3JxxOM432DuyyW995aZhWewelMyMUs6
	W7bA==
X-Gm-Message-State: APjAAAXpNSR8RBVObkBfwFKsSOgWDv8bfvN5pyt+uBgfCTdbV5k9cy1G
	31PWWbMPV3u8wxua2PS7KhxpO+Vc
X-Google-Smtp-Source: APXvYqyihyedNg6pfbafPboXV8wx9z8Wn/ekcWfXyFkM5e9ebAOtUu+KJtgjK2jJkhHChDPy3obPRg==
X-Received: by 2002:aa7:92d1:: with SMTP id k17mr20237922pfa.91.1556983681859; 
	Sat, 04 May 2019 08:28:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.28.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:28:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:12 -0700
Message-Id: <09dc0c4008bcc134d2424d7a9606a881baf6b79b.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 36/43] gdb: fix CVE-2017-9778
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
X-List-Received-Date: Sat, 04 May 2019 15:28:00 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-8.2.1.inc           |  1 +
 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch | 99 +++++++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.2.1.inc b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
index 1fc1ec0..cb8d189 100644
--- a/meta/recipes-devtools/gdb/gdb-8.2.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0011-Fix-invalid-sigprocmask-call.patch \
            file://gdbserver-ctrl-c-handling.patch \
            file://0001-Fix-build-with-latest-GCC-9.0-tree.patch \
+           file://CVE-2017-9778.patch \
 "
 SRC_URI[md5sum] = "f8b2562e830a4098dd5b5ea9e9296c70"
 SRC_URI[sha256sum] = "0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202"
diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch b/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
new file mode 100644
index 0000000..935f266
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
@@ -0,0 +1,99 @@
+From a608b79f30ab3f670095e14ba3d3b5b24a19fe68 Mon Sep 17 00:00:00 2001
+From: Sandra Loosemore <sandra@codesourcery.com>
+Date: Thu, 25 Apr 2019 07:27:02 -0700
+Subject: [PATCH] Detect invalid length field in debug frame FDE header.
+
+GDB was failing to catch cases where a corrupt ELF or core file
+contained an invalid length value in a Dwarf debug frame FDE header.
+It was checking for buffer overflow but not cases where the length was
+negative or caused pointer wrap-around.
+
+In addition to the additional validity check, this patch cleans up the
+multiple signed/unsigned conversions on the length field so that an
+unsigned representation is used consistently throughout.
+
+This patch fixes CVE-2017-9778 and PR gdb/21600.
+
+2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
+	    Kang Li <kanglictf@gmail.com>
+
+	PR gdb/21600
+
+	* dwarf2-frame.c (read_initial_length): Be consistent about using
+	unsigned representation of length.
+	(decode_frame_entry_1): Likewise.  Check for wraparound of
+	end pointer as well as buffer overflow.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=723adb650a31859d7cc45832cb8adca0206455ed]
+CVE: CVE-2017-9778
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ gdb/ChangeLog      | 11 +++++++++++
+ gdb/dwarf2-frame.c | 14 +++++++-------
+ 2 files changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/gdb/ChangeLog b/gdb/ChangeLog
+index 3711dc7..0a9720b 100644
+--- a/gdb/ChangeLog
++++ b/gdb/ChangeLog
+@@ -1,3 +1,14 @@
++2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
++	    Kang Li <kanglictf@gmail.com>
++
++	PR gdb/21600
++
++	* dwarf2-frame.c (read_initial_length): Be consistent about using
++	unsigned representation of length.
++	(decode_frame_entry_1): Likewise.  Check for wraparound of
++	end pointer as well as buffer overflow.
++
++
+ 2018-12-23  Joel Brobecker  <brobecker@adacore.com>
+ 
+ 	* version.in: Set GDB version number to 8.2.1.
+diff --git a/gdb/dwarf2-frame.c b/gdb/dwarf2-frame.c
+index 91e16cf..a7b99fd 100644
+--- a/gdb/dwarf2-frame.c
++++ b/gdb/dwarf2-frame.c
+@@ -1477,7 +1477,7 @@ static ULONGEST
+ read_initial_length (bfd *abfd, const gdb_byte *buf,
+ 		     unsigned int *bytes_read_ptr)
+ {
+-  LONGEST result;
++  ULONGEST result;
+ 
+   result = bfd_get_32 (abfd, buf);
+   if (result == 0xffffffff)
+@@ -1780,7 +1780,7 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
+ {
+   struct gdbarch *gdbarch = get_objfile_arch (unit->objfile);
+   const gdb_byte *buf, *end;
+-  LONGEST length;
++  ULONGEST length;
+   unsigned int bytes_read;
+   int dwarf64_p;
+   ULONGEST cie_id;
+@@ -1791,15 +1791,15 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
+   buf = start;
+   length = read_initial_length (unit->abfd, buf, &bytes_read);
+   buf += bytes_read;
+-  end = buf + length;
+-
+-  /* Are we still within the section?  */
+-  if (end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
+-    return NULL;
++  end = buf + (size_t) length;
+ 
+   if (length == 0)
+     return end;
+ 
++  /* Are we still within the section?  */
++  if (end <= buf || end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
++    return NULL;
++
+   /* Distinguish between 32 and 64-bit encoded frame info.  */
+   dwarf64_p = (bytes_read == 12);
+ 
+-- 
+2.7.4
+
-- 
2.7.4


