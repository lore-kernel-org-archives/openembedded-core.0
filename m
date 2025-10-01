Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA5BCCD197
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.17940.1759325536278979541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SsmKr0TC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PgwxKyhd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101999ff93cc9-47d90b50-fa55-4452-bf7e-f53eae31088f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dqP74HyVlcFA74bcljvqjFnlPW2NKGE16lGGwGJwaok=;
	b=SsmKr0TCWLxh6Q6fOyfGLCdG6DYIfjH6VAOb72XwoFzYWbXqTt1FAiUKlnWfsCzH
	81MbyJMK8mUQqlz/qeRUHGb65lXDe9mUCGNbnHT/10QIfJIfqmm4KR/NaqYVhRKhukT
	iCka7600dnzoD26zPIturiCYttUjcr4hyOpIPsIg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dqP74HyVlcFA74bcljvqjFnlPW2NKGE16lGGwGJwaok=;
	b=PgwxKyhdSRFVOY1QmazpnH5E/GXo6KK8T/uV10aCb62dR5GetHLBkit1KrNqBF7Q
	GfNSlWMg8bbv59p8GBG37FJ5RsHTmR1ycLrtVPASgewLiERfgdvGL43Pim7hU52QmnG
	n2VfJm94Y3Oj1751jl/kpEyAc0MVBi902FGWPYIY=
Content-Type: multipart/mixed; boundary="===============2762368621325483584=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fmt: upgrading to 12.0.0 SUCCEEDED
Message-ID: <010101999ff93cc9-47d90b50-fa55-4452-bf7e-f53eae31088f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224226

--===============2762368621325483584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fmt* to *12.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fmt-upgrade-11.2.0-12.0.0.patch
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
From bf0482f9f4913da747c6ca63663a4c27fbb90816 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 08:33:41 +0000
Subject: [PATCH] fmt: upgrade 11.2.0 -> 12.0.0

---
 ...compilation-on-clang-21-libc-21-4477.patch | 46 -------------------
 ...01-Workaround-an-ABI-issue-in-spdlog.patch |  8 ++--
 .../fmt/{fmt_11.2.0.bb => fmt_12.0.0.bb}      |  5 +-
 3 files changed, 6 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch
 rename meta/recipes-devtools/fmt/{fmt_11.2.0.bb => fmt_12.0.0.bb} (79%)

diff --git a/meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch b/meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch
deleted file mode 100644
index 911fa90a40..0000000000
--- a/meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f4345467fce7edbc6b36c3fa1cf197a67be617e2 Mon Sep 17 00:00:00 2001
-From: Remy Jette <remy@remyjette.com>
-Date: Sat, 21 Jun 2025 07:28:14 -0700
-Subject: [PATCH] Fix compilation on clang-21 / libc++-21 (#4477)
-
-`<cstdlib>` was not being included, so malloc and free were only declared
-via transitive includes. Some includes changed in the latest libc++-21
-build which broke fmt.
-
-Also changed `malloc`/`free` to `std::malloc` and `std::free`, as
-putting those symbols in the global namespace is optional for the
-implementation when including `<cstdlib>`.
-
-Upstream-Status: Backport [https://github.com/fmtlib/fmt/pull/4477]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/fmt/format.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-Index: fmt-11.2.0/include/fmt/format.h
-===================================================================
---- fmt-11.2.0.orig/include/fmt/format.h
-+++ fmt-11.2.0/include/fmt/format.h
-@@ -44,6 +44,7 @@
- #  include <cmath>    // std::signbit
- #  include <cstddef>  // std::byte
- #  include <cstdint>  // uint32_t
-+#  include <cstdlib>  // std::malloc, std::free
- #  include <cstring>  // std::memcpy
- #  include <limits>   // std::numeric_limits
- #  include <new>      // std::bad_alloc
-@@ -744,12 +745,12 @@ template <typename T> struct allocator {
- 
-   T* allocate(size_t n) {
-     FMT_ASSERT(n <= max_value<size_t>() / sizeof(T), "");
--    T* p = static_cast<T*>(malloc(n * sizeof(T)));
-+    T* p = static_cast<T*>(std::malloc(n * sizeof(T)));
-     if (!p) FMT_THROW(std::bad_alloc());
-     return p;
-   }
- 
--  void deallocate(T* p, size_t) { free(p); }
-+  void deallocate(T* p, size_t) { std::free(p); }
- };
- 
- }  // namespace detail
diff --git a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
index 3fe85d51ee..b204676602 100644
--- a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
+++ b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
@@ -1,4 +1,4 @@
-From 5a5637c306c617ddb3726c76d3f7490a2dc0a5cd Mon Sep 17 00:00:00 2001
+From fe33ca62b3600676afce954e05c5c338358b8f03 Mon Sep 17 00:00:00 2001
 From: Victor Zverovich <viz@meta.com>
 Date: Sat, 22 Mar 2025 06:57:04 -0700
 Subject: [PATCH] Workaround an ABI issue in spdlog
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/include/fmt/format.h b/include/fmt/format.h
-index 287e7163..61cb2825 100644
+index c3a1bda0..1a1fd9d0 100644
 --- a/include/fmt/format.h
 +++ b/include/fmt/format.h
-@@ -774,7 +774,9 @@ enum { inline_buffer_size = 500 };
+@@ -781,7 +781,9 @@ enum { inline_buffer_size = 500 };
   * converted to `std::string` with `to_string(out)`.
   */
  template <typename T, size_t SIZE = inline_buffer_size,
@@ -24,7 +24,7 @@ index 287e7163..61cb2825 100644
  class basic_memory_buffer : public detail::buffer<T> {
   private:
    T store_[SIZE];
-@@ -2594,7 +2596,7 @@ class bigint {
+@@ -2734,7 +2736,7 @@ class bigint {
    }
  
   public:
diff --git a/meta/recipes-devtools/fmt/fmt_11.2.0.bb b/meta/recipes-devtools/fmt/fmt_12.0.0.bb
similarity index 79%
rename from meta/recipes-devtools/fmt/fmt_11.2.0.bb
rename to meta/recipes-devtools/fmt/fmt_12.0.0.bb
index fd5dc0c4ab..54e1bd8f3a 100644
--- a/meta/recipes-devtools/fmt/fmt_11.2.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_12.0.0.bb
@@ -4,11 +4,10 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV}\
+SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV} \
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch \
-           file://0001-Fix-compilation-on-clang-21-libc-21-4477.patch \
            "
-SRCREV = "40626af88bd7df9a5fb80be7b25ac85b122d6c21"
+SRCREV = "e424e3f2e607da02742f73db84873b8084fc714c"
 
 inherit cmake
 
-- 
2.47.1


--===============2762368621325483584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fmt/fmt-dbg: PV changed from "11.2.0" to "12.0.0"
packages/x86-64-v3-poky-linux/fmt/fmt-dbg: PKGV changed from 11.2.0 [default] to 12.0.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-dbg: PKGSIZE changed from 1146000 to 1216336 (+6%)
packages/x86-64-v3-poky-linux/fmt/fmt-dbg: FILELIST: removed "/usr/lib/.debug/libfmt.so.11.2.0", added "/usr/lib/.debug/libfmt.so.12.0.0"
packages/x86-64-v3-poky-linux/fmt/fmt-dev: PV changed from "11.2.0" to "12.0.0"
packages/x86-64-v3-poky-linux/fmt/fmt-dev: PKGV changed from 11.2.0 [default] to 12.0.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-dev: PKGSIZE changed from 584573 to 588252 (+1%)
packages/x86-64-v3-poky-linux/fmt/fmt-doc: PV changed from "11.2.0" to "12.0.0"
packages/x86-64-v3-poky-linux/fmt/fmt-doc: PKGV changed from 11.2.0 [default] to 12.0.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-locale: PV changed from "11.2.0" to "12.0.0"
packages/x86-64-v3-poky-linux/fmt/fmt-locale: PKGV changed from 11.2.0 [default] to 12.0.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-src: PV changed from "11.2.0" to "12.0.0"
packages/x86-64-v3-poky-linux/fmt/fmt-src: PKGV changed from 11.2.0 [default] to 12.0.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-src: PKGSIZE changed from 368467 to 373654 (+1%)
packages/x86-64-v3-poky-linux/fmt/fmt-staticdev: PV changed from "11.2.0" to "12.0.0"
packages/x86-64-v3-poky-linux/fmt/fmt-staticdev: PKGV changed from 11.2.0 [default] to 12.0.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt: PKG changed from libfmt11 to libfmt12
packages/x86-64-v3-poky-linux/fmt/fmt: PV changed from "11.2.0" to "12.0.0"
packages/x86-64-v3-poky-linux/fmt/fmt: PKGV changed from 11.2.0 [default] to 12.0.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt: PKGSIZE changed from 133192 to 141384 (+6%)
packages/x86-64-v3-poky-linux/fmt/fmt: FILELIST: removed "/usr/lib/libfmt.so.11.2.0 /usr/lib/libfmt.so.11", added "/usr/lib/libfmt.so.12 /usr/lib/libfmt.so.12.0.0"
packages/x86-64-v3-poky-linux/fmt: SRC_URI changed from "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=11.2.0 file://0001-Workaround-an-ABI-issue-in-spdlog.patch file://0001-Fix-compilation-on-clang-21-libc-21-4477.patch" to "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=12.0.0 file://0001-Workaround-an-ABI-issue-in-spdlog.patch"
packages/x86-64-v3-poky-linux/fmt: PV changed from "11.2.0" to "12.0.0"
packages/x86-64-v3-poky-linux/fmt: PKGV changed from 11.2.0 [default] to 12.0.0 [default]
Changes to packages/x86-64-v3-poky-linux/fmt (sysroot):
  /usr/lib/libfmt.so changed symlink target from libfmt.so.11 to libfmt.so.12
  /usr/lib/libfmt.so.11.2.0 moved to /usr/lib/libfmt.so.12.0.0
  /usr/lib/libfmt.so.11 moved to /usr/lib/libfmt.so.12

--===============2762368621325483584==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fmt-upgrade-11.2.0-12.0.0.patch"

RnJvbSBiZjA0ODJmOWY0OTEzZGE3NDdjNmNhNjM2NjNhNGMyN2ZiYjkwODE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwODozMzo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZt
dDogdXBncmFkZSAxMS4yLjAgLT4gMTIuMC4wCgotLS0KIC4uLmNvbXBpbGF0aW9uLW9uLWNsYW5n
LTIxLWxpYmMtMjEtNDQ3Ny5wYXRjaCB8IDQ2IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLjAxLVdv
cmthcm91bmQtYW4tQUJJLWlzc3VlLWluLXNwZGxvZy5wYXRjaCB8ICA4ICsrLS0KIC4uLi9mbXQv
e2ZtdF8xMS4yLjAuYmIgPT4gZm10XzEyLjAuMC5iYn0gICAgICB8ICA1ICstCiAzIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXQvMDAwMS1GaXgtY29tcGlsYXRpb24tb24t
Y2xhbmctMjEtbGliYy0yMS00NDc3LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2ZtdC97Zm10XzExLjIuMC5iYiA9PiBmbXRfMTIuMC4wLmJifSAoNzklKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10LzAwMDEtRml4LWNvbXBpbGF0aW9uLW9uLWNs
YW5nLTIxLWxpYmMtMjEtNDQ3Ny5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10
LzAwMDEtRml4LWNvbXBpbGF0aW9uLW9uLWNsYW5nLTIxLWxpYmMtMjEtNDQ3Ny5wYXRjaApkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggOTExZmE5MGE0MC4uMDAwMDAwMDAwMAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdC8wMDAxLUZpeC1jb21waWxhdGlvbi1vbi1jbGFu
Zy0yMS1saWJjLTIxLTQ0NzcucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0NiArMCwwIEBACi1G
cm9tIGY0MzQ1NDY3ZmNlN2VkYmM2YjM2YzNmYTFjZjE5N2E2N2JlNjE3ZTIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCi1Gcm9tOiBSZW15IEpldHRlIDxyZW15QHJlbXlqZXR0ZS5jb20+Ci1EYXRl
OiBTYXQsIDIxIEp1biAyMDI1IDA3OjI4OjE0IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIEZpeCBj
b21waWxhdGlvbiBvbiBjbGFuZy0yMSAvIGxpYmMrKy0yMSAoIzQ0NzcpCi0KLWA8Y3N0ZGxpYj5g
IHdhcyBub3QgYmVpbmcgaW5jbHVkZWQsIHNvIG1hbGxvYyBhbmQgZnJlZSB3ZXJlIG9ubHkgZGVj
bGFyZWQKLXZpYSB0cmFuc2l0aXZlIGluY2x1ZGVzLiBTb21lIGluY2x1ZGVzIGNoYW5nZWQgaW4g
dGhlIGxhdGVzdCBsaWJjKystMjEKLWJ1aWxkIHdoaWNoIGJyb2tlIGZtdC4KLQotQWxzbyBjaGFu
Z2VkIGBtYWxsb2NgL2BmcmVlYCB0byBgc3RkOjptYWxsb2NgIGFuZCBgc3RkOjpmcmVlYCwgYXMK
LXB1dHRpbmcgdGhvc2Ugc3ltYm9scyBpbiB0aGUgZ2xvYmFsIG5hbWVzcGFjZSBpcyBvcHRpb25h
bCBmb3IgdGhlCi1pbXBsZW1lbnRhdGlvbiB3aGVuIGluY2x1ZGluZyBgPGNzdGRsaWI+YC4KLQot
VXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL2ZtdGxpYi9mbXQv
cHVsbC80NDc3XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
LS0tLQotIGluY2x1ZGUvZm10L2Zvcm1hdC5oIHwgNSArKystLQotIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0KLUluZGV4OiBmbXQtMTEuMi4wL2luY2x1
ZGUvZm10L2Zvcm1hdC5oCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gZm10LTExLjIuMC5vcmlnL2luY2x1ZGUv
Zm10L2Zvcm1hdC5oCi0rKysgZm10LTExLjIuMC9pbmNsdWRlL2ZtdC9mb3JtYXQuaAotQEAgLTQ0
LDYgKzQ0LDcgQEAKLSAjICBpbmNsdWRlIDxjbWF0aD4gICAgLy8gc3RkOjpzaWduYml0Ci0gIyAg
aW5jbHVkZSA8Y3N0ZGRlZj4gIC8vIHN0ZDo6Ynl0ZQotICMgIGluY2x1ZGUgPGNzdGRpbnQ+ICAv
LyB1aW50MzJfdAotKyMgIGluY2x1ZGUgPGNzdGRsaWI+ICAvLyBzdGQ6Om1hbGxvYywgc3RkOjpm
cmVlCi0gIyAgaW5jbHVkZSA8Y3N0cmluZz4gIC8vIHN0ZDo6bWVtY3B5Ci0gIyAgaW5jbHVkZSA8
bGltaXRzPiAgIC8vIHN0ZDo6bnVtZXJpY19saW1pdHMKLSAjICBpbmNsdWRlIDxuZXc+ICAgICAg
Ly8gc3RkOjpiYWRfYWxsb2MKLUBAIC03NDQsMTIgKzc0NSwxMiBAQCB0ZW1wbGF0ZSA8dHlwZW5h
bWUgVD4gc3RydWN0IGFsbG9jYXRvciB7Ci0gCi0gICBUKiBhbGxvY2F0ZShzaXplX3Qgbikgewot
ICAgICBGTVRfQVNTRVJUKG4gPD0gbWF4X3ZhbHVlPHNpemVfdD4oKSAvIHNpemVvZihUKSwgIiIp
OwotLSAgICBUKiBwID0gc3RhdGljX2Nhc3Q8VCo+KG1hbGxvYyhuICogc2l6ZW9mKFQpKSk7Ci0r
ICAgIFQqIHAgPSBzdGF0aWNfY2FzdDxUKj4oc3RkOjptYWxsb2MobiAqIHNpemVvZihUKSkpOwot
ICAgICBpZiAoIXApIEZNVF9USFJPVyhzdGQ6OmJhZF9hbGxvYygpKTsKLSAgICAgcmV0dXJuIHA7
Ci0gICB9Ci0gCi0tICB2b2lkIGRlYWxsb2NhdGUoVCogcCwgc2l6ZV90KSB7IGZyZWUocCk7IH0K
LSsgIHZvaWQgZGVhbGxvY2F0ZShUKiBwLCBzaXplX3QpIHsgc3RkOjpmcmVlKHApOyB9Ci0gfTsK
LSAKLSB9ICAvLyBuYW1lc3BhY2UgZGV0YWlsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZm10L2ZtdC8wMDAxLVdvcmthcm91bmQtYW4tQUJJLWlzc3VlLWluLXNwZGxvZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10LzAwMDEtV29ya2Fyb3VuZC1hbi1BQkkt
aXNzdWUtaW4tc3BkbG9nLnBhdGNoCmluZGV4IDNmZTg1ZDUxZWUuLmIyMDQ2NzY2MDIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10LzAwMDEtV29ya2Fyb3VuZC1hbi1B
QkktaXNzdWUtaW4tc3BkbG9nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQv
Zm10LzAwMDEtV29ya2Fyb3VuZC1hbi1BQkktaXNzdWUtaW4tc3BkbG9nLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA1YTU2MzdjMzA2YzYxN2RkYjM3MjZjNzZkM2Y3NDkwYTJkYzBhNWNkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmZTMzY2E2MmIzNjAwNjc2YWZjZTk1NGUwNWM1
YzMzODM1OGI4ZjAzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVmljdG9yIFp2ZXJv
dmljaCA8dml6QG1ldGEuY29tPgogRGF0ZTogU2F0LCAyMiBNYXIgMjAyNSAwNjo1NzowNCAtMDcw
MAogU3ViamVjdDogW1BBVENIXSBXb3JrYXJvdW5kIGFuIEFCSSBpc3N1ZSBpbiBzcGRsb2cKQEAg
LTEwLDEwICsxMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAK
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2ZtdC9mb3JtYXQuaCBiL2luY2x1ZGUvZm10L2Zvcm1hdC5o
Ci1pbmRleCAyODdlNzE2My4uNjFjYjI4MjUgMTAwNjQ0CitpbmRleCBjM2ExYmRhMC4uMWExZmQ5
ZDAgMTAwNjQ0CiAtLS0gYS9pbmNsdWRlL2ZtdC9mb3JtYXQuaAogKysrIGIvaW5jbHVkZS9mbXQv
Zm9ybWF0LmgKLUBAIC03NzQsNyArNzc0LDkgQEAgZW51bSB7IGlubGluZV9idWZmZXJfc2l6ZSA9
IDUwMCB9OworQEAgLTc4MSw3ICs3ODEsOSBAQCBlbnVtIHsgaW5saW5lX2J1ZmZlcl9zaXplID0g
NTAwIH07CiAgICogY29udmVydGVkIHRvIGBzdGQ6OnN0cmluZ2Agd2l0aCBgdG9fc3RyaW5nKG91
dClgLgogICAqLwogIHRlbXBsYXRlIDx0eXBlbmFtZSBULCBzaXplX3QgU0laRSA9IGlubGluZV9i
dWZmZXJfc2l6ZSwKQEAgLTI0LDcgKzI0LDcgQEAgaW5kZXggMjg3ZTcxNjMuLjYxY2IyODI1IDEw
MDY0NAogIGNsYXNzIGJhc2ljX21lbW9yeV9idWZmZXIgOiBwdWJsaWMgZGV0YWlsOjpidWZmZXI8
VD4gewogICBwcml2YXRlOgogICAgVCBzdG9yZV9bU0laRV07Ci1AQCAtMjU5NCw3ICsyNTk2LDcg
QEAgY2xhc3MgYmlnaW50IHsKK0BAIC0yNzM0LDcgKzI3MzYsNyBAQCBjbGFzcyBiaWdpbnQgewog
ICAgfQogIAogICBwdWJsaWM6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10
L2ZtdF8xMS4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8xMi4wLjAuYmIK
c2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Zt
dC9mbXRfMTEuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8x
Mi4wLjAuYmIKaW5kZXggZmQ1ZGMwYzRhYi4uNTRlMWJkOGYzYSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9mbXQvZm10XzEyLjAuMC5iYgpAQCAtNCwxMSArNCwxMCBAQCBIT01FUEFHRSA9ICJodHRw
czovL2ZtdC5kZXYiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PWI5MjU3Nzg1ZmM0ZjM4MDNhNGI3MWI3NmMxNDEyNzI5IgogCi1TUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vZm10bGliL2ZtdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0
dHBzO3RhZz0ke1BWfVwKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9mbXRsaWIvZm10O2Jy
YW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHM7dGFnPSR7UFZ9IFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtV29ya2Fyb3VuZC1hbi1BQkktaXNzdWUtaW4tc3BkbG9nLnBhdGNoIFwKLSAgICAgICAg
ICAgZmlsZTovLzAwMDEtRml4LWNvbXBpbGF0aW9uLW9uLWNsYW5nLTIxLWxpYmMtMjEtNDQ3Ny5w
YXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICI0MDYyNmFmODhiZDdkZjlhNWZiODBiZTdi
MjVhYzg1YjEyMmQ2YzIxIgorU1JDUkVWID0gImU0MjRlM2YyZTYwN2RhMDI3NDJmNzNkYjg0ODcz
YjgwODRmYzcxNGMiCiAKIGluaGVyaXQgY21ha2UKIAotLSAKMi40Ny4xCgo=

--===============2762368621325483584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/fmt/fmt: PKG changed from libfmt11 to libfmt12
packages/x86-64-v3-poky-linux/fmt/fmt: FILELIST: removed "/usr/lib/libfmt.so.11 /usr/lib/libfmt.so.11.2.0", added "/usr/lib/libfmt.so.12.0.0 /usr/lib/libfmt.so.12"
Changes to packages/x86-64-v3-poky-linux/fmt (sysroot):
  /usr/lib/libfmt.so changed symlink target from libfmt.so.11 to libfmt.so.12
  /usr/lib/libfmt.so.11.2.0 moved to /usr/lib/libfmt.so.12.0.0
  /usr/lib/libfmt.so.11 moved to /usr/lib/libfmt.so.12

--===============2762368621325483584==--

