Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E21C61DB2
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11023.1747312302710782673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MCY+E8uu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=b74q71lX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010196d3ee3409-c24e6713-3727-49f4-a71f-a7d38874c2c3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312326;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rQpR+EM1+VlqhaxWZOq+OChDZGcEsRDqKwwiNcgKRjw=;
	b=MCY+E8uu0nwJHWdWHqL6fDHzbJvAhRki038vh9ARMe3sD9MHr7efFphe2oRjGVKt
	0FvkitP0T9XVF0dDc/ZBcCNWWQljUQck4GqxUBVUqPnCrZUfBjKGX1oqWLflDCexZvg
	3NpY6GRub2CwXIIiZHDuiNi9HBypEYn3hxufCx+8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312326;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rQpR+EM1+VlqhaxWZOq+OChDZGcEsRDqKwwiNcgKRjw=;
	b=b74q71lX1gUJKsxsoLnViaPWQNDnf9xli3Lak1IBvEVASw0mfcE9x7hyvQp2Njtg
	M6PXRr3xIRek8uvukujjxdxH7Lgv9mBLl2Bw7RU59Pwxrk9kXPnyFLx/FoKzpinnClw
	3C2TcPWG8stTJKxJsLNQ0uqFXfoVeJfo4ahwajxk=
Content-Type: multipart/mixed; boundary="===============2479443434112586050=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 1767af745ed96f77b16c0c205015366d1fbbdb22
 SUCCEEDED
Message-ID: <01010196d3ee3409-c24e6713-3727-49f4-a71f-a7d38874c2c3-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216652

--===============2479443434112586050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *1767af745ed96f77b16c0c205015366d1fbbdb22* has Succeeded.

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
From b65dafa161bd6cceaecbbc13cd67b8468005d87d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 10:57:06 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 4 ++--
 .../0001-tests-Fix-narrowing-errors-seen-with-clang.patch     | 2 +-
 ...tests-egl-spec-make-egl_ext_surface_compression-cond.patch | 2 +-
 .../0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                    | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 6ce2348a71..98bcd35fa8 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 9ffd24add3263e24975318e693309881eadd99a2 Mon Sep 17 00:00:00 2001
+From e19b5ad488d58d3d532468800555fbb6f1504025 Mon Sep 17 00:00:00 2001
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
index 9751b20673..c40d7b21cf 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 0ba2f908f2a2a897e8e06e34f99893d11ee4734c Mon Sep 17 00:00:00 2001
+From 2935d021bc5dfe918710da531abfd031f9afff7c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index c6c072c7e0..5328233298 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From d6ed4c477f22309c09accd4fee68486d7714f205 Mon Sep 17 00:00:00 2001
+From 79458c71c917b16b2676072a9a16e94821a41bdc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 6cb561c3f2..038eb46725 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From deb0c15890fb9d0f4fc7074dde2a51c89cb5bf6d Mon Sep 17 00:00:00 2001
+From 41c25059286c1b6ba116fdeaf3be1e8dfb983587 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 7706d88086..447bc17c38 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 66d1d86ff8be33df265d0dda717be385fe8637cd Mon Sep 17 00:00:00 2001
+From ec0e06894d086280c747c002408bf84facd32cc9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e30efdf33b..c15258972d 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "05f02cb2ff1787892cba38c3b609f892419bae87"
+SRCREV = "1767af745ed96f77b16c0c205015366d1fbbdb22"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.1


--===============2479443434112586050==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBiNjVkYWZhMTYxYmQ2Y2NlYWVjYmJjMTNjZDY3Yjg0NjgwMDVkODdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMTA6NTc6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIC4uLkNNYWtlTGlzdHMudHh0
LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2ggfCA0ICsrLS0KIC4u
Li8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRjaCAg
ICAgfCAyICstCiAuLi50ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVz
c2lvbi1jb25kLnBhdGNoIHwgMiArLQogLi4uLzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5E
X0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaCB8IDIgKy0KIC4uLnRlc3RzLXV0aWwtcGlnbGl0
LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2ggfCAyICstCiBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIgICAgICAgICAgICAgICAgICAgIHwg
MiArLQogNiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFr
ZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1k
by1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoCmluZGV4IDZjZTIzNDhh
NzEuLjk4YmNkMzVmYTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQv
cGlnbGl0LzAwMDEtQ01ha2VMaXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXIt
cGF0aC1mci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8w
MDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlmZmQyNGFkZDMyNjNlMjQ5NzUzMThlNjkzMzA5
ODgxZWFkZDk5YTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUxOWI1YWQ0ODhkNThk
M2Q1MzI0Njg4MDA1NTVmYmI2ZjE1MDQwMjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogRnJpLCAyMyBB
dWcgMjAyNCAxNToyOTo0NSArMDIwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDog
ZG8gbm90IG9idGFpbiB3YXlsYW5kLXNjYW5uZXIgcGF0aCBmcm9tCkBAIC0xNyw3ICsxNyw3IEBA
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXggOTlhZTA3YTRhLi5k
NWVlOWNjMjIgMTAwNjQ0CitpbmRleCAxNDdiZDhlMTcuLmZmYzkxMDM1NCAxMDA2NDQKIC0tLSBh
L0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTIxMSwxMSArMjExLDcg
QEAgaWYoUElHTElUX1VTRV9XQVlMQU5EKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdp
dGgtY2xhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAx
LXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRjaAppbmRleCA5
NzUxYjIwNjczLi5jNDBkN2IyMWNmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1j
bGFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAx
LXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMGJhMmY5MDhmMmEyYTg5N2U4ZTA2ZTM0Zjk5ODkzZDExZWU0NzM0YyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjkzNWQwMjFiYzVkZmU5MTg3MTBkYTUzMWFi
ZmQwMzFmOWFmZmY3YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDMgTWF5IDIwMjMgMjE6NTk6NDMgLTA3MDAK
IFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IEZpeCBuYXJyb3dpbmcgZXJyb3JzIHNlZW4gd2l0aCBj
bGFuZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAw
MS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1lZ2wt
c3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNoCmluZGV4IGM2
YzA3MmM3ZTAuLjUzMjgyMzMyOTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9w
aWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29t
cHJlc3Npb24tY29uZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9u
LWNvbmQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ2ZWQ0YzQ3N2YyMjMwOWMwOWFjY2Q0
ZmVlNjg0ODZkNzcxNGYyMDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc5NDU4Yzcx
YzkxN2IxNmIyNjc2MDcyYTlhMTZlOTQ4MjFhNDFiZGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogRnJp
LCAyMiBOb3YgMjAyNCAyMjo1MjozMSArMDEwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy9lZ2wv
c3BlYzogbWFrZSBlZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24gY29uZGl0aW9uYWwKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2UtdXNl
LXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lO
Q0xVREVfRElSUy12YXJpYWJsZS5wYXRjaAppbmRleCA2Y2I1NjFjM2YyLi4wMzhlYjQ2NzI1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtl
LXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdB
WUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBk
ZWIwYzE1ODkwZmI5ZDBmNGZjNzA3NGRkZTJhNTFjODljYjViZjZkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA0MWMyNTA1OTI4NmMxYjZiYTExNmZkZWFmM2JlMWU4ZGZiOTgzNTg3IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGFzY2FsIEJhY2ggPHBhc2NhbC5iYWNoQHNp
ZW1lbnMuY29tPgogRGF0ZTogVGh1LCA0IE9jdCAyMDE4IDE0OjQzOjE3ICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIGNtYWtlOiB1c2UgcHJvcGVyIFdBWUxBTkRfSU5DTFVERV9ESVJTIHZhcmlhYmxl
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRl
c3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGln
bGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gKaW5kZXggNzcwNmQ4
ODA4Ni4uNDQ3YmMxN2MzOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUt
YnVpbGQtcGF0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0
LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBh
dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjZkMWQ4NmZmOGJlMzNkZjI2NWQwZGRhNzE3
YmUzODVmZTg2MzdjZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZWMwZTA2ODk0ZDA4
NjI4MGM3NDdjMDAyNDA4YmY4NGZhY2QzMmNjOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVl
LCAxMCBOb3YgMjAyMCAxNzoxMzo1MCArMDAwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy91dGls
L3BpZ2xpdC1zaGFkZXIuYzogZG8gbm90IGhhcmRjb2RlIGJ1aWxkIHBhdGggaW50bwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCmluZGV4IGUzMGVmZGYzM2IuLmMx
NTI1ODk3MmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0
X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIK
QEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWEKICAgICAgICAgICAgIgog
VVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgogCi1TUkNSRVYgPSAiMDVmMDJjYjJmZjE3ODc4
OTJjYmEzOGMzYjYwOWY4OTI0MTliYWU4NyIKK1NSQ1JFViA9ICIxNzY3YWY3NDVlZDk2Zjc3YjE2
YzBjMjA1MDE1MzY2ZDFmYmJkYjIyIgogIyAod2hlbiBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUg
dGhlIHRyYWlsaW5nIHIpCiBQViA9ICIxLjArZ2l0ciIKIAotLSAKMi40Ny4xCgo=

--===============2479443434112586050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2054299752 to 2054346044 (+0%)
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/mesa-bug11100-fs /usr/lib/piglit/tests/spec/arb_shading_language_420pack/linker/instance-matching-uniform-blocks-binding-qualifier-mismatch-2.shader_test /usr/lib/piglit/tests/spec/ext_shader_clock/execution/clock2x32.shader_test /usr/lib/piglit/bin/push-pop-color-material /usr/lib/piglit/bin/mesa-bug11100-cs"

--===============2479443434112586050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/arb_shading_language_420pack/linker/instance-matching-uniform-blocks-binding-qualifier-mismatch-2.shader_test /usr/lib/piglit/tests/spec/ext_shader_clock/execution/clock2x32.shader_test /usr/lib/piglit/bin/mesa-bug11100-fs /usr/lib/piglit/bin/push-pop-color-material /usr/lib/piglit/bin/mesa-bug11100-cs"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+05f02cb2ff to 1.0+gitr0+1767af745e

--===============2479443434112586050==--

