Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC025D5E14E
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:50 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17178.1765872128910473755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ou0HjAzC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OeJyQGMH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262ecdd0-124a79e8-9a8c-4dfa-8017-a40e86f0ebde-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872160;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jkKuwktM2qBMcuf44Plcj7DpbbwEB8XvWZAP+yrGefA=;
	b=ou0HjAzC0bhJKb9X0RAgjVobH15si3X3gQFCJMpUarokWwdsbg8kCxxL3E3iTcrU
	MBwTojg6JnzDh7bFF+cW3PFiRkG4NmUUcyftpA9l9DXAU7GhJ51EViUWfkMUjUe/hzf
	O03OkS5FuDBNnnyyOtXuuE21zzrvC4S3DwJxi9K8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872160;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jkKuwktM2qBMcuf44Plcj7DpbbwEB8XvWZAP+yrGefA=;
	b=OeJyQGMHtXS6sLgFCc/MqywJxTcdrlqrDpXMQhwtGVdNJ0WwwLWCwpqXywsSVADf
	ijx4vVft9sOu3V+soasabLXcW9ylqoqgXD2P/S4Aa2cLHttHT93bCRsjX1pxtAXe87A
	WFojPlShHcP9QZ4bQXz9G9oBzkZGWoX13XdBMo0k=
Content-Type: multipart/mixed; boundary="===============0262019593393160636=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] virglrenderer: upgrading to 1.2.0 SUCCEEDED
Message-ID: <0101019b262ecdd0-124a79e8-9a8c-4dfa-8017-a40e86f0ebde-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227873

--===============0262019593393160636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *virglrenderer* to *1.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-virglrenderer-upgrade-1.1.1-1.2.0.patch
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
From 2fa5970c06c60318f1c753c32ef5d2c74e33dca5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 04:50:02 +0000
Subject: [PATCH] virglrenderer: upgrade 1.1.1 -> 1.2.0

---
 ...-s-once_flag-ONCE_FLAG_INIT-when-presen.patch | 16 +++++++++-------
 ...n.build-use-python3-directly-for-python.patch |  4 ++--
 ...lrenderer_1.1.1.bb => virglrenderer_1.2.0.bb} |  2 +-
 3 files changed, 12 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.1.1.bb => virglrenderer_1.2.0.bb} (96%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
index 1740d7605f..b077bf2033 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
@@ -1,4 +1,4 @@
-From 179e744f7577d98df7c79d7324c22acfb32a0154 Mon Sep 17 00:00:00 2001
+From c076c52a323584d6d00ca7079072cbc0dd88cb43 Mon Sep 17 00:00:00 2001
 From: Dave Airlie <airlied@redhat.com>
 Date: Fri, 7 Nov 2025 13:14:56 +1000
 Subject: [PATCH] c11/threads: fix build on c23
@@ -12,14 +12,16 @@ Just fix up our use of it.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1567]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/mesa/compat/c11/impl/threads_posix.c | 3 ++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
+ src/mesa/compat/c11/threads_posix.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
+diff --git a/src/mesa/compat/c11/threads_posix.h b/src/mesa/compat/c11/threads_posix.h
+index 45cb6075..071faf79 100644
 --- a/src/mesa/compat/c11/threads_posix.h
 +++ b/src/mesa/compat/c11/threads_posix.h
 @@ -51,7 +51,9 @@ Configuration macro:
  #include <pthread.h>
-
+ 
  /*---------------------------- macros ----------------------------*/
 +#ifndef __once_flag_defined
  #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
@@ -35,11 +37,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  typedef pthread_once_t  once_flag;
 -
 +#endif
-
+ 
  /*
  Implementation limits:
 @@ -90,12 +93,13 @@ impl_thrd_routine(void *p)
-
+ 
  /*--------------- 7.25.2 Initialization functions ---------------*/
  // 7.25.2.1
 +#ifndef __once_flag_defined
@@ -50,6 +52,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  }
 -
 +#endif
-
+ 
  /*------------- 7.25.3 Condition variable functions -------------*/
  // 7.25.3.1
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index f9080d53c5..6f0ba3ebab 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 9677f66a240a0513623aa26b47233b49193d0402 Mon Sep 17 00:00:00 2001
+From 51c8a5a568b2cd1dfcb53ed3b49a0f8899be7be4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 10be099e..3bb6eec7 100644
+index 193ba32b..c01cae65 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -77,7 +77,7 @@ flags = [
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
similarity index 96%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
index be4385ada6..df8473dad2 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy python3-pyyaml-native virtual/egl virtual/libgbm"
-SRCREV = "0f1f43929724a6a414c01a29bc51feccb445c2f0"
+SRCREV = "500b41d5c8638f9b80dd558f4044f3301c7457a4"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=${PV} \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
-- 
2.47.1


--===============0262019593393160636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/virglrenderer (sysroot):
  /usr/lib/libvirglrenderer.so.1 changed symlink target from libvirglrenderer.so.1.9.1 to libvirglrenderer.so.1.10.0
  /usr/lib/libvirglrenderer.so.1.10.0 was added
  /usr/lib/libvirglrenderer.so.1.9.1 was removed
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer: FILELIST: removed "/usr/lib/libvirglrenderer.so.1.9.1", added "/usr/lib/libvirglrenderer.so.1.10.0"

--===============0262019593393160636==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.1.1-1.2.0.patch"

RnJvbSAyZmE1OTcwYzA2YzYwMzE4ZjFjNzUzYzMyZWY1ZDJjNzRlMzNkY2E1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDQ6NTA6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
aXJnbHJlbmRlcmVyOiB1cGdyYWRlIDEuMS4xIC0+IDEuMi4wCgotLS0KIC4uLi1zLW9uY2VfZmxh
Zy1PTkNFX0ZMQUdfSU5JVC13aGVuLXByZXNlbi5wYXRjaCB8IDE2ICsrKysrKysrKy0tLS0tLS0K
IC4uLm4uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaCB8ICA0ICsr
LS0KIC4uLmxyZW5kZXJlcl8xLjEuMS5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMi4wLmJifSB8ICAy
ICstCiAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3t2aXJnbHJlbmRlcmVy
XzEuMS4xLmJiID0+IHZpcmdscmVuZGVyZXJfMS4yLjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLWMx
MS11c2UtZ2xpYmMtcy1vbmNlX2ZsYWctT05DRV9GTEFHX0lOSVQtd2hlbi1wcmVzZW4ucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAwMDEt
YzExLXVzZS1nbGliYy1zLW9uY2VfZmxhZy1PTkNFX0ZMQUdfSU5JVC13aGVuLXByZXNlbi5wYXRj
aAppbmRleCAxNzQwZDc2MDVmLi5iMDc3YmYyMDMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAwMDEtYzExLXVzZS1nbGliYy1z
LW9uY2VfZmxhZy1PTkNFX0ZMQUdfSU5JVC13aGVuLXByZXNlbi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAwMDEtYzExLXVzZS1n
bGliYy1zLW9uY2VfZmxhZy1PTkNFX0ZMQUdfSU5JVC13aGVuLXByZXNlbi5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMTc5ZTc0NGY3NTc3ZDk4ZGY3Yzc5ZDczMjRjMjJhY2ZiMzJhMDE1NCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzA3NmM1MmEzMjM1ODRkNmQwMGNhNzA3OTA3
MmNiYzBkZDg4Y2I0MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERhdmUgQWlybGll
IDxhaXJsaWVkQHJlZGhhdC5jb20+CiBEYXRlOiBGcmksIDcgTm92IDIwMjUgMTM6MTQ6NTYgKzEw
MDAKIFN1YmplY3Q6IFtQQVRDSF0gYzExL3RocmVhZHM6IGZpeCBidWlsZCBvbiBjMjMKQEAgLTEy
LDE0ICsxMiwxNiBAQCBKdXN0IGZpeCB1cCBvdXIgdXNlIG9mIGl0LgogVXBzdHJlYW0tU3RhdHVz
OiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aXJnbC92aXJnbHJl
bmRlcmVyLy0vbWVyZ2VfcmVxdWVzdHMvMTU2N10KIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiAtLS0KLSBzcmMvbWVzYS9jb21wYXQvYzExL2ltcGwvdGhyZWFk
c19wb3NpeC5jIHwgMyArKy0KLSAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQorIHNyYy9tZXNhL2NvbXBhdC9jMTEvdGhyZWFkc19wb3NpeC5oIHwgOCArKysr
KystLQorIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAK
K2RpZmYgLS1naXQgYS9zcmMvbWVzYS9jb21wYXQvYzExL3RocmVhZHNfcG9zaXguaCBiL3NyYy9t
ZXNhL2NvbXBhdC9jMTEvdGhyZWFkc19wb3NpeC5oCitpbmRleCA0NWNiNjA3NS4uMDcxZmFmNzkg
MTAwNjQ0CiAtLS0gYS9zcmMvbWVzYS9jb21wYXQvYzExL3RocmVhZHNfcG9zaXguaAogKysrIGIv
c3JjL21lc2EvY29tcGF0L2MxMS90aHJlYWRzX3Bvc2l4LmgKIEBAIC01MSw3ICs1MSw5IEBAIENv
bmZpZ3VyYXRpb24gbWFjcm86CiAgI2luY2x1ZGUgPHB0aHJlYWQuaD4KLQorIAogIC8qLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSBtYWNyb3MgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSovCiArI2lmbmRlZiBfX29uY2VfZmxhZ19kZWZpbmVkCiAgI2RlZmluZSBPTkNFX0ZMQUdfSU5J
VCBQVEhSRUFEX09OQ0VfSU5JVApAQCAtMzUsMTEgKzM3LDExIEBAIFNpZ25lZC1vZmYtYnk6IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgdHlwZWRlZiBwdGhyZWFkX29uY2VfdCAgb25j
ZV9mbGFnOwogLQogKyNlbmRpZgotCisgCiAgLyoKICBJbXBsZW1lbnRhdGlvbiBsaW1pdHM6CiBA
QCAtOTAsMTIgKzkzLDEzIEBAIGltcGxfdGhyZF9yb3V0aW5lKHZvaWQgKnApCi0KKyAKICAvKi0t
LS0tLS0tLS0tLS0tLSA3LjI1LjIgSW5pdGlhbGl6YXRpb24gZnVuY3Rpb25zIC0tLS0tLS0tLS0t
LS0tLSovCiAgLy8gNy4yNS4yLjEKICsjaWZuZGVmIF9fb25jZV9mbGFnX2RlZmluZWQKQEAgLTUw
LDYgKzUyLDYgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
ICB9CiAtCiArI2VuZGlmCi0KKyAKICAvKi0tLS0tLS0tLS0tLS0gNy4yNS4zIENvbmRpdGlvbiB2
YXJpYWJsZSBmdW5jdGlvbnMgLS0tLS0tLS0tLS0tLSovCiAgLy8gNy4yNS4zLjEKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAw
MS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29u
LmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2gKaW5kZXggZjkwODBk
NTNjNS4uNmYwYmEzZWJhYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Zpcmds
cmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVj
dGx5LWZvci1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVu
ZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5
LWZvci1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk2NzdmNjZhMjQwYTA1MTM2
MjNhYTI2YjQ3MjMzYjQ5MTkzZDA0MDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUx
YzhhNWE1NjhiMmNkMWRmY2I1M2VkM2I0OWEwZjg4OTliZTdiZTQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
IERhdGU6IE1vbiwgNiBKYW4gMjAyMCAxMjo0NDo0MiArMDEwMAogU3ViamVjdDogW1BBVENIXSBt
ZXNvbi5idWlsZDogdXNlICdweXRob24zJyBkaXJlY3RseSBmb3IgcHl0aG9uCkBAIC0xMyw3ICsx
Myw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMTBiZTA5OWUu
LjNiYjZlZWM3IDEwMDY0NAoraW5kZXggMTkzYmEzMmIuLmMwMWNhZTY1IDEwMDY0NAogLS0tIGEv
bWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtNzcsNyArNzcsNyBAQCBmbGFncyA9
IFsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3Zpcmds
cmVuZGVyZXJfMS4xLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92
aXJnbHJlbmRlcmVyXzEuMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4xLjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVy
ZXJfMS4yLjAuYmIKaW5kZXggYmU0Mzg1YWRhNi4uZGY4NDczZGFkMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjEuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzEu
Mi4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM4MWMwOGVlZWZkOTQxOGZjYThmODgzMDlhNzZkYjEwIgog
CiBERVBFTkRTID0gImxpYmRybSBsaWJlcG94eSBweXRob24zLXB5eWFtbC1uYXRpdmUgdmlydHVh
bC9lZ2wgdmlydHVhbC9saWJnYm0iCi1TUkNSRVYgPSAiMGYxZjQzOTI5NzI0YTZhNDE0YzAxYTI5
YmM1MWZlY2NiNDQ1YzJmMCIKK1NSQ1JFViA9ICI1MDBiNDFkNWM4NjM4ZjliODBkZDU1OGY0MDQ0
ZjMzMDFjNzQ1N2E0IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3Zp
cmdsL3ZpcmdscmVuZGVyZXIuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBzO3RhZz0ke1BW
fSBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVj
dGx5LWZvci1weXRob24ucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jMTEtdXNlLWds
aWJjLXMtb25jZV9mbGFnLU9OQ0VfRkxBR19JTklULXdoZW4tcHJlc2VuLnBhdGNoIFwKLS0gCjIu
NDcuMQoK

--===============0262019593393160636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/virglrenderer: PV changed from "1.1.1" to "1.2.0"
packages/x86-64-v3-poky-linux/virglrenderer: SRC_URI changed from "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=1.1.1 file://0001-meson.build-use-python3-directly-for-python.patch file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch" to "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=1.2.0 file://0001-meson.build-use-python3-directly-for-python.patch file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch"
packages/x86-64-v3-poky-linux/virglrenderer: PKGV changed from 1.1.1 [default] to 1.2.0 [default]
Changes to packages/x86-64-v3-poky-linux/virglrenderer (sysroot):
  /usr/lib/libvirglrenderer.so.1 changed symlink target from libvirglrenderer.so.1.9.1 to libvirglrenderer.so.1.10.0
  /usr/lib/libvirglrenderer.so.1.10.0 was added
  /usr/lib/libvirglrenderer.so.1.9.1 was removed
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-dbg: PV changed from "1.1.1" to "1.2.0"
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-dbg: PKGV changed from 1.1.1 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-dbg: PKGSIZE changed from 35442888 to 35540576 (+0%)
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-dbg: FILELIST: removed "/usr/lib/.debug/libvirglrenderer.so.1.9.1", added "/usr/lib/.debug/libvirglrenderer.so.1.10.0"
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-dev: PV changed from "1.1.1" to "1.2.0"
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-dev: PKGV changed from 1.1.1 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-dev: PKGSIZE changed from 21603 to 21828 (+1%)
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-doc: PV changed from "1.1.1" to "1.2.0"
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-doc: PKGV changed from 1.1.1 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-locale: PV changed from "1.1.1" to "1.2.0"
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-locale: PKGV changed from 1.1.1 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-src: PV changed from "1.1.1" to "1.2.0"
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-src: PKGV changed from 1.1.1 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-src: PKGSIZE changed from 7164883 to 7195140 (+0%)
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-src: FILELIST: directory renamed /usr/src/debug/virglrenderer/1.1.1/src/gallium/auxiliary/tgsi -> /usr/src/debug/virglrenderer/1.2.0/src/gallium/auxiliary/tgsi, directory renamed /usr/src/debug/virglrenderer/1.1.1/src/drm -> /usr/src/debug/virglrenderer/1.2.0/src/drm, directory renamed /usr/src/debug/virglrenderer/1.1.1/src/proxy -> /usr/src/debug/virglrenderer/1.2.0/src/proxy, directory renamed /usr/src/debug/virglrenderer/1.1.1/src/gallium/include/pipe -> /usr/src/debug/virglrenderer/1.2.0/src/gallium/include/pipe, directory renamed /usr/src/debug/virglrenderer/1.1.1/src/gallium -> /usr/src/debug/virglrenderer/1.2.0/src/gallium, directory renamed /usr/src/debug/virglrenderer/1.1.1/src/mesa/compat/c11 -> /usr/src/debug/virglrenderer/1.2.0/src/mesa/compat/c11, directory renamed /usr/src/debug/virglrenderer/1.1.1/src/venus/venus-protocol -> /usr/src/debug/virglrenderer/1.2.0/src/venus/venus-protocol, directory renamed /usr/src/
 debug/virglrenderer/1.1.1/vtest -> /usr/src/debug/virglrenderer/1.2.0/vtest, directory renamed /usr/src/debug/virglrenderer/1.1.1/src/mesa/util -> /usr/src/debug/virglrenderer/1.2.0/src/mesa/util, directory renamed /usr/src/debug/virglrenderer/1.1.1/src/gallium/auxiliary/cso_cache -> /usr/src/debug/virglrenderer/1.2.0/src/gallium/auxiliary/cso_cache, directory renamed /usr/src/debug/virglrenderer/1.1.1/server -> /usr/src/debug/virglrenderer/1.2.0/server, directory renamed /usr/src/debug/virglrenderer/1.1.1/src/gallium/auxiliary/util -> /usr/src/debug/virglrenderer/1.2.0/src/gallium/auxiliary/util, removed "/usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_buffer.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_device.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_buffer.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_device.h /usr/src/debug/virglrenderer/1.1.1/src/vkr_image_gen.h /usr/src/debug/virglrenderer/1.1.1/src/vkr_queue_gen.h /usr/src/debug/virglrenderer/1.1.1/src/ve
 nus/vkr_render_pass.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_strbuf.h /usr/src/debug/virglrenderer/1.1.1/src/vkr_buffer_gen.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_render_pass.c /usr/src/debug/virglrenderer/1.1.1/src/venus_hw.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_object.h /usr/src/debug/virglrenderer/1.1.1/src/vkr_acceleration_structure_gen.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_iov.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_tweaks.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_object.c /usr/src/debug/virglrenderer/1.1.1/src/vrend_tweaks.c /usr/src/debug/virglrenderer/1.1.1/src/vrend_blitter.c /usr/src/debug/virglrenderer/1.1.1/src/vrend_blitter.h /usr/src/debug/virglrenderer/1.1.1/src/vkr_pipeline_gen.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_instance.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_query_pool.h /usr/src/debug/virglrenderer/1.1.1/src/virglrenderer_hw.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_query_pool.c /us
 r/src/debug/virglrenderer/1.1.1/src/venus/vkr_instance.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_decode.c /usr/src/debug/virglrenderer/1.1.1/src/virglrenderer.h /usr/src/debug/virglrenderer/1.1.1/src/vkr_command_buffer_gen.h /usr/src/debug/virglrenderer/1.1.1/src/virglrenderer.c /usr/src/debug/virglrenderer/1.1.1/src/vrend_shader.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_shader.c /usr/src/debug/virglrenderer/1.1.1/src/iov.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_image.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_renderer.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_renderer.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_image.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_cs.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_cs.h /usr/src/debug/virglrenderer/1.1.1/src/vkr_device_memory_gen.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_transport.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_common.c /usr/src/debug/virglrenderer/1.1.1/
 src/venus/vkr_common.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_transport.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_ring.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_allocator.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_allocator.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_ring.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_descriptor_set.h /usr/src/debug/virglrenderer/1.1.1/src/virgl_protocol.h /usr/src/debug/virglrenderer/1.1.1/src/vkr_render_pass_gen.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_descriptor_set.c /usr/src/debug/virglrenderer/1.1.1/src/vrend_winsys.c /usr/src/debug/virglrenderer/1.1.1/src/vrend_winsys.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_device_memory.c /usr/src/debug/virglrenderer/1.1.1/src/virgl_context.c /usr/src/debug/virglrenderer/1.1.1/src/virgl_resource.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_winsys_egl.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_physical_device.h /usr/src/debug/virglr
 enderer/1.1.1/src/venus/vkr_device_memory.h /usr/src/debug/virglrenderer/1.1.1/src/virgl_fence.c /usr/src/debug/virglrenderer/1.1.1/src/virgl_resource.c /usr/src/debug/virglrenderer/1.1.1/src/vrend_winsys_gbm.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_physical_device.c /usr/src/debug/virglrenderer/1.1.1/src/virgl_fence.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_winsys_egl.h /usr/src/debug/virglrenderer/1.1.1/src/virgl_context.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_winsys_gbm.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_winsys_glx.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_debug.c /usr/src/debug/virglrenderer/1.1.1/src/vrend_debug.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_context.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_context.c /usr/src/debug/virglrenderer/1.1.1/src/vkr_query_pool_gen.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_pipeline.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_queue.h /usr/src/debug/virglrenderer/1.1.1/s
 rc/venus/vkr_pipeline.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_queue.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_acceleration_structure.c /usr/src/debug/virglrenderer/1.1.1/src/vrend_formats.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_acceleration_structure.h /usr/src/debug/virglrenderer/1.1.1/src/vkr_descriptor_set_gen.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_command_buffer.c /usr/src/debug/virglrenderer/1.1.1/src/virgl_hw.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_command_buffer.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_renderer.c /usr/src/debug/virglrenderer/1.1.1/src/vrend_renderer.h /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_host_copy.h /usr/src/debug/virglrenderer/1.1.1/src/virgl_util.h /usr/src/debug/virglrenderer/1.1.1/src/vrend_winsys_glx.c /usr/src/debug/virglrenderer/1.1.1/src/virgl_util.c /usr/src/debug/virglrenderer/1.1.1/src/venus/vkr_host_copy.c", added "/usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_transport.c /
 usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_common.c /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_object.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_common.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_transport.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_object.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_ring.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_allocator.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_allocator.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_ring.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_descriptor_set.h /usr/src/debug/virglrenderer/1.2.0/src/virgl_protocol.h /usr/src/debug/virglrenderer/1.2.0/src/vkr_render_pass_gen.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_descriptor_set.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_device_memory.c /usr/src/debug/virglrenderer/1.2.0/src/virgl_context.c /usr/src/debug/virglrenderer/1.2.0/src/virgl_resource.h /usr/src/debug/virglrenderer/1.2.0/src/ven
 us/vkr_physical_device.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_device_memory.h /usr/src/debug/virglrenderer/1.2.0/src/virgl_fence.c /usr/src/debug/virglrenderer/1.2.0/src/virgl_resource.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_physical_device.c /usr/src/debug/virglrenderer/1.2.0/src/virgl_fence.h /usr/src/debug/virglrenderer/1.2.0/src/virgl_context.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_blitter.c /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_blitter.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_winsys_glx.c /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_winsys_glx.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_decode.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_context.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_context.c /usr/src/debug/virglrenderer/1.2.0/src/vkr_query_pool_gen.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_pipeline.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_queue.h /usr/src/debug/vir
 glrenderer/1.2.0/src/vrend/vrend_tweaks.c /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_renderer.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_winsys.c /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_renderer.c /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_tweaks.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_winsys.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_pipeline.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_queue.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_acceleration_structure.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_acceleration_structure.h /usr/src/debug/virglrenderer/1.2.0/src/vkr_descriptor_set_gen.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_command_buffer.c /usr/src/debug/virglrenderer/1.2.0/src/virgl_hw.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_command_buffer.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_winsys_gbm.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_winsys_gbm.c /usr/src/deb
 ug/virglrenderer/1.2.0/src/vrend/vrend_winsys_egl.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_winsys_egl.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_host_copy.h /usr/src/debug/virglrenderer/1.2.0/src/virgl_util.h /usr/src/debug/virglrenderer/1.2.0/src/virgl_util.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_host_copy.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_buffer.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_device.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_buffer.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_device.h /usr/src/debug/virglrenderer/1.2.0/src/vkr_image_gen.h /usr/src/debug/virglrenderer/1.2.0/src/vkr_queue_gen.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_shader.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_shader.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_render_pass.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_debug.c /usr/src/debug/virglrenderer/1.2.0/src/vkr_buffer_gen.h /usr/src/debug/
 virglrenderer/1.2.0/src/vrend/vrend_strbuf.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_render_pass.c /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_debug.h /usr/src/debug/virglrenderer/1.2.0/src/venus_hw.h /usr/src/debug/virglrenderer/1.2.0/src/vkr_acceleration_structure_gen.h /usr/src/debug/virglrenderer/1.2.0/src/vrend/iov.c /usr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_formats.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_library.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_library.c /usr/src/debug/virglrenderer/1.2.0/src/vkr_pipeline_gen.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_instance.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_query_pool.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_query_pool.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_instance.h /usr/src/debug/virglrenderer/1.2.0/src/virglrenderer.h /usr/src/debug/virglrenderer/1.2.0/src/vkr_command_buffer_gen.h /usr/src/debug/virglrenderer/1.2.0/src/virglrenderer.c /u
 sr/src/debug/virglrenderer/1.2.0/src/vrend/vrend_iov.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_image.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_renderer.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_renderer.h /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_image.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_cs.c /usr/src/debug/virglrenderer/1.2.0/src/venus/vkr_cs.h /usr/src/debug/virglrenderer/1.2.0/src/vkr_device_memory_gen.h"
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-staticdev: PV changed from "1.1.1" to "1.2.0"
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer-staticdev: PKGV changed from 1.1.1 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer: PV changed from "1.1.1" to "1.2.0"
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer: PKGV changed from 1.1.1 [default] to 1.2.0 [default]
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer: PKGSIZE changed from 3516985 to 3684858 (+5%)
packages/x86-64-v3-poky-linux/virglrenderer/virglrenderer: FILELIST: removed "/usr/lib/libvirglrenderer.so.1.9.1", added "/usr/lib/libvirglrenderer.so.1.10.0"

--===============0262019593393160636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-88879be739e39f03ad1cb213b997de98a77c7676"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:88879be739e39f03ad1cb213b997de98a77c7676"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 308 Local 297 Mirrors 0 Missed 11 Current 305 (96% match, 98% complete)
done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 394 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 399 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1133 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe virglrenderer-1.2.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1185 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_fetch)
NOTE: Running setscene task 400 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 401 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe virglrenderer-1.2.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1201 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_unpack)
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.128-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 417 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe virglrenderer-1.2.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 452 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 463 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 470 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 471 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.128-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libdrm/2.4.128/temp/log.do_packagedata_setscene.2590200
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 478 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_package_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe virglrenderer-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 497 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 502 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1241 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_patch)
NOTE: Running setscene task 504 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 518 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1263 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1264 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_populate_lic)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe virglrenderer-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_populate_lic: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 527 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.128-r0: task do_package_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_populate_lic unihash changed to 869c239a3afcebfbfc4b03beeba5d2191065c8a0508805be8cb5c7eb4886af30
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe virglrenderer-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_deploy_source_date_epoch unihash changed to 7b7ec9f77241d2569fc8538a805abb51fbcf45f87e51abb9f797bf9ab9fd3f9d
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 531 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 538 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 548 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 552 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.128-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 570 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 579 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 611 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 613 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1682 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_packagedata)
NOTE: Running task 1703 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.128-r0: task do_packagedata: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.128-r0: task do_packagedata: Succeeded
NOTE: Running task 1740 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1741 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_configure)
NOTE: recipe virglrenderer-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe virglrenderer-1.2.0-r0: task do_configure: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1742 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_compile)
NOTE: recipe virglrenderer-1.2.0-r0: task do_compile: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1743 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_install)
NOTE: recipe virglrenderer-1.2.0-r0: task do_install: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1744 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_package)
NOTE: Running task 1745 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_populate_sysroot)
NOTE: recipe virglrenderer-1.2.0-r0: task do_package: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe virglrenderer-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1746 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_packagedata)
NOTE: recipe virglrenderer-1.2.0-r0: task do_packagedata: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1747 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_create_spdx)
NOTE: Running task 1748 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_package_write_ipk)
NOTE: Running task 1749 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_package_write_deb)
NOTE: Running task 1750 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_package_write_rpm)
NOTE: Running task 1751 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_package_qa)
NOTE: recipe virglrenderer-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_package_write_ipk: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_package_write_deb: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_package_qa: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1752 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_create_package_spdx)
NOTE: recipe virglrenderer-1.2.0-r0: task do_create_package_spdx: Started
NOTE: recipe virglrenderer-1.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe virglrenderer-1.2.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_package_qa unihash changed to 7da425597be9f29e12bc34cdee51242a017b5f2088d85d8c5495474c6f9362e1
NOTE: recipe virglrenderer-1.2.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe virglrenderer-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe virglrenderer-1.2.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1753 of 1753 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1753 tasks of which 1731 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.131-r0 to 0:2.4.128-r0) [version-going-backwards]
ERROR: libdrm-2.4.128-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0262019593393160636==--

