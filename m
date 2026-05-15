Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E708CD5BC1
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:50 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34819.1778851226675266815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RIH1vysW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ra4xZq+q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e2bcbd96a-a0a8da9c-a1e5-4693-8fe4-59ade54190ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851240;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+9dLc4qE9ZDEjpmwx0GM9IGjGCHHw0bDDoS9qBrj214=;
	b=RIH1vysWAfoRcOgBiphsD4/MxB++WU+ocJyg2mm+Y+95fbwvIY0lPOllfdHgc7hs
	Fmsn8X2dszdhXMTFTBOQi5CsTeoIqTwALKAjY3PjCSM4Y2jSZL3P9fmHLcWvwqkLjxc
	q0OnJIP20EYNEVW5uST1AhBR0kRj/HHyQhz6JvHg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851240;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+9dLc4qE9ZDEjpmwx0GM9IGjGCHHw0bDDoS9qBrj214=;
	b=Ra4xZq+qb1x38rHQuqJIs4AwyLTg7COGIh9r+/8l4byi5+N03VZbzrn0CydfHjO8
	JaZO4A9XhgFZ38+7Ejz9DxD2eB31IYrYijIg2vFeYMGJy1wNfD1ohvbCemqdRkjdCkZ
	S5QIWdC+nYY+UWDhjvXYEur1+raxWxz/kkTBrPx0=
Content-Type: multipart/mixed; boundary="===============7179135643930469035=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xwayland: upgrading to 24.1.11 SUCCEEDED
Message-ID: <0101019e2bcbd96a-a0a8da9c-a1e5-4693-8fe4-59ade54190ae-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237156

--===============7179135643930469035==
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
From 03e0ea5d9e5969241b537f3c278094b44a523498 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 10:55:36 +0000
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


--===============7179135643930469035==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.9-24.1.11.patch"

RnJvbSAwM2UwZWE1ZDllNTk2OTI0MWI1MzdmM2MyNzgwOTRiNDRhNTIzNDk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTA6NTU6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2F5bGFuZDogdXBncmFkZSAyNC4xLjkgLT4gMjQuMS4xMQoKLS0tCiAuLi54d2F5bGFuZF8yNC4x
LjkuYmIgPT4geHdheWxhbmRfMjQuMS4xMS5iYn0gfCAzOCArKysrKysrKysrKysrKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQve3h3YXlsYW5kXzI0LjEuOS5iYiA9PiB4d2F5
bGFuZF8yNC4xLjExLmJifSAoNjIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjkuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjQuMS4xMS5iYgpzaW1pbGFyaXR5IGluZGV4IDYyJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS45LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4xMS5iYgpp
bmRleCBjNGUyZDdjZmRiLi5hNWNjN2Y0MWI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjExLmJiCkBAIC0xLDMgKzEsMzcgQEAKKyMgRklY
TUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2
dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBM
SUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0
aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6
ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNo
YW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0zMTQsNiArMzE0
LDExIEBACisjICBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0Ug
T1IgT1RIRVIgREVBTElOR1MgSU4gVEhFCisjICBTT0ZUV0FSRS4KKyMgIAorIyArRXhjZXB0IGFz
IGNvbnRhaW5lZCBpbiB0aGlzIG5vdGljZSwgdGhlIG5hbWUgb2YgU2lsaWNvbiBHcmFwaGljcywg
SW5jLgorIyArc2hhbGwgbm90IGJlIHVzZWQgaW4gYWR2ZXJ0aXNpbmcgb3Igb3RoZXJ3aXNlIHRv
IHByb21vdGUgdGhlIHNhbGUsIHVzZSBvcgorIyArb3RoZXIgZGVhbGluZ3MgaW4gdGhpcyBTb2Z0
d2FyZSB3aXRob3V0IHByaW9yIHdyaXR0ZW4gYXV0aG9yaXphdGlvbiBmcm9tCisjICtTaWxpY29u
IEdyYXBoaWNzLCBJbmMuCisjICsKKyMgIAorIyAgQ29weXJpZ2h0IChjKSAxOTk0LCAxOTk1ICBI
ZXdsZXR0LVBhY2thcmQgQ29tcGFueQorIyAgCisjIEBAIC0xNzc4LDYgKzE3ODMsOCBAQAorIyAg
VVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyMgIAorIyAgCisjICtBdXRo
b3I6IEVhbW9uIFdhbHNoIDxld2Fsc2hAdHljaG8ubnNhLmdvdj4KKyMgKworIyAgUGVybWlzc2lv
biB0byB1c2UsIGNvcHksIG1vZGlmeSwgZGlzdHJpYnV0ZSwgYW5kIHNlbGwgdGhpcyBzb2Z0d2Fy
ZSBhbmQgaXRzCisjICBkb2N1bWVudGF0aW9uIGZvciBhbnkgcHVycG9zZSBpcyBoZXJlYnkgZ3Jh
bnRlZCB3aXRob3V0IGZlZSwgcHJvdmlkZWQgdGhhdAorIyAgdGhpcyBwZXJtaXNzaW9uIG5vdGlj
ZSBhcHBlYXIgaW4gc3VwcG9ydGluZyBkb2N1bWVudGF0aW9uLiAgVGhpcyBwZXJtaXNzaW9uCisj
IAorIworCiBTVU1NQVJZID0gIlhXYXlsYW5kIGlzIGFuIFggU2VydmVyIHRoYXQgcnVucyB1bmRl
ciBXYXlsYW5kLiIKIERFU0NSSVBUSU9OID0gIlhXYXlsYW5kIGlzIGFuIFggU2VydmVyIHJ1bm5p
bmcgYXMgYSBXYXlsYW5kIGNsaWVudCwgXAogYW5kIHRodXMgaXMgY2FwYWJsZSBvZiBkaXNwbGF5
aW5nIG5hdGl2ZSBYMTEgY2xpZW50IGFwcGxpY2F0aW9ucyBpbiBhIFwKQEAgLTcsMTAgKzQxLDEw
IEBAIGEgd2F5IHRvIHJ1biB1bnBvcnRlZCBhcHBsaWNhdGlvbnMgaW4gdGhlIG1lYW50aW1lLiIK
IEhPTUVQQUdFID0gImh0dHBzOi8vZmVkb3JhcHJvamVjdC5vcmcvd2lraS9DaGFuZ2VzL1h3YXls
YW5kU3RhbmRhbG9uZSIKIAogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT0yMWUzM2RjY2NmMmQ1MDM0Zjc5OGE4ZWE2MjYyMjkzOSIKK0xJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWY4Nzc4Y2ZjZDkwZWNlMGU0YjIyNWYz
MDE4MjIyN2NhIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lngub3JnL2FyY2hpdmUvaW5kaXZp
ZHVhbC94c2VydmVyL3h3YXlsYW5kLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJmMjk3YWYyN2E4NDUwOGRiOWI4MGQxY2JiY2M2OWMzODAxZGEzOGViNjRjNzJmM2I1YjUwZjU4
MjQ1OWFmZGQwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI3MTE1YTFhODgxOTA3ODQwOWJmNmZl
Y2ZlYjc3MjRlODEzN2JkMzY0MjZkZTcwMDVhNWIzYWFlMGEyMTM4ZmYiCiAKIFVQU1RSRUFNX0NI
RUNLX1JFR0VYID0gInh3YXlsYW5kLSg/UDxwdmVyPlxkKyhcLig/ITkwXGQpXGQrKSspXC50YXIi
CiAKLS0gCjIuNDcuMQoK

--===============7179135643930469035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-4991b635a138d5778a22c924c70d6ec67e22e3df"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:4991b635a138d5778a22c924c70d6ec67e22e3df"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 487 Local 412 Mirrors 0 Missed 75 Current 373 (84% match, 91% complete)
done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 448 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_populate_lic_setscene)
NOTE: Running setscene task 483 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 485 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 511 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 527 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 528 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 534 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 538 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 539 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 540 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_create_spdx_setscene)
NOTE: Running setscene task 545 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_spdx_setscene)
NOTE: Running setscene task 550 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 551 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 552 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 554 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 560 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_populate_sysroot_setscene)
NOTE: recipe xwayland-24.1.11-r0: task do_populate_lic_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 562 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 563 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe xwayland-24.1.11-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 568 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 569 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 570 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 574 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 575 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 576 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 580 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xwayland-24.1.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 587 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 588 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 589 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xwayland-24.1.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 591 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 597 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_recipe_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/xrandr/1.5.3/temp/log.do_packagedata_setscene.2574829
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 600 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 601 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 604 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 606 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 608 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 609 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_package_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 612 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 613 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 622 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 626 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package_setscene)
NOTE: Running setscene task 628 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 634 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 652 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 655 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 657 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 659 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 660 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 664 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 667 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 675 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 677 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 681 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 682 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 683 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 686 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 689 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 690 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 695 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 696 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 698 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 701 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 703 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 705 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 707 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 710 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 715 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 718 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 721 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_package_setscene)
NOTE: Running setscene task 730 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 732 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 733 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_package_setscene: Started
NOTE: Running setscene task 735 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 742 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 744 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 746 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 747 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 748 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 754 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 759 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 762 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 763 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 765 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 769 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 770 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running task 1071 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 779 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1298 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_fetch)
NOTE: Running task 1302 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_fetch)
NOTE: Running task 1342 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1344 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_fetch)
NOTE: Running task 1345 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_fetch)
NOTE: Running task 1346 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_fetch)
NOTE: Running task 1349 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: Running task 1355 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_write_config)
NOTE: recipe mesa-2_26.0.6-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1359 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_fetch)
NOTE: recipe font-util-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1361 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_fetch)
NOTE: Running task 1362 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1370 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 1371 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_unpack)
NOTE: recipe libxcvt-0.1.3-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_write_config: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 784 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_fetch: Started
NOTE: Running setscene task 785 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_write_config: Started
NOTE: recipe xwayland-24.1.11-r0: task do_fetch: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_fetch: Started
NOTE: Running setscene task 786 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe x11-volatiles-1.0-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe font-util-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 787 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_unpack: Started
NOTE: Running setscene task 792 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_unpack: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_write_config: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 794 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 801 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1405 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1407 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1409 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running setscene task 805 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running task 1414 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running task 1426 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_fetch: Started
NOTE: Running setscene task 817 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 818 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-24.1.11-r0: task do_unpack: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1427 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1435 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 821 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1442 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_write_config)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1449 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe font-util-1.4.2-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_write_config: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 823 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe x11-volatiles-1.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_unpack: Succeeded
NOTE: Running task 1456 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_patch)
NOTE: recipe x11-volatiles-1.0-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1470 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_patch)
NOTE: Running setscene task 826 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1487 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 1491 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx)
NOTE: recipe libxcvt-0.1.3-r0: task do_write_config: Succeeded
NOTE: Running task 1495 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_create_recipe_spdx)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_patch: Started
NOTE: recipe xwayland-24.1.11-r0: task do_patch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-24.1.11-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_patch: Succeeded
NOTE: Running task 1507 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1515 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_create_recipe_spdx)
NOTE: recipe mesa-2_26.0.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-24.1.11-r0: task do_write_config: Succeeded
NOTE: Running task 1533 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_create_recipe_spdx)
NOTE: Running task 1534 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_recipe_spdx)
NOTE: recipe x11-volatiles-1.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1535 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 829 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xwayland-24.1.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running setscene task 831 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1536 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1542 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_create_recipe_spdx)
NOTE: recipe xwayland-24.1.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_deploy_source_date_epoch unihash changed to 1898038ab277650651f0dd6a604d9e67ab21e958797a0a6d0ce9a762b322624b
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1543 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx)
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 835 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 836 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1544 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe x11-volatiles-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_deploy_source_date_epoch unihash changed to 6bf13d04571f1c77fa01f68f3442caf5d89a46d36953df7c3da0180718cdaf48
NOTE: recipe libxcvt-0.1.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 833 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 836 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1545 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1563 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_create_recipe_spdx)
NOTE: Running task 1564 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_create_recipe_spdx)
NOTE: recipe libxcvt-0.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1565 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1566 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_unpack: Started
NOTE: Running task 1568 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_create_recipe_spdx)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_patch)
NOTE: recipe libxfont2-2.0.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 845 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch unihash changed to 28bfd3348bccd791291e882f72f38b3a1f856323f3711b7825f5f6688cd82994
NOTE: recipe x11-volatiles-1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1572 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1576 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb:do_create_recipe_spdx)
NOTE: recipe libtirpc-1.3.7-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 854 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe xwayland-24.1.11-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1588 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_unpack)
NOTE: recipe libtirpc-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1589 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1590 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_patch)
NOTE: recipe libxfont2-2.0.7-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_deploy_source_date_epoch unihash changed to dba4d95a3635e241ddf01349573d5e3f37365454ea38716bc5a0698eae658687
NOTE: recipe libtirpc-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_patch: Started
NOTE: Running setscene task 847 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 1596 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_unpack)
NOTE: recipe libxfont2-2.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1597 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_patch)
NOTE: recipe xwayland-24.1.11-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1598 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 860 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libxcvt-0.1.3-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1599 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xkbcomp-1.5.0-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_deploy_source_date_epoch unihash changed to 768734c914a9cda24ac3510ea224a4bc589223647e25cfdf7c10c5a14b3c9bfa
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1618 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1619 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1869 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1906 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_patch: Started
NOTE: Running task 1924 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata)
NOTE: Running task 1929 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1930 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1931 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1955 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1956 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1970 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb:do_create_spdx)
NOTE: recipe mesa-2_26.0.6-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1975 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_deploy_source_date_epoch unihash changed to 28eb9c0403c27c4d5be8b76bc92736541b1da1f52131c98d555efc6152260faf
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.2-r0: task do_create_spdx: Started
NOTE: Running task 1976 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe libxfont2-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_deploy_source_date_epoch unihash changed to 73ef7617d8e634b19d88bc5cabd2585171c160ce0bfd7b99e35dda346481012c
NOTE: recipe mesa-2_26.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: recipe x11-volatiles-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1977 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_configure)
NOTE: Running noexec task 1978 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_compile)
NOTE: Running task 1979 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_install)
NOTE: recipe mesa-2_26.0.6-r0: task do_rust_gen_targets: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_rust_gen_targets: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_deploy_source_date_epoch unihash changed to dcbce7eb9109c264cd1459d3c74a5c07dbddcf4d8881caf9bdaeb92806768510
NOTE: recipe libtirpc-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1980 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_configure)
NOTE: recipe libxfont2-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_install: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1982 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch unihash changed to a5687d6c8b3103e663668a0180858ffebdb793773e62720b43acb1fccc7b1ac0
NOTE: recipe libtirpc-1.3.7-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: recipe libxcvt-0.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1983 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_configure)
NOTE: recipe font-util-1.4.2-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1984 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_configure)
NOTE: recipe x11-volatiles-1.0-r0: task do_install: Succeeded
NOTE: Running task 1985 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb:do_create_spdx)
NOTE: Running task 1986 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package)
NOTE: Running task 1987 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 1988 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe x11-volatiles-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_rust_create_wrappers: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libfontenc-1_1.1.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 1989 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe x11-volatiles-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1990 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_compile)
NOTE: recipe libxcvt-0.1.3-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1991 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_compile: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package: Succeeded
NOTE: Running task 1992 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_packagedata)
NOTE: recipe x11-volatiles-1.0-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1993 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_install)
NOTE: recipe libxcvt-0.1.3-r0: task do_install: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_packagedata unihash changed to 464e0db075e531540bd79cc2f1bc901be7c4563a9636ec731b7883b2b79165b4
NOTE: Setscene tasks completed
NOTE: Running task 1994 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_create_spdx)
NOTE: Running task 1995 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_ipk)
NOTE: Running task 1996 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_deb)
NOTE: Running task 1997 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_rpm)
NOTE: Running task 1998 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_qa)
NOTE: recipe x11-volatiles-1.0-r0: task do_create_spdx: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_ipk: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_deb: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_rpm: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_qa: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_install: Succeeded
NOTE: Running task 1999 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_package)
NOTE: Running task 2000 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2001 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_install)
NOTE: recipe libxcvt-0.1.3-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe x11-volatiles-1.0-r0: task do_package_qa: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_qa unihash changed to 9a6eddc6d4937f58df9df61621fce784583c83fe600c0e861b46041aae983446
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_ipk unihash changed to 6334594f1d853b06ad627c1d9e435d90deb86c2537e866e387300a87982dae32
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_deb unihash changed to 0b39167839dee693cfcc6f00efc0830858f1b20c45794ee4b1b43f6374766d49
NOTE: recipe x11-volatiles-1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/x11-common/x11-volatiles.bb:do_package_write_rpm unihash changed to 179afad2055a20e4372f6f30e2fefe80efea90374986955262676c1bf19ac7db
NOTE: recipe libxcvt-0.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2002 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_package)
NOTE: Running task 2003 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.3-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2005 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_packagedata)
NOTE: recipe xkbcomp-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2006 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_packagedata unihash changed to ae4eff1110d56f0f4b88383289e453eacca865100795c07a71fb27a408f73702
NOTE: recipe xkbcomp-1.5.0-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 2007 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2008 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_packagedata unihash changed to 122bba5bc3cadfa4ae078a9255467aa6b038a3939e859b0b423dfc506732e40f
NOTE: Setscene tasks completed
NOTE: Running task 2009 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2010 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_compile)
NOTE: recipe libtirpc-1.3.7-r0: task do_compile: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2011 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe mesa-2_26.0.6-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2012 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_install)
NOTE: recipe libtirpc-1.3.7-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2013 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_package)
NOTE: Running task 2014 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_populate_sysroot)
NOTE: recipe libxfont2-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2015 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_compile)
NOTE: recipe libtirpc-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2016 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_compile)
NOTE: recipe xkbcomp-1.5.0-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2017 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_install)
NOTE: recipe libxfont2-2.0.7-r0: task do_install: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2018 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_install)
NOTE: recipe xkbcomp-1.5.0-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 2019 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_package)
NOTE: Running task 2020 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_populate_sysroot)
NOTE: recipe xkbcomp-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 2021 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package)
NOTE: Running task 2022 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_populate_sysroot)
NOTE: recipe libxfont2-2.0.7-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2023 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_packagedata)
NOTE: recipe xkbcomp-1.5.0-r0: task do_package: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_packagedata unihash changed to 3d66e54219b5cfc454fcc6aaf22b5504f5812af94875f326a44b55309e52a113
NOTE: Setscene tasks completed
NOTE: Running task 2024 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_create_spdx)
NOTE: recipe libxfont2-2.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package: Succeeded
NOTE: Running task 2025 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.7-r0: task do_package: Succeeded
NOTE: Running task 2026 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata)
NOTE: recipe xkbcomp-1.5.0-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_packagedata unihash changed to c437276f9ba486fa92ba308da75350bfd8cec3b3a379a0c8eb70756674af5fc4
NOTE: recipe libxfont2-2.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2027 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_packagedata unihash changed to 83f027d49dcffd2b0af806ed55a7c1396069be5b42aa6edbc522296c85e9d3d1
NOTE: Setscene tasks completed
NOTE: Running task 2028 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb:do_create_spdx)
NOTE: Running task 2029 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_ipk)
NOTE: Running task 2030 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_deb)
NOTE: Running task 2031 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_spdx: Started
NOTE: Running task 2032 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_qa)
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_ipk: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_deb: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_qa: Started
NOTE: recipe xkbcomp-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfont2-2.0.7-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xkbcomp_1.5.0.bb:do_package_qa unihash changed to f0d6e7c4f3f6df5650c9f3446bd797340d99c27280ea86be1f842ebd4082f0f1
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.5.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2033 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe mesa-2_26.0.6-r0: task do_install: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_install: Succeeded
NOTE: Running task 2034 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: Running task 2035 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package)
NOTE: recipe mesa-2_26.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_package: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2036 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2037 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 2038 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_package: Succeeded
NOTE: Running task 2039 of 2063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata)
NOTE: recipe mesa-2_26.0.6-r0: task do_packagedata: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_packagedata: Failed
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2039 tasks of which 1910 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515105418.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515105418.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/mesa/26.0.6/temp/log.do_packagedata.2602226
Summary: There were 36 ERROR messages, returning a non-zero exit code.
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-src went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-dbg went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-staticdev went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-dev went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-doc went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr-locale went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package xrandr went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: xrandr-1_1.5.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgallium went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libteflon went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:26.1.0-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/mesa/26.0.6/temp/log.do_packagedata.2602226
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata) failed with exit code '1'

--===============7179135643930469035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.9.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.11.tar.xz"
packages/x86-64-v3-poky-linux/xwayland: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 12583920 to 12592576 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PKGSIZE changed from 540 to 541 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PKGSIZE changed from 31919 to 31921 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: FILELIST: directory renamed /usr/src/debug/xwayland/24.1.9/hw/xwayland -> /usr/src/debug/xwayland/24.1.11/hw/xwayland, directory renamed /usr/src/debug/xwayland/24.1.9/glx -> /usr/src/debug/xwayland/24.1.11/glx, directory renamed /usr/src/debug/xwayland/24.1.9/randr -> /usr/src/debug/xwayland/24.1.11/randr, directory renamed /usr/src/debug/xwayland/24.1.9/dri3 -> /usr/src/debug/xwayland/24.1.11/dri3, directory renamed /usr/src/debug/xwayland/24.1.9/hw/xwayland/Xwayland.p -> /usr/src/debug/xwayland/24.1.11/hw/xwayland/Xwayland.p, directory renamed /usr/src/debug/xwayland/24.1.9/include -> /usr/src/debug/xwayland/24.1.11/include, directory renamed /usr/src/debug/xwayland/24.1.9/miext/damage -> /usr/src/debug/xwayland/24.1.11/miext/damage, directory renamed /usr/src/debug/xwayland/24.1.9/damageext -> /usr/src/debug/xwayland/24.1.11/damageext, directory renamed /usr/src/debug/xwayland/24.1.9/dbe -> /usr/src/debug/xwayland/24.1.11/dbe, 
 directory renamed /usr/src/debug/xwayland/24.1.9/miext/sync -> /usr/src/debug/xwayland/24.1.11/miext/sync, directory renamed /usr/src/debug/xwayland/24.1.9/Xi -> /usr/src/debug/xwayland/24.1.11/Xi, directory renamed /usr/src/debug/xwayland/24.1.9/mi -> /usr/src/debug/xwayland/24.1.11/mi, directory renamed /usr/src/debug/xwayland/24.1.9/xkb -> /usr/src/debug/xwayland/24.1.11/xkb, directory renamed /usr/src/debug/xwayland/24.1.9/fb -> /usr/src/debug/xwayland/24.1.11/fb, directory renamed /usr/src/debug/xwayland/24.1.9/Xext -> /usr/src/debug/xwayland/24.1.11/Xext, directory renamed /usr/src/debug/xwayland/24.1.9/dix -> /usr/src/debug/xwayland/24.1.11/dix, directory renamed /usr/src/debug/xwayland/24.1.9/render -> /usr/src/debug/xwayland/24.1.11/render, directory renamed /usr/src/debug/xwayland/24.1.9/record -> /usr/src/debug/xwayland/24.1.11/record, directory renamed /usr/src/debug/xwayland/24.1.9/os -> /usr/src/debug/xwayland/24.1.11/os, directory renamed /usr/src/debug/xwayland/24.1.
 9/composite -> /usr/src/debug/xwayland/24.1.11/composite, directory renamed /usr/src/debug/xwayland/24.1.9/xfixes -> /usr/src/debug/xwayland/24.1.11/xfixes, directory renamed /usr/src/debug/xwayland/24.1.9/glamor -> /usr/src/debug/xwayland/24.1.11/glamor, directory renamed /usr/src/debug/xwayland/24.1.9/present -> /usr/src/debug/xwayland/24.1.11/present
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8902012 to 8908064 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PV changed from "24.1.9" to "24.1.11"
packages/x86-64-v3-poky-linux/xwayland/xwayland: PKGV changed from 24.1.9 [default] to 24.1.11 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland: PV changed from "24.1.9" to "24.1.11"

--===============7179135643930469035==--

