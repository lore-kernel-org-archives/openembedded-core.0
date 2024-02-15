Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6136C5475B
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:30 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20349.1708018347879297757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OGq2EqZp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nY0wprP6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd3ad73-21049f37-a985-4eee-a2e6-9c95a0a13b7e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q9kHPYw8igBKjsClabcnOM+UY2092+ena+p7fPUOOhA=;
	b=OGq2EqZpyHLQLOYPrNyHi27QwHFfPk3F1b5Yj/UA03UTkpRYF96ddZILAcjxgfBK
	SDmfeWHQeIK0KjuoK18H9gaZChNkp6PFkqS0ZS6B4ZiT+OWE2tuOvGZhD5YPbgRMczN
	psxNLMDMsQvHXpvutbnQXZ9x61h2YHfCZ2Z1f9lU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q9kHPYw8igBKjsClabcnOM+UY2092+ena+p7fPUOOhA=;
	b=nY0wprP6da6khcAabqSsFiMkOJuRrN/Kpy3nkb71O70ASQpyJK7DkIHLepT4PlXe
	n8dyhX5Orlsv7eLYV4i6iKGV/tvOLOJMAbG+y9D0lFMsPYpf3Dw2vdXinR6gMczAAEK
	8fnWebskJXN9IGtZAc7VNYfqN4PkL+seyj5xcCYc=
Content-Type: multipart/mixed; boundary="===============2247674572989418173=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libusb1: upgrading to 1.0.27 FAILED
Message-ID: <0101018dadd3ad73-21049f37-a985-4eee-a2e6-9c95a0a13b7e-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195676

--===============2247674572989418173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libusb1* to *1.0.27* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libusb1-upgrade-1.0.26-1.0.27.patch
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
From 95b00d25e1be62244b8dc97db0187821640a5a6e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 17:19:13 +0000
Subject: [PATCH] libusb1: upgrade 1.0.26 -> 1.0.27

---
 ...k-with-latomic-only-if-no-atomic-bui.patch | 46 -------------------
 .../{libusb1_1.0.26.bb => libusb1_1.0.27.bb}  |  5 +-
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
 rename meta/recipes-support/libusb/{libusb1_1.0.26.bb => libusb1_1.0.27.bb} (87%)

diff --git a/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch b/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
deleted file mode 100644
index 3c223e0822..0000000000
--- a/meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 95e601ce116dd46ea7915c171976b85ea0905d58 Mon Sep 17 00:00:00 2001
-From: Lonnie Abelbeck <lonnie@abelbeck.com>
-Date: Sun, 8 May 2022 14:05:56 -0500
-Subject: [PATCH] configure.ac: Link with -latomic only if no atomic builtins
-
-Follow-up to 561dbda, a check of GCC atomic builtins needs to be done
-first.
-
-I'm no autoconf guru, but using this:
-https://github.com/mesa3d/mesa/blob/0df485c285b73c34ba9062f0c27e55c3c702930d/configure.ac#L469
-as inspiration, I created a pre-check before calling AC_SEARCH_LIBS(...)
-
-Fixes #1135
-Closes #1139
-Upstream-Status: Backport [https://github.com/kraj/libusb/commit/95e601ce116dd46ea7915c171976b85ea0905d58]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac          | 16 +++++++++++++++-
- libusb/version_nano.h |  2 +-
- 2 files changed, 16 insertions(+), 2 deletions(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -153,7 +153,21 @@ if test "x$platform" = xposix; then
- 	AC_SEARCH_LIBS([pthread_create], [pthread],
- 		[test "x$ac_cv_search_pthread_create" != "xnone required" && AC_SUBST(THREAD_LIBS, [-lpthread])],
- 		[], [])
--	AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
-+	dnl Check for new-style atomic builtins. We first check without linking to -latomic.
-+	AC_MSG_CHECKING(whether __atomic_load_n is supported)
-+	AC_LINK_IFELSE([AC_LANG_SOURCE([[
-+	#include <stdint.h>
-+	int main() {
-+		struct {
-+			uint64_t *v;
-+		} x;
-+		return (int)__atomic_load_n(x.v, __ATOMIC_ACQUIRE) &
-+		       (int)__atomic_add_fetch(x.v, (uint64_t)1, __ATOMIC_ACQ_REL);
-+	}]])], GCC_ATOMIC_BUILTINS_SUPPORTED=yes, GCC_ATOMIC_BUILTINS_SUPPORTED=no)
-+	AC_MSG_RESULT($GCC_ATOMIC_BUILTINS_SUPPORTED)
-+	if test "x$GCC_ATOMIC_BUILTINS_SUPPORTED" != xyes; then
-+		AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
-+	fi
- elif test "x$platform" = xwindows; then
- 	AC_DEFINE([PLATFORM_WINDOWS], [1], [Define to 1 if compiling for a Windows platform.])
- else
diff --git a/meta/recipes-support/libusb/libusb1_1.0.26.bb b/meta/recipes-support/libusb/libusb1_1.0.27.bb
similarity index 87%
rename from meta/recipes-support/libusb/libusb1_1.0.26.bb
rename to meta/recipes-support/libusb/libusb1_1.0.27.bb
index 2af6fcdea7..f4af2bb977 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.26.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.27.bb
@@ -11,14 +11,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
-           file://0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch \
            file://run-ptest \
-          "
+           "
 
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5"
+SRC_URI[sha256sum] = "ffaa41d741a8a3bee244ac8e54a72ea05bf2879663c098c82fc5757853441575"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
2.42.0


--===============2247674572989418173==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libusb1-upgrade-1.0.26-1.0.27.patch"

RnJvbSA5NWIwMGQyNWUxYmU2MjI0NGI4ZGM5N2RiMDE4NzgyMTY0MGE1YTZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTc6MTk6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1c2IxOiB1cGdyYWRlIDEuMC4yNiAtPiAxLjAuMjcKCi0tLQogLi4uay13aXRoLWxhdG9taWMt
b25seS1pZi1uby1hdG9taWMtYnVpLnBhdGNoIHwgNDYgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
L3tsaWJ1c2IxXzEuMC4yNi5iYiA9PiBsaWJ1c2IxXzEuMC4yNy5iYn0gIHwgIDUgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1c2IvbGlidXNiMS8wMDAxLWNvbmZpZ3Vy
ZS5hYy1MaW5rLXdpdGgtbGF0b21pYy1vbmx5LWlmLW5vLWF0b21pYy1idWkucGF0Y2gKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1c2Ive2xpYnVzYjFfMS4wLjI2LmJiID0+IGxpYnVz
YjFfMS4wLjI3LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnVzYi9saWJ1c2IxLzAwMDEtY29uZmlndXJlLmFjLUxpbmstd2l0aC1sYXRvbWljLW9ubHktaWYt
bm8tYXRvbWljLWJ1aS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVzYi9saWJ1c2Ix
LzAwMDEtY29uZmlndXJlLmFjLUxpbmstd2l0aC1sYXRvbWljLW9ubHktaWYtbm8tYXRvbWljLWJ1
aS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggM2MyMjNlMDgyMi4uMDAwMDAw
MDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1c2IvbGlidXNiMS8wMDAxLWNvbmZp
Z3VyZS5hYy1MaW5rLXdpdGgtbGF0b21pYy1vbmx5LWlmLW5vLWF0b21pYy1idWkucGF0Y2gKKysr
IC9kZXYvbnVsbApAQCAtMSw0NiArMCwwIEBACi1Gcm9tIDk1ZTYwMWNlMTE2ZGQ0NmVhNzkxNWMx
NzE5NzZiODVlYTA5MDVkNTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBMb25uaWUg
QWJlbGJlY2sgPGxvbm5pZUBhYmVsYmVjay5jb20+Ci1EYXRlOiBTdW4sIDggTWF5IDIwMjIgMTQ6
MDU6NTYgLTA1MDAKLVN1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlLmFjOiBMaW5rIHdpdGggLWxh
dG9taWMgb25seSBpZiBubyBhdG9taWMgYnVpbHRpbnMKLQotRm9sbG93LXVwIHRvIDU2MWRiZGEs
IGEgY2hlY2sgb2YgR0NDIGF0b21pYyBidWlsdGlucyBuZWVkcyB0byBiZSBkb25lCi1maXJzdC4K
LQotSSdtIG5vIGF1dG9jb25mIGd1cnUsIGJ1dCB1c2luZyB0aGlzOgotaHR0cHM6Ly9naXRodWIu
Y29tL21lc2EzZC9tZXNhL2Jsb2IvMGRmNDg1YzI4NWI3M2MzNGJhOTA2MmYwYzI3ZTU1YzNjNzAy
OTMwZC9jb25maWd1cmUuYWMjTDQ2OQotYXMgaW5zcGlyYXRpb24sIEkgY3JlYXRlZCBhIHByZS1j
aGVjayBiZWZvcmUgY2FsbGluZyBBQ19TRUFSQ0hfTElCUyguLi4pCi0KLUZpeGVzICMxMTM1Ci1D
bG9zZXMgIzExMzkKLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNv
bS9rcmFqL2xpYnVzYi9jb21taXQvOTVlNjAxY2UxMTZkZDQ2ZWE3OTE1YzE3MTk3NmI4NWVhMDkw
NWQ1OF0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0K
LSBjb25maWd1cmUuYWMgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKystCi0gbGlidXNiL3Zl
cnNpb25fbmFuby5oIHwgIDIgKy0KLSAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCi0KLS0tLSBhL2NvbmZpZ3VyZS5hYwotKysrIGIvY29uZmlndXJlLmFj
Ci1AQCAtMTUzLDcgKzE1MywyMSBAQCBpZiB0ZXN0ICJ4JHBsYXRmb3JtIiA9IHhwb3NpeDsgdGhl
bgotIAlBQ19TRUFSQ0hfTElCUyhbcHRocmVhZF9jcmVhdGVdLCBbcHRocmVhZF0sCi0gCQlbdGVz
dCAieCRhY19jdl9zZWFyY2hfcHRocmVhZF9jcmVhdGUiICE9ICJ4bm9uZSByZXF1aXJlZCIgJiYg
QUNfU1VCU1QoVEhSRUFEX0xJQlMsIFstbHB0aHJlYWRdKV0sCi0gCQlbXSwgW10pCi0tCUFDX1NF
QVJDSF9MSUJTKFtfX2F0b21pY19mZXRjaF9hZGRfNF0sIFthdG9taWNdKQotKwlkbmwgQ2hlY2sg
Zm9yIG5ldy1zdHlsZSBhdG9taWMgYnVpbHRpbnMuIFdlIGZpcnN0IGNoZWNrIHdpdGhvdXQgbGlu
a2luZyB0byAtbGF0b21pYy4KLSsJQUNfTVNHX0NIRUNLSU5HKHdoZXRoZXIgX19hdG9taWNfbG9h
ZF9uIGlzIHN1cHBvcnRlZCkKLSsJQUNfTElOS19JRkVMU0UoW0FDX0xBTkdfU09VUkNFKFtbCi0r
CSNpbmNsdWRlIDxzdGRpbnQuaD4KLSsJaW50IG1haW4oKSB7Ci0rCQlzdHJ1Y3QgewotKwkJCXVp
bnQ2NF90ICp2OwotKwkJfSB4OwotKwkJcmV0dXJuIChpbnQpX19hdG9taWNfbG9hZF9uKHgudiwg
X19BVE9NSUNfQUNRVUlSRSkgJgotKwkJICAgICAgIChpbnQpX19hdG9taWNfYWRkX2ZldGNoKHgu
diwgKHVpbnQ2NF90KTEsIF9fQVRPTUlDX0FDUV9SRUwpOwotKwl9XV0pXSwgR0NDX0FUT01JQ19C
VUlMVElOU19TVVBQT1JURUQ9eWVzLCBHQ0NfQVRPTUlDX0JVSUxUSU5TX1NVUFBPUlRFRD1ubykK
LSsJQUNfTVNHX1JFU1VMVCgkR0NDX0FUT01JQ19CVUlMVElOU19TVVBQT1JURUQpCi0rCWlmIHRl
c3QgIngkR0NDX0FUT01JQ19CVUlMVElOU19TVVBQT1JURUQiICE9IHh5ZXM7IHRoZW4KLSsJCUFD
X1NFQVJDSF9MSUJTKFtfX2F0b21pY19mZXRjaF9hZGRfNF0sIFthdG9taWNdKQotKwlmaQotIGVs
aWYgdGVzdCAieCRwbGF0Zm9ybSIgPSB4d2luZG93czsgdGhlbgotIAlBQ19ERUZJTkUoW1BMQVRG
T1JNX1dJTkRPV1NdLCBbMV0sIFtEZWZpbmUgdG8gMSBpZiBjb21waWxpbmcgZm9yIGEgV2luZG93
cyBwbGF0Zm9ybS5dKQotIGVsc2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnVzYi9saWJ1c2IxXzEuMC4yNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVzYi9saWJ1
c2IxXzEuMC4yNy5iYgpzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJ1c2IvbGlidXNiMV8xLjAuMjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYnVzYi9saWJ1c2IxXzEuMC4yNy5iYgppbmRleCAyYWY2ZmNkZWE3Li5mNGFm
MmJiOTc3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1c2IvbGlidXNiMV8x
LjAuMjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXNiL2xpYnVzYjFfMS4wLjI3
LmJiCkBAIC0xMSwxNCArMTEsMTMgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlO
RzttZDU9ZmJjMDkzOTAxODU3ZmNkMTE4ZjA2NWY5MDA5ODJjMjQiCiBCQkNMQVNTRVhURU5EID0g
Im5hdGl2ZSBuYXRpdmVzZGsiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25s
b2FkL3Yke1BWfS9saWJ1c2ItJHtQVn0udGFyLmJ6MiBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAx
LWNvbmZpZ3VyZS5hYy1MaW5rLXdpdGgtbGF0b21pYy1vbmx5LWlmLW5vLWF0b21pYy1idWkucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKLSAgICAgICAgICAiCisgICAgICAg
ICAgICIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9saWJ1c2IvbGli
dXNiL3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvdGFnL3Y/KD9Q
PHB2ZXI+XGQrKFwuXGQrKSspJCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEyY2U3YTYxZmM5
ODU0ZDFkMmExZmZlMDk1ZjdiNWZhYzE5ZGRiYTA5NWMyNTllNjA2N2E0NjUwMDM4MWI1YTUiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZmZhYTQxZDc0MWE4YTNiZWUyNDRhYzhlNTRhNzJlYTA1YmYy
ODc5NjYzYzA5OGM4MmZjNTc1Nzg1MzQ0MTU3NSIKIAogUyA9ICIke1dPUktESVJ9L2xpYnVzYi0k
e1BWfSIKIAotLSAKMi40Mi4wCgo=

--===============2247674572989418173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1860 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3e2d5176f0810122eed3bf82f704a195b31cc16f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3e2d5176f0810122eed3bf82f704a195b31cc16f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 272 Local 262 Mirrors 0 Missed 10 Current 420 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 435 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 442 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_lic_setscene)
NOTE: Running setscene task 444 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_lic_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_255.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 530 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_255.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 658 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 660 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1110 of 1931 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 663 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1111 of 1931 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_unpack)
NOTE: Running setscene task 665 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 669 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Succeeded
NOTE: Running task 1119 of 1931 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 676 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 678 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 692 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1755 of 1931 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1910 of 1931 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1916 of 1931 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure)
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Succeeded
NOTE: Running task 1917 of 1931 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1918 of 1931 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile)
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Succeeded
NOTE: Running task 1919 of 1931 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1920 of 1931 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install)
NOTE: recipe libusb1-1.0.27-r0: task do_install: Started
NOTE: recipe libusb1-1.0.27-r0: task do_install: Succeeded
NOTE: Running task 1921 of 1931 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Started
Log data follows:
| DEBUG: Executing shell function do_install_ptest_base
| install: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/build/tests/.libs/stress': No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/run.do_install_ptest_base.2929242:189 exit 1 from 'install -m 755 /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/build/tests/.libs/stress /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/image/usr/lib/libusb1/ptest'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install_ptest, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/run.do_install_ptest_base.2929242, line 189
| 	#2: do_install_ptest_base, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/run.do_install_ptest_base.2929242, line 159
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/run.do_install_ptest_base.2929242, line 219
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Failed
NOTE: Tasks Summary: Attempted 1921 tasks of which 1910 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215171846.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215171846.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install_ptest_base
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libusb1-1.0.27-r0 do_install_ptest_base: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/run.do_install_ptest_base.2929242', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/log.do_install_ptest_base.2929242
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install_ptest_base) failed with exit code '1'

--===============2247674572989418173==--

