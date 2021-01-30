Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.1076.1611991202448856680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 23:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ufy1lkWB;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id md11so6959165pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 23:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NvnjOmdOJh4XvJjmcp35fm/li1c+YXjTZjnDbEvxyZk=;
        b=Ufy1lkWB9PWRSI9HpDKcJ11BQdweAK/ACS/2aFw3Sc44OaFsjaMNam/1jUGLYRbeBr
         AvCfgNeQ1aQ6HbsM8laWRBKFxyXjOgoq1TF7xAUEzldMHF2F6z8GO7GQG3GQXjUnPIh6
         JTehVIuC81SrN1kz3haammnBmO3RlDFp+nEP1+gy4fjYIdZP2Mvbpi/jQwol+SLSVhle
         e6UKof+xYZ0gEdEbgG8OENNYv3uO9bPeOGr0BGsGNHFTjqFpDEK73E+flxoLY/ztwRhN
         Mvvu+yCNS0QnQlCC254Mt9ZcNNrdmoJbA2gusAWUvTBipRZv9y1EioZ5jfEU25wVQ5M6
         IqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NvnjOmdOJh4XvJjmcp35fm/li1c+YXjTZjnDbEvxyZk=;
        b=AqImbwDZB6NM125pmoidJiSBnWyEKaxU1kOwPXTOOQkekf6JWHLXOuk81OVAaxWqz3
         /dtWXZMuCPdpezadzlB1TNdIclyOz3joTfZXPVpD9oyNBaQaTNgfmxBQ6i30bGt3RSIU
         5dpL1RONQGzEOAeYpGUsGrb6YBDSMA/o9Q5JwQ37ve9Qt8DAogi3ZYCjWNANfBPPDiFq
         H/yi8WUwIcB63VNEfqJUeNmG1Jhy8Vv2jYycIU7+P3SrAELQW3+2qdIGaN04XJcBGWcX
         /BzeBzzTbdTU+U9YCcmciTAtfqX48MzahGFK+5yDT1xNZSW85Uz6Jq8ugDjWqqGOdpIS
         iGEw==
X-Gm-Message-State: AOAM530B7LDg0PCJYT7uxhgiVVWWuHl0CEDYFxPTMXhd55cbTMVFzahk
	9R2xzS6eAt3xQyLcTzr8tkpVe3J7/cCu8w==
X-Google-Smtp-Source: ABdhPJyM+JuRjoXi5H7rcjdNKWBfa0yj3GiMSS47ACE8GtS66BZQNMjnrnu9LbKkuuAC7iQF9DSvrg==
X-Received: by 2002:a17:902:ed94:b029:de:8844:a650 with SMTP id e20-20020a170902ed94b02900de8844a650mr8392816plj.56.1611991198398;
        Fri, 29 Jan 2021 23:19:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id m18sm10797221pfd.206.2021.01.29.23.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 23:19:57 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/5] binutils: Upgrade to 2.36 release
Date: Fri, 29 Jan 2021 23:19:50 -0800
Message-Id: <20210130071954.2695419-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backported patches which are already present in 2.36 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 ...{binutils-2.35.1.inc => binutils-2.36.inc} |   13 +-
 ...5.1.bb => binutils-cross-canadian_2.36.bb} |    0
 ....1.bb => binutils-cross-testsuite_2.36.bb} |    0
 ...cross_2.35.1.bb => binutils-cross_2.36.bb} |    0
 ...dk_2.35.1.bb => binutils-crosssdk_2.36.bb} |    0
 ...n-error-on-conditional-branch-to-an-.patch |  135 --
 ...s-crosssdk-Generate-relocatable-SDKs.patch |   17 +-
 ...o-not-generate-linker-script-directo.patch |   10 +-
 ...dk-Search-for-alternative-ld.so.conf.patch |   21 +-
 ...iden-the-regexp-for-SH-architectures.patch |   15 +-
 ...005-Point-scripts-location-to-libdir.patch |   13 +-
 ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   14 +-
 ...stro-compiler-point-to-the-wrong-ins.patch |   11 +-
 ...-system-directories-when-cross-linki.patch |   72 +-
 ...e-default-emulation-for-mips64-linux.patch |   13 +-
 .../0010-Add-support-for-Netlogic-XLP.patch   |   55 +-
 ...ect-assembling-for-ppc-wait-mnemonic.patch |   13 +-
 .../0012-Detect-64-bit-MIPS-targets.patch     |    9 +-
 .../binutils/0013-Use-libtool-2.4.patch       | 1235 ++++++++---------
 ...h-in-libtool-when-sysroot-is-enabled.patch |    7 +-
 .../0015-sync-with-OE-libtool-changes.patch   |    7 +-
 ...or-clang-before-checking-gcc-version.patch |   15 +-
 ...oducibility-for-stabs-debugging-data.patch |   35 -
 .../binutils/binutils/CVE-2020-35448.patch    |   85 --
 .../{binutils_2.35.1.bb => binutils_2.36.bb}  |    0
 26 files changed, 737 insertions(+), 1060 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.35.1.inc => binutils-2.36.inc} (83%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.35.1.bb => binutils-cross-canadian_2.36.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.35.1.bb => binutils-cross-testsuite_2.36.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.35.1.bb => binutils-cross_2.36.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.35.1.bb => binutils-crosssdk_2.36.bb} (100%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
 rename meta/recipes-devtools/binutils/{binutils_2.35.1.bb => binutils_2.36.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 5540e37bcf..ba6e360b30 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "10.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.35%"
+BINUVERSION ?= "2.36%"
 GDBVERSION ?= "10.%"
 GLIBCVERSION ?= "2.32"
 LINUXLIBCVERSION ?= "5.10%"
diff --git a/meta/recipes-devtools/binutils/binutils-2.35.1.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
similarity index 83%
rename from meta/recipes-devtools/binutils/binutils-2.35.1.inc
rename to meta/recipes-devtools/binutils/binutils-2.36.inc
index 775af2b8f2..ab0760621b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.35.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
@@ -14,17 +14,17 @@ def binutils_branch_version(d):
     pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "_" + pvsplit[1]
 
-# When upgrading to 2.35, please make sure there is no trailing .0, so
+# When upgrading to 2.37, please make sure there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.35.1"
-CVE_VERSION = "2.35.1"
+PV = "2.36"
+CVE_VERSION = "2.36"
 BINUPV = "${@binutils_branch_version(d)}"
 #BRANCH = "binutils-${BINUPV}-branch"
-BRANCH ?= "binutils-2_35-branch"
+BRANCH ?= "binutils-2_36-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "7e46a74aa3713c563940960e361e08defda019c2"
+SRCREV ?= "fe0e833171513c1d89668bc5f454192d2db39bce"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
@@ -41,8 +41,5 @@ SRC_URI = "\
      file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
-     file://0017-gas-improve-reproducibility-for-stabs-debugging-data.patch \
-     file://0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch \
-     file://CVE-2020-35448.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.35.1.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.36.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.35.1.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.36.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.35.1.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.36.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.35.1.bb
rename to meta/recipes-devtools/binutils/binutils-cross-testsuite_2.36.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb b/meta/recipes-devtools/binutils/binutils-cross_2.36.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.36.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.35.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.36.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.35.1.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.36.bb
diff --git a/meta/recipes-devtools/binutils/binutils/0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch b/meta/recipes-devtools/binutils/binutils/0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch
deleted file mode 100644
index f46ddab415..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From c7cd291722779c9d4703ed0010388fe394c644c8 Mon Sep 17 00:00:00 2001
-From: Siddhesh Poyarekar <siddesh.poyarekar@arm.com>
-Date: Tue, 1 Sep 2020 14:25:52 +0530
-Subject: [PATCH] aarch64: Return an error on conditional branch to an undefined symbol
-
-The fix in 7e05773767820b441b23a16628b55c98cb1aef46 introduced a PLT
-for conditional jumps when the target symbol is undefined.  This is
-incorrect because conditional branch relocations are not allowed to
-clobber IP0/IP1 and hence, should not result in a dynamic relocation.
-
-Revert that change and in its place, issue an error when the target
-symbol is undefined.
-
-bfd/
-
-	2020-09-10  Siddhesh Poyarekar  <siddesh.poyarekar@arm.com>
-
-	* elfnn-aarch64.c (elfNN_aarch64_final_link_relocate): Revert
-	changes in 7e05773767820b441b23a16628b55c98cb1aef46.  Set
-	error for undefined symbol in BFD_RELOC_AARCH64_BRANCH19 and
-	BFD_RELOC_AARCH64_TSTBR14 relocations.
-
-ld/
-
-	2020-09-10  Siddhesh Poyarekar  <siddesh.poyarekar@arm.com>
-
-	* testsuite/ld-aarch64/emit-relocs-560.d: Expect error instead
-	of valid output.
----
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c7cd291722779c9d4703ed0010388fe394c644c8]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- bfd/ChangeLog                             |  7 +++++
- bfd/elfnn-aarch64.c                       | 37 ++++++++++++-----------
- ld/ChangeLog                              |  5 +++
- ld/testsuite/ld-aarch64/emit-relocs-560.d |  7 +----
- 4 files changed, 32 insertions(+), 24 deletions(-)
-
-diff --git a/bfd/elfnn-aarch64.c b/bfd/elfnn-aarch64.c
-index 5b4c189b593..a9924e7ec56 100644
---- a/bfd/elfnn-aarch64.c
-+++ b/bfd/elfnn-aarch64.c
-@@ -5447,7 +5447,6 @@ elfNN_aarch64_final_link_relocate (reloc_howto_type *howto,
-   bfd_vma orig_value = value;
-   bfd_boolean resolved_to_zero;
-   bfd_boolean abs_symbol_p;
--  bfd_boolean via_plt_p;
- 
-   globals = elf_aarch64_hash_table (info);
- 
-@@ -5469,8 +5468,6 @@ elfNN_aarch64_final_link_relocate (reloc_howto_type *howto,
- 		  : bfd_is_und_section (sym_sec));
-   abs_symbol_p = h != NULL && bfd_is_abs_symbol (&h->root);
- 
--  via_plt_p = (globals->root.splt != NULL && h != NULL
--	       && h->plt.offset != (bfd_vma) - 1);
- 
-   /* Since STT_GNU_IFUNC symbol must go through PLT, we handle
-      it here if it is defined in a non-shared object.  */
-@@ -5806,23 +5803,12 @@ elfNN_aarch64_final_link_relocate (reloc_howto_type *howto,
- 	value += signed_addend;
-       break;
- 
--    case BFD_RELOC_AARCH64_BRANCH19:
--    case BFD_RELOC_AARCH64_TSTBR14:
--      /* A conditional branch to an undefined weak symbol is converted to a
--	 branch to itself.  */
--      if (weak_undef_p && !via_plt_p)
--	{
--	  value = _bfd_aarch64_elf_resolve_relocation (input_bfd, bfd_r_type,
--						       place, value,
--						       signed_addend,
--						       weak_undef_p);
--	  break;
--	}
--      /* Fall through.  */
-     case BFD_RELOC_AARCH64_CALL26:
-     case BFD_RELOC_AARCH64_JUMP26:
-       {
- 	asection *splt = globals->root.splt;
-+	bfd_boolean via_plt_p =
-+	  splt != NULL && h != NULL && h->plt.offset != (bfd_vma) - 1;
- 
- 	/* A call to an undefined weak symbol is converted to a jump to
- 	   the next instruction unless a PLT entry will be created.
-@@ -5903,6 +5889,23 @@ elfNN_aarch64_final_link_relocate (reloc_howto_type *howto,
- 	  bfd_set_error (bfd_error_bad_value);
- 	  return bfd_reloc_notsupported;
- 	}
-+      value = _bfd_aarch64_elf_resolve_relocation (input_bfd, bfd_r_type,
-+						   place, value,
-+						   signed_addend,
-+						   weak_undef_p);
-+      break;
-+
-+    case BFD_RELOC_AARCH64_BRANCH19:
-+    case BFD_RELOC_AARCH64_TSTBR14:
-+      if (h && h->root.type == bfd_link_hash_undefined)
-+	{
-+	  _bfd_error_handler
-+	    /* xgettext:c-format */
-+	    (_("%pB: conditional branch to undefined symbol `%s' "
-+	       "not allowed"), input_bfd, h->root.root.string);
-+	  bfd_set_error (bfd_error_bad_value);
-+	  return bfd_reloc_notsupported;
-+	}
-       /* Fall through.  */
- 
-     case BFD_RELOC_AARCH64_16:
-@@ -7968,8 +7971,6 @@ elfNN_aarch64_check_relocs (bfd *abfd, struct bfd_link_info *info,
- 	    break;
- 	  }
- 
--	case BFD_RELOC_AARCH64_BRANCH19:
--	case BFD_RELOC_AARCH64_TSTBR14:
- 	case BFD_RELOC_AARCH64_CALL26:
- 	case BFD_RELOC_AARCH64_JUMP26:
- 	  /* If this is a local symbol then we resolve it
-diff --git a/ld/testsuite/ld-aarch64/emit-relocs-560.d b/ld/testsuite/ld-aarch64/emit-relocs-560.d
-index 153532457b4..8751b743bd4 100644
---- a/ld/testsuite/ld-aarch64/emit-relocs-560.d
-+++ b/ld/testsuite/ld-aarch64/emit-relocs-560.d
-@@ -1,8 +1,3 @@
- #source: emit-relocs-560.s
- #ld: -shared
--#readelf: -r
--
--Relocation section '.rela.plt' at offset 0x[0-9a-f]+ contains 2 entries:
--  Offset          Info           Type           Sym. Value    Sym. Name \+ Addend
--[0-9a-f]+  000100000402 R_AARCH64_JUMP_SL 0000000000000000 baz \+ 0
--[0-9a-f]+  000200000402 R_AARCH64_JUMP_SL 0000000000000000 bar \+ 0
-+#error: .*: conditional branch to undefined symbol `bar' not allowed
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 4c1d11291b..49dacfef81 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,7 +1,7 @@
-From a0b23b160d6cfa7be4437c6e623633d76395f2ad Mon Sep 17 00:00:00 2001
+From 3b278a56a0e98d50ec62735598ee5f4b1834e8b3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
-Subject: [PATCH 01/16] binutils-crosssdk: Generate relocatable SDKs
+Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
 
 This patch will modify the ELF linker scripts so that the crosssdk
 linker will generate binaries with a 4096 bytes PT_INTERP section. When the binaries
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/gold/layout.cc b/gold/layout.cc
-index 13e533aaf21..b0afff16e2e 100644
+index a27cb071c75..32b52890b39 100644
 --- a/gold/layout.cc
 +++ b/gold/layout.cc
-@@ -5019,7 +5019,7 @@ Layout::create_interp(const Target* target)
+@@ -5032,7 +5032,7 @@ Layout::create_interp(const Target* target)
        gold_assert(interp != NULL);
      }
  
@@ -34,7 +34,7 @@ index 13e533aaf21..b0afff16e2e 100644
    Output_section_data* odata = new Output_data_const(interp, len, 1);
  
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index 03392d265c7..435689ea144 100755
+index 088417ef2d5..46a2db7005c 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
 @@ -304,6 +304,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
@@ -59,10 +59,10 @@ index 03392d265c7..435689ea144 100755
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
  RELOCATING=" "
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index eb74743e5c3..c9a8a47615f 100644
+index 29a8f0781d5..75e46f4adaf 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
-@@ -143,8 +143,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
+@@ -147,8 +147,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
      DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
    fi
  fi
@@ -73,6 +73,3 @@ index eb74743e5c3..c9a8a47615f 100644
  fi
  if test -z "$PLT"; then
    IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index 41dff05b25..d07947404f 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,8 +1,7 @@
-From 0d14f8f333a9b519202246ce779f3e380491826c Mon Sep 17 00:00:00 2001
+From cf4c8a97b7dc1fe36a7d5dabed417fe18b15ad6b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
-Subject: [PATCH 02/17] binutils-cross: Do not generate linker script
- directories
+Subject: [PATCH] binutils-cross: Do not generate linker script directories
 
 We don't place target libraries within ${exec_prefix}, we'd always place these
 within the target sysroot within the standard library directories. Worse, the
@@ -23,7 +22,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index 435689ea144..cff8a1467f9 100755
+index 46a2db7005c..4bb7c33f560 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
 @@ -235,31 +235,6 @@ append_to_lib_path()
@@ -58,6 +57,3 @@ index 435689ea144..cff8a1467f9 100755
  if [ "x${LIB_PATH}" = "x" ] && [ "x${USE_LIBPATH}" = xyes ] ; then
    libs=${NATIVE_LIB_DIRS}
    if [ "x${NATIVE}" = "xyes" ] ; then
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
index 28daf58f74..cc37d30c53 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
@@ -1,8 +1,8 @@
-From 3bbec749ec9fe681ade6812c48c541a752fcffd5 Mon Sep 17 00:00:00 2001
+From 9701cab0fdf6a0c011978ae140c4c12a962956f6 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 19 Feb 2020 09:51:16 -0800
-Subject: [PATCH 03/17] binutils-nativesdk: Search for alternative ld.so.conf
- in SDK installation
+Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf in SDK
+ installation
 
 We need binutils to look at our ld.so.conf file within the SDK to ensure
 we search the SDK's libdirs as well as those from the host system.
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 02c4fc16395..a5762227f0a 100644
+index 2c9a487335c..3b01357b651 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -42,7 +42,8 @@ ZLIBINC = @zlibinc@
@@ -43,10 +43,10 @@ index 02c4fc16395..a5762227f0a 100644
  NO_WERROR = @NO_WERROR@
  AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 2fe12e14f63..8f0c83ac8d2 100644
+index b41941c89e2..a6382bf2a45 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -548,7 +548,8 @@ ZLIB = @zlibdir@ -lz
+@@ -554,7 +554,8 @@ ZLIB = @zlibdir@ -lz
  ZLIBINC = @zlibinc@
  ELF_CLFAGS = -DELF_LIST_OPTIONS=@elf_list_options@ \
  	   -DELF_SHLIB_LIST_OPTIONS=@elf_shlib_list_options@ \
@@ -57,7 +57,7 @@ index 2fe12e14f63..8f0c83ac8d2 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
  
 diff --git a/ld/ldelf.c b/ld/ldelf.c
-index bada3ade2d7..b4784009d7a 100644
+index f7407ab55a7..b25781cc0c4 100644
 --- a/ld/ldelf.c
 +++ b/ld/ldelf.c
 @@ -911,7 +911,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
@@ -70,7 +70,7 @@ index bada3ade2d7..b4784009d7a 100644
        if (!ldelf_parse_ld_so_conf (&info, tmppath))
  	{
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 08be9030cb5..f5c5a336320 100644
+index 863df0293ea..080b1c4c6c2 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
 @@ -70,6 +70,7 @@ char *program_name;
@@ -82,7 +82,7 @@ index 08be9030cb5..f5c5a336320 100644
  /* The canonical representation of ld_sysroot.  */
  char *ld_canon_sysroot;
 diff --git a/ld/ldmain.h b/ld/ldmain.h
-index ac7db5720d5..1cbe1771912 100644
+index 38e63922d31..0966914938c 100644
 --- a/ld/ldmain.h
 +++ b/ld/ldmain.h
 @@ -23,6 +23,7 @@
@@ -93,6 +93,3 @@ index ac7db5720d5..1cbe1771912 100644
  extern char *ld_canon_sysroot;
  extern int ld_canon_sysroot_len;
  extern FILE *saved_script_handle;
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
index 2381c7b85e..1cd459ae81 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
@@ -1,7 +1,7 @@
-From 361c2c313196c095d12d17cecf0a069107dd629b Mon Sep 17 00:00:00 2001
+From 7e7512c82402363688cca6f1febea2c01cb03409 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:07:33 +0000
-Subject: [PATCH 04/17] configure: widen the regexp for SH architectures
+Subject: [PATCH] configure: widen the regexp for SH architectures
 
 gprof needs to know about uclibc
 
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 54d0339ab9e..6782f8b6ab8 100755
+index 68779feb42b..7b369071141 100755
 --- a/configure
 +++ b/configure
-@@ -3937,7 +3937,7 @@ case "${target}" in
+@@ -3887,7 +3887,7 @@ case "${target}" in
    nvptx*-*-*)
      noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
      ;;
@@ -27,10 +27,10 @@ index 54d0339ab9e..6782f8b6ab8 100755
        sh*-*-elf)
           ;;
 diff --git a/configure.ac b/configure.ac
-index a910c4fd6ba..55beb1dea46 100644
+index d16a2757689..92f01fb3ed7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1178,7 +1178,7 @@ case "${target}" in
+@@ -1177,7 +1177,7 @@ case "${target}" in
    nvptx*-*-*)
      noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
      ;;
@@ -39,6 +39,3 @@ index a910c4fd6ba..55beb1dea46 100644
      case "${target}" in
        sh*-*-elf)
           ;;
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
index c31a0bc9a6..dde0cb5d6d 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
@@ -1,7 +1,7 @@
-From 39b478b7e52fb1b892a392f3c3750b9023cfabc8 Mon Sep 17 00:00:00 2001
+From 6a67d277941228d997b527990960413f8444fb81 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
-Subject: [PATCH 05/17] Point scripts location to libdir
+Subject: [PATCH] Point scripts location to libdir
 
 Upstream-Status: Inappropriate [debian patch]
 
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index a5762227f0a..e1c665898f3 100644
+index 3b01357b651..b7a1f7491b0 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -51,7 +51,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
@@ -25,10 +25,10 @@ index a5762227f0a..e1c665898f3 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 8f0c83ac8d2..acc24ec4130 100644
+index a6382bf2a45..5ee3a4971be 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -556,7 +556,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+@@ -562,7 +562,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -37,6 +37,3 @@ index 8f0c83ac8d2..acc24ec4130 100644
  BASEDIR = $(srcdir)/..
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 654b64ff78..caa5f0bdd3 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,8 +1,7 @@
-From 59640ddf11104a604ccf7c078a48359d711c2f9c Mon Sep 17 00:00:00 2001
+From 8ad249270414a23a3e65c74fd67a8e4adaebec78 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:27:17 +0000
-Subject: [PATCH 06/17] Only generate an RPATH entry if LD_RUN_PATH is not
- empty
+Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
 
 for cases where -rpath isn't specified. debian (#151024)
 
@@ -15,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/ld/ldelf.c b/ld/ldelf.c
-index b4784009d7a..541772f4604 100644
+index b25781cc0c4..77d7fb8ff03 100644
 --- a/ld/ldelf.c
 +++ b/ld/ldelf.c
-@@ -1247,6 +1247,8 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
+@@ -1248,6 +1248,8 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
  		  && command_line.rpath == NULL)
  		{
  		  path = (const char *) getenv ("LD_RUN_PATH");
@@ -27,7 +26,7 @@ index b4784009d7a..541772f4604 100644
  		  if (path
  		      && ldelf_search_needed (path, &n, force,
  					      is_linux, elfsize))
-@@ -1605,6 +1607,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
+@@ -1608,6 +1610,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
@@ -36,6 +35,3 @@ index b4784009d7a..541772f4604 100644
  
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index 7f8fc9a5c0..b13a35e02f 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,8 +1,8 @@
-From 2b81508b9af76db292cd756432b03035cb8157e0 Mon Sep 17 00:00:00 2001
+From 091870218f192a5698c4420adf938e7178553c07 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
-Subject: [PATCH 07/17] don't let the distro compiler point to the wrong
- installation location
+Subject: [PATCH] don't let the distro compiler point to the wrong installation
+ location
 
 Thanks to RP for helping find the source code causing the issue.
 
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index 895f701bcd0..97a53f15bb6 100644
+index 788590957e1..1bca4aafeb7 100644
 --- a/libiberty/Makefile.in
 +++ b/libiberty/Makefile.in
 @@ -367,7 +367,8 @@ install-strip: install
@@ -30,6 +30,3 @@ index 895f701bcd0..97a53f15bb6 100644
  install_to_libdir: all
  	if test -n "${target_header_dir}"; then \
  		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
index 2356c6a60f..3f83d48f62 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,7 +1,7 @@
-From 413075afbdb16e7cc05511682ca9e3c880acb5a7 Mon Sep 17 00:00:00 2001
+From a1d0ca24d3bbdf4cb37537cd84d04a17bf0f813b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
-Subject: [PATCH 08/17] warn for uses of system directories when cross linking
+Subject: [PATCH] warn for uses of system directories when cross linking
 
 2008-07-02  Joseph Myers  <joseph@codesourcery.com>
 
@@ -57,13 +57,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/ld.h         |  8 ++++++++
  ld/ld.texi      | 12 ++++++++++++
  ld/ldfile.c     | 17 +++++++++++++++++
- ld/ldlex.h      |  5 +++++
+ ld/ldlex.h      |  2 ++
  ld/ldmain.c     |  2 ++
- ld/lexsup.c     | 27 +++++++++++++++++++++++++++
- 9 files changed, 100 insertions(+)
+ ld/lexsup.c     | 15 +++++++++++++++
+ 9 files changed, 85 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
-index f1712107367..308e0173c16 100644
+index 7b60d778587..37b8e9b6f6c 100644
 --- a/ld/config.in
 +++ b/ld/config.in
 @@ -40,6 +40,9 @@
@@ -77,10 +77,10 @@ index f1712107367..308e0173c16 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index f08ce9969ea..1c872c0db5f 100755
+index d399d08d0c4..8355c433c76 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -826,6 +826,7 @@ with_lib_path
+@@ -828,6 +828,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -88,7 +88,7 @@ index f08ce9969ea..1c872c0db5f 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1493,6 +1494,8 @@ Optional Features:
+@@ -1496,6 +1497,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -97,7 +97,7 @@ index f08ce9969ea..1c872c0db5f 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15793,6 +15796,19 @@ fi
+@@ -15820,6 +15823,19 @@ fi
  
  
  
@@ -118,7 +118,7 @@ index f08ce9969ea..1c872c0db5f 100755
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
-index 5a4938afdb0..dbbbde74b04 100644
+index c9c69ab9245..59dab0a6ac4 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
@@ -139,7 +139,7 @@ index 5a4938afdb0..dbbbde74b04 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index 1790dc81a66..73f832eb169 100644
+index 93f5af92c7d..ff7f71a7b66 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
 @@ -166,6 +166,14 @@ typedef struct
@@ -158,10 +158,10 @@ index 1790dc81a66..73f832eb169 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texi b/ld/ld.texi
-index 2a93e9456ac..3eeb70607fd 100644
+index 7a602b9c6ab..cccbfbab3bb 100644
 --- a/ld/ld.texi
 +++ b/ld/ld.texi
-@@ -2655,6 +2655,18 @@ string identifying the original linked file does not change.
+@@ -2810,6 +2810,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -181,7 +181,7 @@ index 2a93e9456ac..3eeb70607fd 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index e39170b5d94..fadc248a140 100644
+index 81cb86d51e2..cd5c2752679 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
 @@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
@@ -209,26 +209,23 @@ index e39170b5d94..fadc248a140 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 5ea083ebeb3..941dc5f3dc8 100644
+index b0101028321..77f5accb5d9 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -155,6 +155,11 @@ enum option_values
-   OPTION_NON_CONTIGUOUS_REGIONS,
-   OPTION_NON_CONTIGUOUS_REGIONS_WARNINGS,
-   OPTION_DEPENDENCY_FILE,
-+  OPTION_CTF_VARIABLES,
-+  OPTION_NO_CTF_VARIABLES,
-+  OPTION_CTF_SHARE_TYPES,
+@@ -161,6 +161,8 @@ enum option_values
+   OPTION_CTF_VARIABLES,
+   OPTION_NO_CTF_VARIABLES,
+   OPTION_CTF_SHARE_TYPES,
 +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
 +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
  };
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index f5c5a336320..516ba0360e2 100644
+index 080b1c4c6c2..78d8a2df278 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -322,6 +322,8 @@ main (int argc, char **argv)
+@@ -324,6 +324,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -238,25 +235,13 @@ index f5c5a336320..516ba0360e2 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 58c6c078325..879e7bb7658 100644
+index f005a58a045..c83292a9427 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -572,6 +572,26 @@ static const struct ld_option ld_options[] =
-   { {"no-print-map-discarded", no_argument, NULL, OPTION_NO_PRINT_MAP_DISCARDED},
-     '\0', NULL, N_("Do not show discarded sections in map file output"),
+@@ -591,6 +591,14 @@ static const struct ld_option ld_options[] =
+ 		   "                                <method> is: share-unconflicted (default),\n"
+ 		   "                                             share-duplicated"),
      TWO_DASHES },
-+  { {"ctf-variables", no_argument, NULL, OPTION_CTF_VARIABLES},
-+    '\0', NULL, N_("Emit names and types of static variables in CTF"),
-+    TWO_DASHES },
-+  { {"no-ctf-variables", no_argument, NULL, OPTION_NO_CTF_VARIABLES},
-+    '\0', NULL, N_("Do not emit names and types of static variables in CTF"),
-+    TWO_DASHES },
-+  { {"ctf-share-types=<method>", required_argument, NULL,
-+     OPTION_CTF_SHARE_TYPES},
-+    '\0', NULL, N_("How to share CTF types between translation units.\n"
-+		   "                                <method> is: share-unconflicted (default),\n"
-+		   "                                             share-duplicated"),
-+    TWO_DASHES },
 +  { {"no-poison-system-directories", no_argument, NULL,
 +     OPTION_NO_POISON_SYSTEM_DIRECTORIES},
 +    '\0', NULL, N_("Do not warn for -L options using system directories"),
@@ -268,7 +253,7 @@ index 58c6c078325..879e7bb7658 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1632,6 +1652,13 @@ parse_args (unsigned argc, char **argv)
+@@ -1674,6 +1682,13 @@ parse_args (unsigned argc, char **argv)
  
  	case OPTION_PRINT_MAP_DISCARDED:
  	  config.print_map_discarded = TRUE;
@@ -282,6 +267,3 @@ index 58c6c078325..879e7bb7658 100644
  	  break;
  
  	case OPTION_DEPENDENCY_FILE:
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
index fb5276e183..b8a1939d36 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-Change-default-emulation-for-mips64-linux.patch
@@ -1,7 +1,7 @@
-From 13a67e9040c01abd284fe506471e0eab668ee3dc Mon Sep 17 00:00:00 2001
+From 5bd94030de598d3a13091dafaed3b956e0ab708f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:44:14 +0000
-Subject: [PATCH 09/17] Change default emulation for mips64*-*-linux
+Subject: [PATCH] Change default emulation for mips64*-*-linux
 
 we change the default emulations to be N64 instead of N32
 
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 14523caf0c5..e5233cd1f7e 100644
+index e7b55b0dd78..2caf492e172 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -894,12 +894,12 @@ case "${targ}" in
+@@ -896,12 +896,12 @@ case "${targ}" in
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
      ;;
    mips64*el-*-linux*)
@@ -35,7 +35,7 @@ index 14523caf0c5..e5233cd1f7e 100644
    mips*el-*-linux*)
      targ_defvec=mips_elf32_trad_le_vec
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 87c7d9a4cad..9b4bf2ca964 100644
+index 0c780b24d57..47431770a17 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
 @@ -531,12 +531,12 @@ mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
@@ -55,6 +55,3 @@ index 87c7d9a4cad..9b4bf2ca964 100644
  			targ_extra_libpath=$targ_extra_emuls
  			;;
  mips*el-*-linux-*)	targ_emul=elf32ltsmip
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch
index 277db4ec5c..fe2d02f29d 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-Add-support-for-Netlogic-XLP.patch
@@ -1,7 +1,7 @@
-From 69ab45c16f80f18fa78121f6e774750b9e9a200b Mon Sep 17 00:00:00 2001
+From c64a5ca02a55b748311032e2c7d9c4f87bd74c63 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:06:19 +0000
-Subject: [PATCH 10/17] Add support for Netlogic XLP
+Subject: [PATCH] Add support for Netlogic XLP
 
 Patch From: Nebu Philips <nphilips@netlogicmicro.com>
 
@@ -35,7 +35,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  15 files changed, 65 insertions(+), 21 deletions(-)
 
 diff --git a/bfd/aoutx.h b/bfd/aoutx.h
-index d352a1a3e44..2e2c3c1af86 100644
+index 8025b8c5241..cdcb7876896 100644
 --- a/bfd/aoutx.h
 +++ b/bfd/aoutx.h
 @@ -810,6 +810,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
@@ -47,7 +47,7 @@ index d352a1a3e44..2e2c3c1af86 100644
  	  arch_flags = M_MIPS2;
  	  break;
 diff --git a/bfd/archures.c b/bfd/archures.c
-index 551ec8732f0..2665b378623 100644
+index 8c1d32ca930..b4b2927ebc0 100644
 --- a/bfd/archures.c
 +++ b/bfd/archures.c
 @@ -185,6 +185,7 @@ DESCRIPTION
@@ -59,10 +59,10 @@ index 551ec8732f0..2665b378623 100644
  .#define bfd_mach_mipsisa32r2		33
  .#define bfd_mach_mipsisa32r3		34
 diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
-index 35ef4d755bb..48db00af80b 100644
+index 7eff85b7eaa..6c9eb12865e 100644
 --- a/bfd/bfd-in2.h
 +++ b/bfd/bfd-in2.h
-@@ -1585,6 +1585,7 @@ enum bfd_architecture
+@@ -1590,6 +1590,7 @@ enum bfd_architecture
  #define bfd_mach_mips_octeon3          6503
  #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'.  */
  #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'.  */
@@ -71,10 +71,10 @@ index 35ef4d755bb..48db00af80b 100644
  #define bfd_mach_mipsisa32r2           33
  #define bfd_mach_mipsisa32r3           34
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index e5233cd1f7e..2e4ae6bbdff 100644
+index 2caf492e172..e75417da4d8 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -877,6 +877,11 @@ case "${targ}" in
+@@ -879,6 +879,11 @@ case "${targ}" in
      targ_defvec=mips_elf32_le_vec
      targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
      ;;
@@ -87,7 +87,7 @@ index e5233cd1f7e..2e4ae6bbdff 100644
      targ_defvec=mips_elf32_be_vec
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
 diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
-index 802acb45f1e..fd9ec4c0ad4 100644
+index 5a944ceee81..c57d12ba3dd 100644
 --- a/bfd/cpu-mips.c
 +++ b/bfd/cpu-mips.c
 @@ -108,7 +108,8 @@ enum
@@ -111,10 +111,10 @@ index 802acb45f1e..fd9ec4c0ad4 100644
  
  /* The default architecture is mips:3000, but with a machine number of
 diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
-index 160febec94c..4c9499cc2cf 100644
+index 3cbb3cf9495..0c6cd47b40c 100644
 --- a/bfd/elfxx-mips.c
 +++ b/bfd/elfxx-mips.c
-@@ -6982,6 +6982,9 @@ _bfd_elf_mips_mach (flagword flags)
+@@ -6980,6 +6980,9 @@ _bfd_elf_mips_mach (flagword flags)
      case E_MIPS_MACH_IAMR2:
        return bfd_mach_mips_interaptiv_mr2;
  
@@ -124,7 +124,7 @@ index 160febec94c..4c9499cc2cf 100644
      default:
        switch (flags & EF_MIPS_ARCH)
  	{
-@@ -12356,6 +12359,10 @@ mips_set_isa_flags (bfd *abfd)
+@@ -12335,6 +12338,10 @@ mips_set_isa_flags (bfd *abfd)
        val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
        break;
  
@@ -135,7 +135,7 @@ index 160febec94c..4c9499cc2cf 100644
      case bfd_mach_mipsisa32:
        val = E_MIPS_ARCH_32;
        break;
-@@ -14373,6 +14380,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
+@@ -14352,6 +14359,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
    { bfd_mach_mips_gs264e, bfd_mach_mips_gs464e },
    { bfd_mach_mips_gs464e, bfd_mach_mips_gs464 },
    { bfd_mach_mips_gs464, bfd_mach_mipsisa64r2 },
@@ -144,10 +144,10 @@ index 160febec94c..4c9499cc2cf 100644
    /* MIPS64 extensions.  */
    { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
 diff --git a/binutils/readelf.c b/binutils/readelf.c
-index 6057515a89b..ea119b0b254 100644
+index ad16b4571c9..4bf2b732502 100644
 --- a/binutils/readelf.c
 +++ b/binutils/readelf.c
-@@ -3483,6 +3483,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
+@@ -3502,6 +3502,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
  	    case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
  	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
  	    case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2"); break;
@@ -156,7 +156,7 @@ index 6057515a89b..ea119b0b254 100644
  	    /* We simply ignore the field in this case to avoid confusion:
  	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
 diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
-index 31acb77d78a..0ead168d51e 100644
+index 538b69710f5..b021b64f14b 100644
 --- a/gas/config/tc-mips.c
 +++ b/gas/config/tc-mips.c
 @@ -568,6 +568,7 @@ static int mips_32bitmode = 0;
@@ -175,7 +175,7 @@ index 31acb77d78a..0ead168d51e 100644
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -20174,7 +20176,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
+@@ -20156,7 +20158,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
    /* Broadcom XLP.
       XLP is mostly like XLR, with the prominent exception that it is
       MIPS64R2 rather than MIPS64.  */
@@ -185,10 +185,10 @@ index 31acb77d78a..0ead168d51e 100644
    /* MIPS 64 Release 6.  */
    { "i6400",	      0, ASE_VIRT | ASE_MSA,	ISA_MIPS64R6, CPU_MIPS64R6},
 diff --git a/gas/configure b/gas/configure
-index 5bccfd9d1b7..d4b13e6fc8b 100755
+index d03432c6dc6..d5ae54925e9 100755
 --- a/gas/configure
 +++ b/gas/configure
-@@ -12722,6 +12722,9 @@ _ACEOF
+@@ -12761,6 +12761,9 @@ _ACEOF
  	  mipsisa64r6 | mipsisa64r6el)
  	    mips_cpu=mips64r6
  	    ;;
@@ -199,10 +199,10 @@ index 5bccfd9d1b7..d4b13e6fc8b 100755
  	    mips_cpu=r3900
  	    ;;
 diff --git a/gas/configure.ac b/gas/configure.ac
-index b65108fecb2..ce1f2dad9bc 100644
+index 82706561886..f1c27bf2878 100644
 --- a/gas/configure.ac
 +++ b/gas/configure.ac
-@@ -325,6 +325,9 @@ changequote([,])dnl
+@@ -332,6 +332,9 @@ changequote([,])dnl
  	  mipsisa64r6 | mipsisa64r6el)
  	    mips_cpu=mips64r6
  	    ;;
@@ -213,7 +213,7 @@ index b65108fecb2..ce1f2dad9bc 100644
  	    mips_cpu=r3900
  	    ;;
 diff --git a/include/elf/mips.h b/include/elf/mips.h
-index cc08ebd4318..bb518575ce1 100644
+index 4bd86307120..2d7df22abf2 100644
 --- a/include/elf/mips.h
 +++ b/include/elf/mips.h
 @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
@@ -225,7 +225,7 @@ index cc08ebd4318..bb518575ce1 100644
  #define E_MIPS_MACH_OCTEON3	0x008e0000
  #define E_MIPS_MACH_5400	0x00910000
 diff --git a/include/opcode/mips.h b/include/opcode/mips.h
-index fd031f37588..a96a44df840 100644
+index d1b4a2574ac..879c68fcfd4 100644
 --- a/include/opcode/mips.h
 +++ b/include/opcode/mips.h
 @@ -1260,6 +1260,8 @@ static const unsigned int mips_isa_table[] = {
@@ -256,7 +256,7 @@ index fd031f37588..a96a44df840 100644
        return FALSE;
      }
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 9b4bf2ca964..f6d7171dff7 100644
+index 47431770a17..f714744eab3 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
 @@ -510,6 +510,9 @@ mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
@@ -270,7 +270,7 @@ index 9b4bf2ca964..f6d7171dff7 100644
  			targ_extra_emuls="elf32lr5900"
  			targ_extra_libpath=$targ_extra_emuls
 diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
-index 755bbe294bd..ce22ef683a6 100644
+index 317ced51204..6869f890656 100644
 --- a/opcodes/mips-dis.c
 +++ b/opcodes/mips-dis.c
 @@ -674,13 +674,11 @@ const struct mips_arch_choice mips_arch_choices[] =
@@ -293,7 +293,7 @@ index 755bbe294bd..ce22ef683a6 100644
    /* This entry, mips16, is here only for ISA/processor selection; do
       not print its name.  */
 diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
-index 5270aeefa80..d17dc78cd71 100644
+index b45eb40bf69..2f4eb5c0354 100644
 --- a/opcodes/mips-opc.c
 +++ b/opcodes/mips-opc.c
 @@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
@@ -404,6 +404,3 @@ index 5270aeefa80..d17dc78cd71 100644
  {"swc0",		"E,o(b)",	0xe0000000, 0xfc000000,	RD_3|RD_C0|SM,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
  {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
  {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index 10c3d80865..1041b7301e 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,7 +1,7 @@
-From 7836f8aa56ef0f18c8658dc7e4952a9d097ba7e8 Mon Sep 17 00:00:00 2001
+From 7f4938d062146e40b4e6d427a5eca6cc6acaaeee Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
-Subject: [PATCH 11/17] fix the incorrect assembling for ppc wait mnemonic
+Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
 
 Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
 
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
-index 5e20d617664..4c9656ecf08 100644
+index bbbadffad8f..72092355e12 100644
 --- a/opcodes/ppc-opc.c
 +++ b/opcodes/ppc-opc.c
-@@ -6265,8 +6265,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -6302,8 +6302,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
  {"waitrsv",	XWCPL(31,30,1,0),0xffffffff, POWER10,	0,		{0}},
  {"pause_short",	XWCPL(31,30,2,0),0xffffffff, POWER10,	0,		{0}},
@@ -23,7 +23,7 @@ index 5e20d617664..4c9656ecf08 100644
  
  {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
-@@ -6326,7 +6324,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -6363,7 +6361,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  
  {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
  {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
@@ -32,6 +32,3 @@ index 5e20d617664..4c9656ecf08 100644
  
  {"dcbstep",	XRT(31,63,0),	XRT_MASK,    E500MC|PPCA2, 0,		{RA0, RB}},
  
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
index ef8b253b6a..659ae799ad 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Detect-64-bit-MIPS-targets.patch
@@ -1,7 +1,7 @@
-From dbff6bdf2123f5495b8be930304d9aa5e88006a7 Mon Sep 17 00:00:00 2001
+From bb229568e505f2276ca58b72fef6781034fa839f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 11:42:03 -0700
-Subject: [PATCH 12/17] Detect 64-bit MIPS targets
+Subject: [PATCH] Detect 64-bit MIPS targets
 
 Add mips64 target triplets and default to N64
 
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 14 insertions(+)
 
 diff --git a/gold/configure.tgt b/gold/configure.tgt
-index aa7ec552aec..470515062e4 100644
+index cac0866e628..24fbf641456 100644
 --- a/gold/configure.tgt
 +++ b/gold/configure.tgt
 @@ -153,6 +153,13 @@ aarch64*-*)
@@ -45,6 +45,3 @@ index aa7ec552aec..470515062e4 100644
  mips*-*-*)
   targ_obj=mips
   targ_machine=EM_MIPS
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
index 987a96f4b7..d4067691cf 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
@@ -1,7 +1,7 @@
-From 7e2ddee8704c9c3b73760dd9464b18fade563d85 Mon Sep 17 00:00:00 2001
+From a1031fca1b6c1348c078bb8a9df6e7d29148dae1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:04:07 +0000
-Subject: [PATCH 13/17] Use libtool 2.4
+Subject: [PATCH] Use libtool 2.4
 
 get libtool sysroot support
 
@@ -26,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  14 files changed, 10931 insertions(+), 4028 deletions(-)
 
 diff --git a/bfd/configure b/bfd/configure
-index 0340ed541b5..2012656b3b7 100755
+index b3665c68c13..376b951d496 100755
 --- a/bfd/configure
 +++ b/bfd/configure
-@@ -704,6 +704,9 @@ OTOOL
+@@ -705,6 +705,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -39,7 +39,7 @@ index 0340ed541b5..2012656b3b7 100755
  OBJDUMP
  LN_S
  NM
-@@ -822,6 +825,7 @@ enable_static
+@@ -823,6 +826,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -47,7 +47,7 @@ index 0340ed541b5..2012656b3b7 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1504,6 +1508,8 @@ Optional Packages:
+@@ -1505,6 +1509,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -56,7 +56,7 @@ index 0340ed541b5..2012656b3b7 100755
    --with-mmap             try using mmap for BFD input files if available
    --with-separate-debug-dir=DIR
                            Look for global separate debug info in DIR
-@@ -5693,8 +5699,8 @@ esac
+@@ -5694,8 +5700,8 @@ esac
  
  
  
@@ -67,7 +67,7 @@ index 0340ed541b5..2012656b3b7 100755
  
  
  
-@@ -5734,7 +5740,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5735,7 +5741,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -76,7 +76,7 @@ index 0340ed541b5..2012656b3b7 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6420,8 +6426,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6421,8 +6427,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -87,7 +87,7 @@ index 0340ed541b5..2012656b3b7 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6470,6 +6476,80 @@ esac
+@@ -6471,6 +6477,80 @@ esac
  
  
  
@@ -168,7 +168,7 @@ index 0340ed541b5..2012656b3b7 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6486,6 +6566,11 @@ case $reload_flag in
+@@ -6487,6 +6567,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -180,7 +180,7 @@ index 0340ed541b5..2012656b3b7 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6654,7 +6739,8 @@ mingw* | pw32*)
+@@ -6655,7 +6740,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -190,7 +190,7 @@ index 0340ed541b5..2012656b3b7 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6808,6 +6894,21 @@ esac
+@@ -6809,6 +6895,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -212,7 +212,7 @@ index 0340ed541b5..2012656b3b7 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6821,11 +6922,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6822,11 +6923,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -379,7 +379,7 @@ index 0340ed541b5..2012656b3b7 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6841,7 +7095,7 @@ do
+@@ -6842,7 +7096,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -388,7 +388,7 @@ index 0340ed541b5..2012656b3b7 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6861,11 +7115,15 @@ $as_echo "no" >&6; }
+@@ -6862,11 +7116,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -407,7 +407,7 @@ index 0340ed541b5..2012656b3b7 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6881,7 +7139,7 @@ do
+@@ -6882,7 +7140,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -416,7 +416,7 @@ index 0340ed541b5..2012656b3b7 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6900,6 +7158,10 @@ else
+@@ -6901,6 +7159,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -427,7 +427,7 @@ index 0340ed541b5..2012656b3b7 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6911,16 +7173,72 @@ ac_tool_warned=yes ;;
+@@ -6912,16 +7174,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -504,7 +504,7 @@ index 0340ed541b5..2012656b3b7 100755
  
  
  
-@@ -7262,8 +7580,8 @@ esac
+@@ -7263,8 +7581,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -515,7 +515,7 @@ index 0340ed541b5..2012656b3b7 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7299,6 +7617,7 @@ for ac_symprfx in "" "_"; do
+@@ -7300,6 +7618,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -523,7 +523,7 @@ index 0340ed541b5..2012656b3b7 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7340,6 +7659,18 @@ _LT_EOF
+@@ -7341,6 +7660,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -542,7 +542,7 @@ index 0340ed541b5..2012656b3b7 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7351,7 +7682,7 @@ _LT_EOF
+@@ -7352,7 +7683,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -551,7 +551,7 @@ index 0340ed541b5..2012656b3b7 100755
    const char *name;
    void       *address;
  }
-@@ -7377,8 +7708,8 @@ static const void *lt_preloaded_setup() {
+@@ -7378,8 +7709,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -562,7 +562,7 @@ index 0340ed541b5..2012656b3b7 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7388,8 +7719,8 @@ _LT_EOF
+@@ -7389,8 +7720,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -573,7 +573,7 @@ index 0340ed541b5..2012656b3b7 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7426,6 +7757,16 @@ else
+@@ -7427,6 +7758,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -590,7 +590,7 @@ index 0340ed541b5..2012656b3b7 100755
  
  
  
-@@ -7442,6 +7783,45 @@ fi
+@@ -7443,6 +7784,45 @@ fi
  
  
  
@@ -636,7 +636,7 @@ index 0340ed541b5..2012656b3b7 100755
  
  
  
-@@ -7653,6 +8033,123 @@ esac
+@@ -7654,6 +8034,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -760,7 +760,7 @@ index 0340ed541b5..2012656b3b7 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8216,6 +8713,8 @@ _LT_EOF
+@@ -8217,6 +8714,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -769,7 +769,7 @@ index 0340ed541b5..2012656b3b7 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8380,7 +8879,8 @@ fi
+@@ -8381,7 +8880,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -779,7 +779,7 @@ index 0340ed541b5..2012656b3b7 100755
  
  
  
-@@ -8469,7 +8969,7 @@ aix3*)
+@@ -8470,7 +8970,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -788,7 +788,7 @@ index 0340ed541b5..2012656b3b7 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8767,8 +9267,6 @@ fi
+@@ -8768,8 +9268,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -797,7 +797,7 @@ index 0340ed541b5..2012656b3b7 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8934,6 +9432,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8935,6 +9433,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -810,7 +810,7 @@ index 0340ed541b5..2012656b3b7 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8996,7 +9500,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8997,7 +9501,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -819,7 +819,7 @@ index 0340ed541b5..2012656b3b7 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9053,13 +9557,17 @@ case $host_os in
+@@ -9054,13 +9558,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -843,7 +843,7 @@ index 0340ed541b5..2012656b3b7 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9120,6 +9628,11 @@ fi
+@@ -9121,6 +9629,11 @@ fi
  
  
  
@@ -855,7 +855,7 @@ index 0340ed541b5..2012656b3b7 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9470,7 +9983,8 @@ _LT_EOF
+@@ -9471,7 +9984,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -865,7 +865,7 @@ index 0340ed541b5..2012656b3b7 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9569,12 +10083,12 @@ _LT_EOF
+@@ -9570,12 +10084,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -880,7 +880,7 @@ index 0340ed541b5..2012656b3b7 100755
  	  fi
  	  ;;
  	esac
-@@ -9588,8 +10102,8 @@ _LT_EOF
+@@ -9589,8 +10103,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -891,7 +891,7 @@ index 0340ed541b5..2012656b3b7 100755
        fi
        ;;
  
-@@ -9607,8 +10121,8 @@ _LT_EOF
+@@ -9608,8 +10122,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -902,7 +902,7 @@ index 0340ed541b5..2012656b3b7 100755
        else
  	ld_shlibs=no
        fi
-@@ -9654,8 +10168,8 @@ _LT_EOF
+@@ -9655,8 +10169,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -913,7 +913,7 @@ index 0340ed541b5..2012656b3b7 100755
        else
  	ld_shlibs=no
        fi
-@@ -9785,7 +10299,13 @@ _LT_EOF
+@@ -9786,7 +10300,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -928,7 +928,7 @@ index 0340ed541b5..2012656b3b7 100755
  /* end confdefs.h.  */
  
  int
-@@ -9798,22 +10318,29 @@ main ()
+@@ -9799,22 +10319,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -971,7 +971,7 @@ index 0340ed541b5..2012656b3b7 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9825,7 +10352,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9826,7 +10353,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -986,7 +986,7 @@ index 0340ed541b5..2012656b3b7 100755
  /* end confdefs.h.  */
  
  int
-@@ -9838,22 +10371,29 @@ main ()
+@@ -9839,22 +10372,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -1029,7 +1029,7 @@ index 0340ed541b5..2012656b3b7 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9898,20 +10438,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9899,20 +10439,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -1107,7 +1107,7 @@ index 0340ed541b5..2012656b3b7 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9972,7 +10555,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9973,7 +10556,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -1116,7 +1116,7 @@ index 0340ed541b5..2012656b3b7 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9980,7 +10563,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9981,7 +10564,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -1125,7 +1125,7 @@ index 0340ed541b5..2012656b3b7 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9996,7 +10579,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9997,7 +10580,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -1134,7 +1134,7 @@ index 0340ed541b5..2012656b3b7 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10020,10 +10603,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10021,10 +10604,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -1147,7 +1147,7 @@ index 0340ed541b5..2012656b3b7 100755
  	  ;;
  	esac
        else
-@@ -10102,23 +10685,36 @@ fi
+@@ -10103,23 +10686,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -1192,7 +1192,7 @@ index 0340ed541b5..2012656b3b7 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10203,7 +10799,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10204,7 +10800,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -1201,7 +1201,7 @@ index 0340ed541b5..2012656b3b7 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10222,9 +10818,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10223,9 +10819,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -1213,7 +1213,7 @@ index 0340ed541b5..2012656b3b7 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10800,8 +11396,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10801,8 +11397,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -1225,7 +1225,7 @@ index 0340ed541b5..2012656b3b7 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10834,13 +11431,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10835,13 +11432,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -1298,7 +1298,7 @@ index 0340ed541b5..2012656b3b7 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10932,7 +11587,7 @@ haiku*)
+@@ -10923,7 +11578,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -1307,16 +1307,16 @@ index 0340ed541b5..2012656b3b7 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11728,7 +12383,7 @@ else
+@@ -11719,7 +12374,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11731 "configure"
+-#line 11722 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11772,10 +12427,10 @@ else
+@@ -11763,10 +12418,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1329,16 +1329,16 @@ index 0340ed541b5..2012656b3b7 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11834,7 +12489,7 @@ else
+@@ -11825,7 +12480,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11837 "configure"
+-#line 11828 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11878,10 +12533,10 @@ else
+@@ -11869,10 +12524,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1351,7 +1351,7 @@ index 0340ed541b5..2012656b3b7 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14578,7 +15233,7 @@ SHARED_LDFLAGS=
+@@ -14599,7 +15254,7 @@ SHARED_LDFLAGS=
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -1360,7 +1360,7 @@ index 0340ed541b5..2012656b3b7 100755
    fi
  
    case "${host}" in
-@@ -17197,13 +17852,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17199,13 +17854,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1381,7 +1381,7 @@ index 0340ed541b5..2012656b3b7 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17218,14 +17880,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17220,14 +17882,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1400,7 +1400,7 @@ index 0340ed541b5..2012656b3b7 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17258,12 +17923,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17260,12 +17925,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1414,7 +1414,7 @@ index 0340ed541b5..2012656b3b7 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17318,8 +17983,13 @@ reload_flag \
+@@ -17320,8 +17985,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -1428,7 +1428,7 @@ index 0340ed541b5..2012656b3b7 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17329,12 +17999,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17331,12 +18001,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -1444,7 +1444,7 @@ index 0340ed541b5..2012656b3b7 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17350,7 +18022,6 @@ no_undefined_flag \
+@@ -17352,7 +18024,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -1452,7 +1452,7 @@ index 0340ed541b5..2012656b3b7 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17386,6 +18057,7 @@ module_cmds \
+@@ -17388,6 +18059,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -1460,7 +1460,7 @@ index 0340ed541b5..2012656b3b7 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18174,7 +18846,8 @@ $as_echo X"$file" |
+@@ -18176,7 +18848,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -1470,7 +1470,7 @@ index 0340ed541b5..2012656b3b7 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18277,19 +18950,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18279,19 +18952,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -1514,7 +1514,7 @@ index 0340ed541b5..2012656b3b7 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18319,6 +19015,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18321,6 +19017,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1527,7 +1527,7 @@ index 0340ed541b5..2012656b3b7 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18328,6 +19030,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18330,6 +19032,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -1537,7 +1537,7 @@ index 0340ed541b5..2012656b3b7 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18442,12 +19147,12 @@ with_gcc=$GCC
+@@ -18444,12 +19149,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -1553,7 +1553,7 @@ index 0340ed541b5..2012656b3b7 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18534,9 +19239,6 @@ inherit_rpath=$inherit_rpath
+@@ -18536,9 +19241,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -1563,7 +1563,7 @@ index 0340ed541b5..2012656b3b7 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18552,6 +19254,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18554,6 +19256,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -1573,7 +1573,7 @@ index 0340ed541b5..2012656b3b7 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18584,210 +19289,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18586,210 +19291,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -1948,10 +1948,10 @@ index 0340ed541b5..2012656b3b7 100755
    chmod +x "$ofile"
  
 diff --git a/bfd/configure.ac b/bfd/configure.ac
-index 8e86f8399ce..e8700c9d4d2 100644
+index 0797a08ff37..133d714cf18 100644
 --- a/bfd/configure.ac
 +++ b/bfd/configure.ac
-@@ -314,7 +314,7 @@ changequote(,)dnl
+@@ -315,7 +315,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -1961,10 +1961,10 @@ index 8e86f8399ce..e8700c9d4d2 100644
  
    case "${host}" in
 diff --git a/binutils/configure b/binutils/configure
-index 89c99abfeba..d3289a5efcd 100755
+index 83b4b0172db..2154238189e 100755
 --- a/binutils/configure
 +++ b/binutils/configure
-@@ -692,8 +692,11 @@ OTOOL
+@@ -697,8 +697,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -1976,7 +1976,7 @@ index 89c99abfeba..d3289a5efcd 100755
  OBJDUMP
  LN_S
  NM
-@@ -810,6 +813,7 @@ enable_static
+@@ -815,6 +818,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -1984,7 +1984,7 @@ index 89c99abfeba..d3289a5efcd 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1490,6 +1494,8 @@ Optional Packages:
+@@ -1504,6 +1508,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -1993,7 +1993,7 @@ index 89c99abfeba..d3289a5efcd 100755
    --with-debuginfod       Enable debuginfo lookups with debuginfod
                            (auto/yes/no)
    --with-system-zlib      use installed libz
-@@ -5467,8 +5473,8 @@ esac
+@@ -5490,8 +5496,8 @@ esac
  
  
  
@@ -2004,7 +2004,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
  
  
-@@ -5508,7 +5514,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5531,7 +5537,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -2013,7 +2013,7 @@ index 89c99abfeba..d3289a5efcd 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6194,8 +6200,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6217,8 +6223,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -2024,7 +2024,7 @@ index 89c99abfeba..d3289a5efcd 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6244,6 +6250,80 @@ esac
+@@ -6267,6 +6273,80 @@ esac
  
  
  
@@ -2105,7 +2105,7 @@ index 89c99abfeba..d3289a5efcd 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6260,6 +6340,11 @@ case $reload_flag in
+@@ -6283,6 +6363,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -2117,7 +2117,7 @@ index 89c99abfeba..d3289a5efcd 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6428,7 +6513,8 @@ mingw* | pw32*)
+@@ -6451,7 +6536,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -2127,7 +2127,7 @@ index 89c99abfeba..d3289a5efcd 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6582,6 +6668,21 @@ esac
+@@ -6605,6 +6691,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -2149,7 +2149,7 @@ index 89c99abfeba..d3289a5efcd 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6597,9 +6698,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6620,9 +6721,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -2314,7 +2314,7 @@ index 89c99abfeba..d3289a5efcd 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6615,7 +6869,7 @@ do
+@@ -6638,7 +6892,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -2323,7 +2323,7 @@ index 89c99abfeba..d3289a5efcd 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6635,11 +6889,15 @@ $as_echo "no" >&6; }
+@@ -6658,11 +6912,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -2342,7 +2342,7 @@ index 89c99abfeba..d3289a5efcd 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6655,7 +6913,7 @@ do
+@@ -6678,7 +6936,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -2351,7 +2351,7 @@ index 89c99abfeba..d3289a5efcd 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6674,6 +6932,10 @@ else
+@@ -6697,6 +6955,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -2362,7 +2362,7 @@ index 89c99abfeba..d3289a5efcd 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6685,12 +6947,10 @@ ac_tool_warned=yes ;;
+@@ -6708,12 +6970,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -2377,7 +2377,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
  
  
-@@ -6702,6 +6962,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6725,6 +6985,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -2442,7 +2442,7 @@ index 89c99abfeba..d3289a5efcd 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -7036,8 +7354,8 @@ esac
+@@ -7059,8 +7377,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -2453,7 +2453,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7073,6 +7391,7 @@ for ac_symprfx in "" "_"; do
+@@ -7096,6 +7414,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -2461,7 +2461,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7114,6 +7433,18 @@ _LT_EOF
+@@ -7137,6 +7456,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -2480,7 +2480,7 @@ index 89c99abfeba..d3289a5efcd 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7125,7 +7456,7 @@ _LT_EOF
+@@ -7148,7 +7479,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -2489,7 +2489,7 @@ index 89c99abfeba..d3289a5efcd 100755
    const char *name;
    void       *address;
  }
-@@ -7151,8 +7482,8 @@ static const void *lt_preloaded_setup() {
+@@ -7174,8 +7505,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -2500,7 +2500,7 @@ index 89c99abfeba..d3289a5efcd 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7162,8 +7493,8 @@ _LT_EOF
+@@ -7185,8 +7516,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -2511,7 +2511,7 @@ index 89c99abfeba..d3289a5efcd 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7200,6 +7531,21 @@ else
+@@ -7223,6 +7554,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -2533,7 +2533,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
  
  
-@@ -7216,6 +7562,40 @@ fi
+@@ -7239,6 +7585,40 @@ fi
  
  
  
@@ -2574,7 +2574,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
  
  
-@@ -7427,6 +7807,123 @@ esac
+@@ -7450,6 +7830,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -2698,7 +2698,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7990,6 +8487,8 @@ _LT_EOF
+@@ -8013,6 +8510,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -2707,7 +2707,7 @@ index 89c99abfeba..d3289a5efcd 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8185,7 +8684,8 @@ fi
+@@ -8208,7 +8707,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -2717,7 +2717,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
  
  
-@@ -8274,7 +8774,7 @@ aix3*)
+@@ -8297,7 +8797,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -2726,7 +2726,7 @@ index 89c99abfeba..d3289a5efcd 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8572,8 +9072,6 @@ fi
+@@ -8595,8 +9095,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -2735,7 +2735,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8739,6 +9237,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8762,6 +9260,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -2748,7 +2748,7 @@ index 89c99abfeba..d3289a5efcd 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8801,7 +9305,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8824,7 +9328,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -2757,7 +2757,7 @@ index 89c99abfeba..d3289a5efcd 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8858,13 +9362,17 @@ case $host_os in
+@@ -8881,13 +9385,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -2781,7 +2781,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8925,6 +9433,11 @@ fi
+@@ -8948,6 +9456,11 @@ fi
  
  
  
@@ -2793,7 +2793,7 @@ index 89c99abfeba..d3289a5efcd 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9275,7 +9788,8 @@ _LT_EOF
+@@ -9298,7 +9811,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -2803,7 +2803,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9374,12 +9888,12 @@ _LT_EOF
+@@ -9397,12 +9911,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -2818,7 +2818,7 @@ index 89c99abfeba..d3289a5efcd 100755
  	  fi
  	  ;;
  	esac
-@@ -9393,8 +9907,8 @@ _LT_EOF
+@@ -9416,8 +9930,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -2829,7 +2829,7 @@ index 89c99abfeba..d3289a5efcd 100755
        fi
        ;;
  
-@@ -9412,8 +9926,8 @@ _LT_EOF
+@@ -9435,8 +9949,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2840,7 +2840,7 @@ index 89c99abfeba..d3289a5efcd 100755
        else
  	ld_shlibs=no
        fi
-@@ -9459,8 +9973,8 @@ _LT_EOF
+@@ -9482,8 +9996,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2851,7 +2851,7 @@ index 89c99abfeba..d3289a5efcd 100755
        else
  	ld_shlibs=no
        fi
-@@ -9590,7 +10104,13 @@ _LT_EOF
+@@ -9613,7 +10127,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -2866,7 +2866,7 @@ index 89c99abfeba..d3289a5efcd 100755
  /* end confdefs.h.  */
  
  int
-@@ -9603,22 +10123,29 @@ main ()
+@@ -9626,22 +10146,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2909,7 +2909,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9630,7 +10157,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9653,7 +10180,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -2924,7 +2924,7 @@ index 89c99abfeba..d3289a5efcd 100755
  /* end confdefs.h.  */
  
  int
-@@ -9643,22 +10176,29 @@ main ()
+@@ -9666,22 +10199,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2967,7 +2967,7 @@ index 89c99abfeba..d3289a5efcd 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9703,20 +10243,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9726,20 +10266,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -3045,7 +3045,7 @@ index 89c99abfeba..d3289a5efcd 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9777,7 +10360,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9800,7 +10383,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -3054,7 +3054,7 @@ index 89c99abfeba..d3289a5efcd 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9785,7 +10368,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9808,7 +10391,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -3063,7 +3063,7 @@ index 89c99abfeba..d3289a5efcd 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9801,7 +10384,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9824,7 +10407,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -3072,7 +3072,7 @@ index 89c99abfeba..d3289a5efcd 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9825,10 +10408,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9848,10 +10431,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -3085,7 +3085,7 @@ index 89c99abfeba..d3289a5efcd 100755
  	  ;;
  	esac
        else
-@@ -9907,23 +10490,36 @@ fi
+@@ -9930,23 +10513,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -3130,7 +3130,7 @@ index 89c99abfeba..d3289a5efcd 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10008,7 +10604,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10031,7 +10627,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -3139,7 +3139,7 @@ index 89c99abfeba..d3289a5efcd 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10027,9 +10623,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10050,9 +10646,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -3151,7 +3151,7 @@ index 89c99abfeba..d3289a5efcd 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10605,8 +11201,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10628,8 +11224,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -3163,7 +3163,7 @@ index 89c99abfeba..d3289a5efcd 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10639,13 +11236,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10662,13 +11259,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -3236,7 +3236,7 @@ index 89c99abfeba..d3289a5efcd 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10737,7 +11392,7 @@ haiku*)
+@@ -10750,7 +11405,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -3245,16 +3245,16 @@ index 89c99abfeba..d3289a5efcd 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11533,7 +12188,7 @@ else
+@@ -11546,7 +12201,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11536 "configure"
+-#line 11549 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11577,10 +12232,10 @@ else
+@@ -11590,10 +12245,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3267,16 +3267,16 @@ index 89c99abfeba..d3289a5efcd 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11639,7 +12294,7 @@ else
+@@ -11652,7 +12307,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11642 "configure"
+-#line 11655 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11683,10 +12338,10 @@ else
+@@ -11696,10 +12351,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3289,7 +3289,7 @@ index 89c99abfeba..d3289a5efcd 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -16076,13 +16731,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -16308,13 +16963,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3310,7 +3310,7 @@ index 89c99abfeba..d3289a5efcd 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16097,14 +16759,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -16329,14 +16991,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3329,7 +3329,7 @@ index 89c99abfeba..d3289a5efcd 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16137,12 +16802,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -16369,12 +17034,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3343,7 +3343,7 @@ index 89c99abfeba..d3289a5efcd 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16197,8 +16862,13 @@ reload_flag \
+@@ -16429,8 +17094,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3357,7 +3357,7 @@ index 89c99abfeba..d3289a5efcd 100755
  STRIP \
  RANLIB \
  CC \
-@@ -16208,12 +16878,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -16440,12 +17110,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3373,7 +3373,7 @@ index 89c99abfeba..d3289a5efcd 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16229,7 +16901,6 @@ no_undefined_flag \
+@@ -16461,7 +17133,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3381,7 +3381,7 @@ index 89c99abfeba..d3289a5efcd 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16265,6 +16936,7 @@ module_cmds \
+@@ -16497,6 +17168,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3389,7 +3389,7 @@ index 89c99abfeba..d3289a5efcd 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -17031,7 +17703,8 @@ $as_echo X"$file" |
+@@ -17263,7 +17935,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3399,7 +3399,7 @@ index 89c99abfeba..d3289a5efcd 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -17134,19 +17807,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -17366,19 +18039,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3443,7 +3443,7 @@ index 89c99abfeba..d3289a5efcd 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17176,6 +17872,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -17408,6 +18104,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3456,7 +3456,7 @@ index 89c99abfeba..d3289a5efcd 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17185,6 +17887,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -17417,6 +18119,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3466,7 +3466,7 @@ index 89c99abfeba..d3289a5efcd 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -17299,12 +18004,12 @@ with_gcc=$GCC
+@@ -17531,12 +18236,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3482,7 +3482,7 @@ index 89c99abfeba..d3289a5efcd 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17391,9 +18096,6 @@ inherit_rpath=$inherit_rpath
+@@ -17623,9 +18328,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3492,7 +3492,7 @@ index 89c99abfeba..d3289a5efcd 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -17409,6 +18111,9 @@ include_expsyms=$lt_include_expsyms
+@@ -17641,6 +18343,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3502,7 +3502,7 @@ index 89c99abfeba..d3289a5efcd 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -17441,210 +18146,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -17673,210 +18378,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3877,10 +3877,10 @@ index 89c99abfeba..d3289a5efcd 100755
    chmod +x "$ofile"
  
 diff --git a/gas/configure b/gas/configure
-index d4b13e6fc8b..dd5224c5c81 100755
+index d5ae54925e9..3ff1148d9dd 100755
 --- a/gas/configure
 +++ b/gas/configure
-@@ -681,8 +681,11 @@ OTOOL
+@@ -682,8 +682,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -3892,7 +3892,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  OBJDUMP
  LN_S
  NM
-@@ -799,6 +802,7 @@ enable_static
+@@ -800,6 +803,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -3900,7 +3900,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1490,6 +1494,8 @@ Optional Packages:
+@@ -1491,6 +1495,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -3909,7 +3909,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
    --with-cpu=CPU          default cpu variant is CPU (currently only supported
                            on ARC)
    --with-system-zlib      use installed libz
-@@ -5277,8 +5283,8 @@ esac
+@@ -5278,8 +5284,8 @@ esac
  
  
  
@@ -3920,7 +3920,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
  
  
-@@ -5318,7 +5324,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5319,7 +5325,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -3929,7 +3929,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6004,8 +6010,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6005,8 +6011,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -3940,7 +3940,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6054,6 +6060,80 @@ esac
+@@ -6055,6 +6061,80 @@ esac
  
  
  
@@ -4021,7 +4021,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6070,6 +6150,11 @@ case $reload_flag in
+@@ -6071,6 +6151,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -4033,7 +4033,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6238,7 +6323,8 @@ mingw* | pw32*)
+@@ -6239,7 +6324,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -4043,7 +4043,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6392,6 +6478,21 @@ esac
+@@ -6393,6 +6479,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -4065,7 +4065,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6407,9 +6508,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6408,9 +6509,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -4230,7 +4230,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6425,7 +6679,7 @@ do
+@@ -6426,7 +6680,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -4239,7 +4239,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6445,11 +6699,15 @@ $as_echo "no" >&6; }
+@@ -6446,11 +6700,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -4258,7 +4258,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6465,7 +6723,7 @@ do
+@@ -6466,7 +6724,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -4267,7 +4267,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6484,6 +6742,10 @@ else
+@@ -6485,6 +6743,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -4278,7 +4278,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6495,12 +6757,10 @@ ac_tool_warned=yes ;;
+@@ -6496,12 +6758,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -4293,7 +4293,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
  
  
-@@ -6512,6 +6772,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6513,6 +6773,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -4358,7 +4358,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6846,8 +7164,8 @@ esac
+@@ -6847,8 +7165,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -4369,7 +4369,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6883,6 +7201,7 @@ for ac_symprfx in "" "_"; do
+@@ -6884,6 +7202,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -4377,7 +4377,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6924,6 +7243,18 @@ _LT_EOF
+@@ -6925,6 +7244,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -4396,7 +4396,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6935,7 +7266,7 @@ _LT_EOF
+@@ -6936,7 +7267,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -4405,7 +4405,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
    const char *name;
    void       *address;
  }
-@@ -6961,8 +7292,8 @@ static const void *lt_preloaded_setup() {
+@@ -6962,8 +7293,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -4416,7 +4416,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6972,8 +7303,8 @@ _LT_EOF
+@@ -6973,8 +7304,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -4427,7 +4427,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7010,6 +7341,21 @@ else
+@@ -7011,6 +7342,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -4449,7 +4449,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
  
  
-@@ -7026,6 +7372,40 @@ fi
+@@ -7027,6 +7373,40 @@ fi
  
  
  
@@ -4490,7 +4490,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
  
  
-@@ -7237,6 +7617,123 @@ esac
+@@ -7238,6 +7618,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -4614,7 +4614,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7800,6 +8297,8 @@ _LT_EOF
+@@ -7801,6 +8298,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -4623,7 +4623,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7995,7 +8494,8 @@ fi
+@@ -7996,7 +8495,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -4633,7 +4633,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
  
  
-@@ -8084,7 +8584,7 @@ aix3*)
+@@ -8085,7 +8585,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -4642,7 +4642,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8382,8 +8882,6 @@ fi
+@@ -8383,8 +8883,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -4651,7 +4651,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8549,6 +9047,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8550,6 +9048,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -4664,7 +4664,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8611,7 +9115,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8612,7 +9116,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -4673,7 +4673,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8668,13 +9172,17 @@ case $host_os in
+@@ -8669,13 +9173,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -4697,7 +4697,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8735,6 +9243,11 @@ fi
+@@ -8736,6 +9244,11 @@ fi
  
  
  
@@ -4709,7 +4709,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9085,7 +9598,8 @@ _LT_EOF
+@@ -9086,7 +9599,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -4719,7 +4719,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9184,12 +9698,12 @@ _LT_EOF
+@@ -9185,12 +9699,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -4734,7 +4734,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  	  fi
  	  ;;
  	esac
-@@ -9203,8 +9717,8 @@ _LT_EOF
+@@ -9204,8 +9718,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -4745,7 +4745,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
        fi
        ;;
  
-@@ -9222,8 +9736,8 @@ _LT_EOF
+@@ -9223,8 +9737,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4756,7 +4756,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
        else
  	ld_shlibs=no
        fi
-@@ -9269,8 +9783,8 @@ _LT_EOF
+@@ -9270,8 +9784,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4767,7 +4767,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
        else
  	ld_shlibs=no
        fi
-@@ -9400,7 +9914,13 @@ _LT_EOF
+@@ -9401,7 +9915,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -4782,7 +4782,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  /* end confdefs.h.  */
  
  int
-@@ -9413,22 +9933,29 @@ main ()
+@@ -9414,22 +9934,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4825,7 +4825,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9440,7 +9967,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9441,7 +9968,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -4840,7 +4840,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  /* end confdefs.h.  */
  
  int
-@@ -9453,22 +9986,29 @@ main ()
+@@ -9454,22 +9987,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4883,7 +4883,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9513,20 +10053,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9514,20 +10054,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -4961,7 +4961,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9587,7 +10170,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9588,7 +10171,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -4970,7 +4970,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9595,7 +10178,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9596,7 +10179,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -4979,7 +4979,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9611,7 +10194,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9612,7 +10195,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -4988,7 +4988,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9635,10 +10218,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9636,10 +10219,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -5001,7 +5001,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  	  ;;
  	esac
        else
-@@ -9717,23 +10300,36 @@ fi
+@@ -9718,23 +10301,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -5046,7 +5046,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9818,7 +10414,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9819,7 +10415,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -5055,7 +5055,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9837,9 +10433,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9838,9 +10434,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -5067,7 +5067,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10415,8 +11011,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10416,8 +11012,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -5079,7 +5079,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10449,13 +11046,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10450,13 +11047,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -5152,7 +5152,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10547,7 +11202,7 @@ haiku*)
+@@ -10538,7 +11193,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -5161,16 +5161,16 @@ index d4b13e6fc8b..dd5224c5c81 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11343,7 +11998,7 @@ else
+@@ -11334,7 +11989,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11346 "configure"
+-#line 11337 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11387,10 +12042,10 @@ else
+@@ -11378,10 +12033,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5183,16 +5183,16 @@ index d4b13e6fc8b..dd5224c5c81 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11449,7 +12104,7 @@ else
+@@ -11440,7 +12095,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11452 "configure"
+-#line 11443 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11493,10 +12148,10 @@ else
+@@ -11484,10 +12139,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5205,7 +5205,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15981,13 +16636,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -16020,13 +16675,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5226,7 +5226,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16002,14 +16664,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -16041,14 +16703,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5245,7 +5245,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16042,12 +16707,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -16081,12 +16746,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5259,7 +5259,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16102,8 +16767,13 @@ reload_flag \
+@@ -16141,8 +16806,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5273,7 +5273,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  STRIP \
  RANLIB \
  CC \
-@@ -16113,12 +16783,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -16152,12 +16822,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5289,7 +5289,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16134,7 +16806,6 @@ no_undefined_flag \
+@@ -16173,7 +16845,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5297,7 +5297,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16170,6 +16841,7 @@ module_cmds \
+@@ -16209,6 +16880,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5305,7 +5305,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16943,7 +17615,8 @@ $as_echo X"$file" |
+@@ -16982,7 +17654,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5315,7 +5315,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -17046,19 +17719,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -17085,19 +17758,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5359,7 +5359,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17088,6 +17784,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -17127,6 +17823,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5372,7 +5372,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17097,6 +17799,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -17136,6 +17838,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5382,7 +5382,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -17211,12 +17916,12 @@ with_gcc=$GCC
+@@ -17250,12 +17955,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5398,7 +5398,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17303,9 +18008,6 @@ inherit_rpath=$inherit_rpath
+@@ -17342,9 +18047,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5408,7 +5408,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -17321,6 +18023,9 @@ include_expsyms=$lt_include_expsyms
+@@ -17360,6 +18062,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5418,7 +5418,7 @@ index d4b13e6fc8b..dd5224c5c81 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -17353,210 +18058,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -17392,210 +18097,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5793,10 +5793,10 @@ index d4b13e6fc8b..dd5224c5c81 100755
    chmod +x "$ofile"
  
 diff --git a/gprof/configure b/gprof/configure
-index 3cf41b79116..e5d57f52912 100755
+index b12ec2e472f..57986ca995a 100755
 --- a/gprof/configure
 +++ b/gprof/configure
-@@ -662,8 +662,11 @@ OTOOL
+@@ -663,8 +663,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -5808,7 +5808,7 @@ index 3cf41b79116..e5d57f52912 100755
  OBJDUMP
  LN_S
  NM
-@@ -780,6 +783,7 @@ enable_static
+@@ -781,6 +784,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -5816,7 +5816,7 @@ index 3cf41b79116..e5d57f52912 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1442,6 +1446,8 @@ Optional Packages:
+@@ -1443,6 +1447,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -5825,7 +5825,7 @@ index 3cf41b79116..e5d57f52912 100755
  
  Some influential environment variables:
    CC          C compiler command
-@@ -5124,8 +5130,8 @@ esac
+@@ -5125,8 +5131,8 @@ esac
  
  
  
@@ -5836,7 +5836,7 @@ index 3cf41b79116..e5d57f52912 100755
  
  
  
-@@ -5165,7 +5171,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5166,7 +5172,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -5845,7 +5845,7 @@ index 3cf41b79116..e5d57f52912 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5851,8 +5857,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5852,8 +5858,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -5856,7 +5856,7 @@ index 3cf41b79116..e5d57f52912 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5901,6 +5907,80 @@ esac
+@@ -5902,6 +5908,80 @@ esac
  
  
  
@@ -5937,7 +5937,7 @@ index 3cf41b79116..e5d57f52912 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5917,6 +5997,11 @@ case $reload_flag in
+@@ -5918,6 +5998,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -5949,7 +5949,7 @@ index 3cf41b79116..e5d57f52912 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6085,7 +6170,8 @@ mingw* | pw32*)
+@@ -6086,7 +6171,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -5959,7 +5959,7 @@ index 3cf41b79116..e5d57f52912 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6239,6 +6325,21 @@ esac
+@@ -6240,6 +6326,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -5981,7 +5981,7 @@ index 3cf41b79116..e5d57f52912 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6252,11 +6353,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6253,11 +6354,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -6148,7 +6148,7 @@ index 3cf41b79116..e5d57f52912 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6272,7 +6526,7 @@ do
+@@ -6273,7 +6527,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -6157,7 +6157,7 @@ index 3cf41b79116..e5d57f52912 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6292,11 +6546,15 @@ $as_echo "no" >&6; }
+@@ -6293,11 +6547,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -6176,7 +6176,7 @@ index 3cf41b79116..e5d57f52912 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6312,7 +6570,7 @@ do
+@@ -6313,7 +6571,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -6185,7 +6185,7 @@ index 3cf41b79116..e5d57f52912 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6331,6 +6589,10 @@ else
+@@ -6332,6 +6590,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -6196,7 +6196,7 @@ index 3cf41b79116..e5d57f52912 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6342,16 +6604,72 @@ ac_tool_warned=yes ;;
+@@ -6343,16 +6605,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -6273,7 +6273,7 @@ index 3cf41b79116..e5d57f52912 100755
  
  
  
-@@ -6693,8 +7011,8 @@ esac
+@@ -6694,8 +7012,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -6284,7 +6284,7 @@ index 3cf41b79116..e5d57f52912 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6730,6 +7048,7 @@ for ac_symprfx in "" "_"; do
+@@ -6731,6 +7049,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -6292,7 +6292,7 @@ index 3cf41b79116..e5d57f52912 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6771,6 +7090,18 @@ _LT_EOF
+@@ -6772,6 +7091,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -6311,7 +6311,7 @@ index 3cf41b79116..e5d57f52912 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6782,7 +7113,7 @@ _LT_EOF
+@@ -6783,7 +7114,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -6320,7 +6320,7 @@ index 3cf41b79116..e5d57f52912 100755
    const char *name;
    void       *address;
  }
-@@ -6808,8 +7139,8 @@ static const void *lt_preloaded_setup() {
+@@ -6809,8 +7140,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -6331,7 +6331,7 @@ index 3cf41b79116..e5d57f52912 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6819,8 +7150,8 @@ _LT_EOF
+@@ -6820,8 +7151,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -6342,7 +6342,7 @@ index 3cf41b79116..e5d57f52912 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6857,6 +7188,20 @@ else
+@@ -6858,6 +7189,20 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -6363,7 +6363,7 @@ index 3cf41b79116..e5d57f52912 100755
  
  
  
-@@ -6873,6 +7218,41 @@ fi
+@@ -6874,6 +7219,41 @@ fi
  
  
  
@@ -6405,7 +6405,7 @@ index 3cf41b79116..e5d57f52912 100755
  
  
  
-@@ -7084,6 +7464,123 @@ esac
+@@ -7085,6 +7465,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -6529,7 +6529,7 @@ index 3cf41b79116..e5d57f52912 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7647,6 +8144,8 @@ _LT_EOF
+@@ -7648,6 +8145,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -6538,7 +6538,7 @@ index 3cf41b79116..e5d57f52912 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7842,7 +8341,8 @@ fi
+@@ -7843,7 +8342,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -6548,7 +6548,7 @@ index 3cf41b79116..e5d57f52912 100755
  
  
  
-@@ -7931,7 +8431,7 @@ aix3*)
+@@ -7932,7 +8432,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -6557,7 +6557,7 @@ index 3cf41b79116..e5d57f52912 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8229,8 +8729,6 @@ fi
+@@ -8230,8 +8730,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -6566,7 +6566,7 @@ index 3cf41b79116..e5d57f52912 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8396,6 +8894,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8397,6 +8895,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -6579,7 +6579,7 @@ index 3cf41b79116..e5d57f52912 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8458,7 +8962,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8459,7 +8963,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -6588,7 +6588,7 @@ index 3cf41b79116..e5d57f52912 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8515,13 +9019,17 @@ case $host_os in
+@@ -8516,13 +9020,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -6612,7 +6612,7 @@ index 3cf41b79116..e5d57f52912 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8582,6 +9090,11 @@ fi
+@@ -8583,6 +9091,11 @@ fi
  
  
  
@@ -6624,7 +6624,7 @@ index 3cf41b79116..e5d57f52912 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8932,7 +9445,8 @@ _LT_EOF
+@@ -8933,7 +9446,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -6634,7 +6634,7 @@ index 3cf41b79116..e5d57f52912 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9031,12 +9545,12 @@ _LT_EOF
+@@ -9032,12 +9546,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -6649,7 +6649,7 @@ index 3cf41b79116..e5d57f52912 100755
  	  fi
  	  ;;
  	esac
-@@ -9050,8 +9564,8 @@ _LT_EOF
+@@ -9051,8 +9565,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -6660,7 +6660,7 @@ index 3cf41b79116..e5d57f52912 100755
        fi
        ;;
  
-@@ -9069,8 +9583,8 @@ _LT_EOF
+@@ -9070,8 +9584,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -6671,7 +6671,7 @@ index 3cf41b79116..e5d57f52912 100755
        else
  	ld_shlibs=no
        fi
-@@ -9116,8 +9630,8 @@ _LT_EOF
+@@ -9117,8 +9631,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -6682,7 +6682,7 @@ index 3cf41b79116..e5d57f52912 100755
        else
  	ld_shlibs=no
        fi
-@@ -9247,7 +9761,13 @@ _LT_EOF
+@@ -9248,7 +9762,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -6697,7 +6697,7 @@ index 3cf41b79116..e5d57f52912 100755
  /* end confdefs.h.  */
  
  int
-@@ -9260,22 +9780,29 @@ main ()
+@@ -9261,22 +9781,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -6740,7 +6740,7 @@ index 3cf41b79116..e5d57f52912 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9287,7 +9814,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9288,7 +9815,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -6755,7 +6755,7 @@ index 3cf41b79116..e5d57f52912 100755
  /* end confdefs.h.  */
  
  int
-@@ -9300,22 +9833,29 @@ main ()
+@@ -9301,22 +9834,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -6798,7 +6798,7 @@ index 3cf41b79116..e5d57f52912 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9360,20 +9900,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9361,20 +9901,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -6876,7 +6876,7 @@ index 3cf41b79116..e5d57f52912 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9434,7 +10017,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9435,7 +10018,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -6885,7 +6885,7 @@ index 3cf41b79116..e5d57f52912 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9442,7 +10025,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9443,7 +10026,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -6894,7 +6894,7 @@ index 3cf41b79116..e5d57f52912 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9458,7 +10041,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9459,7 +10042,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -6903,7 +6903,7 @@ index 3cf41b79116..e5d57f52912 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9482,10 +10065,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9483,10 +10066,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -6916,7 +6916,7 @@ index 3cf41b79116..e5d57f52912 100755
  	  ;;
  	esac
        else
-@@ -9564,23 +10147,36 @@ fi
+@@ -9565,23 +10148,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -6961,7 +6961,7 @@ index 3cf41b79116..e5d57f52912 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9665,7 +10261,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9666,7 +10262,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -6970,7 +6970,7 @@ index 3cf41b79116..e5d57f52912 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9684,9 +10280,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9685,9 +10281,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -6982,7 +6982,7 @@ index 3cf41b79116..e5d57f52912 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10262,8 +10858,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10263,8 +10859,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -6994,7 +6994,7 @@ index 3cf41b79116..e5d57f52912 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10296,13 +10893,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10297,13 +10894,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -7067,7 +7067,7 @@ index 3cf41b79116..e5d57f52912 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10394,7 +11049,7 @@ haiku*)
+@@ -10385,7 +11040,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -7076,16 +7076,16 @@ index 3cf41b79116..e5d57f52912 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11190,7 +11845,7 @@ else
+@@ -11181,7 +11836,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11193 "configure"
+-#line 11184 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11234,10 +11889,10 @@ else
+@@ -11225,10 +11880,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -7098,16 +7098,16 @@ index 3cf41b79116..e5d57f52912 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11296,7 +11951,7 @@ else
+@@ -11287,7 +11942,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11299 "configure"
+-#line 11290 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11340,10 +11995,10 @@ else
+@@ -11331,10 +11986,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -7120,7 +7120,7 @@ index 3cf41b79116..e5d57f52912 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13309,13 +13964,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13341,13 +13996,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -7141,7 +7141,7 @@ index 3cf41b79116..e5d57f52912 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13330,14 +13992,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13362,14 +14024,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -7160,7 +7160,7 @@ index 3cf41b79116..e5d57f52912 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13370,12 +14035,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13402,12 +14067,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -7174,7 +7174,7 @@ index 3cf41b79116..e5d57f52912 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13430,8 +14095,13 @@ reload_flag \
+@@ -13462,8 +14127,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -7188,7 +7188,7 @@ index 3cf41b79116..e5d57f52912 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13441,12 +14111,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13473,12 +14143,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -7204,7 +7204,7 @@ index 3cf41b79116..e5d57f52912 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13462,7 +14134,6 @@ no_undefined_flag \
+@@ -13494,7 +14166,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -7212,7 +7212,7 @@ index 3cf41b79116..e5d57f52912 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13498,6 +14169,7 @@ module_cmds \
+@@ -13530,6 +14201,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -7220,7 +7220,7 @@ index 3cf41b79116..e5d57f52912 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14263,7 +14935,8 @@ $as_echo X"$file" |
+@@ -14295,7 +14967,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -7230,7 +7230,7 @@ index 3cf41b79116..e5d57f52912 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14366,19 +15039,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14398,19 +15071,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -7274,7 +7274,7 @@ index 3cf41b79116..e5d57f52912 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14408,6 +15104,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14440,6 +15136,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -7287,7 +7287,7 @@ index 3cf41b79116..e5d57f52912 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14417,6 +15119,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14449,6 +15151,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -7297,7 +7297,7 @@ index 3cf41b79116..e5d57f52912 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14531,12 +15236,12 @@ with_gcc=$GCC
+@@ -14563,12 +15268,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -7313,7 +7313,7 @@ index 3cf41b79116..e5d57f52912 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14623,9 +15328,6 @@ inherit_rpath=$inherit_rpath
+@@ -14655,9 +15360,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -7323,7 +7323,7 @@ index 3cf41b79116..e5d57f52912 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14641,6 +15343,9 @@ include_expsyms=$lt_include_expsyms
+@@ -14673,6 +15375,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -7333,7 +7333,7 @@ index 3cf41b79116..e5d57f52912 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14673,210 +15378,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -14705,210 +15410,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -7708,10 +7708,10 @@ index 3cf41b79116..e5d57f52912 100755
    chmod +x "$ofile"
  
 diff --git a/ld/configure b/ld/configure
-index 1c872c0db5f..fe938e6c99f 100755
+index 8355c433c76..a49ab3d1f09 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -691,8 +691,11 @@ OTOOL
+@@ -693,8 +693,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -7723,7 +7723,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  OBJDUMP
  LN_S
  NM
-@@ -819,6 +822,7 @@ enable_static
+@@ -821,6 +824,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -7731,7 +7731,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1520,6 +1524,8 @@ Optional Packages:
+@@ -1526,6 +1530,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -7740,7 +7740,7 @@ index 1c872c0db5f..fe938e6c99f 100755
    --with-lib-path=dir1:dir2...  set default LIB_PATH
    --with-sysroot=DIR Search for usr/lib et al within DIR.
    --with-system-zlib      use installed libz
-@@ -5973,8 +5979,8 @@ esac
+@@ -5979,8 +5985,8 @@ esac
  
  
  
@@ -7751,7 +7751,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  
  
-@@ -6014,7 +6020,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -6020,7 +6026,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -7760,7 +7760,7 @@ index 1c872c0db5f..fe938e6c99f 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6700,8 +6706,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6706,8 +6712,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7771,7 +7771,7 @@ index 1c872c0db5f..fe938e6c99f 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6750,6 +6756,80 @@ esac
+@@ -6756,6 +6762,80 @@ esac
  
  
  
@@ -7852,7 +7852,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6766,6 +6846,11 @@ case $reload_flag in
+@@ -6772,6 +6852,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -7864,7 +7864,7 @@ index 1c872c0db5f..fe938e6c99f 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6934,7 +7019,8 @@ mingw* | pw32*)
+@@ -6940,7 +7025,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -7874,7 +7874,7 @@ index 1c872c0db5f..fe938e6c99f 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -7088,6 +7174,21 @@ esac
+@@ -7094,6 +7180,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -7896,7 +7896,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -7103,9 +7204,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -7109,9 +7210,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -8061,7 +8061,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -7121,7 +7375,7 @@ do
+@@ -7127,7 +7381,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -8070,7 +8070,7 @@ index 1c872c0db5f..fe938e6c99f 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7141,11 +7395,15 @@ $as_echo "no" >&6; }
+@@ -7147,11 +7401,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -8089,7 +8089,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -7161,7 +7419,7 @@ do
+@@ -7167,7 +7425,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -8098,7 +8098,7 @@ index 1c872c0db5f..fe938e6c99f 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7180,6 +7438,10 @@ else
+@@ -7186,6 +7444,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -8109,7 +8109,7 @@ index 1c872c0db5f..fe938e6c99f 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -7191,12 +7453,12 @@ ac_tool_warned=yes ;;
+@@ -7197,12 +7459,12 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -8126,7 +8126,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  
  
-@@ -7206,6 +7468,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -7212,6 +7474,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -8189,7 +8189,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  
  if test -n "$ac_tool_prefix"; then
-@@ -7542,8 +7860,8 @@ esac
+@@ -7548,8 +7866,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -8200,7 +8200,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7579,6 +7897,7 @@ for ac_symprfx in "" "_"; do
+@@ -7585,6 +7903,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -8208,7 +8208,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7620,6 +7939,18 @@ _LT_EOF
+@@ -7626,6 +7945,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -8227,7 +8227,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7631,7 +7962,7 @@ _LT_EOF
+@@ -7637,7 +7968,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -8236,7 +8236,7 @@ index 1c872c0db5f..fe938e6c99f 100755
    const char *name;
    void       *address;
  }
-@@ -7657,8 +7988,8 @@ static const void *lt_preloaded_setup() {
+@@ -7663,8 +7994,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -8247,7 +8247,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7668,8 +7999,8 @@ _LT_EOF
+@@ -7674,8 +8005,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -8258,7 +8258,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7706,6 +8037,19 @@ else
+@@ -7712,6 +8043,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -8278,7 +8278,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  
  
-@@ -7722,6 +8066,42 @@ fi
+@@ -7728,6 +8072,42 @@ fi
  
  
  
@@ -8321,7 +8321,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  
  
-@@ -7933,6 +8313,123 @@ esac
+@@ -7939,6 +8319,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -8445,7 +8445,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8496,6 +8993,8 @@ _LT_EOF
+@@ -8502,6 +8999,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -8454,7 +8454,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8564,6 +9063,16 @@ done
+@@ -8570,6 +9069,16 @@ done
  
  
  
@@ -8471,7 +8471,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  
  # Set options
-@@ -8692,7 +9201,8 @@ fi
+@@ -8698,7 +9207,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -8481,7 +8481,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  
  
-@@ -8781,7 +9291,7 @@ aix3*)
+@@ -8787,7 +9297,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -8490,7 +8490,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -9079,8 +9589,6 @@ fi
+@@ -9085,8 +9595,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -8499,7 +8499,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -9246,6 +9754,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9252,6 +9760,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -8512,7 +8512,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -9308,7 +9822,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9314,7 +9828,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -8521,7 +8521,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9365,13 +9879,17 @@ case $host_os in
+@@ -9371,13 +9885,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -8545,7 +8545,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9432,6 +9950,11 @@ fi
+@@ -9438,6 +9956,11 @@ fi
  
  
  
@@ -8557,7 +8557,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9782,7 +10305,8 @@ _LT_EOF
+@@ -9788,7 +10311,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -8567,7 +8567,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9881,12 +10405,12 @@ _LT_EOF
+@@ -9887,12 +10411,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -8582,7 +8582,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	  fi
  	  ;;
  	esac
-@@ -9900,8 +10424,8 @@ _LT_EOF
+@@ -9906,8 +10430,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -8593,7 +8593,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        fi
        ;;
  
-@@ -9919,8 +10443,8 @@ _LT_EOF
+@@ -9925,8 +10449,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8604,7 +8604,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        else
  	ld_shlibs=no
        fi
-@@ -9966,8 +10490,8 @@ _LT_EOF
+@@ -9972,8 +10496,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8615,7 +8615,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        else
  	ld_shlibs=no
        fi
-@@ -10097,7 +10621,13 @@ _LT_EOF
+@@ -10103,7 +10627,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -8630,7 +8630,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  /* end confdefs.h.  */
  
  int
-@@ -10110,22 +10640,29 @@ main ()
+@@ -10116,22 +10646,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8673,7 +8673,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -10137,7 +10674,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10143,7 +10680,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8688,7 +8688,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  /* end confdefs.h.  */
  
  int
-@@ -10150,22 +10693,29 @@ main ()
+@@ -10156,22 +10699,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8731,7 +8731,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -10209,21 +10759,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10215,21 +10765,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # When not using gcc, we currently assume that we are using
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
@@ -8811,7 +8811,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -10284,7 +10877,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10290,7 +10883,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8820,7 +8820,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -10292,7 +10885,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10298,7 +10891,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8829,7 +8829,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -10308,7 +10901,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10314,7 +10907,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8838,7 +8838,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10332,10 +10925,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10338,10 +10931,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8851,7 +8851,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	  ;;
  	esac
        else
-@@ -10414,23 +11007,36 @@ fi
+@@ -10420,23 +11013,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -8896,7 +8896,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10515,7 +11121,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10521,7 +11127,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -8905,7 +8905,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10534,9 +11140,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10540,9 +11146,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -8917,7 +8917,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -11112,8 +11718,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11118,8 +11724,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -8929,7 +8929,7 @@ index 1c872c0db5f..fe938e6c99f 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -11146,13 +11753,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11152,13 +11759,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9002,7 +9002,7 @@ index 1c872c0db5f..fe938e6c99f 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11244,7 +11909,7 @@ haiku*)
+@@ -11240,7 +11905,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -9011,16 +9011,16 @@ index 1c872c0db5f..fe938e6c99f 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -12040,7 +12705,7 @@ else
+@@ -12036,7 +12701,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12040 "configure"
+-#line 12036 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12084,10 +12749,10 @@ else
+@@ -12080,10 +12745,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -9033,16 +9033,16 @@ index 1c872c0db5f..fe938e6c99f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12146,7 +12811,7 @@ else
+@@ -12142,7 +12807,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12146 "configure"
+-#line 12142 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12190,10 +12855,10 @@ else
+@@ -12186,10 +12851,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -9055,7 +9055,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12585,6 +13250,7 @@ $RM -r conftest*
+@@ -12581,6 +13246,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -9063,7 +9063,7 @@ index 1c872c0db5f..fe938e6c99f 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12602,6 +13268,7 @@ $RM -r conftest*
+@@ -12598,6 +13264,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -9071,7 +9071,7 @@ index 1c872c0db5f..fe938e6c99f 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12884,7 +13551,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12880,7 +13547,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -9086,7 +9086,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  /* end confdefs.h.  */
  
  int
-@@ -12897,22 +13570,29 @@ main ()
+@@ -12893,22 +13566,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9129,7 +9129,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12925,7 +13605,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12921,7 +13601,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -9144,7 +9144,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  /* end confdefs.h.  */
  
  int
-@@ -12938,22 +13624,29 @@ main ()
+@@ -12934,22 +13620,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9187,7 +9187,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12996,29 +13689,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12992,29 +13685,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -9286,7 +9286,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        darwin* | rhapsody*)
  
  
-@@ -13124,7 +13863,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13120,7 +13859,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -9295,7 +9295,7 @@ index 1c872c0db5f..fe938e6c99f 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -13195,10 +13934,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13191,10 +13930,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -9308,7 +9308,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	            ;;
  	        esac
  	      fi
-@@ -13239,9 +13978,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13235,9 +13974,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -9320,7 +9320,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13311,20 +14050,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13307,20 +14046,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	      prelink_cmds_CXX='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -9345,7 +9345,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13519,7 +14258,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13515,7 +14254,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -9354,7 +9354,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  		  ;;
  	      esac
  
-@@ -13565,7 +14304,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13561,7 +14300,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -9363,7 +9363,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13606,9 +14345,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13602,9 +14341,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -9375,7 +9375,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13743,6 +14482,13 @@ private:
+@@ -13739,6 +14478,13 @@ private:
  };
  _LT_EOF
  
@@ -9389,7 +9389,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13756,7 +14502,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13752,7 +14498,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -9398,7 +9398,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13765,13 +14511,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13761,13 +14507,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -9425,7 +9425,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13791,8 +14546,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13787,8 +14542,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -9436,7 +9436,7 @@ index 1c872c0db5f..fe938e6c99f 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13828,6 +14585,7 @@ else
+@@ -13824,6 +14581,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -9444,7 +9444,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13863,7 +14621,7 @@ linux*)
+@@ -13859,7 +14617,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -9453,7 +9453,7 @@ index 1c872c0db5f..fe938e6c99f 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13928,8 +14686,6 @@ fi
+@@ -13924,8 +14682,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -9462,7 +9462,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -14034,6 +14790,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14030,6 +14786,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -9474,7 +9474,7 @@ index 1c872c0db5f..fe938e6c99f 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -14186,7 +14947,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14182,7 +14943,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -9483,7 +9483,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -14251,10 +15012,17 @@ case $host_os in
+@@ -14247,10 +15008,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -9504,7 +9504,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -14312,6 +15080,8 @@ fi
+@@ -14308,6 +15076,8 @@ fi
  
  
  
@@ -9513,7 +9513,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14489,6 +15259,7 @@ fi
+@@ -14485,6 +15255,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -9521,7 +9521,7 @@ index 1c872c0db5f..fe938e6c99f 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14503,15 +15274,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14499,15 +15270,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -9547,7 +9547,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14774,8 +15550,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14770,8 +15546,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -9559,7 +9559,7 @@ index 1c872c0db5f..fe938e6c99f 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14807,13 +15584,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14803,13 +15580,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9632,7 +9632,7 @@ index 1c872c0db5f..fe938e6c99f 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -14904,7 +15739,7 @@ haiku*)
+@@ -14890,7 +15725,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -9641,7 +9641,7 @@ index 1c872c0db5f..fe938e6c99f 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -15363,6 +16198,7 @@ fi
+@@ -15349,6 +16184,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -9649,7 +9649,7 @@ index 1c872c0db5f..fe938e6c99f 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -18554,13 +19390,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -18612,13 +19448,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9670,7 +9670,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -18575,14 +19418,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -18633,14 +19476,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9689,7 +9689,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18615,12 +19461,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18673,12 +19519,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9703,7 +9703,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18659,8 +19505,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -18717,8 +19563,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9713,7 +9713,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18687,12 +19533,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -18745,12 +19591,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9727,7 +9727,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18730,8 +19576,13 @@ reload_flag \
+@@ -18788,8 +19634,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -9741,7 +9741,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  STRIP \
  RANLIB \
  CC \
-@@ -18741,12 +19592,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18799,12 +19650,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -9757,7 +9757,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -18762,7 +19615,6 @@ no_undefined_flag \
+@@ -18820,7 +19673,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -9765,7 +9765,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18784,8 +19636,8 @@ LD_CXX \
+@@ -18842,8 +19694,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -9775,7 +9775,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -18797,7 +19649,6 @@ no_undefined_flag_CXX \
+@@ -18855,7 +19707,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -9783,7 +9783,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18831,6 +19682,7 @@ module_cmds \
+@@ -18889,6 +19740,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -9791,7 +9791,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18845,7 +19697,8 @@ archive_expsym_cmds_CXX \
+@@ -18903,7 +19755,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -9801,7 +9801,7 @@ index 1c872c0db5f..fe938e6c99f 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -19610,7 +20463,8 @@ $as_echo X"$file" |
+@@ -19668,7 +20521,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -9811,7 +9811,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -19713,19 +20567,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19771,19 +20625,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -9855,7 +9855,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19755,6 +20632,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19813,6 +20690,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -9868,7 +9868,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19764,6 +20647,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19822,6 +20705,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -9878,7 +9878,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19878,12 +20764,12 @@ with_gcc=$GCC
+@@ -19936,12 +20822,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -9894,7 +9894,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19970,9 +20856,6 @@ inherit_rpath=$inherit_rpath
+@@ -20028,9 +20914,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -9904,7 +9904,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19988,6 +20871,9 @@ include_expsyms=$lt_include_expsyms
+@@ -20046,6 +20929,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -9914,7 +9914,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -20034,210 +20920,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -20092,210 +20978,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10288,7 +10288,7 @@ index 1c872c0db5f..fe938e6c99f 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -20265,12 +21110,12 @@ with_gcc=$GCC_CXX
+@@ -20323,12 +21168,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -10304,7 +10304,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -20357,9 +21202,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -20415,9 +21260,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -10314,7 +10314,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -20375,6 +21217,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -20433,6 +21275,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -10325,7 +10325,7 @@ index 1c872c0db5f..fe938e6c99f 100755
  file_list_spec=$lt_file_list_spec_CXX
  
 diff --git a/libctf/configure b/libctf/configure
-index 1dc1b65fac3..c5c2f36bbc0 100755
+index 6b294bfebfb..52a025bb848 100755
 --- a/libctf/configure
 +++ b/libctf/configure
 @@ -663,6 +663,8 @@ OTOOL
@@ -10345,7 +10345,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  enable_libtool_lock
  enable_largefile
  enable_werror_always
-@@ -1448,6 +1451,8 @@ Optional Packages:
+@@ -1452,6 +1455,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -10354,7 +10354,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
    --with-system-zlib      use installed libz
  
  Some influential environment variables:
-@@ -5406,8 +5411,8 @@ esac
+@@ -5411,8 +5416,8 @@ esac
  
  
  
@@ -10365,7 +10365,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
  
  
-@@ -5518,7 +5523,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5523,7 +5528,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -10374,7 +10374,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6204,8 +6209,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6209,8 +6214,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -10385,7 +10385,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6254,6 +6259,80 @@ esac
+@@ -6259,6 +6264,80 @@ esac
  
  
  
@@ -10466,7 +10466,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6270,6 +6349,11 @@ case $reload_flag in
+@@ -6275,6 +6354,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -10478,7 +10478,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6438,7 +6522,8 @@ mingw* | pw32*)
+@@ -6443,7 +6527,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -10488,7 +10488,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6592,6 +6677,21 @@ esac
+@@ -6597,6 +6682,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -10510,7 +10510,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6607,9 +6707,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6612,9 +6712,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -10675,7 +10675,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6625,7 +6878,7 @@ do
+@@ -6630,7 +6883,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -10684,7 +10684,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6645,11 +6898,15 @@ $as_echo "no" >&6; }
+@@ -6650,11 +6903,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -10703,7 +10703,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6665,7 +6922,7 @@ do
+@@ -6670,7 +6927,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -10712,7 +10712,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6684,6 +6941,10 @@ else
+@@ -6689,6 +6946,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -10723,7 +10723,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6695,16 +6956,72 @@ ac_tool_warned=yes ;;
+@@ -6700,16 +6961,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -10800,7 +10800,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
  
  
-@@ -7046,8 +7363,8 @@ esac
+@@ -7051,8 +7368,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -10811,7 +10811,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7083,6 +7400,7 @@ for ac_symprfx in "" "_"; do
+@@ -7088,6 +7405,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -10819,7 +10819,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7124,6 +7442,18 @@ _LT_EOF
+@@ -7129,6 +7447,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -10838,7 +10838,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7135,7 +7465,7 @@ _LT_EOF
+@@ -7140,7 +7470,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -10847,7 +10847,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
    const char *name;
    void       *address;
  }
-@@ -7161,8 +7491,8 @@ static const void *lt_preloaded_setup() {
+@@ -7166,8 +7496,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -10858,7 +10858,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7172,8 +7502,8 @@ _LT_EOF
+@@ -7177,8 +7507,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -10869,7 +10869,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7210,6 +7540,16 @@ else
+@@ -7215,6 +7545,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -10886,7 +10886,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
  
  
-@@ -7226,6 +7566,45 @@ fi
+@@ -7231,6 +7571,45 @@ fi
  
  
  
@@ -10932,7 +10932,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
  
  
-@@ -7437,6 +7816,123 @@ esac
+@@ -7442,6 +7821,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -11056,7 +11056,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8000,6 +8496,8 @@ _LT_EOF
+@@ -8005,6 +8501,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -11065,7 +11065,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8165,7 +8663,8 @@ fi
+@@ -8170,7 +8668,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -11075,7 +11075,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
  
  
-@@ -8254,7 +8753,7 @@ aix3*)
+@@ -8259,7 +8758,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -11084,7 +11084,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8552,8 +9051,6 @@ fi
+@@ -8557,8 +9056,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -11093,7 +11093,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8719,6 +9216,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8724,6 +9221,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -11106,7 +11106,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8781,7 +9284,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8786,7 +9289,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -11115,7 +11115,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8838,13 +9341,17 @@ case $host_os in
+@@ -8843,13 +9346,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -11139,7 +11139,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8905,6 +9412,11 @@ fi
+@@ -8910,6 +9417,11 @@ fi
  
  
  
@@ -11151,7 +11151,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9255,7 +9767,8 @@ _LT_EOF
+@@ -9260,7 +9772,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -11161,7 +11161,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9354,12 +9867,12 @@ _LT_EOF
+@@ -9359,12 +9872,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -11176,7 +11176,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  	  fi
  	  ;;
  	esac
-@@ -9373,8 +9886,8 @@ _LT_EOF
+@@ -9378,8 +9891,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -11187,7 +11187,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
        fi
        ;;
  
-@@ -9392,8 +9905,8 @@ _LT_EOF
+@@ -9397,8 +9910,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -11198,7 +11198,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
        else
  	ld_shlibs=no
        fi
-@@ -9439,8 +9952,8 @@ _LT_EOF
+@@ -9444,8 +9957,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -11209,7 +11209,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
        else
  	ld_shlibs=no
        fi
-@@ -9570,7 +10083,13 @@ _LT_EOF
+@@ -9575,7 +10088,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -11224,7 +11224,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  /* end confdefs.h.  */
  
  int
-@@ -9583,22 +10102,29 @@ main ()
+@@ -9588,22 +10107,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -11267,7 +11267,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9610,7 +10136,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9615,7 +10141,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -11282,7 +11282,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  /* end confdefs.h.  */
  
  int
-@@ -9623,22 +10155,29 @@ main ()
+@@ -9628,22 +10160,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -11325,7 +11325,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9683,20 +10222,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9688,20 +10227,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -11403,7 +11403,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9757,7 +10339,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9762,7 +10344,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -11412,7 +11412,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9765,7 +10347,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9770,7 +10352,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -11421,7 +11421,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9781,7 +10363,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9786,7 +10368,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -11430,7 +11430,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9805,10 +10387,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9810,10 +10392,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -11443,7 +11443,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  	  ;;
  	esac
        else
-@@ -9887,23 +10469,36 @@ fi
+@@ -9892,23 +10474,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -11488,7 +11488,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9988,7 +10583,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9993,7 +10588,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -11497,7 +11497,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10007,9 +10602,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10012,9 +10607,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -11509,7 +11509,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10585,8 +11180,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10590,8 +11185,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -11521,7 +11521,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10619,13 +11215,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10624,13 +11220,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -11594,7 +11594,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10717,7 +11371,7 @@ haiku*)
+@@ -10712,7 +11366,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -11603,16 +11603,16 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11513,7 +12167,7 @@ else
+@@ -11508,7 +12162,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11516 "configure"
+-#line 11511 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11557,10 +12211,10 @@ else
+@@ -11552,10 +12206,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -11625,16 +11625,16 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11619,7 +12273,7 @@ else
+@@ -11614,7 +12268,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11622 "configure"
+-#line 11617 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11663,10 +12317,10 @@ else
+@@ -11658,10 +12312,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -11647,7 +11647,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14110,13 +14764,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -14136,13 +14790,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -11668,7 +11668,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -14131,14 +14792,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -14157,14 +14818,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -11687,7 +11687,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -14171,12 +14835,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -14197,12 +14861,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -11701,7 +11701,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -14231,8 +14895,13 @@ reload_flag \
+@@ -14257,8 +14921,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -11715,7 +11715,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  STRIP \
  RANLIB \
  CC \
-@@ -14242,12 +14911,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -14268,12 +14937,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -11731,7 +11731,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -14263,7 +14934,6 @@ no_undefined_flag \
+@@ -14289,7 +14960,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -11739,7 +11739,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -14299,6 +14969,7 @@ module_cmds \
+@@ -14325,6 +14995,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -11747,7 +11747,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -15055,7 +15726,8 @@ $as_echo X"$file" |
+@@ -15081,7 +15752,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -11757,7 +11757,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -15158,19 +15830,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -15184,19 +15856,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -11801,7 +11801,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -15200,6 +15895,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -15226,6 +15921,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -11814,7 +11814,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -15209,6 +15910,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -15235,6 +15936,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -11824,7 +11824,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -15323,12 +16027,12 @@ with_gcc=$GCC
+@@ -15349,12 +16053,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -11840,7 +11840,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -15415,9 +16119,6 @@ inherit_rpath=$inherit_rpath
+@@ -15441,9 +16145,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -11850,7 +11850,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -15433,6 +16134,9 @@ include_expsyms=$lt_include_expsyms
+@@ -15459,6 +16160,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -11860,7 +11860,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -15465,210 +16169,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -15491,210 +16195,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -12235,7 +12235,7 @@ index 1dc1b65fac3..c5c2f36bbc0 100755
    chmod +x "$ofile"
  
 diff --git a/libtool.m4 b/libtool.m4
-index 434530059fa..e45fdc6998c 100644
+index e993b621ac2..7715af647f4 100644
 --- a/libtool.m4
 +++ b/libtool.m4
 @@ -1,7 +1,8 @@
@@ -12605,7 +12605,7 @@ index 434530059fa..e45fdc6998c 100644
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -2342,7 +2483,7 @@ haiku*)
+@@ -2332,7 +2473,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -12614,7 +12614,7 @@ index 434530059fa..e45fdc6998c 100644
    hardcode_into_libs=yes
    ;;
  
-@@ -2950,6 +3091,11 @@ case $reload_flag in
+@@ -2940,6 +3081,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -12626,7 +12626,7 @@ index 434530059fa..e45fdc6998c 100644
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -3016,7 +3162,8 @@ mingw* | pw32*)
+@@ -3006,7 +3152,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -12636,7 +12636,7 @@ index 434530059fa..e45fdc6998c 100644
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -3167,6 +3314,21 @@ tpf*)
+@@ -3157,6 +3304,21 @@ tpf*)
    ;;
  esac
  ])
@@ -12658,7 +12658,7 @@ index 434530059fa..e45fdc6998c 100644
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -3174,7 +3336,11 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -3164,7 +3326,11 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  _LT_DECL([], [deplibs_check_method], [1],
      [Method to check whether dependent libraries are shared objects])
  _LT_DECL([], [file_magic_cmd], [1],
@@ -12671,7 +12671,7 @@ index 434530059fa..e45fdc6998c 100644
  ])# _LT_CHECK_MAGIC_METHOD
  
  
-@@ -3277,6 +3443,67 @@ dnl aclocal-1.4 backwards compatibility:
+@@ -3267,6 +3433,67 @@ dnl aclocal-1.4 backwards compatibility:
  dnl AC_DEFUN([AM_PROG_NM], [])
  dnl AC_DEFUN([AC_PROG_NM], [])
  
@@ -12739,7 +12739,7 @@ index 434530059fa..e45fdc6998c 100644
  
  # LT_LIB_M
  # --------
-@@ -3403,8 +3630,8 @@ esac
+@@ -3393,8 +3620,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -12750,7 +12750,7 @@ index 434530059fa..e45fdc6998c 100644
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -3440,6 +3667,7 @@ for ac_symprfx in "" "_"; do
+@@ -3430,6 +3657,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[[	 ]]\($symcode$symcode*\)[[	 ]][[	 ]]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -12758,7 +12758,7 @@ index 434530059fa..e45fdc6998c 100644
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -3473,6 +3701,18 @@ _LT_EOF
+@@ -3463,6 +3691,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -12777,7 +12777,7 @@ index 434530059fa..e45fdc6998c 100644
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -3484,7 +3724,7 @@ _LT_EOF
+@@ -3474,7 +3714,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -12786,7 +12786,7 @@ index 434530059fa..e45fdc6998c 100644
    const char *name;
    void       *address;
  }
-@@ -3510,15 +3750,15 @@ static const void *lt_preloaded_setup() {
+@@ -3500,15 +3740,15 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -12806,7 +12806,7 @@ index 434530059fa..e45fdc6998c 100644
  	else
  	  echo "cannot find nm_test_func in $nlist" >&AS_MESSAGE_LOG_FD
  	fi
-@@ -3551,6 +3791,13 @@ else
+@@ -3541,6 +3781,13 @@ else
    AC_MSG_RESULT(ok)
  fi
  
@@ -12820,7 +12820,7 @@ index 434530059fa..e45fdc6998c 100644
  _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
      [Take the output of nm and produce a listing of raw symbols and C names])
  _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
-@@ -3561,6 +3808,8 @@ _LT_DECL([global_symbol_to_c_name_address],
+@@ -3551,6 +3798,8 @@ _LT_DECL([global_symbol_to_c_name_address],
  _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
      [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
      [Transform the output of nm in a C name address pair when lib prefix is needed])
@@ -12829,7 +12829,7 @@ index 434530059fa..e45fdc6998c 100644
  ]) # _LT_CMD_GLOBAL_SYMBOLS
  
  
-@@ -3572,7 +3821,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
+@@ -3562,7 +3811,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
  _LT_TAGVAR(lt_prog_compiler_pic, $1)=
  _LT_TAGVAR(lt_prog_compiler_static, $1)=
  
@@ -12837,7 +12837,7 @@ index 434530059fa..e45fdc6998c 100644
  m4_if([$1], [CXX], [
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -3678,6 +3926,12 @@ m4_if([$1], [CXX], [
+@@ -3668,6 +3916,12 @@ m4_if([$1], [CXX], [
  	  ;;
  	esac
  	;;
@@ -12850,7 +12850,7 @@ index 434530059fa..e45fdc6998c 100644
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -3830,7 +4084,7 @@ m4_if([$1], [CXX], [
+@@ -3820,7 +4074,7 @@ m4_if([$1], [CXX], [
  	;;
        solaris*)
  	case $cc_basename in
@@ -12859,7 +12859,7 @@ index 434530059fa..e45fdc6998c 100644
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
  	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
-@@ -4053,6 +4307,12 @@ m4_if([$1], [CXX], [
+@@ -4043,6 +4297,12 @@ m4_if([$1], [CXX], [
  	_LT_TAGVAR(lt_prog_compiler_pic, $1)='--shared'
  	_LT_TAGVAR(lt_prog_compiler_static, $1)='--static'
  	;;
@@ -12872,7 +12872,7 @@ index 434530059fa..e45fdc6998c 100644
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -4115,7 +4375,7 @@ m4_if([$1], [CXX], [
+@@ -4105,7 +4365,7 @@ m4_if([$1], [CXX], [
        _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
        _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
        case $cc_basename in
@@ -12881,7 +12881,7 @@ index 434530059fa..e45fdc6998c 100644
  	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld ';;
        *)
  	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,';;
-@@ -4172,9 +4432,11 @@ case $host_os in
+@@ -4162,9 +4422,11 @@ case $host_os in
      _LT_TAGVAR(lt_prog_compiler_pic, $1)="$_LT_TAGVAR(lt_prog_compiler_pic, $1)@&t@m4_if([$1],[],[ -DPIC],[m4_if([$1],[CXX],[ -DPIC],[])])"
      ;;
  esac
@@ -12896,7 +12896,7 @@ index 434530059fa..e45fdc6998c 100644
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -4193,6 +4455,8 @@ fi
+@@ -4183,6 +4445,8 @@ fi
  _LT_TAGDECL([pic_flag], [lt_prog_compiler_pic], [1],
  	[Additional compiler flags for building library objects])
  
@@ -12905,7 +12905,7 @@ index 434530059fa..e45fdc6998c 100644
  #
  # Check to make sure the static flag actually works.
  #
-@@ -4213,6 +4477,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
+@@ -4203,6 +4467,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
  m4_defun([_LT_LINKER_SHLIBS],
  [AC_REQUIRE([LT_PATH_LD])dnl
  AC_REQUIRE([LT_PATH_NM])dnl
@@ -12913,7 +12913,7 @@ index 434530059fa..e45fdc6998c 100644
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_DECL_EGREP])dnl
  m4_require([_LT_DECL_SED])dnl
-@@ -4221,6 +4486,7 @@ m4_require([_LT_TAG_COMPILER])dnl
+@@ -4211,6 +4476,7 @@ m4_require([_LT_TAG_COMPILER])dnl
  AC_MSG_CHECKING([whether the $compiler linker ($LD) supports shared libraries])
  m4_if([$1], [CXX], [
    _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -12921,7 +12921,7 @@ index 434530059fa..e45fdc6998c 100644
    case $host_os in
    aix[[4-9]]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -4235,15 +4501,20 @@ m4_if([$1], [CXX], [
+@@ -4225,15 +4491,20 @@ m4_if([$1], [CXX], [
      ;;
    pw32*)
      _LT_TAGVAR(export_symbols_cmds, $1)="$ltdll_cmds"
@@ -12947,7 +12947,7 @@ index 434530059fa..e45fdc6998c 100644
  ], [
    runpath_var=
    _LT_TAGVAR(allow_undefined_flag, $1)=
-@@ -4411,7 +4682,8 @@ _LT_EOF
+@@ -4401,7 +4672,8 @@ _LT_EOF
        _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
        _LT_TAGVAR(always_export_symbols, $1)=no
        _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
@@ -12957,7 +12957,7 @@ index 434530059fa..e45fdc6998c 100644
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -4510,12 +4782,12 @@ _LT_EOF
+@@ -4500,12 +4772,12 @@ _LT_EOF
  	  _LT_TAGVAR(whole_archive_flag_spec, $1)='--whole-archive$convenience --no-whole-archive'
  	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
  	  _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)='-rpath $libdir'
@@ -12972,7 +12972,7 @@ index 434530059fa..e45fdc6998c 100644
  	  fi
  	  ;;
  	esac
-@@ -4529,8 +4801,8 @@ _LT_EOF
+@@ -4519,8 +4791,8 @@ _LT_EOF
  	_LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -12983,7 +12983,7 @@ index 434530059fa..e45fdc6998c 100644
        fi
        ;;
  
-@@ -4548,8 +4820,8 @@ _LT_EOF
+@@ -4538,8 +4810,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -12994,7 +12994,7 @@ index 434530059fa..e45fdc6998c 100644
        else
  	_LT_TAGVAR(ld_shlibs, $1)=no
        fi
-@@ -4595,8 +4867,8 @@ _LT_EOF
+@@ -4585,8 +4857,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -13005,7 +13005,7 @@ index 434530059fa..e45fdc6998c 100644
        else
  	_LT_TAGVAR(ld_shlibs, $1)=no
        fi
-@@ -4726,7 +4998,7 @@ _LT_EOF
+@@ -4716,7 +4988,7 @@ _LT_EOF
  	_LT_TAGVAR(allow_undefined_flag, $1)='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -13014,7 +13014,7 @@ index 434530059fa..e45fdc6998c 100644
          _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
        else
-@@ -4737,7 +5009,7 @@ _LT_EOF
+@@ -4727,7 +4999,7 @@ _LT_EOF
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -13023,7 +13023,7 @@ index 434530059fa..e45fdc6998c 100644
  	 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
  	  # -berok will link without error, but may produce a broken library.
-@@ -4781,20 +5053,63 @@ _LT_EOF
+@@ -4771,20 +5043,63 @@ _LT_EOF
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -13101,7 +13101,7 @@ index 434530059fa..e45fdc6998c 100644
        ;;
  
      darwin* | rhapsody*)
-@@ -4828,7 +5143,7 @@ _LT_EOF
+@@ -4818,7 +5133,7 @@ _LT_EOF
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -13110,7 +13110,7 @@ index 434530059fa..e45fdc6998c 100644
        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
        _LT_TAGVAR(hardcode_direct, $1)=yes
        _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
-@@ -4836,7 +5151,7 @@ _LT_EOF
+@@ -4826,7 +5141,7 @@ _LT_EOF
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -13119,7 +13119,7 @@ index 434530059fa..e45fdc6998c 100644
        else
  	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -4852,7 +5167,7 @@ _LT_EOF
+@@ -4842,7 +5157,7 @@ _LT_EOF
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -13128,7 +13128,7 @@ index 434530059fa..e45fdc6998c 100644
        else
  	_LT_TAGVAR(archive_cmds, $1)='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -4876,10 +5191,10 @@ _LT_EOF
+@@ -4866,10 +5181,10 @@ _LT_EOF
  	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -13141,7 +13141,7 @@ index 434530059fa..e45fdc6998c 100644
  	  ;;
  	esac
        else
-@@ -4926,16 +5241,31 @@ _LT_EOF
+@@ -4916,16 +5231,31 @@ _LT_EOF
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -13180,7 +13180,7 @@ index 434530059fa..e45fdc6998c 100644
        else
  	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -5020,7 +5350,7 @@ _LT_EOF
+@@ -5010,7 +5340,7 @@ _LT_EOF
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	_LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
@@ -13189,7 +13189,7 @@ index 434530059fa..e45fdc6998c 100644
  	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
        else
  	_LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
-@@ -5039,9 +5369,9 @@ _LT_EOF
+@@ -5029,9 +5359,9 @@ _LT_EOF
        _LT_TAGVAR(no_undefined_flag, $1)=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -13201,7 +13201,7 @@ index 434530059fa..e45fdc6998c 100644
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -5313,8 +5643,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
+@@ -5303,8 +5633,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
      to runtime path list])
  _LT_TAGDECL([], [link_all_deplibs], [0],
      [Whether libtool must link a program against all its dependency libraries])
@@ -13210,7 +13210,7 @@ index 434530059fa..e45fdc6998c 100644
  _LT_TAGDECL([], [always_export_symbols], [0],
      [Set to "yes" if exported symbols are required])
  _LT_TAGDECL([], [export_symbols_cmds], [2],
-@@ -5325,6 +5653,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
+@@ -5315,6 +5643,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
      [Symbols that must always be exported])
  _LT_TAGDECL([], [prelink_cmds], [2],
      [Commands necessary for linking programs (against libraries) with templates])
@@ -13219,7 +13219,7 @@ index 434530059fa..e45fdc6998c 100644
  _LT_TAGDECL([], [file_list_spec], [1],
      [Specify filename containing input files])
  dnl FIXME: Not yet implemented
-@@ -5426,6 +5756,7 @@ CC="$lt_save_CC"
+@@ -5416,6 +5746,7 @@ CC="$lt_save_CC"
  m4_defun([_LT_LANG_CXX_CONFIG],
  [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_DECL_EGREP])dnl
@@ -13227,7 +13227,7 @@ index 434530059fa..e45fdc6998c 100644
  if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
      ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
      (test "X$CXX" != "Xg++"))) ; then
-@@ -5487,6 +5818,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5477,6 +5808,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -13235,7 +13235,7 @@ index 434530059fa..e45fdc6998c 100644
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -5504,6 +5836,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5494,6 +5826,7 @@ if test "$_lt_caught_CXX_error" != yes; then
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -13243,7 +13243,7 @@ index 434530059fa..e45fdc6998c 100644
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -5667,7 +6000,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5657,7 +5990,7 @@ if test "$_lt_caught_CXX_error" != yes; then
            _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -13252,7 +13252,7 @@ index 434530059fa..e45fdc6998c 100644
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  
            _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -5679,7 +6012,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5669,7 +6002,7 @@ if test "$_lt_caught_CXX_error" != yes; then
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -13261,7 +13261,7 @@ index 434530059fa..e45fdc6998c 100644
  	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
  	    # -berok will link without error, but may produce a broken library.
-@@ -5721,29 +6054,75 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5711,29 +6044,75 @@ if test "$_lt_caught_CXX_error" != yes; then
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -13360,7 +13360,7 @@ index 434530059fa..e45fdc6998c 100644
        darwin* | rhapsody*)
          _LT_DARWIN_LINKER_FEATURES($1)
  	;;
-@@ -5818,7 +6197,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5808,7 +6187,7 @@ if test "$_lt_caught_CXX_error" != yes; then
              ;;
            *)
              if test "$GXX" = yes; then
@@ -13369,7 +13369,7 @@ index 434530059fa..e45fdc6998c 100644
              else
                # FIXME: insert proper C++ library support
                _LT_TAGVAR(ld_shlibs, $1)=no
-@@ -5889,10 +6268,10 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5879,10 +6258,10 @@ if test "$_lt_caught_CXX_error" != yes; then
  	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -13382,7 +13382,7 @@ index 434530059fa..e45fdc6998c 100644
  	            ;;
  	        esac
  	      fi
-@@ -5933,9 +6312,9 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5923,9 +6302,9 @@ if test "$_lt_caught_CXX_error" != yes; then
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -13394,7 +13394,7 @@ index 434530059fa..e45fdc6998c 100644
  	      fi
  	    fi
  	    _LT_TAGVAR(link_all_deplibs, $1)=yes
-@@ -6005,20 +6384,20 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5995,20 +6374,20 @@ if test "$_lt_caught_CXX_error" != yes; then
  	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -13419,7 +13419,7 @@ index 434530059fa..e45fdc6998c 100644
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -6213,7 +6592,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6203,7 +6582,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -13428,7 +13428,7 @@ index 434530059fa..e45fdc6998c 100644
  		  ;;
  	      esac
  
-@@ -6259,7 +6638,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6249,7 +6628,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  
        solaris*)
          case $cc_basename in
@@ -13437,7 +13437,7 @@ index 434530059fa..e45fdc6998c 100644
  	    # Sun C++ 4.2, 5.x and Centerline C++
              _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
  	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
-@@ -6300,9 +6679,9 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6290,9 +6669,9 @@ if test "$_lt_caught_CXX_error" != yes; then
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -13449,7 +13449,7 @@ index 434530059fa..e45fdc6998c 100644
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -6431,6 +6810,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6421,6 +6800,7 @@ if test "$_lt_caught_CXX_error" != yes; then
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -13457,7 +13457,7 @@ index 434530059fa..e45fdc6998c 100644
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -6445,6 +6825,29 @@ AC_LANG_POP
+@@ -6435,6 +6815,29 @@ AC_LANG_POP
  ])# _LT_LANG_CXX_CONFIG
  
  
@@ -13487,7 +13487,7 @@ index 434530059fa..e45fdc6998c 100644
  # _LT_SYS_HIDDEN_LIBDEPS([TAGNAME])
  # ---------------------------------
  # Figure out "hidden" library dependencies from verbose
-@@ -6453,6 +6856,7 @@ AC_LANG_POP
+@@ -6443,6 +6846,7 @@ AC_LANG_POP
  # objects, libraries and library flags.
  m4_defun([_LT_SYS_HIDDEN_LIBDEPS],
  [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
@@ -13495,7 +13495,7 @@ index 434530059fa..e45fdc6998c 100644
  # Dependencies to place before and after the object being linked:
  _LT_TAGVAR(predep_objects, $1)=
  _LT_TAGVAR(postdep_objects, $1)=
-@@ -6503,6 +6907,13 @@ public class foo {
+@@ -6493,6 +6897,13 @@ public class foo {
  };
  _LT_EOF
  ])
@@ -13509,7 +13509,7 @@ index 434530059fa..e45fdc6998c 100644
  dnl Parse the compiler output and extract the necessary
  dnl objects, libraries and library flags.
  if AC_TRY_EVAL(ac_compile); then
-@@ -6514,7 +6925,7 @@ if AC_TRY_EVAL(ac_compile); then
+@@ -6504,7 +6915,7 @@ if AC_TRY_EVAL(ac_compile); then
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -13518,7 +13518,7 @@ index 434530059fa..e45fdc6998c 100644
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -6523,13 +6934,22 @@ if AC_TRY_EVAL(ac_compile); then
+@@ -6513,13 +6924,22 @@ if AC_TRY_EVAL(ac_compile); then
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -13545,7 +13545,7 @@ index 434530059fa..e45fdc6998c 100644
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -6549,8 +6969,10 @@ if AC_TRY_EVAL(ac_compile); then
+@@ -6539,8 +6959,10 @@ if AC_TRY_EVAL(ac_compile); then
  	   _LT_TAGVAR(postdeps, $1)="${_LT_TAGVAR(postdeps, $1)} ${prev}${p}"
  	 fi
         fi
@@ -13556,7 +13556,7 @@ index 434530059fa..e45fdc6998c 100644
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -6586,6 +7008,7 @@ else
+@@ -6576,6 +6998,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -13564,7 +13564,7 @@ index 434530059fa..e45fdc6998c 100644
  
  # PORTME: override above test on systems where it is broken
  m4_if([$1], [CXX],
-@@ -6622,7 +7045,7 @@ linux*)
+@@ -6612,7 +7035,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -13573,7 +13573,7 @@ index 434530059fa..e45fdc6998c 100644
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -6735,7 +7158,9 @@ if test "$_lt_disable_F77" != yes; then
+@@ -6725,7 +7148,9 @@ if test "$_lt_disable_F77" != yes; then
    # Allow CC to be a program name with arguments.
    lt_save_CC="$CC"
    lt_save_GCC=$GCC
@@ -13583,7 +13583,7 @@ index 434530059fa..e45fdc6998c 100644
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -6789,6 +7214,7 @@ if test "$_lt_disable_F77" != yes; then
+@@ -6779,6 +7204,7 @@ if test "$_lt_disable_F77" != yes; then
  
    GCC=$lt_save_GCC
    CC="$lt_save_CC"
@@ -13591,7 +13591,7 @@ index 434530059fa..e45fdc6998c 100644
  fi # test "$_lt_disable_F77" != yes
  
  AC_LANG_POP
-@@ -6865,7 +7291,9 @@ if test "$_lt_disable_FC" != yes; then
+@@ -6855,7 +7281,9 @@ if test "$_lt_disable_FC" != yes; then
    # Allow CC to be a program name with arguments.
    lt_save_CC="$CC"
    lt_save_GCC=$GCC
@@ -13601,7 +13601,7 @@ index 434530059fa..e45fdc6998c 100644
    compiler=$CC
    GCC=$ac_cv_fc_compiler_gnu
  
-@@ -6921,7 +7349,8 @@ if test "$_lt_disable_FC" != yes; then
+@@ -6911,7 +7339,8 @@ if test "$_lt_disable_FC" != yes; then
    fi # test -n "$compiler"
  
    GCC=$lt_save_GCC
@@ -13611,7 +13611,7 @@ index 434530059fa..e45fdc6998c 100644
  fi # test "$_lt_disable_FC" != yes
  
  AC_LANG_POP
-@@ -6958,10 +7387,12 @@ _LT_COMPILER_BOILERPLATE
+@@ -6948,10 +7377,12 @@ _LT_COMPILER_BOILERPLATE
  _LT_LINKER_BOILERPLATE
  
  # Allow CC to be a program name with arguments.
@@ -13625,7 +13625,7 @@ index 434530059fa..e45fdc6998c 100644
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_TAGVAR(LD, $1)="$LD"
-@@ -6992,7 +7423,8 @@ fi
+@@ -6982,7 +7413,8 @@ fi
  AC_LANG_RESTORE
  
  GCC=$lt_save_GCC
@@ -13635,7 +13635,7 @@ index 434530059fa..e45fdc6998c 100644
  ])# _LT_LANG_GCJ_CONFIG
  
  
-@@ -7027,9 +7459,11 @@ _LT_LINKER_BOILERPLATE
+@@ -7017,9 +7449,11 @@ _LT_LINKER_BOILERPLATE
  
  # Allow CC to be a program name with arguments.
  lt_save_CC="$CC"
@@ -13647,7 +13647,7 @@ index 434530059fa..e45fdc6998c 100644
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_CC_BASENAME([$compiler])
-@@ -7042,7 +7476,8 @@ fi
+@@ -7032,7 +7466,8 @@ fi
  
  GCC=$lt_save_GCC
  AC_LANG_RESTORE
@@ -13657,7 +13657,7 @@ index 434530059fa..e45fdc6998c 100644
  ])# _LT_LANG_RC_CONFIG
  
  
-@@ -7101,6 +7536,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
+@@ -7091,6 +7526,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
  AC_SUBST([OBJDUMP])
  ])
  
@@ -13673,7 +13673,7 @@ index 434530059fa..e45fdc6998c 100644
  
  # _LT_DECL_SED
  # ------------
-@@ -7194,8 +7638,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
+@@ -7184,8 +7628,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -13684,7 +13684,7 @@ index 434530059fa..e45fdc6998c 100644
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -7234,206 +7678,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
+@@ -7224,206 +7668,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
  ])# _LT_CHECK_SHELL_FEATURES
  
  
@@ -19318,7 +19318,7 @@ index bf92b5e0790..c573da90c5c 100644
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
 diff --git a/opcodes/configure b/opcodes/configure
-index 8d1e561c942..a0291dfbfa7 100755
+index dca94db9c3f..26dcc4b82dd 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
 @@ -680,6 +680,9 @@ OTOOL
@@ -20590,7 +20590,7 @@ index 8d1e561c942..a0291dfbfa7 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10643,7 +11298,7 @@ haiku*)
+@@ -10633,7 +11288,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -20599,16 +20599,16 @@ index 8d1e561c942..a0291dfbfa7 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11439,7 +12094,7 @@ else
+@@ -11429,7 +12084,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11442 "configure"
+-#line 11432 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11483,10 +12138,10 @@ else
+@@ -11473,10 +12128,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -20621,16 +20621,16 @@ index 8d1e561c942..a0291dfbfa7 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11545,7 +12200,7 @@ else
+@@ -11535,7 +12190,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11548 "configure"
+-#line 11538 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11589,10 +12244,10 @@ else
+@@ -11579,10 +12234,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -20643,7 +20643,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13756,13 +14411,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13746,13 +14401,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -20664,7 +20664,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13777,14 +14439,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13767,14 +14429,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -20683,7 +20683,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13817,12 +14482,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13807,12 +14472,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -20697,7 +20697,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13877,8 +14542,13 @@ reload_flag \
+@@ -13867,8 +14532,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -20711,7 +20711,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13888,12 +14558,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13878,12 +14548,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -20727,7 +20727,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13909,7 +14581,6 @@ no_undefined_flag \
+@@ -13899,7 +14571,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -20735,7 +20735,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13945,6 +14616,7 @@ module_cmds \
+@@ -13935,6 +14606,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -20743,7 +20743,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14710,7 +15382,8 @@ $as_echo X"$file" |
+@@ -14700,7 +15372,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -20753,7 +20753,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14813,19 +15486,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14803,19 +15476,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -20797,7 +20797,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14855,6 +15551,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14845,6 +15541,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -20810,7 +20810,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14864,6 +15566,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14854,6 +15556,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -20820,7 +20820,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14978,12 +15683,12 @@ with_gcc=$GCC
+@@ -14968,12 +15673,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -20836,7 +20836,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -15070,9 +15775,6 @@ inherit_rpath=$inherit_rpath
+@@ -15060,9 +15765,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -20846,7 +20846,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -15088,6 +15790,9 @@ include_expsyms=$lt_include_expsyms
+@@ -15078,6 +15780,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -20856,7 +20856,7 @@ index 8d1e561c942..a0291dfbfa7 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -15120,210 +15825,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -15110,210 +15815,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -21231,7 +21231,7 @@ index 8d1e561c942..a0291dfbfa7 100755
    chmod +x "$ofile"
  
 diff --git a/zlib/configure b/zlib/configure
-index de6fa7e9960..cce448b6a53 100755
+index b124acf9259..e4075ef3a2c 100755
 --- a/zlib/configure
 +++ b/zlib/configure
 @@ -646,8 +646,11 @@ OTOOL
@@ -22508,7 +22508,7 @@ index de6fa7e9960..cce448b6a53 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -9830,7 +10485,7 @@ haiku*)
+@@ -9820,7 +10475,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -22517,16 +22517,16 @@ index de6fa7e9960..cce448b6a53 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -10644,7 +11299,7 @@ else
+@@ -10634,7 +11289,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10647 "configure"
+-#line 10637 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10688,10 +11343,10 @@ else
+@@ -10678,10 +11333,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -22539,16 +22539,16 @@ index de6fa7e9960..cce448b6a53 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -10750,7 +11405,7 @@ else
+@@ -10740,7 +11395,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10753 "configure"
+-#line 10743 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10794,10 +11449,10 @@ else
+@@ -10784,10 +11439,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -22561,7 +22561,7 @@ index de6fa7e9960..cce448b6a53 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12267,13 +12922,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -12257,13 +12912,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -22582,7 +22582,7 @@ index de6fa7e9960..cce448b6a53 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12288,14 +12950,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -12278,14 +12940,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -22601,7 +22601,7 @@ index de6fa7e9960..cce448b6a53 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12328,12 +12993,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -12318,12 +12983,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -22615,7 +22615,7 @@ index de6fa7e9960..cce448b6a53 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -12388,8 +13053,13 @@ reload_flag \
+@@ -12378,8 +13043,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -22629,7 +22629,7 @@ index de6fa7e9960..cce448b6a53 100755
  STRIP \
  RANLIB \
  CC \
-@@ -12399,12 +13069,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -12389,12 +13059,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -22645,7 +22645,7 @@ index de6fa7e9960..cce448b6a53 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -12420,7 +13092,6 @@ no_undefined_flag \
+@@ -12410,7 +13082,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -22653,7 +22653,7 @@ index de6fa7e9960..cce448b6a53 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -12456,6 +13127,7 @@ module_cmds \
+@@ -12446,6 +13117,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -22661,7 +22661,7 @@ index de6fa7e9960..cce448b6a53 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -13054,7 +13726,8 @@ $as_echo X"$file" |
+@@ -13044,7 +13716,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -22671,7 +22671,7 @@ index de6fa7e9960..cce448b6a53 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -13157,19 +13830,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -13147,19 +13820,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -22715,7 +22715,7 @@ index de6fa7e9960..cce448b6a53 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -13199,6 +13895,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -13189,6 +13885,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -22728,7 +22728,7 @@ index de6fa7e9960..cce448b6a53 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -13208,6 +13910,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -13198,6 +13900,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -22738,7 +22738,7 @@ index de6fa7e9960..cce448b6a53 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -13322,12 +14027,12 @@ with_gcc=$GCC
+@@ -13312,12 +14017,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -22754,7 +22754,7 @@ index de6fa7e9960..cce448b6a53 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -13414,9 +14119,6 @@ inherit_rpath=$inherit_rpath
+@@ -13404,9 +14109,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -22764,7 +22764,7 @@ index de6fa7e9960..cce448b6a53 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -13432,6 +14134,9 @@ include_expsyms=$lt_include_expsyms
+@@ -13422,6 +14124,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -22774,7 +22774,7 @@ index de6fa7e9960..cce448b6a53 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -13464,210 +14169,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -13454,210 +14159,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -23148,6 +23148,3 @@ index de6fa7e9960..cce448b6a53 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index 69a2383782..c3a95e653a 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,7 +1,7 @@
-From f791a5d84475c02356f16679b7f4ee9c9c3408aa Mon Sep 17 00:00:00 2001
+From 0e026a8758a5416b548de21d5245477cf8e33ed2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
-Subject: [PATCH 14/17] Fix rpath in libtool when sysroot is enabled
+Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
 
 Enabling sysroot support in libtool exposed a bug where the final
 library had an RPATH encoded into it which still pointed to the
@@ -47,6 +47,3 @@ index 70e856e0659..11ee684cccf 100644
  	  if test -n "$hardcode_libdir_separator"; then
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs="$libdir"
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
index e848f146b0..824d9d4605 100644
--- a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
@@ -1,7 +1,7 @@
-From e087f96e219d47c4d2244c3f32397e56d41bfdec Mon Sep 17 00:00:00 2001
+From 9d41698ca97b2c5c20ac83147de1f02d385fa66f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
-Subject: [PATCH 15/17] sync with OE libtool changes
+Subject: [PATCH] sync with OE libtool changes
 
 Apply these patches from our libtool patches as not only are redundant RPATHs a
 waste of space but they can cause incorrect linking when native packages are
@@ -84,6 +84,3 @@ index 11ee684cccf..3b19ac15328 100644
  	  fi
  	elif test -n "$runpath_var"; then
  	  case "$finalize_perm_rpath " in
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
index 400b79823f..0602c803db 100644
--- a/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
+++ b/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
@@ -1,7 +1,7 @@
-From ae5a7d622dc9addb2ca9fc85889c45964c025a9c Mon Sep 17 00:00:00 2001
+From 805e3ce0c20bee5049ff167ab6f620a230c6db51 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Apr 2020 14:17:20 -0700
-Subject: [PATCH 16/17] Check for clang before checking gcc version
+Subject: [PATCH] Check for clang before checking gcc version
 
 Clang advertises itself to be gcc 4.2.1, so when compiling this test
 here fails since gcc < 4.4.5 did not support -static-libstdc++ but thats
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 6782f8b6ab8..72f5766b363 100755
+index 7b369071141..7da69e27ce9 100755
 --- a/configure
 +++ b/configure
-@@ -5143,7 +5143,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
+@@ -5093,7 +5093,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
@@ -31,10 +31,10 @@ index 6782f8b6ab8..72f5766b363 100755
  #endif
  int main() {}
 diff --git a/configure.ac b/configure.ac
-index 55beb1dea46..3f9e613e2d9 100644
+index 92f01fb3ed7..e99d67ab86b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1312,7 +1312,7 @@ if test "$GCC" = yes; then
+@@ -1311,7 +1311,7 @@ if test "$GCC" = yes; then
    AC_MSG_CHECKING([whether g++ accepts -static-libstdc++ -static-libgcc])
    AC_LANG_PUSH(C++)
    AC_LINK_IFELSE([AC_LANG_SOURCE([
@@ -43,6 +43,3 @@ index 55beb1dea46..3f9e613e2d9 100644
  #error -static-libstdc++ not implemented
  #endif
  int main() {}])],
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch b/meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
deleted file mode 100644
index 42e0c1c32d..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0017-gas-improve-reproducibility-for-stabs-debugging-data.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From aa6586e80fc6fcd739aa959a71e4cf064cdef072 Mon Sep 17 00:00:00 2001
-From: Denys Zagorui <dzagorui@cisco.com>
-Date: Mon, 9 Nov 2020 15:39:10 +0000
-Subject: [PATCH] gas: improve reproducibility for stabs debugging data format
-
-	* config/obj-elf (obj_elf_init_stab_section): Improve
-	reproducibility for stabs debugging data format
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0541201782c006c09d029d18a45c6e743cfea906]
----
- gas/config/obj-elf.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gas/config/obj-elf.c b/gas/config/obj-elf.c
-index de22b5a1da..2025df8542 100644
---- a/gas/config/obj-elf.c
-+++ b/gas/config/obj-elf.c
-@@ -2374,12 +2374,13 @@ obj_elf_init_stab_section (segT seg)
-   p = frag_more (12);
-   /* Zero it out.  */
-   memset (p, 0, 12);
--  file = as_where (NULL);
-+  file = remap_debug_filename (as_where (NULL));
-   stabstr_name = concat (segment_name (seg), "str", (char *) NULL);
-   stroff = get_stab_string_offset (file, stabstr_name, TRUE);
-   know (stroff == 1 || (stroff == 0 && file[0] == '\0'));
-   md_number_to_chars (p, stroff, 4);
-   seg_info (seg)->stabu.p = p;
-+  xfree ((char *) file);
- }
- 
- #endif
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch b/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
deleted file mode 100644
index 3bc64776e5..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 6caa41daeb7aa17c400b7300fb78d207cf064d70 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Fri, 4 Sep 2020 19:19:18 +0930
-Subject: [PATCH] PR26574, heap buffer overflow in
- _bfd_elf_slurp_secondary_reloc_section
-
-A horribly fuzzed object with section headers inside the ELF header.
-Disallow that, and crazy reloc sizes.
-
-	PR 26574
-	* elfcode.h (elf_object_p): Sanity check section header offset.
-	* elf.c (_bfd_elf_slurp_secondary_reloc_section): Sanity check
-	sh_entsize.
-
-Upstream-Status: Backport
-CVE: CVE-2020-35448
-
-Reference to upstream patch:
-https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;
-    h=8642dafaef21aa6747cec01df1977e9c52eb4679
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- bfd/elf.c     | 4 +++-
- bfd/elfcode.h | 8 ++++----
- 2 files changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/bfd/elf.c b/bfd/elf.c
-index fe375e7346..9f29166399 100644
---- a/bfd/elf.c
-+++ b/bfd/elf.c
-@@ -12527,7 +12527,9 @@ _bfd_elf_slurp_secondary_reloc_section (bfd *      abfd,
-       Elf_Internal_Shdr * hdr = & elf_section_data (relsec)->this_hdr;
- 
-       if (hdr->sh_type == SHT_SECONDARY_RELOC
--	  && hdr->sh_info == (unsigned) elf_section_data (sec)->this_idx)
-+	  && hdr->sh_info == (unsigned) elf_section_data (sec)->this_idx
-+	  && (hdr->sh_entsize == ebd->s->sizeof_rel
-+	      || hdr->sh_entsize == ebd->s->sizeof_rela))
- 	{
- 	  bfd_byte * native_relocs;
- 	  bfd_byte * native_reloc;
-diff --git a/bfd/elfcode.h b/bfd/elfcode.h
-index f4a7829f27..54ef890637 100644
---- a/bfd/elfcode.h
-+++ b/bfd/elfcode.h
-@@ -568,7 +568,7 @@ elf_object_p (bfd *abfd)
- 
-   /* If this is a relocatable file and there is no section header
-      table, then we're hosed.  */
--  if (i_ehdrp->e_shoff == 0 && i_ehdrp->e_type == ET_REL)
-+  if (i_ehdrp->e_shoff < sizeof (x_ehdr) && i_ehdrp->e_type == ET_REL)
-     goto got_wrong_format_error;
- 
-   /* As a simple sanity check, verify that what BFD thinks is the
-@@ -578,7 +578,7 @@ elf_object_p (bfd *abfd)
-     goto got_wrong_format_error;
- 
-   /* Further sanity check.  */
--  if (i_ehdrp->e_shoff == 0 && i_ehdrp->e_shnum != 0)
-+  if (i_ehdrp->e_shoff < sizeof (x_ehdr) && i_ehdrp->e_shnum != 0)
-     goto got_wrong_format_error;
- 
-   ebd = get_elf_backend_data (abfd);
-@@ -615,7 +615,7 @@ elf_object_p (bfd *abfd)
-       && ebd->elf_osabi != ELFOSABI_NONE)
-     goto got_wrong_format_error;
- 
--  if (i_ehdrp->e_shoff != 0)
-+  if (i_ehdrp->e_shoff >= sizeof (x_ehdr))
-     {
-       file_ptr where = (file_ptr) i_ehdrp->e_shoff;
- 
-@@ -807,7 +807,7 @@ elf_object_p (bfd *abfd)
- 	}
-     }
- 
--  if (i_ehdrp->e_shstrndx != 0 && i_ehdrp->e_shoff != 0)
-+  if (i_ehdrp->e_shstrndx != 0 && i_ehdrp->e_shoff >= sizeof (x_ehdr))
-     {
-       unsigned int num_sec;
- 
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/binutils/binutils_2.35.1.bb b/meta/recipes-devtools/binutils/binutils_2.36.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.35.1.bb
rename to meta/recipes-devtools/binutils/binutils_2.36.bb
-- 
2.30.0

