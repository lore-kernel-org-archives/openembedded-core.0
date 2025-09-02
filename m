Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D390CA1009
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.89795.1756850186776840562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dOU06pNs;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DG1uN9ti;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101990c6ea0b7-bd9b9910-b9ba-4fc0-866a-0bf87a421f27-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Rvkxp3+JJTTjbMw840duV2A4jTjy/GP50uCPR4mH00k=;
	b=dOU06pNsV7B7znUWGiwXauE6ZTlitTeL3HYIYYnhGzR1YlbnDJd1OIx3QW2k2PE5
	co7FsT1XYLIDknBY8Dye2xAcllssfnNbmrVPinn+AA2ybxGzvG5dvcDWXUF2v9jILyS
	fTqx5hDIfu2F2gbZ8Ck4DaBQp8ZrYzD+D3H4UuPI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Rvkxp3+JJTTjbMw840duV2A4jTjy/GP50uCPR4mH00k=;
	b=DG1uN9tiRpQvoymFFtJB2yBJ4YyUaK+3FZ033vD/xEz7rAQduBUDhe/6HJI5ul4+
	R4aG42wZ9x50Wj3GXkZUlSmKg62bsesY4U+kYlScq17Hy/1RF6964qGtKI7TZb7O8JC
	P5uNnc8v+W2SphjmXyOhFM8m8sYBglH1XH/Or8tg=
Content-Type: multipart/mixed; boundary="===============1641392849017956209=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 28d1349844eacda869f0f82f551bcd4ac0c4edfe
 SUCCEEDED
Message-ID: <010101990c6ea0b7-bd9b9910-b9ba-4fc0-866a-0bf87a421f27-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222814

--===============1641392849017956209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *28d1349844eacda869f0f82f551bcd4ac0c4edfe* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
From 5876438a065634715e4afe1786b9f531b9a07962 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 20:35:53 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...MakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 4 ++--
 .../0001-tests-Fix-narrowing-errors-seen-with-clang.patch    | 2 +-
 ...ests-egl-spec-make-egl_ext_surface_compression-cond.patch | 2 +-
 ...1-tests-no_error.py-modify-_command-and-not-command.patch | 5 +----
 ...0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...ests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                   | 2 +-
 7 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 6ce2348a71..c910f8e669 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 9ffd24add3263e24975318e693309881eadd99a2 Mon Sep 17 00:00:00 2001
+From be738b9fd6578890950ed034ddc0d8f880ff90d2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 99ae07a4a..d5ee9cc22 100644
+index 147bd8e17..ffc910354 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 9751b20673..366270b3a9 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 0ba2f908f2a2a897e8e06e34f99893d11ee4734c Mon Sep 17 00:00:00 2001
+From 37646982c2e957782a8688a6343ba00085e90fdf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index c6c072c7e0..9037c6d62f 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From d6ed4c477f22309c09accd4fee68486d7714f205 Mon Sep 17 00:00:00 2001
+From ef765447de0ec3e6dfbaf5c4a23772014548a5af Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
index f8600556e5..9ff5732c55 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
@@ -1,4 +1,4 @@
-From 846efe923932d66810305b228fa09f83a172296d Mon Sep 17 00:00:00 2001
+From 2f7f05100b4383400368f97a90f9172ffd84c733 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 22 May 2025 17:34:15 +0200
 Subject: [PATCH] tests/no_error.py: modify _command and not command
@@ -27,6 +27,3 @@ index 4ecaa9a01..c64eec0a1 100644
          profile.test_list['{} khr_no_error'.format(name)] = test
 -        test.command += ['-khr_no_error']
 +        test._command += ['-khr_no_error']
--- 
-2.39.5
-
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 6cb561c3f2..16c6bdd148 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From deb0c15890fb9d0f4fc7074dde2a51c89cb5bf6d Mon Sep 17 00:00:00 2001
+From 32976f021c8dde3077a272644619b6e00cfeb4bd Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 7706d88086..59e780ffbe 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 66d1d86ff8be33df265d0dda717be385fe8637cd Mon Sep 17 00:00:00 2001
+From 671e30cd4fa4e119fc9ba5a8db9f5f1be35a3957 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 59f014afee..ee6028549e 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "a0a27e528f643dfeb785350a1213bfff09681950"
+SRCREV = "28d1349844eacda869f0f82f551bcd4ac0c4edfe"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.1


--===============1641392849017956209==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA1ODc2NDM4YTA2NTYzNDcxNWU0YWZlMTc4NmI5ZjUzMWI5YTA3OTYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMDozNTo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogLi4uTWFrZUxpc3RzLnR4dC1k
by1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIHwgNCArKy0tCiAuLi4v
MDAwMS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2ggICAg
fCAyICstCiAuLi5lc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9u
LWNvbmQucGF0Y2ggfCAyICstCiAuLi4xLXRlc3RzLW5vX2Vycm9yLnB5LW1vZGlmeS1fY29tbWFu
ZC1hbmQtbm90LWNvbW1hbmQucGF0Y2ggfCA1ICstLS0tCiAuLi4wMDAyLWNtYWtlLXVzZS1wcm9w
ZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2ggfCAyICstCiAuLi5lc3RzLXV0
aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2ggfCAyICst
CiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIgICAgICAgICAgICAg
ICAgICAgfCAyICstCiA3IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQv
MDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZy
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxp
c3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoCmluZGV4
IDZjZTIzNDhhNzEuLmM5MTBmOGU2NjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VMaXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5k
LXNjYW5uZXItcGF0aC1mci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVy
LXBhdGgtZnIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlmZmQyNGFkZDMyNjNlMjQ5NzUz
MThlNjkzMzA5ODgxZWFkZDk5YTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJlNzM4
YjlmZDY1Nzg4OTA5NTBlZDAzNGRkYzBkOGY4ODBmZjkwZDIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTog
RnJpLCAyMyBBdWcgMjAyNCAxNToyOTo0NSArMDIwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxp
c3RzLnR4dDogZG8gbm90IG9idGFpbiB3YXlsYW5kLXNjYW5uZXIgcGF0aCBmcm9tCkBAIC0xNyw3
ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9u
aXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQog
CiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXggOTlh
ZTA3YTRhLi5kNWVlOWNjMjIgMTAwNjQ0CitpbmRleCAxNDdiZDhlMTcuLmZmYzkxMDM1NCAxMDA2
NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTIxMSwx
MSArMjExLDcgQEAgaWYoUElHTElUX1VTRV9XQVlMQU5EKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9y
cy1zZWVuLXdpdGgtY2xhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRj
aAppbmRleCA5NzUxYjIwNjczLi4zNjYyNzBiM2E5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNl
ZW4td2l0aC1jbGFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGJhMmY5MDhmMmEyYTg5N2U4ZTA2ZTM0Zjk5ODkzZDEx
ZWU0NzM0YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzc2NDY5ODJjMmU5NTc3ODJh
ODY4OGE2MzQzYmEwMDA4NWU5MGZkZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDMgTWF5IDIwMjMgMjE6NTk6
NDMgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IEZpeCBuYXJyb3dpbmcgZXJyb3JzIHNl
ZW4gd2l0aCBjbGFuZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9w
aWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lv
bi1jb25kLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10
ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNo
CmluZGV4IGM2YzA3MmM3ZTAuLjkwMzdjNmQ2MmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1
cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2Nv
bXByZXNzaW9uLWNvbmQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ2ZWQ0YzQ3N2YyMjMw
OWMwOWFjY2Q0ZmVlNjg0ODZkNzcxNGYyMDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGVmNzY1NDQ3ZGUwZWMzZTZkZmJhZjVjNGEyMzc3MjAxNDU0OGE1YWYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgog
RGF0ZTogRnJpLCAyMiBOb3YgMjAyNCAyMjo1MjozMSArMDEwMAogU3ViamVjdDogW1BBVENIXSB0
ZXN0cy9lZ2wvc3BlYzogbWFrZSBlZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24gY29uZGl0aW9u
YWwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEt
dGVzdHMtbm9fZXJyb3IucHktbW9kaWZ5LV9jb21tYW5kLWFuZC1ub3QtY29tbWFuZC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtbm9fZXJyb3Iu
cHktbW9kaWZ5LV9jb21tYW5kLWFuZC1ub3QtY29tbWFuZC5wYXRjaAppbmRleCBmODYwMDU1NmU1
Li45ZmY1NzMyYzU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAxLXRlc3RzLW5vX2Vycm9yLnB5LW1vZGlmeS1fY29tbWFuZC1hbmQtbm90LWNvbW1h
bmQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10
ZXN0cy1ub19lcnJvci5weS1tb2RpZnktX2NvbW1hbmQtYW5kLW5vdC1jb21tYW5kLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA4NDZlZmU5MjM5MzJkNjY4MTAzMDViMjI4ZmEwOWY4M2ExNzIy
OTZkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyZjdmMDUxMDBiNDM4MzQwMDM2OGY5
N2E5MGY5MTcyZmZkODRjNzMzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFRodSwgMjIgTWF5IDIwMjUg
MTc6MzQ6MTUgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvbm9fZXJyb3IucHk6IG1vZGlm
eSBfY29tbWFuZCBhbmQgbm90IGNvbW1hbmQKQEAgLTI3LDYgKzI3LDMgQEAgaW5kZXggNGVjYWE5
YTAxLi5jNjRlZWMwYTEgMTAwNjQ0CiAgICAgICAgICBwcm9maWxlLnRlc3RfbGlzdFsne30ga2hy
X25vX2Vycm9yJy5mb3JtYXQobmFtZSldID0gdGVzdAogLSAgICAgICAgdGVzdC5jb21tYW5kICs9
IFsnLWtocl9ub19lcnJvciddCiArICAgICAgICB0ZXN0Ll9jb21tYW5kICs9IFsnLWtocl9ub19l
cnJvciddCi0tLSAKLTIuMzkuNQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMt
dmFyaWFibGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAy
LWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKaW5k
ZXggNmNiNTYxYzNmMi4uMTZjNmJkZDE0OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9E
SVJTLXZhcmlhYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGViMGMxNTg5MGZiOWQwZjRmYzcwNzRkZGUyYTUx
Yzg5Y2I1YmY2ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzI5NzZmMDIxYzhkZGUz
MDc3YTI3MjY0NDYxOWI2ZTAwY2ZlYjRiZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFBhc2NhbCBCYWNoIDxwYXNjYWwuYmFjaEBzaWVtZW5zLmNvbT4KIERhdGU6IFRodSwgNCBPY3Qg
MjAxOCAxNDo0MzoxNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBjbWFrZTogdXNlIHByb3BlciBX
QVlMQU5EX0lOQ0xVREVfRElSUyB2YXJpYWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1u
b3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUt
YnVpbGQtcGF0LnBhdGNoCmluZGV4IDc3MDZkODgwODYuLjU5ZTc4MGZmYmUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWds
aXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRl
ci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDY2ZDFkODZmZjhiZTMzZGYyNjVkMGRkYTcxN2JlMzg1ZmU4NjM3Y2QgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDY3MWUzMGNkNGZhNGUxMTlmYzliYTVhOGRiOWY1ZjFiZTM1YTM5NTcg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMTAgTm92IDIwMjAgMTc6MTM6NTAgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvdXRpbC9waWdsaXQtc2hhZGVyLmM6IGRvIG5vdCBoYXJk
Y29kZSBidWlsZCBwYXRoIGludG8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9w
aWdsaXQvcGlnbGl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0
X2dpdC5iYgppbmRleCA1OWYwMTRhZmVlLi5lZTYwMjg1NDllIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCkBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC5naXQ7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1hCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIK
IAotU1JDUkVWID0gImEwYTI3ZTUyOGY2NDNkZmViNzg1MzUwYTEyMTNiZmZmMDk2ODE5NTAiCitT
UkNSRVYgPSAiMjhkMTM0OTg0NGVhY2RhODY5ZjBmODJmNTUxYmNkNGFjMGM0ZWRmZSIKICMgKHdo
ZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4wK2dp
dHIiCiAKLS0gCjIuNDcuMQoK

--===============1641392849017956209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1940 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1940 targets, 45 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-f5f221caac4a06165eb98cee5036ec6feec4a674"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f5f221caac4a06165eb98cee5036ec6feec4a674"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 443 Local 431 Mirrors 0 Missed 12 Current 712 (97% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2600 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 3171 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 3172 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 3173 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 3174 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3175 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 3176 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 3177 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to c86dc228a2cb2263183996ffb57181e4bde9247f6766f9ba1d74ec58e604fe57
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3178 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 3180 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 3181 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 3182 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot unihash changed to 3fbfc862e349aac1e0ef5963af98040f8b532f01f850b95238a2a62c479fa174
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 3183 of 3190 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 3183 tasks of which 3169 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902202253.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902202253.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.1273940
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+28d1349844-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+28d1349844-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+28d1349844-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+28d1349844-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+28d1349844-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+28d1349844-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+28d1349844-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+a0a27e528f-r0 to 0:1.0+gitr0+28d1349844-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.1273940
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============1641392849017956209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+a0a27e528f-r0'])", added "piglit (['= 1.0+gitr0+28d1349844-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGSIZE changed from 22455 to 22527 (+0%)
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+a0a27e528f-r0'])", added "piglit-dev (['= 1.0+gitr0+28d1349844-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit: PKGSIZE changed from 2054165834 to 2058884752 (+0%)
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/tests/shaders/ssa/fs-if-def-else-break.shader_test", added "/usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2-mat4x2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/simple-types-other-queries.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/va64/simple.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/gls
 l-1.10/execution/built-in-functions/fs-notEqual-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-func
 tions/fs-degrees-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-int64_t-int64_t-int64_t.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-02.shader_test.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/ex
 ecution/built-in-functions/fs-op-lshift-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/function-call-glslang-issue-1285.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/sample-shading-fs.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/bu
 ilt-in-functions/fs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-l
 shift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-stages-test.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uvec4.shader_t
 est /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/origin-lower-left.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-eq-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ge-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-gt-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-float-float.shader_test /usr/lib/piglit/g
 enerated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThan-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThan-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-le-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lt-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitand-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitxor-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/executi
 on/built-in-functions/fs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-int-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/atomic-image.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/ar
 b_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec3-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-float-float.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/unsized-array.shader_test /usr/lib/piglit
 /generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb
 _gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/
 execution/built-in-functions/fs-op-add-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-gt-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-lt-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec4-uvec4.shader_test /usr/lib/
 piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat2-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat3-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat4-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-not-bool.shader_test /usr/lib/piglit/generated_tests/spec/
 arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uint.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-of-arrays-inside-ssbo.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/tcs-patch-vertices-in.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/simple-function.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions
 /fs-mid3-vec2-vec2-vec2.shader_test /usr/lib/piglit/bin/arb_spirv_extensions-post_depth_coverage-multisampling /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/bin/egl_ext_device_persistent_id /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/
 arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-float-float-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/origin-uppe
 r-left.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests
 /spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_
 shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/executi
 on/built-in-functions/fs-op-mult-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-xor-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec2-uvec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/vs-instance-id.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat4.shader_test /usr/lib/piglit/bin/glx-multithread-bu
 ffer-busy-tracking-bug /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/component-layout-sso-vs-gs-fs-array-interleave.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec2-ivec2.shader_test /usr/lib/piglit/genera
 ted_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat3x2.shader_test /usr/lib/piglit/generated_tests/spe
 c/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-ge-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-le-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-ne-uint-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/uniform/atomic-uint-fs.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/buil
 t-in-functions/fs-max3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3-mat4x3.shader_test /usr/lib/piglit/generate
 d_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec4-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec4-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec2-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec2-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec3-mat2x3.shader_test /usr/lib/piglit/generated_tes
 ts/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThan-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/
 bin/arb_fragment_program-recompile /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/sso-block-member-layout-location.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-vec4-vec4-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/pixel-center-integer.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uvec3-uvec3.shader
 _test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec3-uvec3.shader_test /usr/lib/piglit/bin/arb_spirv_extensions-post_depth_coverage-sample-shading /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-01.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-02.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-03.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-04.shader_test /usr/lib/piglit/tests/spec
 /glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-05.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec3-ivec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-
 in-functions/fs-inversesqrt-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-gt-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lt-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec2
 .shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-not-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-not-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-not-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/bu
 ilt-in-functions/fs-round-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-float.shader_test /usr/lib/piglit/gen
 erated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/va64/array.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec3-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_
 spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec4-i64vec4-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec2-i64vec2-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-float.shader_test /u
 sr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec3-uvec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-inside-ssbo.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec3-vec3.shader_test /usr/lib/piglit/gener
 ated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec2-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec3-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec4-i64vec4-i64vec4.shader_test /usr/lib/piglit/bin/egl_ext_device_query_name /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-eq-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execu
 tion/built-in-functions/fs-pow-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uint-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uint-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs
 -min-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqua
 l-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqual-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqual-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-funct
 ions/fs-max-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uint-uint.shader_tes
 t /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uint-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program/max-length-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-vec
 2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-vec3-vec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/two-ssbo-different-layouts.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/a
 rb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec2-uvec2.shader_test /usr/lib/piglit/generated_
 tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec2-ivec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/ubo-nested-structs-other-queries.shader_test /usr/lib/piglit/bin/arb_gl_spirv-sample-position /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/aggregate-types-other-
 queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitor-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uint64_t.shade
 r_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-ivec2-ivec2.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/fs.shader_source /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_s
 ource/vs.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ne-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-le-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gp
 u_shader_int64/execution/built-in-functions/fs-op-lt-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-eq-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ge-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-gt-int64_t-int64_t.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisamp
 ling-fs-1.shader_source /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisampling-fs-2.shader_source /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisampling-fs-3.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-ivec3-ivec3.shader_test /usr/lib/piglit/generate
 d_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spi
 rv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-ivec4
 -ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat4.shader_test /u
 sr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-scalar.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_draw_parameters/vs-basei
 nstance.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-large-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec4-vec4.shader_test /usr/lib/piglit/bin/depth_clamp_quirks /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-
 in-functions/fs-min-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitor-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-int-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-data-types.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/exec
 ution/built-in-functions/fs-op-rshift-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program/max-length-xfb-query.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shad
 er_int64/execution/built-in-functions/fs-max-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec3.shader_test /usr
 /lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-eq-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in
 -functions/fs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-eq-uint-uint.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-indirect.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/simple.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat3x4.shader_tes
 t /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/exec
 ution/built-in-functions/fs-log2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec4.shader_test /usr/lib/piglit/generated_tests/spe
 c/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec4-vec4-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution
 /varying/mat/mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec3-vec3-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-ivec4-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/pixel-center-half.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions
 /fs-op-div-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cross-vec3-vec3.shader_test /usr/lib/piglit/generated
 _tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-int-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-int-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec4-ivec4.s
 hader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitand-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitxor-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ne-uint64_t-uint64_t.shader_test /usr/lib/piglit/generate
 d_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-vec3-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/block.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-array-types.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-int-int.shad
 er_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/array_of_input_output_block.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat3x4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/aggregate-types-name-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_g
 l_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-or-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/bui
 lt-in-functions/fs-sinh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-
 u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-vec2-vec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/vs-vertex-id.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/linker/simple-function-call.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execut
 ion/built-in-functions/fs-outerProduct-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-float.shader_test /usr/l
 ib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-int64_t-int64_t-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec3-uvec3.shader_test /u
 sr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-gt-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-func
 tions/fs-op-lt-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/exe
 cution/built-in-functions/fs-mix-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec4.shader_test /usr/lib/piglit/bin/glx-multi-context-ib-2 /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ge-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-le-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/exec
 ution/built-in-functions/fs-op-ne-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source
 /basic-fs.shader_source /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat-arb.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ne-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/f
 s-max-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/exec
 ution/built-in-functions/fs-op-mod-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec2-vec2-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec2-vec2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec3-vec3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec4-vec4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec4-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/exec
 ution/queries/program/other-queries.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-01.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-03.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-04.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-05.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-float-float-bool.shader_test /usr/lib/piglit/bin/ext_image_dma_buf_import-render-rgb24 /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-uint64_t-uint64_t.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/aoa-2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/unordered-comparison.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv
 /glsl-1.20/execution/built-in-functions/fs-transpose-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-int.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-06.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-07.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-func
 tions/fs-op-and-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec3-i64vec3-bvec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/xfb/gs_two_invocations.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-int64_t-int64_t.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/simple-geometry.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/xfb-simple-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/
 arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec2.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_draw_parameters/vs-basevertex.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec4.
 shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built
 -in-functions/fs-atanh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-vec4-vec4.shader_test /usr/lib/piglit/bin/arb_spirv_extensions-post_depth_coverage-basic /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/component-layout-vs-gs-fs.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec2-uvec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/atomic-counter-other-queries.shader_test /usr/li
 b/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uint-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/component-layout-vs-gs-fs-double.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-ivec3-ivec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_draw_parameters/vs-drawid.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/exec
 ution/built-in-functions/fs-op-eq-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-float-float-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/shared-uint-atomic-mem-functions.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/ubo-matrices-other-queries.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/cs-basic-ssbo.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_g
 l_spirv/glsl-1.10/execution/built-in-functions/fs-op-ge-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-le-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ne-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec4-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/xfb-name-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_g
 pu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spi
 rv/glsl-1.10/execution/built-in-functions/fs-asin-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec3.shader_test /usr/lib/piglit/te
 sts/spec/arb_gl_spirv/execution/xfb/vs_two_sets_mixing_order.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execut
 ion/built-in-functions/fs-op-rshift-int64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/simple-types-name-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spe
 c/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec4-vec4-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb
 _gpu_shader_int64/execution/built-in-functions/fs-op-mod-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lsh
 ift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec3-mat4x3.shader_test"
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844

--===============1641392849017956209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1941 targets, 53 skipped, 0 masked, 0 errors.
Removing 110 recipes from the qemux86_64 sysroot...done.
Removing 93 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-f5f221caac4a06165eb98cee5036ec6feec4a674"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f5f221caac4a06165eb98cee5036ec6feec4a674"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 786 Local 753 Mirrors 0 Missed 33 Current 388 (95% match, 97% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 391 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 413 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 415 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 416 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 427 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 437 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 448 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 449 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 450 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 478 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 486 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 488 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 490 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 492 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 495 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_package_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-mako-1.3.10-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 499 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 509 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 524 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 540 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_create_spdx_setscene)
NOTE: Running setscene task 547 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 550 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 554 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 559 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-mako-1.3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 561 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-demos-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 563 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 564 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 566 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 568 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 569 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 572 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 575 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 576 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-mako-1.3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 585 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 593 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 595 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 605 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 607 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 608 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 613 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-demos-9.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 617 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 627 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 632 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-demos-9.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 645 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 650 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/mesa/25.2.0/temp/log.do_packagedata_setscene.1275942
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 671 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_package_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 692 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 713 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 716 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 720 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-mako-1.3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 723 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 749 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 765 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 773 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1295 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1306 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1384 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1392 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 1394 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1416 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_fetch)
NOTE: Running task 1417 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_write_config)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 777 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1505 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1519 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1549 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1550 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-9.0.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1595 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_unpack: Started
NOTE: Running task 1701 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_unpack)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1716 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe mesa-demos-9.0.0-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Succeeded
NOTE: Running task 1717 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1718 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe waffle-1.8.1-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1721 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1722 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1723 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1724 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_patch)
NOTE: recipe waffle-1.8.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe waffle-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1726 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_patch)
NOTE: recipe mesa-demos-9.0.0-r0: task do_patch: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1728 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 1729 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 1735 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1736 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: recipe mesa-2_25.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 790 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 804 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 809 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 823 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 827 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 830 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 831 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 839 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 843 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 845 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe clang-20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 855 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 863 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 866 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 867 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 875 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 877 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 887 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 894 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 904 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 906 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 909 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running task 1863 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 911 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 913 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 915 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 916 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 917 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 920 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running setscene task 921 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 923 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 924 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 926 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 928 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 931 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 935 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 941 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 942 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 943 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 950 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 951 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 953 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 954 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 956 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 960 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 961 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 962 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 963 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 967 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Running setscene task 970 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 971 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 972 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 978 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 980 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 986 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 989 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1000 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1004 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1009 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1011 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1013 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1017 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe clang-20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1020 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1023 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1029 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1033 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1035 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1036 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1037 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1038 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1040 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1041 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1043 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1044 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1045 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1046 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1047 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1048 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1049 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1051 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1053 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1055 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1056 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1058 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1059 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1063 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1064 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1066 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1067 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1068 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1070 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1071 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1074 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1075 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1077 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1079 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1081 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1082 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1084 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1085 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1087 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1088 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1089 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1091 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1092 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1093 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1094 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1096 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1097 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1098 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1099 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1100 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1101 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1103 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1105 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1106 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1109 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1110 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1111 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1114 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1115 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1117 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1119 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1121 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1125 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1126 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1129 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1130 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1132 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1133 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1135 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1137 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1138 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1140 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1142 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1147 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1148 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1149 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1151 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1153 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1154 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1156 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1158 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1159 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1162 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1164 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1166 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1168 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1172 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1173 of 1174 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2879 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata)
NOTE: Running task 2899 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2923 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3182 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 3183 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe waffle-1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3184 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3185 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe waffle-1.8.1-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3186 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe waffle-1.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3187 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe waffle-1.8.1-r0: task do_compile: Started
NOTE: recipe waffle-1.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3188 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_install)
NOTE: recipe waffle-1.8.1-r0: task do_install: Started
NOTE: recipe waffle-1.8.1-r0: task do_install: Succeeded
NOTE: Running task 3189 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package)
NOTE: Running task 3190 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.8.1-r0: task do_package: Started
NOTE: recipe waffle-1.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3191 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 3192 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe waffle-1.8.1-r0: task do_package: Succeeded
NOTE: Running task 3193 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 3194 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.8.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.8.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_packagedata unihash changed to 3e921db53532452da2129a0bac1cdb84250c9dee4d580d32645ce636f16243d6
NOTE: Setscene tasks completed
NOTE: Running task 3195 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_create_spdx)
NOTE: Running task 3196 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_ipk)
NOTE: Running task 3197 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_deb)
NOTE: Running task 3198 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_rpm)
NOTE: Running task 3199 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_qa)
NOTE: recipe waffle-1.8.1-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_package_write_ipk: Started
NOTE: Running task 3200 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.8.1-r0: task do_package_write_deb: Started
NOTE: Running task 3201 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_ipk unihash changed to 5ea9c9e3c84dd95fb50a376d47ba52a40ea1ca1a628cf5ed92d021c962c7dd04
NOTE: recipe waffle-1.8.1-r0: task do_package_qa: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_qa unihash changed to be5726525f73cda0aed4266e247633d986f19437300762c83879e7193a63da09
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_deb unihash changed to 82f1219772bb58ee6f1641a93d1493d7a55f7259b0167278cd78be7838072da6
NOTE: recipe waffle-1.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_rpm unihash changed to d218f76d4a0a18fd6e004758b2bc41ba88ad77f4ef1642a84bba08f2fd5e8020
NOTE: recipe mesa-demos-9.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3202 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_configure)
NOTE: Running task 3203 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe mesa-demos-9.0.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 3204 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to e2fe0028c39f3caa0ffb0c41734e7990d8005f5dbbaed3f9ef4186f85a8b7011
NOTE: Setscene tasks completed
NOTE: Running task 3205 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3206 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: Running task 3207 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3208 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_compile)
NOTE: recipe mesa-demos-9.0.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_compile: Succeeded
NOTE: Running task 3209 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_install)
NOTE: recipe mesa-demos-9.0.0-r0: task do_install: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_install: Succeeded
NOTE: Running task 3210 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package)
NOTE: Running task 3211 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_populate_sysroot)
NOTE: recipe mesa-demos-9.0.0-r0: task do_package: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_package: Succeeded
NOTE: Running task 3212 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_packagedata)
NOTE: recipe mesa-demos-9.0.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_packagedata unihash changed to e0aa4024248eb32d376550f504ae87e9eb77537a1a10a9c7757afe3774bb5faa
NOTE: Setscene tasks completed
NOTE: Running task 3213 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_create_spdx)
NOTE: Running task 3214 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_ipk)
NOTE: Running task 3215 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_deb)
NOTE: Running task 3216 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_rpm)
NOTE: Running task 3217 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_qa)
NOTE: recipe mesa-demos-9.0.0-r0: task do_create_spdx: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_deb: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_qa: Started
NOTE: recipe mesa-demos-9.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_ipk unihash changed to 3c8e967e883e953d782d83127e44f423bb1b347f80e1551ac6f20d53a211d604
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_rpm unihash changed to c6cdc3042659be9b327ee5e2fbf71b44e644f14b1e54a3f36cfa4b18084e1726
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_qa unihash changed to 0c9c2a54688fce56695fc155b050de23dacfd21f7f76dacb5012ac154e9f93a6
NOTE: recipe mesa-demos-9.0.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package_write_deb unihash changed to 9cee578d41b4b26252920e532f8ef1dcc27a42f4e76935a31b549c54d8e7ea64
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3218 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 3219 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 3220 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 3221 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 3222 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Succeeded
NOTE: Running task 3223 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_create_spdx)
NOTE: Running task 3224 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_ipk)
NOTE: Running task 3225 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_deb)
NOTE: Running task 3226 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 3227 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitr-r0: task do_create_spdx: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_ipk: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_deb: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_ipk: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_create_spdx: Succeeded
NOTE: Running task 3228 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_create_package_spdx)
NOTE: recipe piglit-1.0+gitr-r0: task do_create_package_spdx: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_deb: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa unihash changed to bb0af23f3c16319b17172443ab8d45fd120d41bb52065e8a04b707402d723757
NOTE: recipe piglit-1.0+gitr-r0: task do_create_package_spdx: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3229 of 3229 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 3229 tasks of which 3152 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 29 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgallium went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libteflon went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:25.2.1-r0 to 2:25.2.0-r0) [version-going-backwards]
ERROR: mesa-2_25.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1641392849017956209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+a0a27e528f-r0'])", added "piglit (['= 1.0+gitr0+28d1349844-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+a0a27e528f-r0'])", added "piglit-dev (['= 1.0+gitr0+28d1349844-r0'])"
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/tests/shaders/ssa/fs-if-def-else-break.shader_test", added "/usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-gt-float-float.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-02.shader_test.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-lt-float-float.shader_test /usr/lib/piglit/generated_tests/spec/a
 rb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-gt-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lt-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/b
 uilt-in-functions/fs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functi
 ons/fs-fract-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-le-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lt-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ne-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-eq-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ge-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-gt-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-vec4-vec4.shader_test /usr/lib/pigli
 t/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cross-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/executi
 on/built-in-functions/fs-op-mult-u64vec4-u64vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/aggregate-types-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec2-vec2.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/aoa-2.shader_test /usr/lib/piglit/bin/egl_ext_device_query_name /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/component-layout-vs-gs-fs.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/g
 lsl-1.30/execution/built-in-functions/fs-greaterThan-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThan-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThan-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-vec3-vec3-v
 ec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uvec2.shader_test /usr/lib
 /piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uint-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-array-types.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/component-layout-sso-vs-gs-fs-array-interleave.shader_test /usr/lib/piglit/generate
 d_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mult-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-int64_t-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-eq-floa
 t-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/buil
 t-in-functions/fs-min-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec2-uvec2.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_draw_parameters/vs-baseinstance.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functio
 ns/fs-max-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-vec3-vec3.shader_test /usr/lib/piglit/bin/egl_ext_device_persistent_id /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec3-uvec3.shader_test /usr/lib/piglit/bin/arb_spirv_extensions-post_depth_coverage-basic /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec3-i64vec3-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-fun
 ctions/fs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sinh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functio
 ns/fs-sinh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-funct
 ions/fs-op-gt-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-lt-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_
 int64/execution/built-in-functions/fs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-fu
 nctions/fs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-float-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-data-types.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/xfb/vs_two_sets_mixing_order.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl
 -1.10/execution/built-in-functions/fs-notEqual-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-vec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/simple.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-vec4-vec4-vec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-inside-ssbo.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl
 _spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program/max-length-xfb-query.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec3.shader_test /usr/lib/piglit/genera
 ted_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/uniform/atomic-uint-fs.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-eq-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-int64_t-int64_t-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-i64vec3.shader_test /usr/lib/piglit/bin/ext_image_dma_buf_import-render-rgb2
 4 /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/pixel-center-half.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-radians-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/aggr
 egate-types-name-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-vec3-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/vs-instance-id.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-eq-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ge-int64_t-
 int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-gt-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-le-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lt-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-ne-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit
 /generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-scalar.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-not-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec2-uvec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/atomic-image.shader_test /u
 sr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.40/execution/built-in-functions/fs-inverse-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-ivec2-ivec2-ivec2.shader_test /u
 sr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqual-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqual-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThanEqual-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec3-vec3.shader_test /u
 sr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-mat4x2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/all-stages-test.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec
 /arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-round-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-
 1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-reflect-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-ivec3-ivec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/basic-fs.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/
 arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/sample-shading-fs.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec3.shader_test /usr/lib/piglit/generated_tests/spec
 /arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-ivec2-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-int-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-int-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-or-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec
 /arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ge-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-le-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ne-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-fu
 nctions/fs-log2-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec2-vec2-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/ex
 ecution/shared-uint-atomic-mem-functions.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/bui
 lt-in-functions/fs-outerProduct-vec3-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec2.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/fs.shader_source /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/vs.shader_source /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/pixel-center-integer.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-cosh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/e
 xecution/built-in-functions/fs-sinh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-tanh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitor-int64_t-int64_t.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-vec3.shader_test /usr/l
 ib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-degrees-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec4-vec4.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_draw_parameters/vs-basevertex.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/
 built-in-functions/fs-mod-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_
 spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec
 /arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat3.shader_test /usr/lib/piglit/genera
 ted_tests/spec/arb_gl_spirv/glsl-1.50/execution/built-in-functions/fs-determinant-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat2-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat3-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat4-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-mat4.shader_test /usr/lib/piglit/bin/glx-multi-context-ib-2 /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/unsized-array.shader_test /usr/lib/p
 iglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-
 mat4x3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitx
 or-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uvec3-uvec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisampling-fs-1.shader_source /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisampling-fs-2.shader_source /usr/lib/piglit/tests/spec/arb_spirv_extensions/post_depth_coverage/shader_source/multisampling-fs-3.shader_source /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-dot-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-vec4-vec4.shader_test /usr/lib/piglit/gen
 erated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-complement-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-ivec4-ivec4.shader_test /usr/lib/pigl
 it/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/
 built-in-functions/fs-op-div-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-div-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/simple-geometry.shader_test /usr/lib/piglit/bin/glx-multithread-buffer-busy-tracking-bug /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec4-ivec4-ivec4.shader_test /usr
 /lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-ivec4-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec4-vec4-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitor-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/bu
 ilt-in-functions/fs-op-bitand-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitxor-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-vec3.shader_test /usr/lib/piglit/genera
 ted_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-fract-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execu
 tion/built-in-functions/fs-op-sub-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec
 /arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-and-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int6
 4/execution/built-in-functions/fs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-g
 reaterThanEqual-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/cs-basic-ssbo.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/vs-vertex-id.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ne-bool-bool.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/b
 uilt-in-functions/fs-op-lshift-ivec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-ivec4-ivec4.shader_test /usr/lib/piglit/bin/arb_spirv_extensions-post_depth_coverage-sample-shading /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-ivec4.shader_test /usr/lib/piglit/generated
 _tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-inversesqrt-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ge-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-le-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-ne-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec2-vec2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec3-vec3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-vec4-vec4-float.shader_test /usr/lib/piglit/generated_test
 s/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec3-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-outerProduct-vec2-vec4.shader_test /us
 r/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec2-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec3-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-equal-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-int-int-int.shader_te
 st /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-lessThan-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-int-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/va64/array.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-indirect.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log2-float.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/two-ssbo-differe
 nt-layouts.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sign-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/simple-types-name-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult
 -ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-clamp-float-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x3-mat4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execut
 ion/built-in-functions/fs-max3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-ivec3-ivec3-ivec3.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/storage_buffer_storage_class/array-of-arrays-inside-ssbo.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThan-vec2-vec2.shader_test /usr/lib/piglit/generated_t
 ests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitand-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/
 arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-bitxor-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x3-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-length-vec2.shader_test /usr/lib/pi
 glit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-refract-float-float-float.shader_test /usr/lib/piglit/bin/arb_spirv_extensions-post_depth_coverage-multisampling /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-neg-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-func
 tions/fs-radians-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-notEqual-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-mat4x3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/simple-types-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec3-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec4
 -mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec4-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-vec2-mat3
 x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-eq-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-mod-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/
 arb_gpu_shader_int64/execution/built-in-functions/fs-op-add-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-sub-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mod-ivec4-ivec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/origin-upper-left.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-
 min-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/tcs-patch-vertices-in.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-sign-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/sp
 ec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-roundEven-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-ivec2-ivec2.shader_test /usr/lib/piglit/bin/depth_clamp_quirks /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-equal-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-not-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-not-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/g
 lsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-not-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-all-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-any-bvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution
 /built-in-functions/fs-op-add-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-add-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-abs-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions
 /fs-cos-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-vec3-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/va64/simple.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-i
 n-functions/fs-smoothstep-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-smoothstep-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-large-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat2x4-mat2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x4-mat3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-max-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_
 gl_spirv/glsl-1.10/execution/built-in-functions/fs-min-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mod-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-pow-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-eq-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-float-float-bool.shader_test /usr/l
 ib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-sub-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-float-float-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/function-call-glslang-issue-1285.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-ge-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-le-uint-uint.shader_test /usr/lib/piglit/generated_tests/
 spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-ne-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitor-int-int.shader_test /usr/lib/piglit/tests/spec/arb_spirv_extensions/execution/shader_draw_parameters/vs-drawid.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-vec3-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/block.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-01.shader_test /usr/lib/piglit/tests/s
 pec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-02.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-03.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-04.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-05.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-06.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/glsl-fs-textureLod-mipmap-const-lod-07.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-sub-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/exe
 cution/built-in-functions/fs-op-div-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-step-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/exec
 ution/built-in-functions/fs-transpose-mat3x4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/array_of_input_output_block.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-max-uint64_t-uint64_t.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program/max-length-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-faceforward-vec2-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sin-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-tan-vec2.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-01.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-03.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2
 d-mipmap-const-bias-04.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/glsl-fs-texture2d-mipmap-const-bias-05.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-sign-int.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/component-layout-vs-gs-fs-double.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-trunc-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-div-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execu
 tion/built-in-functions/fs-op-div-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/origin-lower-left.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/xfb/gs_two_invocations.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat3x2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-op-mult-mat4x2-float.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/ubo-nested-structs-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-floor-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.1
 0/execution/built-in-functions/fs-mix-vec3-vec3-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program/other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-greaterThanEqual-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-greaterThanEqual-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp2-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-acos-vec4.shader_
 test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-asin-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat2.shader_test /usr/lib/piglit/bin/arb_gl_spirv-sample-position /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThan-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-ivec3-ivec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/atomic-counter-other-queries.shad
 er_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-mult-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-mix-vec3-vec3-bvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-atan-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-ceil-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.
 10/execution/built-in-functions/fs-sqrt-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-sqrt-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitand-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-bitxor-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uvec2-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uvec4-uvec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execut
 ion/built-in-functions/fs-clamp-uvec3-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-mix-vec4-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec4-i64vec4-bvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-neg-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execut
 ion/built-in-functions/fs-atanh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-acosh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-asinh-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-atanh-vec2.shader_test /usr/lib/piglit/generated_te
 sts/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-ivec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-max-ivec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-mat4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec2-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mult-vec3-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/
 glsl-1.10/execution/built-in-functions/fs-op-mult-vec4-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-min-int64_t-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-vec2-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-vec4-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec2-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec3-i64vec3-i64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-clamp-i64vec4-i64vec4-i64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-mul
 t-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-min-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-lessThanEqual-vec3-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-notEqual-ivec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-abs-int64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.20/execution/built-in-functions/fs-transpose-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-distance-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-vec2.shader_
 test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/xfb-simple-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-cos-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec3.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/simple-function.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-exp-vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-abs-vec3.shader_test /usr/lib/p
 iglit/tests/spec/arb_gl_spirv/execution/sso-block-member-layout-location.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/linker/simple-function-call.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-lshift-uint-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-rshift-uint-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-normalize-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-xor-bool-bool.shader_test /usr/lib/piglit/bin/arb_fragment_program-recompile /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-op-div-float-float.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-clamp-int-int-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv
 /glsl-1.30/execution/built-in-functions/fs-roundEven-vec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/ubo-matrices-other-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-max3-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-mid3-uint-uint-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/amd_shader_trinary_minmax/execution/built-in-functions/fs-min3-uint-uint-uint.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/queries/program-interface/xfb-name-queries.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_
 gl_spirv/glsl-1.30/execution/built-in-functions/fs-op-add-uvec4-uvec4.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/varying/mat/mat-arb.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/arb_gpu_shader_int64/execution/built-in-functions/fs-mix-i64vec2-i64vec2-bvec2.shader_test /usr/lib/piglit/tests/spec/arb_gl_spirv/execution/unordered-comparison.shader_test /usr/lib/piglit/generated_tests/spec/arb_gl_spirv/glsl-1.10/execution/built-in-functions/fs-log-vec4.shader_test"
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+a0a27e528f to 1.0+gitr0+28d1349844

--===============1641392849017956209==--

