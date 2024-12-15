Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4D6C3DA4A
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.33379.1734254979285525428
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UFBgq1JM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=h/vSE1Gj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010193c9a704a4-788adcd4-65ea-4277-9e34-477dcbd9bb0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254986;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PFZWzZutSO1LHxT9FP+NsgSk4NnsHF7pguIla6aQ214=;
	b=UFBgq1JMMWDbMm2Iv9j1Zp+GfYW89eZXzIVFoI0UIKTvg4l19vMFcB42AwHtFI69
	YwrPdIwE/Iwvxdy6jqH1VU2kzrq82WqT1PgMidxXxGg9LGQTANihJ/jdttsSxPR25ha
	Ic5Dhi4koNtmEG9YohxxD0/1uHbFjnjhEfVjER6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254986;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PFZWzZutSO1LHxT9FP+NsgSk4NnsHF7pguIla6aQ214=;
	b=h/vSE1GjT/F/5CaLnY74WP/Gc8CHU0OnvkPrm2CrQNrk2VCiEUFnHkVaVeBy9B2C
	ELSP59TnBxm8xSvI+lNyI0mPwypUlwefsb0aUQ/L44ANY4OqHcMHJKf0k9z9SNZTFg/
	ljO81PELAd0KElY2LIYMsfZHUmmKwKBOQp9Ewg70=
Content-Type: multipart/mixed; boundary="===============0995798883764991292=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 00affcf3a78a1200cc8fb1e5264c19ac1f8f0fa2
 SUCCEEDED
Message-ID: <01010193c9a704a4-788adcd4-65ea-4277-9e34-477dcbd9bb0f-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208730

--===============0995798883764991292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *00affcf3a78a1200cc8fb1e5264c19ac1f8f0fa2* has Succeeded.

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
From 88faa24a660d00c7352f0c4994bc78e574d1ede8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 08:23:20 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...Lists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 2 +-
 ...0001-tests-Fix-narrowing-errors-seen-with-clang.patch | 2 +-
 ...-egl-spec-make-egl_ext_surface_compression-cond.patch | 9 +++------
 ...-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb               | 2 +-
 6 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 0c872d3e9b..71f79af245 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 2af98d67e16e083c36e3193aefbda942399a455a Mon Sep 17 00:00:00 2001
+From 592779bf69726e4c268823af1291ded282e8665f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index cfdfeb683e..2c91ee8031 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 70f8d56bf9db9d85f3d197ab9de972e3a514514c Mon Sep 17 00:00:00 2001
+From 1bc6ae4b29e103285bea1c8424af5356cedb6ebd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index 69cc302912..9cd6c70a30 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From 0c97d5eacae4f584313c9251e585bb0246cceffc Mon Sep 17 00:00:00 2001
+From 1bee1b238eb6e7dcc4abc1bf6c96bec7bcba2401 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
-index d9540bcfde27..01a70164f444 100644
+index d9540bcfd..01a70164f 100644
 --- a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
 +++ b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
 @@ -2,10 +2,12 @@ link_libraries(
@@ -39,7 +39,7 @@ index d9540bcfde27..01a70164f444 100644
  
  # vim: ft=cmake:
 diff --git a/tests/egl/spec/egl_ext_surface_compression/create_surface.c b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
-index e3d55d4331fb..35f13fd007b4 100644
+index e3d55d433..35f13fd00 100644
 --- a/tests/egl/spec/egl_ext_surface_compression/create_surface.c
 +++ b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
 @@ -25,7 +25,6 @@
@@ -50,6 +50,3 @@ index e3d55d4331fb..35f13fd007b4 100644
  #include "../../egl-wayland.h"
  
  static enum piglit_result
--- 
-2.39.5
-
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 17bcbce190..1a1ea016ce 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 9b2c2213a2d7aaea350649ee031e227b44343428 Mon Sep 17 00:00:00 2001
+From 5c0ddc9c471254f5ba9197ee86808696b50f4587 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 767e93c43e..153d7614e7 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 3d621cf028acb3b464759abb72a38102844079b2 Mon Sep 17 00:00:00 2001
+From 966a90c1403b696b5c84fef1345cd3490a6c810a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3e950ff61c..829cb7730f 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "d04d6fff00849a2a8e29ef3251c6ca04a2f68dc7"
+SRCREV = "00affcf3a78a1200cc8fb1e5264c19ac1f8f0fa2"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.44.1


--===============0995798883764991292==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA4OGZhYTI0YTY2MGQwMGM3MzUyZjBjNDk5NGJjNzhlNTc0ZDFlZGU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDg6MjM6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIC4uLkxpc3RzLnR4dC1kby1u
b3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIHwgMiArLQogLi4uMDAwMS10
ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2ggfCAyICstCiAu
Li4tZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaCB8
IDkgKysrLS0tLS0tCiAuLi4tY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12
YXJpYWJsZS5wYXRjaCB8IDIgKy0KIC4uLi11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFy
ZGNvZGUtYnVpbGQtcGF0LnBhdGNoIHwgMiArLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXRfZ2l0LmJiICAgICAgICAgICAgICAgfCAyICstCiA2IGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWlu
LXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Bp
Z2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nh
bm5lci1wYXRoLWZyLnBhdGNoCmluZGV4IDBjODcyZDNlOWIuLjcxZjc5YWYyNDUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VMaXN0cy50
eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5v
dC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDJhZjk4ZDY3ZTE2ZTA4M2MzNmUzMTkzYWVmYmRhOTQyMzk5YTQ1NWEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDU5Mjc3OWJmNjk3MjZlNGMyNjg4MjNhZjEyOTFkZWQyODJlODY2
NWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eEBsaW51dHJvbml4LmRlPgogRGF0ZTogRnJpLCAyMyBBdWcgMjAyNCAxNToyOTo0NSArMDIwMAog
U3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDogZG8gbm90IG9idGFpbiB3YXlsYW5kLXNj
YW5uZXIgcGF0aCBmcm9tCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4
LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNoCmluZGV4IGNmZGZlYjY4M2Uu
LjJjOTFlZTgwMzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4
LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA3MGY4ZDU2YmY5ZGI5ZDg1ZjNkMTk3YWI5ZGU5NzJlM2E1MTQ1MTRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAxYmM2YWU0YjI5ZTEwMzI4NWJlYTFjODQyNGFmNTM1NmNlZGI2
ZWJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KIERhdGU6IFdlZCwgMyBNYXkgMjAyMyAyMTo1OTo0MyAtMDcwMAogU3ViamVjdDog
W1BBVENIXSB0ZXN0czogRml4IG5hcnJvd2luZyBlcnJvcnMgc2VlbiB3aXRoIGNsYW5nCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVn
bC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uLWNvbmQucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2Ut
ZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uLWNvbmQucGF0Y2gKaW5kZXggNjljYzMwMjkxMi4u
OWNkNmM3MGEzMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1j
b25kLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEt
dGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGM5N2Q1ZWFjYWU0ZjU4NDMxM2M5MjUxZTU4NWJiMDI0
NmNjZWZmYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWJlZTFiMjM4ZWI2ZTdkY2M0
YWJjMWJmNmM5NmJlYzdiY2JhMjQwMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDIyIE5vdiAy
MDI0IDIyOjUyOjMxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL2VnbC9zcGVjOiBtYWtl
IGVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbiBjb25kaXRpb25hbApAQCAtMjAsNyArMjAsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgog
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZm
IC0tZ2l0IGEvdGVzdHMvZWdsL3NwZWMvZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uL0NNYWtl
TGlzdHMuZ2xlczMudHh0IGIvdGVzdHMvZWdsL3NwZWMvZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNz
aW9uL0NNYWtlTGlzdHMuZ2xlczMudHh0Ci1pbmRleCBkOTU0MGJjZmRlMjcuLjAxYTcwMTY0ZjQ0
NCAxMDA2NDQKK2luZGV4IGQ5NTQwYmNmZC4uMDFhNzAxNjRmIDEwMDY0NAogLS0tIGEvdGVzdHMv
ZWdsL3NwZWMvZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uL0NNYWtlTGlzdHMuZ2xlczMudHh0
CiArKysgYi90ZXN0cy9lZ2wvc3BlYy9lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24vQ01ha2VM
aXN0cy5nbGVzMy50eHQKIEBAIC0yLDEwICsyLDEyIEBAIGxpbmtfbGlicmFyaWVzKApAQCAtMzks
NyArMzksNyBAQCBpbmRleCBkOTU0MGJjZmRlMjcuLjAxYTcwMTY0ZjQ0NCAxMDA2NDQKICAKICAj
IHZpbTogZnQ9Y21ha2U6CiBkaWZmIC0tZ2l0IGEvdGVzdHMvZWdsL3NwZWMvZWdsX2V4dF9zdXJm
YWNlX2NvbXByZXNzaW9uL2NyZWF0ZV9zdXJmYWNlLmMgYi90ZXN0cy9lZ2wvc3BlYy9lZ2xfZXh0
X3N1cmZhY2VfY29tcHJlc3Npb24vY3JlYXRlX3N1cmZhY2UuYwotaW5kZXggZTNkNTVkNDMzMWZi
Li4zNWYxM2ZkMDA3YjQgMTAwNjQ0CitpbmRleCBlM2Q1NWQ0MzMuLjM1ZjEzZmQwMCAxMDA2NDQK
IC0tLSBhL3Rlc3RzL2VnbC9zcGVjL2VnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi9jcmVhdGVf
c3VyZmFjZS5jCiArKysgYi90ZXN0cy9lZ2wvc3BlYy9lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Np
b24vY3JlYXRlX3N1cmZhY2UuYwogQEAgLTI1LDcgKzI1LDYgQEAKQEAgLTUwLDYgKzUwLDMgQEAg
aW5kZXggZTNkNTVkNDMzMWZiLi4zNWYxM2ZkMDA3YjQgMTAwNjQ0CiAgI2luY2x1ZGUgIi4uLy4u
L2VnbC13YXlsYW5kLmgiCiAgCiAgc3RhdGljIGVudW0gcGlnbGl0X3Jlc3VsdAotLS0gCi0yLjM5
LjUKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAw
Mi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVy
LVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoCmluZGV4IDE3YmNiY2UxOTAuLjFh
MWVhMDE2Y2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0
LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVz
ZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDliMmMyMjEzYTJkN2FhZWEzNTA2NDllZTAzMWUyMjdiNDQzNDM0MjggTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDVjMGRkYzljNDcxMjU0ZjViYTkxOTdlZTg2ODA4Njk2
YjUwZjQ1ODcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXNjYWwgQmFjaCA8cGFz
Y2FsLmJhY2hAc2llbWVucy5jb20+CiBEYXRlOiBUaHUsIDQgT2N0IDIwMTggMTQ6NDM6MTcgKzAy
MDAKIFN1YmplY3Q6IFtQQVRDSF0gY21ha2U6IHVzZSBwcm9wZXIgV0FZTEFORF9JTkNMVURFX0RJ
UlMgdmFyaWFibGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxk
LXBhdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVz
dHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaApp
bmRleCA3NjdlOTNjNDNlLi4xNTNkNzYxNGU3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5v
dC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Bp
Z2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNv
ZGUtYnVpbGQtcGF0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzZDYyMWNmMDI4YWNiM2I0
NjQ3NTlhYmI3MmEzODEwMjg0NDA3OWIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5
NjZhOTBjMTQwM2I2OTZiNWM4NGZlZjEzNDVjZDM0OTBhNmM4MTBhIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CiBEYXRlOiBUdWUsIDEwIE5vdiAyMDIwIDE3OjEzOjUwICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHRlc3RzL3V0aWwvcGlnbGl0LXNoYWRlci5jOiBkbyBub3QgaGFyZGNvZGUgYnVpbGQgcGF0aCBp
bnRvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKaW5kZXggM2U5
NTBmZjYxYy4uODI5Y2I3NzMwZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Bp
Z2xpdC9waWdsaXRfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0X2dpdC5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvbWVzYS9waWdsaXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYQogICAg
ICAgICAgICAiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKLVNSQ1JFViA9ICJkMDRk
NmZmZjAwODQ5YTJhOGUyOWVmMzI1MWM2Y2EwNGEyZjY4ZGM3IgorU1JDUkVWID0gIjAwYWZmY2Yz
YTc4YTEyMDBjYzhmYjFlNTI2NGMxOWFjMWY4ZjBmYTIiCiAjICh3aGVuIFBWIGdvZXMgYWJvdmUg
MS4wIHJlbW92ZSB0aGUgdHJhaWxpbmcgcikKIFBWID0gIjEuMCtnaXRyIgogCi0tIAoyLjQ0LjEK
Cg==

--===============0995798883764991292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit (['= 1.0+gitr0+00affcf3a7-r0'])"
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit-dev (['= 1.0+gitr0+00affcf3a7-r0'])"
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-overflow.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage_alpha-to-one_write-z.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-trivial.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction-2.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage.shader_test /usr/lib/piglit/bin/ext_image_dma_buf_import-tex-modifier /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-one.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage_alpha-to-one.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/linker/global-const-initializer.shader_test"
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2082641954 to 2082665033 (+0%)

--===============0995798883764991292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f8865c227e768dd680c9ce89094d4ef8754f9ff2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 442 Local 431 Mirrors 0 Missed 11 Current 571 (97% match, 98% complete)
Removing 10 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2146 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 2780 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2781 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 2782 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 2783 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 2784 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2785 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2786 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2787 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 1e1e200888113b8514d6004d68242ecb4d7375231d369c328dccca02b046218b
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Running task 2788 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 2789 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 2790 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2791 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot unihash changed to b82913ced35c224be099f1c2046575774f81e91be27ec5c83ea48583beb4ef33
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 2792 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2792 tasks of which 2778 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241215081023.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241215081023.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.2020311
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+00affcf3a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.2020311
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============0995798883764991292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit (['= 1.0+gitr0+00affcf3a7-r0'])"
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit-dev (['= 1.0+gitr0+00affcf3a7-r0'])"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+00affcf3a7
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction-2.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-overflow.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage_alpha-to-one_write-z.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-trivial.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage.shader_test /usr/lib/piglit/bin/ext_image_dma_buf_import-tex-modifier /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-one.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/linker/global-const-initializer.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction.shader_test /usr/lib/piglit/tests/spec/arb_framebuffer_object/execution/msaa-alpha-to-coverage_alpha-to-one.shader_test"

--===============0995798883764991292==--

