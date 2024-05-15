Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A224C41513
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1236.1715794337414327431
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OY2IpxiO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uw207LY4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018f7d4fde17-40ce446d-b414-4f04-848a-0b4265703028-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=93XUkFr3JZWZzU2DXI9C+otll+eAJQkX7cN2xWxMZ0I=;
	b=OY2IpxiO0+WCfcHGgJPZH6PyKwx66ydosM3+nHswmNfkHsLZ8C/fpwyzcmiuXQEp
	KOqZtC8mvH3hQBlOdyzBcPGwKvEbNthPsVzZnLQp9/2QefVFHYpSpa5GeBvCRfp8zKF
	pkB246A/k/noh6hetpYxXXUTJdUNutF7LJP3vCXo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=93XUkFr3JZWZzU2DXI9C+otll+eAJQkX7cN2xWxMZ0I=;
	b=uw207LY4ZqU7Y+jceL50ymvSHXnJkwuean208JuVRevH7TdUCpHuaVhQXgKmkZ2H
	aOsl4ppWGXZlswqETtqODu/lyzbLEThFZB9L8VeNKDIYH64UzjrLh6qsCcHnk1O/STE
	QcquIuyNhqsfivKotr+kPMe6kN9qe0xoftTzcFOU=
Content-Type: multipart/mixed; boundary="===============1596636791164744175=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nasm: upgrading to 2.16.03 SUCCEEDED
Message-ID: <0101018f7d4fde17-40ce446d-b414-4f04-848a-0b4265703028-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199316

--===============1596636791164744175==
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
From 4179887e8ad9efa7ef5ade7ef3a3da23bcce9778 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 09:07:15 +0000
Subject: [PATCH] nasm: upgrade 2.16.01 -> 2.16.03

---
 .../nasm/nasm/0001-stdlib-Add-strlcat.patch     | 17 ++++++++---------
 .../nasm/0002-Add-debug-prefix-map-option.patch |  9 ++++-----
 .../nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb}   |  2 +-
 3 files changed, 13 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb} (88%)

diff --git a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
index 1b8e947c56..10d9312531 100644
--- a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
+++ b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
@@ -1,4 +1,4 @@
-From 680220e772dfa381829983fa73b915416f676894 Mon Sep 17 00:00:00 2001
+From 9d1de56bf77049fba951d3985595d384030f5d85 Mon Sep 17 00:00:00 2001
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
index 84fcca0fe1..d83ed9e3d2 100644
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
@@ -1,4 +1,4 @@
-From e28c8883050d34d18ee2d66dfeece51e13adb6d5 Mon Sep 17 00:00:00 2001
+From 672d8a3ded2008e5f94d5ad5e8f3c215304d907a Mon Sep 17 00:00:00 2001
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


--===============1596636791164744175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nasm: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm: SRC_URI changed from "http://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.bz2 file://0001-stdlib-Add-strlcat.patch file://0002-Add-debug-prefix-map-option.patch" to "http://www.nasm.us/pub/nasm/releasebuilds/2.16.03/nasm-2.16.03.tar.bz2 file://0001-stdlib-Add-strlcat.patch file://0002-Add-debug-prefix-map-option.patch"
packages/core2-64-poky-linux/nasm: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-dbg: PKGSIZE changed from 2077032 to 2625112 (+26%)
packages/core2-64-poky-linux/nasm/nasm-dbg: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-dbg: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-dev: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-dev: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-doc: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-doc: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-locale: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-locale: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-src: PKGSIZE changed from 5146848 to 5222176 (+1%)
packages/core2-64-poky-linux/nasm/nasm-src: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-src: FILELIST: directory renamed /usr/src/debug/nasm/2.16.01/stdlib -> /usr/src/debug/nasm/2.16.03/stdlib, directory renamed /usr/src/debug/nasm/2.16.01/common -> /usr/src/debug/nasm/2.16.03/common, directory renamed /usr/src/debug/nasm/2.16.01/x86 -> /usr/src/debug/nasm/2.16.03/x86, directory renamed /usr/src/debug/nasm/2.16.01/macros -> /usr/src/debug/nasm/2.16.03/macros, directory renamed /usr/src/debug/nasm/2.16.01/disasm -> /usr/src/debug/nasm/2.16.03/disasm, removed "/usr/src/debug/nasm/2.16.01/nasmlib/perfhash.c /usr/src/debug/nasm/2.16.01/include/insns.h /usr/src/debug/nasm/2.16.01/include/rbtree.h /usr/src/debug/nasm/2.16.01/output/elf.h /usr/src/debug/nasm/2.16.01/output/outieee.c /usr/src/debug/nasm/2.16.01/output/codeview.c /usr/src/debug/nasm/2.16.01/asm/labels.c /usr/src/debug/nasm/2.16.01/include/tables.h /usr/src/debug/nasm/2.16.01/output/outbin.c /usr/src/debug/nasm/2.16.01/output/nullout.c /usr/src/debug/nasm/2.16.01/output/out
 aout.c /usr/src/debug/nasm/2.16.01/output/outobj.c /usr/src/debug/nasm/2.16.01/output/outlib.h /usr/src/debug/nasm/2.16.01/nasmlib/strlist.c /usr/src/debug/nasm/2.16.01/output/outlib.c /usr/src/debug/nasm/2.16.01/asm/tokhash.c /usr/src/debug/nasm/2.16.01/asm/preproc.c /usr/src/debug/nasm/2.16.01/asm/preproc.h /usr/src/debug/nasm/2.16.01/output/outmacho.c /usr/src/debug/nasm/2.16.01/include/strlist.h /usr/src/debug/nasm/2.16.01/output/nulldbg.c /usr/src/debug/nasm/2.16.01/output/outform.c /usr/src/debug/nasm/2.16.01/asm/nasm.c /usr/src/debug/nasm/2.16.01/output/outform.h /usr/src/debug/nasm/2.16.01/include/compiler.h /usr/src/debug/nasm/2.16.01/include/nctype.h /usr/src/debug/nasm/2.16.01/nasmlib/string.c /usr/src/debug/nasm/2.16.01/nasmlib/file.h /usr/src/debug/nasm/2.16.01/asm/listing.c /usr/src/debug/nasm/2.16.01/nasmlib/bsi.c /usr/src/debug/nasm/2.16.01/nasmlib/raa.c /usr/src/debug/nasm/2.16.01/nasmlib/saa.c /usr/src/debug/nasm/2.16.01/nasmlib/ver.c /usr/src/debug/nasm/2.16.01/as
 m/listing.h /usr/src/debug/nasm/2.16.01/nasmlib/file.c /usr/src/debug/nasm/2.16.01/nasmlib/md5c.c /usr/src/debug/nasm/2.16.01/nasmlib/mmap.c /usr/src/debug/nasm/2.16.01/nasmlib/path.c /usr/src/debug/nasm/2.16.01/asm/assemble.h /usr/src/debug/nasm/2.16.01/asm/pptok.c /usr/src/debug/nasm/2.16.01/nasmlib/rbtree.c /usr/src/debug/nasm/2.16.01/asm/pptok.h /usr/src/debug/nasm/2.16.01/asm/assemble.c /usr/src/debug/nasm/2.16.01/include/opflags.h /usr/src/debug/nasm/2.16.01/output/outcoff.c /usr/src/debug/nasm/2.16.01/asm/directbl.c /usr/src/debug/nasm/2.16.01/asm/directiv.c /usr/src/debug/nasm/2.16.01/include/nasm.h /usr/src/debug/nasm/2.16.01/nasmlib/filename.c /usr/src/debug/nasm/2.16.01/output/dwarf.h /usr/src/debug/nasm/2.16.01/output/stabs.h /usr/src/debug/nasm/2.16.01/asm/directiv.h /usr/src/debug/nasm/2.16.01/nasmlib/realpath.c /usr/src/debug/nasm/2.16.01/asm/quote.h /usr/src/debug/nasm/2.16.01/asm/quote.c /usr/src/debug/nasm/2.16.01/asm/eval.c /usr/src/debug/nasm/2.16.01/asm/floats.h
  /usr/src/debug/nasm/2.16.01/asm/floats.c /usr/src/debug/nasm/2.16.01/asm/eval.h /usr/src/debug/nasm/2.16.01/asm/rdstrnum.c /usr/src/debug/nasm/2.16.01/asm/error.c /usr/src/debug/nasm/2.16.01/include/saa.h /usr/src/debug/nasm/2.16.01/include/ver.h /usr/src/debug/nasm/2.16.01/include/md5.h /usr/src/debug/nasm/2.16.01/include/raa.h /usr/src/debug/nasm/2.16.01/nasmlib/crc64.c /usr/src/debug/nasm/2.16.01/nasmlib/zerobuf.c /usr/src/debug/nasm/2.16.01/nasmlib/crc32.c /usr/src/debug/nasm/2.16.01/include/disp8.h /usr/src/debug/nasm/2.16.01/output/outas86.c /usr/src/debug/nasm/2.16.01/output/outelf.h /usr/src/debug/nasm/2.16.01/output/pecoff.h /usr/src/debug/nasm/2.16.01/output/outelf.c /usr/src/debug/nasm/2.16.01/include/error.h /usr/src/debug/nasm/2.16.01/asm/exprlib.c /usr/src/debug/nasm/2.16.01/asm/segalloc.c /usr/src/debug/nasm/2.16.01/nasmlib/badenum.c /usr/src/debug/nasm/2.16.01/nasmlib/readnum.c /usr/src/debug/nasm/2.16.01/asm/pragma.c /usr/src/debug/nasm/2.16.01/asm/parser.h /usr/sr
 c/debug/nasm/2.16.01/output/legacy.c /usr/src/debug/nasm/2.16.01/asm/parser.c /usr/src/debug/nasm/2.16.01/asm/warnings.c /usr/src/debug/nasm/2.16.01/nasmlib/hashtbl.c /usr/src/debug/nasm/2.16.01/include/warnings.h /usr/src/debug/nasm/2.16.01/include/ilog2.h /usr/src/debug/nasm/2.16.01/nasmlib/rlimit.c /usr/src/debug/nasm/2.16.01/nasmlib/alloc.c /usr/src/debug/nasm/2.16.01/asm/srcfile.h /usr/src/debug/nasm/2.16.01/asm/stdscan.h /usr/src/debug/nasm/2.16.01/nasmlib/nctype.c /usr/src/debug/nasm/2.16.01/include/dbginfo.h /usr/src/debug/nasm/2.16.01/asm/srcfile.c /usr/src/debug/nasm/2.16.01/asm/stdscan.c /usr/src/debug/nasm/2.16.01/asm/strfunc.c /usr/src/debug/nasm/2.16.01/nasmlib/alloc.h /usr/src/debug/nasm/2.16.01/include/nasmlib.h /usr/src/debug/nasm/2.16.01/include/perfhash.h /usr/src/debug/nasm/2.16.01/include/iflag.h /usr/src/debug/nasm/2.16.01/nasmlib/asprintf.c /usr/src/debug/nasm/2.16.01/include/labels.h /usr/src/debug/nasm/2.16.01/include/hashtbl.h /usr/src/debug/nasm/2.16.01/ou
 tput/outdbg.c", added "/usr/src/debug/nasm/2.16.03/nasmlib/perfhash.c /usr/src/debug/nasm/2.16.03/include/bytesex.h /usr/src/debug/nasm/2.16.03/include/insns.h /usr/src/debug/nasm/2.16.03/include/rbtree.h /usr/src/debug/nasm/2.16.03/output/elf.h /usr/src/debug/nasm/2.16.03/output/outieee.c /usr/src/debug/nasm/2.16.03/output/codeview.c /usr/src/debug/nasm/2.16.03/asm/labels.c /usr/src/debug/nasm/2.16.03/include/tables.h /usr/src/debug/nasm/2.16.03/output/outbin.c /usr/src/debug/nasm/2.16.03/output/nullout.c /usr/src/debug/nasm/2.16.03/output/outaout.c /usr/src/debug/nasm/2.16.03/output/outobj.c /usr/src/debug/nasm/2.16.03/output/outlib.h /usr/src/debug/nasm/2.16.03/nasmlib/strlist.c /usr/src/debug/nasm/2.16.03/output/outlib.c /usr/src/debug/nasm/2.16.03/asm/tokhash.c /usr/src/debug/nasm/2.16.03/asm/preproc.c /usr/src/debug/nasm/2.16.03/asm/tokens.h /usr/src/debug/nasm/2.16.03/asm/preproc.h /usr/src/debug/nasm/2.16.03/output/outmacho.c /usr/src/debug/nasm/2.16.03/include/strlist.h /us
 r/src/debug/nasm/2.16.03/output/nulldbg.c /usr/src/debug/nasm/2.16.03/output/outform.c /usr/src/debug/nasm/2.16.03/asm/nasm.c /usr/src/debug/nasm/2.16.03/output/outform.h /usr/src/debug/nasm/2.16.03/include/compiler.h /usr/src/debug/nasm/2.16.03/include/nctype.h /usr/src/debug/nasm/2.16.03/autoconf/attribute.h /usr/src/debug/nasm/2.16.03/nasmlib/string.c /usr/src/debug/nasm/2.16.03/nasmlib/file.h /usr/src/debug/nasm/2.16.03/asm/listing.c /usr/src/debug/nasm/2.16.03/nasmlib/bsi.c /usr/src/debug/nasm/2.16.03/nasmlib/raa.c /usr/src/debug/nasm/2.16.03/nasmlib/saa.c /usr/src/debug/nasm/2.16.03/nasmlib/ver.c /usr/src/debug/nasm/2.16.03/asm/listing.h /usr/src/debug/nasm/2.16.03/nasmlib/file.c /usr/src/debug/nasm/2.16.03/nasmlib/md5c.c /usr/src/debug/nasm/2.16.03/nasmlib/mmap.c /usr/src/debug/nasm/2.16.03/nasmlib/path.c /usr/src/debug/nasm/2.16.03/asm/assemble.h /usr/src/debug/nasm/2.16.03/asm/pptok.c /usr/src/debug/nasm/2.16.03/nasmlib/rbtree.c /usr/src/debug/nasm/2.16.03/asm/pptok.h /usr/
 src/debug/nasm/2.16.03/asm/assemble.c /usr/src/debug/nasm/2.16.03/include/opflags.h /usr/src/debug/nasm/2.16.03/output/outcoff.c /usr/src/debug/nasm/2.16.03/asm/directbl.c /usr/src/debug/nasm/2.16.03/asm/directiv.c /usr/src/debug/nasm/2.16.03/include/nasm.h /usr/src/debug/nasm/2.16.03/nasmlib/filename.c /usr/src/debug/nasm/2.16.03/output/dwarf.h /usr/src/debug/nasm/2.16.03/output/macho.h /usr/src/debug/nasm/2.16.03/output/stabs.h /usr/src/debug/nasm/2.16.03/asm/directiv.h /usr/src/debug/nasm/2.16.03/nasmlib/realpath.c /usr/src/debug/nasm/2.16.03/asm/quote.h /usr/src/debug/nasm/2.16.03/asm/quote.c /usr/src/debug/nasm/2.16.03/asm/eval.c /usr/src/debug/nasm/2.16.03/asm/floats.h /usr/src/debug/nasm/2.16.03/asm/floats.c /usr/src/debug/nasm/2.16.03/asm/eval.h /usr/src/debug/nasm/2.16.03/asm/rdstrnum.c /usr/src/debug/nasm/2.16.03/asm/error.c /usr/src/debug/nasm/2.16.03/include/saa.h /usr/src/debug/nasm/2.16.03/include/ver.h /usr/src/debug/nasm/2.16.03/include/md5.h /usr/src/debug/nasm/2.16
 .03/include/raa.h /usr/src/debug/nasm/2.16.03/config/config.h /usr/src/debug/nasm/2.16.03/version.h /usr/src/debug/nasm/2.16.03/asm/warnings_c.h /usr/src/debug/nasm/2.16.03/nasmlib/crc64.c /usr/src/debug/nasm/2.16.03/nasmlib/zerobuf.c /usr/src/debug/nasm/2.16.03/nasmlib/crc32.c /usr/src/debug/nasm/2.16.03/include/disp8.h /usr/src/debug/nasm/2.16.03/output/outas86.c /usr/src/debug/nasm/2.16.03/output/outelf.h /usr/src/debug/nasm/2.16.03/output/pecoff.h /usr/src/debug/nasm/2.16.03/output/outelf.c /usr/src/debug/nasm/2.16.03/include/error.h /usr/src/debug/nasm/2.16.03/asm/exprlib.c /usr/src/debug/nasm/2.16.03/asm/segalloc.c /usr/src/debug/nasm/2.16.03/nasmlib/badenum.c /usr/src/debug/nasm/2.16.03/nasmlib/readnum.c /usr/src/debug/nasm/2.16.03/asm/pragma.c /usr/src/debug/nasm/2.16.03/asm/parser.h /usr/src/debug/nasm/2.16.03/output/legacy.c /usr/src/debug/nasm/2.16.03/nasmlib/numstr.c /usr/src/debug/nasm/2.16.03/asm/parser.c /usr/src/debug/nasm/2.16.03/asm/warnings.c /usr/src/debug/nasm/2
 .16.03/nasmlib/hashtbl.c /usr/src/debug/nasm/2.16.03/include/warnings.h /usr/src/debug/nasm/2.16.03/include/ilog2.h /usr/src/debug/nasm/2.16.03/nasmlib/rlimit.c /usr/src/debug/nasm/2.16.03/nasmlib/alloc.c /usr/src/debug/nasm/2.16.03/asm/srcfile.h /usr/src/debug/nasm/2.16.03/asm/stdscan.h /usr/src/debug/nasm/2.16.03/nasmlib/nctype.c /usr/src/debug/nasm/2.16.03/include/dbginfo.h /usr/src/debug/nasm/2.16.03/asm/srcfile.c /usr/src/debug/nasm/2.16.03/asm/stdscan.c /usr/src/debug/nasm/2.16.03/asm/strfunc.c /usr/src/debug/nasm/2.16.03/nasmlib/alloc.h /usr/src/debug/nasm/2.16.03/include/nasmlib.h /usr/src/debug/nasm/2.16.03/include/perfhash.h /usr/src/debug/nasm/2.16.03/include/iflag.h /usr/src/debug/nasm/2.16.03/nasmlib/asprintf.c /usr/src/debug/nasm/2.16.03/include/labels.h /usr/src/debug/nasm/2.16.03/include/hashtbl.h /usr/src/debug/nasm/2.16.03/output/outdbg.c"
packages/core2-64-poky-linux/nasm/nasm-src: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm-staticdev: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm-staticdev: PKGV changed from 2.16.01 [default] to 2.16.03 [default]
packages/core2-64-poky-linux/nasm/nasm: PKGSIZE changed from 3363416 to 3371608 (+0%)
packages/core2-64-poky-linux/nasm/nasm: PV changed from "2.16.01" to "2.16.03"
packages/core2-64-poky-linux/nasm/nasm: PKGV changed from 2.16.01 [default] to 2.16.03 [default]

--===============1596636791164744175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/nasm/nasm-dbg: PKGSIZE changed from 2077032 to 2625112 (+26%)

--===============1596636791164744175==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nasm-upgrade-2.16.01-2.16.03.patch"

RnJvbSA0MTc5ODg3ZThhZDllZmE3ZWY1YWRlN2VmM2EzZGEyM2JjY2U5Nzc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDk6MDc6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
YXNtOiB1cGdyYWRlIDIuMTYuMDEgLT4gMi4xNi4wMwoKLS0tCiAuLi4vbmFzbS9uYXNtLzAwMDEt
c3RkbGliLUFkZC1zdHJsY2F0LnBhdGNoICAgICB8IDE3ICsrKysrKysrLS0tLS0tLS0tCiAuLi4v
bmFzbS8wMDAyLUFkZC1kZWJ1Zy1wcmVmaXgtbWFwLW9wdGlvbi5wYXRjaCB8ICA5ICsrKystLS0t
LQogLi4uL25hc20ve25hc21fMi4xNi4wMS5iYiA9PiBuYXNtXzIuMTYuMDMuYmJ9ICAgfCAgMiAr
LQogMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFzbS97bmFzbV8yLjE2LjAxLmJiID0+IG5hc21f
Mi4xNi4wMy5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFz
bS9uYXNtLzAwMDEtc3RkbGliLUFkZC1zdHJsY2F0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL25hc20vbmFzbS8wMDAxLXN0ZGxpYi1BZGQtc3RybGNhdC5wYXRjaAppbmRleCAxYjhlOTQ3
YzU2Li4xMGQ5MzEyNTMxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFzbS9u
YXNtLzAwMDEtc3RkbGliLUFkZC1zdHJsY2F0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9uYXNtL25hc20vMDAwMS1zdGRsaWItQWRkLXN0cmxjYXQucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDY4MDIyMGU3NzJkZmEzODE4Mjk5ODNmYTczYjkxNTQxNmY2NzY4OTQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlkMWRlNTZiZjc3MDQ5ZmJhOTUxZDM5ODU1OTVkMzg0
MDMwZjVkODUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NodWEgV2F0dCA8SlBF
V2hhY2tlckBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDE5IE5vdiAyMDE5IDEyOjQ3OjMwIC0wNjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHN0ZGxpYjogQWRkIHN0cmxjYXQKQEAgLTcsNyArNyw2IEBAIEFk
ZHMgc3RybGNhdCB3aGljaCBjYW4gYmUgdXNlZCB0byBzYWZlbHkgY29uY2F0ZW5hdGUgc3RyaW5n
cwogCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9idWd6aWxsYS5uYXNtLnVz
L3Nob3dfYnVnLmNnaT9pZD0zMzkyNjM1XQogU2lnbmVkLW9mZi1ieTogSm9zaHVhIFdhdHQgPEpQ
RVdoYWNrZXJAZ21haWwuY29tPgotCiAtLS0KICBNYWtlZmlsZS5pbiAgICAgICAgfCAgMiArLQog
IGNvbmZpZ3VyZS5hYyAgICAgICB8ICAyICsrCkBAIC0xNywxMCArMTYsMTAgQEAgU2lnbmVkLW9m
Zi1ieTogSm9zaHVhIFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29tPgogIGNyZWF0ZSBtb2RlIDEw
MDY0NCBzdGRsaWIvc3RybGNhdC5jCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5pbiBiL01ha2Vm
aWxlLmluCi1pbmRleCBiODVlYmVlLi4wNDVmYWJlIDEwMDY0NAoraW5kZXggNjAxYWQ2OC4uYmZj
NzlhNiAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmluCiArKysgYi9NYWtlZmlsZS5pbgotQEAgLTEw
NCw3ICsxMDQsNyBAQCBQUk9HT0JKID0gJChOQVNNKSAkKE5ESVNBU00pCitAQCAtMTE3LDcgKzEx
Nyw3IEBAIFBST0dPQkogPSAkKE5BU00pICQoTkRJU0FTTSkKICBQUk9HUyAgID0gbmFzbSQoWCkg
bmRpc2FzbSQoWCkKICAKICBMSUJPQkpfTlcgPSBzdGRsaWIvc25wcmludGYuJChPKSBzdGRsaWIv
dnNucHJpbnRmLiQoTykgc3RkbGliL3N0cmxjcHkuJChPKSBcCkBAIC0zMCwxMCArMjksMTAgQEAg
aW5kZXggYjg1ZWJlZS4uMDQ1ZmFiZSAxMDA2NDQKICAJbmFzbWxpYi92ZXIuJChPKSBcCiAgCW5h
c21saWIvYWxsb2MuJChPKSBuYXNtbGliL2FzcHJpbnRmLiQoTykgbmFzbWxpYi9lcnJmaWxlLiQo
TykgXAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNDJj
ZDE5OC4uZTIwNjMzOCAxMDA2NDQKK2luZGV4IDc3YzcyYmUuLmQ1NmU1ZjYgMTAwNjQ0CiAtLS0g
YS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTIzNiw2ICsyMzYsNyBAQCBQ
QV9GVU5DX1NOUFJJTlRGCitAQCAtMjE0LDYgKzIxNCw3IEBAIFBBX0ZVTkNfU05QUklOVEYKICBQ
QV9GVU5DX1ZTTlBSSU5URgogIEFDX0NIRUNLX0ZVTkNTKFtzdHJsY3B5XSkKICBBQ19DSEVDS19G
VU5DUyhbc3RycmNocm51bF0pCkBAIC00MSw3ICs0MCw3IEBAIGluZGV4IDQyY2QxOTguLmUyMDYz
MzggMTAwNjQ0CiAgCiAgZG5sIFRoZXNlIHR5cGVzIGFyZSBQT1NJWC1zcGVjaWZpYywgYW5kIFdp
bmRvd3MgZG9lcyBpdCBkaWZmZXJlbnRseS4uLgogIEFDX0NIRUNLX1RZUEVTKFtzdHJ1Y3QgX3N0
YXRpNjRdKQotQEAgLTI1NSw2ICsyNTYsNyBAQCBBQ19DSEVDS19ERUNMUyhzdHJzZXApCitAQCAt
MjMzLDYgKzIzNCw3IEBAIEFDX0NIRUNLX0RFQ0xTKHN0cnNlcCkKICBBQ19DSEVDS19ERUNMUyhz
dHJsY3B5KQogIEFDX0NIRUNLX0RFQ0xTKHN0cm5sZW4pCiAgQUNfQ0hFQ0tfREVDTFMoc3RycmNo
cm51bCkKQEAgLTUwLDEwICs0OSwxMCBAQCBpbmRleCA0MmNkMTk4Li5lMjA2MzM4IDEwMDY0NAog
IGRubCBDaGVjayBmb3IgbWlzc2luZyB0eXBlcwogIEFDX1RZUEVfVUlOVFBUUl9UCiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9jb21waWxlci5oIGIvaW5jbHVkZS9jb21waWxlci5oCi1pbmRleCA0MDdj
MTYwLi5iNjRkYTZhIDEwMDY0NAoraW5kZXggYjk1YjFhMi4uZWI1Yjk4NCAxMDA2NDQKIC0tLSBh
L2luY2x1ZGUvY29tcGlsZXIuaAogKysrIGIvaW5jbHVkZS9jb21waWxlci5oCi1AQCAtMTY5LDYg
KzE2OSwxMCBAQCBzaXplX3Qgc3RybGNweShjaGFyICosIGNvbnN0IGNoYXIgKiwgc2l6ZV90KTsK
K0BAIC0xNzEsNiArMTcxLDEwIEBAIHNpemVfdCBzdHJsY3B5KGNoYXIgKiwgY29uc3QgY2hhciAq
LCBzaXplX3QpOwogIGNoYXIgKnN0cnJjaHJudWwoY29uc3QgY2hhciAqLCBpbnQpOwogICNlbmRp
ZgogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL25hc20vbmFzbS8wMDAyLUFk
ZC1kZWJ1Zy1wcmVmaXgtbWFwLW9wdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9u
YXNtL25hc20vMDAwMi1BZGQtZGVidWctcHJlZml4LW1hcC1vcHRpb24ucGF0Y2gKaW5kZXggODRm
Y2NhMGZlMS4uZDgzZWQ5ZTNkMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL25h
c20vbmFzbS8wMDAyLUFkZC1kZWJ1Zy1wcmVmaXgtbWFwLW9wdGlvbi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbmFzbS9uYXNtLzAwMDItQWRkLWRlYnVnLXByZWZpeC1tYXAtb3B0
aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMjhjODg4MzA1MGQzNGQxOGVlMmQ2NmRm
ZWVjZTUxZTEzYWRiNmQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2NzJkOGEzZGVk
MjAwOGU1Zjk0ZDVhZDVlOGYzYzIxNTMwNGQ5MDdhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSm9zaHVhIFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29tPgogRGF0ZTogVHVlLCAxOSBO
b3YgMjAxOSAxMzoxMjoxNyAtMDYwMAogU3ViamVjdDogW1BBVENIXSBBZGQgLS1kZWJ1Zy1wcmVm
aXgtbWFwIG9wdGlvbgpAQCAtOSw3ICs5LDYgQEAgYmUgYnVpbHQgaW4gYSByZXByb2R1Y2libGUg
bWFubmVyIHJlZ2FyZGxlc3Mgb2YgdGhlIGJ1aWxkIGRpcmVjdG9yeS4KIAogVXBzdHJlYW0tU3Rh
dHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vYnVnemlsbGEubmFzbS51cy9zaG93X2J1Zy5jZ2k/aWQ9
MzM5MjYzNV0KIFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWlsLmNv
bT4KLQogLS0tCiAgYXNtL25hc20uYyAgICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKysr
KysrKysrKysKICBpbmNsdWRlL25hc21saWIuaCAgICAgICB8ICA5ICsrKysrKysrKwpAQCAtMjcs
NyArMjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NodWEgV2F0dCA8SlBFV2hhY2tlckBnbWFpbC5j
b20+CiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3QvZWxmZGVidWdwcmVmaXguYXNtCiAKIGRpZmYg
LS1naXQgYS9hc20vbmFzbS5jIGIvYXNtL25hc20uYwotaW5kZXggNzZjNzBmNi4uMDhmZjExOSAx
MDA2NDQKK2luZGV4IDk3ZDkyNmYuLmUwMTNjNzUgMTAwNjQ0CiAtLS0gYS9hc20vbmFzbS5jCiAr
KysgYi9hc20vbmFzbS5jCiBAQCAtOTM5LDYgKzkzOSw3IEBAIGVudW0gdGV4dF9vcHRpb25zIHsK
QEAgLTgzLDEwICs4MiwxMCBAQCBpbmRleCA3NmM3MGY2Li4wOGZmMTE5IDEwMDY0NAogIAogICAg
ICBmcHJpbnRmKG91dCwgIiAgICAgICAlLTIwcyAlc1xuIiwKIGRpZmYgLS1naXQgYS9pbmNsdWRl
L25hc21saWIuaCBiL2luY2x1ZGUvbmFzbWxpYi5oCi1pbmRleCA4N2E3ZmM2Li5hM2U1MTQ0IDEw
MDY0NAoraW5kZXggZmRmYjlhOS4uZDBkMTE5NCAxMDA2NDQKIC0tLSBhL2luY2x1ZGUvbmFzbWxp
Yi5oCiArKysgYi9pbmNsdWRlL25hc21saWIuaAotQEAgLTI1MCwxMCArMjUwLDE5IEBAIGludDY0
X3QgcmVhZHN0cm51bShjaGFyICpzdHIsIGludCBsZW5ndGgsIGJvb2wgKndhcm4pOworQEAgLTI4
MSwxMCArMjgxLDE5IEBAIGludCBudW1zdHIoY2hhciAqYnVmLCBzaXplX3QgYnVmbGVuLCB1aW50
NjRfdCBuLAogICAqLwogIGludDMyX3Qgc2VnX2FsbG9jKHZvaWQpOwogIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL25hc20vbmFzbV8yLjE2LjAxLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL25hc20vbmFzbV8yLjE2LjAzLmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9uYXNtL25hc21fMi4xNi4wMS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL25hc20vbmFzbV8yLjE2LjAzLmJiCmluZGV4IDIxOWNj
NDkzNjAuLjI4MWYzOTQwZTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9uYXNt
L25hc21fMi4xNi4wMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFzbS9uYXNtXzIu
MTYuMDMuYmIKQEAgLTEwLDcgKzEwLDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3Lm5hc20udXMv
cHViL25hc20vcmVsZWFzZWJ1aWxkcy8ke1BWfS9uYXNtLSR7UFZ9LnRhci5iejIgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMi1BZGQtZGVidWctcHJlZml4LW1hcC1vcHRpb24ucGF0Y2ggXAogICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzNWI2YWQyZWUwNDhkNDFjNDc3OWYw
NzNmM2VmY2E3NzYyYTgyMmI3ZDJkNGVmNGU4ZGYyNGNmNjU3NDdiYjJlIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImJlZjNkZTE1OWJjZDYxYWRmOThiYjdjYzg3ZWU5MDQ2ZTk0NDY0NGFkNzZiNzYz
M2YxOGFiMDYzZWRiMjllNTciCiAKIEVYVFJBX0FVVE9SRUNPTkY6YXBwZW5kID0gIiAtSSBhdXRv
Y29uZi9tNCIKIAotLSAKMi40NC4wCgo=

--===============1596636791164744175==--

