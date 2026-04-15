Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04A1F43849
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:57 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19740.1776261876710485576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1AYILsTT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uuxp8im1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d917587a5-b8af832c-d2e0-4700-89c6-7be82cdd96f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VtcTfOJ4ygUeuHe9t7w5N+rZ2NM8ZnE+nGUunurigFk=;
	b=1AYILsTTooR0tor7L9mCEvVQaIhgfUA3BGz0XRo9a/sLHoXmMOXIWReZt0rElTUY
	Fce7rwxGYSzwi47r0vH8ifxEasaP90dpA3LqQYmuCxDi2T/1126UDZqaeqTgFAPHWPe
	VPuEzbOAec/3Dmdp5jmoIYwMyHH9QD2S1NhGBON0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261892;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VtcTfOJ4ygUeuHe9t7w5N+rZ2NM8ZnE+nGUunurigFk=;
	b=uuxp8im1mqRs1mKmcn7Sk51Tod25YmEk+8zN7rCmbQAev6aJwVDVunKlZu0lZzAy
	7Via8vunYkGu8zdoTLAMJTWKUZ1DxnSzfeKnZBZAwQ4zosxWT0GaVRBNtdDbQ316Ggn
	98wAVdiEqiC/G9OB4c2ZywhdbszNta3yNoqT4E08=
Content-Type: multipart/mixed; boundary="===============7750290314657814462=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xserver-xorg: upgrading to 21.1.22 SUCCEEDED
Message-ID: <0101019d917587a5-b8af832c-d2e0-4700-89c6-7be82cdd96f4-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235290

--===============7750290314657814462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xserver-xorg* to *21.1.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.21-21.1.22.patch
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
From ecfa0956d52a3c3abd9313acdb91db0c28ad0581 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 12:31:18 +0000
Subject: [PATCH] xserver-xorg: upgrade 21.1.21 -> 21.1.22

---
 .../xorg-xserver/xserver-xorg.inc             |  2 +-
 ...-Intel-ddx-only-for-pre-gen4-hardwar.patch |  2 +-
 ...org_21.1.21.bb => xserver-xorg_21.1.22.bb} | 36 ++++++++++++++++++-
 3 files changed, 37 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.21.bb => xserver-xorg_21.1.22.bb} (44%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 59c373280e..0d8d782712 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -2,7 +2,7 @@ SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index 7d151aaa63..fc00a2871b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From 6d23037f48f3d534286fc2bda927c9b6ee5d1445 Mon Sep 17 00:00:00 2001
+From 4f5ba9e7a7a5df72d326fbaccae13941931ca9c9 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
similarity index 44%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
index 3781234c84..2be5e2d2fb 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
@@ -1,7 +1,41 @@
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
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519"
+SRC_URI[sha256sum] = "1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.47.1


--===============7750290314657814462==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.21-21.1.22.patch"

RnJvbSBlY2ZhMDk1NmQ1MmEzYzNhYmQ5MzEzYWNkYjkxZGIwYzI4YWQwNTgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTI6MzE6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
c2VydmVyLXhvcmc6IHVwZ3JhZGUgMjEuMS4yMSAtPiAyMS4xLjIyCgotLS0KIC4uLi94b3JnLXhz
ZXJ2ZXIveHNlcnZlci14b3JnLmluYyAgICAgICAgICAgICB8ICAyICstCiAuLi4tSW50ZWwtZGR4
LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2ggfCAgMiArLQogLi4ub3JnXzIxLjEuMjEu
YmIgPT4geHNlcnZlci14b3JnXzIxLjEuMjIuYmJ9IHwgMzYgKysrKysrKysrKysrKysrKysrLQog
MyBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIve3hzZXJ2ZXIteG9yZ18yMS4xLjIx
LmJiID0+IHhzZXJ2ZXIteG9yZ18yMS4xLjIyLmJifSAoNDQlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLmluYyBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLmluYwppbmRleCA1OWMzNzMy
ODBlLi4wZDhkNzgyNzEyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14
c2VydmVyL3hzZXJ2ZXIteG9yZy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
eHNlcnZlci94c2VydmVyLXhvcmcuaW5jCkBAIC0yLDcgKzIsNyBAQCBTVU1NQVJZID0gIlRoZSBY
Lk9yZyBYIHNlcnZlciIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cueC5vcmciCiBTRUNUSU9OID0g
IngxMS9iYXNlIgogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HO21kNT0yMWUzM2RjY2NmMmQ1MDM0Zjc5OGE4ZWE2MjYyMjkzOSIKK0xJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWY4Nzc4Y2ZjZDkwZWNlMGU0YjIyNWYzMDE4MjIy
N2NhIgogCiAjIHhmODYtKi0qIHBhY2thZ2VzIGRlcGVuZCBvbiBhbiBYIHNlcnZlciBidWlsdCB3
aXRoIHRoZSB4ZnJlZTg2IEREWAogIyBzbyB3ZSBoYXZlIGEgdmlydHVhbCB0byByZXByZXNlbnQg
dGhhdDoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNl
cnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdl
bjQtaGFyZHdhci5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNl
cnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdl
bjQtaGFyZHdhci5wYXRjaAppbmRleCA3ZDE1MWFhYTYzLi5mYzAwYTI4NzFiIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhm
ODZwY2lCdXMuYy11c2UtSW50ZWwtZGR4LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAw
MS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZDIzMDM3ZjQ4ZjNkNTM0Mjg2ZmMyYmRhOTI3Yzli
NmVlNWQxNDQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0ZjViYTllN2E3YTVkZjcy
ZDMyNmZiYWNjYWUxMzk0MTkzMWNhOWM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Q2FsaWZvcm5pYSBTdWxsaXZhbiA8Y2FsaWZvcm5pYS5sLnN1bGxpdmFuQGludGVsLmNvbT4KIERh
dGU6IEZyaSwgMTYgTWFyIDIwMTggMTc6MjM6MTEgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0geGY4
NnBjaUJ1cy5jOiB1c2UgSW50ZWwgZGR4IG9ubHkgZm9yIHByZS1nZW40IGhhcmR3YXJlCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18y
MS4xLjIxLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhv
cmdfMjEuMS4yMi5iYgpzaW1pbGFyaXR5IGluZGV4IDQ0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjIxLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjIy
LmJiCmluZGV4IDM3ODEyMzRjODQuLjJiZTVlMmQyZmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmdfMjEuMS4yMi5iYgpA
QCAtMSw3ICsxLDQxIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2
ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMg
dGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4K
KyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJp
emUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRh
dGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1
cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09Q
WUlORworIyBAQCAtMzE0LDYgKzMxNCwxMSBAQAorIyAgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRI
RSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRQorIyAgU09GVFdB
UkUuCisjICAKKyMgK0V4Y2VwdCBhcyBjb250YWluZWQgaW4gdGhpcyBub3RpY2UsIHRoZSBuYW1l
IG9mIFNpbGljb24gR3JhcGhpY3MsIEluYy4KKyMgK3NoYWxsIG5vdCBiZSB1c2VkIGluIGFkdmVy
dGlzaW5nIG9yIG90aGVyd2lzZSB0byBwcm9tb3RlIHRoZSBzYWxlLCB1c2Ugb3IKKyMgK290aGVy
IGRlYWxpbmdzIGluIHRoaXMgU29mdHdhcmUgd2l0aG91dCBwcmlvciB3cml0dGVuIGF1dGhvcml6
YXRpb24gZnJvbQorIyArU2lsaWNvbiBHcmFwaGljcywgSW5jLgorIyArCisjICAKKyMgIENvcHly
aWdodCAoYykgMTk5NCwgMTk5NSAgSGV3bGV0dC1QYWNrYXJkIENvbXBhbnkKKyMgIAorIyBAQCAt
MTc3OCw2ICsxNzgzLDggQEAKKyMgIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdB
UkUuCisjICAKKyMgIAorIyArQXV0aG9yOiBFYW1vbiBXYWxzaCA8ZXdhbHNoQHR5Y2hvLm5zYS5n
b3Y+CisjICsKKyMgIFBlcm1pc3Npb24gdG8gdXNlLCBjb3B5LCBtb2RpZnksIGRpc3RyaWJ1dGUs
IGFuZCBzZWxsIHRoaXMgc29mdHdhcmUgYW5kIGl0cworIyAgZG9jdW1lbnRhdGlvbiBmb3IgYW55
IHB1cnBvc2UgaXMgaGVyZWJ5IGdyYW50ZWQgd2l0aG91dCBmZWUsIHByb3ZpZGVkIHRoYXQKKyMg
IHRoaXMgcGVybWlzc2lvbiBub3RpY2UgYXBwZWFyIGluIHN1cHBvcnRpbmcgZG9jdW1lbnRhdGlv
bi4gIFRoaXMgcGVybWlzc2lvbgorIyAKKyMKKwogcmVxdWlyZSB4c2VydmVyLXhvcmcuaW5jCiAK
IFNSQ19VUkkgKz0gIiBmaWxlOi8vMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5
LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImMwY2Jl
NTU0NWIzZjY0NWJhZTYwMjRiODMwZDFkMTE1NGE5NTYzNTA2ODNhNGU1MmIyZmZmNWIwZmExYWI1
MTkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWEyNDJjODkxN2M0OWJhMjljY2MxZjYwMjE2MTNk
OGEyYjk4MDVkZDBkMjcxYTY2YWU5ZDA5ZjRiMGJiMDZiMyIKIAogIyBUaGVzZSBleHRlbnNpb25z
IGFyZSBub3cgaW50ZWdyYXRlZCBpbnRvIHRoZSBzZXJ2ZXIsIHNvIGRlY2xhcmUgdGhlIG1pZ3Jh
dGlvbgogIyBwYXRoIGZvciBpbi1wbGFjZSB1cGdyYWRlcy4KLS0gCjIuNDcuMQoK

--===============7750290314657814462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xserver-xorg: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.21.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.22.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
packages/x86-64-v3-poky-linux/xserver-xorg: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 18505016 to 18513512 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PKGSIZE changed from 1155428 to 1155461 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11876288 to 11881144 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: FILELIST: directory renamed /usr/src/debug/xserver-xorg/21.1.21/damageext -> /usr/src/debug/xserver-xorg/21.1.22/damageext, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/os-support/bus -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/os-support/bus, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/int10 -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/int10, directory renamed /usr/src/debug/xserver-xorg/21.1.21/dix -> /usr/src/debug/xserver-xorg/21.1.22/dix, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/dri2/pci_ids -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/dri2/pci_ids, directory renamed /usr/src/debug/xserver-xorg/21.1.21/fb -> /usr/src/debug/xserver-xorg/21.1.22/fb, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/os-support/shared -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/os-support/shared, directory renamed /usr/src/debug/xserver-xo
 rg/21.1.21/dri3 -> /usr/src/debug/xserver-xorg/21.1.22/dri3, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/vgahw -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/vgahw, directory renamed /usr/src/debug/xserver-xorg/21.1.21/randr -> /usr/src/debug/xserver-xorg/21.1.22/randr, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/os-support/linux -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/os-support/linux, directory renamed /usr/src/debug/xserver-xorg/21.1.21/xfixes -> /usr/src/debug/xserver-xorg/21.1.22/xfixes, directory renamed /usr/src/debug/xserver-xorg/21.1.21/render -> /usr/src/debug/xserver-xorg/21.1.22/render, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/os-support -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/os-support, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/dixmods -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/dixmods, directory renamed /usr/src/debug/xserver-xorg/21.1.21/dbe -> /usr/
 src/debug/xserver-xorg/21.1.22/dbe, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/glamor_egl -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/glamor_egl, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/fbdevhw -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/fbdevhw, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/dri2 -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/dri2, directory renamed /usr/src/debug/xserver-xorg/21.1.21/record -> /usr/src/debug/xserver-xorg/21.1.22/record, directory renamed /usr/src/debug/xserver-xorg/21.1.21/config -> /usr/src/debug/xserver-xorg/21.1.22/config, directory renamed /usr/src/debug/xserver-xorg/21.1.21/Xext -> /usr/src/debug/xserver-xorg/21.1.22/Xext, directory renamed /usr/src/debug/xserver-xorg/21.1.21/miext/damage -> /usr/src/debug/xserver-xorg/21.1.22/miext/damage, directory renamed /usr/src/debug/xserver-xorg/21.1.21/glx -> /usr/src/debug/xserver-xorg/21.1.22/glx, directory renamed /usr/
 src/debug/xserver-xorg/21.1.21/hw/xfree86/loader -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/loader, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/utils/gtf -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/utils/gtf, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/i2c -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/i2c, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/ddc -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/ddc, directory renamed /usr/src/debug/xserver-xorg/21.1.21/present -> /usr/src/debug/xserver-xorg/21.1.22/present, directory renamed /usr/src/debug/xserver-xorg/21.1.21/glamor -> /usr/src/debug/xserver-xorg/21.1.22/glamor, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/x86emu -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/x86emu, directory renamed /usr/src/debug/xserver-xorg/21.1.21/mi -> /usr/src/debug/xserver-xorg/21.1.22/mi, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/x
 free86/os-support/misc -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/os-support/misc, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/ramdac -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/ramdac, directory renamed /usr/src/debug/xserver-xorg/21.1.21/miext/shadow -> /usr/src/debug/xserver-xorg/21.1.22/miext/shadow, directory renamed /usr/src/debug/xserver-xorg/21.1.21/composite -> /usr/src/debug/xserver-xorg/21.1.22/composite, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/shadowfb -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/shadowfb, directory renamed /usr/src/debug/xserver-xorg/21.1.21/xkb -> /usr/src/debug/xserver-xorg/21.1.22/xkb, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/x86emu/x86emu -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/x86emu/x86emu, directory renamed /usr/src/debug/xserver-xorg/21.1.21/include -> /usr/src/debug/xserver-xorg/21.1.22/include, directory renamed /usr/src/debug/xserver-xorg/21.1.21
 /hw/xfree86/modes -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/modes, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/parser -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/parser, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/xkb -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/xkb, directory renamed /usr/src/debug/xserver-xorg/21.1.21/os -> /usr/src/debug/xserver-xorg/21.1.22/os, directory renamed /usr/src/debug/xserver-xorg/21.1.21/Xi -> /usr/src/debug/xserver-xorg/21.1.22/Xi, directory renamed /usr/src/debug/xserver-xorg/21.1.21/exa -> /usr/src/debug/xserver-xorg/21.1.22/exa, directory renamed /usr/src/debug/xserver-xorg/21.1.21/miext/sync -> /usr/src/debug/xserver-xorg/21.1.22/miext/sync, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/common -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/common, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/exa -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/e
 xa, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/dri -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/dri, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/drivers/modesetting -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/drivers/modesetting, directory renamed /usr/src/debug/xserver-xorg/21.1.21/hw/xfree86/drivers/inputtest -> /usr/src/debug/xserver-xorg/21.1.22/hw/xfree86/drivers/inputtest
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.21" to "21.1.22"
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PKGSIZE changed from 2827602 to 2831698 (+0%)
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.21 [default] to 21.1.22 [default]
packages/x86-64-v3-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.21" to "21.1.22"

--===============7750290314657814462==--

