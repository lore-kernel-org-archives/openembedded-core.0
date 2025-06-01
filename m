Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EEEC83033
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:57 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.27762.1748786121366811216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qMqb/9Pl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oxn1C/uU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101972bc6f483-89a86563-6fd8-4ebb-b6ff-c6246a2f5350-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6+KDB8Fw1Lm+qejp/ipD8MSfUoBRkt1nB5thc9YCIbI=;
	b=qMqb/9PlvdxZ/3MM8qdI1Xdfnmjyaela71BuhgxBbDonSfEP7+QLxrw/6Mbo0Npz
	4ebN6y6K7gw168FVS4MohGg68BrS4gOKZZjBlE971AYgSf0kFGToDkXMUz/YGz1ufKL
	biBPHzL9kFl9la1f2dhmRjebFs/vtCLyB4DtiRU8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6+KDB8Fw1Lm+qejp/ipD8MSfUoBRkt1nB5thc9YCIbI=;
	b=oxn1C/uU1iO/P50c3yT8L17CxA+/xFVn6o9DTonnyNJXuRX1crQZ6F9JnGkkanwh
	ixfuPkZV3L+Xmq3F8fyd1/NtVDly6b2SNkEIdlmpLwU5bBWCJ+3Fp0ftSF0o2eRh9ai
	mDH2sZ9bHvsNZvmIFfSUat2JzbATGzj8uEipndqA=
Content-Type: multipart/mixed; boundary="===============0937790754741066028=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] virglrenderer: upgrading to 1.1.1 FAILED
Message-ID: <010101972bc6f483-89a86563-6fd8-4ebb-b6ff-c6246a2f5350-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217649

--===============0937790754741066028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *virglrenderer* to *1.1.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-virglrenderer-upgrade-1.1.0-1.1.1.patch
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
From dcfc3428bbcfb359a8cb9b74ed0be1a03af23129 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 12:14:08 +0000
Subject: [PATCH] virglrenderer: upgrade 1.1.0 -> 1.1.1

---
 ...uild-use-python3-directly-for-python.patch |  4 +-
 ...nversion-fatal-build-error-with-GCC-.patch | 37 -------------------
 ...nderer_1.1.0.bb => virglrenderer_1.1.1.bb} |  3 +-
 3 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.1.0.bb => virglrenderer_1.1.1.bb} (90%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index f9080d53c5..081964fc1a 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 9677f66a240a0513623aa26b47233b49193d0402 Mon Sep 17 00:00:00 2001
+From 7ad105b29008343c6638e57712fec0c3974b752a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 10be099e..3bb6eec7 100644
+index cd1953c3..7af920b1 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -77,7 +77,7 @@ flags = [
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
deleted file mode 100644
index 67dc4989b5..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From bb129aac12c5aa6e2dd371244b042baa82aff014 Mon Sep 17 00:00:00 2001
-From: Purushottam Choudhary <purushottam27.kumar@lge.com>
-Date: Tue, 8 Oct 2024 11:47:21 +0530
-Subject: [PATCH] vrend: Fix int-conversion fatal build error with GCC-14
-
-Getting below error int conversion during compilation as one the
-platforms where EGLNativeDisplayType is an int instead of a pointer.
-
-| ../git/src/vrend_winsys_egl.c: In function 'virgl_egl_init':
-| ../git/src/vrend_winsys_egl.c:364:62: error: passing argument 2 of 'egl->funcs.epoxy_eglGetPlatformDisplay' makes pointer from
-|   364 |                                                              (EGLNativeDisplayType)egl->gbm->device, NULL);
-|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-|       |                                                              |
-|       |                                                              int
-| ../git/src/vrend_winsys_egl.c:364:62: note: expected 'void *' but argument is of type 'int'
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/464deabe4d1bfce6b8f414ab0945d9a62b66ddd4]
-
-Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
-Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1440>
----
- src/vrend_winsys_egl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/vrend_winsys_egl.c b/src/vrend_winsys_egl.c
-index 9d9f410c..8750f6b2 100644
---- a/src/vrend_winsys_egl.c
-+++ b/src/vrend_winsys_egl.c
-@@ -361,7 +361,7 @@ struct virgl_egl *virgl_egl_init(EGLNativeDisplayType display_id, bool surfacele
- #ifdef ENABLE_GBM
-       else
-          egl->egl_display = egl->funcs.eglGetPlatformDisplay(EGL_PLATFORM_GBM_KHR,
--                                                             (EGLNativeDisplayType)egl->gbm->device, NULL);
-+                                                             (EGLNativeDisplayType*)egl->gbm->device, NULL);
- #endif
-    } else {
- #ifdef ENABLE_GBM
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
similarity index 90%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
index 07abde1c4f..d959de2ee3 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "1aeaf5e10a9c89096e96d09599aa419d5c50712f"
+SRCREV = "0f1f43929724a6a414c01a29bc51feccb445c2f0"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-           file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.47.1


--===============0937790754741066028==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.1.0-1.1.1.patch"

RnJvbSBkY2ZjMzQyOGJiY2ZiMzU5YThjYjliNzRlZDBiZTFhMDNhZjIzMTI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMjoxNDowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZp
cmdscmVuZGVyZXI6IHVwZ3JhZGUgMS4xLjAgLT4gMS4xLjEKCi0tLQogLi4udWlsZC11c2UtcHl0
aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIHwgIDQgKy0KIC4uLm52ZXJzaW9uLWZhdGFs
LWJ1aWxkLWVycm9yLXdpdGgtR0NDLS5wYXRjaCB8IDM3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
Lm5kZXJlcl8xLjEuMC5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMS4xLmJifSB8ICAzICstCiAzIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJl
ci8wMDAxLXZyZW5kLUZpeC1pbnQtY29udmVyc2lvbi1mYXRhbC1idWlsZC1lcnJvci13aXRoLUdD
Qy0ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci97dmly
Z2xyZW5kZXJlcl8xLjEuMC5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMS4xLmJifSAoOTAlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVy
ZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAx
LW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2gKaW5kZXgg
ZjkwODBkNTNjNS4uMDgxOTY0ZmMxYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24z
LWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Zp
cmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRp
cmVjdGx5LWZvci1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk2NzdmNjZhMjQw
YTA1MTM2MjNhYTI2YjQ3MjMzYjQ5MTkzZDA0MDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDdhZDEwNWIyOTAwODM0M2M2NjM4ZTU3NzEyZmVjMGMzOTc0Yjc1MmEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWls
LmNvbT4KIERhdGU6IE1vbiwgNiBKYW4gMjAyMCAxMjo0NDo0MiArMDEwMAogU3ViamVjdDogW1BB
VENIXSBtZXNvbi5idWlsZDogdXNlICdweXRob24zJyBkaXJlY3RseSBmb3IgcHl0aG9uCkBAIC0x
Myw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMTBi
ZTA5OWUuLjNiYjZlZWM3IDEwMDY0NAoraW5kZXggY2QxOTUzYzMuLjdhZjkyMGIxIDEwMDY0NAog
LS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtNzcsNyArNzcsNyBAQCBm
bGFncyA9IFsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVy
L3ZpcmdscmVuZGVyZXIvMDAwMS12cmVuZC1GaXgtaW50LWNvbnZlcnNpb24tZmF0YWwtYnVpbGQt
ZXJyb3Itd2l0aC1HQ0MtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVy
ZXIvdmlyZ2xyZW5kZXJlci8wMDAxLXZyZW5kLUZpeC1pbnQtY29udmVyc2lvbi1mYXRhbC1idWls
ZC1lcnJvci13aXRoLUdDQy0ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDY3
ZGM0OTg5YjUuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVu
ZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLXZyZW5kLUZpeC1pbnQtY29udmVyc2lvbi1mYXRhbC1i
dWlsZC1lcnJvci13aXRoLUdDQy0ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNyArMCwwIEBA
Ci1Gcm9tIGJiMTI5YWFjMTJjNWFhNmUyZGQzNzEyNDRiMDQyYmFhODJhZmYwMTQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCi1Gcm9tOiBQdXJ1c2hvdHRhbSBDaG91ZGhhcnkgPHB1cnVzaG90dGFt
Mjcua3VtYXJAbGdlLmNvbT4KLURhdGU6IFR1ZSwgOCBPY3QgMjAyNCAxMTo0NzoyMSArMDUzMAot
U3ViamVjdDogW1BBVENIXSB2cmVuZDogRml4IGludC1jb252ZXJzaW9uIGZhdGFsIGJ1aWxkIGVy
cm9yIHdpdGggR0NDLTE0Ci0KLUdldHRpbmcgYmVsb3cgZXJyb3IgaW50IGNvbnZlcnNpb24gZHVy
aW5nIGNvbXBpbGF0aW9uIGFzIG9uZSB0aGUKLXBsYXRmb3JtcyB3aGVyZSBFR0xOYXRpdmVEaXNw
bGF5VHlwZSBpcyBhbiBpbnQgaW5zdGVhZCBvZiBhIHBvaW50ZXIuCi0KLXwgLi4vZ2l0L3NyYy92
cmVuZF93aW5zeXNfZWdsLmM6IEluIGZ1bmN0aW9uICd2aXJnbF9lZ2xfaW5pdCc6Ci18IC4uL2dp
dC9zcmMvdnJlbmRfd2luc3lzX2VnbC5jOjM2NDo2MjogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQg
MiBvZiAnZWdsLT5mdW5jcy5lcG94eV9lZ2xHZXRQbGF0Zm9ybURpc3BsYXknIG1ha2VzIHBvaW50
ZXIgZnJvbQotfCAgIDM2NCB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAoRUdMTmF0aXZlRGlzcGxheVR5cGUpZWdsLT5nYm0tPmRl
dmljZSwgTlVMTCk7Ci18ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+Ci18ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwKLXwgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50Ci18IC4uL2dpdC9z
cmMvdnJlbmRfd2luc3lzX2VnbC5jOjM2NDo2Mjogbm90ZTogZXhwZWN0ZWQgJ3ZvaWQgKicgYnV0
IGFyZ3VtZW50IGlzIG9mIHR5cGUgJ2ludCcKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBb
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3ZpcmdscmVuZGVyZXIvLS9jb21t
aXQvNDY0ZGVhYmU0ZDFiZmNlNmI4ZjQxNGFiMDk0NWQ5YTYyYjY2ZGRkNF0KLQotU2lnbmVkLW9m
Zi1ieTogUHVydXNob3R0YW0gQ2hvdWRoYXJ5IDxwdXJ1c2hvdHRhbTI3Lmt1bWFyQGxnZS5jb20+
Ci1QYXJ0LW9mOiA8aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3ZpcmdscmVu
ZGVyZXIvLS9tZXJnZV9yZXF1ZXN0cy8xNDQwPgotLS0tCi0gc3JjL3ZyZW5kX3dpbnN5c19lZ2wu
YyB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
LQotZGlmZiAtLWdpdCBhL3NyYy92cmVuZF93aW5zeXNfZWdsLmMgYi9zcmMvdnJlbmRfd2luc3lz
X2VnbC5jCi1pbmRleCA5ZDlmNDEwYy4uODc1MGY2YjIgMTAwNjQ0Ci0tLS0gYS9zcmMvdnJlbmRf
d2luc3lzX2VnbC5jCi0rKysgYi9zcmMvdnJlbmRfd2luc3lzX2VnbC5jCi1AQCAtMzYxLDcgKzM2
MSw3IEBAIHN0cnVjdCB2aXJnbF9lZ2wgKnZpcmdsX2VnbF9pbml0KEVHTE5hdGl2ZURpc3BsYXlU
eXBlIGRpc3BsYXlfaWQsIGJvb2wgc3VyZmFjZWxlCi0gI2lmZGVmIEVOQUJMRV9HQk0KLSAgICAg
ICBlbHNlCi0gICAgICAgICAgZWdsLT5lZ2xfZGlzcGxheSA9IGVnbC0+ZnVuY3MuZWdsR2V0UGxh
dGZvcm1EaXNwbGF5KEVHTF9QTEFURk9STV9HQk1fS0hSLAotLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoRUdMTmF0aXZlRGlzcGxh
eVR5cGUpZWdsLT5nYm0tPmRldmljZSwgTlVMTCk7Ci0rICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChFR0xOYXRpdmVEaXNwbGF5VHlw
ZSopZWdsLT5nYm0tPmRldmljZSwgTlVMTCk7Ci0gI2VuZGlmCi0gICAgfSBlbHNlIHsKLSAjaWZk
ZWYgRU5BQkxFX0dCTQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVu
ZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjEuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJn
bHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4xLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJl
cl8xLjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIv
dmlyZ2xyZW5kZXJlcl8xLjEuMS5iYgppbmRleCAwN2FiZGUxYzRmLi5kOTU5ZGUyZWUzIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVy
XzEuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3Zpcmds
cmVuZGVyZXJfMS4xLjEuYmIKQEAgLTksMTAgKzksOSBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM4MWMwOGVlZWZkOTQxOGZjYThmODgz
MDlhNzZkYjEwIgogCiBERVBFTkRTID0gImxpYmRybSBsaWJlcG94eSB2aXJ0dWFsL2VnbCB2aXJ0
dWFsL2xpYmdibSIKLVNSQ1JFViA9ICIxYWVhZjVlMTBhOWM4OTA5NmU5NmQwOTU5OWFhNDE5ZDVj
NTA3MTJmIgorU1JDUkVWID0gIjBmMWY0MzkyOTcyNGE2YTQxNGMwMWEyOWJjNTFmZWNjYjQ0NWMy
ZjAiCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvdmlyZ2wvdmlyZ2xy
ZW5kZXJlci5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNo
IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtdnJlbmQtRml4LWludC1jb252ZXJzaW9uLWZhdGFs
LWJ1aWxkLWVycm9yLXdpdGgtR0NDLS5wYXRjaCBcCiAgICAgICAgICAgICIKIAogUyA9ICIke1dP
UktESVJ9L2dpdCIKLS0gCjIuNDcuMQoK

--===============0937790754741066028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
Parsing recipes...done.
Parsing of 936 .bb files complete (935 cached, 1 parsed). 1915 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2335f97de080ac4c76770c4084ac0fa047cad70b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 407 Local 396 Mirrors 0 Missed 11 Current 571 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 698 of 978 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 702 of 978 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 703 of 978 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_25.1.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 781 of 2741 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_fetch)
NOTE: Running task 783 of 2741 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_write_config)
NOTE: recipe mesa-2_25.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 978 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 722 of 978 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 844 of 978 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 945 of 978 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 950 of 978 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: Running task 1419 of 2741 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_unpack)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 958 of 978 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 968 of 978 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1940 of 2741 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_patch)
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1998 of 2741 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1999 of 2741 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_populate_lic)
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_populate_lic: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_populate_lic unihash changed to 7aa6713a2479eaa6f9ba85992732603ec3f0107410c133c4b3d60d3cc250ae97
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch unihash changed to 97518580e8f6b3a57889654ebf68a4754df721580af3ca3b353820263bde93e0
NOTE: Setscene tasks completed
NOTE: Running task 2661 of 2741 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2728 of 2741 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2729 of 2741 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_configure)
NOTE: recipe virglrenderer-1.1.1-r0: task do_configure: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2730 of 2741 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_compile)
NOTE: recipe virglrenderer-1.1.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| [1/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffil
 e-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_bitscan.c.o -MF src/mesa/libmesa.a.p/util_bitscan.c.o.d -o src/mesa/libmesa.a.p/util_bitscan.c.o -c ../git/src/mesa/util/bitscan.c
| [2/94] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/python3-native/python3 ../git/src/venus/vkr_device_object.py -o src ../git/src/venus/vkr_device_object.json
| [3/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffil
 e-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_anon_file.c.o -MF src/mesa/libmesa.a.p/util_anon_file.c.o.d -o src/mesa/libmesa.a.p/util_anon_file.c.o -c ../git/src/mesa/util/anon_file.c
| [4/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffil
 e-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_os_misc.c.o -MF src/mesa/libmesa.a.p/util_os_misc.c.o.d -o src/mesa/libmesa.a.p/util_os_misc.c.o -c ../git/src/mesa/util/os_misc.c
| [5/94] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/meson.real --internal exe --capture src/gallium/u_format_table.c -- /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/python3-native/python3 -B ../git/src/gallium/auxiliary/util/u_format_table.py ../git/src/gallium/auxiliary/util/u_format.yaml
| FAILED: src/gallium/u_format_table.c
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/meson.real --internal exe --capture src/gallium/u_format_table.c -- /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/python3-native/python3 -B ../git/src/gallium/auxiliary/util/u_format_table.py ../git/src/gallium/auxiliary/util/u_format.yaml
| --- stderr ---
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/../git/src/gallium/auxiliary/util/u_format_table.py", line 36, in <module>
|     from u_format_parse import *
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git/src/gallium/auxiliary/util/u_format_parse.py", line 33, in <module>
|     import yaml
| ModuleNotFoundError: No module named 'yaml'
| 
| [6/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden
  -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_texture.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_texture.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_texture.c.o -c ../git/src/gallium/auxiliary/util/u_texture.c
| [7/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffil
 e-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_os_file.c.o -MF src/mesa/libmesa.a.p/util_os_file.c.o.d -o src/mesa/libmesa.a.p/util_os_file.c.o -c ../git/src/mesa/util/os_file.c
| [8/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden
  -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_hash_table.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_hash_table.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_hash_table.c.o -c ../git/src/gallium/auxiliary/util/u_hash_table.c
| [9/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden
  -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_debug_describe.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_debug_describe.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_debug_describe.c.o -c ../git/src/gallium/auxiliary/util/u_debu
 g_describe.c
| [10/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffi
 le-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_debug.c.o -MF src/mesa/libmesa.a.p/util_u_debug.c.o.d -o src/mesa/libmesa.a.p/util_u_debug.c.o -c ../git/src/mesa/util/u_debug.c
| [11/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_cache.c.o -MF src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_cache.c.o.d -o src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_cache.c.o -c ../git/src/gallium/auxiliary/cso_cache/cso_ca
 che.c
| [12/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffi
 le-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_math.c.o -MF src/mesa/libmesa.a.p/util_u_math.c.o.d -o src/mesa/libmesa.a.p/util_u_math.c.o -c ../git/src/mesa/util/u_math.c
| [13/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_util_u_format.c.o -MF src/gallium/libgallium.a.p/auxiliary_util_u_format.c.o.d -o src/gallium/libgallium.a.p/auxiliary_util_u_format.c.o -c ../git/src/gallium/auxiliary/util/u_format.c
| [14/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_hash.c.o -MF src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_hash.c.o.d -o src/gallium/libgallium.a.p/auxiliary_cso_cache_cso_hash.c.o -c ../git/src/gallium/auxiliary/cso_cache/cso_hash.
 c
| [15/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffi
 le-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_u_cpu_detect.c.o -MF src/mesa/libmesa.a.p/util_u_cpu_detect.c.o.d -o src/mesa/libmesa.a.p/util_u_cpu_detect.c.o -c ../git/src/mesa/util/u_cpu_detect.c
| [16/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffi
 le-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_ralloc.c.o -MF src/mesa/libmesa.a.p/util_ralloc.c.o.d -o src/mesa/libmesa.a.p/util_ralloc.c.o -c ../git/src/mesa/util/ralloc.c
| [17/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_build.c.o -MF src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_build.c.o.d -o src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_build.c.o -c ../git/src/gallium/auxiliary/tgsi/tgsi_build.c
| [18/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_scan.c.o -MF src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_scan.c.o.d -o src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_scan.c.o -c ../git/src/gallium/auxiliary/tgsi/tgsi_scan.c
| [19/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/gallium/libgallium.a.p -Isrc/gallium -I../git/src/gallium -I../git/src/gallium/include -I../git/src/gallium/auxiliary -I../git/src/gallium/auxiliary/util -I. -I../git -Isrc -I../git/src -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidde
 n -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_dump.c.o -MF src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_dump.c.o.d -o src/gallium/libgallium.a.p/auxiliary_tgsi_tgsi_dump.c.o -c ../git/src/gallium/auxiliary/tgsi/tgsi_dump.c
| [20/94] x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot -Isrc/mesa/libmesa.a.p -Isrc/mesa -I../git/src/mesa -I../git/src/mesa/compat -I../git/src/mesa/pipe -I../git/src/mesa/util -fdiagnostics-color=always -DNDEBUG -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu11 -Werror=enum-int-mismatch -Werror=implicit-function-declaration -Werror=missing-prototypes -Werror=pedantic -Wmissing-prototypes -Werror=incompatible-pointer-types -Werror=int-to-pointer-cast -Werror=switch -Wno-overlength-strings -Wno-missing-field-initializers -Werror=format -fvisibility=hidden -fno-strict-aliasing -imacros /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build/config.h -DHAVE_CONFIG_H=1 -O2 -g -ffi
 le-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/git=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/build=/usr/src/debug/virglrenderer/1.1.1 -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot= -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native= -pipe -fPIC -pthread -MD -MQ src/mesa/libmesa.a.p/util_hash_table.c.o -MF src/mesa/libmesa.a.p/util_hash_table.c.o.d -o src/mesa/libmesa.a.p/util_hash_table.c.o -c ../git/src/mesa/util/hash_table.c
| ninja: build stopped: subcommand failed.
| INFO: autodetecting backend as ninja
| INFO: calculating backend command to run: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/recipe-sysroot-native/usr/bin/ninja -j 16 -l 75.0 -v
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.2716055:153 exit 1 from 'meson compile -v -j 16 -l 75'
| WARNING: Backtrace (BB generated script):
| 	#1: meson_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.2716055, line 153
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.2716055, line 148
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.2716055, line 157
NOTE: recipe virglrenderer-1.1.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2730 tasks of which 2720 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601121350.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601121350.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/log.do_compile.2716055
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: virglrenderer-1.1.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/run.do_compile.2716055' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.1/temp/log.do_compile.2716055
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_compile) failed with exit code '1'

--===============0937790754741066028==--

