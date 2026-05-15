Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3A1CD5BCF
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34767.1778851237378697946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V+Iiv7Mf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=En33K4a5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e2bcbd1c9-e3047c2f-5e66-4ed3-b1b9-969f65e583b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851238;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QXwDh2datJoDi2xsTMms+mFvbFaWyv+sQ7KCtbENJDk=;
	b=V+Iiv7MfkJDQlpO/+ne+0XEoe2Fv0ju/zI3ko8NdiKoBTwlF9isdHAiMKu5w/s/3
	gkr03pqApLacva+fP+4vg+U9kTRT4BGKsk6/JLoy2FHsKMe2/tVS+glgCgztEfUc9Co
	SCUPd6kFmHrK+2jQIT2L14zgtYRSLdx8U66keuc0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851238;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QXwDh2datJoDi2xsTMms+mFvbFaWyv+sQ7KCtbENJDk=;
	b=En33K4a5YnJjWkRZRoclCyHPda+y8379ljFH9SMqpCltd0Xg1xW549MeMlB1pplM
	X7VTSRm6GWotV8OKeiGks9YUFc2MTWauoqhMuT1FNGrOof55aoNsnuAUE+2UDrAZY2J
	uEYCNySq7XdVwawFY39iCtZcOfQDvp//wTyPtaaE=
Content-Type: multipart/mixed; boundary="===============7754585922417570540=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] virglrenderer: upgrading to 1.3.0 FAILED
Message-ID: <0101019e2bcbd1c9-e3047c2f-5e66-4ed3-b1b9-969f65e583b4-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237143

--===============7754585922417570540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *virglrenderer* to *1.3.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-virglrenderer-upgrade-1.2.0-1.3.0.patch
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
From 307b681b7dd834f4c4923b1d01f25b904d88219d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 10:14:18 +0000
Subject: [PATCH] virglrenderer: upgrade 1.2.0 -> 1.3.0

---
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 57 -------------------
 ...uild-use-python3-directly-for-python.patch |  8 +--
 ...5fc57b07c06b5e0b3a3694d06898ebc80163.patch |  7 +--
 ...nderer_1.2.0.bb => virglrenderer_1.3.0.bb} |  3 +-
 4 files changed, 7 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.2.0.bb => virglrenderer_1.3.0.bb} (91%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
deleted file mode 100644
index 5f90d59ba7..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c076c52a323584d6d00ca7079072cbc0dd88cb43 Mon Sep 17 00:00:00 2001
-From: Dave Airlie <airlied@redhat.com>
-Date: Fri, 7 Nov 2025 13:14:56 +1000
-Subject: [PATCH] c11/threads: fix build on c23
-
-C23/glibc is now including once_init in stdlib.h
-
-https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
-
-Just fix up our use of it.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/3f0f775edb2df5ea54c37863286ad565ccddb276]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mesa/compat/c11/threads_posix.h | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/mesa/compat/c11/threads_posix.h b/src/mesa/compat/c11/threads_posix.h
-index 45cb6075..071faf79 100644
---- a/src/mesa/compat/c11/threads_posix.h
-+++ b/src/mesa/compat/c11/threads_posix.h
-@@ -51,7 +51,9 @@ Configuration macro:
- #include <pthread.h>
- 
- /*---------------------------- macros ----------------------------*/
-+#ifndef __once_flag_defined
- #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
-+#endif
- #ifdef INIT_ONCE_STATIC_INIT
- #define TSS_DTOR_ITERATIONS PTHREAD_DESTRUCTOR_ITERATIONS
- #else
-@@ -66,8 +68,9 @@ typedef pthread_cond_t  cnd_t;
- typedef pthread_t       thrd_t;
- typedef pthread_key_t   tss_t;
- typedef pthread_mutex_t mtx_t;
-+#ifndef __once_flag_defined
- typedef pthread_once_t  once_flag;
--
-+#endif
- 
- /*
- Implementation limits:
-@@ -90,12 +93,13 @@ impl_thrd_routine(void *p)
- 
- /*--------------- 7.25.2 Initialization functions ---------------*/
- // 7.25.2.1
-+#ifndef __once_flag_defined
- static inline void
- call_once(once_flag *flag, void (*func)(void))
- {
-     pthread_once(flag, func);
- }
--
-+#endif
- 
- /*------------- 7.25.3 Condition variable functions -------------*/
- // 7.25.3.1
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 6f0ba3ebab..155158bf5d 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 51c8a5a568b2cd1dfcb53ed3b49a0f8899be7be4 Mon Sep 17 00:00:00 2001
+From 4c742710ca76117382d8cba7a910df1711435648 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 193ba32b..c01cae65 100644
+index 69c1bb82..08b1f266 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -77,7 +77,7 @@ flags = [
@@ -23,5 +23,5 @@ index 193ba32b..c01cae65 100644
 -prog_python = import('python').find_installation('python3')
 +prog_python = 'python3'
  
- not_found = dependency('', required: false)
- gbm_dep = not_found
+ with_host_windows = host_machine.system() == 'windows'
+ with_host_darwin = host_machine.system() == 'darwin'
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch
index 91e01f0616..5c37135e55 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch
@@ -1,4 +1,4 @@
-From 986b5fc57b07c06b5e0b3a3694d06898ebc80163 Mon Sep 17 00:00:00 2001
+From c181d00491ad1207a43379042ba3499f21da0635 Mon Sep 17 00:00:00 2001
 From: Maximilian Hofmann <maxi@maxiicodes.dev>
 Date: Thu, 26 Feb 2026 23:28:58 +0100
 Subject: [PATCH] fix: build with glibc 2.43
@@ -19,7 +19,7 @@ Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/15
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/gallium/auxiliary/tgsi/tgsi_text.c b/src/gallium/auxiliary/tgsi/tgsi_text.c
-index db7d7b952..7e37bf794 100644
+index db7d7b95..7e37bf79 100644
 --- a/src/gallium/auxiliary/tgsi/tgsi_text.c
 +++ b/src/gallium/auxiliary/tgsi/tgsi_text.c
 @@ -84,7 +84,7 @@ streq_nocase_uprcase(const char *str1,
@@ -31,6 +31,3 @@ index db7d7b952..7e37bf794 100644
     if (unlikely(str)) {
        *pcur = str;
        return false;
---
-GitLab
-
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb
similarity index 91%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb
index c7aef527b0..b30c227c92 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy python3-pyyaml-native virtual/egl virtual/libgbm"
-SRCREV = "500b41d5c8638f9b80dd558f4044f3301c7457a4"
+SRCREV = "ca50e008863837e094747a69974dde3ae148aeaa"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=${PV} \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
            file://986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch \
            "
 
-- 
2.47.1


--===============7754585922417570540==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.2.0-1.3.0.patch"

RnJvbSAzMDdiNjgxYjdkZDgzNGY0YzQ5MjNiMWQwMWYyNWI5MDRkODgyMTlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTA6MTQ6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
aXJnbHJlbmRlcmVyOiB1cGdyYWRlIDEuMi4wIC0+IDEuMy4wCgotLS0KIC4uLm9uY2VfZmxhZy1P
TkNFX0ZMQUdfSU5JVC13aGVuLXByZXNlbi5wYXRjaCB8IDU3IC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaCB8ICA4ICstLQog
Li4uNWZjNTdiMDdjMDZiNWUwYjNhMzY5NGQwNjg5OGViYzgwMTYzLnBhdGNoIHwgIDcgKy0tCiAu
Li5uZGVyZXJfMS4yLjAuYmIgPT4gdmlyZ2xyZW5kZXJlcl8xLjMuMC5iYn0gfCAgMyArLQogNCBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDY4IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVy
ZXIvMDAwMS1jMTEtdXNlLWdsaWJjLXMtb25jZV9mbGFnLU9OQ0VfRkxBR19JTklULXdoZW4tcHJl
c2VuLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIve3Zp
cmdscmVuZGVyZXJfMS4yLjAuYmIgPT4gdmlyZ2xyZW5kZXJlcl8xLjMuMC5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRl
cmVyLzAwMDEtYzExLXVzZS1nbGliYy1zLW9uY2VfZmxhZy1PTkNFX0ZMQUdfSU5JVC13aGVuLXBy
ZXNlbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVu
ZGVyZXIvMDAwMS1jMTEtdXNlLWdsaWJjLXMtb25jZV9mbGFnLU9OQ0VfRkxBR19JTklULXdoZW4t
cHJlc2VuLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA1ZjkwZDU5YmE3Li4w
MDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3Zpcmds
cmVuZGVyZXIvMDAwMS1jMTEtdXNlLWdsaWJjLXMtb25jZV9mbGFnLU9OQ0VfRkxBR19JTklULXdo
ZW4tcHJlc2VuLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNTcgKzAsMCBAQAotRnJvbSBjMDc2
YzUyYTMyMzU4NGQ2ZDAwY2E3MDc5MDcyY2JjMGRkODhjYjQzIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQotRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KLURhdGU6IEZyaSwg
NyBOb3YgMjAyNSAxMzoxNDo1NiArMTAwMAotU3ViamVjdDogW1BBVENIXSBjMTEvdGhyZWFkczog
Zml4IGJ1aWxkIG9uIGMyMwotCi1DMjMvZ2xpYmMgaXMgbm93IGluY2x1ZGluZyBvbmNlX2luaXQg
aW4gc3RkbGliLmgKLQotaHR0cHM6Ly9wYXRjaHdvcmsuc291cmNld2FyZS5vcmcvcHJvamVjdC9n
bGliYy9wYXRjaC83ODA2MTA4NS1mMDRhLTBjNDUtMTA3Yi01YThhMTU1MjEwODNAcmVkaGF0LmNv
bS8jMjEzMDg4Ci0KLUp1c3QgZml4IHVwIG91ciB1c2Ugb2YgaXQuCi0KLVVwc3RyZWFtLVN0YXR1
czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aXJnbC92aXJnbHJl
bmRlcmVyLy0vY29tbWl0LzNmMGY3NzVlZGIyZGY1ZWE1NGMzNzg2MzI4NmFkNTY1Y2NkZGIyNzZd
Ci1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gc3Jj
L21lc2EvY29tcGF0L2MxMS90aHJlYWRzX3Bvc2l4LmggfCA4ICsrKysrKy0tCi0gMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3Ny
Yy9tZXNhL2NvbXBhdC9jMTEvdGhyZWFkc19wb3NpeC5oIGIvc3JjL21lc2EvY29tcGF0L2MxMS90
aHJlYWRzX3Bvc2l4LmgKLWluZGV4IDQ1Y2I2MDc1Li4wNzFmYWY3OSAxMDA2NDQKLS0tLSBhL3Ny
Yy9tZXNhL2NvbXBhdC9jMTEvdGhyZWFkc19wb3NpeC5oCi0rKysgYi9zcmMvbWVzYS9jb21wYXQv
YzExL3RocmVhZHNfcG9zaXguaAotQEAgLTUxLDcgKzUxLDkgQEAgQ29uZmlndXJhdGlvbiBtYWNy
bzoKLSAjaW5jbHVkZSA8cHRocmVhZC5oPgotIAotIC8qLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSBtYWNyb3MgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovCi0rI2lmbmRlZiBfX29u
Y2VfZmxhZ19kZWZpbmVkCi0gI2RlZmluZSBPTkNFX0ZMQUdfSU5JVCBQVEhSRUFEX09OQ0VfSU5J
VAotKyNlbmRpZgotICNpZmRlZiBJTklUX09OQ0VfU1RBVElDX0lOSVQKLSAjZGVmaW5lIFRTU19E
VE9SX0lURVJBVElPTlMgUFRIUkVBRF9ERVNUUlVDVE9SX0lURVJBVElPTlMKLSAjZWxzZQotQEAg
LTY2LDggKzY4LDkgQEAgdHlwZWRlZiBwdGhyZWFkX2NvbmRfdCAgY25kX3Q7Ci0gdHlwZWRlZiBw
dGhyZWFkX3QgICAgICAgdGhyZF90OwotIHR5cGVkZWYgcHRocmVhZF9rZXlfdCAgIHRzc190Owot
IHR5cGVkZWYgcHRocmVhZF9tdXRleF90IG10eF90OwotKyNpZm5kZWYgX19vbmNlX2ZsYWdfZGVm
aW5lZAotIHR5cGVkZWYgcHRocmVhZF9vbmNlX3QgIG9uY2VfZmxhZzsKLS0KLSsjZW5kaWYKLSAK
LSAvKgotIEltcGxlbWVudGF0aW9uIGxpbWl0czoKLUBAIC05MCwxMiArOTMsMTMgQEAgaW1wbF90
aHJkX3JvdXRpbmUodm9pZCAqcCkKLSAKLSAvKi0tLS0tLS0tLS0tLS0tLSA3LjI1LjIgSW5pdGlh
bGl6YXRpb24gZnVuY3Rpb25zIC0tLS0tLS0tLS0tLS0tLSovCi0gLy8gNy4yNS4yLjEKLSsjaWZu
ZGVmIF9fb25jZV9mbGFnX2RlZmluZWQKLSBzdGF0aWMgaW5saW5lIHZvaWQKLSBjYWxsX29uY2Uo
b25jZV9mbGFnICpmbGFnLCB2b2lkICgqZnVuYykodm9pZCkpCi0gewotICAgICBwdGhyZWFkX29u
Y2UoZmxhZywgZnVuYyk7Ci0gfQotLQotKyNlbmRpZgotIAotIC8qLS0tLS0tLS0tLS0tLSA3LjI1
LjMgQ29uZGl0aW9uIHZhcmlhYmxlIGZ1bmN0aW9ucyAtLS0tLS0tLS0tLS0tKi8KLSAvLyA3LjI1
LjMuMQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmly
Z2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRo
b24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRl
cmVyLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRj
aAppbmRleCA2ZjBiYTNlYmFiLi4xNTUxNThiZjVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAwMDEtbWVzb24uYnVpbGQtdXNl
LXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5
dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTFj
OGE1YTU2OGIyY2QxZGZjYjUzZWQzYjQ5YTBmODg5OWJlN2JlNCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gNGM3NDI3MTBjYTc2MTE3MzgyZDhjYmE3YTkxMGRmMTcxMTQzNTY0OCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogTW9uLCA2IEphbiAyMDIwIDEyOjQ0OjQyICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiB1c2UgJ3B5dGhvbjMnIGRpcmVjdGx5IGZvciBweXRo
b24KQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1p
bmRleCAxOTNiYTMyYi4uYzAxY2FlNjUgMTAwNjQ0CitpbmRleCA2OWMxYmI4Mi4uMDhiMWYyNjYg
MTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC03Nyw3ICs3
Nyw3IEBAIGZsYWdzID0gWwpAQCAtMjMsNSArMjMsNSBAQCBpbmRleCAxOTNiYTMyYi4uYzAxY2Fl
NjUgMTAwNjQ0CiAtcHJvZ19weXRob24gPSBpbXBvcnQoJ3B5dGhvbicpLmZpbmRfaW5zdGFsbGF0
aW9uKCdweXRob24zJykKICtwcm9nX3B5dGhvbiA9ICdweXRob24zJwogIAotIG5vdF9mb3VuZCA9
IGRlcGVuZGVuY3koJycsIHJlcXVpcmVkOiBmYWxzZSkKLSBnYm1fZGVwID0gbm90X2ZvdW5kCisg
d2l0aF9ob3N0X3dpbmRvd3MgPSBob3N0X21hY2hpbmUuc3lzdGVtKCkgPT0gJ3dpbmRvd3MnCisg
d2l0aF9ob3N0X2RhcndpbiA9IGhvc3RfbWFjaGluZS5zeXN0ZW0oKSA9PSAnZGFyd2luJwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJl
ci85ODZiNWZjNTdiMDdjMDZiNWUwYjNhMzY5NGQwNjg5OGViYzgwMTYzLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci85ODZiNWZjNTdiMDdj
MDZiNWUwYjNhMzY5NGQwNjg5OGViYzgwMTYzLnBhdGNoCmluZGV4IDkxZTAxZjA2MTYuLjVjMzcx
MzVlNTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3Zp
cmdscmVuZGVyZXIvOTg2YjVmYzU3YjA3YzA2YjVlMGIzYTM2OTRkMDY4OThlYmM4MDE2My5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVy
Lzk4NmI1ZmM1N2IwN2MwNmI1ZTBiM2EzNjk0ZDA2ODk4ZWJjODAxNjMucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDk4NmI1ZmM1N2IwN2MwNmI1ZTBiM2EzNjk0ZDA2ODk4ZWJjODAxNjMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGMxODFkMDA0OTFhZDEyMDdhNDMzNzkwNDJiYTM0
OTlmMjFkYTA2MzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXhpbWlsaWFuIEhv
Zm1hbm4gPG1heGlAbWF4aWljb2Rlcy5kZXY+CiBEYXRlOiBUaHUsIDI2IEZlYiAyMDI2IDIzOjI4
OjU4ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGZpeDogYnVpbGQgd2l0aCBnbGliYyAyLjQzCkBA
IC0xOSw3ICsxOSw3IEBAIFBhcnQtb2Y6IDxodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
dmlyZ2wvdmlyZ2xyZW5kZXJlci8tL21lcmdlX3JlcXVlc3RzLzE1CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvZ2FsbGl1
bS9hdXhpbGlhcnkvdGdzaS90Z3NpX3RleHQuYyBiL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS90Z3Np
L3Rnc2lfdGV4dC5jCi1pbmRleCBkYjdkN2I5NTIuLjdlMzdiZjc5NCAxMDA2NDQKK2luZGV4IGRi
N2Q3Yjk1Li43ZTM3YmY3OSAxMDA2NDQKIC0tLSBhL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS90Z3Np
L3Rnc2lfdGV4dC5jCiArKysgYi9zcmMvZ2FsbGl1bS9hdXhpbGlhcnkvdGdzaS90Z3NpX3RleHQu
YwogQEAgLTg0LDcgKzg0LDcgQEAgc3RyZXFfbm9jYXNlX3VwcmNhc2UoY29uc3QgY2hhciAqc3Ry
MSwKQEAgLTMxLDYgKzMxLDMgQEAgaW5kZXggZGI3ZDdiOTUyLi43ZTM3YmY3OTQgMTAwNjQ0CiAg
ICAgaWYgKHVubGlrZWx5KHN0cikpIHsKICAgICAgICAqcGN1ciA9IHN0cjsKICAgICAgICByZXR1
cm4gZmFsc2U7Ci0tLQotR2l0TGFiCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzEuMy4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3Zp
cmdscmVuZGVyZXJfMS4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJn
bHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4zLjAuYmIKaW5kZXggYzdhZWY1MjdiMC4uYjMwYzIy
N2M5MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmly
Z2xyZW5kZXJlcl8xLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5k
ZXJlci92aXJnbHJlbmRlcmVyXzEuMy4wLmJiCkBAIC05LDEwICs5LDkgQEAgTElDRU5TRSA9ICJN
SVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jODFjMDhlZWVmZDk0
MThmY2E4Zjg4MzA5YTc2ZGIxMCIKIAogREVQRU5EUyA9ICJsaWJkcm0gbGliZXBveHkgcHl0aG9u
My1weXlhbWwtbmF0aXZlIHZpcnR1YWwvZWdsIHZpcnR1YWwvbGliZ2JtIgotU1JDUkVWID0gIjUw
MGI0MWQ1Yzg2MzhmOWI4MGRkNTU4ZjQwNDRmMzMwMWM3NDU3YTQiCitTUkNSRVYgPSAiY2E1MGUw
MDg4NjM4MzdlMDk0NzQ3YTY5OTc0ZGRlM2FlMTQ4YWVhYSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy92aXJnbC92aXJnbHJlbmRlcmVyLmdpdDticmFuY2g9bWFpbjtw
cm90b2NvbD1odHRwczt0YWc9JHtQVn0gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1tZXNvbi5i
dWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIFwKLSAgICAgICAgICAg
ZmlsZTovLzAwMDEtYzExLXVzZS1nbGliYy1zLW9uY2VfZmxhZy1PTkNFX0ZMQUdfSU5JVC13aGVu
LXByZXNlbi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly85ODZiNWZjNTdiMDdjMDZiNWUwYjNh
MzY5NGQwNjg5OGViYzgwMTYzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi0tIAoyLjQ3LjEKCg==

--===============7754585922417570540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-9e67003745cc81efeb0857406c44f3a40be8dc85"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9e67003745cc81efeb0857406c44f3a40be8dc85"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 297 Local 284 Mirrors 0 Missed 13 Current 794 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2369 of 2582 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_recipe_qa)
NOTE: Running task 2459 of 2582 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_write_config)
NOTE: Running task 2551 of 2582 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_create_recipe_spdx)
NOTE: recipe virglrenderer-1.3.0-r0: task do_recipe_qa: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_write_config: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_recipe_qa unihash changed to fe2a315a9c03ab93814e3d41605afcdc856d489cee6295e6c74b8f2e92018cd9
NOTE: Setscene tasks completed
NOTE: Running task 2564 of 2582 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_fetch)
NOTE: recipe virglrenderer-1.3.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_fetch: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2565 of 2582 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_unpack)
NOTE: Running task 2566 of 2582 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.3.0-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2567 of 2582 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_patch)
NOTE: recipe virglrenderer-1.3.0-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2568 of 2582 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2569 of 2582 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_populate_lic)
NOTE: recipe virglrenderer-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_populate_lic: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_deploy_source_date_epoch unihash changed to ec1a57952e7b840670daea61e8cca77de046578bdb609a8ac7978ac2f489c7e7
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_populate_lic unihash changed to 8488cd7be265d934a0fb4ed2334f160f6e14ca45b7fd37141523414e1e35a83a
NOTE: Setscene tasks completed
NOTE: Running task 2570 of 2582 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure)
NOTE: recipe virglrenderer-1.3.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/laye
 rs/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/
 layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libtool-native', 'm4-native', 'opkg-utils', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'libdrm', 'libepoxy', 'mesa', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libpciaccess', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'acl', 'attr', 'curl', 'gmp', 'gnutls', 'libtasn1', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libseccomp', 'libunistring', 'nettle', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native'
 , 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'python3-build-native', 'python3-cython-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-pyyaml-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'libyaml-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus=true -Dvenus-validate=false...
| The Meson build system
| Version: 1.11.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/sources/virglrenderer-1.3.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/build
| Build type: cross build
| 
| ../sources/virglrenderer-1.3.0/meson.build:24:0: ERROR: Unknown option: "render-server".
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Main binary: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/recipe-sysroot-native/usr/bin/nativepython3
| Build Options: -Dbuildtype=plain -Dprefix=/usr -Dbindir=/usr/bin -Ddatadir=/usr/share -Dincludedir=/usr/include -Dinfodir=/usr/share/info -Dlibdir=/usr/lib -Dlibexecdir=/usr/libexec -Dlocalstatedir=/var -Dmandir=/usr/share/man -Dsbindir=/usr/sbin -Dsharedstatedir=/com -Dsysconfdir=/etc -Dwrap_mode=nodownload -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus=true -Dvenus-validate=false --cross-file=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/meson.cross --native-file=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/meson.native
| Python system: Linux
| The Meson build system
| Version: 1.11.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/sources/virglrenderer-1.3.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/build
| Build type: cross build
| 
| ../sources/virglrenderer-1.3.0/meson.build:24:0: ERROR: Unknown option: "render-server".
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.2496860:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.2496860, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.2496860, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.2496860, line 146
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.2496860, line 183
NOTE: recipe virglrenderer-1.3.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2570 tasks of which 2560 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515101403.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515101403.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/log.do_configure.2496860
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: virglrenderer-1.3.0-r0 do_configure: meson setup failed
ERROR: virglrenderer-1.3.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.2496860' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/log.do_configure.2496860
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure) failed with exit code '1'

--===============7754585922417570540==--

