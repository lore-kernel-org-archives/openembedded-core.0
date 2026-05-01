Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6450FCD4850
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15723.1777645549488820244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yiEquG6d;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=teKEQtsS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019de3ee84c8-2ef478ee-0885-45ea-8f71-7161d16c9d8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pE0szE/ywUTjG2vqQLBkwDioUhWkAyyEpfP5kHa4L9M=;
	b=yiEquG6dhcFlaOShm28r7IrFxQj9lbMkL080D6lnGuZm72nRqcagcYgcKuArrO7X
	JPafdUKu6fxWEcLr6wPS33aHiOhK68mtHCTtmmj8i16hcxnG63PgLCHD/T567TYvBCc
	S+rYKFpHey3RBiECgKZFfdXylf9Z+2hdW3BBSlPE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pE0szE/ywUTjG2vqQLBkwDioUhWkAyyEpfP5kHa4L9M=;
	b=teKEQtsS1xYPNWxybCgpldPflf46ROTInuJQR1dDUdTTvuEXnenQolPIrrhQjjPc
	sO3gxsMrxhV9ypgrmdygqTd9Fu1CvP8NV66AZT8GgQNZMrQ3yT9H18dTAVDQsbj59l8
	jxdlmI2Tqb5xcp8wg1X0VGLGhfUIRDwfIF8o00hQ=
Content-Type: multipart/mixed; boundary="===============5893069232370169107=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xwayland: upgrading to 24.1.11 SUCCEEDED
Message-ID: <0101019de3ee84c8-2ef478ee-0885-45ea-8f71-7161d16c9d8e-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236286

--===============5893069232370169107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xwayland* to *24.1.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-24.1.9-24.1.11.patch
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
From 0e80e3b1bdbadff59e81ff8282a89fd2edc3a2b0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 12:46:21 +0000
Subject: [PATCH] xwayland: upgrade 24.1.9 -> 24.1.11

---
 ...xwayland_24.1.9.bb => xwayland_24.1.11.bb} | 38 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.9.bb => xwayland_24.1.11.bb} (62%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
similarity index 62%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
index c4e2d7cfdb..a5cc7f41b6 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
@@ -1,3 +1,37 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -314,6 +314,11 @@
+#  OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+#  SOFTWARE.
+#  
+# +Except as contained in this notice, the name of Silicon Graphics, Inc.
+# +shall not be used in advertising or otherwise to promote the sale, use or
+# +other dealings in this Software without prior written authorization from
+# +Silicon Graphics, Inc.
+# +
+#  
+#  Copyright (c) 1994, 1995  Hewlett-Packard Company
+#  
+# @@ -1778,6 +1783,8 @@
+#  USE OR OTHER DEALINGS IN THE SOFTWARE.
+#  
+#  
+# +Author: Eamon Walsh <ewalsh@tycho.nsa.gov>
+# +
+#  Permission to use, copy, modify, distribute, and sell this software and its
+#  documentation for any purpose is hereby granted without fee, provided that
+#  this permission notice appear in supporting documentation.  This permission
+# 
+#
+
 SUMMARY = "XWayland is an X Server that runs under Wayland."
 DESCRIPTION = "XWayland is an X Server running as a Wayland client, \
 and thus is capable of displaying native X11 client applications in a \
@@ -7,10 +41,10 @@ a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0"
+SRC_URI[sha256sum] = "27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.47.1


--===============5893069232370169107==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.9-24.1.11.patch"

RnJvbSAwZTgwZTNiMWJkYmFkZmY1OWU4MWZmODI4MmE4OWZkMmVkYzNhMmIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMjo0NjoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh3
YXlsYW5kOiB1cGdyYWRlIDI0LjEuOSAtPiAyNC4xLjExCgotLS0KIC4uLnh3YXlsYW5kXzI0LjEu
OS5iYiA9PiB4d2F5bGFuZF8yNC4xLjExLmJifSB8IDM4ICsrKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC97eHdheWxhbmRfMjQuMS45LmJiID0+IHh3YXls
YW5kXzI0LjEuMTEuYmJ9ICg2MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuOS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5
bGFuZC94d2F5bGFuZF8yNC4xLjExLmJiCnNpbWlsYXJpdHkgaW5kZXggNjIlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjkuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjExLmJiCmlu
ZGV4IGM0ZTJkN2NmZGIuLmE1Y2M3ZjQxYjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuMTEuYmIKQEAgLTEsMyArMSwzNyBAQAorIyBGSVhN
RTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0
b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJ
Q0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRo
ZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTog
J0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hh
bmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTMxNCw2ICszMTQs
MTEgQEAKKyMgIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBP
UiBPVEhFUiBERUFMSU5HUyBJTiBUSEUKKyMgIFNPRlRXQVJFLgorIyAgCisjICtFeGNlcHQgYXMg
Y29udGFpbmVkIGluIHRoaXMgbm90aWNlLCB0aGUgbmFtZSBvZiBTaWxpY29uIEdyYXBoaWNzLCBJ
bmMuCisjICtzaGFsbCBub3QgYmUgdXNlZCBpbiBhZHZlcnRpc2luZyBvciBvdGhlcndpc2UgdG8g
cHJvbW90ZSB0aGUgc2FsZSwgdXNlIG9yCisjICtvdGhlciBkZWFsaW5ncyBpbiB0aGlzIFNvZnR3
YXJlIHdpdGhvdXQgcHJpb3Igd3JpdHRlbiBhdXRob3JpemF0aW9uIGZyb20KKyMgK1NpbGljb24g
R3JhcGhpY3MsIEluYy4KKyMgKworIyAgCisjICBDb3B5cmlnaHQgKGMpIDE5OTQsIDE5OTUgIEhl
d2xldHQtUGFja2FyZCBDb21wYW55CisjICAKKyMgQEAgLTE3NzgsNiArMTc4Myw4IEBACisjICBV
U0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorIyAgCisjICAKKyMgK0F1dGhv
cjogRWFtb24gV2Fsc2ggPGV3YWxzaEB0eWNoby5uc2EuZ292PgorIyArCisjICBQZXJtaXNzaW9u
IHRvIHVzZSwgY29weSwgbW9kaWZ5LCBkaXN0cmlidXRlLCBhbmQgc2VsbCB0aGlzIHNvZnR3YXJl
IGFuZCBpdHMKKyMgIGRvY3VtZW50YXRpb24gZm9yIGFueSBwdXJwb3NlIGlzIGhlcmVieSBncmFu
dGVkIHdpdGhvdXQgZmVlLCBwcm92aWRlZCB0aGF0CisjICB0aGlzIHBlcm1pc3Npb24gbm90aWNl
IGFwcGVhciBpbiBzdXBwb3J0aW5nIGRvY3VtZW50YXRpb24uICBUaGlzIHBlcm1pc3Npb24KKyMg
CisjCisKIFNVTU1BUlkgPSAiWFdheWxhbmQgaXMgYW4gWCBTZXJ2ZXIgdGhhdCBydW5zIHVuZGVy
IFdheWxhbmQuIgogREVTQ1JJUFRJT04gPSAiWFdheWxhbmQgaXMgYW4gWCBTZXJ2ZXIgcnVubmlu
ZyBhcyBhIFdheWxhbmQgY2xpZW50LCBcCiBhbmQgdGh1cyBpcyBjYXBhYmxlIG9mIGRpc3BsYXlp
bmcgbmF0aXZlIFgxMSBjbGllbnQgYXBwbGljYXRpb25zIGluIGEgXApAQCAtNywxMCArNDEsMTAg
QEAgYSB3YXkgdG8gcnVuIHVucG9ydGVkIGFwcGxpY2F0aW9ucyBpbiB0aGUgbWVhbnRpbWUuIgog
SE9NRVBBR0UgPSAiaHR0cHM6Ly9mZWRvcmFwcm9qZWN0Lm9yZy93aWtpL0NoYW5nZXMvWHdheWxh
bmRTdGFuZGFsb25lIgogCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0NPUFlJTkc7bWQ1PTIxZTMzZGNjY2YyZDUwMzRmNzk4YThlYTYyNjIyOTM5IgorTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Zjg3NzhjZmNkOTBlY2UwZTRiMjI1ZjMw
MTgyMjI3Y2EiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cueC5vcmcvYXJjaGl2ZS9pbmRpdmlk
dWFsL3hzZXJ2ZXIveHdheWxhbmQtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImYyOTdhZjI3YTg0NTA4ZGI5YjgwZDFjYmJjYzY5YzM4MDFkYTM4ZWI2NGM3MmYzYjViNTBmNTgy
NDU5YWZkZDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjcxMTVhMWE4ODE5MDc4NDA5YmY2ZmVj
ZmViNzcyNGU4MTM3YmQzNjQyNmRlNzAwNWE1YjNhYWUwYTIxMzhmZiIKIAogVVBTVFJFQU1fQ0hF
Q0tfUkVHRVggPSAieHdheWxhbmQtKD9QPHB2ZXI+XGQrKFwuKD8hOTBcZClcZCspKylcLnRhciIK
IAotLSAKMi40Ny4xCgo=

--===============5893069232370169107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-676d9f01245b30431c7442dba733efaa949f8d9b"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:676d9f01245b30431c7442dba733efaa949f8d9b"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 482 Local 418 Mirrors 0 Missed 64 Current 378 (86% match, 92% complete)
done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 450 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_populate_lic_setscene)
NOTE: Running setscene task 488 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 498 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 509 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 514 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 532 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 535 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 536 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 545 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 549 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 552 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 553 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe xwayland-24.1.11-r0: task do_populate_lic_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe encodings-1_1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 555 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xwayland-24.1.11-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 565 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 567 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 568 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 569 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 573 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 575 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 576 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_package_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 597 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 598 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 600 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 611 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 619 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_26.0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 632 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 633 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 642 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 646 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 650 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 651 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 656 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1202 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_fetch)
NOTE: Running task 1244 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_fetch)
NOTE: Running task 1247 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_fetch)
NOTE: Running task 1248 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_fetch)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_package_setscene: Started
NOTE: Running task 1258 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_write_config)
NOTE: Running task 1261 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_recipe_qa)
NOTE: Running task 1264 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_fetch)
NOTE: Running task 1265 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_fetch)
NOTE: Running task 1272 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_write_config)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1295 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_write_config)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_package_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 657 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_fetch: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_write_config: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_recipe_qa: Started
NOTE: Running setscene task 660 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_write_config: Started
NOTE: Running setscene task 664 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1339 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_write_config: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_write_config: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1340 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe xwayland-24.1.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 666 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1341 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_fetch)
NOTE: recipe x11-volatiles-1.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 667 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xwayland-24.1.11-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe xwayland-24.1.11-r0: task do_fetch: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1342 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_unpack)
NOTE: Running task 1343 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 671 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe x11-volatiles-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xwayland-24.1.11-r0: task do_unpack: Started
NOTE: Running setscene task 672 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/font-util/1.4.1/temp/log.do_packagedata_setscene.3494045
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 673 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_package_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 675 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 676 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xwayland-24.1.11-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1345 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_fetch)
NOTE: Running task 1346 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_package_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_deploy_source_date_epoch unihash changed to 6bf13d04571f1c77fa01f68f3442caf5d89a46d36953df7c3da0180718cdaf48
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_fetch: Started
NOTE: recipe xwayland-24.1.11-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_fetch: Succeeded
NOTE: Running task 1357 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_patch: Succeeded
NOTE: Running setscene task 683 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1358 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xwayland-24.1.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_unpack: Succeeded
NOTE: Running task 1381 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_patch)
NOTE: Running task 1400 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_create_recipe_spdx)
NOTE: Running task 1403 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_create_recipe_spdx)
NOTE: Running task 1406 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_recipe_spdx)
NOTE: Running task 1408 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_create_recipe_spdx)
NOTE: Running task 1409 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_create_recipe_spdx)
NOTE: recipe font-util-1.4.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 689 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_patch: Started
NOTE: recipe font-util-1.4.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe font-util-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 690 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1411 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_unpack)
NOTE: recipe mesa-2_26.0.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 691 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-24.1.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_unpack: Started
NOTE: Running setscene task 695 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 696 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe x11-volatiles-1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 698 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 699 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 702 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1413 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1414 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1416 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_create_recipe_spdx)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1417 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_create_recipe_spdx)
NOTE: Running setscene task 706 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_fetch: Started
NOTE: Running setscene task 711 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_unpack: Started
NOTE: Running setscene task 717 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 718 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 719 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libdrm/2.4.131/temp/log.do_packagedata_setscene.3495120
NOTE: Running setscene task 724 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 725 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_package_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 735 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 737 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 739 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_package_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1438 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: Running task 1444 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_patch)
NOTE: recipe libxfont2-2.0.7-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1452 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_unpack)
NOTE: Running task 1453 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 742 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_unpack: Started
NOTE: recipe expat-2.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 745 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_unpack: Started
NOTE: Running setscene task 752 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 753 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 755 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1460 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_unpack)
NOTE: Running task 1461 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1468 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_patch)
NOTE: Running task 1469 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_create_recipe_spdx)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1470 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1471 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_patch)
NOTE: recipe xkbcomp-1.5.0-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 765 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 768 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 770 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1483 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_patch: Succeeded
NOTE: Running task 1484 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_deploy_source_date_epoch unihash changed to dba4d95a3635e241ddf01349573d5e3f37365454ea38716bc5a0698eae658687
NOTE: recipe xkbcomp-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_deploy_source_date_epoch unihash changed to 28eb9c0403c27c4d5be8b76bc92736541b1da1f52131c98d555efc6152260faf
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 749 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1512 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_deploy_source_date_epoch unihash changed to 73ef7617d8e634b19d88bc5cabd2585171c160ce0bfd7b99e35dda346481012c
NOTE: recipe libxfont2-2.0.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1513 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_create_recipe_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_create_recipe_spdx: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 800 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_deploy_source_date_epoch unihash changed to dcbce7eb9109c264cd1459d3c74a5c07dbddcf4d8881caf9bdaeb92806768510
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe xwayland-24.1.11-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 822 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 824 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 831 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 844 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1907 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata)
NOTE: Running task 1910 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1933 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1936 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1947 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata)
NOTE: Running task 1962 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.4.1-r0: task do_packagedata: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1980 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_configure)
NOTE: Running noexec task 1981 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_compile)
NOTE: Running task 1982 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_install)
NOTE: recipe libxfont2-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1985 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_install: Started
NOTE: Running task 1988 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_configure)
NOTE: Running task 1994 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_write_ipk)
NOTE: Running task 1995 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_write_deb)
NOTE: Running task 1996 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_write_rpm)
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx: Started
NOTE: Running task 1997 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_qa)
NOTE: recipe libxfont2-2.0.7-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1998 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_configure)
NOTE: Running task 1999 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_configure)
NOTE: recipe x11-volatiles-1.0-r0: task do_install: Succeeded
NOTE: recipe mesa-2_26.0.5-r0: task do_package_write_ipk: Started
NOTE: Running task 2000 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package)
NOTE: Running task 2001 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_populate_sysroot)
NOTE: recipe mesa-2_26.0.5-r0: task do_package_write_deb: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_package_qa: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_configure: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2002 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_create_spdx)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_spdx: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_populate_sysroot unihash changed to d6685cc52475a6c10e90489b43e4f5b6a66db4e507085f8ffa13b3a60b93cab0
NOTE: Setscene tasks completed
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2003 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_compile)
NOTE: recipe libxcvt-0.1.3-r0: task do_compile: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2004 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_compile: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package unihash changed to 175fb18183f8cc8568fbac60e3eb40210a50fba8f34ccc37468ced8d06958db0
NOTE: Setscene tasks completed
NOTE: Running task 2005 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2006 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_install)
NOTE: recipe x11-volatiles-1.0-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_install: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_packagedata unihash changed to 464e0db075e531540bd79cc2f1bc901be7c4563a9636ec731b7883b2b79165b4
NOTE: Setscene tasks completed
NOTE: Running task 2007 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_create_spdx)
NOTE: Running task 2008 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_ipk)
NOTE: Running task 2009 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_deb)
NOTE: Running task 2010 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_rpm)
NOTE: Running task 2011 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_qa)
NOTE: recipe x11-volatiles-1.0-r0: task do_create_spdx: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_ipk: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_qa: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_deb: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_package_qa: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_install: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2012 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_package)
NOTE: Running task 2013 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_populate_sysroot)
NOTE: recipe libtirpc-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2014 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_unpack)
NOTE: Running task 2015 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2016 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_install)
NOTE: recipe x11-volatiles-1.0-r0: task do_package_qa: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_qa unihash changed to 9a6eddc6d4937f58df9df61621fce784583c83fe600c0e861b46041aae983446
NOTE: recipe libtirpc-1.3.7-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_install: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_ipk unihash changed to 6334594f1d853b06ad627c1d9e435d90deb86c2537e866e387300a87982dae32
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_rpm unihash changed to 179afad2055a20e4372f6f30e2fefe80efea90374986955262676c1bf19ac7db
NOTE: Running task 2017 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_deb unihash changed to 0b39167839dee693cfcc6f00efc0830858f1b20c45794ee4b1b43f6374766d49
NOTE: recipe libtirpc-1.3.7-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_populate_sysroot unihash changed to e0b7257a418bc528e5bd4495acd37e0bde59339e8f7bd5fcc2fae57dffa2b25f
NOTE: recipe libtirpc-1.3.7-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2018 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2019 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_package)
NOTE: Running task 2020 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libtirpc-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_deploy_source_date_epoch unihash changed to 768734c914a9cda24ac3510ea224a4bc589223647e25cfdf7c10c5a14b3c9bfa
NOTE: Setscene tasks completed
NOTE: Running task 2021 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_configure)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_populate_sysroot unihash changed to 11dcd04df95954755009668064919adcab6527f16133e63a0a77b8dfe6c10bfc
NOTE: recipe libxcvt-0.1.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_package unihash changed to a622c0c33e9b2b2eec0e19c366af351045c487506e96f2898a11180f889f0f26
NOTE: Setscene tasks completed
NOTE: Running task 2022 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_packagedata)
NOTE: Running task 2023 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_packagedata unihash changed to ae4eff1110d56f0f4b88383289e453eacca865100795c07a71fb27a408f73702
NOTE: Setscene tasks completed
NOTE: Running task 2024 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_configure)
NOTE: Running task 2025 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_spdx)
NOTE: recipe xkbcomp-1.5.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_package unihash changed to a24e931829fc68c77facfcdf934967f18e8fb9eae936e9f53f1fd6a3a0b9b12e
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2026 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_packagedata unihash changed to 122bba5bc3cadfa4ae078a9255467aa6b038a3939e859b0b423dfc506732e40f
NOTE: Setscene tasks completed
NOTE: Running task 2027 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2028 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_compile)
NOTE: recipe libxfont2-2.0.7-r0: task do_compile: Started
NOTE: recipe mesa-2_26.0.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2029 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_compile)
NOTE: recipe xkbcomp-1.5.0-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2030 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_install)
NOTE: recipe libxfont2-2.0.7-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2031 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_compile)
NOTE: recipe libtirpc-1.3.7-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2032 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_install)
NOTE: recipe libxfont2-2.0.7-r0: task do_install: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_install: Started
NOTE: Running task 2033 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_package)
NOTE: Running task 2034 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_populate_sysroot)
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_package: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 2035 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package)
NOTE: Running task 2036 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_populate_sysroot)
NOTE: recipe xkbcomp-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_populate_sysroot unihash changed to 344ea0976979fc59e5555f84d09336b33fa09a2620b351fd14c47857f25fd8e0
NOTE: Setscene tasks completed
NOTE: recipe libtirpc-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2037 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_install)
NOTE: recipe libtirpc-1.3.7-r0: task do_install: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_populate_sysroot unihash changed to f5a89a6f6cc0b43ec3e6b5b5ce9d743fb11cd2c87f3a605a2085e43784b46202
NOTE: Setscene tasks completed
NOTE: recipe libtirpc-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2038 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_package)
NOTE: Running task 2039 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_populate_sysroot)
NOTE: recipe libtirpc-1.3.7-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_populate_sysroot unihash changed to 3a74750040e6f8212a9b2685d982292bb049813769b17cc65a7874efd1f98ab5
NOTE: Setscene tasks completed
NOTE: Running task 2040 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-24.1.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_package unihash changed to e717141c004762fdc0fbfdbbcfb79c2dc196fa63a1b9629ef3f40b14f40517bd
NOTE: recipe xwayland-24.1.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2041 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata)
NOTE: Running task 2042 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_configure)
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package unihash changed to 6ffebecb0d643d54b38f98660dce343f13b83e889abacd26d1363dc25655752a
NOTE: Setscene tasks completed
NOTE: Running task 2043 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_packagedata)
NOTE: recipe xkbcomp-1.5.0-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata unihash changed to 83f027d49dcffd2b0af806ed55a7c1396069be5b42aa6edbc522296c85e9d3d1
NOTE: Setscene tasks completed
NOTE: Running task 2044 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_create_spdx)
NOTE: recipe xkbcomp-1.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_packagedata unihash changed to c437276f9ba486fa92ba308da75350bfd8cec3b3a379a0c8eb70756674af5fc4
NOTE: Setscene tasks completed
NOTE: Running task 2045 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_create_spdx)
NOTE: Running task 2046 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_ipk)
NOTE: Running task 2047 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_deb)
NOTE: Running task 2048 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_rpm)
NOTE: Running task 2049 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_qa)
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_ipk: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_deb: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_qa: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_ipk unihash changed to fde3c9cad49e83bd42d13dcb85871d8b73ba7ce41ac087572fe40c5ac72182d6
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_package unihash changed to 67b53359ff4349b71e47663ad3c3c7daa7ac95aaa83637b09d391a0561d26470
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_qa unihash changed to f0d6e7c4f3f6df5650c9f3446bd797340d99c27280ea86be1f842ebd4082f0f1
NOTE: Running task 2050 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_packagedata)
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_rpm unihash changed to 0447a0ca51fa302c41ce772a331047a2f24b708e5de09878e75c7494d4988e9c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_deb unihash changed to 87c21b6d6bd092f52dfa5f13e46405c125fb07ac1b7f4088fc6a6cd7a18e7dfd
NOTE: Setscene tasks completed
NOTE: recipe libtirpc-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_packagedata unihash changed to 3d66e54219b5cfc454fcc6aaf22b5504f5812af94875f326a44b55309e52a113
NOTE: Setscene tasks completed
NOTE: Running task 2051 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_create_spdx)
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2052 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_compile)
NOTE: recipe xwayland-24.1.11-r0: task do_compile: Started
NOTE: recipe xwayland-24.1.11-r0: task do_compile: Succeeded
NOTE: Running task 2053 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_install)
NOTE: recipe xwayland-24.1.11-r0: task do_install: Started
NOTE: recipe xwayland-24.1.11-r0: task do_install: Succeeded
NOTE: Running task 2054 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_package)
NOTE: Running task 2055 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_populate_sysroot)
NOTE: recipe xwayland-24.1.11-r0: task do_package: Started
NOTE: recipe xwayland-24.1.11-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-24.1.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_package: Succeeded
NOTE: Running task 2056 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_packagedata)
NOTE: recipe xwayland-24.1.11-r0: task do_packagedata: Started
NOTE: recipe xwayland-24.1.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2057 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_create_spdx)
NOTE: Running task 2058 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_package_write_ipk)
NOTE: Running task 2059 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_package_write_deb)
NOTE: Running task 2060 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_package_write_rpm)
NOTE: Running task 2061 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_package_qa)
NOTE: recipe xwayland-24.1.11-r0: task do_create_spdx: Started
NOTE: recipe xwayland-24.1.11-r0: task do_package_write_ipk: Started
NOTE: recipe xwayland-24.1.11-r0: task do_package_write_deb: Started
NOTE: recipe xwayland-24.1.11-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-24.1.11-r0: task do_package_qa: Started
NOTE: recipe xwayland-24.1.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 2062 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_create_package_spdx)
NOTE: recipe xwayland-24.1.11-r0: task do_create_package_spdx: Started
NOTE: recipe xwayland-24.1.11-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_create_package_spdx: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2063 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_build)
NOTE: Tasks Summary: Attempted 2063 tasks of which 1938 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 26 ERROR messages, returning a non-zero exit code.
ERROR: font-util-1.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-src went backwards which would break package feeds (from 0:1.4.2-r0 to 0:1.4.1-r0) [version-going-backwards]
ERROR: font-util-1.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dbg went backwards which would break package feeds (from 0:1.4.2-r0 to 0:1.4.1-r0) [version-going-backwards]
ERROR: font-util-1.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-staticdev went backwards which would break package feeds (from 0:1.4.2-r0 to 0:1.4.1-r0) [version-going-backwards]
ERROR: font-util-1.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-dev went backwards which would break package feeds (from 0:1.4.2-r0 to 0:1.4.1-r0) [version-going-backwards]
ERROR: font-util-1.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-doc went backwards which would break package feeds (from 0:1.4.2-r0 to 0:1.4.1-r0) [version-going-backwards]
ERROR: font-util-1.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package font-util-locale went backwards which would break package feeds (from 0:1.4.2-r0 to 0:1.4.1-r0) [version-going-backwards]
ERROR: font-util-1.4.1-r0 do_packagedata_setscene: QA Issue: Package version for package font-util went backwards which would break package feeds (from 0:1.4.2-r0 to 0:1.4.1-r0) [version-going-backwards]
ERROR: font-util-1.4.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.133-r0 to 0:2.4.131-r0) [version-going-backwards]
ERROR: libdrm-2.4.131-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5893069232370169107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xwayland: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.9.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.11.tar.xz"
packages/x86-64-v3-poky-linux/xwayland: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 12583272 to 12592000 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PKGSIZE changed from 540 to 541 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PKGSIZE changed from 31919 to 31921 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8902012 to 8908064 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: FILELIST: directory renamed /usr/src/debug/xwayland/24.1.9/dix -> /usr/src/debug/xwayland/24.1.11/dix, directory renamed /usr/src/debug/xwayland/24.1.9/present -> /usr/src/debug/xwayland/24.1.11/present, directory renamed /usr/src/debug/xwayland/24.1.9/miext/sync -> /usr/src/debug/xwayland/24.1.11/miext/sync, directory renamed /usr/src/debug/xwayland/24.1.9/xkb -> /usr/src/debug/xwayland/24.1.11/xkb, directory renamed /usr/src/debug/xwayland/24.1.9/dri3 -> /usr/src/debug/xwayland/24.1.11/dri3, directory renamed /usr/src/debug/xwayland/24.1.9/include -> /usr/src/debug/xwayland/24.1.11/include, directory renamed /usr/src/debug/xwayland/24.1.9/hw/xwayland -> /usr/src/debug/xwayland/24.1.11/hw/xwayland, directory renamed /usr/src/debug/xwayland/24.1.9/composite -> /usr/src/debug/xwayland/24.1.11/composite, directory renamed /usr/src/debug/xwayland/24.1.9/glamor -> /usr/src/debug/xwayland/24.1.11/glamor, directory renamed /usr/src/debug
 /xwayland/24.1.9/hw/xwayland/Xwayland.p -> /usr/src/debug/xwayland/24.1.11/hw/xwayland/Xwayland.p, directory renamed /usr/src/debug/xwayland/24.1.9/os -> /usr/src/debug/xwayland/24.1.11/os, directory renamed /usr/src/debug/xwayland/24.1.9/miext/damage -> /usr/src/debug/xwayland/24.1.11/miext/damage, directory renamed /usr/src/debug/xwayland/24.1.9/damageext -> /usr/src/debug/xwayland/24.1.11/damageext, directory renamed /usr/src/debug/xwayland/24.1.9/xfixes -> /usr/src/debug/xwayland/24.1.11/xfixes, directory renamed /usr/src/debug/xwayland/24.1.9/fb -> /usr/src/debug/xwayland/24.1.11/fb, directory renamed /usr/src/debug/xwayland/24.1.9/record -> /usr/src/debug/xwayland/24.1.11/record, directory renamed /usr/src/debug/xwayland/24.1.9/Xext -> /usr/src/debug/xwayland/24.1.11/Xext, directory renamed /usr/src/debug/xwayland/24.1.9/render -> /usr/src/debug/xwayland/24.1.11/render, directory renamed /usr/src/debug/xwayland/24.1.9/mi -> /usr/src/debug/xwayland/24.1.11/mi, directory renamed
  /usr/src/debug/xwayland/24.1.9/Xi -> /usr/src/debug/xwayland/24.1.11/Xi, directory renamed /usr/src/debug/xwayland/24.1.9/dbe -> /usr/src/debug/xwayland/24.1.11/dbe, directory renamed /usr/src/debug/xwayland/24.1.9/glx -> /usr/src/debug/xwayland/24.1.11/glx, directory renamed /usr/src/debug/xwayland/24.1.9/randr -> /usr/src/debug/xwayland/24.1.11/randr
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland: PKGV changed from 24.1.9 [default] to 24.1.11 [default]

--===============5893069232370169107==--

