Return-Path: <a.novikov@yadro.com>
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5D57804E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 09:05:23 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id D107240418
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 09:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-language:content-type:content-type:mime-version
	:user-agent:date:date:message-id:subject:subject:from:from
	:received:received:received; s=mta-01; t=1498035917; x=
	1499850318; bh=jaZdiNojqVIv528Mw7mC0IEBKdVoi1NK5XgK0GfAIw0=; b=M
	4ThghIkUOcXnIZ3HBIy3dQtVgmzS1N+fKYwgxlEWXJZZ/V+5g4uqA2EFlJr0UVa4
	nbOwBa4GZMvTgJB09Ia+Z0DSxGnOZZ94GRO7fokMhd/JyHuRsiOez3f62LvaLHCA
	dBeXRNfTPhxMGSuwDHT006TdWm4/Rffg+CYIf3N9+w=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTiCdaeCIzKQ
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 12:05:17 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
	[172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 89E63400F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 12:05:17 +0300 (MSK)
Received: from [172.17.15.41] (172.17.15.41) by T-EXCH-02.corp.yadro.com
	(172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32;
	Wed, 21 Jun 2017 12:05:17 +0300
To: <openembedded-core@lists.openembedded.org>
From: Anton Novikov <a.novikov@yadro.com>
Message-ID: <14e5f528-a64b-94e2-4e86-7a22770623d6@yadro.com>
Date: Wed, 21 Jun 2017 12:05:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
X-Originating-IP: [172.17.15.41]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
	T-EXCH-02.corp.yadro.com (172.17.10.102)
Subject: [PATCHv2] (morty) Arch Linux build fixes
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
X-List-Received-Date: Wed, 21 Jun 2017 09:05:25 -0000
X-Groupsio-MsgNum: 99175
Content-Type: multipart/mixed; boundary="------------7DF3212E7FFF6EE8499CF9B7"
Content-Language: en-US

--------------7DF3212E7FFF6EE8499CF9B7
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks,

Anton


--------------7DF3212E7FFF6EE8499CF9B7
Content-Type: text/x-patch; name="0001-fix-GCC-build.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-fix-GCC-build.patch"

From 3731250f61917f59f0a1aaf0d94310fbf68eb512 Mon Sep 17 00:00:00 2001
From: Anton Novikov <a.novikov@yadro.com>
Date: Tue, 20 Jun 2017 15:42:34 +0300
Subject: [PATCH 1/3] fix GCC build

GCC 6.2 build with recent GCC was failing (for example, on my Arch system).
Patch fixing it was added from GCC upstream commit. Part of it adding noise to
ChangeLog was skipped, as it wasn't applying for some reason.

https://gnu.googlesource.com/gcc/+/c0c52589c6a7265e8fc6b77706a83d22aa1ef0ce

Signed-off-by: Anton Novikov <a.novikov@yadro.com>
---
 meta/recipes-devtools/gcc/gcc-6.2.inc              |  1 +
 .../0049-ubsan-empty-string-check-fix.patch        | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.2/0049-ubsan-empty-string-check-fix.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.2.inc b/meta/recipes-devtools/gcc/gcc-6.2.inc
index b118995e1d..97ee7bfbc5 100644
--- a/meta/recipes-devtools/gcc/gcc-6.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.2.inc
@@ -78,6 +78,7 @@ SRC_URI = "\
            file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
            file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0049-ubsan-empty-string-check-fix.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0049-ubsan-empty-string-check-fix.patch b/meta/recipes-devtools/gcc/gcc-6.2/0049-ubsan-empty-string-check-fix.patch
new file mode 100644
index 0000000000..80cd03751e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.2/0049-ubsan-empty-string-check-fix.patch
@@ -0,0 +1,28 @@
+Signed-off-by: Anton Novikov <a.novikov@yadro.com>
+Upstream-Status: Backport
+
+2017-01-26  Richard Biener  <rguenther@suse.de>
+
+	Backport from mainline
+	2016-09-03  Kirill Yukhin  <kirill.yukhin@intel.com>
+
+	* ubsan.c (ubsan_use_new_style_p): Fix check for empty string.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@244923 138bc75d-0d04-0410-961f-82ee72b054a4
+
+diff --git a/gcc/ubsan.c b/gcc/ubsan.c
+index 56637d8..1093824 100644
+--- a/gcc/ubsan.c
++++ b/gcc/ubsan.c
+
+@@ -1471,7 +1471,7 @@
+ 
+   expanded_location xloc = expand_location (loc);
+   if (xloc.file == NULL || strncmp (xloc.file, "\1", 2) == 0
+-      || xloc.file == '\0' || xloc.file[0] == '\xff'
++      || xloc.file[0] == '\0' || xloc.file[0] == '\xff'
+       || xloc.file[1] == '\xff')
+     return false;
+ 
+
-- 
2.13.1


--------------7DF3212E7FFF6EE8499CF9B7
Content-Type: text/x-patch;
	name="0002-fix-case-fallthrough-and-printf-overflow-warnings.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0002-fix-case-fallthrough-and-printf-overflow-warnings.patch"

From 6defa3a1e824526dc49b37e382a1a4117d1c5490 Mon Sep 17 00:00:00 2001
From: Anton Novikov <a.novikov@yadro.com>
Date: Tue, 20 Jun 2017 18:13:50 +0300
Subject: [PATCH 2/3] fix case fallthrough and printf overflow warnings

apply patch from:
https://lists.yoctoproject.org/pipermail/yocto/2017-April/035863.html
and do some similar changes

Signed-off-by: Anton Novikov <a.novikov@yadro.com>
---
 .../0001-Fix-fallthrough-warnings.patch            | 237 +++++++++++++++++++++
 .../0002-Fix-printf-overflow-warnings.patch        |  57 +++++
 .../0004-Fix-fallthrough-warnings.patch            | 216 +++++++++++++++++++
 .../0005-Fix-printf-overflow-warnings.patch        |  57 +++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   2 +
 meta/recipes-devtools/elfutils/elfutils_0.166.bb   |   2 +
 6 files changed, 571 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/0001-Fix-fallthrough-warnings.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/0002-Fix-printf-overflow-warnings.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/0004-Fix-fallthrough-warnings.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/0005-Fix-printf-overflow-warnings.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/0001-Fix-fallthrough-warnings.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/0001-Fix-fallthrough-warnings.patch
new file mode 100644
index 0000000000..04298b3cbb
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/0001-Fix-fallthrough-warnings.patch
@@ -0,0 +1,237 @@
+From d70d92889c4a8b0781207343a73b1dc4eccdffd3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem at gmail.com>
+Date: Tue, 25 Apr 2017 15:50:55 -0700
+Subject: [PATCH 1/2] Fix fallthrough warnings
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem at gmail.com>
+---
+ backends/i386_regs.c       | 1 +
+ backends/i386_retval.c     | 1 +
+ backends/linux-core-note.c | 4 ++--
+ backends/mips_retval.c     | 2 +-
+ backends/parisc_retval.c   | 2 +-
+ backends/ppc_regs.c        | 2 +-
+ backends/x86_64_regs.c     | 1 +
+ libcpu/i386_disasm.c       | 2 +-
+ libdw/cfi.c                | 3 +++
+ libdw/encoded-value.h      | 1 +
+ libdwfl/dwfl_report_elf.c  | 1 +
+ src/addr2line.c            | 1 +
+ src/elflint.c              | 4 +++-
+ src/objdump.c              | 2 +-
+ 14 files changed, 19 insertions(+), 8 deletions(-)
+
+diff --git a/backends/i386_regs.c b/backends/i386_regs.c
+index 5cf0d81..11b0bcb 100644
+--- a/backends/i386_regs.c
++++ b/backends/i386_regs.c
+@@ -89,6 +89,7 @@ i386_register_info (Ebl *ebl __attribute__ ((unused)),
+     case 5:
+     case 8:
+       *type = DW_ATE_address;
++      /* fallthru */
+     case 0 ... 3:
+     case 6 ... 7:
+       name[0] = 'e';
+diff --git a/backends/i386_retval.c b/backends/i386_retval.c
+index c3bab10..ffbf901 100644
+--- a/backends/i386_retval.c
++++ b/backends/i386_retval.c
+@@ -137,6 +137,7 @@ i386_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+ 
+ 	/* Else fall through.  */
+       }
++    /* fallthru */
+ 
+     case DW_TAG_structure_type:
+     case DW_TAG_class_type:
+diff --git a/backends/linux-core-note.c b/backends/linux-core-note.c
+index 9d01219..a6cd5ab 100644
+--- a/backends/linux-core-note.c
++++ b/backends/linux-core-note.c
+@@ -194,8 +194,8 @@ EBLHOOK(core_note) (nhdr, name, regs_offset, nregloc, reglocs, nitems, items)
+     case sizeof "CORE":
+       if (memcmp (name, "CORE", nhdr->n_namesz) == 0)
+ 	break;
+-      /* Buggy old Linux kernels didn't terminate "LINUX".
+-         Fall through.  */
++      /* Buggy old Linux kernels didn't terminate "LINUX". */
++      /* fallthru  */
+ 
+     case sizeof "LINUX":
+       if (memcmp (name, "LINUX", nhdr->n_namesz) == 0)
+diff --git a/backends/mips_retval.c b/backends/mips_retval.c
+index 33f12a7..b25b1b7 100644
+--- a/backends/mips_retval.c
++++ b/backends/mips_retval.c
+@@ -300,7 +300,7 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+ 
+ 	/* Else fall through. Shouldn't happen though (at least with gcc) */
+       }
+-
++      /* fallthrough */
+     case DW_TAG_structure_type:
+     case DW_TAG_class_type:
+     case DW_TAG_union_type:
+diff --git a/backends/parisc_retval.c b/backends/parisc_retval.c
+index 592a702..7aa5b17 100644
+--- a/backends/parisc_retval.c
++++ b/backends/parisc_retval.c
+@@ -167,7 +167,7 @@ parisc_return_value_location_ (Dwarf_Die *functypedie, const Dwarf_Op **locp, in
+ 
+ 	/* Else fall through.  */
+       }
+-
++      /* fallthru */
+     case DW_TAG_structure_type:
+     case DW_TAG_class_type:
+     case DW_TAG_union_type:
+diff --git a/backends/ppc_regs.c b/backends/ppc_regs.c
+index 637c25d..8277c54 100644
+--- a/backends/ppc_regs.c
++++ b/backends/ppc_regs.c
+@@ -137,7 +137,7 @@ ppc_register_info (Ebl *ebl __attribute__ ((unused)),
+     case 100:
+       if (*bits == 32)
+ 	return stpcpy (name, "mq") + 1 - name;
+-
++      /* fallthru */
+     case 102 ... 107:
+       name[0] = 's';
+       name[1] = 'p';
+diff --git a/backends/x86_64_regs.c b/backends/x86_64_regs.c
+index 8eb0d33..e941cf3 100644
+--- a/backends/x86_64_regs.c
++++ b/backends/x86_64_regs.c
+@@ -84,6 +84,7 @@ x86_64_register_info (Ebl *ebl __attribute__ ((unused)),
+ 
+     case 6 ... 7:
+       *type = DW_ATE_address;
++      /* fallthru */
+     case 0 ... 5:
+       name[0] = 'r';
+       name[1] = baseregs[regno][0];
+diff --git a/libcpu/i386_disasm.c b/libcpu/i386_disasm.c
+index 0eabe0a..84b85d0 100644
+--- a/libcpu/i386_disasm.c
++++ b/libcpu/i386_disasm.c
+@@ -788,7 +788,7 @@ i386_disasm (const uint8_t **startp, const uint8_t *end, GElf_Addr addr,
+ 			      ++param_start;
+ 			      break;
+ 			    }
+-
++			  /* fallthru */
+ 			default:
+ 			  assert (! "INVALID not handled");
+ 			  abort ();
+diff --git a/libdw/cfi.c b/libdw/cfi.c
+index aeb48e6..38b3050 100644
+--- a/libdw/cfi.c
++++ b/libdw/cfi.c
+@@ -143,6 +143,7 @@ execute_cfi (Dwarf_CFI *cache,
+ 
+ 	case DW_CFA_advance_loc1:
+ 	  operand = *program++;
++	  /* fallthru */
+ 	case DW_CFA_advance_loc + 0 ... DW_CFA_advance_loc + CFI_PRIMARY_MAX:
+ 	advance_loc:
+ 	  loc += operand * cie->code_alignment_factor;
+@@ -227,6 +228,7 @@ execute_cfi (Dwarf_CFI *cache,
+ 
+ 	case DW_CFA_offset_extended:
+ 	  get_uleb128 (operand, program);
++	  cfi_assert (program < end);
+ 	case DW_CFA_offset + 0 ... DW_CFA_offset + CFI_PRIMARY_MAX:
+ 	  get_uleb128 (offset, program);
+ 	  offset *= cie->data_alignment_factor;
+@@ -290,6 +292,7 @@ execute_cfi (Dwarf_CFI *cache,
+ 
+ 	case DW_CFA_restore_extended:
+ 	  get_uleb128 (operand, program);
++	  /* fallthru */
+ 	case DW_CFA_restore + 0 ... DW_CFA_restore + CFI_PRIMARY_MAX:
+ 
+ 	  if (unlikely (abi_cfi) && likely (opcode == DW_CFA_restore))
+diff --git a/libdw/encoded-value.h b/libdw/encoded-value.h
+index e118a1c..17190c8 100644
+--- a/libdw/encoded-value.h
++++ b/libdw/encoded-value.h
+@@ -82,6 +82,7 @@ encoded_value_size (const Elf_Data *data, const unsigned char e_ident[],
+ 	    if (*end++ & 0x80u)
+ 	      return end - p;
+ 	}
++      return 0;
+ 
+     default:
+       abort ();
+diff --git a/libdwfl/dwfl_report_elf.c b/libdwfl/dwfl_report_elf.c
+index 062a647..8a30816 100644
+--- a/libdwfl/dwfl_report_elf.c
++++ b/libdwfl/dwfl_report_elf.c
+@@ -185,6 +185,7 @@ __libdwfl_report_elf (Dwfl *dwfl, const char *name, const char *file_name,
+     case ET_CORE:
+       /* An assigned base address is meaningless for these.  */
+       base = 0;
++      /* fallthru */
+ 
+     case ET_DYN:
+     default:;
+diff --git a/src/addr2line.c b/src/addr2line.c
+index 48f017b..4a2cc5b 100644
+--- a/src/addr2line.c
++++ b/src/addr2line.c
+@@ -457,6 +457,7 @@ handle_address (const char *string, Dwfl *dwfl)
+ 	case 1:
+ 	  addr = 0;
+ 	  j = i;
++          /* fallthru */
+ 	case 2:
+ 	  if (string[j] != '\0')
+ 	    break;
+diff --git a/src/elflint.c b/src/elflint.c
+index a25af97..3d75391 100644
+--- a/src/elflint.c
++++ b/src/elflint.c
+@@ -218,6 +218,7 @@ parse_opt (int key, char *arg __attribute__ ((unused)),
+ 
+     case 'd':
+       is_debuginfo = true;
++      break;
+ 
+     case ARGP_gnuld:
+       gnuld = true;
+@@ -3735,6 +3736,7 @@ section [%2zu] '%s': merge flag set but entry size is zero\n"),
+ 	    case SHT_NOBITS:
+ 	      if (is_debuginfo)
+ 		break;
++		/* fallthru */
+ 	    default:
+ 	      ERROR (gettext ("\
+ section [%2zu] '%s' has unexpected type %d for an executable section\n"),
+@@ -4036,7 +4038,7 @@ section [%2d] '%s': unknown core file note type %" PRIu32
+ 	    if (nhdr.n_namesz == sizeof "Linux"
+ 		&& !memcmp (data->d_buf + name_offset, "Linux", sizeof "Linux"))
+ 	      break;
+-
++	    /* fallthru */
+ 	  default:
+ 	    if (shndx == 0)
+ 	      ERROR (gettext ("\
+diff --git a/src/objdump.c b/src/objdump.c
+index 1234c79..8c39a5b 100644
+--- a/src/objdump.c
++++ b/src/objdump.c
+@@ -238,7 +238,7 @@ parse_opt (int key, char *arg,
+ 		     program_invocation_short_name);
+ 	  exit (EXIT_FAILURE);
+ 	}
+-
++      /* fallthru */
+     default:
+       return ARGP_ERR_UNKNOWN;
+     }
+-- 
+2.12.2
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/0002-Fix-printf-overflow-warnings.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/0002-Fix-printf-overflow-warnings.patch
new file mode 100644
index 0000000000..32c0c10918
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/0002-Fix-printf-overflow-warnings.patch
@@ -0,0 +1,57 @@
+From 471f7e4e72feea16f06d806c47b05719c3d77d8f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem at gmail.com>
+Date: Tue, 25 Apr 2017 15:57:33 -0700
+Subject: [PATCH 2/2] Fix printf overflow warnings
+
+Fixes
+
+../../elfutils-0.148/src/ar.c:865:49: error: '__builtin___snprintf_chk' output truncated before the last format character [-Werror=format-truncation=]
+       snprintf (tmpbuf, sizeof (tmpbuf), "/%-*ld",
+                                                 ^
+In file included from /mnt/a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/elfutils/0.148-r11/recipe-sysroot/usr/include/stdio.h:889:0,
+                 from /mnt/a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/elfutils/0.148-r11/recipe-sysroot/usr/include/argp.h:23,
+                 from ../../elfutils-0.148/src/ar.c:30:
+/mnt/a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/elfutils/0.148-r11/recipe-sysroot/usr/include/bits/stdio2.h:64:10: note: '__builtin___snprintf_chk' output 18 b
+ytes into a destination of size 17
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem at gmail.com>
+---
+ src/ar.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/ar.c b/src/ar.c
+index 8e2abbe..0bf5051 100644
+--- a/src/ar.c
++++ b/src/ar.c
+@@ -853,7 +853,7 @@ write_member (struct armem *memb, off_t *startp, off_t *lenp, Elf *elf,
+ 	      off_t end_off, int newfd)
+ {
+   struct ar_hdr arhdr;
+-  char tmpbuf[sizeof (arhdr.ar_name) + 1];
++  char tmpbuf[sizeof (arhdr.ar_name) + 2];
+ 
+   bool changed_header = memb->long_name_off != -1;
+   if (changed_header)
+@@ -1454,7 +1454,7 @@ do_oper_insert (int oper, const char *arfname, char **argv, int argc,
+ 
+ 	      /* Create the header.  */
+ 	      struct ar_hdr arhdr;
+-	      char tmpbuf[sizeof (arhdr.ar_name) + 1];
++	      char tmpbuf[sizeof (arhdr.ar_name) + 2];
+ 	      if (all->long_name_off == -1)
+ 		{
+ 		  size_t namelen = strlen (all->name);
+@@ -1464,7 +1464,7 @@ do_oper_insert (int oper, const char *arfname, char **argv, int argc,
+ 		}
+ 	      else
+ 		{
+-		  snprintf (tmpbuf, sizeof (arhdr.ar_name) + 1, "/%-*ld",
++		  snprintf (tmpbuf, sizeof (tmpbuf), "/%-*ld",
+ 			    (int) sizeof (arhdr.ar_name), all->long_name_off);
+ 		  memcpy (arhdr.ar_name, tmpbuf, sizeof (arhdr.ar_name));
+ 		}
+-- 
+2.12.2
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0004-Fix-fallthrough-warnings.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0004-Fix-fallthrough-warnings.patch
new file mode 100644
index 0000000000..fe45605a7e
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.166/0004-Fix-fallthrough-warnings.patch
@@ -0,0 +1,216 @@
+Signed-off-by: Anton Novikov <a.novikov@yadro.com>
+Upstream-Status: Pending
+Subject: fix case fallthrough warnings
+
+diff --git a/backends/i386_regs.c b/backends/i386_regs.c
+index fb8ded3..3dda6cc 100644
+--- a/backends/i386_regs.c
++++ b/backends/i386_regs.c
+@@ -92,6 +92,7 @@ i386_register_info (Ebl *ebl __attribute__ ((unused)),
+     case 5:
+     case 8:
+       *type = DW_ATE_address;
++      /* fallthru */
+     case 0 ... 3:
+     case 6 ... 7:
+       name[0] = 'e';
+diff --git a/backends/i386_retval.c b/backends/i386_retval.c
+index 9da797d..4fed964 100644
+--- a/backends/i386_retval.c
++++ b/backends/i386_retval.c
+@@ -125,6 +125,7 @@ i386_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+ 
+ 	/* Else fall through.  */
+       }
++    /* fallthru */
+ 
+     case DW_TAG_structure_type:
+     case DW_TAG_class_type:
+diff --git a/backends/linux-core-note.c b/backends/linux-core-note.c
+index ff2b226..58da291 100644
+--- a/backends/linux-core-note.c
++++ b/backends/linux-core-note.c
+@@ -219,8 +219,8 @@ EBLHOOK(core_note) (const GElf_Nhdr *nhdr, const char *name,
+     case sizeof "CORE":
+       if (memcmp (name, "CORE", nhdr->n_namesz) == 0)
+ 	break;
+-      /* Buggy old Linux kernels didn't terminate "LINUX".
+-         Fall through.  */
++      /* Buggy old Linux kernels didn't terminate "LINUX". */
++      /* fallthru  */
+ 
+     case sizeof "LINUX":
+       if (memcmp (name, "LINUX", nhdr->n_namesz) == 0)
+diff --git a/backends/mips_retval.c b/backends/mips_retval.c
+index 57487bb..807db86 100644
+--- a/backends/mips_retval.c
++++ b/backends/mips_retval.c
+@@ -390,6 +390,7 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+         }
+ 
+       /* Fallthrough to handle large types */
++      /* fallthru */
+ 
+     case DW_TAG_array_type:
+     large:
+diff --git a/backends/parisc_retval.c b/backends/parisc_retval.c
+index df7ec3a..7d6db9d 100644
+--- a/backends/parisc_retval.c
++++ b/backends/parisc_retval.c
+@@ -167,7 +167,7 @@ parisc_return_value_location_ (Dwarf_Die *functypedie, const Dwarf_Op **locp, in
+ 
+ 	/* Else fall through.  */
+       }
+-
++      /* fallthru */
+     case DW_TAG_structure_type:
+     case DW_TAG_class_type:
+     case DW_TAG_union_type:
+diff --git a/backends/ppc_regs.c b/backends/ppc_regs.c
+index 4b92a9a..91cf790 100644
+--- a/backends/ppc_regs.c
++++ b/backends/ppc_regs.c
+@@ -140,7 +140,7 @@ ppc_register_info (Ebl *ebl __attribute__ ((unused)),
+     case 100:
+       if (*bits == 32)
+ 	return stpcpy (name, "mq") + 1 - name;
+-
++      /* fallthru */
+     case 102 ... 107:
+       name[0] = 's';
+       name[1] = 'p';
+diff --git a/backends/x86_64_regs.c b/backends/x86_64_regs.c
+index 2172d9f..affeac3 100644
+--- a/backends/x86_64_regs.c
++++ b/backends/x86_64_regs.c
+@@ -87,6 +87,7 @@ x86_64_register_info (Ebl *ebl __attribute__ ((unused)),
+ 
+     case 6 ... 7:
+       *type = DW_ATE_address;
++      /* fallthru */
+     case 0 ... 5:
+       name[0] = 'r';
+       name[1] = baseregs[regno][0];
+diff --git a/libcpu/i386_disasm.c b/libcpu/i386_disasm.c
+index baca620..921d964 100644
+--- a/libcpu/i386_disasm.c
++++ b/libcpu/i386_disasm.c
+@@ -819,7 +819,7 @@ i386_disasm (const uint8_t **startp, const uint8_t *end, GElf_Addr addr,
+ 			      ++param_start;
+ 			      break;
+ 			    }
+-
++			  /* fallthru */
+ 			default:
+ 			  str = "";
+ 			  assert (! "INVALID not handled");
+diff --git a/libdw/cfi.c b/libdw/cfi.c
+index 1fd668d..fd75fe6 100644
+--- a/libdw/cfi.c
++++ b/libdw/cfi.c
+@@ -138,6 +138,7 @@ execute_cfi (Dwarf_CFI *cache,
+ 
+ 	case DW_CFA_advance_loc1:
+ 	  operand = *program++;
++	  /* fallthru */
+ 	case DW_CFA_advance_loc + 0 ... DW_CFA_advance_loc + CFI_PRIMARY_MAX:
+ 	advance_loc:
+ 	  loc += operand * cie->code_alignment_factor;
+@@ -300,6 +301,7 @@ execute_cfi (Dwarf_CFI *cache,
+ 
+ 	case DW_CFA_restore_extended:
+ 	  get_uleb128 (operand, program, end);
++	  /* fallthru */
+ 	case DW_CFA_restore + 0 ... DW_CFA_restore + CFI_PRIMARY_MAX:
+ 
+ 	  if (unlikely (abi_cfi) && likely (opcode == DW_CFA_restore))
+diff --git a/libdw/encoded-value.h b/libdw/encoded-value.h
+index 48d868f..f0df4ce 100644
+--- a/libdw/encoded-value.h
++++ b/libdw/encoded-value.h
+@@ -64,6 +64,7 @@ encoded_value_size (const Elf_Data *data, const unsigned char e_ident[],
+ 	    if (*end++ & 0x80u)
+ 	      return end - p;
+ 	}
++      return 0;
+ 
+     default:
+       return 0;
+diff --git a/libdwfl/dwfl_report_elf.c b/libdwfl/dwfl_report_elf.c
+index 1c6e401..bb1e574 100644
+--- a/libdwfl/dwfl_report_elf.c
++++ b/libdwfl/dwfl_report_elf.c
+@@ -170,6 +170,7 @@ __libdwfl_elf_address_range (Elf *elf, GElf_Addr base, bool add_p_vaddr,
+       /* An assigned base address is meaningless for these.  */
+       base = 0;
+       add_p_vaddr = true;
++      /* fallthru */
+ 
+     case ET_DYN:
+     default:;
+diff --git a/src/addr2line.c b/src/addr2line.c
+index 0ce854f..5892c42 100644
+--- a/src/addr2line.c
++++ b/src/addr2line.c
+@@ -632,6 +632,7 @@ handle_address (const char *string, Dwfl *dwfl)
+ 	case 1:
+ 	  addr = 0;
+ 	  j = i;
++          /* fallthru */
+ 	case 2:
+ 	  if (string[j] != '\0')
+ 	    break;
+diff --git a/src/elfcompress.c b/src/elfcompress.c
+index d0ca469..4d63880 100644
+--- a/src/elfcompress.c
++++ b/src/elfcompress.c
+@@ -154,6 +154,7 @@ parse_opt (int key, char *arg __attribute__ ((unused)),
+ 		    N_("Only one input file allowed together with '-o'"));
+       /* We only use this for checking the number of arguments, we don't
+ 	 actually want to consume them, so fallthrough.  */
++      /* fallthru */
+     default:
+       return ARGP_ERR_UNKNOWN;
+     }
+diff --git a/src/elflint.c b/src/elflint.c
+index 15b12f6..efa460f 100644
+--- a/src/elflint.c
++++ b/src/elflint.c
+@@ -210,6 +210,7 @@ parse_opt (int key, char *arg __attribute__ ((unused)),
+ 
+     case 'd':
+       is_debuginfo = true;
++      break;
+ 
+     case ARGP_gnuld:
+       gnuld = true;
+@@ -3963,6 +3964,7 @@ section [%2zu] '%s': merge flag set but entry size is zero\n"),
+ 	    case SHT_NOBITS:
+ 	      if (is_debuginfo)
+ 		break;
++		/* fallthru */
+ 	    default:
+ 	      ERROR (gettext ("\
+ section [%2zu] '%s' has unexpected type %d for an executable section\n"),
+@@ -4305,7 +4307,7 @@ section [%2d] '%s': unknown core file note type %" PRIu32
+ 	    if (nhdr.n_namesz == sizeof "Linux"
+ 		&& !memcmp (data->d_buf + name_offset, "Linux", sizeof "Linux"))
+ 	      break;
+-
++	    /* fallthru */
+ 	  default:
+ 	    if (shndx == 0)
+ 	      ERROR (gettext ("\
+diff --git a/src/objdump.c b/src/objdump.c
+index 0aa41e8..84236f7 100644
+--- a/src/objdump.c
++++ b/src/objdump.c
+@@ -234,7 +234,7 @@ parse_opt (int key, char *arg,
+ 		     program_invocation_short_name);
+ 	  exit (EXIT_FAILURE);
+ 	}
+-
++      /* fallthru */
+     default:
+       return ARGP_ERR_UNKNOWN;
+     }
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0005-Fix-printf-overflow-warnings.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0005-Fix-printf-overflow-warnings.patch
new file mode 100644
index 0000000000..32c0c10918
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.166/0005-Fix-printf-overflow-warnings.patch
@@ -0,0 +1,57 @@
+From 471f7e4e72feea16f06d806c47b05719c3d77d8f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem at gmail.com>
+Date: Tue, 25 Apr 2017 15:57:33 -0700
+Subject: [PATCH 2/2] Fix printf overflow warnings
+
+Fixes
+
+../../elfutils-0.148/src/ar.c:865:49: error: '__builtin___snprintf_chk' output truncated before the last format character [-Werror=format-truncation=]
+       snprintf (tmpbuf, sizeof (tmpbuf), "/%-*ld",
+                                                 ^
+In file included from /mnt/a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/elfutils/0.148-r11/recipe-sysroot/usr/include/stdio.h:889:0,
+                 from /mnt/a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/elfutils/0.148-r11/recipe-sysroot/usr/include/argp.h:23,
+                 from ../../elfutils-0.148/src/ar.c:30:
+/mnt/a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/elfutils/0.148-r11/recipe-sysroot/usr/include/bits/stdio2.h:64:10: note: '__builtin___snprintf_chk' output 18 b
+ytes into a destination of size 17
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem at gmail.com>
+---
+ src/ar.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/ar.c b/src/ar.c
+index 8e2abbe..0bf5051 100644
+--- a/src/ar.c
++++ b/src/ar.c
+@@ -853,7 +853,7 @@ write_member (struct armem *memb, off_t *startp, off_t *lenp, Elf *elf,
+ 	      off_t end_off, int newfd)
+ {
+   struct ar_hdr arhdr;
+-  char tmpbuf[sizeof (arhdr.ar_name) + 1];
++  char tmpbuf[sizeof (arhdr.ar_name) + 2];
+ 
+   bool changed_header = memb->long_name_off != -1;
+   if (changed_header)
+@@ -1454,7 +1454,7 @@ do_oper_insert (int oper, const char *arfname, char **argv, int argc,
+ 
+ 	      /* Create the header.  */
+ 	      struct ar_hdr arhdr;
+-	      char tmpbuf[sizeof (arhdr.ar_name) + 1];
++	      char tmpbuf[sizeof (arhdr.ar_name) + 2];
+ 	      if (all->long_name_off == -1)
+ 		{
+ 		  size_t namelen = strlen (all->name);
+@@ -1464,7 +1464,7 @@ do_oper_insert (int oper, const char *arfname, char **argv, int argc,
+ 		}
+ 	      else
+ 		{
+-		  snprintf (tmpbuf, sizeof (arhdr.ar_name) + 1, "/%-*ld",
++		  snprintf (tmpbuf, sizeof (tmpbuf), "/%-*ld",
+ 			    (int) sizeof (arhdr.ar_name), all->long_name_off);
+ 		  memcpy (arhdr.ar_name, tmpbuf, sizeof (arhdr.ar_name));
+ 		}
+-- 
+2.12.2
+
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index d18b732fe2..dfe8b8132d 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -34,6 +34,8 @@ SRC_URI += "\
         file://elf_begin.c-CVE-2014-9447-fix.patch \
         file://fix-build-gcc-4.8.patch \
         file://gcc6.patch \
+        file://0001-Fix-fallthrough-warnings.patch \
+        file://0002-Fix-printf-overflow-warnings.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support-for-elfutils-0.148.patch"
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.166.bb b/meta/recipes-devtools/elfutils/elfutils_0.166.bb
index 5d934281b3..b54007bef0 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.166.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.166.bb
@@ -34,6 +34,8 @@ SRC_URI += "\
         file://0001-Ignore-differences-between-mips-machine-identifiers.patch \
         file://0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
         file://0003-Add-mips-n64-relocation-format-hack.patch \
+        file://0004-Fix-fallthrough-warnings.patch \
+        file://0005-Fix-printf-overflow-warnings.patch \
         file://uclibc-support.patch \
         file://elfcmp-fix-self-comparision.patch \
 "
-- 
2.13.1


--------------7DF3212E7FFF6EE8499CF9B7
Content-Type: text/x-patch;
	name="0003-add-perl-regex-fix-for-Automake.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0003-add-perl-regex-fix-for-Automake.patch"

From b712ae02f97eb6cb469104ee5a420e1bf945d5ff Mon Sep 17 00:00:00 2001
From: Anton Novikov <a.novikov@yadro.com>
Date: Tue, 20 Jun 2017 14:33:20 +0300
Subject: [PATCH 3/3] add perl regex fix for Automake

Build was failing on Arch Linux due to recent Perl giving error on unescaped
curly braces. Patch fixing it was copied from Arch Build System.

Signed-off-by: Anton Novikov <a.novikov@yadro.com>
---
 .../automake/automake/perl-regex-curly.patch       | 29 ++++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.15.bb    |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/automake/automake/perl-regex-curly.patch

diff --git a/meta/recipes-devtools/automake/automake/perl-regex-curly.patch b/meta/recipes-devtools/automake/automake/perl-regex-curly.patch
new file mode 100644
index 0000000000..910650ab25
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/perl-regex-curly.patch
@@ -0,0 +1,29 @@
+From 13f00eb4493c217269b76614759e452d8302955e Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 31 Mar 2016 23:35:29 +0000
+Subject: automake: port to Perl 5.22 and later
+
+Without this change, Perl 5.22 complains "Unescaped left brace in
+regex is deprecated" and this is planned to become a hard error in
+Perl 5.26.  See:
+http://search.cpan.org/dist/perl-5.22.0/pod/perldelta.pod#A_literal_%22{%22_should_now_be_escaped_in_a_pattern
+* bin/automake.in (substitute_ac_subst_variables): Escape left brace.
+
+Signed-off-by: Anton Novikov <a.novikov@yadro.com>
+Upstream-Status: Pending
+---
+diff --git a/bin/automake.in b/bin/automake.in
+index a3a0aa3..2c8f31e 100644
+--- a/bin/automake.in
++++ b/bin/automake.in
+@@ -3878,7 +3878,7 @@ sub substitute_ac_subst_variables_worker
+ sub substitute_ac_subst_variables
+ {
+   my ($text) = @_;
+-  $text =~ s/\${([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
++  $text =~ s/\$[{]([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
+   return $text;
+ }
+ 
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-devtools/automake/automake_1.15.bb b/meta/recipes-devtools/automake/automake_1.15.bb
index a3c72fd334..0ad250bed0 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -21,6 +21,7 @@ RDEPENDS_${PN}_class-native = "autoconf-native hostperl-runtime-native"
 SRC_URI += " file://python-libdir.patch \
             file://buildtest.patch \
             file://performance.patch \
+            file://perl-regex-curly.patch \
             file://new_rt_path_for_test-driver.patch"
 
 SRC_URI[md5sum] = "716946a105ca228ab545fc37a70df3a3"
-- 
2.13.1


--------------7DF3212E7FFF6EE8499CF9B7--
