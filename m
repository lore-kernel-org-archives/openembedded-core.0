Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7944C44501
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 06:31:40 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9792.1783837897593177030
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 23:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ST84c/Oe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iJIP2Io5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f55062e05-a9f768d1-66ce-417d-a3ce-f30e685a252a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783837896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DRfe9Hm677Mg8U8rVlNaUd8USr3mLOQe5pa8NBfb6fw=;
	b=ST84c/OelFjJOX2LdgHYXi+JLF1YFKkYsa7ExHl+ym3ghCo3nQym13ucp4+TsufL
	R/Ix5pPOQd5ow9GKkaovDLMry9Oa76x0NSQ3JzHUKZ2jicLlB11ac3PIUSkrzv/J4Ai
	ZeAlpsJOWwqEKXAFR7XIUSaoO6iFY8T7WyIFGJfU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783837896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DRfe9Hm677Mg8U8rVlNaUd8USr3mLOQe5pa8NBfb6fw=;
	b=iJIP2Io5Oep3aKJreZaeeOxoCIIv/hSrQVYw1v29/OAF50DOpQL8Re11ldW+VDKD
	PXTlT4MwgNrml++fvoUXkVSm1awk0EyWNE0K0RtP7up7pz5mYd3aPKD5CuhS4fjjxfb
	3d0AQBkAQmYzIT+9X//RpaEqNx1ndvNkO1lvHO5g=
Content-Type: multipart/mixed; boundary="===============2795077296166943057=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 74fa6fb4422e0c956077a96abbbdb7c38d4edbc7
 SUCCEEDED
Message-ID: <0101019f55062e05-a9f768d1-66ce-417d-a3ce-f30e685a252a-000000@us-west-2.amazonses.com>
Date: Sun, 12 Jul 2026 06:31:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.12-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 06:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240765

--===============2795077296166943057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *74fa6fb4422e0c956077a96abbbdb7c38d4edbc7* has Succeeded.

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
From c6e4540c6efcf8960e6e4ed943a24eef1e31822b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 12 Jul 2026 06:27:29 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...o-not-obtain-wayland-scanner-path-fr.patch |  4 +--
 ...sts-use-unsigned-int-instead-of-uint.patch | 27 -------------------
 ...ake-egl_ext_surface_compression-cond.patch |  2 +-
 ...r.py-modify-_command-and-not-command.patch |  2 +-
 ...proper-WAYLAND_INCLUDE_DIRS-variable.patch |  2 +-
 ...t-shader.c-do-not-hardcode-build-pat.patch |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 +--
 7 files changed, 7 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index 46e5a6d83f..5dd0791316 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From abccc17819ad208c0df3edbc8bbcd134e45864f9 Mon Sep 17 00:00:00 2001
+From f211ce648519cb30079be1c410ec8818f9610bfb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 95f40ebfe..4c7da07b4 100644
+index 1a38c21f9..45c181e85 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch b/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch
deleted file mode 100644
index 2c01fe7029..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8b98674fedc0ac31e768ccd16165bcb585e413e2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 2 Jul 2026 13:56:17 +0200
-Subject: [PATCH] pixel-local-tests: use unsigned int instead of uint
-
-uint is not a valid integer type in C, and this fails
-to compile under musl libc library.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1170]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c b/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
-index 4776193f2..1ac669d11 100644
---- a/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
-+++ b/tests/spec/ext_shader_pixel_local_storage/pixel-local-tests.c
-@@ -851,7 +851,7 @@ make_test_main_str(char *dst, struct pls_format_data *format_data,
- 		case GL_RGBA8UI:
- 		case GL_RG16UI:
- 		case GL_R32UI: {
--			uint expected[4];
-+			unsigned int expected[4];
- 			for (int comp = 0; comp < 4; comp++) {
- 				if (comp < format_data[member].num_components)
- 					expected[comp] = format_data[member].u[comp];
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index c71bf4c8bc..2a16b101e5 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From 3e7ec165c718234e1afcdf730bdf20942976e25c Mon Sep 17 00:00:00 2001
+From a2ee9677bce8b4329f6b3d9d14767f9047b1d4d8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
index 035e7a4d5a..23c6dcebab 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
@@ -1,4 +1,4 @@
-From 14e56a6336f36d1112964ce1ff0900ea4b37b483 Mon Sep 17 00:00:00 2001
+From 769193855e55a1b27e525224e53125672dc3c412 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 22 May 2025 17:34:15 +0200
 Subject: [PATCH] tests/no_error.py: modify _command and not command
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 329fd75975..9498df5900 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 4444dd748b9324508e3168f64cf0b5adc31b5ebd Mon Sep 17 00:00:00 2001
+From 15ac13312ba3303910ab01a48aa86cb6399536a5 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 9c05e639b3..6eca9a1a02 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From f9bfdb8d32c2113c39c3be1bd6fd0934f693ab03 Mon Sep 17 00:00:00 2001
+From 35b1c1d57e59738d1c78a1bace0e4df68f85ca8f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a020d67bbf..7f34fe3cee 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -12,11 +12,10 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
            file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
-           file://0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "56f237be32ed66820eb05ea3cb04cb8b957ccd8d"
+SRCREV = "74fa6fb4422e0c956077a96abbbdb7c38d4edbc7"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.1


--===============2795077296166943057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/gl-2.1-point_smooth /usr/lib/piglit/tests/spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-consecutive-draws.shader_test /usr/lib/piglit/tests/vulkan/shaders/cmat-uniform-ctor.shader_test"

--===============2795077296166943057==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBjNmU0NTQwYzZlZmNmODk2MGU2ZTRlZDk0M2EyNGVlZjFlMzE4MjJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTIgSnVsIDIwMjYgMDY6Mjc6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIC4uLm8tbm90LW9idGFpbi13
YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaCB8ICA0ICstLQogLi4uc3RzLXVzZS11bnNpZ25l
ZC1pbnQtaW5zdGVhZC1vZi11aW50LnBhdGNoIHwgMjcgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
YWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNoIHwgIDIgKy0KIC4uLnIu
cHktbW9kaWZ5LV9jb21tYW5kLWFuZC1ub3QtY29tbWFuZC5wYXRjaCB8ICAyICstCiAuLi5wcm9w
ZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2ggfCAgMiArLQogLi4udC1zaGFk
ZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoIHwgIDIgKy0KIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiAgICB8ICAzICstLQogNyBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtcGl4ZWwtbG9jYWwtdGVz
dHMtdXNlLXVuc2lnbmVkLWludC1pbnN0ZWFkLW9mLXVpbnQucGF0Y2gKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRv
LW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4t
d2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2gKaW5kZXggNDZlNWE2ZDgzZi4uNWRkMDc5MTMx
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1D
TWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VMaXN0
cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gYWJjY2MxNzgxOWFkMjA4YzBkZjNlZGJjOGJiY2QxMzRlNDU4NjRmOSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjIxMWNlNjQ4NTE5Y2IzMDA3OWJlMWM0MTBl
Yzg4MThmOTYxMGJmYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDIzIEF1ZyAyMDI0IDE1OjI5
OjQ1ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIENNYWtlTGlzdHMudHh0OiBkbyBub3Qgb2J0YWlu
IHdheWxhbmQtc2Nhbm5lciBwYXRoIGZyb20KQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1i
eTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9DTWFrZUxp
c3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCA5NWY0MGViZmUuLjRjN2RhMDdiNCAxMDA2
NDQKK2luZGV4IDFhMzhjMjFmOS4uNDVjMTgxZTg1IDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50
eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0CiBAQCAtMjExLDExICsyMTEsNyBAQCBpZihQSUdMSVRf
VVNFX1dBWUxBTkQpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAxLXBpeGVsLWxvY2FsLXRlc3RzLXVzZS11bnNpZ25lZC1pbnQtaW5zdGVhZC1vZi11
aW50LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1waXhl
bC1sb2NhbC10ZXN0cy11c2UtdW5zaWduZWQtaW50LWluc3RlYWQtb2YtdWludC5wYXRjaApkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMmMwMWZlNzAyOS4uMDAwMDAwMDAwMAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXBpeGVsLWxvY2FsLXRlc3Rz
LXVzZS11bnNpZ25lZC1pbnQtaW5zdGVhZC1vZi11aW50LnBhdGNoCisrKyAvZGV2L251bGwKQEAg
LTEsMjcgKzAsMCBAQAotRnJvbSA4Yjk4Njc0ZmVkYzBhYzMxZTc2OGNjZDE2MTY1YmNiNTg1ZTQx
M2UyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXhAbGludXRyb25peC5kZT4KLURhdGU6IFRodSwgMiBKdWwgMjAyNiAxMzo1NjoxNyArMDIwMAot
U3ViamVjdDogW1BBVENIXSBwaXhlbC1sb2NhbC10ZXN0czogdXNlIHVuc2lnbmVkIGludCBpbnN0
ZWFkIG9mIHVpbnQKLQotdWludCBpcyBub3QgYSB2YWxpZCBpbnRlZ2VyIHR5cGUgaW4gQywgYW5k
IHRoaXMgZmFpbHMKLXRvIGNvbXBpbGUgdW5kZXIgbXVzbCBsaWJjIGxpYnJhcnkuCi0KLVVwc3Ry
ZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVz
YS9waWdsaXQvLS9tZXJnZV9yZXF1ZXN0cy8xMTcwXQotU2lnbmVkLW9mZi1ieTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQotIHRlc3RzL3NwZWMvZXh0X3NoYWRl
cl9waXhlbF9sb2NhbF9zdG9yYWdlL3BpeGVsLWxvY2FsLXRlc3RzLmMgfCAyICstCi0gMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS90
ZXN0cy9zcGVjL2V4dF9zaGFkZXJfcGl4ZWxfbG9jYWxfc3RvcmFnZS9waXhlbC1sb2NhbC10ZXN0
cy5jIGIvdGVzdHMvc3BlYy9leHRfc2hhZGVyX3BpeGVsX2xvY2FsX3N0b3JhZ2UvcGl4ZWwtbG9j
YWwtdGVzdHMuYwotaW5kZXggNDc3NjE5M2YyLi4xYWM2NjlkMTEgMTAwNjQ0Ci0tLS0gYS90ZXN0
cy9zcGVjL2V4dF9zaGFkZXJfcGl4ZWxfbG9jYWxfc3RvcmFnZS9waXhlbC1sb2NhbC10ZXN0cy5j
Ci0rKysgYi90ZXN0cy9zcGVjL2V4dF9zaGFkZXJfcGl4ZWxfbG9jYWxfc3RvcmFnZS9waXhlbC1s
b2NhbC10ZXN0cy5jCi1AQCAtODUxLDcgKzg1MSw3IEBAIG1ha2VfdGVzdF9tYWluX3N0cihjaGFy
ICpkc3QsIHN0cnVjdCBwbHNfZm9ybWF0X2RhdGEgKmZvcm1hdF9kYXRhLAotIAkJY2FzZSBHTF9S
R0JBOFVJOgotIAkJY2FzZSBHTF9SRzE2VUk6Ci0gCQljYXNlIEdMX1IzMlVJOiB7Ci0tCQkJdWlu
dCBleHBlY3RlZFs0XTsKLSsJCQl1bnNpZ25lZCBpbnQgZXhwZWN0ZWRbNF07Ci0gCQkJZm9yIChp
bnQgY29tcCA9IDA7IGNvbXAgPCA0OyBjb21wKyspIHsKLSAJCQkJaWYgKGNvbXAgPCBmb3JtYXRf
ZGF0YVttZW1iZXJdLm51bV9jb21wb25lbnRzKQotIAkJCQkJZXhwZWN0ZWRbY29tcF0gPSBmb3Jt
YXRfZGF0YVttZW1iZXJdLnVbY29tcF07CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNl
X2NvbXByZXNzaW9uLWNvbmQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9u
LWNvbmQucGF0Y2gKaW5kZXggYzcxYmY0YzhiYy4uMmExNmIxMDFlNSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtl
LWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0
X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2U3
ZWMxNjVjNzE4MjM0ZTFhZmNkZjczMGJkZjIwOTQyOTc2ZTI1YyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gYTJlZTk2NzdiY2U4YjQzMjlmNmIzZDlkMTQ3NjdmOTA0N2IxZDRkOCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0
cm9uaXguZGU+CiBEYXRlOiBGcmksIDIyIE5vdiAyMDI0IDIyOjUyOjMxICswMTAwCiBTdWJqZWN0
OiBbUEFUQ0hdIHRlc3RzL2VnbC9zcGVjOiBtYWtlIGVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lv
biBjb25kaXRpb25hbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9w
aWdsaXQvMDAwMS10ZXN0cy1ub19lcnJvci5weS1tb2RpZnktX2NvbW1hbmQtYW5kLW5vdC1jb21t
YW5kLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0
cy1ub19lcnJvci5weS1tb2RpZnktX2NvbW1hbmQtYW5kLW5vdC1jb21tYW5kLnBhdGNoCmluZGV4
IDAzNWU3YTRkNWEuLjIzYzZkY2ViYWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtbm9fZXJyb3IucHktbW9kaWZ5LV9jb21tYW5kLWFu
ZC1ub3QtY29tbWFuZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAxLXRlc3RzLW5vX2Vycm9yLnB5LW1vZGlmeS1fY29tbWFuZC1hbmQtbm90LWNvbW1h
bmQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE0ZTU2YTYzMzZmMzZkMTExMjk2NGNlMWZm
MDkwMGVhNGIzN2I0ODMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc2OTE5Mzg1NWU1
NWExYjI3ZTUyNTIyNGU1MzEyNTY3MmRjM2M0MTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogVGh1LCAy
MiBNYXkgMjAyNSAxNzozNDoxNSArMDIwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy9ub19lcnJv
ci5weTogbW9kaWZ5IF9jb21tYW5kIGFuZCBub3QgY29tbWFuZApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxB
TkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Bp
Z2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZh
cmlhYmxlLnBhdGNoCmluZGV4IDMyOWZkNzU5NzUuLjk0OThkZjU5MDAgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1X
QVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURF
X0RJUlMtdmFyaWFibGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ0NDRkZDc0OGI5MzI0
NTA4ZTMxNjhmNjRjZjBiNWFkYzMxYjVlYmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDE1YWMxMzMxMmJhMzMwMzkxMGFiMDFhNDhhYTg2Y2I2Mzk5NTM2YTUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBQYXNjYWwgQmFjaCA8cGFzY2FsLmJhY2hAc2llbWVucy5jb20+CiBE
YXRlOiBUaHUsIDQgT2N0IDIwMTggMTQ6NDM6MTcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gY21h
a2U6IHVzZSBwcm9wZXIgV0FZTEFORF9JTkNMVURFX0RJUlMgdmFyaWFibGUKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWds
aXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMt
ZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaAppbmRleCA5YzA1ZTYzOWIzLi42ZWNhOWEx
YTAyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAz
LXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11
dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBmOWJmZGI4ZDMyYzIxMTNjMzljM2JlMWJkNmZkMDkzNGY2OTNhYjAz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzNWIxYzFkNTdlNTk3MzhkMWM3OGExYmFj
ZTBlNGRmNjhmODVjYThmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDEwIE5vdiAyMDIw
IDE3OjEzOjUwICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL3V0aWwvcGlnbGl0LXNoYWRl
ci5jOiBkbyBub3QgaGFyZGNvZGUgYnVpbGQgcGF0aCBpbnRvCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKaW5kZXggYTAyMGQ2N2JiZi4uN2YzNGZlM2NlZSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgpAQCAtMTIsMTEgKzEy
LDEwIEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xp
dC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUNN
YWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2gg
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3Vy
ZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVz
dHMtbm9fZXJyb3IucHktbW9kaWZ5LV9jb21tYW5kLWFuZC1ub3QtY29tbWFuZC5wYXRjaCBcCi0g
ICAgICAgICAgIGZpbGU6Ly8wMDAxLXBpeGVsLWxvY2FsLXRlc3RzLXVzZS11bnNpZ25lZC1pbnQt
aW5zdGVhZC1vZi11aW50LnBhdGNoIFwKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfQ09N
TUlUUyA9ICIxIgogCi1TUkNSRVYgPSAiNTZmMjM3YmUzMmVkNjY4MjBlYjA1ZWEzY2IwNGNiOGI5
NTdjY2Q4ZCIKK1NSQ1JFViA9ICI3NGZhNmZiNDQyMmUwYzk1NjA3N2E5NmFiYmJkYjdjMzhkNGVk
YmM3IgogIyAod2hlbiBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhlIHRyYWlsaW5nIHIpCiBQ
ViA9ICIxLjArZ2l0ciIKIAotLSAKMi40Ny4xCgo=

--===============2795077296166943057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/piglit: SRC_URI changed from "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch file://0001-tests-no_error.py-modify-_command-and-not-command.patch file://0001-pixel-local-tests-use-unsigned-int-instead-of-uint.patch" to "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch file://0001-tests-no_error.py-modify-_command-and-not-command.patch"
packages/x86-64-v3-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442
packages/x86-64-v3-poky-linux/piglit/piglit: PKGSIZE changed from 2059162120 to 2059184354 (+0%)
packages/x86-64-v3-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-consecutive-draws.shader_test /usr/lib/piglit/tests/vulkan/shaders/cmat-uniform-ctor.shader_test /usr/lib/piglit/bin/gl-2.1-point_smooth"
packages/x86-64-v3-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+56f237be32 to 1.0+gitr0+74fa6fb442

--===============2795077296166943057==--

