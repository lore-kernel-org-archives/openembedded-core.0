Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29952CD4F24
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:26:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15602.1777645526072816566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JYGR5o7U;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ScC4U5T4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019de3ee806a-82528a6b-fede-4241-9453-77d30c1efd58-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BikFgM9jrfttgmPRSLYNKlgVIU6dio3jw+03tvTPfcM=;
	b=JYGR5o7UOi8oy4zmfI0b3X8EIvCQ0GFpzFnmMYWkHW6L/eVbFo51iTH/zZElrWw1
	mQhuXZQA72jaidGLsWc++JJQd1YYa6qEvWh7urwk3IHphP67z5Lr+92CyzZAOgiJ6GW
	z56J/t+iAMPuwx+mNQCXIKV8lMp45uDw9YtCNf7k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BikFgM9jrfttgmPRSLYNKlgVIU6dio3jw+03tvTPfcM=;
	b=ScC4U5T4AO8Q/GveFiXcTVaXSv8MDIEdL8jWTBGfZfjPEF8EBpGg7Capbtjre4Wk
	Nkgc9NJYizdSUdpShowH3BS6dYeGrayTdpiI+PgX1BKlsnrg8zrzxC9Dc/57tZp3NPn
	jE3buekdQWmuq/K7Hrfk86gUzSoO3joDdAgStBbM=
Content-Type: multipart/mixed; boundary="===============0961094550889436231=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] virglrenderer: upgrading to 1.3.0 FAILED
Message-ID: <0101019de3ee806a-82528a6b-fede-4241-9453-77d30c1efd58-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236278

--===============0961094550889436231==
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
From b1a95b7bbe2170b03044119f529cd7af610a66f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 12:28:52 +0000
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
index 6f0ba3ebab..3e57eadfd9 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 51c8a5a568b2cd1dfcb53ed3b49a0f8899be7be4 Mon Sep 17 00:00:00 2001
+From a335a3cf5634544913b54e1817d510d952c052de Mon Sep 17 00:00:00 2001
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
index 91e01f0616..3039e8f541 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch
@@ -1,4 +1,4 @@
-From 986b5fc57b07c06b5e0b3a3694d06898ebc80163 Mon Sep 17 00:00:00 2001
+From b2128688c95a36d5bb411873d3db375faf417d9a Mon Sep 17 00:00:00 2001
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


--===============0961094550889436231==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.2.0-1.3.0.patch"

RnJvbSBiMWE5NWI3YmJlMjE3MGIwMzA0NDExOWY1MjljZDdhZjYxMGE2NmY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMjoyODo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZp
cmdscmVuZGVyZXI6IHVwZ3JhZGUgMS4yLjAgLT4gMS4zLjAKCi0tLQogLi4ub25jZV9mbGFnLU9O
Q0VfRkxBR19JTklULXdoZW4tcHJlc2VuLnBhdGNoIHwgNTcgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4udWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIHwgIDggKy0tCiAu
Li41ZmM1N2IwN2MwNmI1ZTBiM2EzNjk0ZDA2ODk4ZWJjODAxNjMucGF0Y2ggfCAgNyArLS0KIC4u
Lm5kZXJlcl8xLjIuMC5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMy4wLmJifSB8ICAzICstCiA0IGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNjggZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJl
ci8wMDAxLWMxMS11c2UtZ2xpYmMtcy1vbmNlX2ZsYWctT05DRV9GTEFHX0lOSVQtd2hlbi1wcmVz
ZW4ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci97dmly
Z2xyZW5kZXJlcl8xLjIuMC5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMy4wLmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVy
ZXIvMDAwMS1jMTEtdXNlLWdsaWJjLXMtb25jZV9mbGFnLU9OQ0VfRkxBR19JTklULXdoZW4tcHJl
c2VuLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5k
ZXJlci8wMDAxLWMxMS11c2UtZ2xpYmMtcy1vbmNlX2ZsYWctT05DRV9GTEFHX0lOSVQtd2hlbi1w
cmVzZW4ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDVmOTBkNTliYTcuLjAw
MDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xy
ZW5kZXJlci8wMDAxLWMxMS11c2UtZ2xpYmMtcy1vbmNlX2ZsYWctT05DRV9GTEFHX0lOSVQtd2hl
bi1wcmVzZW4ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw1NyArMCwwIEBACi1Gcm9tIGMwNzZj
NTJhMzIzNTg0ZDZkMDBjYTcwNzkwNzJjYmMwZGQ4OGNiNDMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgotRGF0ZTogRnJpLCA3
IE5vdiAyMDI1IDEzOjE0OjU2ICsxMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIGMxMS90aHJlYWRzOiBm
aXggYnVpbGQgb24gYzIzCi0KLUMyMy9nbGliYyBpcyBub3cgaW5jbHVkaW5nIG9uY2VfaW5pdCBp
biBzdGRsaWIuaAotCi1odHRwczovL3BhdGNod29yay5zb3VyY2V3YXJlLm9yZy9wcm9qZWN0L2ds
aWJjL3BhdGNoLzc4MDYxMDg1LWYwNGEtMGM0NS0xMDdiLTVhOGExNTUyMTA4M0ByZWRoYXQuY29t
LyMyMTMwODgKLQotSnVzdCBmaXggdXAgb3VyIHVzZSBvZiBpdC4KLQotVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3ZpcmdscmVu
ZGVyZXIvLS9jb21taXQvM2YwZjc3NWVkYjJkZjVlYTU0YzM3ODYzMjg2YWQ1NjVjY2RkYjI3Nl0K
LVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBzcmMv
bWVzYS9jb21wYXQvYzExL3RocmVhZHNfcG9zaXguaCB8IDggKysrKysrLS0KLSAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvc3Jj
L21lc2EvY29tcGF0L2MxMS90aHJlYWRzX3Bvc2l4LmggYi9zcmMvbWVzYS9jb21wYXQvYzExL3Ro
cmVhZHNfcG9zaXguaAotaW5kZXggNDVjYjYwNzUuLjA3MWZhZjc5IDEwMDY0NAotLS0tIGEvc3Jj
L21lc2EvY29tcGF0L2MxMS90aHJlYWRzX3Bvc2l4LmgKLSsrKyBiL3NyYy9tZXNhL2NvbXBhdC9j
MTEvdGhyZWFkc19wb3NpeC5oCi1AQCAtNTEsNyArNTEsOSBAQCBDb25maWd1cmF0aW9uIG1hY3Jv
OgotICNpbmNsdWRlIDxwdGhyZWFkLmg+Ci0gCi0gLyotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tIG1hY3JvcyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKi8KLSsjaWZuZGVmIF9fb25j
ZV9mbGFnX2RlZmluZWQKLSAjZGVmaW5lIE9OQ0VfRkxBR19JTklUIFBUSFJFQURfT05DRV9JTklU
Ci0rI2VuZGlmCi0gI2lmZGVmIElOSVRfT05DRV9TVEFUSUNfSU5JVAotICNkZWZpbmUgVFNTX0RU
T1JfSVRFUkFUSU9OUyBQVEhSRUFEX0RFU1RSVUNUT1JfSVRFUkFUSU9OUwotICNlbHNlCi1AQCAt
NjYsOCArNjgsOSBAQCB0eXBlZGVmIHB0aHJlYWRfY29uZF90ICBjbmRfdDsKLSB0eXBlZGVmIHB0
aHJlYWRfdCAgICAgICB0aHJkX3Q7Ci0gdHlwZWRlZiBwdGhyZWFkX2tleV90ICAgdHNzX3Q7Ci0g
dHlwZWRlZiBwdGhyZWFkX211dGV4X3QgbXR4X3Q7Ci0rI2lmbmRlZiBfX29uY2VfZmxhZ19kZWZp
bmVkCi0gdHlwZWRlZiBwdGhyZWFkX29uY2VfdCAgb25jZV9mbGFnOwotLQotKyNlbmRpZgotIAot
IC8qCi0gSW1wbGVtZW50YXRpb24gbGltaXRzOgotQEAgLTkwLDEyICs5MywxMyBAQCBpbXBsX3Ro
cmRfcm91dGluZSh2b2lkICpwKQotIAotIC8qLS0tLS0tLS0tLS0tLS0tIDcuMjUuMiBJbml0aWFs
aXphdGlvbiBmdW5jdGlvbnMgLS0tLS0tLS0tLS0tLS0tKi8KLSAvLyA3LjI1LjIuMQotKyNpZm5k
ZWYgX19vbmNlX2ZsYWdfZGVmaW5lZAotIHN0YXRpYyBpbmxpbmUgdm9pZAotIGNhbGxfb25jZShv
bmNlX2ZsYWcgKmZsYWcsIHZvaWQgKCpmdW5jKSh2b2lkKSkKLSB7Ci0gICAgIHB0aHJlYWRfb25j
ZShmbGFnLCBmdW5jKTsKLSB9Ci0tCi0rI2VuZGlmCi0gCi0gLyotLS0tLS0tLS0tLS0tIDcuMjUu
MyBDb25kaXRpb24gdmFyaWFibGUgZnVuY3Rpb25zIC0tLS0tLS0tLS0tLS0qLwotIC8vIDcuMjUu
My4xCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJn
bHJlbmRlcmVyLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhv
bi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVy
ZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNo
CmluZGV4IDZmMGJhM2ViYWIuLjNlNTdlYWRmZDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5idWlsZC11c2Ut
cHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0
aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1MWM4
YTVhNTY4YjJjZDFkZmNiNTNlZDNiNDlhMGY4ODk5YmU3YmU0IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBhMzM1YTNjZjU2MzQ1NDQ5MTNiNTRlMTgxN2Q1MTBkOTUyYzA1MmRlIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDYgSmFuIDIwMjAgMTI6NDQ6NDIgKzAxMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gbWVzb24uYnVpbGQ6IHVzZSAncHl0aG9uMycgZGlyZWN0bHkgZm9yIHB5dGhv
bgpAQCAtMTMsNyArMTMsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWlu
ZGV4IDE5M2JhMzJiLi5jMDFjYWU2NSAxMDA2NDQKK2luZGV4IDY5YzFiYjgyLi4wOGIxZjI2NiAx
MDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAgLTc3LDcgKzc3
LDcgQEAgZmxhZ3MgPSBbCkBAIC0yMyw1ICsyMyw1IEBAIGluZGV4IDE5M2JhMzJiLi5jMDFjYWU2
NSAxMDA2NDQKIC1wcm9nX3B5dGhvbiA9IGltcG9ydCgncHl0aG9uJykuZmluZF9pbnN0YWxsYXRp
b24oJ3B5dGhvbjMnKQogK3Byb2dfcHl0aG9uID0gJ3B5dGhvbjMnCiAgCi0gbm90X2ZvdW5kID0g
ZGVwZW5kZW5jeSgnJywgcmVxdWlyZWQ6IGZhbHNlKQotIGdibV9kZXAgPSBub3RfZm91bmQKKyB3
aXRoX2hvc3Rfd2luZG93cyA9IGhvc3RfbWFjaGluZS5zeXN0ZW0oKSA9PSAnd2luZG93cycKKyB3
aXRoX2hvc3RfZGFyd2luID0gaG9zdF9tYWNoaW5lLnN5c3RlbSgpID09ICdkYXJ3aW4nCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVy
Lzk4NmI1ZmM1N2IwN2MwNmI1ZTBiM2EzNjk0ZDA2ODk4ZWJjODAxNjMucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzk4NmI1ZmM1N2IwN2Mw
NmI1ZTBiM2EzNjk0ZDA2ODk4ZWJjODAxNjMucGF0Y2gKaW5kZXggOTFlMDFmMDYxNi4uMzAzOWU4
ZjU0MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmly
Z2xyZW5kZXJlci85ODZiNWZjNTdiMDdjMDZiNWUwYjNhMzY5NGQwNjg5OGViYzgwMTYzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIv
OTg2YjVmYzU3YjA3YzA2YjVlMGIzYTM2OTRkMDY4OThlYmM4MDE2My5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gOTg2YjVmYzU3YjA3YzA2YjVlMGIzYTM2OTRkMDY4OThlYmM4MDE2MyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjIxMjg2ODhjOTVhMzZkNWJiNDExODczZDNkYjM3
NWZhZjQxN2Q5YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1heGltaWxpYW4gSG9m
bWFubiA8bWF4aUBtYXhpaWNvZGVzLmRldj4KIERhdGU6IFRodSwgMjYgRmViIDIwMjYgMjM6Mjg6
NTggKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZml4OiBidWlsZCB3aXRoIGdsaWJjIDIuNDMKQEAg
LTE5LDcgKzE5LDcgQEAgUGFydC1vZjogPGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92
aXJnbC92aXJnbHJlbmRlcmVyLy0vbWVyZ2VfcmVxdWVzdHMvMTUKICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9nYWxsaXVt
L2F1eGlsaWFyeS90Z3NpL3Rnc2lfdGV4dC5jIGIvc3JjL2dhbGxpdW0vYXV4aWxpYXJ5L3Rnc2kv
dGdzaV90ZXh0LmMKLWluZGV4IGRiN2Q3Yjk1Mi4uN2UzN2JmNzk0IDEwMDY0NAoraW5kZXggZGI3
ZDdiOTUuLjdlMzdiZjc5IDEwMDY0NAogLS0tIGEvc3JjL2dhbGxpdW0vYXV4aWxpYXJ5L3Rnc2kv
dGdzaV90ZXh0LmMKICsrKyBiL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS90Z3NpL3Rnc2lfdGV4dC5j
CiBAQCAtODQsNyArODQsNyBAQCBzdHJlcV9ub2Nhc2VfdXByY2FzZShjb25zdCBjaGFyICpzdHIx
LApAQCAtMzEsNiArMzEsMyBAQCBpbmRleCBkYjdkN2I5NTIuLjdlMzdiZjc5NCAxMDA2NDQKICAg
ICBpZiAodW5saWtlbHkoc3RyKSkgewogICAgICAgICpwY3VyID0gc3RyOwogICAgICAgIHJldHVy
biBmYWxzZTsKLS0tCi1HaXRMYWIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjIuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4zLjAuYmIKc2ltaWxhcml0eSBpbmRl
eCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmly
Z2xyZW5kZXJlcl8xLjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Zpcmds
cmVuZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjMuMC5iYgppbmRleCBjN2FlZjUyN2IwLi5iMzBjMjI3
YzkyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJn
bHJlbmRlcmVyXzEuMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRl
cmVyL3ZpcmdscmVuZGVyZXJfMS4zLjAuYmIKQEAgLTksMTAgKzksOSBAQCBMSUNFTlNFID0gIk1J
VCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM4MWMwOGVlZWZkOTQx
OGZjYThmODgzMDlhNzZkYjEwIgogCiBERVBFTkRTID0gImxpYmRybSBsaWJlcG94eSBweXRob24z
LXB5eWFtbC1uYXRpdmUgdmlydHVhbC9lZ2wgdmlydHVhbC9saWJnYm0iCi1TUkNSRVYgPSAiNTAw
YjQxZDVjODYzOGY5YjgwZGQ1NThmNDA0NGYzMzAxYzc0NTdhNCIKK1NSQ1JFViA9ICJjYTUwZTAw
ODg2MzgzN2UwOTQ3NDdhNjk5NzRkZGUzYWUxNDhhZWFhIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3ZpcmdscmVuZGVyZXIuZ2l0O2JyYW5jaD1tYWluO3By
b3RvY29sPWh0dHBzO3RhZz0ke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lc29uLmJ1
aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2ggXAotICAgICAgICAgICBm
aWxlOi8vMDAwMS1jMTEtdXNlLWdsaWJjLXMtb25jZV9mbGFnLU9OQ0VfRkxBR19JTklULXdoZW4t
cHJlc2VuLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzk4NmI1ZmM1N2IwN2MwNmI1ZTBiM2Ez
Njk0ZDA2ODk4ZWJjODAxNjMucGF0Y2ggXAogICAgICAgICAgICAiCiAKLS0gCjIuNDcuMQoK

--===============0961094550889436231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-afa5bb1a0fd24c880d7a9101defec66497c38e60"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:afa5bb1a0fd24c880d7a9101defec66497c38e60"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 317 Local 304 Mirrors 0 Missed 13 Current 774 (95% match, 98% complete)
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
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_populate_lic unihash changed to 8488cd7be265d934a0fb4ed2334f160f6e14ca45b7fd37141523414e1e35a83a
NOTE: recipe virglrenderer-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_deploy_source_date_epoch unihash changed to ec1a57952e7b840670daea61e8cca77de046578bdb609a8ac7978ac2f489c7e7
NOTE: Setscene tasks completed
NOTE: Running task 2570 of 2582 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure)
NOTE: recipe virglrenderer-1.3.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/laye
 rs/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/
 layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libtool-native', 'm4-native', 'opkg-utils', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'libdrm', 'libepoxy', 'mesa', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libpciaccess', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'acl', 'attr', 'curl', 'gmp', 'gnutls', 'libtasn1', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libseccomp', 'libunistring', 'nettle', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native'
 , 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'python3-build-native', 'python3-cython-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-pyyaml-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'libyaml-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus=true -Dvenus-validate=false...
| The Meson build system
| Version: 1.11.0
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
| Version: 1.11.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/sources/virglrenderer-1.3.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/build
| Build type: cross build
| 
| ../sources/virglrenderer-1.3.0/meson.build:24:0: ERROR: Unknown option: "render-server".
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3457042:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3457042, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3457042, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3457042, line 146
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3457042, line 183
NOTE: recipe virglrenderer-1.3.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2570 tasks of which 2560 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501122837.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501122837.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/log.do_configure.3457042
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: virglrenderer-1.3.0-r0 do_configure: meson setup failed
ERROR: virglrenderer-1.3.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3457042' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/log.do_configure.3457042
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure) failed with exit code '1'

--===============0961094550889436231==--

