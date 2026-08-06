Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15026C5AC6F
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:24:26 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13404.1785997456343047357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 23:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ok8e3VRx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CbymduE1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019fd5be704e-86512d4a-b10a-4af2-94a9-cf22ab28cde1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785997455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6B1RMr5p2cwynGWN4KS2yN4enfb/Zt7WtweSS9iU81E=;
	b=ok8e3VRxc/GlJwcIdRIRbOVvtL6McwzyFrkS2qz9LxxDJMcn8MT+Xisx9LvmHGWr
	Ti7BfS9vLlcfhf092a7wdHdb8a0O3CJK07RgvxpnxMKW71Eygdenf7fF3+Hf/9F4dNp
	SSYcLhMvTLF/NTj/pIxQ8X9fLubQsN3bIY8nRE6I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785997455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6B1RMr5p2cwynGWN4KS2yN4enfb/Zt7WtweSS9iU81E=;
	b=CbymduE1Cl55ySsJB3401KArbyR0S1CB46iJ+1d22U0I8KeL+g3tNXkh8n+Pz/oG
	1OFSg3U3guIH2E83+o0sW7sIGUN+QSA1qsczQD4TWwsrrdKyb29ZUVcynDcQsiL6HjV
	QyGRIQw+c7hscz0an5Yz536E+3ojwEPa3ooHtcL0=
Content-Type: multipart/mixed; boundary="===============6041443482861261972=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pseudo: upgrading to 1.9.11 FAILED
Message-ID: <0101019fd5be704e-86512d4a-b10a-4af2-94a9-cf22ab28cde1-000000@us-west-2.amazonses.com>
Date: Thu, 6 Aug 2026 06:24:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.06-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 06:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242905

--===============6041443482861261972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pseudo* to *1.9.11* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-pseudo-upgrade-1.9.10-1.9.11.patch
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
From ef120ea7b26559ea9586e85669306b3c3a86e761 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 6 Aug 2026 05:31:01 +0000
Subject: [PATCH] pseudo: upgrade 1.9.10 -> 1.9.11

ba8887e Makefile.in: Bump to 1.9.11
22bdf20 tests: Add close_range() test
f85e2ae ports/linux/guts: Implement close_range() instead of returning ENOSYS
---
 .../pseudo/files/older-glibc-symbols.patch    | 57 -------------------
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  5 +-
 2 files changed, 3 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch

diff --git a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
deleted file mode 100644
index f42b32b8d9..0000000000
--- a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-If we link against a newer glibc 2.34 and then try and our LD_PRELOAD is run against a
-binary on a host with an older libc, we see symbol errors since in glibc 2.34, pthread 
-and dl are merged into libc itself.
-
-We need to use the older form of linking so use glibc binaries from an older release
-to force this. We only use minimal symbols from these anyway.
-
-pthread_atfork is problematic, particularly on arm so use the internal glibc routine
-it maps too. This was always present in the main libc from 2.3.2 onwards.
-
-Yes this is horrible. Better solutions welcome.
-
-There is more info in the bug: [YOCTO #14521]
-
-Upstream-Status: Inappropriate [this patch is native and nativesdk]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Tweak library search order, make prebuilt lib ahead of recipe lib
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.in       | 2 +-
- pseudo_wrappers.c | 5 ++++-
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -120,7 +120,7 @@ $(PSEUDODB): pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o | $(BIN)
- libpseudo: $(LIBPSEUDO)
- 
- $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o $(SHOBJS) | $(LIB)
--	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
-+	$(CC) $(CFLAGS)  -Lprebuilt/$(shell uname -m)-linux/lib/ $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
- 		pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o \
- 		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
- 
-diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
---- a/pseudo_wrappers.c
-+++ b/pseudo_wrappers.c
-@@ -100,10 +100,13 @@ static void libpseudo_atfork_child(void)
- 	pseudo_mutex_holder = 0;
- }
- 
-+extern void *__dso_handle;
-+extern int __register_atfork (void (*) (void), void (*) (void), void (*) (void), void *);
-+
- static void
- _libpseudo_init(void) {
- 	if (!_libpseudo_initted)
--		pthread_atfork(NULL, NULL, libpseudo_atfork_child);
-+		__register_atfork (NULL, NULL, libpseudo_atfork_child, &__dso_handle == NULL ? NULL : __dso_handle);
- 
- 	pseudo_getlock();
- 	pseudo_antimagic();
--- 
-2.27.0
-
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d0559f6c9f..0650d7b7c2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -3,6 +3,7 @@ require pseudo.inc
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;tag=pseudo-${PV} \
            file://fallback-passwd \
            file://fallback-group \
+           http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
            "
 SRC_URI:append:class-native = " \
     http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
@@ -12,8 +13,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "2a5521e9573049864e07907415f1fee28232d90c"
-PV = "1.9.10"
+SRCREV = "4d350864771c15986d86a3ba9e3d8d79264f42ac"
+PV = "1.9.11"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
-- 
2.47.1


--===============6041443482861261972==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pseudo-upgrade-1.9.10-1.9.11.patch"

RnJvbSBlZjEyMGVhN2IyNjU1OWVhOTU4NmU4NTY2OTMwNmIzYzNhODZlNzYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNiBBdWcgMjAyNiAwNTozMTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBz
ZXVkbzogdXBncmFkZSAxLjkuMTAgLT4gMS45LjExCgpiYTg4ODdlIE1ha2VmaWxlLmluOiBCdW1w
IHRvIDEuOS4xMQoyMmJkZjIwIHRlc3RzOiBBZGQgY2xvc2VfcmFuZ2UoKSB0ZXN0CmY4NWUyYWUg
cG9ydHMvbGludXgvZ3V0czogSW1wbGVtZW50IGNsb3NlX3JhbmdlKCkgaW5zdGVhZCBvZiByZXR1
cm5pbmcgRU5PU1lTCi0tLQogLi4uL3BzZXVkby9maWxlcy9vbGRlci1nbGliYy1zeW1ib2xzLnBh
dGNoICAgIHwgNTcgLS0tLS0tLS0tLS0tLS0tLS0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bz
ZXVkby9wc2V1ZG9fZ2l0LmJiICAgIHwgIDUgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCA1OSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHNldWRvL2ZpbGVzL29sZGVyLWdsaWJjLXN5bWJvbHMucGF0Y2gKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVzL29sZGVyLWdsaWJjLXN5bWJv
bHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVzL29sZGVyLWdsaWJj
LXN5bWJvbHMucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGY0MmIzMmI4ZDku
LjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9maWxlcy9vbGRl
ci1nbGliYy1zeW1ib2xzLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTcgKzAsMCBAQAotSWYg
d2UgbGluayBhZ2FpbnN0IGEgbmV3ZXIgZ2xpYmMgMi4zNCBhbmQgdGhlbiB0cnkgYW5kIG91ciBM
RF9QUkVMT0FEIGlzIHJ1biBhZ2FpbnN0IGEKLWJpbmFyeSBvbiBhIGhvc3Qgd2l0aCBhbiBvbGRl
ciBsaWJjLCB3ZSBzZWUgc3ltYm9sIGVycm9ycyBzaW5jZSBpbiBnbGliYyAyLjM0LCBwdGhyZWFk
IAotYW5kIGRsIGFyZSBtZXJnZWQgaW50byBsaWJjIGl0c2VsZi4KLQotV2UgbmVlZCB0byB1c2Ug
dGhlIG9sZGVyIGZvcm0gb2YgbGlua2luZyBzbyB1c2UgZ2xpYmMgYmluYXJpZXMgZnJvbSBhbiBv
bGRlciByZWxlYXNlCi10byBmb3JjZSB0aGlzLiBXZSBvbmx5IHVzZSBtaW5pbWFsIHN5bWJvbHMg
ZnJvbSB0aGVzZSBhbnl3YXkuCi0KLXB0aHJlYWRfYXRmb3JrIGlzIHByb2JsZW1hdGljLCBwYXJ0
aWN1bGFybHkgb24gYXJtIHNvIHVzZSB0aGUgaW50ZXJuYWwgZ2xpYmMgcm91dGluZQotaXQgbWFw
cyB0b28uIFRoaXMgd2FzIGFsd2F5cyBwcmVzZW50IGluIHRoZSBtYWluIGxpYmMgZnJvbSAyLjMu
MiBvbndhcmRzLgotCi1ZZXMgdGhpcyBpcyBob3JyaWJsZS4gQmV0dGVyIHNvbHV0aW9ucyB3ZWxj
b21lLgotCi1UaGVyZSBpcyBtb3JlIGluZm8gaW4gdGhlIGJ1ZzogW1lPQ1RPICMxNDUyMV0KLQot
VXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFt0aGlzIHBhdGNoIGlzIG5hdGl2ZSBhbmQg
bmF0aXZlc2RrXQotU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0KLVR3ZWFrIGxpYnJhcnkgc2VhcmNoIG9yZGVyLCBtYWtl
IHByZWJ1aWx0IGxpYiBhaGVhZCBvZiByZWNpcGUgbGliCi1TaWduZWQtb2ZmLWJ5OiBIb25neHUg
SmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+Ci0tLS0KLSBNYWtlZmlsZS5pbiAgICAgICB8
IDIgKy0KLSBwc2V1ZG9fd3JhcHBlcnMuYyB8IDUgKysrKy0KLSAyIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL01ha2VmaWxlLmlu
IGIvTWFrZWZpbGUuaW4KLS0tLSBhL01ha2VmaWxlLmluCi0rKysgYi9NYWtlZmlsZS5pbgotQEAg
LTEyMCw3ICsxMjAsNyBAQCAkKFBTRVVET0RCKTogcHNldWRvZGIubyAkKFNIT0JKUykgJChEQk9C
SlMpIHBzZXVkb19pcGMubyB8ICQoQklOKQotIGxpYnBzZXVkbzogJChMSUJQU0VVRE8pCi0gCi0g
JChMSUJQU0VVRE8pOiAkKFdSQVBPQkpTKSBwc2V1ZG9fY2xpZW50Lm8gcHNldWRvX2NsaWVudF9z
Y2FuZi5vIHBzZXVkb19pcGMubyAkKFNIT0JKUykgfCAkKExJQikKLS0JJChDQykgJChDRkxBR1Mp
ICQoQ0ZMQUdTX1BTRVVETykgLXNoYXJlZCAtbyAkKExJQlBTRVVETykgXAotKwkkKENDKSAkKENG
TEFHUykgIC1McHJlYnVpbHQvJChzaGVsbCB1bmFtZSAtbSktbGludXgvbGliLyAkKENGTEFHU19Q
U0VVRE8pIC1zaGFyZWQgLW8gJChMSUJQU0VVRE8pIFwKLSAJCXBzZXVkb19jbGllbnQubyBwc2V1
ZG9fY2xpZW50X3NjYW5mLm8gcHNldWRvX2lwYy5vIFwKLSAJCSQoV1JBUE9CSlMpICQoU0hPQkpT
KSAkKExERkxBR1MpICQoQ0xJRU5UX0xERkxBR1MpCi0gCi1kaWZmIC0tZ2l0IGEvcHNldWRvX3dy
YXBwZXJzLmMgYi9wc2V1ZG9fd3JhcHBlcnMuYwotLS0tIGEvcHNldWRvX3dyYXBwZXJzLmMKLSsr
KyBiL3BzZXVkb193cmFwcGVycy5jCi1AQCAtMTAwLDEwICsxMDAsMTMgQEAgc3RhdGljIHZvaWQg
bGlicHNldWRvX2F0Zm9ya19jaGlsZCh2b2lkKQotIAlwc2V1ZG9fbXV0ZXhfaG9sZGVyID0gMDsK
LSB9Ci0gCi0rZXh0ZXJuIHZvaWQgKl9fZHNvX2hhbmRsZTsKLStleHRlcm4gaW50IF9fcmVnaXN0
ZXJfYXRmb3JrICh2b2lkICgqKSAodm9pZCksIHZvaWQgKCopICh2b2lkKSwgdm9pZCAoKikgKHZv
aWQpLCB2b2lkICopOwotKwotIHN0YXRpYyB2b2lkCi0gX2xpYnBzZXVkb19pbml0KHZvaWQpIHsK
LSAJaWYgKCFfbGlicHNldWRvX2luaXR0ZWQpCi0tCQlwdGhyZWFkX2F0Zm9yayhOVUxMLCBOVUxM
LCBsaWJwc2V1ZG9fYXRmb3JrX2NoaWxkKTsKLSsJCV9fcmVnaXN0ZXJfYXRmb3JrIChOVUxMLCBO
VUxMLCBsaWJwc2V1ZG9fYXRmb3JrX2NoaWxkLCAmX19kc29faGFuZGxlID09IE5VTEwgPyBOVUxM
IDogX19kc29faGFuZGxlKTsKLSAKLSAJcHNldWRvX2dldGxvY2soKTsKLSAJcHNldWRvX2FudGlt
YWdpYygpOwotLS0gCi0yLjI3LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BzZXVkby9wc2V1ZG9fZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9wc2V1
ZG9fZ2l0LmJiCmluZGV4IGQwNTU5ZjZjOWYuLjA2NTBkN2I3YzIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRvX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmIKQEAgLTMsNiArMyw3IEBAIHJlcXVpcmUgcHNl
dWRvLmluYwogU1JDX1VSSSA9ICJnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wc2V1ZG87YnJh
bmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwczt0YWc9cHNldWRvLSR7UFZ9IFwKICAgICAgICAgICAg
ZmlsZTovL2ZhbGxiYWNrLXBhc3N3ZCBcCiAgICAgICAgICAgIGZpbGU6Ly9mYWxsYmFjay1ncm91
cCBcCisgICAgICAgICAgIGh0dHA6Ly9kb3dubG9hZHMueW9jdG9wcm9qZWN0Lm9yZy9taXJyb3Iv
c291cmNlcy9wc2V1ZG8tcHJlYnVpbHQtMi4zMy50YXIueHo7c3ViZGlyPSR7QkJfR0lUX0RFRkFV
TFRfREVTVFNVRkZJWH0vcHJlYnVpbHQ7bmFtZT1wcmVidWlsdCBcCiAgICAgICAgICAgICIKIFNS
Q19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgXAogICAgIGh0dHA6Ly9kb3dubG9hZHMueW9j
dG9wcm9qZWN0Lm9yZy9taXJyb3Ivc291cmNlcy9wc2V1ZG8tcHJlYnVpbHQtMi4zMy50YXIueHo7
c3ViZGlyPSR7QkJfR0lUX0RFRkFVTFRfREVTVFNVRkZJWH0vcHJlYnVpbHQ7bmFtZT1wcmVidWls
dCBcCkBAIC0xMiw4ICsxMyw4IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIg
XAogICAgIGZpbGU6Ly9vbGRlci1nbGliYy1zeW1ib2xzLnBhdGNoIgogU1JDX1VSSVtwcmVidWls
dC5zaGEyNTZzdW1dID0gImVkOWY0NTY4NTZlOWQ4NjM1OWYxNjlmNDZhNzBhZDdiZTQxOTBkNjA0
MDI4MmI4NGM4ZDk3Yjk5MDcyNDg1YWEiCiAKLVNSQ1JFViA9ICIyYTU1MjFlOTU3MzA0OTg2NGUw
NzkwNzQxNWYxZmVlMjgyMzJkOTBjIgotUFYgPSAiMS45LjEwIgorU1JDUkVWID0gIjRkMzUwODY0
NzcxYzE1OTg2ZDg2YTNiYTllM2Q4ZDc5MjY0ZjQyYWMiCitQViA9ICIxLjkuMTEiCiAKICMgbGFy
Z2VmaWxlIGFuZCA2NGJpdCB0aW1lX3Qgc3VwcG9ydCBhZGRzIHRoZXNlIG1hY3JvcyB2aWEgY29t
cGlsZXIgZmxhZ3MgZ2xvYmFsbHkKICMgcmVtb3ZlIHRoZW0gZm9yIHBzZXVkbyBzaW5jZSBwc2V1
ZG8gaW50ZXJjZXB0cyBzb21lIG9mIHRoZSBmdW5jdGlvbnMgd2hpY2ggd2lsbCBiZQotLSAKMi40
Ny4xCgo=

--===============6041443482861261972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pseudo-changelog.txt"

Changelog for pseudo: 1.9.10 -> 1.9.11

ba8887e Makefile.in: Bump to 1.9.11
22bdf20 tests: Add close_range() test
f85e2ae ports/linux/guts: Implement close_range() instead of returning ENOSYS

--===============6041443482861261972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb: Unable to get checksum for nativesdk-pseudo SRC_URI entry older-glibc-symbols.patch: file could not be found
The following paths were searched:
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.11/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.11/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.11/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.11/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
ERROR: Parsing halted due to errors, see error messages above

--===============6041443482861261972==--

