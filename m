Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6EAC3ABBD
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.20158.1744723978337676884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Kr3bE2/D;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rFQG8Jvi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019639a74920-7583bd5f-7910-4cc6-9bd0-e8c187e887b1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723986;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8gJapMt5jFnaxRjhtohDlPNiKWD4ob2BPJCAtu6OEOo=;
	b=Kr3bE2/DxmfvN3bX+Qoy6haVmshciFX5x0qFLTgzVvV1eHN1dPbFazwPXe1D4gJu
	IPdd8xfOViYA8HLRP5EsSSsiqDgmh2CTwFJzZUm5XbFmw0I0cDNc9/gW1tjoB+H4OUJ
	CbyQTfszJKhkidqtkreeNfvShlhcdlhSMECDbMXY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723986;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8gJapMt5jFnaxRjhtohDlPNiKWD4ob2BPJCAtu6OEOo=;
	b=rFQG8JviKXKIwX1jS7F6Z/G+pXc8v/BwzqaZI34jiY428xWCka2tVqiqYCEC1j+G
	rgnk7U0MxLqV9WLEAm+9xKjhJz7ASzjNXeWkG7PPJj4TGeUhevXFyRRLChDBS5gs0rQ
	xOr20uRmfAPctcl9NeXdlZeKpCEHDewOapBmfjL8=
Content-Type: multipart/mixed; boundary="===============4247211778447850656=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Ecom=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.7.2 SUCCEEDED
Message-ID: <0101019639a74920-7583bd5f-7910-4cc6-9bd0-e8c187e887b1-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214914

--===============4247211778447850656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libadwaita* to *1.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libadwaita-upgrade-1.7.0-1.7.2.patch
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
From 7034bd3e4e1b35bd31590f691e0b30ed0f314d7b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 09:27:13 +0000
Subject: [PATCH] libadwaita: upgrade 1.7.0 -> 1.7.2

---
 ...8222c184f681472d9d9ce2ae443ebd76386e.patch | 38 -------------------
 ...ibadwaita_1.7.0.bb => libadwaita_1.7.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-gnome/libadwaita/libadwaita/90d68222c184f681472d9d9ce2ae443ebd76386e.patch
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.7.0.bb => libadwaita_1.7.2.bb} (82%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita/90d68222c184f681472d9d9ce2ae443ebd76386e.patch b/meta/recipes-gnome/libadwaita/libadwaita/90d68222c184f681472d9d9ce2ae443ebd76386e.patch
deleted file mode 100644
index d3a3535013..0000000000
--- a/meta/recipes-gnome/libadwaita/libadwaita/90d68222c184f681472d9d9ce2ae443ebd76386e.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 90d68222c184f681472d9d9ce2ae443ebd76386e Mon Sep 17 00:00:00 2001
-From: Maximiliano Sandoval <msandova@gnome.org>
-Date: Sat, 15 Mar 2025 10:47:31 +0100
-Subject: [PATCH] meson: Check g-i before using --doc-format arg
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libadwaita/-/commit/90d68222c184f681472d9d9ce2ae443ebd76386e.patch]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- src/meson.build | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 90cecc6a1..585fe3aad 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -450,11 +450,17 @@ meson.override_dependency(package_api_name, libadwaita_dep)
- 
- if introspection
- 
-+   gir_dep = dependency('gobject-introspection-1.0')
-    libadwaita_gir_extra_args = [
-      '--quiet',
--     '--doc-format=gi-docgen',
-      '-DADWAITA_COMPILATION',
-    ]
-+   if gir_dep.version().version_compare('>=1.83.2')
-+     libadwaita_gir_extra_args += [
-+       '--doc-format=gi-docgen',
-+     ]
-+   endif
-+
- 
-    libadwaita_gir = gnome.generate_gir(libadwaita,
-                  sources: libadwaita_generated_headers + libadwaita_public_headers + libadwaita_public_sources,
--- 
-GitLab
-
diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.7.0.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb
similarity index 82%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.7.0.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb
index 55985bf7cc..4dc583ab39 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.7.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb
@@ -11,8 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "58bf99b8a9f8b0171964de0ae741d01d5a09db3662134fa67541c99a8ed7dec0"
-SRC_URI += "file://90d68222c184f681472d9d9ce2ae443ebd76386e.patch"
+SRC_URI[archive.sha256sum] = "28ee2ff589c6debe47af9da7a56e37c97d6849e003918a4b223f690d25f960be"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.47.1


--===============4247211778447850656==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.7.0-1.7.2.patch"

RnJvbSA3MDM0YmQzZTRlMWIzNWJkMzE1OTBmNjkxZTBiMzBlZDBmMzE0ZDdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDk6Mjc6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhZHdhaXRhOiB1cGdyYWRlIDEuNy4wIC0+IDEuNy4yCgotLS0KIC4uLjgyMjJjMTg0ZjY4MTQ3
MmQ5ZDljZTJhZTQ0M2ViZDc2Mzg2ZS5wYXRjaCB8IDM4IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
LmliYWR3YWl0YV8xLjcuMC5iYiA9PiBsaWJhZHdhaXRhXzEuNy4yLmJifSB8ICAzICstCiAyIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS9saWJhZHdhaXRhLzkwZDY4MjIy
YzE4NGY2ODE0NzJkOWQ5Y2UyYWU0NDNlYmQ3NjM4NmUucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ25vbWUvbGliYWR3YWl0YS97bGliYWR3YWl0YV8xLjcuMC5iYiA9PiBsaWJhZHdhaXRhXzEu
Ny4yLmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRh
L2xpYmFkd2FpdGEvOTBkNjgyMjJjMTg0ZjY4MTQ3MmQ5ZDljZTJhZTQ0M2ViZDc2Mzg2ZS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL2xpYmFkd2FpdGEvOTBkNjgyMjJjMTg0
ZjY4MTQ3MmQ5ZDljZTJhZTQ0M2ViZDc2Mzg2ZS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggZDNhMzUzNTAxMy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUv
bGliYWR3YWl0YS9saWJhZHdhaXRhLzkwZDY4MjIyYzE4NGY2ODE0NzJkOWQ5Y2UyYWU0NDNlYmQ3
NjM4NmUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzOCArMCwwIEBACi1Gcm9tIDkwZDY4MjIy
YzE4NGY2ODE0NzJkOWQ5Y2UyYWU0NDNlYmQ3NjM4NmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
Ci1Gcm9tOiBNYXhpbWlsaWFubyBTYW5kb3ZhbCA8bXNhbmRvdmFAZ25vbWUub3JnPgotRGF0ZTog
U2F0LCAxNSBNYXIgMjAyNSAxMDo0NzozMSArMDEwMAotU3ViamVjdDogW1BBVENIXSBtZXNvbjog
Q2hlY2sgZy1pIGJlZm9yZSB1c2luZyAtLWRvYy1mb3JtYXQgYXJnCi0KLVVwc3RyZWFtLVN0YXR1
czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJhZHdhaXRhLy0v
Y29tbWl0LzkwZDY4MjIyYzE4NGY2ODE0NzJkOWQ5Y2UyYWU0NDNlYmQ3NjM4NmUucGF0Y2hdCi0K
LVNpZ25lZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KLS0tLQotIHNy
Yy9tZXNvbi5idWlsZCB8IDggKysrKysrKy0KLSAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvbWVzb24uYnVpbGQgYi9zcmMv
bWVzb24uYnVpbGQKLWluZGV4IDkwY2VjYzZhMS4uNTg1ZmUzYWFkIDEwMDY0NAotLS0tIGEvc3Jj
L21lc29uLmJ1aWxkCi0rKysgYi9zcmMvbWVzb24uYnVpbGQKLUBAIC00NTAsMTEgKzQ1MCwxNyBA
QCBtZXNvbi5vdmVycmlkZV9kZXBlbmRlbmN5KHBhY2thZ2VfYXBpX25hbWUsIGxpYmFkd2FpdGFf
ZGVwKQotIAotIGlmIGludHJvc3BlY3Rpb24KLSAKLSsgICBnaXJfZGVwID0gZGVwZW5kZW5jeSgn
Z29iamVjdC1pbnRyb3NwZWN0aW9uLTEuMCcpCi0gICAgbGliYWR3YWl0YV9naXJfZXh0cmFfYXJn
cyA9IFsKLSAgICAgICctLXF1aWV0JywKLS0gICAgICctLWRvYy1mb3JtYXQ9Z2ktZG9jZ2VuJywK
LSAgICAgICctREFEV0FJVEFfQ09NUElMQVRJT04nLAotICAgIF0KLSsgICBpZiBnaXJfZGVwLnZl
cnNpb24oKS52ZXJzaW9uX2NvbXBhcmUoJz49MS44My4yJykKLSsgICAgIGxpYmFkd2FpdGFfZ2ly
X2V4dHJhX2FyZ3MgKz0gWwotKyAgICAgICAnLS1kb2MtZm9ybWF0PWdpLWRvY2dlbicsCi0rICAg
ICBdCi0rICAgZW5kaWYKLSsKLSAKLSAgICBsaWJhZHdhaXRhX2dpciA9IGdub21lLmdlbmVyYXRl
X2dpcihsaWJhZHdhaXRhLAotICAgICAgICAgICAgICAgICAgc291cmNlczogbGliYWR3YWl0YV9n
ZW5lcmF0ZWRfaGVhZGVycyArIGxpYmFkd2FpdGFfcHVibGljX2hlYWRlcnMgKyBsaWJhZHdhaXRh
X3B1YmxpY19zb3VyY2VzLAotLS0gCi1HaXRMYWIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjcuMC5iYiBiL21ldGEvcmVjaXBlcy1nbm9t
ZS9saWJhZHdhaXRhL2xpYmFkd2FpdGFfMS43LjIuYmIKc2ltaWxhcml0eSBpbmRleCA4MiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjcuMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjcu
Mi5iYgppbmRleCA1NTk4NWJmN2NjLi40ZGM1ODNhYjM5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ25vbWUvbGliYWR3YWl0YS9saWJhZHdhaXRhXzEuNy4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1nbm9tZS9saWJhZHdhaXRhL2xpYmFkd2FpdGFfMS43LjIuYmIKQEAgLTExLDggKzExLDcgQEAg
REVQRU5EUyA9ICIgXAogCiBpbmhlcml0IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rpb24g
Z2ktZG9jZ2VuIHZhbGEgZmVhdHVyZXNfY2hlY2sKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1
bV0gPSAiNThiZjk5YjhhOWY4YjAxNzE5NjRkZTBhZTc0MWQwMWQ1YTA5ZGIzNjYyMTM0ZmE2NzU0
MWM5OWE4ZWQ3ZGVjMCIKLVNSQ19VUkkgKz0gImZpbGU6Ly85MGQ2ODIyMmMxODRmNjgxNDcyZDlk
OWNlMmFlNDQzZWJkNzYzODZlLnBhdGNoIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAi
MjhlZTJmZjU4OWM2ZGViZTQ3YWY5ZGE3YTU2ZTM3Yzk3ZDY4NDllMDAzOTE4YTRiMjIzZjY5MGQy
NWY5NjBiZSIKIAogQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJF
U30iCiBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAib3BlbmdsIgotLSAKMi40Ny4xCgo=

--===============4247211778447850656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (0 cached, 928 parsed). 1898 targets, 50 skipped, 0 masked, 0 errors.
Removing 135 recipes from the core2-64 sysroot...done.
Removing 135 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:51493ed60eb8685cea15ea25884d084345429336"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1083 Local 1060 Mirrors 0 Missed 23 Current 450 (97% match, 98% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 472 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 590 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 597 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 599 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 601 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 604 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 605 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 613 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 614 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.7.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.56.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.18.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe appstream-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk4-4.18.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libadwaita-1.7.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 619 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 620 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 624 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 632 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 634 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 640 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe appstream-1.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.56.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.59.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 649 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.59.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 690 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.56.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 691 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 692 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_25.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 713 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 715 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 721 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.56.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: Running setscene task 723 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 729 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 731 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 734 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 752 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 754 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.56.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 770 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-11.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 773 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 775 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 776 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 777 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.56.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-11.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 780 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.56.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 790 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 799 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 801 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 802 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.82-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.28-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 803 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.28-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 804 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.82-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.28-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 812 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.82-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.82-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 821 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 823 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 825 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 826 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 829 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 830 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.59.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 836 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 840 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.59.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 841 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.28.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 845 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 846 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 847 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 853 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 854 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 857 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 859 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 863 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 864 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 865 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.82.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 867 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 874 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.82-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 883 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 884 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe pango-1.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 889 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.82-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 890 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 898 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 902 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 907 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 908 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 909 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 914 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 916 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 919 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 922 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 927 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 931 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 935 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 936 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 951 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 952 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 953 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 954 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 955 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 960 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-11.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 962 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 971 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 972 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-11.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 974 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 975 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 976 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 977 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 984 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 990 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-11.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-11.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 994 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 998 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1001 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1009 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1010 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1011 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1013 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1015 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1016 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1019 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.85.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1020 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1021 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.85.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1022 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1027 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1029 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1031 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1036 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1040 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1041 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1044 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1047 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1048 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1050 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1051 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1054 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1055 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1056 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1057 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1058 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb:do_packagedata_setscene)
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1060 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1062 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1064 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1065 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1066 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1067 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1069 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1070 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1071 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1073 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1075 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1078 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1081 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1082 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1083 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1084 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1085 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe llvm-20.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1090 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1091 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1093 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe llvm-20.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1096 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1098 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1100 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1103 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1105 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1107 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-11.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1108 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1109 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1110 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-11.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1111 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1112 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1114 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1115 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1117 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1118 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1119 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1120 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1121 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1123 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1126 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1130 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1131 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1134 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1136 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1137 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1139 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1140 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1141 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1142 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1143 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1144 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1145 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1146 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1149 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1150 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1152 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1153 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 1156 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.7.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1159 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1160 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1161 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1164 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.8-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1167 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1169 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1171 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1174 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1176 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1178 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1179 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1181 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1182 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1185 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1191 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1192 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1193 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1195 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1196 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1197 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1198 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1202 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1204 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1205 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1207 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1208 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1211 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1212 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1214 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1215 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1218 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1219 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1220 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1221 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1225 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1226 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1229 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1230 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1232 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1234 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1235 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1236 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1237 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1238 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1241 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1243 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1245 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: Running setscene task 1246 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1251 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1253 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1255 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1256 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 1260 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1262 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1263 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1264 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1265 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1266 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1269 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1270 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1273 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1276 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1277 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1279 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1283 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1284 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1285 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1289 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1291 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1292 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1293 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1295 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1302 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1306 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1307 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1309 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1311 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1312 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1315 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1317 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1318 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1320 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1323 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1324 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1327 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1328 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1329 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1331 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1332 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1333 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1334 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1335 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1337 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1340 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1341 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1342 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1343 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1346 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1349 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1350 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1351 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1352 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1353 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1354 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1355 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1356 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_20.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1359 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1363 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1364 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1366 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1367 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1368 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1369 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-20.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1370 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1371 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1374 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1375 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1376 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-20.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1379 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1380 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1382 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1383 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1384 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1385 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1386 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1387 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1388 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1389 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1391 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.309.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1394 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1395 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1396 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1397 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1401 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1403 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1405 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1406 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1409 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1413 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1414 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1415 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1416 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1421 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1423 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1428 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1430 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1431 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1436 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1440 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1441 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1442 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1443 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1444 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1446 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1447 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1448 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1449 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1450 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1451 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1453 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1454 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1457 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1459 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1460 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1462 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1466 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1468 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1471 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1472 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1473 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1475 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1477 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1478 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1479 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1481 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1483 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1484 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1486 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1491 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1493 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1495 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1496 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1498 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1500 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1501 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1502 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1503 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1505 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1509 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1511 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1513 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1514 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1516 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1519 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1522 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1523 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2157 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_fetch)
NOTE: recipe libxmlb-0.3.22-r0: task do_fetch: Started
NOTE: Running task 2267 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_write_config)
NOTE: recipe libxmlb-0.3.22-r0: task do_write_config: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_write_config: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_fetch: Succeeded
NOTE: Running task 2435 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_unpack)
NOTE: Running task 2465 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_fetch)
NOTE: Running task 2466 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_fetch)
NOTE: Running task 2517 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_recipe_qa)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_unpack: Started
NOTE: Running setscene task 1525 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.0.4-r0: task do_fetch: Started
NOTE: recipe gtk4-4.18.3-r0: task do_fetch: Started
NOTE: recipe appstream-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 2545 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_unpack)
NOTE: Running task 2546 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_unpack)
NOTE: Running task 2550 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_write_config)
NOTE: Running task 2551 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_write_config)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libadwaita-1.7.2-r0: task do_recipe_qa: Started
NOTE: recipe appstream-1.0.4-r0: task do_unpack: Started
NOTE: Running task 2612 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_write_config)
NOTE: recipe appstream-1.0.4-r0: task do_write_config: Started
NOTE: recipe gtk4-4.18.3-r0: task do_unpack: Started
NOTE: recipe gtk4-4.18.3-r0: task do_write_config: Started
NOTE: recipe appstream-1.0.4-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.18.3-r0: task do_write_config: Succeeded
NOTE: recipe libadwaita-1.7.2-r0: task do_write_config: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1530 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1532 of 1533 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe libadwaita-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libadwaita-1.7.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2763 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_fetch)
NOTE: recipe appstream-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2764 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_patch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_unpack: Succeeded
NOTE: Running task 2765 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_patch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.7.2-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe appstream-1.0.4-r0: task do_patch: Started
NOTE: Running task 2778 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_unpack)
NOTE: recipe libxmlb-0.3.22-r0: task do_patch: Started
NOTE: recipe libadwaita-1.7.2-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe appstream-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.18.3-r0: task do_unpack: Succeeded
NOTE: Running task 3559 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3826 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_patch)
NOTE: Running task 3909 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3910 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_patch)
NOTE: recipe gtk4-4.18.3-r0: task do_patch: Started
NOTE: recipe gtk4-4.18.3-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.7.2-r0: task do_patch: Started
NOTE: recipe libadwaita-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 4123 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_collect_spdx_deps)
NOTE: Running task 4124 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 4143 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.18.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4145 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_configure)
NOTE: recipe libxmlb-0.3.22-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libadwaita-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_configure: Started
NOTE: recipe gtk4-4.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.18.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4146 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_configure)
NOTE: recipe gtk4-4.18.3-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_configure: Succeeded
NOTE: Running task 4147 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_configure_ptest_base)
NOTE: recipe libxmlb-0.3.22-r0: task do_configure_ptest_base: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4148 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_compile)
NOTE: recipe libxmlb-0.3.22-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_compile: Succeeded
NOTE: Running task 4149 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.22-r0: task do_compile_ptest_base: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gtk4-4.18.3-r0: task do_configure: Succeeded
NOTE: Running task 4150 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_install)
NOTE: Running task 4151 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_compile)
NOTE: recipe libxmlb-0.3.22-r0: task do_install: Started
NOTE: recipe gtk4-4.18.3-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_install: Succeeded
NOTE: Running task 4152 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_install_ptest_base)
NOTE: recipe libxmlb-0.3.22-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4153 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_populate_sysroot)
NOTE: Running task 4154 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_package)
NOTE: recipe libxmlb-0.3.22-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4155 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe appstream-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4156 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_configure)
NOTE: recipe appstream-1.0.4-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_package: Succeeded
NOTE: Running task 4157 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.22-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_packagedata unihash changed to a00b34b57689f80bdc9b5d710409f5a954b104905d606466e38e4b77ee0c4c42
NOTE: Setscene tasks completed
NOTE: Running task 4158 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.22-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_create_spdx: Succeeded
NOTE: Running task 4159 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_collect_spdx_deps)
NOTE: recipe appstream-1.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe appstream-1.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe appstream-1.0.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4160 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_compile)
NOTE: recipe appstream-1.0.4-r0: task do_compile: Started
NOTE: recipe appstream-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 4161 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_install)
NOTE: recipe appstream-1.0.4-r0: task do_install: Started
NOTE: recipe appstream-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 4162 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_package)
NOTE: Running task 4163 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_populate_sysroot)
NOTE: recipe appstream-1.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.0.4-r0: task do_package: Started
NOTE: recipe appstream-1.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 4164 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_packagedata)
NOTE: recipe appstream-1.0.4-r0: task do_packagedata: Started
NOTE: recipe appstream-1.0.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_packagedata unihash changed to d122abf491213659769b722372dd965cee1f72a7abb3c331cd3d7436ae7750aa
NOTE: Setscene tasks completed
NOTE: Running task 4165 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.4.bb:do_create_spdx)
NOTE: recipe appstream-1.0.4-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.18.3-r0: task do_compile: Succeeded
NOTE: Running task 4166 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_install)
NOTE: recipe gtk4-4.18.3-r0: task do_install: Started
NOTE: recipe gtk4-4.18.3-r0: task do_install: Succeeded
NOTE: Running task 4167 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_package)
NOTE: Running task 4168 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.18.3-r0: task do_package: Started
NOTE: recipe gtk4-4.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4169 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libadwaita-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4170 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_configure)
NOTE: recipe libadwaita-1.7.2-r0: task do_configure: Started
NOTE: recipe libadwaita-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 4171 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_compile)
NOTE: recipe libadwaita-1.7.2-r0: task do_compile: Started
NOTE: recipe gtk4-4.18.3-r0: task do_package: Succeeded
NOTE: Running task 4172 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_packagedata)
NOTE: recipe gtk4-4.18.3-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 4173 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_install)
NOTE: recipe libadwaita-1.7.2-r0: task do_install: Started
NOTE: recipe libadwaita-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 4174 of 4185 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb:do_populate_sysroot)
NOTE: recipe libadwaita-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.18.3-r0: task do_packagedata: Failed
NOTE: recipe libadwaita-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 4174 tasks of which 4122 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415092554.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415092554.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gtk4/4.18.3/temp/log.do_packagedata.1489620
Summary: There were 127 ERROR messages, returning a non-zero exit code.
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-src went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-dbg went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-staticdev went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-dev went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-doc went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ab went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-af went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-am went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-an went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ang went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ar went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-as went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ast went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-az went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-az-ir went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-be went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-be+latin went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-bg went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-bn went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-bn-in went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-br went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-bs went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ca went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ca+valencia went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-crh went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-cs went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-cy went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-da went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-de went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-dz went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-el went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-en went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-en+shaw went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-en-ca went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-en-gb went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-eo went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-es went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-et went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-eu went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-fa went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-fi went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-fr went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-fur went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ga went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-gd went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-gl went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-gu went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-he went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-hi went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-hr went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-hu went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-hy went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ia went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-id went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ie went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-io went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-is went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-it went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ja went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ka went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-kab went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-kg went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-kk went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-km went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-kn went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ko went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ku went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ky went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-lg went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-li went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-lt went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-lv went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mai went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mi went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mjw went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mk went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ml went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mn went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-mr went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ms went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-my went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-nb went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-nds went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ne went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-nl went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-nn went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-nso went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-oc went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-or went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-pa went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-pl went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ps went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-pt went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-pt-br went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ro went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ru went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-rw went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-si went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sk went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sl went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sq went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sr went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sr+ije went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sr+latin went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-sv went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ta went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-te went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-tg went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-th went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-tk went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-tr went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-tt went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ug went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-uk went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-ur went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-uz went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-uz+cyrillic went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-vi went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-wa went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-xh went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-yi went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-zh-cn went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-zh-hk went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-locale-zh-tw went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4 went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: QA Issue: Package version for package gtk4-printbackend-file went backwards which would break package feeds (from 0:4.18.4-r0 to 0:4.18.3-r0) [version-going-backwards]
ERROR: gtk4-4.18.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gtk4/4.18.3/temp/log.do_packagedata.1489620
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb:do_packagedata) failed with exit code '1'

--===============4247211778447850656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libadwaita: SRC_URI changed from "https://download.gnome.org/sources//libadwaita/1.7/libadwaita-1.7.0.tar.xz;name=archive file://90d68222c184f681472d9d9ce2ae443ebd76386e.patch" to "https://download.gnome.org/sources//libadwaita/1.7/libadwaita-1.7.2.tar.xz;name=archive"
packages/core2-64-poky-linux/libadwaita: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-dbg: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-dbg: PKGSIZE changed from 4803160 to 4803432 (+0%)
packages/core2-64-poky-linux/libadwaita/libadwaita-dbg: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-dev: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-dev: PKGSIZE changed from 2464945 to 2465145 (+0%)
packages/core2-64-poky-linux/libadwaita/libadwaita-dev: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-doc: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-doc: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ab: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ab: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-be: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-be: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-bg: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-bg: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ca: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ca: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-cs: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-cs: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-da: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-da: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-de: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-de: PKGSIZE changed from 7569 to 9506 (+26%)
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-de: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-el: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-el: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGSIZE changed from 7089 to 8833 (+25%)
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-en-gb: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eo: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eo: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-es: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-es: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eu: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-eu: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fa: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fa: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fi: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fi: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fil: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fil: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fr: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fr: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fur: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-fur: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-gl: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-gl: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-he: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-he: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hi: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hi: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hr: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hr: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hu: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-hu: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-id: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-id: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-it: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-it: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ja: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ja: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ka: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ka: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-kab: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-kab: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-kk: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-kk: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ko: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ko: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-lt: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-lt: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-lv: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-lv: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-nb: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-nb: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ne: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ne: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-nl: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-nl: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-oc: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-oc: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pa: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pa: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pl: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pl: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt-br: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt-br: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-pt: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ro: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ro: PKGSIZE changed from 6537 to 9437 (+44%)
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ro: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ru: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ru: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sk: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sk: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sl: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sl: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sr: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sr: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sv: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-sv: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-th: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-th: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-tr: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-tr: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-uk: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-uk: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-vi: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-vi: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-cn: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-cn: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-tw: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-zh-tw: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-src: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-src: PKGSIZE changed from 9206229 to 9206718 (+0%)
packages/core2-64-poky-linux/libadwaita/libadwaita-src: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-staticdev: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita-staticdev: PKGSIZE changed from 10606816 to 0 (-100%)
packages/core2-64-poky-linux/libadwaita/libadwaita-staticdev: PV changed from "1.7.0" to "1.7.2"
packages/core2-64-poky-linux/libadwaita/libadwaita-staticdev: FILELIST: removed all items "/usr/lib/libadwaita-1-internal.a"
packages/core2-64-poky-linux/libadwaita/libadwaita: PKGV changed from 1.7.0 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libadwaita/libadwaita: PV changed from "1.7.0" to "1.7.2"
Changes to packages/core2-64-poky-linux/libadwaita (sysroot):
  /usr/lib/libadwaita-1-internal.a was removed

--===============4247211778447850656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libadwaita/libadwaita-locale-de: PKGSIZE changed from 7569 to 9506 (+26%)
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGSIZE changed from 7089 to 8833 (+25%)
packages/core2-64-poky-linux/libadwaita/libadwaita-locale-ro: PKGSIZE changed from 6537 to 9437 (+44%)
packages/core2-64-poky-linux/libadwaita/libadwaita-staticdev: FILELIST: removed all items "/usr/lib/libadwaita-1-internal.a"
packages/core2-64-poky-linux/libadwaita/libadwaita-staticdev: PKGSIZE changed from 10606816 to 0 (-100%)
Changes to packages/core2-64-poky-linux/libadwaita (sysroot):
  /usr/lib/libadwaita-1-internal.a was removed

--===============4247211778447850656==--

