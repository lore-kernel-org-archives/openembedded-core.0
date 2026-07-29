Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6535FC54F9B
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:35 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6122.1785309865711445981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=leQ+01ej;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hdLe5q4c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019facc2a33c-21a1d888-e9bd-479a-87ca-2a8a39d9bc66-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309864;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wyv5GvkhlgnUla+Sz1bYLC26T3AKBQ4DS/VTXk3pNvg=;
	b=leQ+01ej8nZRHB2p5K8yPUK2+ULE65b/1gScmTD73qp7iHccveDFkrNFWAElhKl1
	M4nLjb8sK5DPJa604sIeeZRHGcCDHMpx0eW9JK26xobicuoS1FXMwGO3t6rRjYVzMh4
	6qhjZJZHsymQ2oFjDNPtNFXC0uYzEEA/pmd7armg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309864;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wyv5GvkhlgnUla+Sz1bYLC26T3AKBQ4DS/VTXk3pNvg=;
	b=hdLe5q4cwpEpaR33geD09FBuyu0TcyrXyJkhHzHWaRqfI/AXx3ZCvPxfWyBicaO3
	DWT9kW2XRXQEfCAShs5/gmsNffZC/pJYy/a1P+g5q14H0uP2PIw0ZjCVzPSvhZxsMVc
	cbyM2Evm1cgoVHXcRiLzUCtVdWPEn2XZkBa/oNF0=
Content-Type: multipart/mixed; boundary="===============0587511234317990707=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pseudo: upgrading to 1.9.9 FAILED
Message-ID: <0101019facc2a33c-21a1d888-e9bd-479a-87ca-2a8a39d9bc66-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242239

--===============0587511234317990707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pseudo* to *1.9.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-pseudo-upgrade-1.9.8-1.9.9.patch
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
From 6be4e467919807e55faac811a1d172ebf6b48241 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 05:38:24 +0000
Subject: [PATCH] pseudo: upgrade 1.9.8 -> 1.9.9

4194895 Makefile.in: Bump to 1.9.9
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
index 9f02d90568..1c86b3200c 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -3,6 +3,7 @@ require pseudo.inc
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;branch=master \
            file://fallback-passwd \
            file://fallback-group \
+           http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
            "
 SRC_URI:append:class-native = " \
     http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
@@ -12,8 +13,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "ca47829825f297d7bf83665c0541a9de4aa78009"
-PV = "1.9.8+git"
+SRCREV = "d544575779babb0b44500594fb8e5950b655a5aa"
+PV = "1.9.9"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
-- 
2.47.1


--===============0587511234317990707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pseudo-changelog.txt"

Changelog for pseudo: 1.9.8+git -> 1.9.9

4194895 Makefile.in: Bump to 1.9.9

--===============0587511234317990707==
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
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.9/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.9/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.9/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.9/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
ERROR: Parsing halted due to errors, see error messages above

--===============0587511234317990707==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pseudo-upgrade-1.9.8-1.9.9.patch"

RnJvbSA2YmU0ZTQ2NzkxOTgwN2U1NWZhYWM4MTFhMWQxNzJlYmY2YjQ4MjQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDU6Mzg6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
c2V1ZG86IHVwZ3JhZGUgMS45LjggLT4gMS45LjkKCjQxOTQ4OTUgTWFrZWZpbGUuaW46IEJ1bXAg
dG8gMS45LjkKLS0tCiAuLi4vcHNldWRvL2ZpbGVzL29sZGVyLWdsaWJjLXN5bWJvbHMucGF0Y2gg
ICAgfCA1NyAtLS0tLS0tLS0tLS0tLS0tLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRv
L3BzZXVkb19naXQuYmIgICAgfCAgNSArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDU5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9wc2V1ZG8vZmlsZXMvb2xkZXItZ2xpYmMtc3ltYm9scy5wYXRjaAoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vZmlsZXMvb2xkZXItZ2xpYmMtc3ltYm9scy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vZmlsZXMvb2xkZXItZ2xpYmMtc3lt
Ym9scy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZjQyYjMyYjhkOS4uMDAw
MDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVzL29sZGVyLWds
aWJjLXN5bWJvbHMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw1NyArMCwwIEBACi1JZiB3ZSBs
aW5rIGFnYWluc3QgYSBuZXdlciBnbGliYyAyLjM0IGFuZCB0aGVuIHRyeSBhbmQgb3VyIExEX1BS
RUxPQUQgaXMgcnVuIGFnYWluc3QgYQotYmluYXJ5IG9uIGEgaG9zdCB3aXRoIGFuIG9sZGVyIGxp
YmMsIHdlIHNlZSBzeW1ib2wgZXJyb3JzIHNpbmNlIGluIGdsaWJjIDIuMzQsIHB0aHJlYWQgCi1h
bmQgZGwgYXJlIG1lcmdlZCBpbnRvIGxpYmMgaXRzZWxmLgotCi1XZSBuZWVkIHRvIHVzZSB0aGUg
b2xkZXIgZm9ybSBvZiBsaW5raW5nIHNvIHVzZSBnbGliYyBiaW5hcmllcyBmcm9tIGFuIG9sZGVy
IHJlbGVhc2UKLXRvIGZvcmNlIHRoaXMuIFdlIG9ubHkgdXNlIG1pbmltYWwgc3ltYm9scyBmcm9t
IHRoZXNlIGFueXdheS4KLQotcHRocmVhZF9hdGZvcmsgaXMgcHJvYmxlbWF0aWMsIHBhcnRpY3Vs
YXJseSBvbiBhcm0gc28gdXNlIHRoZSBpbnRlcm5hbCBnbGliYyByb3V0aW5lCi1pdCBtYXBzIHRv
by4gVGhpcyB3YXMgYWx3YXlzIHByZXNlbnQgaW4gdGhlIG1haW4gbGliYyBmcm9tIDIuMy4yIG9u
d2FyZHMuCi0KLVllcyB0aGlzIGlzIGhvcnJpYmxlLiBCZXR0ZXIgc29sdXRpb25zIHdlbGNvbWUu
Ci0KLVRoZXJlIGlzIG1vcmUgaW5mbyBpbiB0aGUgYnVnOiBbWU9DVE8gIzE0NTIxXQotCi1VcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3RoaXMgcGF0Y2ggaXMgbmF0aXZlIGFuZCBuYXRp
dmVzZGtdCi1TaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZz4KLQotVHdlYWsgbGlicmFyeSBzZWFyY2ggb3JkZXIsIG1ha2UgcHJl
YnVpbHQgbGliIGFoZWFkIG9mIHJlY2lwZSBsaWIKLVNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEg
PGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KLS0tLQotIE1ha2VmaWxlLmluICAgICAgIHwgMiAr
LQotIHBzZXVkb193cmFwcGVycy5jIHwgNSArKysrLQotIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvTWFrZWZpbGUuaW4gYi9N
YWtlZmlsZS5pbgotLS0tIGEvTWFrZWZpbGUuaW4KLSsrKyBiL01ha2VmaWxlLmluCi1AQCAtMTIw
LDcgKzEyMCw3IEBAICQoUFNFVURPREIpOiBwc2V1ZG9kYi5vICQoU0hPQkpTKSAkKERCT0JKUykg
cHNldWRvX2lwYy5vIHwgJChCSU4pCi0gbGlicHNldWRvOiAkKExJQlBTRVVETykKLSAKLSAkKExJ
QlBTRVVETyk6ICQoV1JBUE9CSlMpIHBzZXVkb19jbGllbnQubyBwc2V1ZG9fY2xpZW50X3NjYW5m
Lm8gcHNldWRvX2lwYy5vICQoU0hPQkpTKSB8ICQoTElCKQotLQkkKENDKSAkKENGTEFHUykgJChD
RkxBR1NfUFNFVURPKSAtc2hhcmVkIC1vICQoTElCUFNFVURPKSBcCi0rCSQoQ0MpICQoQ0ZMQUdT
KSAgLUxwcmVidWlsdC8kKHNoZWxsIHVuYW1lIC1tKS1saW51eC9saWIvICQoQ0ZMQUdTX1BTRVVE
TykgLXNoYXJlZCAtbyAkKExJQlBTRVVETykgXAotIAkJcHNldWRvX2NsaWVudC5vIHBzZXVkb19j
bGllbnRfc2NhbmYubyBwc2V1ZG9faXBjLm8gXAotIAkJJChXUkFQT0JKUykgJChTSE9CSlMpICQo
TERGTEFHUykgJChDTElFTlRfTERGTEFHUykKLSAKLWRpZmYgLS1naXQgYS9wc2V1ZG9fd3JhcHBl
cnMuYyBiL3BzZXVkb193cmFwcGVycy5jCi0tLS0gYS9wc2V1ZG9fd3JhcHBlcnMuYwotKysrIGIv
cHNldWRvX3dyYXBwZXJzLmMKLUBAIC0xMDAsMTAgKzEwMCwxMyBAQCBzdGF0aWMgdm9pZCBsaWJw
c2V1ZG9fYXRmb3JrX2NoaWxkKHZvaWQpCi0gCXBzZXVkb19tdXRleF9ob2xkZXIgPSAwOwotIH0K
LSAKLStleHRlcm4gdm9pZCAqX19kc29faGFuZGxlOwotK2V4dGVybiBpbnQgX19yZWdpc3Rlcl9h
dGZvcmsgKHZvaWQgKCopICh2b2lkKSwgdm9pZCAoKikgKHZvaWQpLCB2b2lkICgqKSAodm9pZCks
IHZvaWQgKik7Ci0rCi0gc3RhdGljIHZvaWQKLSBfbGlicHNldWRvX2luaXQodm9pZCkgewotIAlp
ZiAoIV9saWJwc2V1ZG9faW5pdHRlZCkKLS0JCXB0aHJlYWRfYXRmb3JrKE5VTEwsIE5VTEwsIGxp
YnBzZXVkb19hdGZvcmtfY2hpbGQpOwotKwkJX19yZWdpc3Rlcl9hdGZvcmsgKE5VTEwsIE5VTEws
IGxpYnBzZXVkb19hdGZvcmtfY2hpbGQsICZfX2Rzb19oYW5kbGUgPT0gTlVMTCA/IE5VTEwgOiBf
X2Rzb19oYW5kbGUpOwotIAotIAlwc2V1ZG9fZ2V0bG9jaygpOwotIAlwc2V1ZG9fYW50aW1hZ2lj
KCk7Ci0tLSAKLTIuMjcuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNl
dWRvL3BzZXVkb19naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL3BzZXVkb19n
aXQuYmIKaW5kZXggOWYwMmQ5MDU2OC4uMWM4NmIzMjAwYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9wc2V1ZG8vcHNldWRvX2dpdC5iYgpAQCAtMyw2ICszLDcgQEAgcmVxdWlyZSBwc2V1ZG8u
aW5jCiBTUkNfVVJJID0gImdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3BzZXVkbzticmFuY2g9
bWFzdGVyO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAogICAgICAgICAgICBmaWxlOi8v
ZmFsbGJhY2stcGFzc3dkIFwKICAgICAgICAgICAgZmlsZTovL2ZhbGxiYWNrLWdyb3VwIFwKKyAg
ICAgICAgICAgaHR0cDovL2Rvd25sb2Fkcy55b2N0b3Byb2plY3Qub3JnL21pcnJvci9zb3VyY2Vz
L3BzZXVkby1wcmVidWlsdC0yLjMzLnRhci54ejtzdWJkaXI9JHtCQl9HSVRfREVGQVVMVF9ERVNU
U1VGRklYfS9wcmVidWlsdDtuYW1lPXByZWJ1aWx0IFwKICAgICAgICAgICAgIgogU1JDX1VSSTph
cHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBcCiAgICAgaHR0cDovL2Rvd25sb2Fkcy55b2N0b3Byb2pl
Y3Qub3JnL21pcnJvci9zb3VyY2VzL3BzZXVkby1wcmVidWlsdC0yLjMzLnRhci54ejtzdWJkaXI9
JHtCQl9HSVRfREVGQVVMVF9ERVNUU1VGRklYfS9wcmVidWlsdDtuYW1lPXByZWJ1aWx0IFwKQEAg
LTEyLDggKzEzLDggQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBcCiAgICAg
ZmlsZTovL29sZGVyLWdsaWJjLXN5bWJvbHMucGF0Y2giCiBTUkNfVVJJW3ByZWJ1aWx0LnNoYTI1
NnN1bV0gPSAiZWQ5ZjQ1Njg1NmU5ZDg2MzU5ZjE2OWY0NmE3MGFkN2JlNDE5MGQ2MDQwMjgyYjg0
YzhkOTdiOTkwNzI0ODVhYSIKIAotU1JDUkVWID0gImNhNDc4Mjk4MjVmMjk3ZDdiZjgzNjY1YzA1
NDFhOWRlNGFhNzgwMDkiCi1QViA9ICIxLjkuOCtnaXQiCitTUkNSRVYgPSAiZDU0NDU3NTc3OWJh
YmIwYjQ0NTAwNTk0ZmI4ZTU5NTBiNjU1YTVhYSIKK1BWID0gIjEuOS45IgogCiAjIGxhcmdlZmls
ZSBhbmQgNjRiaXQgdGltZV90IHN1cHBvcnQgYWRkcyB0aGVzZSBtYWNyb3MgdmlhIGNvbXBpbGVy
IGZsYWdzIGdsb2JhbGx5CiAjIHJlbW92ZSB0aGVtIGZvciBwc2V1ZG8gc2luY2UgcHNldWRvIGlu
dGVyY2VwdHMgc29tZSBvZiB0aGUgZnVuY3Rpb25zIHdoaWNoIHdpbGwgYmUKLS0gCjIuNDcuMQoK

--===============0587511234317990707==--

