Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EA7C64ED3
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.173810.1692224344757052186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=chWcEA8d;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eSDp/0N2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a006e6875-d767e033-fc26-4828-a64b-ffe3f2b3a1fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EQAS3L7I3cLM1gLZ/w6WKpsHdfDMnl/7TaF4Kf+9IlQ=;
	b=chWcEA8dBAhbPWCR98jOU4mT/PCeWvqeNagvsBntepOeOHLBxi7upoBtlXMYi/75
	DkHzg1Ynh3/CzM6f0ZsmgQP552RNJS4WSPqJf30o3osvd/vYoCoXsgA+nXaTR6M2ZML
	UGvFHX7oPKow9zzgt/bT8Zr49m0tZPDdlgM2WvuY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EQAS3L7I3cLM1gLZ/w6WKpsHdfDMnl/7TaF4Kf+9IlQ=;
	b=eSDp/0N2J5mkH14ksZ/Htr8PBlIocAVUrNv/Z1YEs2PuLCjpIPpTL8ii/5b+KTGM
	8sDEb8KWfQ2x16cXgnfSPdEBfxAZMajI56ALf+bk3tYZ17SeGxRdwTrd4UK6Owcdvfc
	05HKgwbcipKqDvd5FBLdMAp7BRbLToTBcCPQlZBg=
Content-Type: multipart/mixed; boundary="===============0267490515444012117=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.12.0 SUCCEEDED
Message-ID: <0101018a006e6875-d767e033-fc26-4828-a64b-ffe3f2b3a1fc-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186230

--===============0267490515444012117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk4* to *4.12.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.10.5-4.12.0.patch
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
From bd3a90adf631a4c46df98f9ce34f89ee6cf949f8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 11:50:41 +0000
Subject: [PATCH] gtk4: upgrade 4.10.5 -> 4.12.0

---
 .../gtk+/{gtk4_4.10.5.bb => gtk4_4.12.0.bb}   | 40 +++++++++++++++----
 1 file changed, 33 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.5.bb => gtk4_4.12.0.bb} (80%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
similarity index 80%
rename from meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
index 85fff6c61e..c730e869eb 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
@@ -1,3 +1,30 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- gtk/gtk.h
+# +++ gtk/gtk.h
+# @@ -22,4 +22,4 @@
+#   * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
+#   */
+#  
+# -#ifndef __GTK_H__
+# +#pragma once
+# --- gdk/gdk.h
+# +++ gdk/gdk.h
+# @@ -22,4 +22,4 @@
+#   * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
+#   */
+#  
+# -#ifndef __GDK_H__
+# +#pragma once
+# 
+#
+
 SUMMARY = "Multi-platform toolkit for creating GUIs"
 DESCRIPTION = "GTK is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
 set of widgets, GTK is suitable for projects ranging from small one-off projects to complete application suites."
@@ -25,19 +52,18 @@ DEPENDS = " \
 "
 
 LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
-    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
-    file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
-"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://gtk/gtk.h;endline=25;md5=61900d77e8d5bc67cf15ad93de9a3490 \
+                    file://gdk/gdk.h;endline=25;md5=a0fb26c1f6b94e66d148279e192c333f \
+                    file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
+                    "
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9bd5e437e41d48e3d6a224c336b0fd3fd490036dceb8956ed74b956369af609b"
+SRC_URI[sha256sum] = "a6d10829f405b1afc0b65e2a9642c04126a1d1b638d11c6d97426da4f84f1f6f"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.39.2


--===============0267490515444012117==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.10.5-4.12.0.patch"

RnJvbSBiZDNhOTBhZGY2MzFhNGM0NmRmOThmOWNlMzRmODllZTZjZjk0OWY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMTE6NTA6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMTAuNSAtPiA0LjEyLjAKCi0tLQogLi4uL2d0aysve2d0azRfNC4xMC41
LmJiID0+IGd0azRfNC4xMi4wLmJifSAgIHwgNDAgKysrKysrKysrKysrKysrLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdub21lL2d0aysve2d0azRfNC4xMC41LmJiID0+IGd0azRfNC4xMi4wLmJifSAoODAl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMC41LmJiIGIv
bWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjEyLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjEwLjUuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMi4wLmJiCmluZGV4IDg1ZmZm
NmM2MWUuLmM3MzBlODY5ZWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0
azRfNC4xMC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMi4wLmJi
CkBAIC0xLDMgKzEsMzAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBo
YXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBp
cyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0
LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1h
cml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVw
ZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJz
IHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBndGsvZ3RrLmgKKyMgKysr
IGd0ay9ndGsuaAorIyBAQCAtMjIsNCArMjIsNCBAQAorIyAgICogR1RLKyBhdCBmdHA6Ly9mdHAu
Z3RrLm9yZy9wdWIvZ3RrLy4KKyMgICAqLworIyAgCisjIC0jaWZuZGVmIF9fR1RLX0hfXworIyAr
I3ByYWdtYSBvbmNlCisjIC0tLSBnZGsvZ2RrLmgKKyMgKysrIGdkay9nZGsuaAorIyBAQCAtMjIs
NCArMjIsNCBAQAorIyAgICogR1RLKyBhdCBmdHA6Ly9mdHAuZ3RrLm9yZy9wdWIvZ3RrLy4KKyMg
ICAqLworIyAgCisjIC0jaWZuZGVmIF9fR0RLX0hfXworIyArI3ByYWdtYSBvbmNlCisjIAorIwor
CiBTVU1NQVJZID0gIk11bHRpLXBsYXRmb3JtIHRvb2xraXQgZm9yIGNyZWF0aW5nIEdVSXMiCiBE
RVNDUklQVElPTiA9ICJHVEsgaXMgYSBtdWx0aS1wbGF0Zm9ybSB0b29sa2l0IGZvciBjcmVhdGlu
ZyBncmFwaGljYWwgdXNlciBpbnRlcmZhY2VzLiBPZmZlcmluZyBhIGNvbXBsZXRlIFwKIHNldCBv
ZiB3aWRnZXRzLCBHVEsgaXMgc3VpdGFibGUgZm9yIHByb2plY3RzIHJhbmdpbmcgZnJvbSBzbWFs
bCBvbmUtb2ZmIHByb2plY3RzIHRvIGNvbXBsZXRlIGFwcGxpY2F0aW9uIHN1aXRlcy4iCkBAIC0y
NSwxOSArNTIsMTggQEAgREVQRU5EUyA9ICIgXAogIgogCiBMSUNFTlNFID0gIkxHUEwtMi4wLW9u
bHkgJiBMR1BMLTIuMC1vci1sYXRlciAmIExHUEwtMi4xLW9yLWxhdGVyIgotTElDX0ZJTEVTX0NI
S1NVTSA9ICIgXAotICAgIGZpbGU6Ly9DT1BZSU5HO21kNT01ZjMwZjA3MTZkZmRkMGQ5MWViNDM5
ZWJlYzUyMmVjMiBcCi0gICAgZmlsZTovL2d0ay9ndGsuaDtlbmRsaW5lPTI1O21kNT0xZDhkYzBm
Y2NkYmZhMjYyODdhMjcxZGNlODhhZjczNyBcCi0gICAgZmlsZTovL2dkay9nZGsuaDtlbmRsaW5l
PTI1O21kNT1jOTIwY2UzOWRjODhjNmYwNmQzZTdjNTBlMDgwODZmMiBcCi0gICAgZmlsZTovL3Rl
c3RzL3Rlc3RndGsuYztlbmRsaW5lPTI1O21kNT00OWQwNjc3MDY4MWI4MzIyNDY2YjUyZWQxOWQy
OWZiMiBcCi0iCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT01ZjMwZjA3
MTZkZmRkMGQ5MWViNDM5ZWJlYzUyMmVjMiBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9n
dGsvZ3RrLmg7ZW5kbGluZT0yNTttZDU9NjE5MDBkNzdlOGQ1YmM2N2NmMTVhZDkzZGU5YTM0OTAg
XAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vZ2RrL2dkay5oO2VuZGxpbmU9MjU7bWQ1PWEw
ZmIyNmMxZjZiOTRlNjZkMTQ4Mjc5ZTE5MmMzMzNmIFwKKyAgICAgICAgICAgICAgICAgICAgZmls
ZTovL3Rlc3RzL3Rlc3RndGsuYztlbmRsaW5lPTI1O21kNT00OWQwNjc3MDY4MWI4MzIyNDY2YjUy
ZWQxOWQyOWZiMiBcCisgICAgICAgICAgICAgICAgICAgICIKIAogTUFKX1ZFUiA9ICIke0BvZS51
dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9IiwgMil9IgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJndGstKD9QPHB2ZXI+XGQrXC4oXGQqWzAyNDY4XSkrKFwuXGQrKSspXC50YXIueHoiCiAKIFNS
Q19VUkkgPSAiaHR0cDovL2Z0cC5nbm9tZS5vcmcvcHViL2dub21lL3NvdXJjZXMvZ3RrLyR7TUFK
X1ZFUn0vZ3RrLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5YmQ1ZTQzN2U0
MWQ0OGUzZDZhMjI0YzMzNmIwZmQzZmQ0OTAwMzZkY2ViODk1NmVkNzRiOTU2MzY5YWY2MDliIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImE2ZDEwODI5ZjQwNWIxYWZjMGI2NWUyYTk2NDJjMDQxMjZh
MWQxYjYzOGQxMWM2ZDk3NDI2ZGE0Zjg0ZjFmNmYiCiAKIFMgPSAiJHtXT1JLRElSfS9ndGstJHtQ
Vn0iCiAKLS0gCjIuMzkuMgoK

--===============0267490515444012117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 120 recipes from the core2-32 sysroot...done.
Removing 124 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:399ad503473d068c208714d8122e2348c9ee9b22"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 835 Local 627 Mirrors 0 Missed 208 Current 542 (75% match, 84% complete)
Removing 18 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 7 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 543 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 565 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 599 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 714 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 760 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 797 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 800 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 802 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 803 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 805 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 806 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 807 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 808 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 809 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 817 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 819 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 826 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 827 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 828 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 836 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 849 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 850 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 853 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 856 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 858 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1106 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_recipe_qa)
NOTE: Running task 1107 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1137 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa)
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1160 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa)
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1173 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa)
NOTE: Running task 1174 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa)
NOTE: Running task 1176 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1187 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1188 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa)
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1190 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa)
NOTE: Running task 1214 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_write_config)
NOTE: Running task 1220 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 1221 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 1276 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: Running task 1279 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 1297 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: Running task 1314 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa)
NOTE: Running task 1315 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1342 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa)
NOTE: Running task 1343 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: Running task 1349 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: Running task 1350 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_recipe_qa)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 870 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 871 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 872 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 875 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 876 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 879 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 880 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-73-2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1396 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_recipe_qa)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Started
NOTE: Running task 1397 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 1398 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa)
NOTE: Running task 1399 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa: Started
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Started
NOTE: Running task 1425 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: Running task 1435 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: Running task 1436 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_recipe_qa)
NOTE: Running task 1437 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_recipe_qa)
NOTE: Running task 1438 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 1439 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_recipe_qa: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1529 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1530 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_write_config)
NOTE: Running task 1531 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 1534 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: Running task 1571 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_fetch)
NOTE: Running task 1572 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 1573 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1587 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Started
NOTE: Running task 1595 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_write_config)
NOTE: Running task 1596 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 1603 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_recipe_qa)
NOTE: Running task 1604 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_recipe_qa)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: Running task 1624 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: Running task 1625 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa: Started
NOTE: Running task 1664 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: Running task 1678 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1697 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_write_config)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1716 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: Running task 1717 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_recipe_qa unihash changed to c85934a1964225b42b9daa36f2ae5e87cffd8ea02815bd3e767366f6e45c227b
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_write_config: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_recipe_qa: Started
NOTE: recipe gtk4-4.12.0-r0: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 879 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_recipe_qa: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 886 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 887 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 889 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 890 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: Running setscene task 891 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 892 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 893 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 894 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 895 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 896 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 898 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 903 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 904 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_write_config: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: Running task 1730 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1731 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: Running task 1732 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: Running task 1735 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 1739 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1740 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: Running task 1741 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 1743 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 1744 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: Running task 1745 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1746 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1747 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 1748 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_fetch)
NOTE: Running task 1749 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running setscene task 910 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 913 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1750 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 1751 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1752 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 1753 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: Running task 1754 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 1755 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_fetch)
NOTE: Running task 1756 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_fetch)
NOTE: Running task 1757 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_recipe_qa unihash changed to 8571e4cbb0d735cf5736710e7b0c816bffe53a8cf598ee893c3bbdaa6b3ea61a
NOTE: recipe gtk4-4.12.0-r0: task do_write_config: Started
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: Running task 1758 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1759 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 1760 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: recipe gtk4-4.12.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_recipe_qa: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_recipe_qa unihash changed to 5fbd0643202f8095c33c0a26852543555c67f011d4d6fcfd628613baeba6a63d
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1761 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1762 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_fetch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_unpack: Started
NOTE: recipe gtk4-4.12.0-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: Running task 1763 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1764 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_fetch)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_fetch: Started
NOTE: Running task 1778 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: Running task 1779 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1780 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 1781 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 912 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 913 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 914 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 915 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running task 1800 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1801 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: Running task 1802 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 1803 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1804 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_unpack)
NOTE: Running task 1805 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 1806 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 1807 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: Running task 1808 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: Running task 1809 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_unpack)
NOTE: Running task 1810 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_unpack)
NOTE: Running task 1811 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 1822 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa)
NOTE: Running task 1835 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1836 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_fetch: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: Running setscene task 921 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 923 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 927 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 928 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 930 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 931 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: Running task 1842 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.12.0-r0: task do_fetch: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 933 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe adwaita-icon-theme-43-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 936 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Started
NOTE: recipe gtk4-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 937 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: Running setscene task 939 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 940 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 1846 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 1847 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_unpack)
NOTE: Running task 1848 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_unpack)
NOTE: Running task 1849 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1850 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_unpack)
NOTE: Running task 1859 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: recipe iso-codes-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1896 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1928 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1929 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_unpack: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 946 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 947 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running task 1934 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_patch)
NOTE: Running task 1941 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 1949 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 1950 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 1951 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_unpack: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: Running setscene task 948 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running task 1955 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 1956 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 1957 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 1958 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_patch)
NOTE: Running task 1959 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 1960 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 952 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 953 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: Running task 1961 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: Running task 1962 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1963 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1969 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: Running task 1970 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1971 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1972 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: Running task 1973 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: Running task 1974 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 1975 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_patch)
NOTE: Running task 1976 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_patch: Started
NOTE: Running task 1977 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe tiff-4.5.1-r0: task do_patch: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 1978 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: Running setscene task 955 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running task 1979 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_patch: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running setscene task 956 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 958 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 960 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 961 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1982 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 962 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 965 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1984 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_patch)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: Running task 1985 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1986 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: Running task 1987 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1988 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 1989 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1990 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 1991 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 966 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running task 1992 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: Running task 1993 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1994 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1995 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1996 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1997 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 1998 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1999 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 968 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 969 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 970 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 971 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 973 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_recipe_qa_setscene)
NOTE: Running task 2000 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 975 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 976 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 977 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running task 2002 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2003 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2004 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 2015 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 2016 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 2027 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2028 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 979 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 981 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_setscene)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2029 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_deploy_source_date_epoch unihash changed to e7b58a7e7057a7bbfa0f8d5cb94fe475860a3a50d7a5c1a43165d94b027bb6e2
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 977 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 979 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 980 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_unpack: Succeeded
NOTE: Running setscene task 981 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 985 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 986 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 987 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 992 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 995 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 996 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 997 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1000 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1002 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1003 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1005 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1012 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1015 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1020 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1022 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1023 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1025 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1026 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1028 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1030 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1031 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1034 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: Running task 2030 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: Running task 2031 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2032 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Started
NOTE: Running task 2034 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2036 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: Running task 2040 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2041 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2042 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2043 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_patch)
NOTE: Running task 2044 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_configure)
NOTE: Running task 2045 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 2046 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2047 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_configure: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 2053 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1038 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_package_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running setscene task 1041 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1047 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1053 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_configure: Succeeded
NOTE: Running setscene task 1054 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1056 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1057 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1058 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running task 2073 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2083 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_compile)
NOTE: Running setscene task 1062 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running task 2084 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe iso-codes-4.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1064 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1065 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1067 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running task 2085 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1069 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1070 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1072 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1074 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_package_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running task 2087 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1075 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1077 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1078 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1079 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1080 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1081 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1082 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1085 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1086 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1087 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_compile: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2094 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1088 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_deploy_source_date_epoch unihash changed to bcdf86958d34e3c93d774f79518ab4c1197e739df342310f6e6ba2a074e932d3
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1081 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1089 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 2136 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_configure)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_install: Started
NOTE: Running task 2138 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1098 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_configure: Started
NOTE: Running setscene task 1100 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_recipe_qa_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_deploy_source_date_epoch unihash changed to f24e3f405eb42a6d1b2a04c3b518918acd7ecc9a0eb3c633f3f7ae0c298c6d1c
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_patch: Started
NOTE: Running setscene task 1101 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1103 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1104 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1107 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1108 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1110 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1111 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1113 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1114 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1117 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1119 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_package_setscene: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2168 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2169 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_package_write_rpm)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1122 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1125 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running task 2170 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2181 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1129 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_populate_lic: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package: Started
NOTE: Running setscene task 1130 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1132 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1133 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1135 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1137 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1139 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1141 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.12.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1143 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 1144 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_populate_lic unihash changed to ee613ab11766de4409ca4d57af44f7521e13fa81f23b4d72a4a2599797e060b7
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1151 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1152 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1154 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1156 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1157 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1158 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1159 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1160 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1161 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 1162 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1163 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1164 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1166 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1167 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1168 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1169 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1170 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1172 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1173 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1174 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_package_write_rpm unihash changed to 3e242bf79041d26338fe61b8e41412988809feb03747d0c699471e01d4435930
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1181 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1183 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1186 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1187 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1189 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2279 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1191 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1192 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1193 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1195 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1196 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1197 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1200 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2316 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1202 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1204 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1206 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1208 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1209 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1210 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1212 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1214 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1215 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1216 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1217 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1218 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1219 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1220 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1222 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1224 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1225 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1226 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_setscene)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1228 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1229 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1230 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1231 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1232 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1233 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1235 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1236 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1237 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1238 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1239 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1240 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1241 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1242 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1243 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1246 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1250 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1252 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2364 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1256 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1258 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1259 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1261 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1263 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1266 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 2401 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2402 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1269 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2408 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_compile)
NOTE: recipe iso-codes-4.15.0-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1270 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1271 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1272 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1273 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1274 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1275 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1276 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_compile: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2410 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1277 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1279 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1281 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1283 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1285 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1288 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1290 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1291 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1292 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1293 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1295 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1296 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1297 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1298 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1299 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1300 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1301 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1306 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1308 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1310 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1312 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1314 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1315 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1318 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1320 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1321 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1323 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1325 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1326 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1327 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1329 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1331 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1333 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1335 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1336 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1338 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1340 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1341 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1343 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1344 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1346 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1348 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1349 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1350 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1354 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1355 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1357 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1362 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1364 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1365 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1368 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1370 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Running task 2519 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1371 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1373 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 2546 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2547 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1377 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3103 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3104 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3138 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3147 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3148 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3178 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3196 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3244 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3280 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3281 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3333 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3334 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3354 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3355 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3356 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3357 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3366 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3413 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3416 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3417 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3418 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: Running task 3420 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3421 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3436 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 3437 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: Running task 3438 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: Running task 3439 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: Running task 3440 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: Running task 3441 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: Running task 3442 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3443 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3444 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3445 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: Running task 3446 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3447 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3448 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: Running task 3449 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: recipe tiff-4.5.1-r0: task do_configure: Started
NOTE: Running task 3462 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: Running task 3463 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure: Started
NOTE: Running task 3470 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: Running task 3473 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3474 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3475 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: Running task 3476 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3477 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3478 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 3483 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3484 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_collect_spdx_deps)
NOTE: Running task 3485 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3486 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3487 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3488 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: Running task 3491 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3502 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: Running task 3504 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm)
NOTE: Running task 3505 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_collect_spdx_deps: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3506 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3507 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_configure)
NOTE: recipe adwaita-icon-theme-43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: Running task 3508 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3509 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3510 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: Running task 3511 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3512 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: Running task 3513 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3514 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: Running task 3515 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: Running task 3516 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3517 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: Running task 3518 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata)
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_configure: Succeeded
NOTE: Running task 3519 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: Running task 3520 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_compile: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3521 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3522 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3523 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3524 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3525 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: Running task 3526 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3527 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3528 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3529 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3530 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 3531 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3532 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3533 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3534 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: Running task 3535 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_compile)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3536 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: Running task 3537 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_install)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 3538 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3539 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3540 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3541 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Succeeded
NOTE: Running task 3542 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: Running task 3543 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot)
NOTE: Running task 3544 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_package)
NOTE: Running task 3545 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3546 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3547 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 3548 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3549 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3550 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: Running task 3551 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 3552 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3553 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3554 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3555 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: Running task 3556 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3557 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_configure)
NOTE: Running task 3558 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: Running task 3559 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3560 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 3561 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 3562 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3563 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3564 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3565 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3566 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 3567 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 3568 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 3569 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 3570 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3571 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3572 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Succeeded
NOTE: Running task 3573 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3574 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: Running task 3575 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3576 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3577 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3578 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3579 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_compile)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3580 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3581 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3582 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: Running task 3583 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: Running task 3584 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: Running task 3585 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3586 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 3587 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3588 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: Running task 3589 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3590 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3591 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 3592 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3593 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe iso-codes-4.15.0-r0: task do_install: Succeeded
NOTE: Running task 3594 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_populate_sysroot)
NOTE: Running task 3595 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3596 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_write_rpm)
NOTE: Running task 3597 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3598 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe iso-codes-4.15.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3599 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_populate_sysroot unihash changed to beed76ee3571b422f2eb9813100a9304455637fe81dcf1bdabca2e385b0f4bc2
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3600 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3601 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 3602 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3603 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3604 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3605 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3606 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_compile: Succeeded
NOTE: Running task 3607 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_install)
NOTE: recipe adwaita-icon-theme-43-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3608 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3609 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3610 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3611 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3612 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe tiff-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3613 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile: Succeeded
NOTE: Running task 3614 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_compile_ptest_base)
NOTE: recipe tiff-4.5.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3615 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Succeeded
NOTE: Running task 3616 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3617 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install: Started
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3618 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3619 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3620 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3621 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: Running task 3622 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_install_ptest_base)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3623 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_populate_sysroot)
NOTE: Running task 3624 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3625 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3626 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Succeeded
NOTE: Running task 3627 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3628 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3629 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3630 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3631 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: Running task 3632 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libunwind-1.6.2-r0: task do_install: Succeeded
NOTE: Running task 3633 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot)
NOTE: Running task 3634 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libunwind-1.6.2-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3635 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3636 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3637 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_package: Succeeded
NOTE: Running task 3638 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3639 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_configure)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3640 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3641 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3642 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe tiff-4.5.1-r0: task do_install: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: Running task 3643 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_package)
NOTE: Running task 3644 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_populate_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe tiff-4.5.1-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 3645 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: Running task 3646 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3647 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3648 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_package: Succeeded
NOTE: Running task 3649 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3650 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_create_spdx)
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3651 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3652 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3653 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 3654 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3655 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_package: Succeeded
NOTE: Running task 3656 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3657 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3658 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3659 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3660 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Running task 3661 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3662 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3663 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_install: Succeeded
NOTE: Running task 3664 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot)
NOTE: Running task 3665 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3666 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3667 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3668 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3669 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3670 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3671 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3672 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_package: Succeeded
NOTE: Running task 3673 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Failed
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 3673 tasks of which 3253 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vala/0.56.8/temp/log.do_packagedata.2759771
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata) failed with exit code '1'

--===============0267490515444012117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:399ad503473d068c208714d8122e2348c9ee9b22"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 284 Local 98 Mirrors 0 Missed 186 Current 1101 (34% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1132 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 1155 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1174 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1179 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1245 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1303 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1363 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1364 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1365 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1369 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1374 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1602 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_recipe_qa)
NOTE: Running task 1603 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: Running task 1625 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa)
NOTE: Running task 1646 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa)
NOTE: Running task 1674 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa)
NOTE: Running task 1675 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa)
NOTE: Running task 1676 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa)
NOTE: Running task 1703 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_write_config)
NOTE: recipe gcc-cross-powerpc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1716 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 1717 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 1772 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: Running task 1792 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 1811 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: Running task 1812 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Started
NOTE: Running task 1847 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa)
NOTE: Running task 1848 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: Running task 1849 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa: Started
NOTE: Running task 1905 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 1906 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa)
NOTE: Running task 1907 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_recipe_qa)
NOTE: Running task 1908 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: recipe gcc-cross-powerpc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Started
NOTE: Setscene tasks completed
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Started
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2519 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_fetch)
NOTE: Running task 2520 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 2546 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 2553 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 2571 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 2572 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: Running task 2573 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 2591 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2592 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 2616 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: Running task 2632 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 2653 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: Running task 2654 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2695 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 2696 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2697 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2728 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2729 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2730 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_fetch: Succeeded
NOTE: Running task 2731 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2732 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_fetch)
NOTE: Running task 2733 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: Running task 2734 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_unpack)
NOTE: Running task 2735 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 2736 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 2751 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: Running task 2769 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 2770 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: Running task 2784 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_recipe_qa)
NOTE: Running task 2785 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 2786 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_recipe_qa)
NOTE: Running task 2787 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: Running task 2788 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: Running task 2829 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 2830 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 2831 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: Running task 2832 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2833 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2834 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 2835 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 2836 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: Running task 2837 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 2838 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2839 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_fetch: Started
NOTE: Running task 2840 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 2841 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 2842 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2843 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2844 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2845 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2893 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: Running task 2894 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: Running task 2895 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_unpack)
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2896 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2961 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 2962 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2963 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 2964 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_write_config)
NOTE: Running task 2965 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2969 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_recipe_qa)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: Running task 3047 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_write_config)
NOTE: Running task 3048 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3120 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 3121 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_fetch)
NOTE: Running task 3136 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 3137 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: Running task 3138 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 3139 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 3142 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_collect_spdx_deps)
NOTE: Running task 3143 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_fetch)
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3144 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 3170 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_write_config: Started
NOTE: Running task 3171 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: Running task 3193 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3194 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_write_config: Started
NOTE: Running task 3195 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: Running task 3196 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3197 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_patch)
NOTE: Running task 3198 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 3199 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 3200 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 3201 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 3202 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: Running task 3203 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_unpack)
NOTE: Running task 3204 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3205 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 3206 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3207 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3208 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: Running task 3209 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 3210 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3211 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: Running task 3212 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_unpack)
NOTE: Running task 3213 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: Running task 3215 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx)
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 3216 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: Running task 3223 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3224 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 3225 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3226 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 3227 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_patch: Started
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3228 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: Running task 3229 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_fetch)
NOTE: Running task 3230 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: Running task 3232 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3233 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running task 3234 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3235 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 3236 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_patch)
NOTE: Running task 3237 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 3238 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_unpack: Started
NOTE: Running task 3239 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: Running task 3240 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3256 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_write_config)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 3292 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 3293 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3294 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 3295 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3296 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 3297 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_patch)
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3300 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_fetch: Started
NOTE: recipe gtk4-4.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 3334 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa)
NOTE: Running task 3342 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_patch: Started
NOTE: Running task 3343 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3344 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_unpack)
NOTE: Running task 3347 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_write_config: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3380 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3381 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 3382 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3383 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3384 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3385 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe gtk4-4.12.0-r0: task do_write_config: Succeeded
NOTE: Running task 3386 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_unpack: Started
NOTE: Running task 3387 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3388 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: Running task 3404 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3405 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: Running task 3406 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3407 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 3408 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3409 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3410 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 3411 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: Running task 3412 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: Running task 3413 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_patch: Succeeded
NOTE: Running task 3414 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 3415 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3416 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 3420 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3436 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: Running task 3437 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3438 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 3447 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3448 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 3449 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_patch)
NOTE: Running task 3450 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: Running task 3451 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3452 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3453 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3454 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3455 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 3456 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 3457 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3458 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3459 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 3460 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3461 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: Running task 3462 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3463 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 3469 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3470 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3471 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3472 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 3473 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3474 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: Running task 3475 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_patch: Succeeded
NOTE: Running task 3476 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: Running task 3477 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3478 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure: Started
NOTE: Running task 3496 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3532 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3534 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 3535 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3539 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3540 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: Running task 3541 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 3542 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 3543 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3544 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 3545 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe gtk4-4.12.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3546 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3547 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_populate_lic)
NOTE: Running task 3548 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3549 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gtk4-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_populate_lic: Started
NOTE: Running task 3550 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3551 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.12.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_populate_lic unihash changed to ee613ab11766de4409ca4d57af44f7521e13fa81f23b4d72a4a2599797e060b7
NOTE: recipe gtk4-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3552 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-8.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3553 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3554 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3555 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe harfbuzz-8.0.1-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3556 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: Running task 3557 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3558 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3559 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3560 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3561 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3562 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3563 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3564 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3565 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3566 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3567 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3568 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3573 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3574 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3575 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3576 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3577 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: Running task 3578 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3579 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_configure_ptest_base)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3580 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3581 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3582 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3583 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3584 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3585 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3586 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3587 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 3588 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3589 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3590 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3591 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3592 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 3593 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: Running task 3594 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3595 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3596 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3597 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: Running task 3598 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3599 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3600 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 3601 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: Running task 3602 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3603 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: Running task 3604 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3605 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 3606 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: Running task 3607 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3608 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3609 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: Running task 3610 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 3611 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: Running task 3612 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: Running task 3613 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 3614 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 3615 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3616 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3617 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 3618 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 3619 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3620 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3621 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3622 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 3623 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3624 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3625 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3626 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3627 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3628 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: Running task 3629 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3630 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 3631 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3632 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3633 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3634 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: Running task 3635 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3636 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 3637 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3638 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: Running task 3639 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: Running task 3640 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3641 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3642 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_compile: Started
NOTE: Running task 3643 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_write_rpm)
NOTE: Running task 3644 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3645 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3646 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_create_spdx)
NOTE: Running task 3647 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3648 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3649 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 3650 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3651 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3652 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3653 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile: Succeeded
NOTE: Running task 3654 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_compile_ptest_base)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3655 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3656 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3657 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3658 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3659 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install: Succeeded
NOTE: Running task 3660 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3661 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_populate_sysroot)
NOTE: Running task 3662 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3663 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3664 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3665 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3666 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3667 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe tiff-4.5.1-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3668 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3669 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3670 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3671 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3672 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3673 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3674 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3675 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3676 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3677 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3678 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3679 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3680 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe tiff-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 3681 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_package)
NOTE: Running task 3682 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3683 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3684 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_package: Succeeded
NOTE: Running task 3685 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata: Started
NOTE: Running task 3686 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3687 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3688 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3689 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3690 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Running task 3691 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_install)
NOTE: recipe vala-0.56.8-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3692 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe vala-0.56.8-r0: task do_install: Succeeded
NOTE: Running task 3693 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot)
NOTE: Running task 3694 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3695 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3696 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3697 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3698 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3699 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3700 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3701 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3702 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe vala-0.56.8-r0: task do_package: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: Running task 3703 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Failed
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_compile: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 3703 tasks of which 3338 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vala/0.56.8/temp/log.do_packagedata.2502211
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata) failed with exit code '1'

--===============0267490515444012117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gtk4/gtk4-dbg: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 29692808 to 30645128 (+3%)
packages/core2-32-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.1000.5", added "/usr/bin/.debug/gtk4-rendernode-tool /usr/lib/.debug/libgtk-4.so.1.1200.0"
packages/core2-32-poky-linux/gtk4/gtk4-dev: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 13911710 to 14509752 (+4%)
packages/core2-32-poky-linux/gtk4/gtk4-dev: FILELIST: removed "/usr/include/gtk-4.0/unix-print/gtk/gtkprinter.h /usr/include/gtk-4.0/gtk/gtkpapersize.h /usr/include/gtk-4.0/gtk/gtkprintcontext.h /usr/include/gtk-4.0/unix-print/gtk/gtkunixprint-autocleanups.h /usr/include/gtk-4.0/unix-print/gtk/gtkprintjob.h /usr/include/gtk-4.0/gtk/gtkprintoperationpreview.h /usr/include/gtk-4.0/unix-print/gtk/gtkpagesetupunixdialog.h /usr/include/gtk-4.0/gtk/gtkprintsettings.h /usr/include/gtk-4.0/gdk/gdkpixbuf.h /usr/include/gtk-4.0/unix-print/gtk/gtkprintunixdialog.h /usr/include/gtk-4.0/gtk/gtkprintoperation.h /usr/include/gtk-4.0/gtk/gtkpagesetup.h /usr/include/gtk-4.0/gdk/gdkversionmacros.h", added "/usr/include/gtk-4.0/gdk/version/gdk-visibility.h /usr/include/gtk-4.0/gtk/print/gtkprintoperationpreview.h /usr/include/gtk-4.0/unix-print/gtk/print/gtkprintjob.h /usr/include/gtk-4.0/unix-print/gtk/print/gtkpagesetupunixdialog.h /usr/include/gtk-4.0/gtk/gtkscrollinfo.h /usr/include/gtk-4.0/gtk/pri
 nt/gtkprintoperation.h /usr/include/gtk-4.0/gtk/print/gtkpagesetup.h /usr/include/gtk-4.0/gdk/version/gdkversionmacros.h /usr/include/gtk-4.0/gtk/print/gtkprintsettings.h /usr/include/gtk-4.0/gtk/print/gtkpapersize.h /usr/include/gtk-4.0/gtk/gtkcolumnviewcell.h /usr/include/gtk-4.0/gtk/gtklistheader.h /usr/include/gtk-4.0/gdk/gdkdragsurfacesize.h /usr/include/gtk-4.0/gtk/gtkcolumnviewrow.h /usr/include/gtk-4.0/unix-print/gtk/print/gtkprintunixdialog.h /usr/include/gtk-4.0/gtk/gtksectionmodel.h /usr/include/gtk-4.0/gdk/deprecated/gdkpixbuf.h /usr/include/gtk-4.0/gdk/gdkgltexturebuilder.h /usr/include/gtk-4.0/unix-print/gtk/print/gtkprinter.h /usr/include/gtk-4.0/gtk/print/gtkprintcontext.h"
packages/core2-32-poky-linux/gtk4/gtk4-doc: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PKGSIZE changed from 102264 to 102212 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PKGSIZE changed from 101330 to 100979 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PKGSIZE changed from 101601 to 101426 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PKGSIZE changed from 116373 to 121826 (+5%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PKGSIZE changed from 92854 to 95216 (+3%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PKGSIZE changed from 101084 to 104309 (+3%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PKGSIZE changed from 102633 to 107327 (+5%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PKGSIZE changed from 96951 to 96754 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGSIZE changed from 145745 to 152628 (+5%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PKGSIZE changed from 103222 to 103158 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PKGSIZE changed from 100319 to 100145 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PKGSIZE changed from 98817 to 99856 (+1%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PKGSIZE changed from 122465 to 127922 (+4%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PKGSIZE changed from 100156 to 99306 (-1%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PKGSIZE changed from 121812 to 121330 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PKGSIZE changed from 98141 to 97969 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PKGSIZE changed from 99204 to 100883 (+2%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PKGSIZE changed from 121773 to 127526 (+5%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PKGSIZE changed from 104077 to 108565 (+4%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PKGSIZE changed from 94274 to 95973 (+2%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-src: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 38196707 to 40261449 (+5%)
packages/core2-32-poky-linux/gtk4/gtk4-src: FILELIST: directory renamed /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/cursor -> /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/cursor, directory renamed /usr/src/debug/gtk4/4.10.5-r0/gtk/deprecated -> /usr/src/debug/gtk4/4.12.0-r0/gtk/deprecated, directory renamed /usr/src/debug/gtk4/4.10.5-r0/gdk/x11 -> /usr/src/debug/gtk4/4.12.0-r0/gdk/x11, directory renamed /usr/src/debug/gtk4/4.10.5-r0/gsk/gl -> /usr/src/debug/gtk4/4.12.0-r0/gsk/gl, directory renamed /usr/src/debug/gtk4/4.10.5-r0/gtk/a11y -> /usr/src/debug/gtk4/4.12.0-r0/gtk/a11y, directory renamed /usr/src/debug/gtk4/4.10.5-r0/modules/media -> /usr/src/debug/gtk4/4.12.0-r0/modules/media, directory renamed /usr/src/debug/gtk4/4.10.5-r0/modules/printbackends -> /usr/src/debug/gtk4/4.12.0-r0/modules/printbackends, directory renamed /usr/src/debug/gtk4/4.10.5-r0/gtk/a11y/atspi -> /usr/src/debug/gtk4/4.12.0-r0/gtk/a11y/atspi, directory renamed /usr/src/debug/gtk4/4.10.5-r0/gtk/roaring -> /usr/sr
 c/debug/gtk4/4.12.0-r0/gtk/roaring, directory renamed /usr/src/debug/gtk4/4.10.5-r0/gtk/timsort -> /usr/src/debug/gtk4/4.12.0-r0/gtk/timsort, directory renamed /usr/src/debug/gtk4/4.10.5-r0/gdk/loaders -> /usr/src/debug/gtk4/4.12.0-r0/gdk/loaders, directory renamed /usr/src/debug/gtk4/4.10.5-r0/gtk/css -> /usr/src/debug/gtk4/4.12.0-r0/gtk/css, removed "/usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpaned.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfixed.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfixed.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpaned.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdksurface-wayland.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdksurface-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkkineticscrollingprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskdiffprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintbackend.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkglobals.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkiconcachevalidator.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmountoperation-x11.c /usr/sr
 c/debug/gtk4/4.10.5-r0/gdk/gdkevents.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkevents.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkflattenlistmodel.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpipeiostream.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkflattenlistmodel.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssselector.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpopovermenubar.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsseasevalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpopovermenubar.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkapplication-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextviewchildprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssstylechange.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpathbar.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkistringprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmodelbutton.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcenterbox.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknoselection.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/action-editor.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/a
 ction-holder.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/action-holder.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/action-editor.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcenterbox.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknoselection.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsslineheightvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdksnapshotprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksnapshotprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwidgetpaintableprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdktoplevel-wayland-private.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfontchooserwidgetprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdevicetoolprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmagnifier.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstackswitcher.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkancolortextpipeline.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkmarshalers.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmarshalers.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstackswitcher.c /usr/sr
 c/debug/gtk4/4.10.5-r0/gdk/gdkmarshalers.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmarshalers.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkprofiler.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskprofiler.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorpickerkwinprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcontentformats.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorpickerportal.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcontentformats.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gtk-shell-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/xdg-shell-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistitemfactoryprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkorientable.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkorientable.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/eventrecording.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/startrecording.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/eventrecording.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/startrecording.h /usr/src/debug/gtk4/4.10.5-r0/gtk/g
 tkkineticscrolling.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanimage.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksettings.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksettings.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkspinbutton.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsscalcvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/xdg-activation-v1-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkspinbutton.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssdimensionvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintoperation-unix.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwindowprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpagesetupunixdialog.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpagesetupunixdialog.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextbtreeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/list-data.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkframetimings.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/tree-data.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkframetimings.c /usr/src/debug/gtk4/4.10.5-r0/gtk
 /inspector/list-data.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkiconthemeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/tree-data.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssnode.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpopuplayout.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssinheritvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssinitialvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/inspectoroverlay.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpopuplayout.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssstyleproperty.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/inspectoroverlay.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkdrop-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpointerfocus.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/window.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmountoperationprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/window.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdirectorylist.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdirectorylist.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gt
 kapplicationimpl.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksizegroup-private.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssnodedeclaration.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkadjustment.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkadjustment.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechoosererrorstack.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdktoplevel-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/a11y.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/init.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/logs.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/menu.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/xdg-output-unstable-v1-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/a11y.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/init.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/logs.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/menu.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistviewprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextviewprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkplacesv
 iewprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexttag.h /usr/src/debug/gtk4/4.10.5-r0/gtk/xdp-dbus.h /usr/src/debug/gtk4/4.10.5-r0/tools/gtk-builder-tool-enumerate.c /usr/src/debug/gtk4/4.10.5-r0/gtk/xdp-dbus.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexttag.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdragsource.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexthandleprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolordialogbutton.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdragsource.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolordialogbutton.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/css-editor.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssnodeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/css-editor.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexttagtableprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkwaylanddisplay.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmagnifierprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsspositionvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkflowbox.h /usr/src/debug/g
 tk4/4.10.5-r0/gdk/wayland/gdkdrag-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkflowbox.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssbgsizevalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskroundedrectprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagecrossfadeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskcairoblurprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmodules.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewlayout.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklabelprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/prop-list.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmediacontrols.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdbusgenerated.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmediacontrols.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsstransformvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/prop-list.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdbusgenerated.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwidgetfocus.c /usr/src/debug/gtk4/4.10.5-r0/gtk/language-names.c /usr/src/debug/gtk4/4.
 10.5-r0/gtk/gtklistbox.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutsshortcutprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/language-names.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistbox.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkvulkancontext.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssfiltervalue.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkvulkancontext.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdebug.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkmonitor.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskdebug.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkmonitor.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkexpression.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcontentdeserializer.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcontentdeserializer.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkexpression.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgestureswipeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexttypesprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechooserce
 llprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgestureclickprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagerecolorprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/keyboard-shortcuts-inhibit-unstable-v1-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/primary-selection-unstable-v1-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontrollerkey.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintvflparser.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssrepeatvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontrollerkey.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/focusoverlay.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkplacessidebar.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkseat-wayland.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/focusoverlay.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkseat-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbookmarklist.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkspinner.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/graphdata.c /usr/src/debug
 /gtk4/4.10.5-r0/gtk/gtkwindowcontrols.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrenderborderprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/graphdata.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkspinner.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbookmarklist.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwindowcontrols.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkemojicompletion.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrangeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpasswordentryprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimcontextwayland.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkemojicompletion.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutactionprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimcontextwayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturedrag.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturezoom.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstacksidebar.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktogglebutton.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktogglebutton.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gt
 kstacksidebar.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturedrag.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturezoom.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanblurpipeline.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkantextpipeline.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprinter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprinter.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdrag.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkjoinedmenu.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknomediafileprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpanedhandleprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdrag.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfontchooserdialogprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssstaticstyleprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktestatcontext.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagevalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/tools/gtk-launch.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkslicelistmodel.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcontentproviderprivate.
 h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkslicelistmodel.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccessiblevaluestatic.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprivate.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskprivate.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkalertdialog.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpadcontroller.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkalertdialog.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpadcontroller.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskglshader.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskglshader.h /usr/src/debug/gtk4/4.10.5-r0/gtk/text-input-unstable-v3-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdevicetool.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssenumvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkkeys.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdevicetool.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkkeys.h /usr/src/debug/gtk4/4.10.5
 -r0/gtk/gtkfilterlistmodel.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkdisplay-wayland.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilterlistmodel.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkdisplay-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknative.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknative.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutsgroup.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkactionhelperprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutsgroup.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaboutdialog.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmenutracker.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaboutdialog.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkjoinedmenuprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturepan.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkactionbar.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpopover.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturepan.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmediafileprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpopover.h /usr/src/debug/gtk4
 /4.10.5-r0/gtk/gtkactionbar.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktypebuiltins.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktypebuiltins.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkframeclock.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanglyphcache.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkframeclock.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechooserdialog.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gskpangoprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpangoprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccessiblevalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagescaled.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorchooserwidget.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimageinvalidprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmountoperation.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintoperation.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmountoperation.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintoperation.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextlayoutprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vul
 kan/gskvulkanrendererprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrevealer.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkancrossfadepipeline.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrevealer.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuilder-menus.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkroundedboxprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssstringvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewtitle.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimageicontheme.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistitemmanagerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcontentserializer.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/misc-info.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/type-info.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcontentserializer.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssnodestylecache.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/misc-info.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/type-info.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssvalueprivate.h /usr/src/deb
 ug/gtk4/4.10.5-r0/gtk/gdkpixbufutils.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbitmaskprivateimpl.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkrectangle.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkrectangle.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagefallback.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkmemorytexture.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkmemorytexture.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssanimation.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkiconhelper.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkapplicationwindow.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprinteroptionwidget.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechoosernative.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprinteroptionwidget.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkapplicationwindow.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolordialog.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrenderbackgroundprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklabel.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsskeyframes.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkc
 olordialog.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcoloreditor.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorpicker.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorswatch.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklabel.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimmodule.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcontentproviderimpl.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcontentproviderimpl.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimageprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkmemoryformatprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/idle-inhibit-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkkeymap-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkdragsurface-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkpopup-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksortlistmodel.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistlistmodel.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksortlistmodel.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimageurlprivate.h /usr/src/debug
 /gtk4/4.10.5-r0/gtk/gtkpapersize.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkentryprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintexpressionprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpapersize.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmultifilter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuildableprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanpushconstantsprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssbgsizevalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssfontvariationsvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmultisorter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmultifilter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmultisorter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknativedialogprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturesingleprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextlinedisplaycacheprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewcolumn.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewcolumn.c /usr/src/debug/gtk4/4.10.5-r0/gdk/waylan
 d/xdg-foreign-unstable-v2-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagepaintable.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/resource-list.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/resource-list.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfixedlayout.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknomediafile.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpanedhandle.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextbufferprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkantexturepipelineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfixedlayout.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskglshaderprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/pointer-gestures-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkglcontext.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkatcontext.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimcontext.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkglcontext.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkatcontext.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkboolfilter.h /usr/src
 /debug/gtk4/4.10.5-r0/gtk/gtkimcontext.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkboolfilter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprivatetypebuiltins.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprivatetypebuiltins.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/primary-selection-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrendernodepaintableprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagelinear.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbinlayout.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkboxlayout.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbinlayout.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkboxlayout.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanimageprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkframeclockprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintcontext.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintoperation-portal.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdropprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdropprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistitem
 manager.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintcontext.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintoperation-portal.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkplacesviewrow.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktextureprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgestureprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktooltipwindowprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechooserentry.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpopovercontent.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkseparator.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssfiltervalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkseparator.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechooserentry.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstyleprovider.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstyleprovider.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkseatprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrootprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksearchbar.h /usr/src/debug/gtk4/
 4.10.5-r0/gtk/gtkcssimageconicprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksortkeysprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksearchbar.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/visual.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/visual.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechooserprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/idle-inhibit-unstable-v1-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextattributesprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/tablet-unstable-v2-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssrepeatvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksearchentryprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontrollerlegacy.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontrollerlegacy.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkapplaunchcontext-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilethumbnail.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontrollerfocus.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilethum
 bnail.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontrollerfocus.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkscrolledwindow.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkscrolledwindow.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkiconcache.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanrenderer.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssstyle.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdk.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanrenderer.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechooserutils.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechooserutils.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssanimatedstyle.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksearchengine.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimageconic.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssstyleprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksizegroup.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksizegroup.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gsettings-mapping.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsstransitionprivate.h /usr/src/debug/gtk4/4.
 10.5-r0/gtk/gsettings-mapping.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprogressbar.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkclipboard.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprogressbar.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkclipboard.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkiconcachevalidatorprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintunixdialog.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontrollerscroll.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintunixdialog.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechoosernativeportal.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontrollerscroll.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdebugprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskdebugprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbutton.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksizerequest.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkancrossfadepipelineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbutton.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksizerequest.h /usr/src/debug/gtk4/4.10.5-r0/
 gtk/gtkshortcutmanager.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkopenuriportal.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuilderscope.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutmanager.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuilderscope.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuttonprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkopenuriportal.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcountingbloomfilterprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssselectorprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrecentmanager.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrecentmanager.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistitemfactory.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssbordervalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistitemfactory.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechoosernativeprivate.h /usr/src/debug/gtk4/4.10.5-r0/tools/updateiconcache.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechooserwidgetprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdrawcontextprivate.h /usr/src/debu
 g/gtk4/4.10.5-r0/gtk/gtknotebook.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknotebook.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkvulkancontextprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/xdg-foreign-unstable-v1-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkapplication.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkapplication.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwindowhandle.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwindowhandle.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkadjustmentprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkcairocontext-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/measuregraph.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/measuregraph.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkcairocontext-wayland.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssfontvariationsvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsstypesprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstyleanimation.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkgl.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkroundedbox
 .c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/highlightoverlay.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkallocatedbitmask.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktestutils.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/xdg-shell-unstable-v6-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/highlightoverlay.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktestutils.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkkeyuni.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutssection.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutssection.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturerotateprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskrendernodeparser.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkmonitorprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktoplevelsize.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstylecascade.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktoplevelsize.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpopovermenu.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagevalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpopovermenu.c 
 /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsspositionvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmenusectionbox.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksingleselection.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklayoutmanagerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktypes.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gsktypes.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktypes.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksingleselection.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssfontfeaturesvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuiltinicon.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbox.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbox.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuilderprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkexpander.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkexpander.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdropcontrollermotion.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdropcontrollermotion.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewcolumnprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkc
 onstraintsolver.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcustomfilter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcustomsorter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturelongpress.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcustomfilter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstringfilter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstringsorter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcustomsorter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturelongpress.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstringfilter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstringsorter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksorterprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkenums.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskenums.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkenums.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintoperationpreview.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklinkbutton.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkhsla.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkrgba.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpasswordentrybuffer.c /usr/
 src/debug/gtk4/4.10.5-r0/gtk/gtkprintoperationpreview.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkiconcacheprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktrashmonitor.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkrgba.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklinkbutton.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpasswordentrybuffer.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/gtkdataviewer.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/xdg-foreign-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/gtkdataviewer.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdragicon.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdragicon.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssshadowvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanblendmodepipelineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkapplicationaccelsprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksearchenginemodel.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkselectionfiltermodel.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkselectionfiltermodel.c /
 usr/src/debug/gtk4/4.10.5-r0/gtk/gtksidebarrow.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksorter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksorter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrenderlayout.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkmonitor-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkancolorpipeline.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextbtree.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksecurememoryprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkmonitor-wayland.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssunsetvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/xdg-activation-v1-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcairocontext.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcairocontext.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstack.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstack.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaspectframe.c /usr/src/debug/gtk4/4.10.5-r0
 /gtk/gtkdropdown.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaspectframe.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdropdown.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskrendererprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktypefuncs.inc /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprogresstracker.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuilderlistitemfactory.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuilderlistitemfactory.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccessibleprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktoplevelprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkglcontextprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkatcontextprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimcontextprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprogresstrackerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistbaseprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssshorthandproperty.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkactionmuxer.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkwaylandmonitor.h /usr/src/debug/gtk4/4.10
 .5-r0/gdk/gdkpaintable.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpaintable.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintsolverprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/recorder.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkborder.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdroptargetasync.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkborder.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdroptargetasync.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/recorder.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdisplaymanager.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkemojichooser.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkvideo.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcairo.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkancolorpipelineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkwaylandsurface.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdisplaymanager.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkemojichooser.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkvideo.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcairo.h /usr/src/debug/gtk4/4
 .10.5-r0/gdk/gdkcursor.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcursor.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwidgetprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/actions.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/actions.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/css-node-tree.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontrollermotion.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/css-node-tree.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontrollermotion.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktooltipwindow.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkinscriptionprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmaplistmodel.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmaplistmodel.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsstransientnodeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssarrayvalue.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkdevice-wayland-private.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutlabel.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutlabel.c /usr/src/debug/g
 tk4/4.10.5-r0/gtk/gtkapplicationprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpagesetup.c /usr/src/debug/gtk4/4.10.5-r0/gtk/paper_names_offsets.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpagesetup.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssdimensionvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksearchenginemodelprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwidgetpaintable.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwidgetpaintable.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistitemwidget.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistlistmodelprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/renderrecording.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkentrybuffer.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkentrybuffer.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/renderrecording.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexthistoryprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewcellprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcoloreditorprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorpick
 erprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorswatchprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexttypes.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintbackendprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktoplevellayout.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextchild.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwindow.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktoplevellayout.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskdiff.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssproviderprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextchild.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwindow.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsscolorvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgrid.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgrid.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechooserwidget.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanpushconstants.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturestylus.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturestylus.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkactio
 nobserver.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpipeiostreamprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsseasevalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssbordervalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewtitleprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcalendar.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcalendar.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfontchooserwidget.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutcontrollerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/object-tree.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/object-tree.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklayoutchild.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklayoutchild.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkwaylandpopup.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextsegmentprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexthandle.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprinteroptionset.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprinteroptionset.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssim
 ageradial.c /usr/src/debug/gtk4/4.10.5-r0/gtk/fnmatch.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmenubutton.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmain.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstrainttypesprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmain.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmenubutton.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktreeexpander.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexthistory.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktreeexpander.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktexturedownloaderprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkclipboard-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanboxshadowpipelineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkclipboard-wayland.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsscornervalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutswindow.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsscalcvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksho
 rtcutswindow.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsstransientnode.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcuttrigger.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcuttrigger.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkviewport.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkviewport.h /usr/src/debug/gtk4/4.10.5-r0/gdk/filetransferportalprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcheckbutton.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkapplicationaccels.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcheckbutton.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/server-decoration-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdksurface.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkframe.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrbtreeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkframe.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdksurface.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpointerfocusprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskrendernode.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimcontextsimple.h /usr/src/debug/gtk4/
 4.10.5-r0/gtk/gtkrendericon.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimcontextsimple.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskrendernode.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksizerequestcacheprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdroptarget.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdroptarget.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssshorthandpropertyimpl.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimageinvalid.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/size-groups.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkactionobservable.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/size-groups.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdeviceprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkactionmuxerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/tablet-unstable-v2-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanpipelineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstyleproperty.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkresources.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskresources.h /usr/s
 rc/debug/gtk4/4.10.5-r0/gtk/gtkresources.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkresources.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskresources.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkresources.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexttagtable.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexttagtable.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkarrayimpl.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkinscription.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkinscription.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistitem.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkclipboardprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistitem.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssshadowvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturedragprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturezoomprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextbuffer.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkheaderbar.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextbuffer.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkheaderbar.h /usr/src/debug/gtk4/4.10.5-r0/gt
 k/gtkoverlaylayout.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkoverlaylayout.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkurilauncher.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkurilauncher.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/resource-holder.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnlistitemfactoryprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/resource-holder.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturelongpressprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmessagedialog.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpropertylookuplistmodelprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdisplayprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/controllers.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilesystemmodel.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/controllers.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccessiblevalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpopupprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgestureswipe.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprinterprivate.
 h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgestureswipe.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgestureclick.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorplane.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorscale.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorutils.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorutils.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgestureclick.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimmulticontext.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpopovermenuprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintvflparserprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimmulticontext.h /usr/src/debug/gtk4/4.10.5-r0/gdk/filetransferportal.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkentry.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkquery.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/prop-editor.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/strv-editor.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkentry.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkquery.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/prop-editor.
 h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/strv-editor.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/recording.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdisplay.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/recording.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdisplay.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintoperation-private.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewcell.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrenderborder.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktestatcontextprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimagedefinitionprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilelauncher.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilelauncher.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkplacesviewrowprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkvulkancontext-wayland.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssunsetvalue.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkvulkancontext-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdragsurfaceprivate.h /usr/src/debug/gtk4/4.10.5-r
 0/gdk/gdkdragprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorplaneprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorscaleprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanclipprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutsshortcut.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnlistitemfactory.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuildable.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutsshortcut.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuildable.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintsettings.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintsettings.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssboxesimplprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkancommandpoolprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcustomlayout.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcustomlayout.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskrenderer.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechoosercell.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskrenderer.h /usr/src/debug/gtk4/4.10.5-r0/gt
 k/gtkshortcutswindowprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwidget.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwidget.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkapplication-x11.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpathbarprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraint.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkwaylanddevice.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraint.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfontdialog.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccessibleattributesetprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfontdialog.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgizmo.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgridview.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkancommandpool.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdevice.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdevice.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgridview.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccelgroupprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkwindowgroup.c /usr/src/debug/gtk4/4.10.5-r0/g
 tk/gtkwindowgroup.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkkeysprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskroundedrect.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssenumvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbookmarksmanager.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskroundedrect.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkscalerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorchooserdialog.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktexturedownloader.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkgltexture.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintjob.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpixbuf.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccessiblerangeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkgltexture.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintjob.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktexturedownloader.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpixbuf.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsslookup.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkancolortextpipelineprivate.h /usr/src/debug/gt
 k4/4.10.5-r0/gtk/gtkshortcut.h /usr/src/debug/gtk4/4.10.5-r0/tools/gtk-builder-tool-preview.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcut.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkactionhelper.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkscrollable.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkscrollable.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklayoutmanager.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrendernodepaintable.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/keyboard-shortcuts-inhibit-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklayoutmanager.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkplacessidebarprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkicontheme.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkicontheme.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpasswordentry.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/wm-button-layout-translation.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/wm-button-layout-translation.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpasswordentry.c /usr/src/debug/gtk4/4.10.5-r0
 /gdk/wayland/gdkcursor-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/magnifier.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/magnifier.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsswidgetnodeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorpickershellprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfontchooserdialog.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimageiconthemeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagepaintableprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbitset.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbitset.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanborderpipelineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkaneffectpipelineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkselectionmodel.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssarrayvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkselectionmodel.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeditable.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/baselineoverlay.h /usr/src/debug/gtk4/4.10.5
 -r0/gtk/gtktextsegment.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkmemorytextureprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeditable.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/baselineoverlay.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkscrollbar.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprinteroption.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkscrollbar.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprinteroption.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpopovermenubarprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcursorprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfontchooserutils.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfontchooserutils.h /usr/src/debug/gtk4/4.10.5-r0/gtk/text-input-unstable-v3-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccessibleattributeset.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextchildprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/clipboard.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/clipboard.c /usr/src/debug/gtk4
 /4.10.5-r0/gsk/gskrendernodeparserprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontrollerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkframeclockidleprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssnumbervalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpopup.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/updatesoverlay.c /usr/src/debug/gtk4/4.10.5-r0/tools/gtk-builder-tool-validate.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkwaylandseat.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpopup.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkdevicepad-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/updatesoverlay.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkscalebutton.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkscalebutton.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknativeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfiledialog.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfiledialog.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksymbolicpaintable.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimage.c /usr/src/deb
 ug/gtk4/4.10.5-r0/gtk/gtkrange.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksymbolicpaintable.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimage.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrange.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilesystemmodelprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkprimary-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextattributes.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkprimary-wayland.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkwaylandtoplevel.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextutilprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssanimationprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gtk-shell-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/xdg-shell-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkprivate-wayland.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpango.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/fpsoverlay.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextutil.c /u
 sr/src/debug/gtk4/4.10.5-r0/gtk/inspector/fpsoverlay.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkpango.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gskpango.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpango.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewsorter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewsorter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmultiselection.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsskeyframesprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanrenderpassprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmultiselection.c /usr/src/debug/gtk4/4.10.5-r0/gtk/open-type-layout.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimcontextsimpleseqs.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/pointer-gestures-unstable-v1-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextviewchild.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/server-decoration-protocol.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdevicepadprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkmemoryformat.c /usr/src/debug/gtk4/4.10.5-r0/gs
 k/vulkan/gskvulkanbuffer.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanmemory.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanrender.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanshader.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilechoosererrorstackprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gdkpixbufutilsprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklevelbar.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklevelbar.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknativedialog.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknativedialog.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gsktransform.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gsktransform.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstylepropertyprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextlinedisplaycache.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistbase.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmenutrackeritem.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktexture.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkflowboxprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesture.
 h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpicture.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistbase.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktexture.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesture.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpicture.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimageurl.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsstransition.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintexpression.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskcairoblur.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanlineargradientpipelineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkantexturepipeline.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanblendmodepipeline.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssstaticstyle.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcustompaperunixdialog.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcustompaperunixdialog.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgridlayout.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgridlayout.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssstringvalu
 eprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrenderbackground.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturestylusprivate.h /usr/src/debug/gtk4/4.10.5-r0/tools/gtk-query-settings.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkactionobserverprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsswidgetnode.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilefilter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfilefilter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsspalettevalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutaction.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutaction.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkactionable.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdrop.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdrop.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkactionable.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdrop.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkactionobservableprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmenutrackeritemprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturesingle.h /usr/src/debug/gtk4
 /4.10.5-r0/gdk/gdkseat.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkroot.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktext.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkseat.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkroot.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturesingle.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktext.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskrendernodeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrendericonprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktooltip.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktooltip.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturepanprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/shortcuts.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/shortcuts.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstyleanimationprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkprofilerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskprofilerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintguideprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssnodedeclarationprivate.h /usr/src/debug/gtk4/4.10
 .5-r0/gtk/inspector/layoutoverlay.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/layoutoverlay.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssanimatedstyleprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkeventsource.c /usr/src/debug/gtk4/4.10.5-r0/tools/gtk-builder-tool-simplify.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagecrossfade.c /usr/src/debug/gtk4/4.10.5-r0/tools/gtk-builder-tool.h /usr/src/debug/gtk4/4.10.5-r0/tools/gtk-builder-tool.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmediafile.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmediafile.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkdevice-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksearchengineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistitemwidgetprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/keynamesprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintlayout.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssnodestylecacheprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintlayout.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksca
 ler.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewsorterprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcenterlayout.c /usr/src/debug/gtk4/4.10.5-r0/tools/gtk-builder-tool-screenshot.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuilderscopeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcenterlayout.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstyleproviderprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmenusectionboxprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssboxesprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmenutrackerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkiconhelperprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdrawcontext.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdrawcontext.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanrenderpass.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkenumtypes.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskenumtypes.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkenumtypes.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskenumtypes.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpropertylo
 okuplistmodel.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcontentprovider.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsscolorvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/graphrenderer.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdragsourceprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcontentprovider.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/graphrenderer.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkapplaunchcontextprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintlayoutprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkheaderbarprivate.h /usr/src/debug/gtk4/4.10.5-r0/tools/fake-scope.c /usr/src/debug/gtk4/4.10.5-r0/tools/fake-scope.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimmoduleprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsslineheightvalue.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkgltextureprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistitemprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksettingsprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanlineargradientpipeline.c /usr/sr
 c/debug/gtk4/4.10.5-r0/gtk/gtktextiterprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintutils.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssstylepropertyimpl.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkprintutils.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutcontroller.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutcontroller.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdevicepad.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdevicepad.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorpickerportalprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktoplevelsizeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstylecascadeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssfontfeaturesvalue.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkseatdefaultprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksizerequestcache.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkeventsprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkwaylandglcontext.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkoverlay.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkoverlay.h /usr/src
 /debug/gtk4/4.10.5-r0/gtk/gtkswitch.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintguide.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccessiblerange.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnview.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkconstraintguide.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkswitch.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsspalettevalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkapplication-dbus.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccessiblerange.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnview.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstringlist.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktexttagprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkstringlist.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktooltipprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanblurpipelineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkantextpipelineprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuiltiniconprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmodelbuttonprivate.h /usr/src/debug
 /gtk4/4.10.5-r0/gtk/gtkmediastream.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmediastream.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktreelistmodel.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimage.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktreelistmodel.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpopoverprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturerotate.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkhslaprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkrgbaprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgesturerotate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanclip.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gsktransformprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktrashmonitorprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdrawingarea.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkgizmoprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdrawingarea.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextlayout.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskcairorenderer.h /usr/src/debug/gtk4/4.10.5-r0/gsk/gskcairorenderer.c /usr/src/de
 bug/gtk4/4.10.5-r0/gtk/gtkdialogerror.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontroller.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/prop-holder.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/prop-holder.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkdialogerror.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeventcontroller.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrenderlayoutprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuilder.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuilder.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkseatdefault.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksecurememory.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdksurface-wayland-private.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdragsurface.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkshortcutmanagerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkcairocontextprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkdragsurface.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuilderprecompile.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssinheritvalueprivate.h /usr/src/de
 bug/gtk4/4.10.5-r0/gtk/gtkcssinitialvalueprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssdynamicprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktreelistrowsorter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkplacesview.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanpipeline.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktreelistrowsorter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagescaledprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorpickershell.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagerecolor.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssdynamic.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksearchentry.c /usr/src/debug/gtk4/4.10.5-r0/gsk/gskrendernodeimpl.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksearchentry.h /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkglcontext-wayland.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/gdkglcontext-wayland.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksortkeys.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkallocatedbitmaskprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssnumbe
 rvalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccessible.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdksnapshot.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfontdialogbutton.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksnapshot.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdksnapshot.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkfontdialogbutton.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccessible.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksnapshot.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextmark.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextmark.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagelinearprivate.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkframeclockidle.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/general.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktoplevel.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/general.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdktoplevel.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbuilderparser.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/xdg-foreign-unstable-v2-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gd
 k/gdkdisplaymanagerprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolorpickerkwin.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/recorderrow.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssstylechangeprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/recorderrow.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkbookmarksmanagerprivate.h /usr/src/debug/gtk4/4.10.5-r0/tools/encodesymbolic.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkmodulesprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanboxshadowpipeline.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssshorthandpropertyprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/statistics.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/statistics.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextiter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkglarea.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkapplaunchcontext.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextiter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsstypes.c /usr/src/debug/gtk4/4.10.5-r0/gdk/gdkapplaunchcontext.c /usr/src/debu
 g/gtk4/4.10.5-r0/gtk/gtkglarea.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkscale.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkscale.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkpopovercontentprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknumericsorter.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/variant-editor.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtknumericsorter.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimagefallbackprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkrbtree.c /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/variant-editor.h /usr/src/debug/gtk4/4.10.5-r0/gdk/gdksurfaceprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssimageradialprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcomposetable.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkimagedefinition.c /usr/src/debug/gtk4/4.10.5-r0/gdk/wayland/xdg-shell-unstable-v6-client-protocol.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcomposetable.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcolumnviewlayoutprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistview.h /usr/src/
 debug/gtk4/4.10.5-r0/gtk/gtktextview.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtklistview.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextview.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksidebarrowprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccelgroup.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeditablelabel.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkeditablelabel.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkaccelgroup.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssprovider.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsscornervalue.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssprovider.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcssstylepropertyprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanborderpipeline.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkaneffectpipeline.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkversion.c /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanglyphcacheprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkversion.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanmemoryprivate.h /usr/src/debug/g
 tk4/4.10.5-r0/gsk/vulkan/gskvulkanrenderprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksignallistitemfactory.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanshaderprivate.h /usr/src/debug/gtk4/4.10.5-r0/gsk/vulkan/gskvulkanbufferprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsslookupprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/gtksignallistitemfactory.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtktextmarkprivate.h /usr/src/debug/gtk4/4.10.5-r0/gtk/inspector/inspect-button.c /usr/src/debug/gtk4/4.10.5-r0/gtk/gtkcsstransformvalue.c", added "/usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextiter.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkapplaunchcontext.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextiter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprinterprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsstypes.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkapplaunchcontext.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanclip.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskglshaderprivate.h /usr/src/debug/gtk4/4.12.0-
 r0/gtk/gtkinscription.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkinscription.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkwaylandsurface.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpathbarprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskrendernodeparserprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskcairorenderer.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskcairorenderer.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorpickerkwinprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistview.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextview.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagecrossfadeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/xdg-foreign-unstable-v1-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistview.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextview.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gdktextureutilsprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktooltipwindow.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwindowgroup.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintlayoutprivate.h /usr/src/debug/g
 tk4/4.12.0-r0/gtk/gtkwindowgroup.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkplacesviewrow.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssenumvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkpagethumbnailprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagefallback.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstyleprovider.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutlabel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstyleprovider.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksecurememoryprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutlabel.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanimage.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprinteroptionsetprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdragsurface.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutmanagerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdragsurface.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkallocatedbitmask.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkantextureop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssdimensionvalue.
 c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskrendernodeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrendericonprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturepanprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintbackend.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutsgroup.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgestureswipeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutsgroup.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextbtreeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcheckbutton.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgestureclickprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcheckbutton.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkicontheme.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkicontheme.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/window.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/idle-inhibit-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/window.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksizegroup-private.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wa
 yland/gdkseat-wayland.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkseat-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssanimatedstyle.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimageiconthemeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagepaintableprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnview.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrenderborderprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnview.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrangeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewrowprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssbgsizevalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkprogresstrackerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscrollbar.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscrollbar.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturesingleprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/xdg-foreign-unstable-v2-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmountoperation.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewcolumn
 private.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmountoperation.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktreelistmodel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimage.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintsolverprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktreelistmodel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuilderscopeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkopenuriportal.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkopenuriportal.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkarrayimpl.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgizmoprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkwaylandpopup.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkheaderbar.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/xdg-shell-unstable-v6-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkheaderbar.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdrawcontextprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssnumbervalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpropertylookuplistmodel.c /usr/src/debug/gtk4/4.12.0-r
 0/gdk/gdkvulkancontextprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkapplication.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagelinear.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkapplication.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanimageprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/resources/texture.vert.h /usr/src/debug/gtk4/4.12.0-r0/gtk/text-input-unstable-v3-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewrowwidget.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdropprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdropprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmediacontrols.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkmonitor-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpropertylookuplistmodelprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmediacontrols.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkseatprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdisplayprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkmonitor-wayland.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskrectp
 rivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrootprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextiterprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistitemprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksettingsprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwidgetfocus.c /usr/src/debug/gtk4/4.12.0-r0/gtk/language-names.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssanimationprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcairocontextprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/language-names.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorchooserdialog.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkvulkancontext.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkvulkancontext.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdebug.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskdebug.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutssection.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutssection.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfixed.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpa
 ned.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfixed.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpaned.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssfontfeaturesvalue.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdksurface-wayland.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdksurface-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskrendernodeimpl.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksizerequestcache.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexttypes.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/primary-selection-unstable-v1-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextchild.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmountoperationprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextchild.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksortkeys.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionobservable.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssnumbervalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechooserutils.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdksnapshot.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksnapshot.h /usr
 /src/debug/gtk4/4.12.0-r0/gtk/gtkfilechooserutils.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdksnapshot.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksnapshot.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextmark.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkadjustment.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextmark.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkadjustment.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssselector.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkframeclockidle.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksearchengineprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktoplevel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimcontextwayland.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimcontextwayland.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktoplevel.c /usr/src/debug/gtk4/4.12.0-r0/gdk/keynamesprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmultifilter.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuildableprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmultisorter.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdisplaymanagerprivate.h /usr/src/d
 ebug/gtk4/4.12.0-r0/gtk/gtkmultifilter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmultisorter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gsettings-mapping.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gsettings-mapping.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagepaintable.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssstylechange.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkwaylandmonitor.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdragsource.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdragsource.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutmanager.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssstaticstyleprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktestatcontext.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutmanager.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksorterprivate.h /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-rendernode-tool-show.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/clipboard.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/clipboard.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmenutrackerprivate.h /usr/src/debug
 /gtk4/4.12.0-r0/gtk/gtkconstraint.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanrenderpass.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorchooserwidgetprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraint.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfontdialog.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfontdialog.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkapplaunchcontextprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknativeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksidebarrowprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkheaderbarprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsscornervalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssstylepropertyprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssarrayvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/controllers.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintsettings.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/controllers.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintsettings.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkgltexture.h /
 usr/src/debug/gtk4/4.12.0-r0/gdk/gdkgltexture.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsslookup.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsstransformvalue.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkkeyuni.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwindowprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturerotateprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontrollerlegacy.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontrollerlegacy.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistitembase.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmultiselection.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsskeyframes.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmultiselection.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrbtreeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdksurface.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdksurface.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpointerfocus.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/server-decoration-protocol.c /usr/src/debug/gtk4/4.12.
 0-r0/gtk/gtkpasswordentry.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpasswordentry.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskdiff.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgrid.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgrid.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/recording.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkapplicationimpl.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/recording.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionmuxerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/resources/outset-shadow.vert.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmediafile.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmediafile.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkpipeiostream.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsseasevalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstyleproperty.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutactionprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkglcontextprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkatcontextprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimcontextprivate.h /us
 r/src/debug/gtk4/4.12.0-r0/gtk/inspector/recorderrow.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/recorderrow.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanconvertop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbookmarksmanagerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewcolumn.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewcolumn.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkplacesviewprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkiconcachevalidatorprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontrollerscroll.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontrollerscroll.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccessibleattributeset.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkrectangleprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkhsla.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkrgba.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkrgba.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssstringvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewtitle.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwidgetp
 rivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkwaylandseat.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gtk-shell-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/xdg-shell-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdragsourceprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfiledialog.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfiledialog.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskroundedrect.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechooserentry.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechooserentry.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskroundedrect.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssfontvariationsvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilesystemmodel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkapplicationprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextutilprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuilderprecompile.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/inspect-button.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssdimensionvalueprivate.h /usr/s
 rc/debug/gtk4/4.12.0-r0/gtk/gtkcssstylepropertyimpl.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccessiblevalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/xdg-activation-v1-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/tablet-unstable-v2-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkgltexturebuilder.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkgltexturebuilder.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknative.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkapplicationwindow.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknative.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkapplicationwindow.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionhelperprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/keyboard-shortcuts-inhibit-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/viewporter-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrendericon.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskrendernode.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimcontextsimpleseqs.h /usr/src/debug/gtk4/4.12.0-r0/gs
 k/gskrendernode.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanconvertopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksizerequestcacheprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkglcontext-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimmulticontext.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkglcontext-wayland.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewcellwidget.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimmulticontext.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/magnifier.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/magnifier.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/focusoverlay.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintoperation.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/focusoverlay.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintoperation.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/tablet-unstable-v2-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanclearopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkancoloroppri
 vate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanglyphopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gskpangoprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpangoprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/general.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkselectionmodel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/general.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkselectionmodel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssstyleprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturedrag.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturezoom.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturedrag.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturezoom.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknativedialogprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpopovermenubarprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkflowboxprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintsolver.c /usr/src/debug/gtk4/4.12.0-r0/gdk/deprecated/gdkpixbuf.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmediastream.c /usr/s
 rc/debug/gtk4/4.12.0-r0/gtk/gtkbuildable.h /usr/src/debug/gtk4/4.12.0-r0/gdk/deprecated/gdkpixbuf.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuildable.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmediastream.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbutton.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbutton.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssnodeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkpagesetup.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkborder.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdroptargetasync.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechoosercell.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklinkbutton.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkborder.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdroptargetasync.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkpagesetup.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklinkbutton.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrecentmanager.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdktoplevel-wayland-private.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrecentmanager.h /usr/s
 rc/debug/gtk4/4.12.0-r0/gtk/gtkroundedboxprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcursor.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpadcontroller.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcursor.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpadcontroller.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistheader.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexthandle.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistheader.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/css-node-tree.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/css-node-tree.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkselectionfiltermodel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdialogerror.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsswidgetnode.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkselectionfiltermodel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkpagethumbnail.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdialogerror.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwindowhandle.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksidebarrow.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwindo
 whandle.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsspalettevalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/tools/fake-scope.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewprivate.h /usr/src/debug/gtk4/4.12.0-r0/tools/fake-scope.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/measuregraph.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/measuregraph.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksectionmodelprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkglversionprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanblendmodeop.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkancolormatrixop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccessiblerangeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssrepeatvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktoplevelsize.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstylecascade.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktoplevelsize.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklayoutmanager.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkjoinedmenuprivate.h /usr/src/debug/gtk
 4/4.12.0-r0/gtk/gtklayoutmanager.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkseatdefaultprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextviewchild.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpopovermenuprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssrepeatvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsscolorvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdeviceprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssnodedeclaration.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewcell.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewcell.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/a11y.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/init.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/logs.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/menu.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/a11y.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/init.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/logs.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/menu.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuiltiniconpriv
 ate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextviewchildprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmodulesprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdragprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimageinvalidprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsslineheightvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexttagtableprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmenusectionboxprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/recorder.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssselectorprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/recorder.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkiconcacheprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/xdg-foreign-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkprofiler.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdragsurfacesize.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkenumtypes.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskenumtypes.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskprofiler.c /usr/src/debug/gtk4/4.
 12.0-r0/gsk/vulkan/resources/color.vert.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/resources/glyph.vert.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccessibleattributesetprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprinter.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkenumtypes.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdragsurfacesize.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskenumtypes.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprinter.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrenderbackground.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcontentformats.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimageradial.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcontentformats.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcontentprovider.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcontentprovider.c /usr/src/debug/gtk4/4.12.0-r0/gtk/fnmatch.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksymbolicpaintable.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmain.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksymbolicpaintable.c /usr/src/debug/gtk4/4.12.0-r0/gtk
 /gtkmain.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdevicetool.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdevicetool.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsslineheightvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilesystemmodelprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkdisplay-wayland.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkdisplay-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/xdg-activation-v1-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksettings.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksettings.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsscalcvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/fpsoverlay.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/fpsoverlay.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdevicepad.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdevicepad.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklabel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklabel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssinheritvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssinitialvalue.c /u
 sr/src/debug/gtk4/4.12.0-r0/gtk/gtkentrybuffer.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkentrybuffer.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/resources/inset-shadow.vert.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/pointer-gestures-unstable-v1-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuilderlistitemfactory.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuilderlistitemfactory.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimageprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmediafileprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/wm-button-layout-translation.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/wm-button-layout-translation.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechoosererrorstackprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturestylus.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturestylus.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewtitleprivate.h /usr/src/debug/gtk4/4.12.0-r0/tools/encodesymbolic.c /usr/src/debug
 /gtk4/4.12.0-r0/gsk/gsktransform.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gsktransform.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssshorthandpropertyprivate.h /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-builder-tool-enumerate.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimageurl.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskcairoblur.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanrendererprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolordialogbutton.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrevealer.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrevealer.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolordialogbutton.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkenums.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskenums.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkenums.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextchildprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcountingbloomfilterprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktrashmonitorprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkboolfilter.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdk
 contentproviderprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkboolfilter.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdevicetoolprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstackswitcher.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstackswitcher.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskroundedrectprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknotebook.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknotebook.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistitemmanagerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssprovider.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmenubutton.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssprovider.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmenubutton.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssfiltervalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsslookupprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdksurface-wayland-private.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksortkeysprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstyleanimation.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/
 visual.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscalerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/visual.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechooserprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssfiltervalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstack.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstack.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkapplicationaccels.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkframe.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimmodule.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkframe.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcontentproviderimpl.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcoloreditorprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcontentproviderimpl.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorpickerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorswatchprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagecrossfade.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwindow.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssproviderprivate.h /usr/src/debug/gtk4/4.12.0-r0/gt
 k/gtkcssimageinvalid.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwindow.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksortlistmodel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistlistmodel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksortlistmodel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwindowcontrols.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechooserdialog.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwindowcontrols.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimageconic.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkandownloadopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkentryprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimagedefinitionprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintlayout.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkmemorytextureprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintlayout.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkplacesviewrowprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextlinedisplaycacheprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/statistics.h /usr/src/de
 bug/gtk4/4.12.0-r0/gtk/inspector/statistics.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintexpression.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechoosernativeportal.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkistringprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcustomfilter.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcustomsorter.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcustomfilter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcustomsorter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuttonprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpopovercontentprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutswindowprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkslicelistmodel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkvideo.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcairo.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkslicelistmodel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkvideo.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcairo.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssbordervalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimag
 edefinition.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextbuffer.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextbuffer.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontrollermotion.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkdevicepad-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorpickerportal.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontrollermotion.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanpushconstantsopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcontentserializer.c /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-rendernode-tool-info.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskglshader.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskglshader.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcontentserializer.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccelgroupprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/resource-holder.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/resource-holder.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/eventrecording.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/start
 recording.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilter.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksorter.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkkeysprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksorter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/eventrecording.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/startrecording.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrenderlayout.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkseatdefault.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktexturedownloaderprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkclipboard-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkclipboard-wayland.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintbackendprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/shortcuts.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/shortcuts.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkmonitorprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanrenderpassprivate.h /usr/src/debug/gtk4/4.12.0-r0/
 gtk/gtkprogresstracker.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/renderrecording.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagerecolorprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/renderrecording.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktypes.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gsktypes.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktypes.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkmemoryformat.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssshorthandpropertyimpl.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintvflparser.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanrenderer.c /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-builder-tool.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssstyle.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkdragsurface-wayland.c /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-builder-tool.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanrenderer.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdisplay.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdisplay.c /usr/src/debug/gtk4/4.12.0-r0/gtk/g
 tkcssimageurlprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkdevice-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkemojicompletion.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkemojicompletion.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuilderprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilelauncher.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkancolormatrixopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilelauncher.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistbaseprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfontchooserutils.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfontchooserutils.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/resource-list.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/resource-list.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintoperation-portal.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintoperation-portal.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklayoutchild.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklayoutchild.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkemojichoose
 r.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwidgetpaintableprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/gtkdataviewer.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsspositionvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkemojichooser.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/gtkdataviewer.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmagnifier.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontrollerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkframeclockidleprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskcairoblurprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gdktextureutils.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkframeclockprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprinteroptionset.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkinscriptionprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistitemmanager.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmaplistmodel.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkcairocontext-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssenumvalueprivate.h /usr/src/deb
 ug/gtk4/4.12.0-r0/gtk/gtkmaplistmodel.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkcairocontext-wayland.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/prop-list.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextattributes.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksecurememory.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsstransformvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/prop-list.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturesingle.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturesingle.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/idle-inhibit-unstable-v1-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktooltip.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktooltip.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaspectframe.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaspectframe.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgestureswipe.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgestureswipe.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgestureclick.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscrollable.c /usr/src/debug/gtk4/4
 .12.0-r0/gtk/gtkscrollinfo.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechoosercellprivate.h /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-rendernode-tool.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscrollable.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgestureclick.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscrollinfo.h /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-rendernode-tool.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/a11yoverlay.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkcustompaperunixdialog.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/a11yoverlay.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssanimatedstyleprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkcustompaperunixdialog.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionbar.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkeventsprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdevicepadprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionbar.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontrollerkey.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontrollerkey.c /u
 sr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintoperation-unix.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkpopup-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfontdialogbutton.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfontdialogbutton.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/resources/convert.vert.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbookmarklist.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrenderborder.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbookmarklist.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkapplication-dbus.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanborderop.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanshaderop.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanuploadop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagelinearprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpasswordentryprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkexpander.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkexpander.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkvulkancontext-wayland.h /usr/src/debug
 /gtk4/4.12.0-r0/gdk/wayland/gdkvulkancontext-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorchooserwidget.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknomediafileprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpanedhandleprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsstransition.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextbufferprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuilderscope.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuilderscope.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstyleproviderprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistitemfactory.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturedragprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturezoomprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistitemfactory.c /usr/src/debug/gtk4/4.12.0-r0/tools/updateiconcache.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanborderopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanshaderopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanuploadopprivate.h /usr/src/d
 ebug/gtk4/4.12.0-r0/gtk/gtkconstrainttypesprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmessagedialog.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdrop.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktextureprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgestureprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdrop.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanglyphcacheprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdrop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistheaderbaseprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksignallistitemfactory.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktreeexpander.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksignallistitemfactory.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktreeexpander.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkseat.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkroot.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktext.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkseat.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsstypesprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkroot.c /usr/src/debug/gtk4/
 4.12.0-r0/gtk/gtktext.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcairocontext.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssanimation.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcairocontext.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssinheritvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssinitialvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutswindow.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutswindow.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkpopupprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechoosernative.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcuttrigger.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcuttrigger.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorpickerportalprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssnodedeclarationprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/list-data.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/tree-data.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcol
 orplane.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorscale.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorutils.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorutils.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/list-data.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsspositionvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/tree-data.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaboutdialog.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmenutracker.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaboutdialog.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/keyboard-shortcuts-inhibit-unstable-v1-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/viewporter-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssfontfeaturesvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanglyphcache.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdk.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccessiblerange.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbitset.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbitset.h /usr/src/debug/gtk4/4.12.0-r0
 /gtk/gtkaccessiblerange.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksearchengine.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstringlist.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechoosererrorstack.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstringlist.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuilderparser.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktexture.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesture.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpicture.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktexture.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesture.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpicture.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcenterbox.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcenterbox.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpopoverprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcenterlayout.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturerotate.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcenterlayout.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturerotate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkwaylanddisplay.h
  /usr/src/debug/gtk4/4.12.0-r0/gdk/gdksnapshotprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksnapshotprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmagnifierprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistitem.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknumericsorter.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/variant-editor.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknumericsorter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagefallbackprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistitem.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkiconhelperprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/variant-editor.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdrawingarea.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdrawingarea.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextsegmentprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/actions.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkprivatetypebuiltins.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgizmo.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkprivatetypebuiltins.h /usr/src/
 debug/gtk4/4.12.0-r0/gtk/inspector/actions.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkoverlaylayout.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrendernodepaintableprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkoverlaylayout.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/misc-info.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/type-info.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/misc-info.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/type-info.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkorientable.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkorientable.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuilder.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktooltipwindowprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuilder.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimmoduleprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilterlistmodel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilterlistmodel.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkgl.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gtk-shell-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gd
 k/wayland/xdg-shell-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksearchenginemodelprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkexpression.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsstransientnode.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstyleanimationprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkexpression.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewsorter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewsorter.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistitembaseprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpopovermenu.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsskeyframesprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpopovermenu.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkiconthemeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/open-type-layout.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssnode.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistlistmodelprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssstyleproperty.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpointerfocusprivate.h /usr/src/debug/gtk4/4.
 12.0-r0/gtk/gtkplacessidebarprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexthistoryprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskdiffprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanmaskop.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanmemory.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanblurop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktypebuiltins.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanbuffer.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktoplevellayout.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanrender.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscrolledwindow.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktoplevellayout.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkiconcache.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscrolledwindow.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktypebuiltins.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccessibleprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorpickershellprivate.h /usr
 /src/debug/gtk4/4.12.0-r0/gtk/inspector/graphdata.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/graphdata.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkpipeiostreamprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsseasevalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssarrayvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccessiblevalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextsegment.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksizegroup.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksizegroup.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdropcontrollermotion.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssunsetvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdropcontrollermotion.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcalendar.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkclipboard.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcursorprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkclipboard.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcalendar.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexttag.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmen
 utrackeritem.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexttag.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionmuxer.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewrowwidgetprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfixedlayout.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknomediafile.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpanedhandle.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfixedlayout.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssboxesimplprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkhslaprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkrgbaprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanscissoropprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/resources/cross-fade.vert.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/css-editor.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/css-editor.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssboxesprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/pointer-gestures-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkclipboardprivate.h /
 usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwidget.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwidget.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdragicon.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkalertdialog.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimageradialprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkalertdialog.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdragicon.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssbgsizevalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkpopup.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdevice.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdevice.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkpopup.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscalebutton.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscalebutton.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkadjustmentprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbitmaskprivateimpl.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimage.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrange.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimage.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrange.h /usr/sr
 c/debug/gtk4/4.12.0-r0/gtk/gtkversion.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionable.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkrectangle.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbookmarksmanager.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionable.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkversion.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkrectangle.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkdevice-wayland-private.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkprimary-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdbusgenerated.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkprimary-wayland.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdbusgenerated.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkwaylandtoplevel.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkancrossfadeop.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkprivate-wayland.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkpango.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktreelistrowsorter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkplacesview.c /usr/src/deb
 ug/gtk4/4.12.0-r0/gdk/gdkpango.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gskpango.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpango.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktreelistrowsorter.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdropdown.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdropdown.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkviewport.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintoperationpreview.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistheaderwidgetprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkviewport.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionhelper.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintoperationpreview.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagevalue.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkpopuplayout.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkpopuplayout.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktypefuncs.inc /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewcellwidgetprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkentry.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkquery.h /usr/src/debu
 g/gtk4/4.12.0-r0/gtk/gtkoverlay.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmountoperation-x11.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/size-groups.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkoverlay.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkentry.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkquery.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/size-groups.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbox.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbox.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsspalettevalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpopovermenubar.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpopovermenubar.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/xdg-foreign-unstable-v2-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssnodestylecacheprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknativedialog.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknativedialog.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscaler.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscrollinfoprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviews
 orterprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/action-editor.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanclearop.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkancolorop.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanglyphop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/action-holder.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/action-editor.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/action-holder.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstringfilter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstringsorter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintoperation-private.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkglarea.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssstaticstyle.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstringfilter.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstringsorter.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkglarea.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssvalue.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkglcontext.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkatcont
 ext.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimcontext.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkglcontext.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkatcontext.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimcontext.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprinteroptionwidget.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrbtree.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdksurfaceprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgridlayout.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkmarshalers.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmarshalers.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgridlayout.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkmarshalers.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmarshalers.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanlineargradientop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksearchenginemodel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/prop-holder.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/prop-holder.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbinlayout.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbo
 xlayout.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbinlayout.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/resources/blur.vert.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/resources/mask.vert.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkboxlayout.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutaction.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutaction.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprinteroption.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkseparator.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkseparator.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanbluropprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/fractional-scale-v1-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanbufferprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanmaskopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanmemoryprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanrenderprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkkineticscrolling.c /usr/src/debug/gtk4/4.12.0-r0/gs
 k/vulkan/gskvulkantextureopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksectionmodel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksectionmodel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksearchbar.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksearchbar.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintcontext.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutsshortcutprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanoutsetshadowopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintcontext.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkandownloadop.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/xdg-shell-unstable-v6-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanoutsetshadowop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutcontroller.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutcontroller.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextutil.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksearchentryprivate.h /usr/src/debug/gtk4/
 4.12.0-r0/gtk/print/gtkprinteroptionprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintjob.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskrendernodeparser.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagescaledprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktoplevelsizeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstylecascadeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintguideprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintjob.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskrendererprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolordialog.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/layoutoverlay.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/layoutoverlay.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolordialog.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcoloreditor.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorpicker.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorswatch.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagerecolor.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksingleselection.c /usr/s
 rc/debug/gtk4/4.12.0-r0/gtk/gtkpopover.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksingleselection.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpopover.h /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-builder-tool-simplify.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkwaylandglcontext.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdirectorylist.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/prop-editor.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdirectorylist.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/strv-editor.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/prop-editor.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuiltinicon.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/strv-editor.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkswitch.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintguide.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionobserver.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintguide.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkswitch.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktoplevelprivate.h /usr/src/debug/gtk4/4.12.0
 -r0/gtk/gtklistitemwidgetprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssbordervalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssfontvariationsvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstylepropertyprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdrag.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkjoinedmenu.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmodelbuttonprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdrag.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfontchooserdialogprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutsshortcut.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutsshortcut.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkpaintable.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturelongpress.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkpaintable.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturelongpress.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcustomlayout.c /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-builder-tool-screenshot.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexttagtable.h /usr/src/debug/gtk4/4.12.
 0-r0/gtk/gtkcustomlayout.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexttagtable.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gsktransformprivate.h /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-launch.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfontchooserwidgetprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccessiblevaluestatic.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkflowbox.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssshadowvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkflowbox.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssshadowvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/primary-selection-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkapplicationaccelsprivate.h /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-builder-tool-validate.c /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-query-settings.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkurilauncher.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkurilauncher.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssnodestylecache.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmodules.
 c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsstransientnodeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklabelprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexthistory.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmenutrackeritemprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkgltextureprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistbox.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistbox.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkroundedbox.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/highlightoverlay.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsscalcvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktestutils.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/highlightoverlay.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktestutils.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistfactorywidget.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkmonitor.h /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-builder-tool-preview.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkmonitor.c /usr/src/debug/gtk4/4.12.0-r0/gdk/filetransferportalprivate.h /usr/src
 /debug/gtk4/4.12.0-r0/gtk/gtklistfactorywidgetprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssdynamic.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimcontextsimple.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkkineticscrollingprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkimcontextsimple.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkeventsource.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturepan.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklayoutmanagerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturepan.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkglobals.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkcursor-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkframeclock.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkframeclock.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsswidgetnodeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprinteroptionwidgetprivate.h /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-rendernode-tool-render.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkflattenlistmodel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtk
 flattenlistmodel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeditable.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/baselineoverlay.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagescaled.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeditable.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/baselineoverlay.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/xdg-output-unstable-v1-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsstransitionprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistviewprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextviewprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssshorthandproperty.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdragsurfaceprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkprogressbar.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintutils.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkprogressbar.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpathbar.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdebugprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskdebugprivate.h /usr/src/debug/gtk4/4.12.0-r0/g
 tk/gtksizerequest.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextlayoutprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksizerequest.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkbuilder-menus.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkancommandpoolprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/object-tree.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistheaderwidget.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/object-tree.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/fractional-scale-v1-protocol.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpasswordentrybuffer.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktrashmonitor.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkpasswordentrybuffer.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanblendmodeopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkapplication-x11.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskprivate.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkprivate.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkdrag-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkprivate.h /us
 r/src/debug/gtk4/4.12.0-r0/gdk/gdkprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkwaylanddevice.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcomposetable.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextlayout.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintutilsprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechoosernativeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcomposetable.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilechooserwidgetprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkancommandpool.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanscissorop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionobserverprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilefilter.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilefilter.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkpagesetupunixdialog.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkpagesetupunixdialog.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturelongpressprivate.h /usr/src/debug/gtk4/
 4.12.0-r0/gtk/gtkpopovercontent.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkmemorytexture.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkactionobservableprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextbtree.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkmemorytexture.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssunsetvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkspinbutton.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktexturedownloader.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsscornervalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdktexturedownloader.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/resources/border.vert.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/resources/linear.vert.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkspinbutton.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextattributesprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssdynamicprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkprofilerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskprofilerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistitemwidget.
 c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorpickershell.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkapplaunchcontext-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdragsurfacesizeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/inspectoroverlay.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrendernodepaintable.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/inspectoroverlay.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksearchentry.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtksearchentry.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/resources/color-matrix.vert.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmenusectionbox.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewcellprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdroptarget.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkdroptarget.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkiconcachevalidator.c /usr/src/debug/gtk4/4.12.0-r0/gdk/filetransferportal.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkkeymap-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkallocatedbitmaskpriv
 ate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkevents.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanrenderpassop.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkevents.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfontchooserdialog.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkancrossfadeopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintexpressionprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklevelbar.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstacksidebar.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkstacksidebar.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklevelbar.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkresources.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskresources.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkresources.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkresources.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskresources.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkresources.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextlinedisplaycache.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorplaneprivate.h /usr/src/debug/gtk4/4.12.0-r
 0/gtk/gtkcolorscaleprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistbase.h /usr/src/debug/gtk4/4.12.0-r0/gtk/xdp-dbus.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistbase.c /usr/src/debug/gtk4/4.12.0-r0/gtk/xdp-dbus.c /usr/src/debug/gtk4/4.12.0-r0/gtk/text-input-unstable-v3-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkmodelbutton.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknoselection.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewrow.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolumnviewrow.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtknoselection.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimagevalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscale.h /usr/src/debug/gtk4/4.12.0-r0/gsk/gskrenderer.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkscale.c /usr/src/debug/gtk4/4.12.0-r0/gsk/gskrenderer.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdisplaymanager.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/paper_names_offsets.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdisplaymanager.c /usr/src/debug/gtk4/4.12.0-r0/gd
 k/gdkdrawcontext.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkdrawcontext.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimageicontheme.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssstringvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgridview.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/updatesoverlay.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgesturestylusprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintunixdialog.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/updatesoverlay.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkgridview.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkprintunixdialog.h /usr/src/debug/gtk4/4.12.0-r0/tools/gtk-rendernode-tool-utils.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanpushconstantsop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcsscolorvalue.c /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/graphrenderer.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontroller.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontroller.h /usr/src/debug/gtk4/4.12.0-r0/gtk/inspector/graphrende
 rer.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccelgroup.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssvalueprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeditablelabel.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistitemfactoryprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeditablelabel.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccelgroup.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrenderlayoutprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkkeys.c /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkkeys.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssimageconicprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktextmarkprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkiconhelper.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcut.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcut.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwidgetpaintable.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcontentdeserializer.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkcontentdeserializer.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkwidgetpaintable.c /usr/src/debug/gtk4/4.12.0-r0/gs
 k/vulkan/resources/blend-mode.vert.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexttypesprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkframetimings.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkrenderbackgroundprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkframetimings.c /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/server-decoration-client-protocol.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdkdrop-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkaninsetshadowopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilethumbnail.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontrollerfocus.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfilethumbnail.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkeventcontrollerfocus.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistheaderbase.c /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkpapersize.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkconstraintvflparserprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/print/gtkpapersize.h /usr/src/debug/gtk4/4.12.0-r0/gdk/gdkmemoryformatprivate.h /usr/src/de
 bug/gtk4/4.12.0-r0/gtk/gtkfilechooserwidget.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccessible.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkplacessidebar.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkaccessible.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkspinner.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkspinner.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktestatcontextprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexttagprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktooltipprivate.h /usr/src/debug/gtk4/4.12.0-r0/gdk/wayland/gdktoplevel-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanrenderpassopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkapplication-wayland.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktogglebutton.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcolorpickerkwin.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktogglebutton.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkcssstylechangeprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanclipprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkfontchooserwidget.c 
 /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkaninsetshadowop.c /usr/src/debug/gtk4/4.12.0-r0/gtk/gtkshortcutcontrollerprivate.h /usr/src/debug/gtk4/4.12.0-r0/gsk/vulkan/gskvulkanlineargradientopprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtklistheaderprivate.h /usr/src/debug/gtk4/4.12.0-r0/gtk/gtktexthandleprivate.h"
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4/gtk4: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
packages/core2-32-poky-linux/gtk4/gtk4: PKGSIZE changed from 13014315 to 13510514 (+4%)
packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1000.5", added "/usr/lib/libgtk-4.so.1.1200.0 /usr/bin/gtk4-rendernode-tool"
packages/core2-32-poky-linux/gtk4: PV changed from "4.10.5" to "4.12.0"
packages/core2-32-poky-linux/gtk4: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk/4.10/gtk-4.10.5.tar.xz" to "http://ftp.gnome.org/pub/gnome/sources/gtk/4.12/gtk-4.12.0.tar.xz"
packages/core2-32-poky-linux/gtk4: PKGV changed from 4.10.5 [default] to 4.12.0 [default]
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1000.5 to libgtk-4.so.1.1200.0
  /usr/lib/libgtk-4.so.1.1000.5 moved to /usr/lib/libgtk-4.so.1.1200.0
  /usr/include/gtk-4.0/gdk/deprecated was added
  /usr/include/gtk-4.0/gdk/deprecated/gdkpixbuf.h was added
  /usr/include/gtk-4.0/gdk/gdkdragsurfacesize.h was added
  /usr/include/gtk-4.0/gdk/gdkgltexturebuilder.h was added
  /usr/include/gtk-4.0/gdk/version was added
  /usr/include/gtk-4.0/gdk/version/gdkversionmacros.h was added
  /usr/include/gtk-4.0/gdk/version/gdk-visibility.h was added
  /usr/include/gtk-4.0/gtk/gtkcolumnviewcell.h was added
  /usr/include/gtk-4.0/gtk/gtkcolumnviewrow.h was added
  /usr/include/gtk-4.0/gtk/gtklistheader.h was added
  /usr/include/gtk-4.0/gtk/gtkscrollinfo.h was added
  /usr/include/gtk-4.0/gtk/gtksectionmodel.h was added
  /usr/include/gtk-4.0/gtk/print was added
  /usr/include/gtk-4.0/gtk/print/gtkpagesetup.h was added
  /usr/include/gtk-4.0/gtk/print/gtkpapersize.h was added
  /usr/include/gtk-4.0/gtk/print/gtkprintcontext.h was added
  /usr/include/gtk-4.0/gtk/print/gtkprintoperation.h was added
  /usr/include/gtk-4.0/gtk/print/gtkprintoperationpreview.h was added
  /usr/include/gtk-4.0/gtk/print/gtkprintsettings.h was added
  /usr/include/gtk-4.0/unix-print/gtk/print was added
  /usr/include/gtk-4.0/unix-print/gtk/print/gtkpagesetupunixdialog.h was added
  /usr/include/gtk-4.0/unix-print/gtk/print/gtkprinter.h was added
  /usr/include/gtk-4.0/unix-print/gtk/print/gtkprintjob.h was added
  /usr/include/gtk-4.0/unix-print/gtk/print/gtkprintunixdialog.h was added
  /usr/include/gtk-4.0/gdk/gdkpixbuf.h was removed
  /usr/include/gtk-4.0/gdk/gdkversionmacros.h was removed
  /usr/include/gtk-4.0/gtk/gtkpagesetup.h was removed
  /usr/include/gtk-4.0/gtk/gtkpapersize.h was removed
  /usr/include/gtk-4.0/gtk/gtkprintcontext.h was removed
  /usr/include/gtk-4.0/gtk/gtkprintoperation.h was removed
  /usr/include/gtk-4.0/gtk/gtkprintoperationpreview.h was removed
  /usr/include/gtk-4.0/gtk/gtkprintsettings.h was removed
  /usr/include/gtk-4.0/unix-print/gtk/gtkpagesetupunixdialog.h was removed
  /usr/include/gtk-4.0/unix-print/gtk/gtkprinter.h was removed
  /usr/include/gtk-4.0/unix-print/gtk/gtkprintjob.h was removed
  /usr/include/gtk-4.0/unix-print/gtk/gtkprintunixdialog.h was removed
  /usr/include/gtk-4.0/unix-print/gtk/gtkunixprint-autocleanups.h was removed

--===============0267490515444012117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:399ad503473d068c208714d8122e2348c9ee9b22"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 278 Local 98 Mirrors 0 Missed 180 Current 1091 (35% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1122 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 1145 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1164 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1169 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1229 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1287 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1344 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1345 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1349 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1580 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_recipe_qa)
NOTE: Running task 1581 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: Running task 1603 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa)
NOTE: Running task 1624 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa)
NOTE: Running task 1652 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa)
NOTE: Running task 1653 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa)
NOTE: Running task 1655 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa)
NOTE: Running task 1681 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_write_config)
NOTE: Running task 1694 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 1695 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 1750 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: Running task 1770 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: Running task 1789 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa)
NOTE: Running task 1821 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa)
NOTE: Running task 1822 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: Running task 1824 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 1878 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_recipe_qa)
NOTE: Running task 1879 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa)
NOTE: Running task 1880 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 1881 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: Running task 1923 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 1924 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_recipe_qa)
NOTE: Running task 1925 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: Running task 1926 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: Running task 1927 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_recipe_qa)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Started
NOTE: Running task 2028 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_write_config)
NOTE: Running task 2029 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2030 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_recipe_qa)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: Running task 2089 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2090 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_write_config)
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: Running task 2205 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_write_config)
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2273 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa)
NOTE: Running task 2299 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1353 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: Running task 2375 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_write_config: Succeeded
NOTE: Running task 2376 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_write_config: Started
NOTE: Running task 2377 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2378 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 2379 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2380 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2381 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2382 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Succeeded
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Started
NOTE: Running task 2383 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: Running task 2384 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2385 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2386 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 2387 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 2388 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2391 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2392 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe gtk4-4.12.0-r0: task do_write_config: Succeeded
NOTE: Running task 2393 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2394 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 2395 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2396 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: Running task 2397 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: Running task 2398 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_fetch)
NOTE: Running task 2399 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2400 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_fetch)
NOTE: Running task 2401 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2402 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_unpack)
NOTE: Running task 2403 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_fetch)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2404 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 2405 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2406 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_fetch)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 2407 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2408 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: Running task 2409 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: Running task 2410 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: Running task 2411 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2412 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running task 2413 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 2414 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: Running setscene task 1358 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 2430 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_unpack: Started
NOTE: Running task 2431 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2432 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2433 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_fetch: Started
NOTE: Running task 2434 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe gtk4-4.12.0-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: Running task 2435 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 2436 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: Running task 2437 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe gtk4-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_fetch: Succeeded
NOTE: Running task 2438 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 2439 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_unpack)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-mips-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 2440 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_unpack)
NOTE: Running task 2441 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: Running task 2442 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2443 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Started
NOTE: Running task 2444 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_unpack: Started
NOTE: Running task 2445 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_unpack: Started
NOTE: Running task 2446 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2447 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2448 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 2449 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 2450 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-mips-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 3053 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_patch)
NOTE: Running task 3075 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: Running task 3084 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3085 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3086 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3116 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 3118 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: Running task 3133 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Running task 3155 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3159 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3162 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_unpack: Succeeded
NOTE: Running task 3197 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_patch: Started
NOTE: Running task 3200 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: Running task 3232 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 3233 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 3234 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 3258 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 3265 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: Running task 3266 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_patch)
NOTE: Running task 3267 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3302 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 3303 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_patch)
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: Running task 3304 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 3314 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3315 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3316 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3317 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 3339 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 3340 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 3342 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: Running task 3343 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3344 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3345 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3346 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 3347 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.1-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 3348 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3349 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 3356 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 3357 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 3369 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3370 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 3371 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_patch)
NOTE: Running task 3372 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 3378 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3379 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 3390 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3391 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3392 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3397 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3398 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3399 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3407 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 3410 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_collect_spdx_deps)
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3423 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3424 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 3426 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3427 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 3428 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3429 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3430 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3431 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3432 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 3433 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: Running task 3434 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3435 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3436 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3439 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 3440 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 3441 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3442 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3443 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: Running task 3449 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3452 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 3453 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3454 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: Running task 3455 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3456 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: Running task 3457 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx)
NOTE: Running task 3458 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3460 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3461 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: Running task 3462 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3463 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx: Started
NOTE: Running task 3464 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3469 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: Running task 3470 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3471 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: Running task 3472 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: Running task 3473 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3474 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3475 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_patch: Succeeded
NOTE: Running task 3476 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3479 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 3480 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3481 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3490 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.0-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3492 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3493 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: Running task 3494 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: Running task 3495 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3496 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3497 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: Running task 3498 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_patch)
NOTE: Running task 3499 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: Running task 3501 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3502 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: Running task 3503 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3504 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_populate_lic)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe gtk4-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.0-r0: task do_populate_lic: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3505 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3506 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.12.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_populate_lic unihash changed to ee613ab11766de4409ca4d57af44f7521e13fa81f23b4d72a4a2599797e060b7
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure: Started
NOTE: Running task 3507 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3508 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3509 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3510 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3511 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3512 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: Running task 3513 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3514 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3515 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-8.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3516 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3517 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3518 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3519 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3520 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: Running task 3521 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3522 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe harfbuzz-8.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3523 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3524 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: Running task 3525 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3526 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3527 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: Running task 3528 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3529 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3530 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3531 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 3532 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3537 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3538 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_compile)
NOTE: Running task 3539 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3540 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 3541 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3542 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 3543 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3544 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 3545 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3546 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3547 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3548 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 3549 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: Running task 3550 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3551 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 3552 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 3553 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: Running task 3554 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3555 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3556 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: Running task 3557 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 3558 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3559 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 3560 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3561 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 3562 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 3563 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: Running task 3564 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3565 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: Running task 3566 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: Running task 3567 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3568 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 3569 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 3570 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3571 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: Running task 3572 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3573 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3574 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3575 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 3576 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 3577 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: Running task 3578 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3579 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: Running task 3580 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_write_rpm)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3581 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3582 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3583 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3584 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3585 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: Running task 3586 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: Running task 3587 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe tiff-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3588 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3589 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 3590 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe tiff-4.5.1-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 3591 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3592 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3593 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3594 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3595 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3596 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3597 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3598 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 3599 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3600 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3601 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 3602 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3603 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3604 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3605 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3606 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3607 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3608 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3609 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile: Succeeded
NOTE: Running task 3610 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3611 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3612 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install: Succeeded
NOTE: Running task 3613 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_install_ptest_base)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3614 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_populate_sysroot)
NOTE: Running task 3615 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3616 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_package: Started
NOTE: recipe tiff-4.5.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3617 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3618 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3619 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3620 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3621 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3622 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3623 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3624 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3625 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3626 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3627 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3628 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: Running task 3629 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3630 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3631 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 3632 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_package)
NOTE: Running task 3633 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_populate_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_package: Started
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3634 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3635 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3636 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3637 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3638 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3639 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 3640 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_package: Succeeded
NOTE: Running task 3641 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3642 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3643 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3644 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3645 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3646 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Running task 3647 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_install)
NOTE: recipe vala-0.56.8-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3648 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3649 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe vala-0.56.8-r0: task do_install: Succeeded
NOTE: Running task 3650 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot)
NOTE: Running task 3651 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3652 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3653 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3654 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3655 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 3656 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 3657 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 3658 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3659 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3660 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3661 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3662 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Succeeded
NOTE: Running task 3663 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Failed
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_compile: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 3663 tasks of which 3308 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vala/0.56.8/temp/log.do_packagedata.2321515
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata) failed with exit code '1'

--===============0267490515444012117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:399ad503473d068c208714d8122e2348c9ee9b22"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 284 Local 98 Mirrors 0 Missed 186 Current 1101 (34% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1132 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 1155 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1174 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1179 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1245 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1303 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1363 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1364 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1365 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1369 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1374 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1602 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_recipe_qa)
NOTE: Running task 1603 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: Running task 1625 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa)
NOTE: Running task 1646 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa)
NOTE: Running task 1674 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa)
NOTE: Running task 1675 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa)
NOTE: Running task 1677 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa)
NOTE: Running task 1703 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_write_config)
NOTE: Running task 1716 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 1717 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: recipe gcc-cross-arm-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1772 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: Running task 1792 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: Running task 1811 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa)
NOTE: Running task 1812 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 1847 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: Running task 1848 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: Running task 1849 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Started
NOTE: Running task 1905 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: Running task 1906 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa)
NOTE: Running task 1907 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 1908 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_recipe_qa)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: Running task 1939 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: recipe gcc-cross-arm-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1951 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_recipe_qa)
NOTE: Running task 1952 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_recipe_qa)
NOTE: Running task 1953 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 1954 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: Running task 1955 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_write_config: Started
NOTE: Setscene tasks completed
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: Running task 2567 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_fetch)
NOTE: Running task 2568 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: Running task 2594 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: Running task 2601 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2619 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2620 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 2621 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: Running task 2639 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 2640 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2664 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2680 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2701 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2702 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: Running task 2743 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2744 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2745 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2776 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: Running task 2777 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2778 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2779 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_fetch)
NOTE: Running task 2808 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_fetch)
NOTE: Running task 2809 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_fetch)
NOTE: Running task 2811 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2812 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2874 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: Running task 2938 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2939 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_write_config)
NOTE: Running task 2943 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_recipe_qa)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 2971 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2972 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_fetch: Succeeded
NOTE: Running task 2973 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 2983 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_unpack)
NOTE: Running task 2984 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: Running task 2985 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2986 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 2987 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 2988 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2989 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: Running task 2990 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 2991 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2992 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2993 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 2994 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: Running task 2995 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 2996 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 2997 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: Running task 2998 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2999 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 3000 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: Running task 3001 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 3002 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_unpack)
NOTE: Running task 3003 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_unpack: Started
NOTE: Running task 3004 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: Running task 3005 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: Running task 3006 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 3007 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 3008 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_unpack)
NOTE: Running task 3009 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_unpack)
NOTE: Running task 3010 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 3011 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 3012 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: Running task 3013 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gtk4-4.12.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 3022 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_write_config: Succeeded
NOTE: Running task 3023 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running task 3024 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.12.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3058 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_write_config)
NOTE: Running task 3059 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3060 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_fetch)
NOTE: Running task 3061 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 3062 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: Running task 3063 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: Running task 3064 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 3065 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 3066 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Started
NOTE: Running task 3067 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 3109 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 3110 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3147 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 3156 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_write_config: Started
NOTE: recipe gtk4-4.12.0-r0: task do_fetch: Started
NOTE: Running task 3157 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: Running task 3160 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_unpack: Succeeded
NOTE: Running task 3161 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 3179 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3180 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 3181 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_unpack)
NOTE: Running task 3182 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 3183 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Running task 3184 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: Running task 3193 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3194 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 3195 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_patch)
NOTE: Running task 3196 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 3197 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 3198 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3220 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: Running task 3221 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: Running task 3222 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 3230 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 3231 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 3232 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 3233 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: Running task 3250 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_write_config)
NOTE: recipe gtk4-4.12.0-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: Running task 3273 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_patch: Started
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 3282 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx)
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 3283 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: Running task 3292 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 3301 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3302 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_patch)
NOTE: Running task 3303 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: Running task 3317 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 3318 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3326 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 3327 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3331 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa)
NOTE: Running task 3340 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3343 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3344 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3345 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_write_config: Started
NOTE: Running task 3377 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3378 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 3379 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3380 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3382 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: Running task 3398 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3399 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 3400 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe icu-73-2-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3401 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3402 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: Running task 3403 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3404 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: Running task 3405 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3406 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_patch)
NOTE: Running task 3407 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: Running task 3408 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3409 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: Running task 3410 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3411 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3412 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: Running task 3413 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: Running task 3432 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3433 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3434 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 3435 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3436 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3437 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3446 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3447 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3448 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3449 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3450 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3451 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_patch: Started
NOTE: Running task 3452 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3458 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: Running task 3459 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 3460 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3461 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: Running task 3462 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 3463 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3475 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3476 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3477 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 3478 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3479 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: Running task 3480 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 3481 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3524 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: recipe tiff-4.5.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 3526 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3527 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3528 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3531 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3532 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3533 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 3534 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3535 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 3536 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3537 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: Running task 3538 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 3539 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 3540 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3541 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: Running task 3542 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: Running task 3543 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3544 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe gtk4-4.12.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.0-r0: task do_patch: Succeeded
NOTE: Running task 3545 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3546 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_populate_lic)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3547 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gtk4-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.0-r0: task do_populate_lic: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3548 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3549 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.0-r0: task do_populate_lic: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_populate_lic unihash changed to ee613ab11766de4409ca4d57af44f7521e13fa81f23b4d72a4a2599797e060b7
NOTE: recipe gtk4-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3550 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3551 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3552 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: recipe icu-73-2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3553 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: Running task 3554 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3555 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3556 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.0.1-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3557 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3558 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 3559 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-8.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3560 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3561 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3562 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3563 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: Running task 3564 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3565 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3566 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3567 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3568 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3569 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3570 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3571 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: Running task 3572 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3577 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3578 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3579 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3580 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3581 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_configure_ptest_base)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 3582 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3583 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3584 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3585 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 3586 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 3587 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3588 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 3589 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3590 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 3591 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3592 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3593 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 3594 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3595 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 3596 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: Running task 3597 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3598 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3599 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3600 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3601 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 3602 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 3603 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: Running task 3604 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3605 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3606 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 3607 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3608 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3609 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3610 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: Running task 3611 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3612 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3613 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 3614 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 3615 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 3616 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: Running task 3617 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3618 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3619 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3620 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3621 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: Running task 3622 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3623 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3624 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: Running task 3625 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 3626 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3627 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3628 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3629 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3630 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3631 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3632 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 3633 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_write_rpm)
NOTE: Running task 3634 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: Running task 3635 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 3636 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_configure: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Started
NOTE: Running task 3637 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3638 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3639 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_compile: Started
NOTE: Running task 3640 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3641 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 3642 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3643 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3644 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3645 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3646 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3647 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3648 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3649 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 3650 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3651 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3652 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3653 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3654 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3655 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile: Succeeded
NOTE: Running task 3656 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3657 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install: Started
NOTE: recipe tiff-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3658 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_install)
NOTE: recipe tiff-4.5.1-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3659 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install: Succeeded
NOTE: Running task 3660 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_install_ptest_base)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3661 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3662 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3663 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_populate_sysroot)
NOTE: Running task 3664 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot: Started
NOTE: Running task 3665 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3666 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3667 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3668 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3669 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3670 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3671 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3672 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3673 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3674 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3675 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3676 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3677 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_configure: Started
NOTE: recipe tiff-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 3678 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_package)
NOTE: Running task 3679 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_populate_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_package: Started
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3680 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3681 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3682 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3683 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: Running task 3684 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 3685 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3686 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_package: Succeeded
NOTE: Running task 3687 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3688 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3689 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3690 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Running task 3691 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_install)
NOTE: recipe vala-0.56.8-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3692 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe vala-0.56.8-r0: task do_install: Succeeded
NOTE: Running task 3693 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot)
NOTE: Running task 3694 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3695 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3696 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3697 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3698 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3699 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3700 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3701 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3702 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe vala-0.56.8-r0: task do_package: Succeeded
NOTE: Running task 3703 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Failed
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_compile: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 3703 tasks of which 3338 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vala/0.56.8/temp/log.do_packagedata.2126670
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata) failed with exit code '1'

--===============0267490515444012117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:399ad503473d068c208714d8122e2348c9ee9b22"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 285 Local 99 Mirrors 0 Missed 186 Current 1108 (34% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1137 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 1160 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1161 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1180 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1185 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1251 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1308 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1365 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1367 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1368 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1372 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1373 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1377 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1382 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1610 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_recipe_qa)
NOTE: Running task 1611 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1645 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa)
NOTE: Setscene tasks completed
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2235 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2283 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa)
NOTE: Running task 2296 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2317 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_fetch)
NOTE: Running task 2330 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa)
NOTE: Running task 2331 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa)
NOTE: Running task 2332 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa)
NOTE: Running task 2365 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_write_config)
NOTE: Running task 2389 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 2390 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2468 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Started
NOTE: Running task 2503 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2542 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: Running task 2543 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2544 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: Running task 2545 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_fetch: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_write_config: Started
NOTE: Running task 2619 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa)
NOTE: Running task 2620 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: Running task 2621 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Started
NOTE: Running task 2622 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: Running task 2623 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: Running task 2662 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_unpack)
NOTE: Running task 2663 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_write_config: Succeeded
NOTE: Running task 2712 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_recipe_qa)
NOTE: Running task 2713 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 2714 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: Running task 2715 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2755 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2786 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: Running task 2787 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_recipe_qa)
NOTE: Running task 2788 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_recipe_qa)
NOTE: Running task 2789 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 2790 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Started
NOTE: Running task 2816 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: Running task 2888 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2929 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 2945 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_write_config)
NOTE: Running task 2946 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2950 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_unpack: Started
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Started
NOTE: Running task 3028 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_write_config)
NOTE: Running task 3029 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: Running task 3094 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: Running task 3120 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_collect_spdx_deps)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa: Started
NOTE: Running task 3121 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 3122 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 3123 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: Running task 3124 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 3125 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: Running task 3128 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: Running task 3129 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 3155 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 3156 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 3178 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_write_config: Started
NOTE: recipe gtk4-4.12.0-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: Running task 3179 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: Running task 3181 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3182 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 3183 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 3184 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 3191 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: Running task 3192 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 3193 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 3194 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: Running task 3195 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: Running task 3196 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 3197 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_fetch)
NOTE: Running task 3198 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: Running task 3199 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: Running task 3216 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_write_config)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3239 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 3240 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3241 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: Running task 3242 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe gtk4-4.12.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3243 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 3244 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 3245 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 3246 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 3247 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_fetch)
NOTE: Running task 3248 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_fetch)
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 3249 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 3250 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 3251 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_fetch)
NOTE: Running task 3252 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 3253 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 3301 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa)
NOTE: recipe icu-73-2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: Running task 3326 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 3327 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: Running task 3328 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 3329 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.0-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3330 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 3331 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 3332 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_patch)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: Running task 3333 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 3334 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 3335 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 3349 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Started
NOTE: Running task 3350 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: recipe gtk4-4.12.0-r0: task do_write_config: Succeeded
NOTE: Running task 3351 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running task 3352 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3353 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 3354 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_unpack)
NOTE: Running task 3355 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_unpack)
NOTE: Running task 3356 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3357 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 3358 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 3359 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3360 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_unpack)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: Running task 3361 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-73-2-r0: task do_create_spdx: Started
NOTE: Running task 3362 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: Running task 3363 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Running task 3364 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 3365 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3366 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 3367 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running task 3368 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 3369 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running task 3370 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: Running task 3371 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3372 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 3373 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: Running task 3374 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe vala-0.56.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3375 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe gtk4-4.12.0-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 3376 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 3377 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: Running task 3378 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: Running task 3379 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 3380 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 3381 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 3382 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 3383 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 3384 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: Running task 3385 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 3386 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 3391 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: Running task 3393 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: Running task 3394 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: Running task 3410 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: Running task 3411 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 3412 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 3413 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3414 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 3415 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_patch)
NOTE: Running task 3416 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: Running task 3417 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: Running task 3418 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3419 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: Running task 3420 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3437 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3438 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3439 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 3447 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.1-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3448 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 3449 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: Running task 3453 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 3454 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 3455 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 3456 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3457 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3458 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: Running task 3459 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3460 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: Running task 3466 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3467 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3468 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 3469 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 3470 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3471 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3472 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3525 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3526 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3531 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3532 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3533 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_patch: Started
NOTE: Running task 3534 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 3535 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 3536 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3537 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3538 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3539 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 3540 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3541 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_patch)
NOTE: Running task 3542 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3543 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch)
NOTE: Running task 3544 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3545 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 3546 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3547 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 3548 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3549 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: Running task 3550 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_configure)
NOTE: recipe vala-0.56.8-r0: task do_configure: Started
NOTE: Running task 3551 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: Running task 3552 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 3553 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: Running task 3554 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.1-r0: task do_configure: Started
NOTE: Running task 3555 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3556 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3557 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3558 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 3559 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3560 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3561 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: Running task 3562 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: Running task 3563 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 3564 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_patch)
NOTE: Running task 3565 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3566 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3567 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.0-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.0-r0: task do_patch: Succeeded
NOTE: Running task 3568 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3569 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_populate_lic)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3570 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe gtk4-4.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3571 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe gtk4-4.12.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3572 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: Running task 3573 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gtk4-4.12.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb:do_populate_lic unihash changed to ee613ab11766de4409ca4d57af44f7521e13fa81f23b4d72a4a2599797e060b7
NOTE: recipe gtk4-4.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3574 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: Running task 3575 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe icu-73-2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3576 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3577 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3578 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3579 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe harfbuzz-8.0.1-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3580 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3581 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3582 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3583 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3584 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3585 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3586 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3587 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3588 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3589 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3590 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3591 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: Running task 3592 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3593 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3594 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: Running task 3595 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3596 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3597 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3602 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3603 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3604 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3605 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile: Started
NOTE: Running task 3606 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 3607 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 3608 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3609 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 3610 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3611 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3612 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: Running task 3613 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3614 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Running task 3615 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 3616 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 3617 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3618 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: Running task 3619 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3620 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3621 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 3622 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: Running task 3623 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3624 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: Running task 3625 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 3626 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3627 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: Running task 3628 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: Running task 3629 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3630 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 3631 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3632 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: Running task 3633 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3634 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3635 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_configure: Succeeded
NOTE: Running task 3636 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3637 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe vala-0.56.8-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3638 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 3639 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3640 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3641 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: Running task 3642 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 3643 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3644 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: Running task 3645 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 3646 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 3647 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3648 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3649 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3650 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3651 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3652 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3653 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3654 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: Running task 3655 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3656 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3657 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3658 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 3659 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3660 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3661 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 3662 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3663 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: Running task 3664 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3665 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3666 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3667 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 3668 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3669 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3670 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3671 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: Running task 3672 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3673 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_compile)
NOTE: recipe tiff-4.5.1-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 3674 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3675 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile: Succeeded
NOTE: Running task 3676 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3677 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3678 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3679 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: Running task 3680 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3681 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_populate_sysroot)
NOTE: Running task 3682 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3683 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3684 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3685 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3686 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3687 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe tiff-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3688 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_install)
NOTE: recipe tiff-4.5.1-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3689 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3690 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3691 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3692 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3693 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: Running task 3694 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3695 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3696 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3697 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3698 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3699 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3700 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3701 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3702 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 3703 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: Running task 3704 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_package)
NOTE: Running task 3705 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_populate_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_package: Started
NOTE: Running task 3706 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3707 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3708 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_package: Succeeded
NOTE: Running task 3709 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3710 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 3711 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3712 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_compile: Succeeded
NOTE: Running task 3713 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_install)
NOTE: recipe vala-0.56.8-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3714 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3715 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_compile: Started
NOTE: Running task 3716 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot)
NOTE: Running task 3717 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3718 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3719 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3720 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3721 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3722 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe vala-0.56.8-r0: task do_package: Succeeded
NOTE: Running task 3723 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3724 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Failed
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.4-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3724 tasks of which 3362 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.11-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vala/0.56.8/temp/log.do_packagedata.1932893
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata) failed with exit code '1'

--===============0267490515444012117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gtk4/gtk4-dev: FILELIST: removed "/usr/include/gtk-4.0/gtk/gtkprintcontext.h /usr/include/gtk-4.0/unix-print/gtk/gtkprinter.h /usr/include/gtk-4.0/gtk/gtkpapersize.h /usr/include/gtk-4.0/unix-print/gtk/gtkprintunixdialog.h /usr/include/gtk-4.0/unix-print/gtk/gtkunixprint-autocleanups.h /usr/include/gtk-4.0/gtk/gtkpagesetup.h /usr/include/gtk-4.0/unix-print/gtk/gtkpagesetupunixdialog.h /usr/include/gtk-4.0/gtk/gtkprintoperation.h /usr/include/gtk-4.0/gdk/gdkversionmacros.h /usr/include/gtk-4.0/unix-print/gtk/gtkprintjob.h /usr/include/gtk-4.0/gtk/gtkprintoperationpreview.h /usr/include/gtk-4.0/gtk/gtkprintsettings.h /usr/include/gtk-4.0/gdk/gdkpixbuf.h", added "/usr/include/gtk-4.0/gdk/version/gdk-visibility.h /usr/include/gtk-4.0/gtk/gtksectionmodel.h /usr/include/gtk-4.0/gtk/print/gtkprintsettings.h /usr/include/gtk-4.0/gtk/print/gtkprintcontext.h /usr/include/gtk-4.0/gtk/print/gtkpagesetup.h /usr/include/gtk-4.0/gdk/deprecated/gdkpixbuf.h /usr/include/g
 tk-4.0/unix-print/gtk/print/gtkprinter.h /usr/include/gtk-4.0/unix-print/gtk/print/gtkpagesetupunixdialog.h /usr/include/gtk-4.0/gtk/gtkscrollinfo.h /usr/include/gtk-4.0/gdk/gdkdragsurfacesize.h /usr/include/gtk-4.0/gdk/version/gdkversionmacros.h /usr/include/gtk-4.0/gtk/print/gtkprintoperationpreview.h /usr/include/gtk-4.0/gtk/print/gtkprintoperation.h /usr/include/gtk-4.0/gtk/print/gtkpapersize.h /usr/include/gtk-4.0/gtk/gtkcolumnviewrow.h /usr/include/gtk-4.0/unix-print/gtk/print/gtkprintjob.h /usr/include/gtk-4.0/gtk/gtkcolumnviewcell.h /usr/include/gtk-4.0/gtk/gtklistheader.h /usr/include/gtk-4.0/unix-print/gtk/print/gtkprintunixdialog.h /usr/include/gtk-4.0/gdk/gdkgltexturebuilder.h"
packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1000.5", added "/usr/lib/libgtk-4.so.1.1200.0 /usr/bin/gtk4-rendernode-tool"
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1000.5 to libgtk-4.so.1.1200.0
  /usr/lib/libgtk-4.so.1.1000.5 moved to /usr/lib/libgtk-4.so.1.1200.0
  /usr/include/gtk-4.0/gdk/deprecated was added
  /usr/include/gtk-4.0/gdk/deprecated/gdkpixbuf.h was added
  /usr/include/gtk-4.0/gdk/gdkdragsurfacesize.h was added
  /usr/include/gtk-4.0/gdk/gdkgltexturebuilder.h was added
  /usr/include/gtk-4.0/gdk/version was added
  /usr/include/gtk-4.0/gdk/version/gdkversionmacros.h was added
  /usr/include/gtk-4.0/gdk/version/gdk-visibility.h was added
  /usr/include/gtk-4.0/gtk/gtkcolumnviewcell.h was added
  /usr/include/gtk-4.0/gtk/gtkcolumnviewrow.h was added
  /usr/include/gtk-4.0/gtk/gtklistheader.h was added
  /usr/include/gtk-4.0/gtk/gtkscrollinfo.h was added
  /usr/include/gtk-4.0/gtk/gtksectionmodel.h was added
  /usr/include/gtk-4.0/gtk/print was added
  /usr/include/gtk-4.0/gtk/print/gtkpagesetup.h was added
  /usr/include/gtk-4.0/gtk/print/gtkpapersize.h was added
  /usr/include/gtk-4.0/gtk/print/gtkprintcontext.h was added
  /usr/include/gtk-4.0/gtk/print/gtkprintoperation.h was added
  /usr/include/gtk-4.0/gtk/print/gtkprintoperationpreview.h was added
  /usr/include/gtk-4.0/gtk/print/gtkprintsettings.h was added
  /usr/include/gtk-4.0/unix-print/gtk/print was added
  /usr/include/gtk-4.0/unix-print/gtk/print/gtkpagesetupunixdialog.h was added
  /usr/include/gtk-4.0/unix-print/gtk/print/gtkprinter.h was added
  /usr/include/gtk-4.0/unix-print/gtk/print/gtkprintjob.h was added
  /usr/include/gtk-4.0/unix-print/gtk/print/gtkprintunixdialog.h was added
  /usr/include/gtk-4.0/gdk/gdkpixbuf.h was removed
  /usr/include/gtk-4.0/gdk/gdkversionmacros.h was removed
  /usr/include/gtk-4.0/gtk/gtkpagesetup.h was removed
  /usr/include/gtk-4.0/gtk/gtkpapersize.h was removed
  /usr/include/gtk-4.0/gtk/gtkprintcontext.h was removed
  /usr/include/gtk-4.0/gtk/gtkprintoperation.h was removed
  /usr/include/gtk-4.0/gtk/gtkprintoperationpreview.h was removed
  /usr/include/gtk-4.0/gtk/gtkprintsettings.h was removed
  /usr/include/gtk-4.0/unix-print/gtk/gtkpagesetupunixdialog.h was removed
  /usr/include/gtk-4.0/unix-print/gtk/gtkprinter.h was removed
  /usr/include/gtk-4.0/unix-print/gtk/gtkprintjob.h was removed
  /usr/include/gtk-4.0/unix-print/gtk/gtkprintunixdialog.h was removed
  /usr/include/gtk-4.0/unix-print/gtk/gtkunixprint-autocleanups.h was removed

--===============0267490515444012117==--

