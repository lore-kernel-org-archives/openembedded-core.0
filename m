Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 836EE916C0
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:03 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id m7so1558204pjs.0
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=PglX3lJDSrU+GIZ1KJNUdWg3GVyhrMZCIF0wR/a6rSg=;
	b=r8XXaXnXnuReuMAFarsttZqIh5285lVSJtTH0nKwN95Q2KTq5uhv1drQaXbBxnLWjI
	0RDfBraHfYsk/W3vj5autfE0qwAei0eBCPQ+5cWX1x+5qqpFx6AYwQ+SkvO/CmDW0RhE
	0WwxQsLhuLPoc9JCNWLaiVyJjkxPKNdkOQ0KjbSmYf/bRelcKXOB2DF6z6Nxd0vJQw/0
	/Yaap53DeTrNKMK0unXdUGgz/bb648jIeEe59zydA8iKUto5vNQf5WBvWIJGmHkxOmKE
	zbUbZx+vQxlOAMtApJrH6GnMAvuQXSHMSKcDOHYjczKfsclcguRiuLk2pCPMyJek/Cj5
	Ajqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=PglX3lJDSrU+GIZ1KJNUdWg3GVyhrMZCIF0wR/a6rSg=;
	b=RxLivE4zZN9xN//XCebrdrSTY+MuLfsVGoSUeIZ+R+o9vYtpvMnMKYPQ4cd1QIQMO4
	6f3su8r6eCLNDmoB/trdDxmPVlo4C+SVjI7ekRsGcxoSECqNjhvU2H8C5g1NSnQShQ3U
	uf4D8XOayKSJpcBNtYnc47XUpEAVyXwV6x2d7jEi20nwTteRwsJbe/vDsJ0iBudqLtdP
	IZkRn44hp0kYMm9j+fMtGrkUVp7TqPd8qtGiYfToU8gkBuE7+/2IBLiYr2pfDYoi77g/
	p691/DW4ZqNC8D3RnUCHBLhEile2pU3kkEsRpCfxMoiCOU8HCYQiiRS9jzKgi1XHtIAh
	7O2A==
X-Gm-Message-State: APjAAAXDpzHh5q2Nk0xG8vwzYMAEe4VQQQAEhoadcUjuu9I3oWa+u3PR
	sh5JgWjtdjfrHN81WHE00gX1NdTS
X-Google-Smtp-Source: APXvYqzOARZMyb7WoyjcFWazJXkkRKmifyfr177i+TSj1Y0qheI39gHePvSu0WUUW/txcZ2ADH2cEA==
X-Received: by 2002:a17:90a:17e3:: with SMTP id
	q90mr9827655pja.139.1580055904331; 
	Sun, 26 Jan 2020 08:25:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.03
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:34 -0800
Message-Id: <536a2656b44fbb98a3cdc60eed32f378184cce7c.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 09/29] gdb: Fix CVE-2019-1010180
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vinay Kumar <vinay.m.engg@gmail.com>

Source: git://sourceware.org/git/binutils-gdb.git
Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=23657

Backported upstream commit 950b74950f6020eda38647f22e9077ac7f68ca49 to gdb-8.3.1 sources.

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=950b74950f6020eda38647f22e9077ac7f68ca49]

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/gdb/gdb-8.2.1.inc       |   1 +
 .../gdb/gdb/CVE-2019-1010180.patch            | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.2.1.inc b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
index f28b57439c..8fa48171f4 100644
--- a/meta/recipes-devtools/gdb/gdb-8.2.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.2.1.inc
@@ -19,6 +19,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0001-Fix-build-with-latest-GCC-9.0-tree.patch \
            file://CVE-2017-9778.patch \
            file://0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch \
+           file://CVE-2019-1010180.patch \
 "
 SRC_URI[md5sum] = "f8b2562e830a4098dd5b5ea9e9296c70"
 SRC_URI[sha256sum] = "0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202"
diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch b/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
new file mode 100644
index 0000000000..46b2b3a713
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
@@ -0,0 +1,132 @@
+From 950b74950f6020eda38647f22e9077ac7f68ca49 Mon Sep 17 00:00:00 2001
+From: Keith Seitz <keiths@redhat.com>
+Date: Wed, 16 Oct 2019 11:33:59 -0700
+Subject: [PATCH] DWARF reader: Reject sections with invalid sizes
+
+This is another fuzzer bug, gdb/23567.  This time, the fuzzer has
+specifically altered the size of .debug_str:
+
+$ eu-readelf -S objdump
+Section Headers:
+[Nr] Name                 Type         Addr             Off      Size     ES Flags Lk Inf Al
+[31] .debug_str           PROGBITS     0000000000000000 0057116d ffffffffffffffff  1 MS     0   0  1
+
+When this file is loaded into GDB, the DWARF reader crashes attempting
+to access the string table (or it may just store a bunch of nonsense):
+
+[gdb-8.3-6-fc30]
+$ gdb -nx -q objdump
+BFD: warning: /path/to/objdump has a corrupt section with a size (ffffffffffffffff) larger than the file size
+Reading symbols from /path/to/objdump...
+Segmentation fault (core dumped)
+
+Nick has already committed a BFD patch to issue the warning seen above.
+
+[gdb master 6acc1a0b]
+$ gdb -BFD: warning: /path/to/objdump has a corrupt section with a size (ffffffffffffffff) larger than the file size
+Reading symbols from /path/to/objdump...
+(gdb) inf func
+All defined functions:
+
+File ./../include/dwarf2.def:
+186:	const
+
+              8 *>(.:
+                     ;'@�B);
+747:	const
+
+              8 *�(.:
+                     ;'@�B);
+701:	const
+
+              8 *�D �
+                     (.:
+                        ;'@�B);
+71:	const
+
+              8 *(.:
+                    ;'@�B);
+/* and more gibberish  */
+
+Consider read_indirect_string_at_offset_from:
+
+static const char *
+read_indirect_string_at_offset_from (struct objfile *objfile,
+                                     bfd *abfd, LONGEST str_offset,
+                                     struct dwarf2_section_info *sect,
+                                     const char *form_name,
+                                     const char *sect_name)
+{
+  dwarf2_read_section (objfile, sect);
+  if (sect->buffer == NULL)
+    error (_("%s used without %s section [in module %s]"),
+           form_name, sect_name, bfd_get_filename (abfd));
+  if (str_offset >= sect->size)
+    error (_("%s pointing outside of %s section [in module %s]"),
+           form_name, sect_name, bfd_get_filename (abfd));
+  gdb_assert (HOST_CHAR_BIT == 8);
+  if (sect->buffer[str_offset] == '\0')
+    return NULL;
+  return (const char *) (sect->buffer + str_offset);
+}
+
+With sect_size being ginormous, the code attempts to access
+sect->buffer[GINORMOUS], and depending on the layout of memory,
+GDB either stores a bunch of gibberish strings or crashes.
+
+This is an attempt to mitigate this by implementing a similar approach
+used by BFD. In our case, we simply reject the section with the invalid
+length:
+
+$ ./gdb -nx -q objdump
+BFD: warning: /path/to/objdump has a corrupt section with a size (ffffffffffffffff) larger than the file size
+Reading symbols from /path/to/objdump...
+
+warning: Discarding section .debug_str which has a section size (ffffffffffffffff) larger than the file size [in module /path/to/objdump]
+DW_FORM_strp used without .debug_str section [in module /path/to/objdump]
+(No debugging symbols found in /path/to/objdump)
+(gdb)
+
+Unfortunately, I have not found a way to regression test this, since it
+requires poking ELF section headers.
+
+gdb/ChangeLog:
+2019-10-16  Keith Seitz  <keiths@redhat.com>
+
+	PR gdb/23567
+	* dwarf2read.c (dwarf2_per_objfile::locate_sections): Discard
+	sections whose size is greater than the file size.
+
+Change-Id: I896ac3b4eb2207c54e8e05c16beab3051d9b4b2f
+
+CVE: CVE-2019-1010180
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=950b74950f6020eda38647f22e9077ac7f68ca49]
+[Removed Changelog entry]
+Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
+---
+ gdb/dwarf2read.c | 9 +++++++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/gdb/dwarf2read.c b/gdb/dwarf2read.c
+index 0443b55..a78f818 100644
+--- a/gdb/dwarf2read.c
++++ b/gdb/dwarf2read.c
+@@ -2338,6 +2338,15 @@ dwarf2_per_objfile::locate_sections (bfd *abfd, asection *sectp,
+   if ((aflag & SEC_HAS_CONTENTS) == 0)
+     {
+     }
++  else if (elf_section_data (sectp)->this_hdr.sh_size
++	   > bfd_get_file_size (abfd))
++    {
++      bfd_size_type size = elf_section_data (sectp)->this_hdr.sh_size;
++      warning (_("Discarding section %s which has a section size (%s"
++		 ") larger than the file size [in module %s]"),
++	       bfd_section_name (abfd, sectp), phex_nz (size, sizeof (size)),
++	       bfd_get_filename (abfd));
++    }
+   else if (section_is_p (sectp->name, &names.info))
+     {
+       this->info.s.section = sectp;
+-- 
+2.7.4
+
-- 
2.17.1


