Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9949C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:08:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.2504.1706810901124544872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VevSAwUL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MYIYZB+l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d65db7fde-2111fa8b-bad7-4c54-b8e4-1e1e5a4537ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810900;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Rma9sAf1IBfayxWFKPJVRMEd1wIp0waDffIFDe1UmGs=;
	b=VevSAwUL5CJvN7vo/qQGmi5AZIUuC9rPHdA94yEzOT/Hh9AqPV1ebeK7XkHZI5Ov
	fz9edHa3wMJ6ModU7WyXdeXy91t191RGhzS9RX8mQsz56Wzz+MiEfn6tL+6iVBZOlgt
	HIWCBm9cLyQXo51LpNFqoR3ozwsTYPk9noyjgKH0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810900;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Rma9sAf1IBfayxWFKPJVRMEd1wIp0waDffIFDe1UmGs=;
	b=MYIYZB+ljL3C9Bl0Px75kDO6vLxxXZAw86+IEP9NVpPZ3o7EywN4QSOCQjn2PHDs
	bxmLu1DLkuR3BoidZ4MMHdSoG3uJ+2aXlmTKrDD5sEfXvCaFw5g+wM3hRHX5WFBxSic
	ELG8i26kfa9lCSdsEKSigz8KKAtoyR/o8IY2EH9k=
Content-Type: multipart/mixed; boundary="===============1767068010668321550=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libusb1: upgrading to 1.0.27 FAILED
Message-ID: <0101018d65db7fde-2111fa8b-bad7-4c54-b8e4-1e1e5a4537ce-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:08:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194724

--===============1767068010668321550==
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
From 373a5abaced88fe5322b9cd5b4f0791b03014ff6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 17:44:52 +0000
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


--===============1767068010668321550==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libusb1-upgrade-1.0.26-1.0.27.patch"

RnJvbSAzNzNhNWFiYWNlZDg4ZmU1MzIyYjljZDViNGYwNzkxYjAzMDE0ZmY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNzo0NDo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnVzYjE6IHVwZ3JhZGUgMS4wLjI2IC0+IDEuMC4yNwoKLS0tCiAuLi5rLXdpdGgtbGF0b21pYy1v
bmx5LWlmLW5vLWF0b21pYy1idWkucGF0Y2ggfCA0NiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e2xpYnVzYjFfMS4wLjI2LmJiID0+IGxpYnVzYjFfMS4wLjI3LmJifSAgfCAgNSArLQogMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVzYi9saWJ1c2IxLzAwMDEtY29uZmlndXJl
LmFjLUxpbmstd2l0aC1sYXRvbWljLW9ubHktaWYtbm8tYXRvbWljLWJ1aS5wYXRjaAogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVzYi97bGlidXNiMV8xLjAuMjYuYmIgPT4gbGlidXNi
MV8xLjAuMjcuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
dXNiL2xpYnVzYjEvMDAwMS1jb25maWd1cmUuYWMtTGluay13aXRoLWxhdG9taWMtb25seS1pZi1u
by1hdG9taWMtYnVpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXNiL2xpYnVzYjEv
MDAwMS1jb25maWd1cmUuYWMtTGluay13aXRoLWxhdG9taWMtb25seS1pZi1uby1hdG9taWMtYnVp
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzYzIyM2UwODIyLi4wMDAwMDAw
MDAwCi0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVzYi9saWJ1c2IxLzAwMDEtY29uZmln
dXJlLmFjLUxpbmstd2l0aC1sYXRvbWljLW9ubHktaWYtbm8tYXRvbWljLWJ1aS5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDQ2ICswLDAgQEAKLUZyb20gOTVlNjAxY2UxMTZkZDQ2ZWE3OTE1YzE3
MTk3NmI4NWVhMDkwNWQ1OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IExvbm5pZSBB
YmVsYmVjayA8bG9ubmllQGFiZWxiZWNrLmNvbT4KLURhdGU6IFN1biwgOCBNYXkgMjAyMiAxNDow
NTo1NiAtMDUwMAotU3ViamVjdDogW1BBVENIXSBjb25maWd1cmUuYWM6IExpbmsgd2l0aCAtbGF0
b21pYyBvbmx5IGlmIG5vIGF0b21pYyBidWlsdGlucwotCi1Gb2xsb3ctdXAgdG8gNTYxZGJkYSwg
YSBjaGVjayBvZiBHQ0MgYXRvbWljIGJ1aWx0aW5zIG5lZWRzIHRvIGJlIGRvbmUKLWZpcnN0Lgot
Ci1JJ20gbm8gYXV0b2NvbmYgZ3VydSwgYnV0IHVzaW5nIHRoaXM6Ci1odHRwczovL2dpdGh1Yi5j
b20vbWVzYTNkL21lc2EvYmxvYi8wZGY0ODVjMjg1YjczYzM0YmE5MDYyZjBjMjdlNTVjM2M3MDI5
MzBkL2NvbmZpZ3VyZS5hYyNMNDY5Ci1hcyBpbnNwaXJhdGlvbiwgSSBjcmVhdGVkIGEgcHJlLWNo
ZWNrIGJlZm9yZSBjYWxsaW5nIEFDX1NFQVJDSF9MSUJTKC4uLikKLQotRml4ZXMgIzExMzUKLUNs
b3NlcyAjMTEzOQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29t
L2tyYWovbGlidXNiL2NvbW1pdC85NWU2MDFjZTExNmRkNDZlYTc5MTVjMTcxOTc2Yjg1ZWEwOTA1
ZDU4XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQot
IGNvbmZpZ3VyZS5hYyAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKy0KLSBsaWJ1c2IvdmVy
c2lvbl9uYW5vLmggfCAgMiArLQotIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKLQotLS0tIGEvY29uZmlndXJlLmFjCi0rKysgYi9jb25maWd1cmUuYWMK
LUBAIC0xNTMsNyArMTUzLDIxIEBAIGlmIHRlc3QgIngkcGxhdGZvcm0iID0geHBvc2l4OyB0aGVu
Ci0gCUFDX1NFQVJDSF9MSUJTKFtwdGhyZWFkX2NyZWF0ZV0sIFtwdGhyZWFkXSwKLSAJCVt0ZXN0
ICJ4JGFjX2N2X3NlYXJjaF9wdGhyZWFkX2NyZWF0ZSIgIT0gInhub25lIHJlcXVpcmVkIiAmJiBB
Q19TVUJTVChUSFJFQURfTElCUywgWy1scHRocmVhZF0pXSwKLSAJCVtdLCBbXSkKLS0JQUNfU0VB
UkNIX0xJQlMoW19fYXRvbWljX2ZldGNoX2FkZF80XSwgW2F0b21pY10pCi0rCWRubCBDaGVjayBm
b3IgbmV3LXN0eWxlIGF0b21pYyBidWlsdGlucy4gV2UgZmlyc3QgY2hlY2sgd2l0aG91dCBsaW5r
aW5nIHRvIC1sYXRvbWljLgotKwlBQ19NU0dfQ0hFQ0tJTkcod2hldGhlciBfX2F0b21pY19sb2Fk
X24gaXMgc3VwcG9ydGVkKQotKwlBQ19MSU5LX0lGRUxTRShbQUNfTEFOR19TT1VSQ0UoW1sKLSsJ
I2luY2x1ZGUgPHN0ZGludC5oPgotKwlpbnQgbWFpbigpIHsKLSsJCXN0cnVjdCB7Ci0rCQkJdWlu
dDY0X3QgKnY7Ci0rCQl9IHg7Ci0rCQlyZXR1cm4gKGludClfX2F0b21pY19sb2FkX24oeC52LCBf
X0FUT01JQ19BQ1FVSVJFKSAmCi0rCQkgICAgICAgKGludClfX2F0b21pY19hZGRfZmV0Y2goeC52
LCAodWludDY0X3QpMSwgX19BVE9NSUNfQUNRX1JFTCk7Ci0rCX1dXSldLCBHQ0NfQVRPTUlDX0JV
SUxUSU5TX1NVUFBPUlRFRD15ZXMsIEdDQ19BVE9NSUNfQlVJTFRJTlNfU1VQUE9SVEVEPW5vKQot
KwlBQ19NU0dfUkVTVUxUKCRHQ0NfQVRPTUlDX0JVSUxUSU5TX1NVUFBPUlRFRCkKLSsJaWYgdGVz
dCAieCRHQ0NfQVRPTUlDX0JVSUxUSU5TX1NVUFBPUlRFRCIgIT0geHllczsgdGhlbgotKwkJQUNf
U0VBUkNIX0xJQlMoW19fYXRvbWljX2ZldGNoX2FkZF80XSwgW2F0b21pY10pCi0rCWZpCi0gZWxp
ZiB0ZXN0ICJ4JHBsYXRmb3JtIiA9IHh3aW5kb3dzOyB0aGVuCi0gCUFDX0RFRklORShbUExBVEZP
Uk1fV0lORE9XU10sIFsxXSwgW0RlZmluZSB0byAxIGlmIGNvbXBpbGluZyBmb3IgYSBXaW5kb3dz
IHBsYXRmb3JtLl0pCi0gZWxzZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
dXNiL2xpYnVzYjFfMS4wLjI2LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXNiL2xpYnVz
YjFfMS4wLjI3LmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYnVzYi9saWJ1c2IxXzEuMC4yNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlidXNiL2xpYnVzYjFfMS4wLjI3LmJiCmluZGV4IDJhZjZmY2RlYTcuLmY0YWYy
YmI5NzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVzYi9saWJ1c2IxXzEu
MC4yNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1c2IvbGlidXNiMV8xLjAuMjcu
YmIKQEAgLTExLDE0ICsxMSwxMyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT1mYmMwOTM5MDE4NTdmY2QxMThmMDY1ZjkwMDk4MmMyNCIKIEJCQ0xBU1NFWFRFTkQgPSAi
bmF0aXZlIG5hdGl2ZXNkayIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxv
YWQvdiR7UFZ9L2xpYnVzYi0ke1BWfS50YXIuYnoyIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEt
Y29uZmlndXJlLmFjLUxpbmstd2l0aC1sYXRvbWljLW9ubHktaWYtbm8tYXRvbWljLWJ1aS5wYXRj
aCBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAotICAgICAgICAgICIKKyAgICAgICAg
ICAgIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2xpYnVzYi9saWJ1
c2IvcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcvdj8oP1A8
cHZlcj5cZCsoXC5cZCspKykkIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTJjZTdhNjFmYzk4
NTRkMWQyYTFmZmUwOTVmN2I1ZmFjMTlkZGJhMDk1YzI1OWU2MDY3YTQ2NTAwMzgxYjVhNSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJmZmFhNDFkNzQxYThhM2JlZTI0NGFjOGU1NGE3MmVhMDViZjI4
Nzk2NjNjMDk4YzgyZmM1NzU3ODUzNDQxNTc1IgogCiBTID0gIiR7V09SS0RJUn0vbGlidXNiLSR7
UFZ9IgogCi0tIAoyLjQyLjAKCg==

--===============1767068010668321550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1852 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1849 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-f724deecc007f00108fa26a58187b96bc91342c2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f724deecc007f00108fa26a58187b96bc91342c2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 256 Local 243 Mirrors 0 Missed 13 Current 433 (94% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 447 of 689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.1.bb:do_create_spdx_setscene)
NOTE: Running task 925 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa)
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa: Started
NOTE: recipe systemd-1_255.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_255.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 656 of 689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 658 of 689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 1216 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 661 of 689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Succeeded
NOTE: Running task 1286 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 667 of 689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Succeeded
NOTE: Running task 1294 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 674 of 689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 676 of 689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Succeeded
NOTE: Running task 1301 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1302 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_lic)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_lic: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_populate_lic: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 689 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1745 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1900 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1906 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure)
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Succeeded
NOTE: Running task 1907 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1908 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile)
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Succeeded
NOTE: Running task 1909 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1910 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install)
NOTE: recipe libusb1-1.0.27-r0: task do_install: Started
NOTE: recipe libusb1-1.0.27-r0: task do_install: Succeeded
NOTE: Running task 1911 of 1921 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Started
Log data follows:
| DEBUG: Executing shell function do_install_ptest_base
| install: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/build/tests/.libs/stress': No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/run.do_install_ptest_base.865662:189 exit 1 from 'install -m 755 /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/build/tests/.libs/stress /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/image/usr/lib/libusb1/ptest'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install_ptest, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/run.do_install_ptest_base.865662, line 189
| 	#2: do_install_ptest_base, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/run.do_install_ptest_base.865662, line 159
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/run.do_install_ptest_base.865662, line 219
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Failed
NOTE: Tasks Summary: Attempted 1911 tasks of which 1897 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201174420.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201174420.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install_ptest_base
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libusb1-1.0.27-r0 do_install_ptest_base: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/run.do_install_ptest_base.865662', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libusb1/1.0.27/temp/log.do_install_ptest_base.865662
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install_ptest_base) failed with exit code '1'

--===============1767068010668321550==--

