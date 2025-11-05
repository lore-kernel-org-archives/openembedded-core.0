Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427E2CCFA1C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:23 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2349.1762384575393525585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rqGFpbDZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oHB5xhGv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a564e7912-5bac91cd-b9fc-4b76-af78-0b7fb2d33b0a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6vLuS7fLHXtNEyMI9tgkXjriF8etNrZ6HN3Tcyp+DmE=;
	b=rqGFpbDZ5EkBD2aBTMMN9/uvSTxhm55GGnRnRz5GvcsA7SIb5hv1N04nQfFI+3MR
	MejGmp2FfNWohu/FYEwoz+hP8pX+xIxI9eEpMMJ/3TKZnsYY0YOgIXXCaZNLjAwwSVg
	72VV/3ydXLu48X6ibaTPHxraMgALOAztZZy2i2EQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6vLuS7fLHXtNEyMI9tgkXjriF8etNrZ6HN3Tcyp+DmE=;
	b=oHB5xhGvaHgpnFdOvp+5DHBcs0BEqS1PjaLpGOGVYww0/RM3Faoux9TC/yr/GlGy
	BgxK9LpOb0U34DJhljXxjDeoQu1K4QXJi6S1AGaQsYaibnFzr1eKWW00Ctl91QFwuEW
	sulgkGeseBla38N59KTRS5iJKpYDcb/ESks3BmQI=
Content-Type: multipart/mixed; boundary="===============2507124395699784743=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] resolvconf: upgrading to 1.94 SUCCEEDED
Message-ID: <0101019a564e7912-5bac91cd-b9fc-4b76-af78-0b7fb2d33b0a-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225796

--===============2507124395699784743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *resolvconf* to *1.94* has Succeeded.

Next steps:
    - apply the patch: git am 0001-resolvconf-upgrade-1.93-1.94.patch
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
From 325550bbdc1b215aea74498c9639eef5b99050c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 15:02:53 +0000
Subject: [PATCH] resolvconf: upgrade 1.93 -> 1.94

---
 .../0001-avoid-using-m-option-for-readlink.patch           | 7 ++-----
 .../resolvconf/{resolvconf_1.93.bb => resolvconf_1.94.bb}  | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.93.bb => resolvconf_1.94.bb} (98%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch b/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
index ab32f26754..cfd850aeb6 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
+++ b/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
@@ -1,4 +1,4 @@
-From 6bf2bb136a0b3961339369bc08e58b661fba0edb Mon Sep 17 00:00:00 2001
+From 30108d4f078dbbdc48dac65ae85e60078002a0f1 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Nov 2022 17:26:30 +0800
 Subject: [PATCH] avoid using -m option for readlink
@@ -20,7 +20,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/etc/resolvconf/update.d/libc b/etc/resolvconf/update.d/libc
-index 1c4f6bc..f75d22c 100755
+index e500167..0b84c35 100755
 --- a/etc/resolvconf/update.d/libc
 +++ b/etc/resolvconf/update.d/libc
 @@ -57,7 +57,7 @@ fi
@@ -32,6 +32,3 @@ index 1c4f6bc..f75d22c 100755
  }
  
  if ! resolv_conf_is_symlinked_to_dynamic_file ; then
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
similarity index 98%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
index c10c57267a..b2c85f9593 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=un
            file://0001-avoid-using-m-option-for-readlink.patch \
            "
 
-SRCREV = "ab766fa31f7939f6d879123236b4275320b7ff64"
+SRCREV = "505c258d1efb287ffdbf132531a86437d2bf0513"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.47.1


--===============2507124395699784743==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-resolvconf-upgrade-1.93-1.94.patch"

RnJvbSAzMjU1NTBiYmRjMWIyMTVhZWE3NDQ5OGM5NjM5ZWVmNWI5OTA1MGM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNTowMjo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
c29sdmNvbmY6IHVwZ3JhZGUgMS45MyAtPiAxLjk0CgotLS0KIC4uLi8wMDAxLWF2b2lkLXVzaW5n
LW0tb3B0aW9uLWZvci1yZWFkbGluay5wYXRjaCAgICAgICAgICAgfCA3ICsrLS0tLS0KIC4uLi9y
ZXNvbHZjb25mL3tyZXNvbHZjb25mXzEuOTMuYmIgPT4gcmVzb2x2Y29uZl8xLjk0LmJifSAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNvbmYve3Jlc29sdmNvbmZfMS45
My5iYiA9PiByZXNvbHZjb25mXzEuOTQuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9yZXNvbHZjb25mL3Jlc29sdmNvbmYvMDAwMS1hdm9pZC11c2luZy1t
LW9wdGlvbi1mb3ItcmVhZGxpbmsucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Jl
c29sdmNvbmYvcmVzb2x2Y29uZi8wMDAxLWF2b2lkLXVzaW5nLW0tb3B0aW9uLWZvci1yZWFkbGlu
ay5wYXRjaAppbmRleCBhYjMyZjI2NzU0Li5jZmQ4NTBhZWI2IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNvbmYvcmVzb2x2Y29uZi8wMDAxLWF2b2lkLXVzaW5n
LW0tb3B0aW9uLWZvci1yZWFkbGluay5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L3Jlc29sdmNvbmYvcmVzb2x2Y29uZi8wMDAxLWF2b2lkLXVzaW5nLW0tb3B0aW9uLWZvci1y
ZWFkbGluay5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmJmMmJiMTM2YTBiMzk2MTMzOTM2
OWJjMDhlNThiNjYxZmJhMGVkYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzAxMDhk
NGYwNzhkYmJkYzQ4ZGFjNjVhZTg1ZTYwMDc4MDAyYTBmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTcg
Tm92IDIwMjIgMTc6MjY6MzAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXZvaWQgdXNpbmcgLW0g
b3B0aW9uIGZvciByZWFkbGluawpAQCAtMjAsNyArMjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBDaGVu
IFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9ldGMvcmVzb2x2Y29uZi91cGRhdGUu
ZC9saWJjIGIvZXRjL3Jlc29sdmNvbmYvdXBkYXRlLmQvbGliYwotaW5kZXggMWM0ZjZiYy4uZjc1
ZDIyYyAxMDA3NTUKK2luZGV4IGU1MDAxNjcuLjBiODRjMzUgMTAwNzU1CiAtLS0gYS9ldGMvcmVz
b2x2Y29uZi91cGRhdGUuZC9saWJjCiArKysgYi9ldGMvcmVzb2x2Y29uZi91cGRhdGUuZC9saWJj
CiBAQCAtNTcsNyArNTcsNyBAQCBmaQpAQCAtMzIsNiArMzIsMyBAQCBpbmRleCAxYzRmNmJjLi5m
NzVkMjJjIDEwMDc1NQogIH0KICAKICBpZiAhIHJlc29sdl9jb25mX2lzX3N5bWxpbmtlZF90b19k
eW5hbWljX2ZpbGUgOyB0aGVuCi0tLSAKLTIuMTcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNvbmYvcmVzb2x2Y29uZl8xLjkzLmJiIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9yZXNvbHZjb25mL3Jlc29sdmNvbmZfMS45NC5iYgpzaW1pbGFyaXR5
IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNv
bmYvcmVzb2x2Y29uZl8xLjkzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L3Jlc29sdmNvbmYvcmVzb2x2Y29uZl8xLjk0LmJiCmluZGV4IGMxMGM1NzI2N2EuLmIyYzg1Zjk1
OTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvcmVzb2x2Y29uZi9yZXNv
bHZjb25mXzEuOTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9yZXNvbHZjb25m
L3Jlc29sdmNvbmZfMS45NC5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImdpdDovL3Nh
bHNhLmRlYmlhbi5vcmcvZGViaWFuL3Jlc29sdmNvbmYuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5j
aD11bgogICAgICAgICAgICBmaWxlOi8vMDAwMS1hdm9pZC11c2luZy1tLW9wdGlvbi1mb3ItcmVh
ZGxpbmsucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJhYjc2NmZhMzFmNzkzOWY2
ZDg3OTEyMzIzNmI0Mjc1MzIwYjdmZjY0IgorU1JDUkVWID0gIjUwNWMyNThkMWVmYjI4N2ZmZGJm
MTMyNTMxYTg2NDM3ZDJiZjA1MTMiCiAKICMgdGhlIHBhY2thZ2UgaXMgdGFrZW4gZnJvbSBzbmFw
c2hvdHMuZGViaWFuLm9yZzsgdGhhdCBzb3VyY2UgaXMgc3RhdGljIGFuZCBnb2VzIHN0YWxlCiAj
IHNvIHdlIGNoZWNrIHRoZSBsYXRlc3QgdXBzdHJlYW0gZnJvbSBhIGRpcmVjdG9yeSB0aGF0IGRv
ZXMgZ2V0IHVwZGF0ZWQKLS0gCjIuNDcuMQoK

--===============2507124395699784743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/resolvconf: PV changed from "1.93" to "1.94"
packages/x86-64-v3-poky-linux/resolvconf: PKGV changed from 1.93 [default] to 1.94 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-dbg: PV changed from "1.93" to "1.94"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-dbg: PKGV changed from 1.93 [default] to 1.94 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-dev: PV changed from "1.93" to "1.94"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-dev: PKGV changed from 1.93 [default] to 1.94 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-doc: PV changed from "1.93" to "1.94"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-doc: PKGV changed from 1.93 [default] to 1.94 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-locale: PV changed from "1.93" to "1.94"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-locale: PKGV changed from 1.93 [default] to 1.94 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-src: PV changed from "1.93" to "1.94"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-src: PKGV changed from 1.93 [default] to 1.94 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-staticdev: PV changed from "1.93" to "1.94"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf-staticdev: PKGV changed from 1.93 [default] to 1.94 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf: PV changed from "1.93" to "1.94"
packages/x86-64-v3-poky-linux/resolvconf/resolvconf: PKGV changed from 1.93 [default] to 1.94 [default]
packages/x86-64-v3-poky-linux/resolvconf/resolvconf: PKGSIZE changed from 15871 to 15979 (+1%)

--===============2507124395699784743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (0 cached, 948 parsed). 1946 targets, 54 skipped, 0 masked, 0 errors.
Removing 88 recipes from the qemux86_64 sysroot...done.
Removing 10 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-85535afa9613e11e26d3656c13daa0ae488cdfeb"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:85535afa9613e11e26d3656c13daa0ae488cdfeb"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 505 Local 480 Mirrors 0 Missed 25 Current 238 (95% match, 96% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 258 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 271 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 293 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_deploy_setscene)
NOTE: Running setscene task 297 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 301 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 302 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 304 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 305 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 307 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_populate_lic_setscene)
NOTE: Running setscene task 308 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 309 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 324 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe resolvconf-1.94-r0: task do_populate_lic_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 327 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 329 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 336 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 342 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 343 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata_setscene)
NOTE: recipe resolvconf-1.94-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 346 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 348 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe socat-1.8.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_deploy_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 349 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 350 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe socat-1.8.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 356 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 357 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 386 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-6.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 395 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe resolvconf-1.94-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 397 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 398 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe resolvconf-1.94-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 399 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 400 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 425 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 428 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 430 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 436 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 442 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 447 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 451 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 459 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 464 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 467 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 475 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 480 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe iptables-1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 491 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 498 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 507 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 511 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 518 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 527 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 536 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 538 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 540 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 544 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 546 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 552 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 565 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 569 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 570 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 572 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 579 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 589 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/openssl/3.5.4/temp/log.do_packagedata_setscene.2288691
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 593 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 594 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 599 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_package_setscene)
NOTE: Running setscene task 604 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 606 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 609 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 612 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 618 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 630 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 631 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_package_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 635 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 639 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 939 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_fetch)
NOTE: Running task 1053 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1088 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_fetch)
NOTE: Running task 1162 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_fetch)
NOTE: Running task 1164 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_fetch)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe resolvconf-1.94-r0: task do_fetch: Started
NOTE: recipe iproute2-6.16.0-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1237 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1238 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1239 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_fetch: Succeeded
NOTE: Running task 1240 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_unpack)
NOTE: recipe resolvconf-1.94-r0: task do_fetch: Succeeded
NOTE: Running task 1241 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_unpack)
NOTE: recipe iproute2-6.16.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1242 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe resolvconf-1.94-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_fetch: Succeeded
NOTE: Running task 1243 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe iproute2-6.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1244 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1246 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe btrfs-tools-6.16-r0: task do_unpack: Started
NOTE: recipe iproute2-6.16.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1247 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe iproute2-6.16.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe resolvconf-1.94-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1249 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_patch)
NOTE: Running task 1250 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe resolvconf-1.94-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe resolvconf-1.94-r0: task do_patch: Succeeded
NOTE: Running task 1256 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_unpack: Succeeded
NOTE: Running task 1258 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe resolvconf-1.94-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 653 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe btrfs-tools-6.16-r0: task do_unpack: Succeeded
NOTE: Running task 1259 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_patch)
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.16.11+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1270 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe resolvconf-1.94-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_deploy_source_date_epoch unihash changed to c8b1f56d2ab202555a3a678e4fe91d8f881b725b018941aafe215cf4625aac61
NOTE: recipe btrfs-tools-6.16-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe openssl-3.5.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 655 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1283 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe util-linux-2.41.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 656 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 671 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1698 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1844 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata)
NOTE: Running task 1871 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1981 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2034 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_collect_spdx_deps)
NOTE: recipe resolvconf-1.94-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe resolvconf-1.94-r0: task do_collect_spdx_deps: Started
NOTE: recipe resolvconf-1.94-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2066 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_configure)
NOTE: recipe resolvconf-1.94-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe resolvconf-1.94-r0: task do_configure: Started
NOTE: recipe iproute2-6.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2067 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2080 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_configure)
NOTE: recipe resolvconf-1.94-r0: task do_configure: Succeeded
NOTE: recipe iproute2-6.16.0-r0: task do_configure: Started
NOTE: Running task 2081 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure: Started
NOTE: recipe resolvconf-1.94-r0: task do_compile: Started
NOTE: recipe resolvconf-1.94-r0: task do_compile: Succeeded
NOTE: Running task 2082 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_install)
NOTE: recipe resolvconf-1.94-r0: task do_install: Started
NOTE: recipe iproute2-6.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2083 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_compile)
NOTE: recipe iproute2-6.16.0-r0: task do_compile: Started
NOTE: recipe resolvconf-1.94-r0: task do_install: Succeeded
NOTE: Running task 2084 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_package)
NOTE: Running task 2085 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_populate_sysroot)
NOTE: recipe resolvconf-1.94-r0: task do_populate_sysroot: Started
NOTE: recipe resolvconf-1.94-r0: task do_package: Started
NOTE: recipe resolvconf-1.94-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_populate_sysroot unihash changed to afff715cbfdfe96340dc1e68cf8439aed6457ed5f14593aa5e4b3e54fd228948
NOTE: Setscene tasks completed
NOTE: recipe resolvconf-1.94-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_package unihash changed to 224b8da2d37227fb34c0da68a9501bf70aec359e0f7244229ab8b34550c38802
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_packagedata_setscene)
NOTE: recipe resolvconf-1.94-r0: task do_packagedata_setscene: Started
NOTE: recipe resolvconf-1.94-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2087 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_create_spdx)
NOTE: Running task 2088 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_package_write_ipk)
NOTE: Running task 2089 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_package_write_deb)
NOTE: Running task 2090 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_package_write_rpm)
NOTE: Running task 2091 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_package_qa)
NOTE: recipe resolvconf-1.94-r0: task do_create_spdx: Started
NOTE: recipe resolvconf-1.94-r0: task do_package_write_ipk: Started
NOTE: recipe resolvconf-1.94-r0: task do_package_write_deb: Started
NOTE: recipe resolvconf-1.94-r0: task do_package_write_rpm: Started
NOTE: recipe resolvconf-1.94-r0: task do_package_qa: Started
NOTE: recipe resolvconf-1.94-r0: task do_create_spdx: Succeeded
NOTE: Running task 2092 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_create_package_spdx)
NOTE: recipe resolvconf-1.94-r0: task do_create_package_spdx: Started
NOTE: recipe resolvconf-1.94-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_package_qa unihash changed to 822fa52d287503f8b6e8ddbecc72adbcb95ed74eee79d161985cd4c07659af59
NOTE: recipe resolvconf-1.94-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_package_write_rpm unihash changed to 82f1285b6501408098f4014505cd38b0ec4bce39127262d0f9de20630ed9c916
NOTE: recipe resolvconf-1.94-r0: task do_package_write_ipk: Succeeded
NOTE: recipe resolvconf-1.94-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_package_write_ipk unihash changed to 025473dd3f745568f4aa31ef52fd1504b5d1c8316d4017e410ada49d1450fac4
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_package_write_deb unihash changed to db04536a7597ff290c0e19be0b90bc1e0da5eaedf1afce5701979ae9900f868c
NOTE: recipe resolvconf-1.94-r0: task do_create_package_spdx: Succeeded
NOTE: recipe iproute2-6.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2093 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_install)
NOTE: recipe iproute2-6.16.0-r0: task do_install: Started
NOTE: recipe iproute2-6.16.0-r0: task do_install: Succeeded
NOTE: Running task 2094 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package)
NOTE: recipe iproute2-6.16.0-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2096 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile: Started
NOTE: recipe iproute2-6.16.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_package unihash changed to 0699f2d5b7ab2b47fff79e074558c06edbf3eb927da3947be42c988da75772c7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_packagedata became valid
NOTE: Running setscene task 743 of 743 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile: Succeeded
NOTE: Running task 2098 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2099 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_install)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install: Succeeded
NOTE: Running task 2100 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2101 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_package)
NOTE: Running task 2102 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2103 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2104 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_configure)
NOTE: recipe btrfs-tools-6.16-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_configure: Succeeded
NOTE: Running task 2105 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_compile)
NOTE: recipe btrfs-tools-6.16-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_package: Succeeded
NOTE: Running task 2106 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_packagedata unihash changed to b6c793db228bcaac6e4cd83f612bf666f16908763968f7e3342b7fa5525849bf
NOTE: Setscene tasks completed
NOTE: recipe btrfs-tools-6.16-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2107 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_install)
NOTE: recipe btrfs-tools-6.16-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_install: Succeeded
NOTE: Running task 2108 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_package)
NOTE: recipe btrfs-tools-6.16-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_package: Succeeded
NOTE: Running task 2109 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.16-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.16-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb:do_packagedata unihash changed to 99235d36ce5299948ce77ebb419b97e89e7c314ed907f70f3a763eb58c682ec5
NOTE: Setscene tasks completed
NOTE: Running task 2110 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package_write_ipk)
NOTE: Running task 2111 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package_write_deb)
NOTE: Running task 2112 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package_write_rpm)
NOTE: Running task 2113 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package_qa)
NOTE: recipe util-linux-2.41.1-r0: task do_package_write_ipk: Started
NOTE: recipe util-linux-2.41.1-r0: task do_package_write_deb: Started
NOTE: recipe util-linux-2.41.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.41.1-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.41.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package_qa unihash changed to a5d20b935990d949798f07ccf2c8621099dfb3b4f1baf3c900d332e051fad33b
NOTE: recipe util-linux-2.41.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2114 of 2114 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb:do_build)
NOTE: Tasks Summary: Attempted 2114 tasks of which 2052 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-fips went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2507124395699784743==--

