Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2917FC8300E
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.8888.1749993282205802143
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EwcB5vsG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kranXUP/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019773ba6542-9e39cf8e-ae71-4c7a-a3dd-573927357a52-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I3F0If7IKVOSJd+5BPmaKuweEXJ07I9KDymL4lZF1j4=;
	b=EwcB5vsGE6Ahv0IE7IsVttbQJP5bUwhic3vPJ6ehv7T4PpSyKArc6LLEoz6U8oNK
	Lt3w/ev6LjAhVK5oUIWDkMJaus4sGLZUBs1ryOgvjQP/OWx8jbu8f1pp6hkAWNhvKkk
	0XYQf39xql5K2TBIThbIzpfjSVZqBUvcZS6AwXaA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I3F0If7IKVOSJd+5BPmaKuweEXJ07I9KDymL4lZF1j4=;
	b=kranXUP/ubscqipiKkKBLckTFvmVd0lRCvqQhMn0Vu40OEggoedKboiazbJbdf2e
	6PxXDoScW97AeiEpsiyZ4Orwk0TGDjWp+E9uJtUqzf48liQKG6dG0xFrS9AeweFgp5g
	Xd5ASex4s7EkPl7W1MFrsFG4rppc51NXl5TKT0Ww=
Content-Type: multipart/mixed; boundary="===============0612931181840472763=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pseudo: upgrading to 1.9.2 FAILED
Message-ID: <0101019773ba6542-9e39cf8e-ae71-4c7a-a3dd-573927357a52-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218673

--===============0612931181840472763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pseudo* to *1.9.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-pseudo-upgrade-1.9.0-1.9.2.patch
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
From d14bbf80ed942d5a75465b23b0a6676c245a0ac9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 08:03:26 +0000
Subject: [PATCH] pseudo: upgrade 1.9.0 -> 1.9.2

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
index 4693afcaf6..790088a2a4 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -3,6 +3,7 @@ require pseudo.inc
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://fallback-passwd \
            file://fallback-group \
+           http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=git/prebuilt;name=prebuilt \
            "
 SRC_URI:append:class-native = " \
     http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=git/prebuilt;name=prebuilt \
@@ -12,9 +13,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "2c43381180f9cfef4c0a8bb0c1658a86c3fcc876"
+SRCREV = "cb3aee1423d1697d01888f9dc29135d5cb5015a5"
 S = "${WORKDIR}/git"
-PV = "1.9.0+git"
+PV = "1.9.2"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
-- 
2.47.1


--===============0612931181840472763==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pseudo-upgrade-1.9.0-1.9.2.patch"

RnJvbSBkMTRiYmY4MGVkOTQyZDVhNzU0NjViMjNiMGE2Njc2YzI0NWEwYWM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDg6MDM6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
c2V1ZG86IHVwZ3JhZGUgMS45LjAgLT4gMS45LjIKCi0tLQogLi4uL3BzZXVkby9maWxlcy9vbGRl
ci1nbGliYy1zeW1ib2xzLnBhdGNoICAgIHwgNTcgLS0tLS0tLS0tLS0tLS0tLS0tLQogbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJiICAgIHwgIDUgKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1OSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVzL29sZGVyLWdsaWJjLXN5bWJv
bHMucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVz
L29sZGVyLWdsaWJjLXN5bWJvbHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRv
L2ZpbGVzL29sZGVyLWdsaWJjLXN5bWJvbHMucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IGY0MmIzMmI4ZDkuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BzZXVkby9maWxlcy9vbGRlci1nbGliYy1zeW1ib2xzLnBhdGNoCisrKyAvZGV2L251bGwKQEAg
LTEsNTcgKzAsMCBAQAotSWYgd2UgbGluayBhZ2FpbnN0IGEgbmV3ZXIgZ2xpYmMgMi4zNCBhbmQg
dGhlbiB0cnkgYW5kIG91ciBMRF9QUkVMT0FEIGlzIHJ1biBhZ2FpbnN0IGEKLWJpbmFyeSBvbiBh
IGhvc3Qgd2l0aCBhbiBvbGRlciBsaWJjLCB3ZSBzZWUgc3ltYm9sIGVycm9ycyBzaW5jZSBpbiBn
bGliYyAyLjM0LCBwdGhyZWFkIAotYW5kIGRsIGFyZSBtZXJnZWQgaW50byBsaWJjIGl0c2VsZi4K
LQotV2UgbmVlZCB0byB1c2UgdGhlIG9sZGVyIGZvcm0gb2YgbGlua2luZyBzbyB1c2UgZ2xpYmMg
YmluYXJpZXMgZnJvbSBhbiBvbGRlciByZWxlYXNlCi10byBmb3JjZSB0aGlzLiBXZSBvbmx5IHVz
ZSBtaW5pbWFsIHN5bWJvbHMgZnJvbSB0aGVzZSBhbnl3YXkuCi0KLXB0aHJlYWRfYXRmb3JrIGlz
IHByb2JsZW1hdGljLCBwYXJ0aWN1bGFybHkgb24gYXJtIHNvIHVzZSB0aGUgaW50ZXJuYWwgZ2xp
YmMgcm91dGluZQotaXQgbWFwcyB0b28uIFRoaXMgd2FzIGFsd2F5cyBwcmVzZW50IGluIHRoZSBt
YWluIGxpYmMgZnJvbSAyLjMuMiBvbndhcmRzLgotCi1ZZXMgdGhpcyBpcyBob3JyaWJsZS4gQmV0
dGVyIHNvbHV0aW9ucyB3ZWxjb21lLgotCi1UaGVyZSBpcyBtb3JlIGluZm8gaW4gdGhlIGJ1Zzog
W1lPQ1RPICMxNDUyMV0KLQotVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFt0aGlzIHBh
dGNoIGlzIG5hdGl2ZSBhbmQgbmF0aXZlc2RrXQotU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0KLVR3ZWFrIGxpYnJhcnkg
c2VhcmNoIG9yZGVyLCBtYWtlIHByZWJ1aWx0IGxpYiBhaGVhZCBvZiByZWNpcGUgbGliCi1TaWdu
ZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+Ci0tLS0KLSBN
YWtlZmlsZS5pbiAgICAgICB8IDIgKy0KLSBwc2V1ZG9fd3JhcHBlcnMuYyB8IDUgKysrKy0KLSAy
IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAt
LWdpdCBhL01ha2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLS0tLSBhL01ha2VmaWxlLmluCi0rKysg
Yi9NYWtlZmlsZS5pbgotQEAgLTEyMCw3ICsxMjAsNyBAQCAkKFBTRVVET0RCKTogcHNldWRvZGIu
byAkKFNIT0JKUykgJChEQk9CSlMpIHBzZXVkb19pcGMubyB8ICQoQklOKQotIGxpYnBzZXVkbzog
JChMSUJQU0VVRE8pCi0gCi0gJChMSUJQU0VVRE8pOiAkKFdSQVBPQkpTKSBwc2V1ZG9fY2xpZW50
Lm8gcHNldWRvX2NsaWVudF9zY2FuZi5vIHBzZXVkb19pcGMubyAkKFNIT0JKUykgfCAkKExJQikK
LS0JJChDQykgJChDRkxBR1MpICQoQ0ZMQUdTX1BTRVVETykgLXNoYXJlZCAtbyAkKExJQlBTRVVE
TykgXAotKwkkKENDKSAkKENGTEFHUykgIC1McHJlYnVpbHQvJChzaGVsbCB1bmFtZSAtbSktbGlu
dXgvbGliLyAkKENGTEFHU19QU0VVRE8pIC1zaGFyZWQgLW8gJChMSUJQU0VVRE8pIFwKLSAJCXBz
ZXVkb19jbGllbnQubyBwc2V1ZG9fY2xpZW50X3NjYW5mLm8gcHNldWRvX2lwYy5vIFwKLSAJCSQo
V1JBUE9CSlMpICQoU0hPQkpTKSAkKExERkxBR1MpICQoQ0xJRU5UX0xERkxBR1MpCi0gCi1kaWZm
IC0tZ2l0IGEvcHNldWRvX3dyYXBwZXJzLmMgYi9wc2V1ZG9fd3JhcHBlcnMuYwotLS0tIGEvcHNl
dWRvX3dyYXBwZXJzLmMKLSsrKyBiL3BzZXVkb193cmFwcGVycy5jCi1AQCAtMTAwLDEwICsxMDAs
MTMgQEAgc3RhdGljIHZvaWQgbGlicHNldWRvX2F0Zm9ya19jaGlsZCh2b2lkKQotIAlwc2V1ZG9f
bXV0ZXhfaG9sZGVyID0gMDsKLSB9Ci0gCi0rZXh0ZXJuIHZvaWQgKl9fZHNvX2hhbmRsZTsKLStl
eHRlcm4gaW50IF9fcmVnaXN0ZXJfYXRmb3JrICh2b2lkICgqKSAodm9pZCksIHZvaWQgKCopICh2
b2lkKSwgdm9pZCAoKikgKHZvaWQpLCB2b2lkICopOwotKwotIHN0YXRpYyB2b2lkCi0gX2xpYnBz
ZXVkb19pbml0KHZvaWQpIHsKLSAJaWYgKCFfbGlicHNldWRvX2luaXR0ZWQpCi0tCQlwdGhyZWFk
X2F0Zm9yayhOVUxMLCBOVUxMLCBsaWJwc2V1ZG9fYXRmb3JrX2NoaWxkKTsKLSsJCV9fcmVnaXN0
ZXJfYXRmb3JrIChOVUxMLCBOVUxMLCBsaWJwc2V1ZG9fYXRmb3JrX2NoaWxkLCAmX19kc29faGFu
ZGxlID09IE5VTEwgPyBOVUxMIDogX19kc29faGFuZGxlKTsKLSAKLSAJcHNldWRvX2dldGxvY2so
KTsKLSAJcHNldWRvX2FudGltYWdpYygpOwotLS0gCi0yLjI3LjAKLQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJiCmluZGV4IDQ2OTNhZmNhZjYuLjc5MDA4OGEyYTQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRvX2dpdC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmIKQEAgLTMsNiAr
Myw3IEBAIHJlcXVpcmUgcHNldWRvLmluYwogU1JDX1VSSSA9ICJnaXQ6Ly9naXQueW9jdG9wcm9q
ZWN0Lm9yZy9wc2V1ZG87YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAg
IGZpbGU6Ly9mYWxsYmFjay1wYXNzd2QgXAogICAgICAgICAgICBmaWxlOi8vZmFsbGJhY2stZ3Jv
dXAgXAorICAgICAgICAgICBodHRwOi8vZG93bmxvYWRzLnlvY3RvcHJvamVjdC5vcmcvbWlycm9y
L3NvdXJjZXMvcHNldWRvLXByZWJ1aWx0LTIuMzMudGFyLnh6O3N1YmRpcj1naXQvcHJlYnVpbHQ7
bmFtZT1wcmVidWlsdCBcCiAgICAgICAgICAgICIKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2
ZSA9ICIgXAogICAgIGh0dHA6Ly9kb3dubG9hZHMueW9jdG9wcm9qZWN0Lm9yZy9taXJyb3Ivc291
cmNlcy9wc2V1ZG8tcHJlYnVpbHQtMi4zMy50YXIueHo7c3ViZGlyPWdpdC9wcmVidWlsdDtuYW1l
PXByZWJ1aWx0IFwKQEAgLTEyLDkgKzEzLDkgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZl
c2RrID0gIiBcCiAgICAgZmlsZTovL29sZGVyLWdsaWJjLXN5bWJvbHMucGF0Y2giCiBTUkNfVVJJ
W3ByZWJ1aWx0LnNoYTI1NnN1bV0gPSAiZWQ5ZjQ1Njg1NmU5ZDg2MzU5ZjE2OWY0NmE3MGFkN2Jl
NDE5MGQ2MDQwMjgyYjg0YzhkOTdiOTkwNzI0ODVhYSIKIAotU1JDUkVWID0gIjJjNDMzODExODBm
OWNmZWY0YzBhOGJiMGMxNjU4YTg2YzNmY2M4NzYiCitTUkNSRVYgPSAiY2IzYWVlMTQyM2QxNjk3
ZDAxODg4ZjlkYzI5MTM1ZDVjYjUwMTVhNSIKIFMgPSAiJHtXT1JLRElSfS9naXQiCi1QViA9ICIx
LjkuMCtnaXQiCitQViA9ICIxLjkuMiIKIAogIyBsYXJnZWZpbGUgYW5kIDY0Yml0IHRpbWVfdCBz
dXBwb3J0IGFkZHMgdGhlc2UgbWFjcm9zIHZpYSBjb21waWxlciBmbGFncyBnbG9iYWxseQogIyBy
ZW1vdmUgdGhlbSBmb3IgcHNldWRvIHNpbmNlIHBzZXVkbyBpbnRlcmNlcHRzIHNvbWUgb2YgdGhl
IGZ1bmN0aW9ucyB3aGljaCB3aWxsIGJlCi0tIAoyLjQ3LjEKCg==

--===============0612931181840472763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1911 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb: Unable to get checksum for nativesdk-pseudo SRC_URI entry older-glibc-symbols.patch: file could not be found
The following paths were searched:
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo-1.9.2/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/files/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo-1.9.2/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo-1.9.2/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/files/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo-1.9.2/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
ERROR: Parsing halted due to errors, see error messages above

--===============0612931181840472763==--

