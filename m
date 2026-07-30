Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA69C531D0
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 05:45:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5304.1785390318487118809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 22:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nNbPpeg8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mYhdvhl2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019fb18e4036-e6b9cbe3-8486-4211-9538-2da30242aa04-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785390317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/Mlr+lvUxFyz3EhgpMajXzOx2XgLWe66zoxNmtx2hps=;
	b=nNbPpeg8cn1zTfzH31hCcm1ra932qNItLIdEMzdq9hGw2yynhKy3CyIRbJLwWXkU
	BWy1NL9HhSzAJ8TG9jinBpD9DoGChQo/B5edihBa6LpcapP6rObQAmIyiiByj77CyhM
	wcNn5HOSLo2BJuCllMn2H0KgITjoFhSvSaC4ilFU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785390317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/Mlr+lvUxFyz3EhgpMajXzOx2XgLWe66zoxNmtx2hps=;
	b=mYhdvhl2sgxxARGAyu6ZDdKDOs9+IqElhBSpIa+IPnw0tbLU2Et2PY3nkLrfyjwT
	GpwF8737Oa3gFuGI9T2wSzvZelPZfWUv5Dp9jVjcxfjtq/ZghS7sN1faxPXS69ATShN
	g8n+IINY5xUuD1wNuixqfsYHS87wWsZo8WeJd8jw=
Content-Type: multipart/mixed; boundary="===============9211016858140764027=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pseudo: upgrading to 1.9.10 FAILED
Message-ID: <0101019fb18e4036-e6b9cbe3-8486-4211-9538-2da30242aa04-000000@us-west-2.amazonses.com>
Date: Thu, 30 Jul 2026 05:45:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.30-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242322

--===============9211016858140764027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pseudo* to *1.9.10* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-pseudo-upgrade-1.9.8-1.9.10.patch
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
From bda580b806fbbe5ac6ac31657c7bfabf2c32b6cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 30 Jul 2026 05:34:38 +0000
Subject: [PATCH] pseudo: upgrade 1.9.8 -> 1.9.10

2a5521e Makefile.in: Bump to 1.9.10
28c0fb3 test: various: Move to makefile compilation
a965bfc test-bash-exec-env: Add bash env test case
bdf1c01 test/test-openat2-func.c: Remove unusuaed saved_errno
2b2d160 pseudo_util.c: strchr now returns const char
5b88e91 pseudo_client: remove the unused pseudo_prefix_dir_fd
f2b420c pseudo_client: step around all of pseudo's own fds in closefrom
8907027 pseudo_client: step fully past pseudo's own fds when computing startfd
b3958b0 makewrappers: Avoid efault workaround if using AT_EMPTY_PATH
c63f439 ports/linux/guts: Add __open64_2 wrapper
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
index 9f02d90568..c0346ab09e 100644
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
+SRCREV = "00077a9e3be3e6497b17d42ec483d8c11cd18843"
+PV = "1.9.10"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
-- 
2.47.1


--===============9211016858140764027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pseudo-changelog.txt"

Changelog for pseudo: 1.9.8+git -> 1.9.10

2a5521e Makefile.in: Bump to 1.9.10
28c0fb3 test: various: Move to makefile compilation
a965bfc test-bash-exec-env: Add bash env test case
bdf1c01 test/test-openat2-func.c: Remove unusuaed saved_errno
2b2d160 pseudo_util.c: strchr now returns const char
5b88e91 pseudo_client: remove the unused pseudo_prefix_dir_fd
f2b420c pseudo_client: step around all of pseudo's own fds in closefrom
8907027 pseudo_client: step fully past pseudo's own fds when computing startfd
b3958b0 makewrappers: Avoid efault workaround if using AT_EMPTY_PATH
c63f439 ports/linux/guts: Add __open64_2 wrapper
4194895 Makefile.in: Bump to 1.9.9

--===============9211016858140764027==
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
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.10/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.10/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.10/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.9.10/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
ERROR: Parsing halted due to errors, see error messages above

--===============9211016858140764027==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pseudo-upgrade-1.9.8-1.9.10.patch"

RnJvbSBiZGE1ODBiODA2ZmJiZTVhYzZhYzMxNjU3YzdiZmFiZjJjMzJiNmNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMzAgSnVsIDIwMjYgMDU6MzQ6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
c2V1ZG86IHVwZ3JhZGUgMS45LjggLT4gMS45LjEwCgoyYTU1MjFlIE1ha2VmaWxlLmluOiBCdW1w
IHRvIDEuOS4xMAoyOGMwZmIzIHRlc3Q6IHZhcmlvdXM6IE1vdmUgdG8gbWFrZWZpbGUgY29tcGls
YXRpb24KYTk2NWJmYyB0ZXN0LWJhc2gtZXhlYy1lbnY6IEFkZCBiYXNoIGVudiB0ZXN0IGNhc2UK
YmRmMWMwMSB0ZXN0L3Rlc3Qtb3BlbmF0Mi1mdW5jLmM6IFJlbW92ZSB1bnVzdWFlZCBzYXZlZF9l
cnJubwoyYjJkMTYwIHBzZXVkb191dGlsLmM6IHN0cmNociBub3cgcmV0dXJucyBjb25zdCBjaGFy
CjViODhlOTEgcHNldWRvX2NsaWVudDogcmVtb3ZlIHRoZSB1bnVzZWQgcHNldWRvX3ByZWZpeF9k
aXJfZmQKZjJiNDIwYyBwc2V1ZG9fY2xpZW50OiBzdGVwIGFyb3VuZCBhbGwgb2YgcHNldWRvJ3Mg
b3duIGZkcyBpbiBjbG9zZWZyb20KODkwNzAyNyBwc2V1ZG9fY2xpZW50OiBzdGVwIGZ1bGx5IHBh
c3QgcHNldWRvJ3Mgb3duIGZkcyB3aGVuIGNvbXB1dGluZyBzdGFydGZkCmIzOTU4YjAgbWFrZXdy
YXBwZXJzOiBBdm9pZCBlZmF1bHQgd29ya2Fyb3VuZCBpZiB1c2luZyBBVF9FTVBUWV9QQVRICmM2
M2Y0MzkgcG9ydHMvbGludXgvZ3V0czogQWRkIF9fb3BlbjY0XzIgd3JhcHBlcgo0MTk0ODk1IE1h
a2VmaWxlLmluOiBCdW1wIHRvIDEuOS45Ci0tLQogLi4uL3BzZXVkby9maWxlcy9vbGRlci1nbGli
Yy1zeW1ib2xzLnBhdGNoICAgIHwgNTcgLS0tLS0tLS0tLS0tLS0tLS0tLQogbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJiICAgIHwgIDUgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA1OSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVzL29sZGVyLWdsaWJjLXN5bWJvbHMucGF0
Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVzL29sZGVy
LWdsaWJjLXN5bWJvbHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVz
L29sZGVyLWdsaWJjLXN5bWJvbHMucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IGY0MmIzMmI4ZDkuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVk
by9maWxlcy9vbGRlci1nbGliYy1zeW1ib2xzLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTcg
KzAsMCBAQAotSWYgd2UgbGluayBhZ2FpbnN0IGEgbmV3ZXIgZ2xpYmMgMi4zNCBhbmQgdGhlbiB0
cnkgYW5kIG91ciBMRF9QUkVMT0FEIGlzIHJ1biBhZ2FpbnN0IGEKLWJpbmFyeSBvbiBhIGhvc3Qg
d2l0aCBhbiBvbGRlciBsaWJjLCB3ZSBzZWUgc3ltYm9sIGVycm9ycyBzaW5jZSBpbiBnbGliYyAy
LjM0LCBwdGhyZWFkIAotYW5kIGRsIGFyZSBtZXJnZWQgaW50byBsaWJjIGl0c2VsZi4KLQotV2Ug
bmVlZCB0byB1c2UgdGhlIG9sZGVyIGZvcm0gb2YgbGlua2luZyBzbyB1c2UgZ2xpYmMgYmluYXJp
ZXMgZnJvbSBhbiBvbGRlciByZWxlYXNlCi10byBmb3JjZSB0aGlzLiBXZSBvbmx5IHVzZSBtaW5p
bWFsIHN5bWJvbHMgZnJvbSB0aGVzZSBhbnl3YXkuCi0KLXB0aHJlYWRfYXRmb3JrIGlzIHByb2Js
ZW1hdGljLCBwYXJ0aWN1bGFybHkgb24gYXJtIHNvIHVzZSB0aGUgaW50ZXJuYWwgZ2xpYmMgcm91
dGluZQotaXQgbWFwcyB0b28uIFRoaXMgd2FzIGFsd2F5cyBwcmVzZW50IGluIHRoZSBtYWluIGxp
YmMgZnJvbSAyLjMuMiBvbndhcmRzLgotCi1ZZXMgdGhpcyBpcyBob3JyaWJsZS4gQmV0dGVyIHNv
bHV0aW9ucyB3ZWxjb21lLgotCi1UaGVyZSBpcyBtb3JlIGluZm8gaW4gdGhlIGJ1ZzogW1lPQ1RP
ICMxNDUyMV0KLQotVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFt0aGlzIHBhdGNoIGlz
IG5hdGl2ZSBhbmQgbmF0aXZlc2RrXQotU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0KLVR3ZWFrIGxpYnJhcnkgc2VhcmNo
IG9yZGVyLCBtYWtlIHByZWJ1aWx0IGxpYiBhaGVhZCBvZiByZWNpcGUgbGliCi1TaWduZWQtb2Zm
LWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+Ci0tLS0KLSBNYWtlZmls
ZS5pbiAgICAgICB8IDIgKy0KLSBwc2V1ZG9fd3JhcHBlcnMuYyB8IDUgKysrKy0KLSAyIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBh
L01ha2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLS0tLSBhL01ha2VmaWxlLmluCi0rKysgYi9NYWtl
ZmlsZS5pbgotQEAgLTEyMCw3ICsxMjAsNyBAQCAkKFBTRVVET0RCKTogcHNldWRvZGIubyAkKFNI
T0JKUykgJChEQk9CSlMpIHBzZXVkb19pcGMubyB8ICQoQklOKQotIGxpYnBzZXVkbzogJChMSUJQ
U0VVRE8pCi0gCi0gJChMSUJQU0VVRE8pOiAkKFdSQVBPQkpTKSBwc2V1ZG9fY2xpZW50Lm8gcHNl
dWRvX2NsaWVudF9zY2FuZi5vIHBzZXVkb19pcGMubyAkKFNIT0JKUykgfCAkKExJQikKLS0JJChD
QykgJChDRkxBR1MpICQoQ0ZMQUdTX1BTRVVETykgLXNoYXJlZCAtbyAkKExJQlBTRVVETykgXAot
KwkkKENDKSAkKENGTEFHUykgIC1McHJlYnVpbHQvJChzaGVsbCB1bmFtZSAtbSktbGludXgvbGli
LyAkKENGTEFHU19QU0VVRE8pIC1zaGFyZWQgLW8gJChMSUJQU0VVRE8pIFwKLSAJCXBzZXVkb19j
bGllbnQubyBwc2V1ZG9fY2xpZW50X3NjYW5mLm8gcHNldWRvX2lwYy5vIFwKLSAJCSQoV1JBUE9C
SlMpICQoU0hPQkpTKSAkKExERkxBR1MpICQoQ0xJRU5UX0xERkxBR1MpCi0gCi1kaWZmIC0tZ2l0
IGEvcHNldWRvX3dyYXBwZXJzLmMgYi9wc2V1ZG9fd3JhcHBlcnMuYwotLS0tIGEvcHNldWRvX3dy
YXBwZXJzLmMKLSsrKyBiL3BzZXVkb193cmFwcGVycy5jCi1AQCAtMTAwLDEwICsxMDAsMTMgQEAg
c3RhdGljIHZvaWQgbGlicHNldWRvX2F0Zm9ya19jaGlsZCh2b2lkKQotIAlwc2V1ZG9fbXV0ZXhf
aG9sZGVyID0gMDsKLSB9Ci0gCi0rZXh0ZXJuIHZvaWQgKl9fZHNvX2hhbmRsZTsKLStleHRlcm4g
aW50IF9fcmVnaXN0ZXJfYXRmb3JrICh2b2lkICgqKSAodm9pZCksIHZvaWQgKCopICh2b2lkKSwg
dm9pZCAoKikgKHZvaWQpLCB2b2lkICopOwotKwotIHN0YXRpYyB2b2lkCi0gX2xpYnBzZXVkb19p
bml0KHZvaWQpIHsKLSAJaWYgKCFfbGlicHNldWRvX2luaXR0ZWQpCi0tCQlwdGhyZWFkX2F0Zm9y
ayhOVUxMLCBOVUxMLCBsaWJwc2V1ZG9fYXRmb3JrX2NoaWxkKTsKLSsJCV9fcmVnaXN0ZXJfYXRm
b3JrIChOVUxMLCBOVUxMLCBsaWJwc2V1ZG9fYXRmb3JrX2NoaWxkLCAmX19kc29faGFuZGxlID09
IE5VTEwgPyBOVUxMIDogX19kc29faGFuZGxlKTsKLSAKLSAJcHNldWRvX2dldGxvY2soKTsKLSAJ
cHNldWRvX2FudGltYWdpYygpOwotLS0gCi0yLjI3LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BzZXVkby9wc2V1ZG9fZ2l0LmJiCmluZGV4IDlmMDJkOTA1NjguLmMwMzQ2YWIwOWUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRvX2dpdC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmIKQEAgLTMsNiArMyw3IEBA
IHJlcXVpcmUgcHNldWRvLmluYwogU1JDX1VSSSA9ICJnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9y
Zy9wc2V1ZG87YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKICAg
ICAgICAgICAgZmlsZTovL2ZhbGxiYWNrLXBhc3N3ZCBcCiAgICAgICAgICAgIGZpbGU6Ly9mYWxs
YmFjay1ncm91cCBcCisgICAgICAgICAgIGh0dHA6Ly9kb3dubG9hZHMueW9jdG9wcm9qZWN0Lm9y
Zy9taXJyb3Ivc291cmNlcy9wc2V1ZG8tcHJlYnVpbHQtMi4zMy50YXIueHo7c3ViZGlyPSR7QkJf
R0lUX0RFRkFVTFRfREVTVFNVRkZJWH0vcHJlYnVpbHQ7bmFtZT1wcmVidWlsdCBcCiAgICAgICAg
ICAgICIKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgXAogICAgIGh0dHA6Ly9kb3du
bG9hZHMueW9jdG9wcm9qZWN0Lm9yZy9taXJyb3Ivc291cmNlcy9wc2V1ZG8tcHJlYnVpbHQtMi4z
My50YXIueHo7c3ViZGlyPSR7QkJfR0lUX0RFRkFVTFRfREVTVFNVRkZJWH0vcHJlYnVpbHQ7bmFt
ZT1wcmVidWlsdCBcCkBAIC0xMiw4ICsxMyw4IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2
ZXNkayA9ICIgXAogICAgIGZpbGU6Ly9vbGRlci1nbGliYy1zeW1ib2xzLnBhdGNoIgogU1JDX1VS
SVtwcmVidWlsdC5zaGEyNTZzdW1dID0gImVkOWY0NTY4NTZlOWQ4NjM1OWYxNjlmNDZhNzBhZDdi
ZTQxOTBkNjA0MDI4MmI4NGM4ZDk3Yjk5MDcyNDg1YWEiCiAKLVNSQ1JFViA9ICJjYTQ3ODI5ODI1
ZjI5N2Q3YmY4MzY2NWMwNTQxYTlkZTRhYTc4MDA5IgotUFYgPSAiMS45LjgrZ2l0IgorU1JDUkVW
ID0gIjAwMDc3YTllM2JlM2U2NDk3YjE3ZDQyZWM0ODNkOGMxMWNkMTg4NDMiCitQViA9ICIxLjku
MTAiCiAKICMgbGFyZ2VmaWxlIGFuZCA2NGJpdCB0aW1lX3Qgc3VwcG9ydCBhZGRzIHRoZXNlIG1h
Y3JvcyB2aWEgY29tcGlsZXIgZmxhZ3MgZ2xvYmFsbHkKICMgcmVtb3ZlIHRoZW0gZm9yIHBzZXVk
byBzaW5jZSBwc2V1ZG8gaW50ZXJjZXB0cyBzb21lIG9mIHRoZSBmdW5jdGlvbnMgd2hpY2ggd2ls
bCBiZQotLSAKMi40Ny4xCgo=

--===============9211016858140764027==--

