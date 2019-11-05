Return-Path: <vinay.m.engg@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8DE7F8BC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 11:03:01 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c184so15022432pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 03:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cbBMrvEEGw5IYjBa8uOGPZxUQHCPTt8gxoH28fbagNM=;
	b=Wrc2hXH9C9ofnbZSkcipshFMUekoR9iBJ346kAzrx8sNfCJl2Nvno2MfWDSRir5IlA
	y2sRfUPNr/5IwsPoeix+urqVY8Ly7rIK1lM47mYiwiH5xKS4lqVKoRSrp9ysM2bVn9rb
	iS6k8y+lDZw/Cfc/gwZL4l3hIO9jK62EP6C43+Ogc2h7umzN+4fg69XOuvrwTv4udh88
	7iDBXAeE/M8IDn7N3EBBHsQnAgwIvjMJAXYusRWTAYJ8lXOLlJicDvy36r7wtVEv4Qkg
	cTehN6WI/M+3PJ/kKNEHDSBonXRF/6rrj0E1dauISrCJesrK/a0g+OBiTP2Ie9L2GJne
	758g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cbBMrvEEGw5IYjBa8uOGPZxUQHCPTt8gxoH28fbagNM=;
	b=C+GEaK3fTFKtAssIXf+yl69Wc83T0AClf6fL5bUTVnpeKTNh92xDx/0CMgKP4O5YwY
	GpJ51hDkGVFoBMJ6TwqZz9Tr75LnmC/hP/cLgUmqgOTHYBVHECLzzp4keA/dUcr6hZCX
	Dpq+7dc22ZTqv84gyUFw5gZRGCr7+s+inEfQguzKdFDmcKRb898ex4uJBm0UhrZRhGeV
	+APLZAeqXNq4Pt8yylHY+OXZC3Y35Lpi5k0ie2h1o6YL1pxhJSluHy2Rwc1n2KUtX+4A
	gXhXS1HWbiih/AjUM1RiSBn4ZTiZbRIp640307b8f0TQLMPJL7M6XEb/YhsYb+eC8Hdf
	PaCQ==
X-Gm-Message-State: APjAAAV+DW3sQvIQlk6OSfzXl30v4fm9FZDnAOmIIyz55j8kvcSqq3aw
	rhkwc7phzDCl2EQ8G4fpJS4ZJ9EpNNdn8g==
X-Google-Smtp-Source: APXvYqxtMBORsL2K7qYHDHG+P2uERpxXpa5JFGXNgFsGv273jqN2GCvKcrecB3y2O2GjoBGxz+/Ghg==
X-Received: by 2002:a17:90a:9505:: with SMTP id
	t5mr5770401pjo.133.1572951782031; 
	Tue, 05 Nov 2019 03:03:02 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
	by smtp.gmail.com with ESMTPSA id
	137sm27600396pfu.173.2019.11.05.03.03.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Nov 2019 03:03:01 -0800 (PST)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 16:32:50 +0530
Message-Id: <1572951770-6058-1-git-send-email-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gdb: Fix CVE-2019-1010180
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
X-List-Received-Date: Tue, 05 Nov 2019 11:03:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Source: git://sourceware.org/git/binutils-gdb.git
Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=23657

Backported upstream commit 950b74950f6020eda38647f22e9077ac7f68ca49 to gdb-8.3.1 sources.

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=950b74950f6020eda38647f22e9077ac7f68ca49]

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-8.3.1.inc            |   1 +
 .../gdb/gdb/CVE-2019-1010180.patch                 | 132 +++++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.3.1.inc b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
index 39f1c48..aec913f 100644
--- a/meta/recipes-devtools/gdb/gdb-8.3.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://0011-Fix-invalid-sigprocmask-call.patch \
+           file://CVE-2019-1010180.patch \
            "
 SRC_URI[md5sum] = "73b6a5d8141672c62bf851cd34c4aa83"
 SRC_URI[sha256sum] = "1e55b4d7cdca7b34be12f4ceae651623aa73b2fd640152313f9f66a7149757c4"
diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch b/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
new file mode 100644
index 0000000..46b2b3a
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
2.7.4


