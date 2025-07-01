Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADD3C83F3B
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1442.1751386813695290371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IkyUxkv3;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DZ7Uidlz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010197c6c9f2e3-1f201db4-442c-4793-a7dc-f74684043ab0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386813;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=maqJ/3Pj82EuyXqZ/5OFwcKJrK20IZbQqX0K6XDKClk=;
	b=IkyUxkv3WM1kbYK78bsgaXZXY1BDGqQNjWFUkj0tTtjlU44jW++sHi8mOuFPB2Wg
	AVmILrsEtnrY4EqgCbsZHFtK7oqihC9CRMQfzg6wi7AQdtFCv1pBtHryTMrSWPEmYbo
	htbY720RdiUtsBoUdaI5ieeY35PzP7kxhNy/gep8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386813;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=maqJ/3Pj82EuyXqZ/5OFwcKJrK20IZbQqX0K6XDKClk=;
	b=DZ7Uidlz7q57D4HfK3ZDGO7bbAhZ9h4kl+VtvUPFh4Oik2b7b/ZbTN7FCiQqe7hQ
	/RWFyQy/spvVwm5i8PFZaEebAXt/2WfSh1pzmUbXH37hkTmb/5KOn7cDCgWlvQPCx5J
	xP9mlqkqOXxxAyLwVwsLCokReY2/efTaET/2fQSE=
Content-Type: multipart/mixed; boundary="===============1919856481755131846=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pseudo: upgrading to 1.9.2 FAILED
Message-ID: <01010197c6c9f2e3-1f201db4-442c-4793-a7dc-f74684043ab0-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219635

--===============1919856481755131846==
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
From 66fd69cbe846e80868c95ad0b280608e90e967af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:46:37 +0000
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
index 385b6f34d9..099a602978 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -3,6 +3,7 @@ require pseudo.inc
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://fallback-passwd \
            file://fallback-group \
+           http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
            "
 SRC_URI:append:class-native = " \
     http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
@@ -12,8 +13,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "2c43381180f9cfef4c0a8bb0c1658a86c3fcc876"
-PV = "1.9.0+git"
+SRCREV = "bab7f05f4d1f293eede039c2468b0011e5c188c2"
+PV = "1.9.2"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
-- 
2.47.1


--===============1919856481755131846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1918 entries from dependency cache.
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

--===============1919856481755131846==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pseudo-upgrade-1.9.0-1.9.2.patch"

RnJvbSA2NmZkNjljYmU4NDZlODA4NjhjOTVhZDBiMjgwNjA4ZTkwZTk2N2FmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODo0NjozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBz
ZXVkbzogdXBncmFkZSAxLjkuMCAtPiAxLjkuMgoKLS0tCiAuLi4vcHNldWRvL2ZpbGVzL29sZGVy
LWdsaWJjLXN5bWJvbHMucGF0Y2ggICAgfCA1NyAtLS0tLS0tLS0tLS0tLS0tLS0tCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmIgICAgfCAgNSArLQogMiBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vZmlsZXMvb2xkZXItZ2xpYmMtc3ltYm9s
cy5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vZmlsZXMv
b2xkZXItZ2xpYmMtc3ltYm9scy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8v
ZmlsZXMvb2xkZXItZ2xpYmMtc3ltYm9scy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggZjQyYjMyYjhkOS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHNldWRvL2ZpbGVzL29sZGVyLWdsaWJjLXN5bWJvbHMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAt
MSw1NyArMCwwIEBACi1JZiB3ZSBsaW5rIGFnYWluc3QgYSBuZXdlciBnbGliYyAyLjM0IGFuZCB0
aGVuIHRyeSBhbmQgb3VyIExEX1BSRUxPQUQgaXMgcnVuIGFnYWluc3QgYQotYmluYXJ5IG9uIGEg
aG9zdCB3aXRoIGFuIG9sZGVyIGxpYmMsIHdlIHNlZSBzeW1ib2wgZXJyb3JzIHNpbmNlIGluIGds
aWJjIDIuMzQsIHB0aHJlYWQgCi1hbmQgZGwgYXJlIG1lcmdlZCBpbnRvIGxpYmMgaXRzZWxmLgot
Ci1XZSBuZWVkIHRvIHVzZSB0aGUgb2xkZXIgZm9ybSBvZiBsaW5raW5nIHNvIHVzZSBnbGliYyBi
aW5hcmllcyBmcm9tIGFuIG9sZGVyIHJlbGVhc2UKLXRvIGZvcmNlIHRoaXMuIFdlIG9ubHkgdXNl
IG1pbmltYWwgc3ltYm9scyBmcm9tIHRoZXNlIGFueXdheS4KLQotcHRocmVhZF9hdGZvcmsgaXMg
cHJvYmxlbWF0aWMsIHBhcnRpY3VsYXJseSBvbiBhcm0gc28gdXNlIHRoZSBpbnRlcm5hbCBnbGli
YyByb3V0aW5lCi1pdCBtYXBzIHRvby4gVGhpcyB3YXMgYWx3YXlzIHByZXNlbnQgaW4gdGhlIG1h
aW4gbGliYyBmcm9tIDIuMy4yIG9ud2FyZHMuCi0KLVllcyB0aGlzIGlzIGhvcnJpYmxlLiBCZXR0
ZXIgc29sdXRpb25zIHdlbGNvbWUuCi0KLVRoZXJlIGlzIG1vcmUgaW5mbyBpbiB0aGUgYnVnOiBb
WU9DVE8gIzE0NTIxXQotCi1VcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3RoaXMgcGF0
Y2ggaXMgbmF0aXZlIGFuZCBuYXRpdmVzZGtdCi1TaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KLQotVHdlYWsgbGlicmFyeSBz
ZWFyY2ggb3JkZXIsIG1ha2UgcHJlYnVpbHQgbGliIGFoZWFkIG9mIHJlY2lwZSBsaWIKLVNpZ25l
ZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KLS0tLQotIE1h
a2VmaWxlLmluICAgICAgIHwgMiArLQotIHBzZXVkb193cmFwcGVycy5jIHwgNSArKysrLQotIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0t
Z2l0IGEvTWFrZWZpbGUuaW4gYi9NYWtlZmlsZS5pbgotLS0tIGEvTWFrZWZpbGUuaW4KLSsrKyBi
L01ha2VmaWxlLmluCi1AQCAtMTIwLDcgKzEyMCw3IEBAICQoUFNFVURPREIpOiBwc2V1ZG9kYi5v
ICQoU0hPQkpTKSAkKERCT0JKUykgcHNldWRvX2lwYy5vIHwgJChCSU4pCi0gbGlicHNldWRvOiAk
KExJQlBTRVVETykKLSAKLSAkKExJQlBTRVVETyk6ICQoV1JBUE9CSlMpIHBzZXVkb19jbGllbnQu
byBwc2V1ZG9fY2xpZW50X3NjYW5mLm8gcHNldWRvX2lwYy5vICQoU0hPQkpTKSB8ICQoTElCKQot
LQkkKENDKSAkKENGTEFHUykgJChDRkxBR1NfUFNFVURPKSAtc2hhcmVkIC1vICQoTElCUFNFVURP
KSBcCi0rCSQoQ0MpICQoQ0ZMQUdTKSAgLUxwcmVidWlsdC8kKHNoZWxsIHVuYW1lIC1tKS1saW51
eC9saWIvICQoQ0ZMQUdTX1BTRVVETykgLXNoYXJlZCAtbyAkKExJQlBTRVVETykgXAotIAkJcHNl
dWRvX2NsaWVudC5vIHBzZXVkb19jbGllbnRfc2NhbmYubyBwc2V1ZG9faXBjLm8gXAotIAkJJChX
UkFQT0JKUykgJChTSE9CSlMpICQoTERGTEFHUykgJChDTElFTlRfTERGTEFHUykKLSAKLWRpZmYg
LS1naXQgYS9wc2V1ZG9fd3JhcHBlcnMuYyBiL3BzZXVkb193cmFwcGVycy5jCi0tLS0gYS9wc2V1
ZG9fd3JhcHBlcnMuYwotKysrIGIvcHNldWRvX3dyYXBwZXJzLmMKLUBAIC0xMDAsMTAgKzEwMCwx
MyBAQCBzdGF0aWMgdm9pZCBsaWJwc2V1ZG9fYXRmb3JrX2NoaWxkKHZvaWQpCi0gCXBzZXVkb19t
dXRleF9ob2xkZXIgPSAwOwotIH0KLSAKLStleHRlcm4gdm9pZCAqX19kc29faGFuZGxlOwotK2V4
dGVybiBpbnQgX19yZWdpc3Rlcl9hdGZvcmsgKHZvaWQgKCopICh2b2lkKSwgdm9pZCAoKikgKHZv
aWQpLCB2b2lkICgqKSAodm9pZCksIHZvaWQgKik7Ci0rCi0gc3RhdGljIHZvaWQKLSBfbGlicHNl
dWRvX2luaXQodm9pZCkgewotIAlpZiAoIV9saWJwc2V1ZG9faW5pdHRlZCkKLS0JCXB0aHJlYWRf
YXRmb3JrKE5VTEwsIE5VTEwsIGxpYnBzZXVkb19hdGZvcmtfY2hpbGQpOwotKwkJX19yZWdpc3Rl
cl9hdGZvcmsgKE5VTEwsIE5VTEwsIGxpYnBzZXVkb19hdGZvcmtfY2hpbGQsICZfX2Rzb19oYW5k
bGUgPT0gTlVMTCA/IE5VTEwgOiBfX2Rzb19oYW5kbGUpOwotIAotIAlwc2V1ZG9fZ2V0bG9jaygp
OwotIAlwc2V1ZG9fYW50aW1hZ2ljKCk7Ci0tLSAKLTIuMjcuMAotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmIKaW5kZXggMzg1YjZmMzRkOS4uMDk5YTYwMjk3OCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRvX2dpdC5iYgpAQCAtMyw2ICsz
LDcgQEAgcmVxdWlyZSBwc2V1ZG8uaW5jCiBTUkNfVVJJID0gImdpdDovL2dpdC55b2N0b3Byb2pl
Y3Qub3JnL3BzZXVkbzticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAg
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
MDI4MmI4NGM4ZDk3Yjk5MDcyNDg1YWEiCiAKLVNSQ1JFViA9ICIyYzQzMzgxMTgwZjljZmVmNGMw
YThiYjBjMTY1OGE4NmMzZmNjODc2IgotUFYgPSAiMS45LjArZ2l0IgorU1JDUkVWID0gImJhYjdm
MDVmNGQxZjI5M2VlZGUwMzljMjQ2OGIwMDExZTVjMTg4YzIiCitQViA9ICIxLjkuMiIKIAogIyBs
YXJnZWZpbGUgYW5kIDY0Yml0IHRpbWVfdCBzdXBwb3J0IGFkZHMgdGhlc2UgbWFjcm9zIHZpYSBj
b21waWxlciBmbGFncyBnbG9iYWxseQogIyByZW1vdmUgdGhlbSBmb3IgcHNldWRvIHNpbmNlIHBz
ZXVkbyBpbnRlcmNlcHRzIHNvbWUgb2YgdGhlIGZ1bmN0aW9ucyB3aGljaCB3aWxsIGJlCi0tIAoy
LjQ3LjEKCg==

--===============1919856481755131846==--

