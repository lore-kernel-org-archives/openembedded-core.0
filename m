Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E82C87FCA
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.12482.1752594935884226447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=pHT+LATa;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OLS70YEg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101980ecc78ad-46474ce1-0d27-427c-8727-bc172d522968-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vwXXaqx+o7mAw+ivhMR6Uf0pchgz/9gHw4AvLW+NCdY=;
	b=pHT+LATa9Cf+kAAytkqOQ1+Nz+tJRfhrKDUMUocvXHNzCnt1aXM2htReC7dEvVRi
	4t967MqhQ5of5c4a569Nx78dXEaXNtkbCUE2TbrGMOKvl/OFtThy5h7uToM72m3FX4O
	WsDqUx0QS960YAxE1AoPBwqP9bYESrPgaePh8ZD4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vwXXaqx+o7mAw+ivhMR6Uf0pchgz/9gHw4AvLW+NCdY=;
	b=OLS70YEgGOVzW7HLu63+d7tSEGS7byK0nXtVmh7Wef7n0vL/LaNLMvnDoj1QpnJe
	awipxqFE/vOQrkgIvs3m6uA35eYIuy4wAUyWYo11lrTcrj2nUinirfGdaZi92QFGmg6
	sImeXE4/w4RBLQ/LsPZ8hB6FG4YyVr1SEJW8lsYU=
Content-Type: multipart/mixed; boundary="===============3894292295825861885=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debugedit: upgrading to 5.2 SUCCEEDED
Message-ID: <010101980ecc78ad-46474ce1-0d27-427c-8727-bc172d522968-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220331

--===============3894292295825861885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debugedit* to *5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debugedit-upgrade-5.1-5.2.patch
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
From e03cdd3294292be6e2e214bdf9aeb7388948cb66 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 09:15:02 +0000
Subject: [PATCH] debugedit: upgrade 5.1 -> 5.2

---
 .../{debugedit_5.1.bb => debugedit_5.2.bb}    |  3 +-
 ...on-to-allow-disabling-inlined-xxhash.patch | 81 -------------------
 ...003-Makefile.am-do-not-update-manual.patch |  6 +-
 3 files changed, 4 insertions(+), 86 deletions(-)
 rename meta/recipes-devtools/debugedit/{debugedit_5.1.bb => debugedit_5.2.bb} (87%)
 delete mode 100644 meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.1.bb b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
similarity index 87%
rename from meta/recipes-devtools/debugedit/debugedit_5.1.bb
rename to meta/recipes-devtools/debugedit/debugedit_5.2.bb
index 384909a36f..76c54ba63d 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.1.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz \
-           file://0001-Add-option-to-allow-disabling-inlined-xxhash.patch \
            file://0003-Makefile.am-do-not-update-manual.patch \
            "
 
-SRC_URI[sha256sum] = "ee9b688b2ed8fa62551c54cb5dc31aaa05853e7dedbd9e1237c77894ea5e3626"
+SRC_URI[sha256sum] = "705296803cc4403f38764e891b4ed38f8d8d4f8a9164bd4f86c9d4bedcac68dd"
 
 DEPENDS = "elfutils xxhash"
 DEPENDS:append:libc-musl = " musl-legacy-error"
diff --git a/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch b/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch
deleted file mode 100644
index 3aac43628b..0000000000
--- a/meta/recipes-devtools/debugedit/files/0001-Add-option-to-allow-disabling-inlined-xxhash.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 820498e881401a6f4b1715dc6831da965f6e1d69 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 18 Feb 2025 18:50:46 -0800
-Subject: [PATCH] Add option to allow disabling inlined xxhash
-
-xxhash cannot always inline. For example, when using gcc14 and
-'-Og' option, xxhash cannot inline. See links below:
-https://github.com/Cyan4973/xxHash/commit/574aabad87b2ab9440403e92e1075ef48554eb87
-https://github.com/Cyan4973/xxHash/issues/943#issuecomment-2563205130
-
-To allow users successfully build debugedit with gcc14 and "-Og" option,
-add an option to allow disabling inlined xxhash.
-
-This patch refers to a similar patch for libabigail:
-https://sourceware.org/cgit/libabigail/commit/?id=50497911e2590c21270e0763d277457cf7752c3f
-
-Note that the default remains using inlined xxhash.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Upstream-Status: Backport [https://sourceware.org/cgit/debugedit/commit/?id=820498e881401a6f4b1715dc6831da965f6e1d69]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Makefile.am       |  4 ++--
- configure.ac      | 11 +++++++++++
- tools/debugedit.c |  1 -
- 3 files changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index c590edf..35fd947 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -42,8 +42,8 @@ find-debuginfo: $(top_srcdir)/scripts/find-debuginfo.in Makefile
- 
- debugedit_SOURCES = tools/debugedit.c \
- 		    tools/hashtab.c 
--debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ $(AM_CFLAGS)
--debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@
-+debugedit_CFLAGS = @LIBELF_CFLAGS@ @LIBDW_CFLAGS@ @XXHASH_CFLAGS@ $(AM_CFLAGS)
-+debugedit_LDADD = @LIBELF_LIBS@ @LIBDW_LIBS@ @XXHASH_LIBS@
- 
- sepdebugcrcfix_SOURCES = tools/sepdebugcrcfix.c
- sepdebugcrcfix_CFLAGS = @LIBELF_CFLAGS@ $(AM_CFLAGS)
-diff --git a/configure.ac b/configure.ac
-index a5a6e28..32dd27d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -181,6 +181,17 @@ else
- fi
- AC_SUBST([READELF_VERSION_OK])
- 
-+ENABLE_INLINED_XXHASH=yes
-+AC_ARG_ENABLE(inlined-xxhash,
-+	AS_HELP_STRING([--disable-inlined-xxhash], [disable the inlined-only version of xxhash library]),
-+	ENABLE_INLINED_XXHASH=$enableval,
-+	ENABLE_INLINED_XXHASH=yes)
-+
-+if test x$ENABLE_INLINED_XXHASH = xyes; then
-+	XXHASH_CFLAGS="$XXHASH_CFLAGS -DXXH_INLINE_ALL"
-+	XXHASH_LIBS=""
-+fi
-+
- # And generate the output files.
- AC_CONFIG_FILES([Makefile])
- AC_OUTPUT
-diff --git a/tools/debugedit.c b/tools/debugedit.c
-index beefd65..43f9cee 100644
---- a/tools/debugedit.c
-+++ b/tools/debugedit.c
-@@ -82,7 +82,6 @@ typedef struct Ebl_Strtab	Strtab;
- 
- #include "tools/hashtab.h"
- 
--#define XXH_INLINE_ALL
- #include "xxhash.h"
- 
- #define DW_TAG_partial_unit 0x3c
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
index d0414f739a..e57ffdb387 100644
--- a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
+++ b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
@@ -1,4 +1,4 @@
-From b2715c3f4d28fab1c238086d9b5435e269b06301 Mon Sep 17 00:00:00 2001
+From b12dab2cfad277a539e6a8f1efb5e40163516183 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 23 Mar 2023 13:09:23 +0800
 Subject: [PATCH] Makefile.am: do not update manual
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 30 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index c590edf..692e016 100644
+index 99555bd..2635da5 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -52,36 +52,6 @@ sepdebugcrcfix_LDADD = @LIBELF_LIBS@
+@@ -55,36 +55,6 @@ sepdebugcrcfix_LDADD = @LIBELF_LIBS@
  # Manual pages are generated for dist
  dist_man_MANS = debugedit.1 sepdebugcrcfix.1 find-debuginfo.1
  
-- 
2.47.1


--===============3894292295825861885==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debugedit-upgrade-5.1-5.2.patch"

RnJvbSBlMDNjZGQzMjk0MjkyYmU2ZTJlMjE0YmRmOWFlYjczODg5NDhjYjY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDk6MTU6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJ1Z2VkaXQ6IHVwZ3JhZGUgNS4xIC0+IDUuMgoKLS0tCiAuLi4ve2RlYnVnZWRpdF81LjEuYmIg
PT4gZGVidWdlZGl0XzUuMi5iYn0gICAgfCAgMyArLQogLi4ub24tdG8tYWxsb3ctZGlzYWJsaW5n
LWlubGluZWQteHhoYXNoLnBhdGNoIHwgODEgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uMDAzLU1h
a2VmaWxlLmFtLWRvLW5vdC11cGRhdGUtbWFudWFsLnBhdGNoIHwgIDYgKy0KIDMgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA4NiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZGVidWdlZGl0L3tkZWJ1Z2VkaXRfNS4xLmJiID0+IGRlYnVnZWRpdF81LjIu
YmJ9ICg4NyUpCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVn
ZWRpdC9maWxlcy8wMDAxLUFkZC1vcHRpb24tdG8tYWxsb3ctZGlzYWJsaW5nLWlubGluZWQteHho
YXNoLnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVnZWRpdC9k
ZWJ1Z2VkaXRfNS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVnZWRpdC9kZWJ1Z2Vk
aXRfNS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kZWJ1Z2VkaXQvZGVidWdlZGl0XzUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RlYnVnZWRpdC9kZWJ1Z2VkaXRfNS4yLmJiCmluZGV4IDM4NDkwOWEzNmYuLjc2
YzU0YmE2M2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZWJ1Z2VkaXQvZGVi
dWdlZGl0XzUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2RlYnVn
ZWRpdF81LjIuYmIKQEAgLTEwLDExICsxMCwxMCBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT01OTUzMGJkZjMzNjU5YjI5ZTczZDRhZGI5ZjlmNjU1MiBcCiAgICAgICAg
ICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HMzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBk
NDdmYWU1MDQiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9mdHAvZGVidWdl
ZGl0LyR7UFZ9L2RlYnVnZWRpdC0ke1BWfS50YXIueHogXAotICAgICAgICAgICBmaWxlOi8vMDAw
MS1BZGQtb3B0aW9uLXRvLWFsbG93LWRpc2FibGluZy1pbmxpbmVkLXh4aGFzaC5wYXRjaCBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAzLU1ha2VmaWxlLmFtLWRvLW5vdC11cGRhdGUtbWFudWFsLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWU5YjY4OGIyZWQ4
ZmE2MjU1MWM1NGNiNWRjMzFhYWEwNTg1M2U3ZGVkYmQ5ZTEyMzdjNzc4OTRlYTVlMzYyNiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI3MDUyOTY4MDNjYzQ0MDNmMzg3NjRlODkxYjRlZDM4ZjhkOGQ0
ZjhhOTE2NGJkNGY4NmM5ZDRiZWRjYWM2OGRkIgogCiBERVBFTkRTID0gImVsZnV0aWxzIHh4aGFz
aCIKIERFUEVORFM6YXBwZW5kOmxpYmMtbXVzbCA9ICIgbXVzbC1sZWdhY3ktZXJyb3IiCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2ZpbGVzLzAwMDEtQWRkLW9w
dGlvbi10by1hbGxvdy1kaXNhYmxpbmctaW5saW5lZC14eGhhc2gucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZGVidWdlZGl0L2ZpbGVzLzAwMDEtQWRkLW9wdGlvbi10by1hbGxvdy1kaXNh
YmxpbmctaW5saW5lZC14eGhhc2gucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDNhYWM0MzYyOGIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVn
ZWRpdC9maWxlcy8wMDAxLUFkZC1vcHRpb24tdG8tYWxsb3ctZGlzYWJsaW5nLWlubGluZWQteHho
YXNoLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsODEgKzAsMCBAQAotRnJvbSA4MjA0OThlODgx
NDAxYTZmNGIxNzE1ZGM2ODMxZGE5NjVmNmUxZDY5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgotRGF0ZTogVHVlLCAxOCBGZWIg
MjAyNSAxODo1MDo0NiAtMDgwMAotU3ViamVjdDogW1BBVENIXSBBZGQgb3B0aW9uIHRvIGFsbG93
IGRpc2FibGluZyBpbmxpbmVkIHh4aGFzaAotCi14eGhhc2ggY2Fubm90IGFsd2F5cyBpbmxpbmUu
IEZvciBleGFtcGxlLCB3aGVuIHVzaW5nIGdjYzE0IGFuZAotJy1PZycgb3B0aW9uLCB4eGhhc2gg
Y2Fubm90IGlubGluZS4gU2VlIGxpbmtzIGJlbG93OgotaHR0cHM6Ly9naXRodWIuY29tL0N5YW40
OTczL3h4SGFzaC9jb21taXQvNTc0YWFiYWQ4N2IyYWI5NDQwNDAzZTkyZTEwNzVlZjQ4NTU0ZWI4
NwotaHR0cHM6Ly9naXRodWIuY29tL0N5YW40OTczL3h4SGFzaC9pc3N1ZXMvOTQzI2lzc3VlY29t
bWVudC0yNTYzMjA1MTMwCi0KLVRvIGFsbG93IHVzZXJzIHN1Y2Nlc3NmdWxseSBidWlsZCBkZWJ1
Z2VkaXQgd2l0aCBnY2MxNCBhbmQgIi1PZyIgb3B0aW9uLAotYWRkIGFuIG9wdGlvbiB0byBhbGxv
dyBkaXNhYmxpbmcgaW5saW5lZCB4eGhhc2guCi0KLVRoaXMgcGF0Y2ggcmVmZXJzIHRvIGEgc2lt
aWxhciBwYXRjaCBmb3IgbGliYWJpZ2FpbDoKLWh0dHBzOi8vc291cmNld2FyZS5vcmcvY2dpdC9s
aWJhYmlnYWlsL2NvbW1pdC8/aWQ9NTA0OTc5MTFlMjU5MGMyMTI3MGUwNzYzZDI3NzQ1N2NmNzc1
MmMzZgotCi1Ob3RlIHRoYXQgdGhlIGRlZmF1bHQgcmVtYWlucyB1c2luZyBpbmxpbmVkIHh4aGFz
aC4KLQotU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgotCi1V
cHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL3NvdXJjZXdhcmUub3JnL2NnaXQvZGVi
dWdlZGl0L2NvbW1pdC8/aWQ9ODIwNDk4ZTg4MTQwMWE2ZjRiMTcxNWRjNjgzMWRhOTY1ZjZlMWQ2
OV0KLQotU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgotLS0t
Ci0gTWFrZWZpbGUuYW0gICAgICAgfCAgNCArKy0tCi0gY29uZmlndXJlLmFjICAgICAgfCAxMSAr
KysrKysrKysrKwotIHRvb2xzL2RlYnVnZWRpdC5jIHwgIDEgLQotIDMgZmlsZXMgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL01ha2VmaWxl
LmFtIGIvTWFrZWZpbGUuYW0KLWluZGV4IGM1OTBlZGYuLjM1ZmQ5NDcgMTAwNjQ0Ci0tLS0gYS9N
YWtlZmlsZS5hbQotKysrIGIvTWFrZWZpbGUuYW0KLUBAIC00Miw4ICs0Miw4IEBAIGZpbmQtZGVi
dWdpbmZvOiAkKHRvcF9zcmNkaXIpL3NjcmlwdHMvZmluZC1kZWJ1Z2luZm8uaW4gTWFrZWZpbGUK
LSAKLSBkZWJ1Z2VkaXRfU09VUkNFUyA9IHRvb2xzL2RlYnVnZWRpdC5jIFwKLSAJCSAgICB0b29s
cy9oYXNodGFiLmMgCi0tZGVidWdlZGl0X0NGTEFHUyA9IEBMSUJFTEZfQ0ZMQUdTQCBATElCRFdf
Q0ZMQUdTQCAkKEFNX0NGTEFHUykKLS1kZWJ1Z2VkaXRfTERBREQgPSBATElCRUxGX0xJQlNAIEBM
SUJEV19MSUJTQAotK2RlYnVnZWRpdF9DRkxBR1MgPSBATElCRUxGX0NGTEFHU0AgQExJQkRXX0NG
TEFHU0AgQFhYSEFTSF9DRkxBR1NAICQoQU1fQ0ZMQUdTKQotK2RlYnVnZWRpdF9MREFERCA9IEBM
SUJFTEZfTElCU0AgQExJQkRXX0xJQlNAIEBYWEhBU0hfTElCU0AKLSAKLSBzZXBkZWJ1Z2NyY2Zp
eF9TT1VSQ0VTID0gdG9vbHMvc2VwZGVidWdjcmNmaXguYwotIHNlcGRlYnVnY3JjZml4X0NGTEFH
UyA9IEBMSUJFTEZfQ0ZMQUdTQCAkKEFNX0NGTEFHUykKLWRpZmYgLS1naXQgYS9jb25maWd1cmUu
YWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGE1YTZlMjguLjMyZGQyN2QgMTAwNjQ0Ci0tLS0gYS9j
b25maWd1cmUuYWMKLSsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTE4MSw2ICsxODEsMTcgQEAgZWxz
ZQotIGZpCi0gQUNfU1VCU1QoW1JFQURFTEZfVkVSU0lPTl9PS10pCi0gCi0rRU5BQkxFX0lOTElO
RURfWFhIQVNIPXllcwotK0FDX0FSR19FTkFCTEUoaW5saW5lZC14eGhhc2gsCi0rCUFTX0hFTFBf
U1RSSU5HKFstLWRpc2FibGUtaW5saW5lZC14eGhhc2hdLCBbZGlzYWJsZSB0aGUgaW5saW5lZC1v
bmx5IHZlcnNpb24gb2YgeHhoYXNoIGxpYnJhcnldKSwKLSsJRU5BQkxFX0lOTElORURfWFhIQVNI
PSRlbmFibGV2YWwsCi0rCUVOQUJMRV9JTkxJTkVEX1hYSEFTSD15ZXMpCi0rCi0raWYgdGVzdCB4
JEVOQUJMRV9JTkxJTkVEX1hYSEFTSCA9IHh5ZXM7IHRoZW4KLSsJWFhIQVNIX0NGTEFHUz0iJFhY
SEFTSF9DRkxBR1MgLURYWEhfSU5MSU5FX0FMTCIKLSsJWFhIQVNIX0xJQlM9IiIKLStmaQotKwot
ICMgQW5kIGdlbmVyYXRlIHRoZSBvdXRwdXQgZmlsZXMuCi0gQUNfQ09ORklHX0ZJTEVTKFtNYWtl
ZmlsZV0pCi0gQUNfT1VUUFVUCi1kaWZmIC0tZ2l0IGEvdG9vbHMvZGVidWdlZGl0LmMgYi90b29s
cy9kZWJ1Z2VkaXQuYwotaW5kZXggYmVlZmQ2NS4uNDNmOWNlZSAxMDA2NDQKLS0tLSBhL3Rvb2xz
L2RlYnVnZWRpdC5jCi0rKysgYi90b29scy9kZWJ1Z2VkaXQuYwotQEAgLTgyLDcgKzgyLDYgQEAg
dHlwZWRlZiBzdHJ1Y3QgRWJsX1N0cnRhYglTdHJ0YWI7Ci0gCi0gI2luY2x1ZGUgInRvb2xzL2hh
c2h0YWIuaCIKLSAKLS0jZGVmaW5lIFhYSF9JTkxJTkVfQUxMCi0gI2luY2x1ZGUgInh4aGFzaC5o
IgotIAotICNkZWZpbmUgRFdfVEFHX3BhcnRpYWxfdW5pdCAweDNjCi0tLSAKLTIuMjUuMQotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2ZpbGVzLzAwMDMtTWFr
ZWZpbGUuYW0tZG8tbm90LXVwZGF0ZS1tYW51YWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZGVidWdlZGl0L2ZpbGVzLzAwMDMtTWFrZWZpbGUuYW0tZG8tbm90LXVwZGF0ZS1tYW51YWwu
cGF0Y2gKaW5kZXggZDA0MTRmNzM5YS4uZTU3ZmZkYjM4NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2RlYnVnZWRpdC9maWxlcy8wMDAzLU1ha2VmaWxlLmFtLWRvLW5vdC11cGRh
dGUtbWFudWFsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZWJ1Z2VkaXQvZmls
ZXMvMDAwMy1NYWtlZmlsZS5hbS1kby1ub3QtdXBkYXRlLW1hbnVhbC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gYjI3MTVjM2Y0ZDI4ZmFiMWMyMzgwODZkOWI1NDM1ZTI2OWIwNjMwMSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjEyZGFiMmNmYWQyNzdhNTM5ZTZhOGYxZWZiNWU0
MDE2MzUxNjE4MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNo
ZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMjMgTWFyIDIwMjMgMTM6MDk6MjMgKzA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gTWFrZWZpbGUuYW06IGRvIG5vdCB1cGRhdGUgbWFudWFsCkBAIC0y
MCwxMCArMjAsMTAgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAzMCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL01h
a2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KLWluZGV4IGM1OTBlZGYuLjY5MmUwMTYgMTAwNjQ0Citp
bmRleCA5OTU1NWJkLi4yNjM1ZGE1IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01h
a2VmaWxlLmFtCi1AQCAtNTIsMzYgKzUyLDYgQEAgc2VwZGVidWdjcmNmaXhfTERBREQgPSBATElC
RUxGX0xJQlNACitAQCAtNTUsMzYgKzU1LDYgQEAgc2VwZGVidWdjcmNmaXhfTERBREQgPSBATElC
RUxGX0xJQlNACiAgIyBNYW51YWwgcGFnZXMgYXJlIGdlbmVyYXRlZCBmb3IgZGlzdAogIGRpc3Rf
bWFuX01BTlMgPSBkZWJ1Z2VkaXQuMSBzZXBkZWJ1Z2NyY2ZpeC4xIGZpbmQtZGVidWdpbmZvLjEK
ICAKLS0gCjIuNDcuMQoK

--===============3894292295825861885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debugedit/debugedit-dbg: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/debugedit/debugedit-dbg: PKGSIZE changed from 323504 to 327376 (+1%)
packages/core2-64-poky-linux/debugedit/debugedit-dbg: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/debugedit/debugedit-dev: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/debugedit/debugedit-dev: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/debugedit/debugedit-doc: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/debugedit/debugedit-doc: PKGSIZE changed from 5609 to 5955 (+6%)
packages/core2-64-poky-linux/debugedit/debugedit-doc: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/debugedit/debugedit-locale: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/debugedit/debugedit-locale: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/debugedit/debugedit-src: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/debugedit/debugedit-src: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/debugedit/debugedit-staticdev: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/debugedit/debugedit-staticdev: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/debugedit/debugedit: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/debugedit/debugedit: PKGSIZE changed from 107240 to 117554 (+10%)
packages/core2-64-poky-linux/debugedit/debugedit: PV changed from "5.1" to "5.2"
packages/core2-64-poky-linux/debugedit: SRC_URI changed from "https://sourceware.org/ftp/debugedit/5.1/debugedit-5.1.tar.xz file://0001-Add-option-to-allow-disabling-inlined-xxhash.patch file://0003-Makefile.am-do-not-update-manual.patch" to "https://sourceware.org/ftp/debugedit/5.2/debugedit-5.2.tar.xz file://0003-Makefile.am-do-not-update-manual.patch"
packages/core2-64-poky-linux/debugedit: PKGV changed from 5.1 [default] to 5.2 [default]
packages/core2-64-poky-linux/debugedit: PV changed from "5.1" to "5.2"

--===============3894292295825861885==--

