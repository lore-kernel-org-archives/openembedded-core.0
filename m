Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB694C30659
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1106.1714579215960895823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GroN2H94;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0lYen49K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018f34e291e2-610a30c4-fb02-494d-8fc5-88ac98def2b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1PvOcoruhepqneeE0w0jMD1O6xXDz+7putyIsamHprI=;
	b=GroN2H94n7NvflXQWJTal064+7fFUKh1FnqbFwsYvV+4xZkr2rWWA/JIRbq2iStX
	uJlhvLxkfd5zCj9YHLNXDcV9qH7PCGWgt59NxEsG1/55qzKWsiGH4Utq3V7cDQzBRhO
	0BS1LEvTPb1YU3RHGdlFwEK5SHSRuQKK3BI4F/gY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1PvOcoruhepqneeE0w0jMD1O6xXDz+7putyIsamHprI=;
	b=0lYen49Kq0RyWEebUFhNDjMN2sZuIJKkyhcl/+mM69KX9UBL6j+aCUSMI7fDaF2Y
	7dNo2ll9maNJs6qMYSg++HKwMdzRA89/37cPQed62O0VJ/24IkgyBgabknY6JEWH0uo
	3TXzBCpUJGW66EUrqGGcvOYxAxwatPdjEh18AmHw=
Content-Type: multipart/mixed; boundary="===============3318300295899899445=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nasm: upgrading to 2.16.03 SUCCEEDED
Message-ID: <0101018f34e291e2-610a30c4-fb02-494d-8fc5-88ac98def2b0-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198817

--===============3318300295899899445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nasm* to *2.16.03* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nasm-upgrade-2.16.01-2.16.03.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 139b79d4a441b3eb8a08565eefc160552d4b4b2e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 06:19:26 +0000
Subject: [PATCH] nasm: upgrade 2.16.01 -> 2.16.03

---
 .../nasm/nasm/0001-stdlib-Add-strlcat.patch     | 17 ++++++++---------
 .../nasm/0002-Add-debug-prefix-map-option.patch |  9 ++++-----
 .../nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb}   |  2 +-
 3 files changed, 13 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb} (88%)

diff --git a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
index 1b8e947c56..d6e47543f9 100644
--- a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
+++ b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
@@ -1,4 +1,4 @@
-From 680220e772dfa381829983fa73b915416f676894 Mon Sep 17 00:00:00 2001
+From c51f822b5ac0b0e1413b0bbca6a6be98ed6f6a33 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 12:47:30 -0600
 Subject: [PATCH] stdlib: Add strlcat
@@ -7,7 +7,6 @@ Adds strlcat which can be used to safely concatenate strings
 
 Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-
 ---
  Makefile.in        |  2 +-
  configure.ac       |  2 ++
@@ -17,10 +16,10 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  create mode 100644 stdlib/strlcat.c
 
 diff --git a/Makefile.in b/Makefile.in
-index b85ebee..045fabe 100644
+index 601ad68..bfc79a6 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -104,7 +104,7 @@ PROGOBJ = $(NASM) $(NDISASM)
+@@ -117,7 +117,7 @@ PROGOBJ = $(NASM) $(NDISASM)
  PROGS   = nasm$(X) ndisasm$(X)
  
  LIBOBJ_NW = stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$(O) \
@@ -30,10 +29,10 @@ index b85ebee..045fabe 100644
  	nasmlib/ver.$(O) \
  	nasmlib/alloc.$(O) nasmlib/asprintf.$(O) nasmlib/errfile.$(O) \
 diff --git a/configure.ac b/configure.ac
-index 42cd198..e206338 100644
+index 77c72be..d56e5f6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -236,6 +236,7 @@ PA_FUNC_SNPRINTF
+@@ -214,6 +214,7 @@ PA_FUNC_SNPRINTF
  PA_FUNC_VSNPRINTF
  AC_CHECK_FUNCS([strlcpy])
  AC_CHECK_FUNCS([strrchrnul])
@@ -41,7 +40,7 @@ index 42cd198..e206338 100644
  
  dnl These types are POSIX-specific, and Windows does it differently...
  AC_CHECK_TYPES([struct _stati64])
-@@ -255,6 +256,7 @@ AC_CHECK_DECLS(strsep)
+@@ -233,6 +234,7 @@ AC_CHECK_DECLS(strsep)
  AC_CHECK_DECLS(strlcpy)
  AC_CHECK_DECLS(strnlen)
  AC_CHECK_DECLS(strrchrnul)
@@ -50,10 +49,10 @@ index 42cd198..e206338 100644
  dnl Check for missing types
  AC_TYPE_UINTPTR_T
 diff --git a/include/compiler.h b/include/compiler.h
-index 407c160..b64da6a 100644
+index b95b1a2..eb5b984 100644
 --- a/include/compiler.h
 +++ b/include/compiler.h
-@@ -169,6 +169,10 @@ size_t strlcpy(char *, const char *, size_t);
+@@ -171,6 +171,10 @@ size_t strlcpy(char *, const char *, size_t);
  char *strrchrnul(const char *, int);
  #endif
  
diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
index 84fcca0fe1..92bb58d020 100644
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
@@ -1,4 +1,4 @@
-From e28c8883050d34d18ee2d66dfeece51e13adb6d5 Mon Sep 17 00:00:00 2001
+From cbb90d9412ea3c7fc998ac9bb50406ec5759fc46 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 13:12:17 -0600
 Subject: [PATCH] Add --debug-prefix-map option
@@ -9,7 +9,6 @@ be built in a reproducible manner regardless of the build directory.
 
 Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-
 ---
  asm/nasm.c              | 24 ++++++++++++++++++++++++
  include/nasmlib.h       |  9 +++++++++
@@ -27,7 +26,7 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  create mode 100644 test/elfdebugprefix.asm
 
 diff --git a/asm/nasm.c b/asm/nasm.c
-index 76c70f6..08ff119 100644
+index 97d926f..e013c75 100644
 --- a/asm/nasm.c
 +++ b/asm/nasm.c
 @@ -939,6 +939,7 @@ enum text_options {
@@ -83,10 +82,10 @@ index 76c70f6..08ff119 100644
  
      fprintf(out, "       %-20s %s\n",
 diff --git a/include/nasmlib.h b/include/nasmlib.h
-index 87a7fc6..a3e5144 100644
+index fdfb9a9..d0d1194 100644
 --- a/include/nasmlib.h
 +++ b/include/nasmlib.h
-@@ -250,10 +250,19 @@ int64_t readstrnum(char *str, int length, bool *warn);
+@@ -281,10 +281,19 @@ int numstr(char *buf, size_t buflen, uint64_t n,
   */
  int32_t seg_alloc(void);
  
diff --git a/meta/recipes-devtools/nasm/nasm_2.16.01.bb b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
similarity index 88%
rename from meta/recipes-devtools/nasm/nasm_2.16.01.bb
rename to meta/recipes-devtools/nasm/nasm_2.16.03.bb
index 219cc49360..281f3940e7 100644
--- a/meta/recipes-devtools/nasm/nasm_2.16.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            "
 
-SRC_URI[sha256sum] = "35b6ad2ee048d41c4779f073f3efca7762a822b7d2d4ef4e8df24cf65747bb2e"
+SRC_URI[sha256sum] = "bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7633f18ab063edb29e57"
 
 EXTRA_AUTORECONF:append = " -I autoconf/m4"
 
-- 
2.44.0


--===============3318300295899899445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/nasm/nasm-dbg: PKGSIZE changed from 2077032 to 2625112 (+26%)

--===============3318300295899899445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nasm: SRC_URI changed from "http://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.bz2 file://0001-stdlib-Add-strlcat.patch file://0002-Add-debug-prefix-map-option.patch" to "http://www.nasm.us/pub/nasm/releasebuilds/2.16.03/nasm-2.16.03.tar.bz2 file://0001-stdlib-Add-strlcat.patch file://0002-Add-debug-prefix-map-option.patch"
packages/core2-64-poky-linux/nasm: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-dbg: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-dbg: PKGSIZE changed from 2077032 to 2625112 (+26%)
packages/core2-64-poky-linux/nasm/nasm-dbg: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-dev: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-dev: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-doc: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-doc: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-locale: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-locale: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-src: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-src: PKGSIZE changed from 5146848 to 5222176 (+1%)
packages/core2-64-poky-linux/nasm/nasm-src: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-src: FILELIST: directory renamed /usr/src/debug/nasm/2.16.01/common -> /usr/src/debug/nasm/2.16.03/common, directory renamed /usr/src/debug/nasm/2.16.01/disasm -> /usr/src/debug/nasm/2.16.03/disasm, directory renamed /usr/src/debug/nasm/2.16.01/stdlib -> /usr/src/debug/nasm/2.16.03/stdlib, directory renamed /usr/src/debug/nasm/2.16.01/macros -> /usr/src/debug/nasm/2.16.03/macros, directory renamed /usr/src/debug/nasm/2.16.01/x86 -> /usr/src/debug/nasm/2.16.03/x86, removed "/usr/src/debug/nasm/2.16.01/asm/segalloc.c /usr/src/debug/nasm/2.16.01/output/outas86.c /usr/src/debug/nasm/2.16.01/nasmlib/strlist.c /usr/src/debug/nasm/2.16.01/asm/floats.h /usr/src/debug/nasm/2.16.01/include/dbginfo.h /usr/src/debug/nasm/2.16.01/asm/floats.c /usr/src/debug/nasm/2.16.01/nasmlib/string.c /usr/src/debug/nasm/2.16.01/asm/assemble.c /usr/src/debug/nasm/2.16.01/output/outieee.c /usr/src/debug/nasm/2.16.01/output/outobj.c /usr/src/debug/nasm/2.16.01/asm/assemble.h
  /usr/src/debug/nasm/2.16.01/include/rbtree.h /usr/src/debug/nasm/2.16.01/output/outform.h /usr/src/debug/nasm/2.16.01/output/outform.c /usr/src/debug/nasm/2.16.01/nasmlib/asprintf.c /usr/src/debug/nasm/2.16.01/output/outelf.h /usr/src/debug/nasm/2.16.01/output/pecoff.h /usr/src/debug/nasm/2.16.01/output/outelf.c /usr/src/debug/nasm/2.16.01/nasmlib/hashtbl.c /usr/src/debug/nasm/2.16.01/output/outbin.c /usr/src/debug/nasm/2.16.01/include/labels.h /usr/src/debug/nasm/2.16.01/output/nulldbg.c /usr/src/debug/nasm/2.16.01/output/outcoff.c /usr/src/debug/nasm/2.16.01/nasmlib/zerobuf.c /usr/src/debug/nasm/2.16.01/include/error.h /usr/src/debug/nasm/2.16.01/include/compiler.h /usr/src/debug/nasm/2.16.01/include/hashtbl.h /usr/src/debug/nasm/2.16.01/include/strlist.h /usr/src/debug/nasm/2.16.01/nasmlib/alloc.h /usr/src/debug/nasm/2.16.01/include/nctype.h /usr/src/debug/nasm/2.16.01/asm/eval.c /usr/src/debug/nasm/2.16.01/include/warnings.h /usr/src/debug/nasm/2.16.01/nasmlib/alloc.c /usr/src/
 debug/nasm/2.16.01/asm/eval.h /usr/src/debug/nasm/2.16.01/asm/tokhash.c /usr/src/debug/nasm/2.16.01/asm/preproc.h /usr/src/debug/nasm/2.16.01/asm/preproc.c /usr/src/debug/nasm/2.16.01/nasmlib/realpath.c /usr/src/debug/nasm/2.16.01/asm/directiv.h /usr/src/debug/nasm/2.16.01/asm/warnings.c /usr/src/debug/nasm/2.16.01/include/ilog2.h /usr/src/debug/nasm/2.16.01/asm/directiv.c /usr/src/debug/nasm/2.16.01/asm/directbl.c /usr/src/debug/nasm/2.16.01/nasmlib/rbtree.c /usr/src/debug/nasm/2.16.01/asm/quote.h /usr/src/debug/nasm/2.16.01/asm/quote.c /usr/src/debug/nasm/2.16.01/output/outmacho.c /usr/src/debug/nasm/2.16.01/include/opflags.h /usr/src/debug/nasm/2.16.01/asm/error.c /usr/src/debug/nasm/2.16.01/asm/pragma.c /usr/src/debug/nasm/2.16.01/asm/parser.h /usr/src/debug/nasm/2.16.01/asm/parser.c /usr/src/debug/nasm/2.16.01/include/insns.h /usr/src/debug/nasm/2.16.01/include/nasm.h /usr/src/debug/nasm/2.16.01/output/dwarf.h /usr/src/debug/nasm/2.16.01/output/stabs.h /usr/src/debug/nasm/2.16.
 01/nasmlib/nctype.c /usr/src/debug/nasm/2.16.01/asm/pptok.c /usr/src/debug/nasm/2.16.01/asm/pptok.h /usr/src/debug/nasm/2.16.01/include/nasmlib.h /usr/src/debug/nasm/2.16.01/output/codeview.c /usr/src/debug/nasm/2.16.01/include/md5.h /usr/src/debug/nasm/2.16.01/include/saa.h /usr/src/debug/nasm/2.16.01/include/raa.h /usr/src/debug/nasm/2.16.01/output/outlib.c /usr/src/debug/nasm/2.16.01/output/outlib.h /usr/src/debug/nasm/2.16.01/include/disp8.h /usr/src/debug/nasm/2.16.01/asm/nasm.c /usr/src/debug/nasm/2.16.01/asm/listing.h /usr/src/debug/nasm/2.16.01/asm/listing.c /usr/src/debug/nasm/2.16.01/nasmlib/bsi.c /usr/src/debug/nasm/2.16.01/nasmlib/raa.c /usr/src/debug/nasm/2.16.01/nasmlib/saa.c /usr/src/debug/nasm/2.16.01/nasmlib/ver.c /usr/src/debug/nasm/2.16.01/asm/srcfile.h /usr/src/debug/nasm/2.16.01/asm/stdscan.h /usr/src/debug/nasm/2.16.01/nasmlib/rlimit.c /usr/src/debug/nasm/2.16.01/asm/stdscan.c /usr/src/debug/nasm/2.16.01/asm/strfunc.c /usr/src/debug/nasm/2.16.01/asm/srcfile.c /
 usr/src/debug/nasm/2.16.01/asm/labels.c /usr/src/debug/nasm/2.16.01/asm/rdstrnum.c /usr/src/debug/nasm/2.16.01/nasmlib/perfhash.c /usr/src/debug/nasm/2.16.01/nasmlib/file.c /usr/src/debug/nasm/2.16.01/nasmlib/md5c.c /usr/src/debug/nasm/2.16.01/nasmlib/mmap.c /usr/src/debug/nasm/2.16.01/nasmlib/badenum.c /usr/src/debug/nasm/2.16.01/nasmlib/readnum.c /usr/src/debug/nasm/2.16.01/nasmlib/file.h /usr/src/debug/nasm/2.16.01/nasmlib/path.c /usr/src/debug/nasm/2.16.01/nasmlib/crc64.c /usr/src/debug/nasm/2.16.01/output/legacy.c /usr/src/debug/nasm/2.16.01/output/outdbg.c /usr/src/debug/nasm/2.16.01/nasmlib/filename.c /usr/src/debug/nasm/2.16.01/include/iflag.h /usr/src/debug/nasm/2.16.01/nasmlib/crc32.c /usr/src/debug/nasm/2.16.01/asm/exprlib.c /usr/src/debug/nasm/2.16.01/include/perfhash.h /usr/src/debug/nasm/2.16.01/include/tables.h /usr/src/debug/nasm/2.16.01/output/nullout.c /usr/src/debug/nasm/2.16.01/output/outaout.c /usr/src/debug/nasm/2.16.01/include/ver.h /usr/src/debug/nasm/2.16.01
 /output/elf.h", added "/usr/src/debug/nasm/2.16.03/asm/segalloc.c /usr/src/debug/nasm/2.16.03/output/outas86.c /usr/src/debug/nasm/2.16.03/nasmlib/strlist.c /usr/src/debug/nasm/2.16.03/asm/floats.h /usr/src/debug/nasm/2.16.03/include/dbginfo.h /usr/src/debug/nasm/2.16.03/asm/floats.c /usr/src/debug/nasm/2.16.03/nasmlib/string.c /usr/src/debug/nasm/2.16.03/asm/assemble.c /usr/src/debug/nasm/2.16.03/output/outieee.c /usr/src/debug/nasm/2.16.03/output/outobj.c /usr/src/debug/nasm/2.16.03/asm/assemble.h /usr/src/debug/nasm/2.16.03/include/rbtree.h /usr/src/debug/nasm/2.16.03/output/outform.h /usr/src/debug/nasm/2.16.03/output/outform.c /usr/src/debug/nasm/2.16.03/nasmlib/asprintf.c /usr/src/debug/nasm/2.16.03/output/outelf.h /usr/src/debug/nasm/2.16.03/output/pecoff.h /usr/src/debug/nasm/2.16.03/output/outelf.c /usr/src/debug/nasm/2.16.03/nasmlib/hashtbl.c /usr/src/debug/nasm/2.16.03/output/outbin.c /usr/src/debug/nasm/2.16.03/include/labels.h /usr/src/debug/nasm/2.16.03/output/nulldbg.
 c /usr/src/debug/nasm/2.16.03/asm/tokens.h /usr/src/debug/nasm/2.16.03/output/outcoff.c /usr/src/debug/nasm/2.16.03/nasmlib/zerobuf.c /usr/src/debug/nasm/2.16.03/include/error.h /usr/src/debug/nasm/2.16.03/include/compiler.h /usr/src/debug/nasm/2.16.03/include/hashtbl.h /usr/src/debug/nasm/2.16.03/include/strlist.h /usr/src/debug/nasm/2.16.03/nasmlib/alloc.h /usr/src/debug/nasm/2.16.03/include/nctype.h /usr/src/debug/nasm/2.16.03/asm/eval.c /usr/src/debug/nasm/2.16.03/include/warnings.h /usr/src/debug/nasm/2.16.03/nasmlib/alloc.c /usr/src/debug/nasm/2.16.03/asm/eval.h /usr/src/debug/nasm/2.16.03/asm/tokhash.c /usr/src/debug/nasm/2.16.03/asm/preproc.h /usr/src/debug/nasm/2.16.03/asm/preproc.c /usr/src/debug/nasm/2.16.03/nasmlib/realpath.c /usr/src/debug/nasm/2.16.03/asm/directiv.h /usr/src/debug/nasm/2.16.03/asm/warnings.c /usr/src/debug/nasm/2.16.03/include/ilog2.h /usr/src/debug/nasm/2.16.03/asm/directiv.c /usr/src/debug/nasm/2.16.03/asm/directbl.c /usr/src/debug/nasm/2.16.03/nasml
 ib/rbtree.c /usr/src/debug/nasm/2.16.03/asm/quote.h /usr/src/debug/nasm/2.16.03/asm/quote.c /usr/src/debug/nasm/2.16.03/output/outmacho.c /usr/src/debug/nasm/2.16.03/include/opflags.h /usr/src/debug/nasm/2.16.03/autoconf/attribute.h /usr/src/debug/nasm/2.16.03/asm/error.c /usr/src/debug/nasm/2.16.03/asm/pragma.c /usr/src/debug/nasm/2.16.03/asm/parser.h /usr/src/debug/nasm/2.16.03/include/bytesex.h /usr/src/debug/nasm/2.16.03/asm/parser.c /usr/src/debug/nasm/2.16.03/include/insns.h /usr/src/debug/nasm/2.16.03/include/nasm.h /usr/src/debug/nasm/2.16.03/output/dwarf.h /usr/src/debug/nasm/2.16.03/output/macho.h /usr/src/debug/nasm/2.16.03/output/stabs.h /usr/src/debug/nasm/2.16.03/config/config.h /usr/src/debug/nasm/2.16.03/nasmlib/nctype.c /usr/src/debug/nasm/2.16.03/asm/pptok.c /usr/src/debug/nasm/2.16.03/asm/pptok.h /usr/src/debug/nasm/2.16.03/include/nasmlib.h /usr/src/debug/nasm/2.16.03/output/codeview.c /usr/src/debug/nasm/2.16.03/version.h /usr/src/debug/nasm/2.16.03/include/saa.
 h /usr/src/debug/nasm/2.16.03/include/ver.h /usr/src/debug/nasm/2.16.03/include/md5.h /usr/src/debug/nasm/2.16.03/output/outlib.c /usr/src/debug/nasm/2.16.03/asm/warnings_c.h /usr/src/debug/nasm/2.16.03/output/outlib.h /usr/src/debug/nasm/2.16.03/include/disp8.h /usr/src/debug/nasm/2.16.03/asm/nasm.c /usr/src/debug/nasm/2.16.03/asm/listing.h /usr/src/debug/nasm/2.16.03/asm/listing.c /usr/src/debug/nasm/2.16.03/nasmlib/bsi.c /usr/src/debug/nasm/2.16.03/nasmlib/raa.c /usr/src/debug/nasm/2.16.03/nasmlib/saa.c /usr/src/debug/nasm/2.16.03/nasmlib/ver.c /usr/src/debug/nasm/2.16.03/asm/srcfile.h /usr/src/debug/nasm/2.16.03/asm/stdscan.h /usr/src/debug/nasm/2.16.03/nasmlib/rlimit.c /usr/src/debug/nasm/2.16.03/asm/stdscan.c /usr/src/debug/nasm/2.16.03/asm/strfunc.c /usr/src/debug/nasm/2.16.03/asm/srcfile.c /usr/src/debug/nasm/2.16.03/asm/labels.c /usr/src/debug/nasm/2.16.03/nasmlib/numstr.c /usr/src/debug/nasm/2.16.03/asm/rdstrnum.c /usr/src/debug/nasm/2.16.03/nasmlib/perfhash.c /usr/src/deb
 ug/nasm/2.16.03/nasmlib/file.c /usr/src/debug/nasm/2.16.03/nasmlib/md5c.c /usr/src/debug/nasm/2.16.03/nasmlib/mmap.c /usr/src/debug/nasm/2.16.03/nasmlib/badenum.c /usr/src/debug/nasm/2.16.03/nasmlib/path.c /usr/src/debug/nasm/2.16.03/nasmlib/file.h /usr/src/debug/nasm/2.16.03/nasmlib/readnum.c /usr/src/debug/nasm/2.16.03/nasmlib/crc64.c /usr/src/debug/nasm/2.16.03/output/legacy.c /usr/src/debug/nasm/2.16.03/output/outdbg.c /usr/src/debug/nasm/2.16.03/nasmlib/filename.c /usr/src/debug/nasm/2.16.03/include/iflag.h /usr/src/debug/nasm/2.16.03/nasmlib/crc32.c /usr/src/debug/nasm/2.16.03/asm/exprlib.c /usr/src/debug/nasm/2.16.03/include/perfhash.h /usr/src/debug/nasm/2.16.03/include/tables.h /usr/src/debug/nasm/2.16.03/output/nullout.c /usr/src/debug/nasm/2.16.03/output/outaout.c /usr/src/debug/nasm/2.16.03/include/raa.h /usr/src/debug/nasm/2.16.03/output/elf.h"
packages/core2-64-poky-linux/nasm/nasm-staticdev: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-staticdev: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm: PKGSIZE changed from 3363416 to 3371608 (+0%)
packages/core2-64-poky-linux/nasm/nasm: PV changed from "2.16.01" to "2.16.03"

--===============3318300295899899445==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nasm-upgrade-2.16.01-2.16.03.patch"

RnJvbSAxMzliNzlkNGE0NDFiM2ViOGEwODU2NWVlZmMxNjA1NTJkNGI0YjJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwNjoxOToyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5h
c206IHVwZ3JhZGUgMi4xNi4wMSAtPiAyLjE2LjAzCgotLS0KIC4uLi9uYXNtL25hc20vMDAwMS1z
dGRsaWItQWRkLXN0cmxjYXQucGF0Y2ggICAgIHwgMTcgKysrKysrKystLS0tLS0tLS0KIC4uLi9u
YXNtLzAwMDItQWRkLWRlYnVnLXByZWZpeC1tYXAtb3B0aW9uLnBhdGNoIHwgIDkgKysrKy0tLS0t
CiAuLi4vbmFzbS97bmFzbV8yLjE2LjAxLmJiID0+IG5hc21fMi4xNi4wMy5iYn0gICB8ICAyICst
CiAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9uYXNtL3tuYXNtXzIuMTYuMDEuYmIgPT4gbmFzbV8y
LjE2LjAzLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9uYXNt
L25hc20vMDAwMS1zdGRsaWItQWRkLXN0cmxjYXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbmFzbS9uYXNtLzAwMDEtc3RkbGliLUFkZC1zdHJsY2F0LnBhdGNoCmluZGV4IDFiOGU5NDdj
NTYuLmQ2ZTQ3NTQzZjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9uYXNtL25h
c20vMDAwMS1zdGRsaWItQWRkLXN0cmxjYXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL25hc20vbmFzbS8wMDAxLXN0ZGxpYi1BZGQtc3RybGNhdC5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNjgwMjIwZTc3MmRmYTM4MTgyOTk4M2ZhNzNiOTE1NDE2ZjY3Njg5NCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzUxZjgyMmI1YWMwYjBlMTQxM2IwYmJjYTZhNmJlOThl
ZDZmNmEzMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvc2h1YSBXYXR0IDxKUEVX
aGFja2VyQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMTkgTm92IDIwMTkgMTI6NDc6MzAgLTA2MDAK
IFN1YmplY3Q6IFtQQVRDSF0gc3RkbGliOiBBZGQgc3RybGNhdApAQCAtNyw3ICs3LDYgQEAgQWRk
cyBzdHJsY2F0IHdoaWNoIGNhbiBiZSB1c2VkIHRvIHNhZmVseSBjb25jYXRlbmF0ZSBzdHJpbmdz
CiAKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2J1Z3ppbGxhLm5hc20udXMv
c2hvd19idWcuY2dpP2lkPTMzOTI2MzVdCiBTaWduZWQtb2ZmLWJ5OiBKb3NodWEgV2F0dCA8SlBF
V2hhY2tlckBnbWFpbC5jb20+Ci0KIC0tLQogIE1ha2VmaWxlLmluICAgICAgICB8ICAyICstCiAg
Y29uZmlndXJlLmFjICAgICAgIHwgIDIgKysKQEAgLTE3LDEwICsxNiwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBKb3NodWEgV2F0dCA8SlBFV2hhY2tlckBnbWFpbC5jb20+CiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHN0ZGxpYi9zdHJsY2F0LmMKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmluIGIvTWFrZWZp
bGUuaW4KLWluZGV4IGI4NWViZWUuLjA0NWZhYmUgMTAwNjQ0CitpbmRleCA2MDFhZDY4Li5iZmM3
OWE2IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuaW4KICsrKyBiL01ha2VmaWxlLmluCi1AQCAtMTA0
LDcgKzEwNCw3IEBAIFBST0dPQkogPSAkKE5BU00pICQoTkRJU0FTTSkKK0BAIC0xMTcsNyArMTE3
LDcgQEAgUFJPR09CSiA9ICQoTkFTTSkgJChORElTQVNNKQogIFBST0dTICAgPSBuYXNtJChYKSBu
ZGlzYXNtJChYKQogIAogIExJQk9CSl9OVyA9IHN0ZGxpYi9zbnByaW50Zi4kKE8pIHN0ZGxpYi92
c25wcmludGYuJChPKSBzdGRsaWIvc3RybGNweS4kKE8pIFwKQEAgLTMwLDEwICsyOSwxMCBAQCBp
bmRleCBiODVlYmVlLi4wNDVmYWJlIDEwMDY0NAogIAluYXNtbGliL3Zlci4kKE8pIFwKICAJbmFz
bWxpYi9hbGxvYy4kKE8pIG5hc21saWIvYXNwcmludGYuJChPKSBuYXNtbGliL2VycmZpbGUuJChP
KSBcCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCA0MmNk
MTk4Li5lMjA2MzM4IDEwMDY0NAoraW5kZXggNzdjNzJiZS4uZDU2ZTVmNiAxMDA2NDQKIC0tLSBh
L2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAtMjM2LDYgKzIzNiw3IEBAIFBB
X0ZVTkNfU05QUklOVEYKK0BAIC0yMTQsNiArMjE0LDcgQEAgUEFfRlVOQ19TTlBSSU5URgogIFBB
X0ZVTkNfVlNOUFJJTlRGCiAgQUNfQ0hFQ0tfRlVOQ1MoW3N0cmxjcHldKQogIEFDX0NIRUNLX0ZV
TkNTKFtzdHJyY2hybnVsXSkKQEAgLTQxLDcgKzQwLDcgQEAgaW5kZXggNDJjZDE5OC4uZTIwNjMz
OCAxMDA2NDQKICAKICBkbmwgVGhlc2UgdHlwZXMgYXJlIFBPU0lYLXNwZWNpZmljLCBhbmQgV2lu
ZG93cyBkb2VzIGl0IGRpZmZlcmVudGx5Li4uCiAgQUNfQ0hFQ0tfVFlQRVMoW3N0cnVjdCBfc3Rh
dGk2NF0pCi1AQCAtMjU1LDYgKzI1Niw3IEBAIEFDX0NIRUNLX0RFQ0xTKHN0cnNlcCkKK0BAIC0y
MzMsNiArMjM0LDcgQEAgQUNfQ0hFQ0tfREVDTFMoc3Ryc2VwKQogIEFDX0NIRUNLX0RFQ0xTKHN0
cmxjcHkpCiAgQUNfQ0hFQ0tfREVDTFMoc3RybmxlbikKICBBQ19DSEVDS19ERUNMUyhzdHJyY2hy
bnVsKQpAQCAtNTAsMTAgKzQ5LDEwIEBAIGluZGV4IDQyY2QxOTguLmUyMDYzMzggMTAwNjQ0CiAg
ZG5sIENoZWNrIGZvciBtaXNzaW5nIHR5cGVzCiAgQUNfVFlQRV9VSU5UUFRSX1QKIGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2NvbXBpbGVyLmggYi9pbmNsdWRlL2NvbXBpbGVyLmgKLWluZGV4IDQwN2Mx
NjAuLmI2NGRhNmEgMTAwNjQ0CitpbmRleCBiOTViMWEyLi5lYjViOTg0IDEwMDY0NAogLS0tIGEv
aW5jbHVkZS9jb21waWxlci5oCiArKysgYi9pbmNsdWRlL2NvbXBpbGVyLmgKLUBAIC0xNjksNiAr
MTY5LDEwIEBAIHNpemVfdCBzdHJsY3B5KGNoYXIgKiwgY29uc3QgY2hhciAqLCBzaXplX3QpOwor
QEAgLTE3MSw2ICsxNzEsMTAgQEAgc2l6ZV90IHN0cmxjcHkoY2hhciAqLCBjb25zdCBjaGFyICos
IHNpemVfdCk7CiAgY2hhciAqc3RycmNocm51bChjb25zdCBjaGFyICosIGludCk7CiAgI2VuZGlm
CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFzbS9uYXNtLzAwMDItQWRk
LWRlYnVnLXByZWZpeC1tYXAtb3B0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL25h
c20vbmFzbS8wMDAyLUFkZC1kZWJ1Zy1wcmVmaXgtbWFwLW9wdGlvbi5wYXRjaAppbmRleCA4NGZj
Y2EwZmUxLi45MmJiNThkMDIwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFz
bS9uYXNtLzAwMDItQWRkLWRlYnVnLXByZWZpeC1tYXAtb3B0aW9uLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9uYXNtL25hc20vMDAwMi1BZGQtZGVidWctcHJlZml4LW1hcC1vcHRp
b24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUyOGM4ODgzMDUwZDM0ZDE4ZWUyZDY2ZGZl
ZWNlNTFlMTNhZGI2ZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNiYjkwZDk0MTJl
YTNjN2ZjOTk4YWM5YmI1MDQwNmVjNTc1OWZjNDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBKb3NodWEgV2F0dCA8SlBFV2hhY2tlckBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDE5IE5v
diAyMDE5IDEzOjEyOjE3IC0wNjAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCAtLWRlYnVnLXByZWZp
eC1tYXAgb3B0aW9uCkBAIC05LDcgKzksNiBAQCBiZSBidWlsdCBpbiBhIHJlcHJvZHVjaWJsZSBt
YW5uZXIgcmVnYXJkbGVzcyBvZiB0aGUgYnVpbGQgZGlyZWN0b3J5LgogCiBVcHN0cmVhbS1TdGF0
dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9idWd6aWxsYS5uYXNtLnVzL3Nob3dfYnVnLmNnaT9pZD0z
MzkyNjM1XQogU2lnbmVkLW9mZi1ieTogSm9zaHVhIFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29t
PgotCiAtLS0KICBhc20vbmFzbS5jICAgICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysr
KysrKysrKwogIGluY2x1ZGUvbmFzbWxpYi5oICAgICAgIHwgIDkgKysrKysrKysrCkBAIC0yNyw3
ICsyNiw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWlsLmNv
bT4KICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdC9lbGZkZWJ1Z3ByZWZpeC5hc20KIAogZGlmZiAt
LWdpdCBhL2FzbS9uYXNtLmMgYi9hc20vbmFzbS5jCi1pbmRleCA3NmM3MGY2Li4wOGZmMTE5IDEw
MDY0NAoraW5kZXggOTdkOTI2Zi4uZTAxM2M3NSAxMDA2NDQKIC0tLSBhL2FzbS9uYXNtLmMKICsr
KyBiL2FzbS9uYXNtLmMKIEBAIC05MzksNiArOTM5LDcgQEAgZW51bSB0ZXh0X29wdGlvbnMgewpA
QCAtODMsMTAgKzgyLDEwIEBAIGluZGV4IDc2YzcwZjYuLjA4ZmYxMTkgMTAwNjQ0CiAgCiAgICAg
IGZwcmludGYob3V0LCAiICAgICAgICUtMjBzICVzXG4iLAogZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bmFzbWxpYi5oIGIvaW5jbHVkZS9uYXNtbGliLmgKLWluZGV4IDg3YTdmYzYuLmEzZTUxNDQgMTAw
NjQ0CitpbmRleCBmZGZiOWE5Li5kMGQxMTk0IDEwMDY0NAogLS0tIGEvaW5jbHVkZS9uYXNtbGli
LmgKICsrKyBiL2luY2x1ZGUvbmFzbWxpYi5oCi1AQCAtMjUwLDEwICsyNTAsMTkgQEAgaW50NjRf
dCByZWFkc3RybnVtKGNoYXIgKnN0ciwgaW50IGxlbmd0aCwgYm9vbCAqd2Fybik7CitAQCAtMjgx
LDEwICsyODEsMTkgQEAgaW50IG51bXN0cihjaGFyICpidWYsIHNpemVfdCBidWZsZW4sIHVpbnQ2
NF90IG4sCiAgICovCiAgaW50MzJfdCBzZWdfYWxsb2Modm9pZCk7CiAgCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFzbS9uYXNtXzIuMTYuMDEuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbmFzbS9uYXNtXzIuMTYuMDMuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL25hc20vbmFzbV8yLjE2LjAxLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFzbS9uYXNtXzIuMTYuMDMuYmIKaW5kZXggMjE5Y2M0
OTM2MC4uMjgxZjM5NDBlNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL25hc20v
bmFzbV8yLjE2LjAxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9uYXNtL25hc21fMi4x
Ni4wMy5iYgpAQCAtMTAsNyArMTAsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly93d3cubmFzbS51cy9w
dWIvbmFzbS9yZWxlYXNlYnVpbGRzLyR7UFZ9L25hc20tJHtQVn0udGFyLmJ6MiBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAyLUFkZC1kZWJ1Zy1wcmVmaXgtbWFwLW9wdGlvbi5wYXRjaCBcCiAgICAg
ICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM1YjZhZDJlZTA0OGQ0MWM0Nzc5ZjA3
M2YzZWZjYTc3NjJhODIyYjdkMmQ0ZWY0ZThkZjI0Y2Y2NTc0N2JiMmUiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYmVmM2RlMTU5YmNkNjFhZGY5OGJiN2NjODdlZTkwNDZlOTQ0NjQ0YWQ3NmI3NjMz
ZjE4YWIwNjNlZGIyOWU1NyIKIAogRVhUUkFfQVVUT1JFQ09ORjphcHBlbmQgPSAiIC1JIGF1dG9j
b25mL200IgogCi0tIAoyLjQ0LjAKCg==

--===============3318300295899899445==--

