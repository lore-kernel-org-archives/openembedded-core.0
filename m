Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5365AC3DA6C
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:32 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1239.1715794337483687526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NTzttMJ1;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uoVYBPcw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f7d4fe3ab-77b6ad05-4484-4fc1-87d8-94b5a562f620-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mAdWYrzgDUToj9HDuSr7CoiMCyPIgyLHPC5jzELXCdo=;
	b=NTzttMJ1ADluXEBphDrVDMDdZMVn2kDbfLjR8bhP1u7GS+RyuAvpIk1H/U2koz5D
	a0dF9CMn4vVLF6/mEmBH+Y/yrYPuEDgOLuVPMASxRPro5opNqqyhcIH7kTXr+A8fI0M
	3e3F/yze46PC/ZDUQ+j9GGz2rhyRStyRCeQSybPw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mAdWYrzgDUToj9HDuSr7CoiMCyPIgyLHPC5jzELXCdo=;
	b=uoVYBPcwQurM5MbW12zqHU0L81OBL8UutXXaOqmb3ltQ5L/JBLFnX1Gx5ONR5RrQ
	E/tLDJhbukrjTW5emzezbbtYGBF/4C4JywT4h0N1BaZmZ5xan/dOKLHxg86oupLo558
	KBFL+hvKr9tuQCMs4JifkD0dTdLgPfkcjStFvDj0=
Content-Type: multipart/mixed; boundary="===============0658394997936179114=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 24.0.7 SUCCEEDED
Message-ID: <0101018f7d4fe3ab-77b6ad05-4484-4fc1-87d8-94b5a562f620-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199379

--===============0658394997936179114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *24.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-24.0.5-24.0.7.patch
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
From f5c3aa1715016e922713dee94324a80d43f4f7e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 13:41:07 +0000
Subject: [PATCH] mesa: upgrade 24.0.5 -> 24.0.7

---
 ...1-Revert-meson-do-not-pull-in-clc-for-clover.patch |  4 ++--
 .../files/0001-drisw-fix-build-without-dri3.patch     | 11 ++++-------
 ...meson-misdetects-64bit-atomics-on-mips-clang.patch |  2 +-
 ...ild-check-for-all-linux-host_os-combinations.patch |  4 ++--
 ...glxext-don-t-try-zink-if-not-enabled-in-mesa.patch |  9 +++------
 meta/recipes-graphics/mesa/mesa.inc                   |  2 +-
 .../mesa/{mesa_24.0.5.bb => mesa_24.0.7.bb}           |  0
 7 files changed, 13 insertions(+), 19 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa_24.0.5.bb => mesa_24.0.7.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
index 1711e22585..766f659bce 100644
--- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
@@ -1,4 +1,4 @@
-From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
+From 47c44b843ec7349fd7c2f3313107f972d68e976a Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Fri, 8 Mar 2024 15:53:11 +0100
 Subject: [PATCH] Revert "meson: do not pull in clc for clover"
@@ -18,7 +18,7 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 2db6185..741b5d1 100644
+index d0d9c5a..277093a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -813,6 +813,7 @@ if _opencl != 'disabled'
diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
index ab16152090..1a3f590d57 100644
--- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
+++ b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
@@ -1,7 +1,7 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
+From 37dbddea4215161bf64e5fa4c12826678faf4d8d Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Tue, 6 Feb 2024 09:47:09 +0100
-Subject: [PATCH 1/2] drisw: fix build without dri3
+Subject: [PATCH] drisw: fix build without dri3
 
 commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
 added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
@@ -24,7 +24,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
-index 3d3f752..4b19e2d 100644
+index cbba547..6f07709 100644
 --- a/src/glx/drisw_glx.c
 +++ b/src/glx/drisw_glx.c
 @@ -32,7 +32,9 @@
@@ -45,7 +45,7 @@ index 3d3f752..4b19e2d 100644
     if (pdpyp->zink) {
        bool err;
        psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
-@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
+@@ -1007,6 +1010,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
           goto handle_error;
        }
     }
@@ -53,6 +53,3 @@ index 3d3f752..4b19e2d 100644
  
     glx_config_destroy_list(psc->base.configs);
     psc->base.configs = configs;
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index baa98a0d46..531d3b52bf 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From f2a2e96bb51b207f11d5bb62d3fd21404104b474 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index 7be7d81eeb..6b86a4f72d 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From e8ec6b1cc5e401ba719095722d8b317d755ae613 Mon Sep 17 00:00:00 2001
+From 409953c656ee2c9d8c1a9b7a2bc832503b5b1931 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -19,7 +19,7 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 133fd9a..817861e 100644
+index 8963b31..d0d9c5a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -128,7 +128,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
index 036a0b4945..f729ed487d 100644
--- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
+++ b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
@@ -1,7 +1,7 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
+From 4ac712a8f4faa928bcaf340164f14e34835a0b83 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Tue, 6 Feb 2024 09:47:10 +0100
-Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
+Subject: [PATCH] glxext: don't try zink if not enabled in mesa
 
 Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
 added an automatic zink fallback even when the zink gallium is not
@@ -22,7 +22,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/glx/glxext.c b/src/glx/glxext.c
-index 05c825a..7a06aa9 100644
+index fd53e00..31e8511 100644
 --- a/src/glx/glxext.c
 +++ b/src/glx/glxext.c
 @@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
@@ -37,6 +37,3 @@ index 05c825a..7a06aa9 100644
     }
  #endif /* GLX_USE_DRM */
     if (glx_direct)
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 77e9c80fcb..48ef7c47f1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "38cc245ca8faa3c69da6d2687f8906377001f63365348a62cc6f7fafb1e8c018"
+SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.5.bb b/meta/recipes-graphics/mesa/mesa_24.0.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.5.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.7.bb
-- 
2.44.0


--===============0658394997936179114==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-24.0.5-24.0.7.patch"

RnJvbSBmNWMzYWExNzE1MDE2ZTkyMjcxM2RlZTk0MzI0YTgwZDQzZjRmN2UxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTM6NDE6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhOiB1cGdyYWRlIDI0LjAuNSAtPiAyNC4wLjcKCi0tLQogLi4uMS1SZXZlcnQtbWVzb24tZG8t
bm90LXB1bGwtaW4tY2xjLWZvci1jbG92ZXIucGF0Y2ggfCAgNCArKy0tCiAuLi4vZmlsZXMvMDAw
MS1kcmlzdy1maXgtYnVpbGQtd2l0aG91dC1kcmkzLnBhdGNoICAgICB8IDExICsrKystLS0tLS0t
CiAuLi5tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaCB8
ICAyICstCiAuLi5pbGQtY2hlY2stZm9yLWFsbC1saW51eC1ob3N0X29zLWNvbWJpbmF0aW9ucy5w
YXRjaCB8ICA0ICsrLS0KIC4uLmdseGV4dC1kb24tdC10cnktemluay1pZi1ub3QtZW5hYmxlZC1p
bi1tZXNhLnBhdGNoIHwgIDkgKysrLS0tLS0tCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9t
ZXNhLmluYyAgICAgICAgICAgICAgICAgICB8ICAyICstCiAuLi4vbWVzYS97bWVzYV8yNC4wLjUu
YmIgPT4gbWVzYV8yNC4wLjcuYmJ9ICAgICAgICAgICB8ICAwCiA3IGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9tZXNhL3ttZXNhXzI0LjAuNS5iYiA9PiBtZXNhXzI0LjAuNy5iYn0gKDEwMCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1SZXZlcnQtbWVz
b24tZG8tbm90LXB1bGwtaW4tY2xjLWZvci1jbG92ZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9maWxlcy8wMDAxLVJldmVydC1tZXNvbi1kby1ub3QtcHVsbC1pbi1jbGMtZm9y
LWNsb3Zlci5wYXRjaAppbmRleCAxNzExZTIyNTg1Li43NjZmNjU5YmNlIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLVJldmVydC1tZXNvbi1kby1ub3Qt
cHVsbC1pbi1jbGMtZm9yLWNsb3Zlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS9maWxlcy8wMDAxLVJldmVydC1tZXNvbi1kby1ub3QtcHVsbC1pbi1jbGMtZm9yLWNsb3Zl
ci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDUxZjQxYmVkYTU0MGYwYWU3N2IzNDFkYjAx
YTZkZTgzYzllOTM4YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDdjNDRiODQzZWM3
MzQ5ZmQ3YzJmMzMxMzEwN2Y5NzJkNjhlOTc2YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KIERhdGU6IEZyaSwgOCBNYXIgMjAy
NCAxNTo1MzoxMSArMDEwMAogU3ViamVjdDogW1BBVENIXSBSZXZlcnQgIm1lc29uOiBkbyBub3Qg
cHVsbCBpbiBjbGMgZm9yIGNsb3ZlciIKQEAgLTE4LDcgKzE4LDcgQEAgU2lnbmVkLW9mZi1ieTog
TWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9t
ZXNvbi5idWlsZAotaW5kZXggMmRiNjE4NS4uNzQxYjVkMSAxMDA2NDQKK2luZGV4IGQwZDljNWEu
LjI3NzA5M2EgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBA
IC04MTMsNiArODEzLDcgQEAgaWYgX29wZW5jbCAhPSAnZGlzYWJsZWQnCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWRyaXN3LWZpeC1idWlsZC13aXRo
b3V0LWRyaTMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWRy
aXN3LWZpeC1idWlsZC13aXRob3V0LWRyaTMucGF0Y2gKaW5kZXggYWIxNjE1MjA5MC4uMWEzZjU5
MGQ1NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1k
cmlzdy1maXgtYnVpbGQtd2l0aG91dC1kcmkzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9tZXNhL2ZpbGVzLzAwMDEtZHJpc3ctZml4LWJ1aWxkLXdpdGhvdXQtZHJpMy5wYXRjaApA
QCAtMSw3ICsxLDcgQEAKLUZyb20gNGJkMTVhNDE5ZTg5MmRhODQzNDg5YzM3NGM1OGM1YjI5YzQw
YjVkNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzdkYmRkZWE0MjE1MTYxYmY2NGU1
ZmE0YzEyODI2Njc4ZmFmNGQ4ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvbWFp
biBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgogRGF0ZTogVHVlLCA2IEZlYiAyMDI0IDA5
OjQ3OjA5ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0ggMS8yXSBkcmlzdzogZml4IGJ1aWxkIHdpdGhv
dXQgZHJpMworU3ViamVjdDogW1BBVENIXSBkcmlzdzogZml4IGJ1aWxkIHdpdGhvdXQgZHJpMwog
CiBjb21taXQgMTg4NzM2OGRmNDEgKCJnbHgvc3c6IGNoZWNrIGZvciBtb2RpZmllciBzdXBwb3J0
IGluIHRoZSBrb3BwZXIgcGF0aCIpCiBhZGRlZCBkcmkzX3ByaXYuaCBoZWFkZXIgYW5kIGRyaTNf
Y2hlY2tfbXVsdGlidWZmZXIoKSBmdW5jdGlvbiBpbiBkcmlzdyB0aGF0CkBAIC0yNCw3ICsyNCw3
IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2dseC9kcmlzd19n
bHguYyBiL3NyYy9nbHgvZHJpc3dfZ2x4LmMKLWluZGV4IDNkM2Y3NTIuLjRiMTllMmQgMTAwNjQ0
CitpbmRleCBjYmJhNTQ3Li42ZjA3NzA5IDEwMDY0NAogLS0tIGEvc3JjL2dseC9kcmlzd19nbHgu
YwogKysrIGIvc3JjL2dseC9kcmlzd19nbHguYwogQEAgLTMyLDcgKzMyLDkgQEAKQEAgLTQ1LDcg
KzQ1LDcgQEAgaW5kZXggM2QzZjc1Mi4uNGIxOWUyZCAxMDA2NDQKICAgICBpZiAocGRweXAtPnpp
bmspIHsKICAgICAgICBib29sIGVycjsKICAgICAgICBwc2MtPmhhc19tdWx0aWJ1ZmZlciA9IGRy
aTNfY2hlY2tfbXVsdGlidWZmZXIocHJpdi0+ZHB5LCAmZXJyKTsKLUBAIC0xMDA1LDYgKzEwMDgs
NyBAQCBkcmlzd0NyZWF0ZVNjcmVlbkRyaXZlcihpbnQgc2NyZWVuLCBzdHJ1Y3QgZ2x4X2Rpc3Bs
YXkgKnByaXYsCitAQCAtMTAwNyw2ICsxMDEwLDcgQEAgZHJpc3dDcmVhdGVTY3JlZW5Ecml2ZXIo
aW50IHNjcmVlbiwgc3RydWN0IGdseF9kaXNwbGF5ICpwcml2LAogICAgICAgICAgIGdvdG8gaGFu
ZGxlX2Vycm9yOwogICAgICAgIH0KICAgICB9CkBAIC01Myw2ICs1MywzIEBAIGluZGV4IDNkM2Y3
NTIuLjRiMTllMmQgMTAwNjQ0CiAgCiAgICAgZ2x4X2NvbmZpZ19kZXN0cm95X2xpc3QocHNjLT5i
YXNlLmNvbmZpZ3MpOwogICAgIHBzYy0+YmFzZS5jb25maWdzID0gY29uZmlnczsKLS0tIAotMi40
NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEt
bWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQt
YXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoCmluZGV4IGJhYTk4YTBkNDYuLjUzMWQzYjUyYmYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24t
bWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0
b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDJjYzIxODAw
ZmUyOWY1NjZhZGQ1MjVlNjNmNjE5YzA1MzZkNmU3YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZjJhMmU5NmJiNTFiMjA3ZjExZDViYjYyZDNmZDIxNDA0MTA0YjQ3NCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRl
OiBNb24sIDEzIEphbiAyMDIwIDE1OjIzOjQ3IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29u
IG1pc2RldGVjdHMgNjRiaXQgYXRvbWljcyBvbiBtaXBzL2NsYW5nCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWNoZWNrLWZvci1h
bGwtbGludXgtaG9zdF9vcy1jb21iaW5hdGlvbnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWNoZWNrLWZvci1hbGwtbGludXgtaG9zdF9v
cy1jb21iaW5hdGlvbnMucGF0Y2gKaW5kZXggN2JlN2Q4MWVlYi4uNmI4NmE0ZjcyZCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1j
aGVjay1mb3ItYWxsLWxpbnV4LWhvc3Rfb3MtY29tYmluYXRpb25zLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtY2hlY2stZm9yLWFs
bC1saW51eC1ob3N0X29zLWNvbWJpbmF0aW9ucy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
ZThlYzZiMWNjNWU0MDFiYTcxOTA5NTcyMmQ4YjMxN2Q3NTVhZTYxMyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNDA5OTUzYzY1NmVlMmM5ZDhjMWE5YjdhMmJjODMyNTAzYjViMTkzMSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWly
QGFsaXN0YWlyMjMubWU+CiBEYXRlOiBUaHUsIDE0IE5vdiAyMDE5IDEzOjA0OjQ5IC0wODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiBjaGVjayBmb3IgYWxsIGxpbnV4IGhvc3Rfb3Mg
Y29tYmluYXRpb25zCkBAIC0xOSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZy
YW5jaXMgPGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVz
b24uYnVpbGQKLWluZGV4IDEzM2ZkOWEuLjgxNzg2MWUgMTAwNjQ0CitpbmRleCA4OTYzYjMxLi5k
MGQ5YzVhIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAt
MTI4LDcgKzEyOCw3IEBAIHdpdGhfYW55X29wZW5nbCA9IHdpdGhfb3BlbmdsIG9yIHdpdGhfZ2xl
czEgb3Igd2l0aF9nbGVzMgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
ZmlsZXMvMDAwMi1nbHhleHQtZG9uLXQtdHJ5LXppbmstaWYtbm90LWVuYWJsZWQtaW4tbWVzYS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDItZ2x4ZXh0LWRvbi10
LXRyeS16aW5rLWlmLW5vdC1lbmFibGVkLWluLW1lc2EucGF0Y2gKaW5kZXggMDM2YTBiNDk0NS4u
ZjcyOWVkNDg3ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMv
MDAwMi1nbHhleHQtZG9uLXQtdHJ5LXppbmstaWYtbm90LWVuYWJsZWQtaW4tbWVzYS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAyLWdseGV4dC1kb24tdC10
cnktemluay1pZi1ub3QtZW5hYmxlZC1pbi1tZXNhLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJv
bSA2MjQ5NWViYjk3Nzg2NmM1MmQ1YmVkODQ5OWE1NDdjNDlmMGQ5YmMxIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA0YWM3MTJhOGY0ZmFhOTI4YmNhZjM0MDE2NGYxNGUzNDgzNWEwYjgz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFv
dXJAc21pbGUuZnI+CiBEYXRlOiBUdWUsIDYgRmViIDIwMjQgMDk6NDc6MTAgKzAxMDAKLVN1Ympl
Y3Q6IFtQQVRDSCAyLzJdIGdseGV4dDogZG9uJ3QgdHJ5IHppbmsgaWYgbm90IGVuYWJsZWQgaW4g
bWVzYQorU3ViamVjdDogW1BBVENIXSBnbHhleHQ6IGRvbid0IHRyeSB6aW5rIGlmIG5vdCBlbmFi
bGVkIGluIG1lc2EKIAogQ29tbWl0IDdkOWVhNzdiNDU5ICgiZ2x4OiBhZGQgYXV0b21hdGljIHpp
bmsgZmFsbGJhY2sgbG9hZGluZyBiZXR3ZWVuIGh3IGFuZCBzdyBkcml2ZXJzIikKIGFkZGVkIGFu
IGF1dG9tYXRpYyB6aW5rIGZhbGxiYWNrIGV2ZW4gd2hlbiB0aGUgemluayBnYWxsaXVtIGlzIG5v
dApAQCAtMjIsNyArMjIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBh
L3NyYy9nbHgvZ2x4ZXh0LmMgYi9zcmMvZ2x4L2dseGV4dC5jCi1pbmRleCAwNWM4MjVhLi43YTA2
YWE5IDEwMDY0NAoraW5kZXggZmQ1M2UwMC4uMzFlODUxMSAxMDA2NDQKIC0tLSBhL3NyYy9nbHgv
Z2x4ZXh0LmMKICsrKyBiL3NyYy9nbHgvZ2x4ZXh0LmMKIEBAIC05MDgsOSArOTA4LDExIEBAIF9f
Z2xYSW5pdGlhbGl6ZShEaXNwbGF5ICogZHB5KQpAQCAtMzcsNiArMzcsMyBAQCBpbmRleCAwNWM4
MjVhLi43YTA2YWE5IDEwMDY0NAogICAgIH0KICAjZW5kaWYgLyogR0xYX1VTRV9EUk0gKi8KICAg
ICBpZiAoZ2x4X2RpcmVjdCkKLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9tZXNhL21lc2EuaW5jIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVz
YS5pbmMKaW5kZXggNzdlOWM4MGZjYi4uNDhlZjdjNDdmMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21l
c2EvbWVzYS5pbmMKQEAgLTIyLDcgKzIyLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL21lc2EuZnJl
ZWRlc2t0b3Aub3JnL2FyY2hpdmUvbWVzYS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1SZXZlcnQtbWVzb24tZG8tbm90LXB1bGwtaW4tY2xjLWZvci1jbG92ZXIucGF0Y2gg
XAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzhjYzI0NWNhOGZhYTNjNjlkYTZkMjY4N2Y4
OTA2Mzc3MDAxZjYzMzY1MzQ4YTYyY2M2ZjdmYWZiMWU4YzAxOCIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI3NDU0NDI1ZjFlZDRhNmYxYjViMTA3ZTE2NzJiMzBjODhiMjJlYTBlZmVhMDAwYWUyYzdk
OTZkYjkzZjZjMjZhIgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJtZXNhLSg/UDxw
dmVyPlxkKyhcLlxkKykrKSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21l
c2EvbWVzYV8yNC4wLjUuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhXzI0LjAu
Ny5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL21lc2EvbWVzYV8yNC4wLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL21lc2FfMjQuMC43LmJiCi0tIAoyLjQ0LjAKCg==

--===============0658394997936179114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-24.0.5.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-drisw-fix-build-without-dri3.patch file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch" to "https://mesa.freedesktop.org/archive/mesa-24.0.7.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-drisw-fix-build-without-dri3.patch file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch"
packages/core2-64-poky-linux/mesa: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libegl-mesa-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libegl-mesa: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libegl-mesa: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libgbm-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libgbm-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libgbm: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libgbm: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libgl-mesa-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libgl-mesa: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libgl-mesa: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libglapi-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libglapi-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libglapi: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libglapi: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libgles1-mesa-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libgles1-mesa: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libgles1-mesa: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libgles2-mesa-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libgles2-mesa: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libgles2-mesa: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libgles3-mesa-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libgles3-mesa: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libgles3-mesa: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libglx-mesa-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libglx-mesa: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libglx-mesa: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libopencl-mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libopencl-mesa-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libopencl-mesa: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libopencl-mesa: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libosmesa-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libosmesa-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libosmesa: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libosmesa: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libxatracker-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libxatracker-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/libxatracker: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/libxatracker: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/mesa-dbg: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 253480800 to 253507752 (+0%)
packages/core2-64-poky-linux/mesa/mesa-dbg: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/mesa-dev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/mesa-dev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/mesa-doc: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/mesa-doc: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/mesa-locale: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/mesa-locale: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/mesa-megadriver: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 22995287 to 23003479 (+0%)
packages/core2-64-poky-linux/mesa/mesa-megadriver: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/mesa-src: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/mesa-src: PKGSIZE changed from 153682856 to 153713495 (+0%)
packages/core2-64-poky-linux/mesa/mesa-src: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/mesa-staticdev: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/mesa-staticdev: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/mesa-tools: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/mesa-tools: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 26324869 to 26328965 (+0%)
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "24.0.5" to "24.0.7"
packages/core2-64-poky-linux/mesa/mesa: PKGV changed from 24.0.5 [default] to 24.0.7 [default]
packages/core2-64-poky-linux/mesa/mesa: PV changed from "24.0.5" to "24.0.7"

--===============0658394997936179114==--

