Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BE710F6FBF
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14646.1775054155978407030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rHwZL8yl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wIiNvvpD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d497934ad-99adc061-26ae-44a5-8e79-7fd9a5870a63-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YiOj6z7Yy2F98+wmQCpRXybExg/Qm24HzN7pmH04Bs4=;
	b=rHwZL8yl3yJvb/TVXXOGhfIV/V8AxCB1nbWLmA26wZExzNItYgaiOWICtu+Syq/L
	QvIAEipiUQ7DlmNOUAkGD0UxJqNwseHoRlTaax2c0X862oT5dCYZPztlVI9FuidEyQn
	a0ui9QJf8P2I2SpKCDDfdE+nHyurbFPgeG1snjEY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YiOj6z7Yy2F98+wmQCpRXybExg/Qm24HzN7pmH04Bs4=;
	b=wIiNvvpDbA1ozptG9a7AojdIZII7Hq0ogEt8xYGjowet4SFh+aNgHyE2Pk+Ij3Ur
	VsmHsuO9o4v/fVGpgeoUr51pht4kSPrzcnMLaTA6kcUKKB9tAwQgkRIlW02XWAumAo/
	NrCE0TBg1Xn/IKJ1S8djbk/jxyeZZeyXJdbB1wC4=
Content-Type: multipart/mixed; boundary="===============5041981279803458801=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] virglrenderer: upgrading to 1.3.0 FAILED
Message-ID: <0101019d497934ad-99adc061-26ae-44a5-8e79-7fd9a5870a63-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234420

--===============5041981279803458801==
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
From 0a4bb5b79c3c96e52874cd9563e6d314611de03f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 13:27:50 +0000
Subject: [PATCH] virglrenderer: upgrade 1.2.0 -> 1.3.0

---
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 57 -------------------
 ...uild-use-python3-directly-for-python.patch |  8 +--
 ...nderer_1.2.0.bb => virglrenderer_1.3.0.bb} |  3 +-
 3 files changed, 5 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.2.0.bb => virglrenderer_1.3.0.bb} (90%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
deleted file mode 100644
index b077bf2033..0000000000
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
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1567]
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
index 6f0ba3ebab..d6a97b5f07 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 51c8a5a568b2cd1dfcb53ed3b49a0f8899be7be4 Mon Sep 17 00:00:00 2001
+From 3f343eb3302d03932bec29f2d7c3362702b25a65 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb
similarity index 90%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb
index df8473dad2..8fcdddcc4b 100644
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
            "
 
 inherit meson pkgconfig features_check
-- 
2.47.1


--===============5041981279803458801==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.2.0-1.3.0.patch"

RnJvbSAwYTRiYjViNzljM2M5NmU1Mjg3NGNkOTU2M2U2ZDMxNDYxMWRlMDNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMzoyNzo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZp
cmdscmVuZGVyZXI6IHVwZ3JhZGUgMS4yLjAgLT4gMS4zLjAKCi0tLQogLi4ub25jZV9mbGFnLU9O
Q0VfRkxBR19JTklULXdoZW4tcHJlc2VuLnBhdGNoIHwgNTcgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4udWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIHwgIDggKy0tCiAu
Li5uZGVyZXJfMS4yLjAuYmIgPT4gdmlyZ2xyZW5kZXJlcl8xLjMuMC5iYn0gfCAgMyArLQogMyBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVy
ZXIvMDAwMS1jMTEtdXNlLWdsaWJjLXMtb25jZV9mbGFnLU9OQ0VfRkxBR19JTklULXdoZW4tcHJl
c2VuLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIve3Zp
cmdscmVuZGVyZXJfMS4yLjAuYmIgPT4gdmlyZ2xyZW5kZXJlcl8xLjMuMC5iYn0gKDkwJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRl
cmVyLzAwMDEtYzExLXVzZS1nbGliYy1zLW9uY2VfZmxhZy1PTkNFX0ZMQUdfSU5JVC13aGVuLXBy
ZXNlbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVu
ZGVyZXIvMDAwMS1jMTEtdXNlLWdsaWJjLXMtb25jZV9mbGFnLU9OQ0VfRkxBR19JTklULXdoZW4t
cHJlc2VuLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBiMDc3YmYyMDMzLi4w
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
czogU3VibWl0dGVkIFtodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvdmlyZ2wvdmlyZ2xy
ZW5kZXJlci8tL21lcmdlX3JlcXVlc3RzLzE1NjddCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gc3JjL21lc2EvY29tcGF0L2MxMS90aHJlYWRzX3Bv
c2l4LmggfCA4ICsrKysrKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9tZXNhL2NvbXBhdC9jMTEvdGhyZWFkc19w
b3NpeC5oIGIvc3JjL21lc2EvY29tcGF0L2MxMS90aHJlYWRzX3Bvc2l4LmgKLWluZGV4IDQ1Y2I2
MDc1Li4wNzFmYWY3OSAxMDA2NDQKLS0tLSBhL3NyYy9tZXNhL2NvbXBhdC9jMTEvdGhyZWFkc19w
b3NpeC5oCi0rKysgYi9zcmMvbWVzYS9jb21wYXQvYzExL3RocmVhZHNfcG9zaXguaAotQEAgLTUx
LDcgKzUxLDkgQEAgQ29uZmlndXJhdGlvbiBtYWNybzoKLSAjaW5jbHVkZSA8cHRocmVhZC5oPgot
IAotIC8qLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSBtYWNyb3MgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSovCi0rI2lmbmRlZiBfX29uY2VfZmxhZ19kZWZpbmVkCi0gI2RlZmluZSBP
TkNFX0ZMQUdfSU5JVCBQVEhSRUFEX09OQ0VfSU5JVAotKyNlbmRpZgotICNpZmRlZiBJTklUX09O
Q0VfU1RBVElDX0lOSVQKLSAjZGVmaW5lIFRTU19EVE9SX0lURVJBVElPTlMgUFRIUkVBRF9ERVNU
UlVDVE9SX0lURVJBVElPTlMKLSAjZWxzZQotQEAgLTY2LDggKzY4LDkgQEAgdHlwZWRlZiBwdGhy
ZWFkX2NvbmRfdCAgY25kX3Q7Ci0gdHlwZWRlZiBwdGhyZWFkX3QgICAgICAgdGhyZF90OwotIHR5
cGVkZWYgcHRocmVhZF9rZXlfdCAgIHRzc190OwotIHR5cGVkZWYgcHRocmVhZF9tdXRleF90IG10
eF90OwotKyNpZm5kZWYgX19vbmNlX2ZsYWdfZGVmaW5lZAotIHR5cGVkZWYgcHRocmVhZF9vbmNl
X3QgIG9uY2VfZmxhZzsKLS0KLSsjZW5kaWYKLSAKLSAvKgotIEltcGxlbWVudGF0aW9uIGxpbWl0
czoKLUBAIC05MCwxMiArOTMsMTMgQEAgaW1wbF90aHJkX3JvdXRpbmUodm9pZCAqcCkKLSAKLSAv
Ki0tLS0tLS0tLS0tLS0tLSA3LjI1LjIgSW5pdGlhbGl6YXRpb24gZnVuY3Rpb25zIC0tLS0tLS0t
LS0tLS0tLSovCi0gLy8gNy4yNS4yLjEKLSsjaWZuZGVmIF9fb25jZV9mbGFnX2RlZmluZWQKLSBz
dGF0aWMgaW5saW5lIHZvaWQKLSBjYWxsX29uY2Uob25jZV9mbGFnICpmbGFnLCB2b2lkICgqZnVu
Yykodm9pZCkpCi0gewotICAgICBwdGhyZWFkX29uY2UoZmxhZywgZnVuYyk7Ci0gfQotLQotKyNl
bmRpZgotIAotIC8qLS0tLS0tLS0tLS0tLSA3LjI1LjMgQ29uZGl0aW9uIHZhcmlhYmxlIGZ1bmN0
aW9ucyAtLS0tLS0tLS0tLS0tKi8KLSAvLyA3LjI1LjMuMQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxk
LXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5
dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaAppbmRleCA2ZjBiYTNlYmFiLi5kNmE5N2I1
ZjA3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJn
bHJlbmRlcmVyLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhv
bi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJl
bmRlcmVyLzAwMDEtbWVzb24uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTFjOGE1YTU2OGIyY2QxZGZjYjUzZWQzYjQ5YTBm
ODg5OWJlN2JlNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2YzNDNlYjMzMDJkMDM5
MzJiZWMyOWYyZDdjMzM2MjcwMmIyNWE2NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogTW9uLCA2
IEphbiAyMDIwIDEyOjQ0OjQyICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiB1
c2UgJ3B5dGhvbjMnIGRpcmVjdGx5IGZvciBweXRob24KQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVk
LW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAxOTNiYTMyYi4uYzAxY2FlNjUgMTAw
NjQ0CitpbmRleCA2OWMxYmI4Mi4uMDhiMWYyNjYgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAog
KysrIGIvbWVzb24uYnVpbGQKIEBAIC03Nyw3ICs3Nyw3IEBAIGZsYWdzID0gWwpAQCAtMjMsNSAr
MjMsNSBAQCBpbmRleCAxOTNiYTMyYi4uYzAxY2FlNjUgMTAwNjQ0CiAtcHJvZ19weXRob24gPSBp
bXBvcnQoJ3B5dGhvbicpLmZpbmRfaW5zdGFsbGF0aW9uKCdweXRob24zJykKICtwcm9nX3B5dGhv
biA9ICdweXRob24zJwogIAotIG5vdF9mb3VuZCA9IGRlcGVuZGVuY3koJycsIHJlcXVpcmVkOiBm
YWxzZSkKLSBnYm1fZGVwID0gbm90X2ZvdW5kCisgd2l0aF9ob3N0X3dpbmRvd3MgPSBob3N0X21h
Y2hpbmUuc3lzdGVtKCkgPT0gJ3dpbmRvd3MnCisgd2l0aF9ob3N0X2RhcndpbiA9IGhvc3RfbWFj
aGluZS5zeXN0ZW0oKSA9PSAnZGFyd2luJwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjIuMC5iYiBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4zLjAuYmIKc2ltaWxhcml0eSBp
bmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIv
dmlyZ2xyZW5kZXJlcl8xLjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Zp
cmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjMuMC5iYgppbmRleCBkZjg0NzNkYWQyLi44ZmNk
ZGRjYzRiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92
aXJnbHJlbmRlcmVyXzEuMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJl
bmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4zLjAuYmIKQEAgLTksMTAgKzksOSBAQCBMSUNFTlNFID0g
Ik1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM4MWMwOGVlZWZk
OTQxOGZjYThmODgzMDlhNzZkYjEwIgogCiBERVBFTkRTID0gImxpYmRybSBsaWJlcG94eSBweXRo
b24zLXB5eWFtbC1uYXRpdmUgdmlydHVhbC9lZ2wgdmlydHVhbC9saWJnYm0iCi1TUkNSRVYgPSAi
NTAwYjQxZDVjODYzOGY5YjgwZGQ1NThmNDA0NGYzMzAxYzc0NTdhNCIKK1NSQ1JFViA9ICJjYTUw
ZTAwODg2MzgzN2UwOTQ3NDdhNjk5NzRkZGUzYWUxNDhhZWFhIgogU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3ZpcmdscmVuZGVyZXIuZ2l0O2JyYW5jaD1tYWlu
O3Byb3RvY29sPWh0dHBzO3RhZz0ke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lc29u
LmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2ggXAotICAgICAgICAg
ICBmaWxlOi8vMDAwMS1jMTEtdXNlLWdsaWJjLXMtb25jZV9mbGFnLU9OQ0VfRkxBR19JTklULXdo
ZW4tcHJlc2VuLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBpbmhlcml0IG1lc29uIHBrZ2NvbmZp
ZyBmZWF0dXJlc19jaGVjawotLSAKMi40Ny4xCgo=

--===============5041981279803458801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-776bc972f227498a3b0b4e074e01a1553a05fb36"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:776bc972f227498a3b0b4e074e01a1553a05fb36"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 352 Local 339 Mirrors 0 Missed 13 Current 728 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2337 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_recipe_qa)
NOTE: Running task 2426 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_write_config)
NOTE: Running task 2518 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_create_recipe_spdx)
NOTE: recipe virglrenderer-1.3.0-r0: task do_recipe_qa: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_write_config: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_recipe_qa unihash changed to fe2a315a9c03ab93814e3d41605afcdc856d489cee6295e6c74b8f2e92018cd9
NOTE: Setscene tasks completed
NOTE: Running task 2531 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_fetch)
NOTE: recipe virglrenderer-1.3.0-r0: task do_fetch: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2532 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_unpack)
NOTE: Running task 2533 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.3.0-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2534 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_patch)
NOTE: recipe virglrenderer-1.3.0-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2535 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2536 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_populate_lic)
NOTE: recipe virglrenderer-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_populate_lic: Started
NOTE: recipe virglrenderer-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_deploy_source_date_epoch unihash changed to ec1a57952e7b840670daea61e8cca77de046578bdb609a8ac7978ac2f489c7e7
NOTE: Setscene tasks completed
NOTE: Running task 2537 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure)
NOTE: recipe virglrenderer-1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe virglrenderer-1.3.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/laye
 rs/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/
 layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'zlib', 'binutils-cross-x86_64', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libtool-native', 'm4-native', 'opkg-utils', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'libdrm', 'libepoxy', 'mesa', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libpciaccess', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'acl', 'attr', 'curl', 'gmp', 'gnutls', 'libtasn1', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libseccomp', 'libunistring', 'nettle', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native'
 , 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'python3-build-native', 'python3-cython-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-pyyaml-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'libyaml-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus=true -Dvenus-validate=false...
| The Meson build system
| Version: 1.10.2
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
| Build Options: -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus=true -Dvenus-validate=false -Dprefix=/usr -Dbindir=/usr/bin -Ddatadir=/usr/share -Dincludedir=/usr/include -Dinfodir=/usr/share/info -Dlibdir=/usr/lib -Dlibexecdir=/usr/libexec -Dlocalstatedir=/var -Dmandir=/usr/share/man -Dsbindir=/usr/sbin -Dsharedstatedir=/com -Dsysconfdir=/etc -Dbuildtype=plain -Dwrap_mode=nodownload --cross-file=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/meson.cross --native-file=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/meson.native
| Python system: Linux
| The Meson build system
| Version: 1.10.2
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/sources/virglrenderer-1.3.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/build
| Build type: cross build
| 
| ../sources/virglrenderer-1.3.0/meson.build:24:0: ERROR: Unknown option: "render-server".
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3194825:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3194825, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3194825, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3194825, line 146
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3194825, line 183
NOTE: recipe virglrenderer-1.3.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2537 tasks of which 2527 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401132735.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401132735.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/log.do_configure.3194825
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: virglrenderer-1.3.0-r0 do_configure: meson setup failed
ERROR: virglrenderer-1.3.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/run.do_configure.3194825' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/virglrenderer/1.3.0/temp/log.do_configure.3194825
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb:do_configure) failed with exit code '1'

--===============5041981279803458801==--

