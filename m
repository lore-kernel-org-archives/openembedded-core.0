Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8839DC4725D
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:05 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4588.1704114719845163270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F1dFAXgN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OeXkxhz7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018cc5270f07-695cda71-d607-4a98-ab09-d56d080ec544-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114721;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wZT6gmww9tB55YEOmp0NTbswrZPUChV0CLRfPy6RoA8=;
	b=F1dFAXgNIwwBBq1SxoGKC3MQ60L0oe0ZXiE56Icu4sRxrZyzg8j2ZzAWbCvwIVPe
	0uhJdmt8QRf39LmZNDNUAMq6sHccdbkxnPqSqbXgtpANmO6MvFU8mXWGY9j9rMU+Cin
	QgrL8ul1OHWLyBuzBG+4u0lHKnciVgMnq7MzMQGY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114721;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wZT6gmww9tB55YEOmp0NTbswrZPUChV0CLRfPy6RoA8=;
	b=OeXkxhz7nBWrRul6JQtVc0cXfqQcCi2ezgtQGMIfMQKwBSPLkFe4Uy9Xbx/tBvS6
	mCKDaTRD6wNcZKwj98tAsmFtruP5ls6ZJZ5dWWQ6gdu2loPhiXmLfpHQ4Wp+qBQu4fC
	jCUbA03H5OG4lgrXNDw8wWAMZnYdJ7XmSgpuYHDc=
Content-Type: multipart/mixed; boundary="===============1068416017517129369=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] aspell: upgrading to 0.60.8.1 SUCCEEDED
Message-ID: <0101018cc5270f07-695cda71-d607-4a98-ab09-d56d080ec544-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193182

--===============1068416017517129369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *aspell* to *0.60.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-aspell-upgrade-0.60.8-0.60.8.1.patch
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
From 96ad4f15ac30c1d784252c54f09a93474a25ea4c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 12:18:26 +0000
Subject: [PATCH] aspell: upgrade 0.60.8 -> 0.60.8.1

---
 .../{aspell_0.60.8.bb => aspell_0.60.8.1.bb}  |   7 +-
 .../aspell/files/CVE-2019-25051.patch         | 101 ------------------
 2 files changed, 2 insertions(+), 106 deletions(-)
 rename meta/recipes-support/aspell/{aspell_0.60.8.bb => aspell_0.60.8.1.bb} (83%)
 delete mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patch

diff --git a/meta/recipes-support/aspell/aspell_0.60.8.bb b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
similarity index 83%
rename from meta/recipes-support/aspell/aspell_0.60.8.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.1.bb
index 39b55f4ff2..0ea9b063e0 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
@@ -13,11 +13,8 @@ HOMEPAGE = "http://aspell.net/"
 LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
-           file://CVE-2019-25051.patch \
-"
-SRC_URI[md5sum] = "012fa9209203ae4e5a61c2a668fd10e3"
-SRC_URI[sha256sum] = "f9b77e515334a751b2e60daab5db23499e26c9209f5e7b7443b05235ad0226f2"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI[sha256sum] = "d6da12b34d42d457fa604e435ad484a74b2effcd120ff40acd6bb3fb2887d21b"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
diff --git a/meta/recipes-support/aspell/files/CVE-2019-25051.patch b/meta/recipes-support/aspell/files/CVE-2019-25051.patch
deleted file mode 100644
index 8513f6de79..0000000000
--- a/meta/recipes-support/aspell/files/CVE-2019-25051.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 0718b375425aad8e54e1150313b862e4c6fd324a Mon Sep 17 00:00:00 2001
-From: Kevin Atkinson <kevina@gnu.org>
-Date: Sat, 21 Dec 2019 20:32:47 +0000
-Subject: [PATCH] objstack: assert that the alloc size will fit within a chunk
- to prevent a buffer overflow
-
-Bug found using OSS-Fuze.
-
-Upstream-Status: Backport
-[https://github.com/gnuaspell/aspell/commit/0718b375425aad8e54e1150313b862e4c6fd324a]
-CVE: CVE-2019-25051
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- common/objstack.hpp | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/common/objstack.hpp b/common/objstack.hpp
-index 3997bf7..bd97ccd 100644
---- a/common/objstack.hpp
-+++ b/common/objstack.hpp
-@@ -5,6 +5,7 @@
- #include "parm_string.hpp"
- #include <stdlib.h>
- #include <assert.h>
-+#include <stddef.h>
- 
- namespace acommon {
- 
-@@ -26,6 +27,12 @@ class ObjStack
-   byte * temp_end;
-   void setup_chunk();
-   void new_chunk();
-+  bool will_overflow(size_t sz) const {
-+    return offsetof(Node,data) + sz > chunk_size;
-+  }
-+  void check_size(size_t sz) {
-+    assert(!will_overflow(sz));
-+  }
- 
-   ObjStack(const ObjStack &);
-   void operator=(const ObjStack &);
-@@ -56,7 +63,7 @@ class ObjStack
-   void * alloc_bottom(size_t size)  {
-     byte * tmp = bottom;
-     bottom += size;
--    if (bottom > top) {new_chunk(); tmp = bottom; bottom += size;}
-+    if (bottom > top) {check_size(size); new_chunk(); tmp = bottom; bottom += size;}
-     return tmp;
-   }
-   // This alloc_bottom will insure that the object is aligned based on the
-@@ -66,7 +73,7 @@ class ObjStack
-     align_bottom(align);
-     byte * tmp = bottom;
-     bottom += size;
--    if (bottom > top) {new_chunk(); goto loop;}
-+    if (bottom > top) {check_size(size); new_chunk(); goto loop;}
-     return tmp;
-   }
-   char * dup_bottom(ParmString str) {
-@@ -79,7 +86,7 @@ class ObjStack
-   // always be aligned as such.
-   void * alloc_top(size_t size) {
-     top -= size;
--    if (top < bottom) {new_chunk(); top -= size;}
-+    if (top < bottom) {check_size(size); new_chunk(); top -= size;}
-     return top;
-   }
-   // This alloc_top will insure that the object is aligned based on
-@@ -88,7 +95,7 @@ class ObjStack
-   {loop:
-     top -= size;
-     align_top(align);
--    if (top < bottom) {new_chunk(); goto loop;}
-+    if (top < bottom) {check_size(size); new_chunk(); goto loop;}
-     return top;
-   }
-   char * dup_top(ParmString str) {
-@@ -117,6 +124,7 @@ class ObjStack
-   void * alloc_temp(size_t size) {
-     temp_end = bottom + size;
-     if (temp_end > top) {
-+      check_size(size);
-       new_chunk();
-       temp_end = bottom + size;
-     }
-@@ -131,6 +139,7 @@ class ObjStack
-     } else {
-       size_t s = temp_end - bottom;
-       byte * p = bottom;
-+      check_size(size);
-       new_chunk();
-       memcpy(bottom, p, s);
-       temp_end = bottom + size;
-@@ -150,6 +159,7 @@ class ObjStack
-     } else {
-       size_t s = temp_end - bottom;
-       byte * p = bottom;
-+      check_size(size);
-       new_chunk();
-       memcpy(bottom, p, s);
-       temp_end = bottom + size;
-- 
2.42.0


--===============1068416017517129369==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-aspell-upgrade-0.60.8-0.60.8.1.patch"

RnJvbSA5NmFkNGYxNWFjMzBjMWQ3ODQyNTJjNTRmMDlhOTM0NzRhMjVlYTRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAxMjoxODoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFz
cGVsbDogdXBncmFkZSAwLjYwLjggLT4gMC42MC44LjEKCi0tLQogLi4uL3thc3BlbGxfMC42MC44
LmJiID0+IGFzcGVsbF8wLjYwLjguMS5iYn0gIHwgICA3ICstCiAuLi4vYXNwZWxsL2ZpbGVzL0NW
RS0yMDE5LTI1MDUxLnBhdGNoICAgICAgICAgfCAxMDEgLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2FzcGVsbC97YXNwZWxsXzAuNjAuOC5iYiA9PiBhc3BlbGxfMC42
MC44LjEuYmJ9ICg4MyUpCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLXN1cHBvcnQv
YXNwZWxsL2ZpbGVzL0NWRS0yMDE5LTI1MDUxLnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvYXNwZWxsL2FzcGVsbF8wLjYwLjguYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hc3BlbGwvYXNwZWxsXzAuNjAuOC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2FzcGVsbC9hc3BlbGxfMC42MC44LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hc3BlbGwvYXNwZWxsXzAuNjAuOC4xLmJiCmluZGV4IDM5
YjU1ZjRmZjIuLjBlYTliMDYzZTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fz
cGVsbC9hc3BlbGxfMC42MC44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FzcGVsbC9h
c3BlbGxfMC42MC44LjEuYmIKQEAgLTEzLDExICsxMyw4IEBAIEhPTUVQQUdFID0gImh0dHA6Ly9h
c3BlbGwubmV0LyIKIExJQ0VOU0UgPSAiTEdQTC0yLjAtb25seSB8IExHUEwtMi4xLW9ubHkiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03ZmJjMzM4MzA5YWMzOGZlZmNk
NjRiMDRiYjkwM2UzNCIKIAotU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2FzcGVsbC9hc3BlbGwt
JHtQVn0udGFyLmd6IFwKLSAgICAgICAgICAgZmlsZTovL0NWRS0yMDE5LTI1MDUxLnBhdGNoIFwK
LSIKLVNSQ19VUklbbWQ1c3VtXSA9ICIwMTJmYTkyMDkyMDNhZTRlNWE2MWMyYTY2OGZkMTBlMyIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmOWI3N2U1MTUzMzRhNzUxYjJlNjBkYWFiNWRiMjM0OTll
MjZjOTIwOWY1ZTdiNzQ0M2IwNTIzNWFkMDIyNmYyIgorU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9
L2FzcGVsbC9hc3BlbGwtJHtQVn0udGFyLmd6IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ2ZGEx
MmIzNGQ0MmQ0NTdmYTYwNGU0MzVhZDQ4NGE3NGIyZWZmY2QxMjBmZjQwYWNkNmJiM2ZiMjg4N2Qy
MWIiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHW2N1cnNlc10gPSAiLS1l
bmFibGUtY3Vyc2VzLC0tZGlzYWJsZS1jdXJzZXMsbmN1cnNlcyIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2FzcGVsbC9maWxlcy9DVkUtMjAxOS0yNTA1MS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2FzcGVsbC9maWxlcy9DVkUtMjAxOS0yNTA1MS5wYXRjaApkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggODUxM2Y2ZGU3OS4uMDAwMDAwMDAwMAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9hc3BlbGwvZmlsZXMvQ1ZFLTIwMTktMjUwNTEucGF0Y2gKKysrIC9k
ZXYvbnVsbApAQCAtMSwxMDEgKzAsMCBAQAotRnJvbSAwNzE4YjM3NTQyNWFhZDhlNTRlMTE1MDMx
M2I4NjJlNGM2ZmQzMjRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2V2aW4gQXRr
aW5zb24gPGtldmluYUBnbnUub3JnPgotRGF0ZTogU2F0LCAyMSBEZWMgMjAxOSAyMDozMjo0NyAr
MDAwMAotU3ViamVjdDogW1BBVENIXSBvYmpzdGFjazogYXNzZXJ0IHRoYXQgdGhlIGFsbG9jIHNp
emUgd2lsbCBmaXQgd2l0aGluIGEgY2h1bmsKLSB0byBwcmV2ZW50IGEgYnVmZmVyIG92ZXJmbG93
Ci0KLUJ1ZyBmb3VuZCB1c2luZyBPU1MtRnV6ZS4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9y
dAotW2h0dHBzOi8vZ2l0aHViLmNvbS9nbnVhc3BlbGwvYXNwZWxsL2NvbW1pdC8wNzE4YjM3NTQy
NWFhZDhlNTRlMTE1MDMxM2I4NjJlNGM2ZmQzMjRhXQotQ1ZFOiBDVkUtMjAxOS0yNTA1MQotU2ln
bmVkLW9mZi1ieTogQ2hlZSBZYW5nIExlZSA8Y2hlZS55YW5nLmxlZUBpbnRlbC5jb20+Ci0tLS0K
LSBjb21tb24vb2Jqc3RhY2suaHBwIHwgMTggKysrKysrKysrKysrKystLS0tCi0gMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9j
b21tb24vb2Jqc3RhY2suaHBwIGIvY29tbW9uL29ianN0YWNrLmhwcAotaW5kZXggMzk5N2JmNy4u
YmQ5N2NjZCAxMDA2NDQKLS0tLSBhL2NvbW1vbi9vYmpzdGFjay5ocHAKLSsrKyBiL2NvbW1vbi9v
YmpzdGFjay5ocHAKLUBAIC01LDYgKzUsNyBAQAotICNpbmNsdWRlICJwYXJtX3N0cmluZy5ocHAi
Ci0gI2luY2x1ZGUgPHN0ZGxpYi5oPgotICNpbmNsdWRlIDxhc3NlcnQuaD4KLSsjaW5jbHVkZSA8
c3RkZGVmLmg+Ci0gCi0gbmFtZXNwYWNlIGFjb21tb24gewotIAotQEAgLTI2LDYgKzI3LDEyIEBA
IGNsYXNzIE9ialN0YWNrCi0gICBieXRlICogdGVtcF9lbmQ7Ci0gICB2b2lkIHNldHVwX2NodW5r
KCk7Ci0gICB2b2lkIG5ld19jaHVuaygpOwotKyAgYm9vbCB3aWxsX292ZXJmbG93KHNpemVfdCBz
eikgY29uc3QgewotKyAgICByZXR1cm4gb2Zmc2V0b2YoTm9kZSxkYXRhKSArIHN6ID4gY2h1bmtf
c2l6ZTsKLSsgIH0KLSsgIHZvaWQgY2hlY2tfc2l6ZShzaXplX3Qgc3opIHsKLSsgICAgYXNzZXJ0
KCF3aWxsX292ZXJmbG93KHN6KSk7Ci0rICB9Ci0gCi0gICBPYmpTdGFjayhjb25zdCBPYmpTdGFj
ayAmKTsKLSAgIHZvaWQgb3BlcmF0b3I9KGNvbnN0IE9ialN0YWNrICYpOwotQEAgLTU2LDcgKzYz
LDcgQEAgY2xhc3MgT2JqU3RhY2sKLSAgIHZvaWQgKiBhbGxvY19ib3R0b20oc2l6ZV90IHNpemUp
ICB7Ci0gICAgIGJ5dGUgKiB0bXAgPSBib3R0b207Ci0gICAgIGJvdHRvbSArPSBzaXplOwotLSAg
ICBpZiAoYm90dG9tID4gdG9wKSB7bmV3X2NodW5rKCk7IHRtcCA9IGJvdHRvbTsgYm90dG9tICs9
IHNpemU7fQotKyAgICBpZiAoYm90dG9tID4gdG9wKSB7Y2hlY2tfc2l6ZShzaXplKTsgbmV3X2No
dW5rKCk7IHRtcCA9IGJvdHRvbTsgYm90dG9tICs9IHNpemU7fQotICAgICByZXR1cm4gdG1wOwot
ICAgfQotICAgLy8gVGhpcyBhbGxvY19ib3R0b20gd2lsbCBpbnN1cmUgdGhhdCB0aGUgb2JqZWN0
IGlzIGFsaWduZWQgYmFzZWQgb24gdGhlCi1AQCAtNjYsNyArNzMsNyBAQCBjbGFzcyBPYmpTdGFj
awotICAgICBhbGlnbl9ib3R0b20oYWxpZ24pOwotICAgICBieXRlICogdG1wID0gYm90dG9tOwot
ICAgICBib3R0b20gKz0gc2l6ZTsKLS0gICAgaWYgKGJvdHRvbSA+IHRvcCkge25ld19jaHVuaygp
OyBnb3RvIGxvb3A7fQotKyAgICBpZiAoYm90dG9tID4gdG9wKSB7Y2hlY2tfc2l6ZShzaXplKTsg
bmV3X2NodW5rKCk7IGdvdG8gbG9vcDt9Ci0gICAgIHJldHVybiB0bXA7Ci0gICB9Ci0gICBjaGFy
ICogZHVwX2JvdHRvbShQYXJtU3RyaW5nIHN0cikgewotQEAgLTc5LDcgKzg2LDcgQEAgY2xhc3Mg
T2JqU3RhY2sKLSAgIC8vIGFsd2F5cyBiZSBhbGlnbmVkIGFzIHN1Y2guCi0gICB2b2lkICogYWxs
b2NfdG9wKHNpemVfdCBzaXplKSB7Ci0gICAgIHRvcCAtPSBzaXplOwotLSAgICBpZiAodG9wIDwg
Ym90dG9tKSB7bmV3X2NodW5rKCk7IHRvcCAtPSBzaXplO30KLSsgICAgaWYgKHRvcCA8IGJvdHRv
bSkge2NoZWNrX3NpemUoc2l6ZSk7IG5ld19jaHVuaygpOyB0b3AgLT0gc2l6ZTt9Ci0gICAgIHJl
dHVybiB0b3A7Ci0gICB9Ci0gICAvLyBUaGlzIGFsbG9jX3RvcCB3aWxsIGluc3VyZSB0aGF0IHRo
ZSBvYmplY3QgaXMgYWxpZ25lZCBiYXNlZCBvbgotQEAgLTg4LDcgKzk1LDcgQEAgY2xhc3MgT2Jq
U3RhY2sKLSAgIHtsb29wOgotICAgICB0b3AgLT0gc2l6ZTsKLSAgICAgYWxpZ25fdG9wKGFsaWdu
KTsKLS0gICAgaWYgKHRvcCA8IGJvdHRvbSkge25ld19jaHVuaygpOyBnb3RvIGxvb3A7fQotKyAg
ICBpZiAodG9wIDwgYm90dG9tKSB7Y2hlY2tfc2l6ZShzaXplKTsgbmV3X2NodW5rKCk7IGdvdG8g
bG9vcDt9Ci0gICAgIHJldHVybiB0b3A7Ci0gICB9Ci0gICBjaGFyICogZHVwX3RvcChQYXJtU3Ry
aW5nIHN0cikgewotQEAgLTExNyw2ICsxMjQsNyBAQCBjbGFzcyBPYmpTdGFjawotICAgdm9pZCAq
IGFsbG9jX3RlbXAoc2l6ZV90IHNpemUpIHsKLSAgICAgdGVtcF9lbmQgPSBib3R0b20gKyBzaXpl
OwotICAgICBpZiAodGVtcF9lbmQgPiB0b3ApIHsKLSsgICAgICBjaGVja19zaXplKHNpemUpOwot
ICAgICAgIG5ld19jaHVuaygpOwotICAgICAgIHRlbXBfZW5kID0gYm90dG9tICsgc2l6ZTsKLSAg
ICAgfQotQEAgLTEzMSw2ICsxMzksNyBAQCBjbGFzcyBPYmpTdGFjawotICAgICB9IGVsc2Ugewot
ICAgICAgIHNpemVfdCBzID0gdGVtcF9lbmQgLSBib3R0b207Ci0gICAgICAgYnl0ZSAqIHAgPSBi
b3R0b207Ci0rICAgICAgY2hlY2tfc2l6ZShzaXplKTsKLSAgICAgICBuZXdfY2h1bmsoKTsKLSAg
ICAgICBtZW1jcHkoYm90dG9tLCBwLCBzKTsKLSAgICAgICB0ZW1wX2VuZCA9IGJvdHRvbSArIHNp
emU7Ci1AQCAtMTUwLDYgKzE1OSw3IEBAIGNsYXNzIE9ialN0YWNrCi0gICAgIH0gZWxzZSB7Ci0g
ICAgICAgc2l6ZV90IHMgPSB0ZW1wX2VuZCAtIGJvdHRvbTsKLSAgICAgICBieXRlICogcCA9IGJv
dHRvbTsKLSsgICAgICBjaGVja19zaXplKHNpemUpOwotICAgICAgIG5ld19jaHVuaygpOwotICAg
ICAgIG1lbWNweShib3R0b20sIHAsIHMpOwotICAgICAgIHRlbXBfZW5kID0gYm90dG9tICsgc2l6
ZTsKLS0gCjIuNDIuMAoK

--===============1068416017517129369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/aspell/aspell-locale-fur: PKGSIZE changed from 24198 to 32589 (+35%)
packages/core2-64-poky-linux/aspell/aspell-locale-wa: PKGSIZE changed from 18099 to 22977 (+27%)
packages/core2-64-poky-linux/aspell: PACKAGES: added "aspell-locale-sq aspell-locale-hu aspell-locale-ka"

--===============1068416017517129369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/aspell/aspell-dbg: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-dbg: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-dbg: PKGSIZE changed from 8959472 to 8940936 (-0%)
packages/core2-64-poky-linux/aspell/aspell-dev: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-dev: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-doc: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-doc: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-doc: PKGSIZE changed from 345663 to 346563 (+0%)
packages/core2-64-poky-linux/aspell/aspell-locale-ast: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-ast: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-ast: PKGSIZE changed from 30928 to 30852 (-0%)
packages/core2-64-poky-linux/aspell/aspell-locale-be: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-be: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-be: PKGSIZE changed from 9310 to 9205 (-1%)
packages/core2-64-poky-linux/aspell/aspell-locale-ca: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-ca: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-ca: PKGSIZE changed from 30673 to 30584 (-0%)
packages/core2-64-poky-linux/aspell/aspell-locale-cs: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-cs: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-cs: PKGSIZE changed from 30659 to 32070 (+5%)
packages/core2-64-poky-linux/aspell/aspell-locale-da: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-da: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-da: PKGSIZE changed from 29986 to 31355 (+5%)
packages/core2-64-poky-linux/aspell/aspell-locale-de: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-de: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-de: PKGSIZE changed from 32845 to 32858 (+0%)
packages/core2-64-poky-linux/aspell/aspell-locale-en-gb: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-en-gb: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-en-gb: PKGSIZE changed from 26226 to 26132 (-0%)
packages/core2-64-poky-linux/aspell/aspell-locale-eo: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-eo: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-eo: PKGSIZE changed from 29718 to 31324 (+5%)
packages/core2-64-poky-linux/aspell/aspell-locale-es: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-es: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-es: PKGSIZE changed from 30467 to 32232 (+6%)
packages/core2-64-poky-linux/aspell/aspell-locale-fi: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-fi: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-fi: PKGSIZE changed from 30911 to 32401 (+5%)
packages/core2-64-poky-linux/aspell/aspell-locale-fr: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-fr: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-fr: PKGSIZE changed from 32102 to 32932 (+3%)
packages/core2-64-poky-linux/aspell/aspell-locale-fur: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-fur: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-fur: PKGSIZE changed from 24198 to 32589 (+35%)
packages/core2-64-poky-linux/aspell/aspell-locale-ga: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-ga: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-ga: PKGSIZE changed from 30781 to 30698 (-0%)
packages/core2-64-poky-linux/aspell/aspell-locale-hr: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-hr: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-hr: PKGSIZE changed from 31867 to 31922 (+0%)
packages/core2-64-poky-linux/aspell/aspell-locale-id: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-id: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-id: PKGSIZE changed from 30060 to 31842 (+6%)
packages/core2-64-poky-linux/aspell/aspell-locale-it: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-it: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-it: PKGSIZE changed from 30169 to 31860 (+6%)
packages/core2-64-poky-linux/aspell/aspell-locale-ja: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-ja: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-ja: PKGSIZE changed from 34430 to 34354 (-0%)
packages/core2-64-poky-linux/aspell/aspell-locale-mn: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-mn: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-mn: PKGSIZE changed from 33276 to 33168 (-0%)
packages/core2-64-poky-linux/aspell/aspell-locale-ms: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-ms: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-nl: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-nl: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-nl: PKGSIZE changed from 32310 to 32330 (+0%)
packages/core2-64-poky-linux/aspell/aspell-locale-pl: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-pl: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-pl: PKGSIZE changed from 31534 to 31539 (+0%)
packages/core2-64-poky-linux/aspell/aspell-locale-pt-br: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-pt-br: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-pt-br: PKGSIZE changed from 32121 to 32122 (+0%)
packages/core2-64-poky-linux/aspell/aspell-locale-pt: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-pt: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-pt: PKGSIZE changed from 31977 to 31779 (-1%)
packages/core2-64-poky-linux/aspell/aspell-locale-ro: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-ro: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-ro: PKGSIZE changed from 32793 to 33981 (+4%)
packages/core2-64-poky-linux/aspell/aspell-locale-ru: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-ru: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-ru: PKGSIZE changed from 39683 to 39450 (-1%)
packages/core2-64-poky-linux/aspell/aspell-locale-rw: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-rw: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-sk: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-sk: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-sk: PKGSIZE changed from 30536 to 30461 (-0%)
packages/core2-64-poky-linux/aspell/aspell-locale-sl: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-sl: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-sl: PKGSIZE changed from 31151 to 30957 (-1%)
packages/core2-64-poky-linux/aspell/aspell-locale-sr: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-sr: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-sr: PKGSIZE changed from 37265 to 39050 (+5%)
packages/core2-64-poky-linux/aspell/aspell-locale-sv: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-sv: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-sv: PKGSIZE changed from 30105 to 31481 (+5%)
packages/core2-64-poky-linux/aspell/aspell-locale-tg: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-tg: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-tg: PKGSIZE changed from 13679 to 13545 (-1%)
packages/core2-64-poky-linux/aspell/aspell-locale-uk: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-uk: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-uk: PKGSIZE changed from 39715 to 39721 (+0%)
packages/core2-64-poky-linux/aspell/aspell-locale-vi: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-vi: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-vi: PKGSIZE changed from 33670 to 33590 (-0%)
packages/core2-64-poky-linux/aspell/aspell-locale-wa: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-wa: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-wa: PKGSIZE changed from 18099 to 22977 (+27%)
packages/core2-64-poky-linux/aspell/aspell-locale-zh-cn: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-locale-zh-cn: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-locale-zh-cn: PKGSIZE changed from 29305 to 29111 (-1%)
packages/core2-64-poky-linux/aspell/aspell-src: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-src: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-src: PKGSIZE changed from 974326 to 974566 (+0%)
packages/core2-64-poky-linux/aspell/aspell-staticdev: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-staticdev: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell-utils: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell-utils: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/aspell: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/aspell: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell: PACKAGES: added "aspell-locale-sq aspell-locale-hu aspell-locale-ka"
packages/core2-64-poky-linux/aspell: SRC_URI changed from "https://ftp.gnu.org/gnu/aspell/aspell-0.60.8.tar.gz file://CVE-2019-25051.patch" to "https://ftp.gnu.org/gnu/aspell/aspell-0.60.8.1.tar.gz"
packages/core2-64-poky-linux/aspell: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/libaspell: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/libaspell: PV changed from "0.60.8" to "0.60.8.1"
packages/core2-64-poky-linux/aspell/libpspell: PKGV changed from 0.60.8 [default] to 0.60.8.1 [default]
packages/core2-64-poky-linux/aspell/libpspell: PV changed from "0.60.8" to "0.60.8.1"

--===============1068416017517129369==--

