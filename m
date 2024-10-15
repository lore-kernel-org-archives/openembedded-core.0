Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6B7D1F9D1
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.11800.1728994554615421866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ck8dpTPH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GpEXqbrZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010192901b6745-af10b3b9-2da7-4796-83e9-48e391f1435e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994568;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XpnddhXscBVG4iPP4nD6VfNk6D1kzlkRomlQ2H5CX/8=;
	b=Ck8dpTPHAsB1JUMlRSz7BKT1RjPM7qYce38cW7CV1O960YanDoN4YUOhxA3Xw5NS
	ZwNtPCz+YYVxjhHF/pTz7o+KDptOOAbEHOlVG5ZIT4eWZEai3+AV8sLztUeVsie5in6
	3J24IdT6aFrR30qbZegmiR8gudYbrVjjen8zyJzI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994568;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XpnddhXscBVG4iPP4nD6VfNk6D1kzlkRomlQ2H5CX/8=;
	b=GpEXqbrZjChebEJinoGPewHTd0OkpDjzuUzKp+8UnamZ1eLf7jrQiOtLdgz9Bnet
	oAyl8vmo8Eg/W3oSiPUa1e9cMb8lhVkGN7zLrCtzqHEmPzXKx7bscNQMK6ACD8uLCTd
	qfImh8ESpbSfFSyVGrdnOW+gYYJnPnaWIu5lDkLQ=
Content-Type: multipart/mixed; boundary="===============6645197333106708025=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 7ce69da1199d12ed0ddaa251ed489750523798fb
 SUCCEEDED
Message-ID: <01010192901b6745-af10b3b9-2da7-4796-83e9-48e391f1435e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205880

--===============6645197333106708025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *7ce69da1199d12ed0ddaa251ed489750523798fb* has Succeeded.

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
From 3349d078ba02154e0d8388f8d7b1203ede2085e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 11:02:02 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...keLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 7 ++-----
 .../0001-tests-Fix-narrowing-errors-seen-with-clang.patch  | 2 +-
 ...02-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...ts-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                 | 2 +-
 5 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index b47e16af6b..0ce7dc6d99 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 8f25cdf54e35ab1a174cabf5078784b8e48bda01 Mon Sep 17 00:00:00 2001
+From d8f79e23b2c01acad39fa04ac9c283c20bb37e3d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d169fb481..8394f5236 100644
+index 73750f67e..8018a1bb7 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
@@ -33,6 +33,3 @@ index d169fb481..8394f5236 100644
  	add_executable(WaylandScannerExe IMPORTED)
  	set_property(TARGET WaylandScannerExe PROPERTY IMPORTED_LOCATION ${WaylandScannerPath})
  endif()
--- 
-2.39.2
-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 08e709b1d0..673fd0b18f 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 77f327909e4a99c64261290cd76e234e10cc64d2 Mon Sep 17 00:00:00 2001
+From 77f9ab910590791a9bc911f50bdee8fd7125d8e2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 70bb55053d..18e6b874d8 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From cb8e4b99fcfe81399e3e6d922156db4a48a39a8e Mon Sep 17 00:00:00 2001
+From 373d0d3cebd30b99189436d3fe4fd30190e2b4fc Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index ce5cbd3ea9..9025b6768f 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 7d2d23125f1946a7b74f9a427388d469500fcd8d Mon Sep 17 00:00:00 2001
+From 4bc9d8bd2ef688651bb172811640333ed9fc285d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index fbf20de176..078f24ff4f 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "c11c9374c1448d01b31e7f724921cc1f4ee2c84c"
+SRCREV = "7ce69da1199d12ed0ddaa251ed489750523798fb"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.44.1


--===============6645197333106708025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+c11c9374c1-r0'])", added "piglit (['= 1.0+gitr0+7ce69da119-r0'])"
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+c11c9374c1-r0'])", added "piglit-dev (['= 1.0+gitr0+7ce69da119-r0'])"
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/bin/glsl-compile-time /usr/lib/piglit/bin/vertexrate", added "/usr/lib/piglit/bin/shader-io-rate /usr/lib/piglit/bin/ext_texture_storage_compression-tex-storage /usr/lib/piglit/tests/spec/arb_bindless_texture/execution/samplers/basic-texture2D-local-var-function-params.shader_test /usr/lib/piglit/tests/cl/program/build/include_test.h /usr/lib/piglit/tests/spec/glsl-1.50/linker/overloads-linking.shader_test /usr/lib/piglit/tests/spec/arb_gpu_shader5/execution/built-in-functions/fs-bitfieldInsert-of-and.shader_test /usr/lib/piglit/bin/egl_ext_surface_compression-query /usr/lib/piglit/bin/egl_ext_surface_compression-image /usr/lib/piglit/tests/spec/glsl-1.10/linker/function-match-implicit-params.shader_test /usr/lib/piglit/bin/egl_ext_surface_compression-create"

--===============6645197333106708025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+c11c9374c1-r0'])", added "piglit (['= 1.0+gitr0+7ce69da119-r0'])"
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+c11c9374c1-r0'])", added "piglit-dev (['= 1.0+gitr0+7ce69da119-r0'])"
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+c11c9374c1 to 1.0+gitr0+7ce69da119
packages/core2-64-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/bin/vertexrate /usr/lib/piglit/bin/glsl-compile-time", added "/usr/lib/piglit/bin/ext_texture_storage_compression-tex-storage /usr/lib/piglit/tests/spec/glsl-1.10/linker/function-match-implicit-params.shader_test /usr/lib/piglit/bin/egl_ext_surface_compression-create /usr/lib/piglit/bin/egl_ext_surface_compression-query /usr/lib/piglit/tests/spec/arb_bindless_texture/execution/samplers/basic-texture2D-local-var-function-params.shader_test /usr/lib/piglit/tests/cl/program/build/include_test.h /usr/lib/piglit/bin/egl_ext_surface_compression-image /usr/lib/piglit/tests/spec/arb_gpu_shader5/execution/built-in-functions/fs-bitfieldInsert-of-and.shader_test /usr/lib/piglit/tests/spec/glsl-1.50/linker/overloads-linking.shader_test /usr/lib/piglit/bin/shader-io-rate"
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2053881798 to 2054023625 (+0%)

--===============6645197333106708025==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSAzMzQ5ZDA3OGJhMDIxNTRlMGQ4Mzg4ZjhkN2IxMjAzZWRlMjA4NWU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMTE6MDI6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIC4uLmtlTGlzdHMudHh0LWRv
LW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2ggfCA3ICsrLS0tLS0KIC4u
Li8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRjaCAg
fCAyICstCiAuLi4wMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlh
YmxlLnBhdGNoIHwgMiArLQogLi4udHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRj
b2RlLWJ1aWxkLXBhdC5wYXRjaCB8IDIgKy0KIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQv
cGlnbGl0X2dpdC5iYiAgICAgICAgICAgICAgICAgfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4t
d2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGln
bGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2Fu
bmVyLXBhdGgtZnIucGF0Y2gKaW5kZXggYjQ3ZTE2YWY2Yi4uMGNlN2RjNmQ5OSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4
dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VMaXN0cy50eHQtZG8tbm90
LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gOGYyNWNkZjU0ZTM1YWIxYTE3NGNhYmY1MDc4Nzg0YjhlNDhiZGEwMSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZDhmNzllMjNiMmMwMWFjYWQzOWZhMDRhYzljMjgzYzIwYmIzN2Uz
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDIzIEF1ZyAyMDI0IDE1OjI5OjQ1ICswMjAwCiBT
dWJqZWN0OiBbUEFUQ0hdIENNYWtlTGlzdHMudHh0OiBkbyBub3Qgb2J0YWluIHdheWxhbmQtc2Nh
bm5lciBwYXRoIGZyb20KQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NN
YWtlTGlzdHMudHh0Ci1pbmRleCBkMTY5ZmI0ODEuLjgzOTRmNTIzNiAxMDA2NDQKK2luZGV4IDcz
NzUwZjY3ZS4uODAxOGExYmI3IDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NN
YWtlTGlzdHMudHh0CiBAQCAtMjExLDExICsyMTEsNyBAQCBpZihQSUdMSVRfVVNFX1dBWUxBTkQp
CkBAIC0zMyw2ICszMywzIEBAIGluZGV4IGQxNjlmYjQ4MS4uODM5NGY1MjM2IDEwMDY0NAogIAlh
ZGRfZXhlY3V0YWJsZShXYXlsYW5kU2Nhbm5lckV4ZSBJTVBPUlRFRCkKICAJc2V0X3Byb3BlcnR5
KFRBUkdFVCBXYXlsYW5kU2Nhbm5lckV4ZSBQUk9QRVJUWSBJTVBPUlRFRF9MT0NBVElPTiAke1dh
eWxhbmRTY2FubmVyUGF0aH0pCiAgZW5kaWYoKQotLS0gCi0yLjM5LjIKLQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1GaXgtbmFycm93
aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1j
bGFuZy5wYXRjaAppbmRleCAwOGU3MDliMWQwLi42NzNmZDBiMThmIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmct
ZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1j
bGFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzdmMzI3OTA5ZTRhOTljNjQyNjEyOTBj
ZDc2ZTIzNGUxMGNjNjRkMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzdmOWFiOTEw
NTkwNzkxYTliYzkxMWY1MGJkZWU4ZmQ3MTI1ZDhlMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDMgTWF5IDIw
MjMgMjE6NTk6NDMgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IEZpeCBuYXJyb3dpbmcg
ZXJyb3JzIHNlZW4gd2l0aCBjbGFuZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJT
LXZhcmlhYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAw
Mi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoCmlu
ZGV4IDcwYmI1NTA1M2QuLjE4ZTZiODc0ZDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVf
RElSUy12YXJpYWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNiOGU0Yjk5ZmNmZTgxMzk5ZTNlNmQ5MjIxNTZk
YjRhNDhhMzlhOGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDM3M2QwZDNjZWJkMzBi
OTkxODk0MzZkM2ZlNGZkMzAxOTBlMmI0ZmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBQYXNjYWwgQmFjaCA8cGFzY2FsLmJhY2hAc2llbWVucy5jb20+CiBEYXRlOiBUaHUsIDQgT2N0
IDIwMTggMTQ6NDM6MTcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gY21ha2U6IHVzZSBwcm9wZXIg
V0FZTEFORF9JTkNMVURFX0RJUlMgdmFyaWFibGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8t
bm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWds
aXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2Rl
LWJ1aWxkLXBhdC5wYXRjaAppbmRleCBjZTVjYmQzZWE5Li45MDI1YjY3NjhmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGln
bGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFk
ZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA3ZDJkMjMxMjVmMTk0NmE3Yjc0ZjlhNDI3Mzg4ZDQ2OTUwMGZjZDhkIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA0YmM5ZDhiZDJlZjY4ODY1MWJiMTcyODExNjQwMzMzZWQ5ZmMyODVk
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDEwIE5vdiAyMDIwIDE3OjEzOjUwICswMDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL3V0aWwvcGlnbGl0LXNoYWRlci5jOiBkbyBub3QgaGFy
ZGNvZGUgYnVpbGQgcGF0aCBpbnRvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdF9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xp
dF9naXQuYmIKaW5kZXggZmJmMjBkZTE3Ni4uMDc4ZjI0ZmY0ZiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0g
ImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9waWdsaXQuZ2l0O3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYQogICAgICAgICAgICAiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEi
CiAKLVNSQ1JFViA9ICJjMTFjOTM3NGMxNDQ4ZDAxYjMxZTdmNzI0OTIxY2MxZjRlZTJjODRjIgor
U1JDUkVWID0gIjdjZTY5ZGExMTk5ZDEyZWQwZGRhYTI1MWVkNDg5NzUwNTIzNzk4ZmIiCiAjICh3
aGVuIFBWIGdvZXMgYWJvdmUgMS4wIHJlbW92ZSB0aGUgdHJhaWxpbmcgcikKIFBWID0gIjEuMCtn
aXRyIgogCi0tIAoyLjQ0LjEKCg==

--===============6645197333106708025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:329bea5a2756d3e59bb899d7ca7001e19c553276"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 454 Local 443 Mirrors 0 Missed 11 Current 540 (97% match, 98% complete)
Removing 10 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2096 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 2730 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2731 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 2732 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 2733 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 2734 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2735 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2736 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 1e1e200888113b8514d6004d68242ecb4d7375231d369c328dccca02b046218b
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2737 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Running task 2738 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 2739 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 2740 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2741 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot unihash changed to 04377196baf03b69905150506bf533b1be8c3e434128acd122eeeeffb25909c0
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 2742 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2742 tasks of which 2728 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015104945.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015104945.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.3243089
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+c11c9374c1-r0 to 0:1.0+gitr0+7ce69da119-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+c11c9374c1-r0 to 0:1.0+gitr0+7ce69da119-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+c11c9374c1-r0 to 0:1.0+gitr0+7ce69da119-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+c11c9374c1-r0 to 0:1.0+gitr0+7ce69da119-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+c11c9374c1-r0 to 0:1.0+gitr0+7ce69da119-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+c11c9374c1-r0 to 0:1.0+gitr0+7ce69da119-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+c11c9374c1-r0 to 0:1.0+gitr0+7ce69da119-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+c11c9374c1-r0 to 0:1.0+gitr0+7ce69da119-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.3243089
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============6645197333106708025==--

