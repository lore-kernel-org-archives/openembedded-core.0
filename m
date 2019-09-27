Return-Path: <prvs=1662a5b7b=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 709E27F25D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 00:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1569545522; x=1601081522;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=LVydiFPjZeDK4hs/nlD34p16NzNUERKx2MwKCwRocLE=;
	b=CqiWfYrBx8abS6mpnrYaD69mnPzj/OWlH/R/blpdziXY+cQINHEuPBSV
	4W+zKBVCL2LD/lWvBN1WLtsZe3SUvd9XSyuGcqT6Ca6hCDjJeVQG1RIEg
	upO9y03ez3DI3g5xGfAIsdSDPeVGJAnhr1a5BrgO3IW2jNXXatlwkLb5l
	LfDpEFLe6+pa8p7IuV8wWe0As4vb/Uv3GxWIcSdeiuoum0p6RDRRYVPPU
	vkGwXv1nG52SCNqynd4kNDOBbIXczDwzDU5xY03pplOi91IRIJc1Vih4k
	sLXx5VOro92JXB2kEVPMpkYoQVyX6N9PZAm4imqwOdPogm5qfyLO6BKuJ g==;
IronPort-SDR: xKYDLjXgzlsJMUI0b6RueCCnRFjq0t1CXBlcdf/Uc0+6M7drAMayNDF+R1Ent8prIgKsLV6O3o
	cuAyAi+LIzmDFnAn3XSuH3LBggL5njadGPCKiL2384fLBwlgaaXu8uqxLcEMVG4+8teUIulT/+
	x4AfZr3pS1jBnOJFk9x5GX9NQ9wQsgvxHJkkdY/MHFEgQAoN1TImIsgNTzOZHma+WTgRGDGZ7M
	65O/cbR3fTR392E/SCr6h9SX8jQEhqUYkNcM6KklKIi7d7oF0Xan/XzDQkibOXITj3mZGgQ7g0
	tY8=
X-IronPort-AV: E=Sophos;i="5.64,553,1559491200"; d="scan'208";a="120012384"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2019 08:52:01 +0800
IronPort-SDR: AXxZM4REfOP1H9eA1GtwpoN+2KtpqZqiNHG6eqGfhYhVLOSzAgVvmzdlrWVmeaJ/s+vEAVyL8u
	btBWSo1xltNTs8AyatS8dgYvBg3zny5GeS6Vyxp8k6/6u6+JwDmBo4MquWPR5fUyTCxnPW7S/u
	DHS+uUGcQ2Q96A6JXGMcx8KTlCAjqXdDlwj7CEHdKuGcCDn4Ta6STixdYKapUzdEfnFOo34ERt
	IyWsxgUmta0FVaRICbb8t++TCdhkksO+vCmX7AH1pOlq640XDz5BXMRwsf9SIb7iCgN0fZgILL
	0/I0/kSGNAP1ODjYb10+O087
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	26 Sep 2019 17:48:21 -0700
IronPort-SDR: K2IO6ZZekzT3CbDVjx3dfzWCwVEKL4Jv1qqfrPy/S90fnMBIH9CiLEaYzmpEYZOaucuZFo7Xe7
	Ev4BJs0cRzBK2eMJNt9t3gkaZROvd+J9uAlZwXtg1mPfDmyR4JCVnuDV06T7hqMA2lTE2akulT
	1xnUkxgeJwR75FQhtiCM/CiXmCGwM2AlkryyR1djGr8VShwwdzY5SYQFwGHFyXqIhuawSQJdr8
	MLaQ6h5L2puOszb37vfaWupxS9hVxW7f6XPuMcVdiGNWqEVkaoPRQ/NY5qkoPTqzSjjBTKnhRZ
	fKo=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 26 Sep 2019 17:52:01 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 17:47:42 -0700
Message-Id: <20190927004742.23584-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] gdb: Bump from 8.3 to 8.3.1
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
X-List-Received-Date: Fri, 27 Sep 2019 00:52:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../gdb/{gdb-8.3.inc => gdb-8.3.1.inc}        |  5 +-
 ...ian_8.3.bb => gdb-cross-canadian_8.3.1.bb} |  0
 .../{gdb-cross_8.3.bb => gdb-cross_8.3.1.bb}  |  0
 .../gdb/gdb/CVE-2017-9778.patch               | 98 -------------------
 .../gdb/{gdb_8.3.bb => gdb_8.3.1.bb}          |  0
 5 files changed, 2 insertions(+), 101 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-8.3.inc => gdb-8.3.1.inc} (85%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.3.bb => gdb-cross-canadian_8.3.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.3.bb => gdb-cross_8.3.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
 rename meta/recipes-devtools/gdb/{gdb_8.3.bb => gdb_8.3.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-8.3.inc b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
similarity index 85%
rename from meta/recipes-devtools/gdb/gdb-8.3.inc
rename to meta/recipes-devtools/gdb/gdb-8.3.1.inc
index 070c17d4a1..39f1c48cc7 100644
--- a/meta/recipes-devtools/gdb/gdb-8.3.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
@@ -16,7 +16,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://0011-Fix-invalid-sigprocmask-call.patch \
-           file://CVE-2017-9778.patch \
            "
-SRC_URI[md5sum] = "bbd95b2f9b34621ad7a19a3965476314"
-SRC_URI[sha256sum] = "802f7ee309dcc547d65a68d61ebd6526762d26c3051f52caebe2189ac1ffd72e"
+SRC_URI[md5sum] = "73b6a5d8141672c62bf851cd34c4aa83"
+SRC_URI[sha256sum] = "1e55b4d7cdca7b34be12f4ceae651623aa73b2fd640152313f9f66a7149757c4"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.3.bb b/meta/recipes-devtools/gdb/gdb-cross_8.3.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_8.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross_8.3.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch b/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
deleted file mode 100644
index f142ed00d7..0000000000
--- a/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 6ad3791f095cfc1b0294f62c4b3a524ba735595e Mon Sep 17 00:00:00 2001
-From: Sandra Loosemore <sandra@codesourcery.com>
-Date: Thu, 25 Apr 2019 07:27:02 -0700
-Subject: [PATCH] Detect invalid length field in debug frame FDE header.
-
-GDB was failing to catch cases where a corrupt ELF or core file
-contained an invalid length value in a Dwarf debug frame FDE header.
-It was checking for buffer overflow but not cases where the length was
-negative or caused pointer wrap-around.
-
-In addition to the additional validity check, this patch cleans up the
-multiple signed/unsigned conversions on the length field so that an
-unsigned representation is used consistently throughout.
-
-This patch fixes CVE-2017-9778 and PR gdb/21600.
-
-2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
-	    Kang Li <kanglictf@gmail.com>
-
-	PR gdb/21600
-
-	* dwarf2-frame.c (read_initial_length): Be consistent about using
-	unsigned representation of length.
-	(decode_frame_entry_1): Likewise.  Check for wraparound of
-	end pointer as well as buffer overflow.
-
-Upstream-Status: Backport
-CVE: CVE-2017-9778
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- gdb/ChangeLog      | 10 ++++++++++
- gdb/dwarf2-frame.c | 14 +++++++-------
- 2 files changed, 17 insertions(+), 7 deletions(-)
-
-diff --git a/gdb/ChangeLog b/gdb/ChangeLog
-index 1c125de..d028d2b 100644
---- a/gdb/ChangeLog
-+++ b/gdb/ChangeLog
-@@ -1,3 +1,13 @@
-+2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
-+	Kang Li <kanglictf@gmail.com>
-+
-+	PR gdb/21600
-+
-+	* dwarf2-frame.c (read_initial_length): Be consistent about using
-+	unsigned representation of length.
-+	(decode_frame_entry_1): Likewise.  Check for wraparound of
-+	end pointer as well as buffer overflow.
-+
- 2019-05-11  Joel Brobecker  <brobecker@adacore.com>
- 
- 	* version.in: Set GDB version number to 8.3.
-diff --git a/gdb/dwarf2-frame.c b/gdb/dwarf2-frame.c
-index 178ac44..dc5d3b3 100644
---- a/gdb/dwarf2-frame.c
-+++ b/gdb/dwarf2-frame.c
-@@ -1488,7 +1488,7 @@ static ULONGEST
- read_initial_length (bfd *abfd, const gdb_byte *buf,
- 		     unsigned int *bytes_read_ptr)
- {
--  LONGEST result;
-+  ULONGEST result;
- 
-   result = bfd_get_32 (abfd, buf);
-   if (result == 0xffffffff)
-@@ -1789,7 +1789,7 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
- {
-   struct gdbarch *gdbarch = get_objfile_arch (unit->objfile);
-   const gdb_byte *buf, *end;
--  LONGEST length;
-+  ULONGEST length;
-   unsigned int bytes_read;
-   int dwarf64_p;
-   ULONGEST cie_id;
-@@ -1800,15 +1800,15 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
-   buf = start;
-   length = read_initial_length (unit->abfd, buf, &bytes_read);
-   buf += bytes_read;
--  end = buf + length;
--
--  /* Are we still within the section?  */
--  if (end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
--    return NULL;
-+  end = buf + (size_t) length;
- 
-   if (length == 0)
-     return end;
- 
-+  /* Are we still within the section?  */
-+  if (end <= buf || end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
-+    return NULL;
-+
-   /* Distinguish between 32 and 64-bit encoded frame info.  */
-   dwarf64_p = (bytes_read == 12);
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/gdb/gdb_8.3.bb b/meta/recipes-devtools/gdb/gdb_8.3.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_8.3.bb
rename to meta/recipes-devtools/gdb/gdb_8.3.1.bb
-- 
2.23.0


