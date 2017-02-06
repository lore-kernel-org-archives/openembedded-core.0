Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2C76FFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 19:38:11 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 19so7500415pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hvlFf7rMNPY+G9gmHl85r3WpPf9+B+988OOb/dNeKdU=;
	b=JsNZQfft25ZFE1vwE41T6I3ID9cdgibOLkcK3k/h+uik8s3lzMUpfBQpS5espmlbrs
	OubtRHzftqp+5nGvAvKV7KV0dvRXB/6DAm/HRL/bQeNAIcDy1T7f8xXBRiPZvGlU8IJd
	9sEDZzGQD83MiLYONqe9e7doqFhjcLHbVbt5AypnnmMBgMejftumEFOdz4NVbTHwDoa6
	NhPne2SIGiFHVixlqmJsZUWr3R4ZxNNcm0NZXyNu2QYu8jq8X+Clior0fDHJFxfAd5is
	lq9Yv3ifRY355qLFxQGmzVBeEC/3BcN4aGQ/XJP4ityGewUbArsVe+RWIQFyXocYdsXr
	P5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hvlFf7rMNPY+G9gmHl85r3WpPf9+B+988OOb/dNeKdU=;
	b=pvSMJ/Z8R1XJWK3fEITFIEINcuOYyylYgm0eUs4AKWKd2/fRm+F8+e8a/tPIWTm/Pu
	pfLCq9Zok305ZeePRrjNWfbsQy1dqAyzA2LKKT+Ngk3eXIqJs4gdrXOXR59BBggZn6m3
	HHxv+Zwq5Zrl1jrD/5zPjzt+0Ml2ES7+ZMlIRt3040AQbeMzZkI0IR1d2o3l/Pq3/L/b
	J/yFgE0wMar0pDO3kWg0tkw5n+hvKG9icMqmiPFG6hcH7eqz0d1XmR7QBPs7M3li/H06
	1UleaWecvhVRu6wlMzjPm5q5cgQ+6Xc9Gr2roaAktao5kVJYK2hP3Rwdpysj8rISR015
	cV1A==
X-Gm-Message-State: AIkVDXJgQWm0LDlTizaIJ7Kqx8m0znWMZ07CpnUhvR6bLR9yh0uf8x9kLAVtnyKW/rtMyQ==
X-Received: by 10.99.188.10 with SMTP id q10mr15224266pge.106.1486409892279;
	Mon, 06 Feb 2017 11:38:12 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	g87sm4718888pfj.20.2017.02.06.11.38.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 11:38:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 11:38:04 -0800
Message-Id: <20170206193804.30593-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH] glibc: Update to 2.25 release
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
X-List-Received-Date: Mon, 06 Feb 2017 19:38:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/cross-localedef-native_2.25.bb           |  5 +-
 ...k-IFUNC-definition-in-unrelocated-shared-.patch | 98 ----------------------
 meta/recipes-core/glibc/glibc_2.25.bb              |  6 +-
 3 files changed, 4 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.25.bb b/meta/recipes-core/glibc/cross-localedef-native_2.25.bb
index 82511b179c..cbd16f7263 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.25.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.25.bb
@@ -17,12 +17,11 @@ inherit autotools
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
-#SRCBRANCH ?= "release/${PV}/master"
-SRCBRANCH ?= "master"
+SRCBRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "bb440151433f0298e7a6786ccd30cd084812f897"
+SRCREV_glibc ?= "db0242e3023436757bbc7c488a779e6e3343db04"
 SRCREV_localedef ?= "29869b6dc11427c5bab839bdb155c85a7c644c71"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc/0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch b/meta/recipes-core/glibc/glibc/0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch
deleted file mode 100644
index 8c146c0f60..0000000000
--- a/meta/recipes-core/glibc/glibc/0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From ee65c9dde382e0235b6b53fa847b23d0097f554f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 12 Jan 2017 12:13:32 -0800
-Subject: [PATCH 28/28] Revert "Check IFUNC definition in unrelocated shared
- library [BZ #20019]"
-
-This reverts commit 0e6d3adc60d8073397af6a320e594d98d7fbedde.
-
-Causes regression in OE a new tracker to fix it has been opened
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=21041
----
-Upstream-Status: Inappropriate
-
- ChangeLog                   |  7 -------
- sysdeps/i386/dl-machine.h   | 18 +-----------------
- sysdeps/x86_64/dl-machine.h | 18 +-----------------
- 3 files changed, 2 insertions(+), 41 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index f06c02a3c6..11d718d561 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -4396,13 +4396,6 @@
- 
- 	* math/test-nan-overflow.c: Include stdlib.h for malloc.
- 
--2016-10-28  H.J. Lu  <hongjiu.lu@intel.com>
--
--	[BZ #20019]
--	* sysdeps/i386/dl-machine.h (elf_machine_rel): Check IFUNC
--	definition in unrelocated shared library.
--	* sysdeps/x86_64/dl-machine.h (elf_machine_rela): Likewise.
--
- 2016-10-28  Florian Weimer  <fweimer@redhat.com>
- 
- 	[BZ #20729]
-diff --git a/sysdeps/i386/dl-machine.h b/sysdeps/i386/dl-machine.h
-index 6eca69d567..a9edb41aa6 100644
---- a/sysdeps/i386/dl-machine.h
-+++ b/sysdeps/i386/dl-machine.h
-@@ -321,23 +321,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
- 			       0)
- 	  && __builtin_expect (sym->st_shndx != SHN_UNDEF, 1)
- 	  && __builtin_expect (!skip_ifunc, 1))
--	{
--# ifndef RTLD_BOOTSTRAP
--	  if (sym_map != map
--	      && sym_map->l_type != lt_executable
--	      && !sym_map->l_relocated)
--	    {
--	      const char *strtab
--		= (const char *) D_PTR (map, l_info[DT_STRTAB]);
--	      _dl_fatal_printf ("\
--%s: Relink `%s' with `%s' for IFUNC symbol `%s'\n",
--				RTLD_PROGNAME, map->l_name,
--				sym_map->l_name,
--				strtab + refsym->st_name);
--	    }
--# endif
--	  value = ((Elf32_Addr (*) (void)) value) ();
--	}
-+	value = ((Elf32_Addr (*) (void)) value) ();
- 
-       switch (r_type)
- 	{
-diff --git a/sysdeps/x86_64/dl-machine.h b/sysdeps/x86_64/dl-machine.h
-index 3e7ae22c67..b3eb33f036 100644
---- a/sysdeps/x86_64/dl-machine.h
-+++ b/sysdeps/x86_64/dl-machine.h
-@@ -331,23 +331,7 @@ elf_machine_rela (struct link_map *map, const ElfW(Rela) *reloc,
- 			       0)
- 	  && __builtin_expect (sym->st_shndx != SHN_UNDEF, 1)
- 	  && __builtin_expect (!skip_ifunc, 1))
--	{
--# ifndef RTLD_BOOTSTRAP
--	  if (sym_map != map
--	      && sym_map->l_type != lt_executable
--	      && !sym_map->l_relocated)
--	    {
--	      const char *strtab
--		= (const char *) D_PTR (map, l_info[DT_STRTAB]);
--	      _dl_fatal_printf ("\
--%s: Relink `%s' with `%s' for IFUNC symbol `%s'\n",
--				RTLD_PROGNAME, map->l_name,
--				sym_map->l_name,
--				strtab + refsym->st_name);
--	    }
--# endif
--	  value = ((ElfW(Addr) (*) (void)) value) ();
--	}
-+	value = ((ElfW(Addr) (*) (void)) value) ();
- 
-       switch (r_type)
- 	{
--- 
-2.11.0
-
diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.bb
index a21fee0a1c..cf9c4f71b8 100644
--- a/meta/recipes-core/glibc/glibc_2.25.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "bb440151433f0298e7a6786ccd30cd084812f897"
+SRCREV ?= "db0242e3023436757bbc7c488a779e6e3343db04"
 
-#SRCBRANCH ?= "release/${PV}/master"
-SRCBRANCH ?= "master"
+SRCBRANCH ?= "release/${PV}/master"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
@@ -43,7 +42,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
-           file://0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.11.1


