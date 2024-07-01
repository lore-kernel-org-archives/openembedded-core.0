Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5B7C52D7D
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2195.1719853077562655737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bHzD7jms;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lxBpCxEx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101906f3b50e5-eed6a6a2-83af-45d0-a631-2a3bf8a98d1a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c7qrVIa75+cr+5o8H0MF7eL3Y8KyUziCeaFKF5WAdcA=;
	b=bHzD7jms/LZgABTH/ZxJiHEY2rKg8kV5CR7LrorLIkUzr3oxOEK9Pm2jIcfR3enJ
	aY6mgfoQ119oNtwBzUXL62Vf98GqMoCGQjbvsTdvoCkYhaXIL9d2XLuxAZYaJegQ63W
	s+VjsVT+QJnYhXjvgBQcGhkqHFceciqI4Uf27zZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c7qrVIa75+cr+5o8H0MF7eL3Y8KyUziCeaFKF5WAdcA=;
	b=lxBpCxExe5UOUGQEtOGrrBryhYBkByKszJcU03lKTHoZs5VDVYqFEgWe5qzeF3mY
	iehJ4TWOoKi9gbJhMokGaEbRHKt3xKW2bsXjcx7pEgCtoLJna24u45SH+e7i7p3fe2D
	GgcTqOwVQ3sSPiPMkGp0sumHyw6JGu+E7eH0pVKs=
Content-Type: multipart/mixed; boundary="===============3670236821576692823=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 13.0.3 SUCCEEDED
Message-ID: <010101906f3b50e5-eed6a6a2-83af-45d0-a631-2a3bf8a98d1a-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201388

--===============3670236821576692823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *weston* to *13.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-weston-upgrade-13.0.1-13.0.3.patch
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
From 1e4b5bd55d378fae2e8fa370c7a9246e9296c7c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 14:04:41 +0000
Subject: [PATCH] weston: upgrade 13.0.1 -> 13.0.3

---
 ...1-libweston-tools-Include-libgen.h-for-basename-signat.patch | 2 +-
 .../wayland/{weston_13.0.1.bb => weston_13.0.3.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_13.0.1.bb => weston_13.0.3.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
index fbec9f9d4e..617e09edaa 100644
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
@@ -1,4 +1,4 @@
-From e050830898ea37d30ef1c5339cb1665bdb92dcdc Mon Sep 17 00:00:00 2001
+From 8b80e068d3dc5528f0dd6bf5fa2143bb2dc4174d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 14 Dec 2023 09:13:54 -0800
 Subject: [PATCH] libweston,tools: Include libgen.h for basename signature
diff --git a/meta/recipes-graphics/wayland/weston_13.0.1.bb b/meta/recipes-graphics/wayland/weston_13.0.3.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_13.0.1.bb
rename to meta/recipes-graphics/wayland/weston_13.0.3.bb
index eae13e1c21..e4843d38f7 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459213994094e02b29a"
+SRC_URI[sha256sum] = "27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.0


--===============3670236821576692823==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-13.0.1-13.0.3.patch"

RnJvbSAxZTRiNWJkNTVkMzc4ZmFlMmU4ZmEzNzBjN2E5MjQ2ZTkyOTZjN2M1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAxNDowNDo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
c3RvbjogdXBncmFkZSAxMy4wLjEgLT4gMTMuMC4zCgotLS0KIC4uLjEtbGlid2VzdG9uLXRvb2xz
LUluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaCB8IDIgKy0KIC4uLi93
YXlsYW5kL3t3ZXN0b25fMTMuMC4xLmJiID0+IHdlc3Rvbl8xMy4wLjMuYmJ9ICAgICAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3t3ZXN0b25fMTMuMC4xLmJi
ID0+IHdlc3Rvbl8xMy4wLjMuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3dheWxhbmQvd2VzdG9uLzAwMDEtbGlid2VzdG9uLXRvb2xzLUluY2x1ZGUtbGliZ2Vu
LmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXls
YW5kL3dlc3Rvbi8wMDAxLWxpYndlc3Rvbi10b29scy1JbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNl
bmFtZS1zaWduYXQucGF0Y2gKaW5kZXggZmJlYzlmOWQ0ZS4uNjE3ZTA5ZWRhYSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uLzAwMDEtbGlid2VzdG9uLXRv
b2xzLUluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b24vMDAwMS1saWJ3ZXN0b24tdG9vbHMtSW5j
bHVkZS1saWJnZW4uaC1mb3ItYmFzZW5hbWUtc2lnbmF0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBlMDUwODMwODk4ZWEzN2QzMGVmMWM1MzM5Y2IxNjY1YmRiOTJkY2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA4YjgwZTA2OGQzZGM1NTI4ZjBkZDZiZjVmYTIxNDNiYjJkYzQx
NzRkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KIERhdGU6IFRodSwgMTQgRGVjIDIwMjMgMDk6MTM6NTQgLTA4MDAKIFN1YmplY3Q6
IFtQQVRDSF0gbGlid2VzdG9uLHRvb2xzOiBJbmNsdWRlIGxpYmdlbi5oIGZvciBiYXNlbmFtZSBz
aWduYXR1cmUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rv
bl8xMy4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4z
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy93YXlsYW5kL3dlc3Rvbl8xMy4wLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy93YXlsYW5kL3dlc3Rvbl8xMy4wLjMuYmIKaW5kZXggZWFlMTNlMWMyMS4uZTQ4NDNkMzhmNyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEzLjAuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4zLmJiCkBA
IC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3dheWxhbmQvd2VzdG9uLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvCiAgICAgICAgICAgIGZpbGU6
Ly9zeXN0ZW1kLW5vdGlmeS53ZXN0b24tc3RhcnQgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJlYTE1NjZhYjRmNWZmY2U3ZTlmZDRmN2ExZmNhNWIzMGNhYWU0ZDUwMDIz
YmY0NTkyMTM5OTQwOTRlMDJiMjlhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI3ZjY4ZDk2ZTNi
OTdkOThkYWFkZWYxM2EyMDIzNTY1MjQ5MjRmYTM4MTQxOGZhNjcxNmI5MTM2ZWYwOTkwOTMiCiAK
IFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5
bGFuZC93ZXN0b24vLS90YWdzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvKD9Q
PHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQrKSIKLS0gCjIuNDQuMAoK

--===============3670236821576692823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/weston: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.1/downloads/weston-13.0.1.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start" to "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.3/downloads/weston-13.0.3.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start"
packages/core2-64-poky-linux/weston: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/libweston-13: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.1", added "/usr/lib/libweston-13.so.0.0.3"
packages/core2-64-poky-linux/weston/libweston-13: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.1 to libweston-13.so.0.0.3
  /usr/lib/libweston-13.so.0.0.1 moved to /usr/lib/libweston-13.so.0.0.3
packages/core2-64-poky-linux/weston/weston-dbg: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-dbg: FILELIST: removed "/usr/lib/.debug/libweston-13.so.0.0.1", added "/usr/lib/.debug/libweston-13.so.0.0.3"
packages/core2-64-poky-linux/weston/weston-dbg: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-dev: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-dev: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-doc: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-doc: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-examples: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-examples: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-locale: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-locale: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-src: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-src: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-staticdev: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-staticdev: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-xwayland: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-xwayland: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston: PKGV changed from 13.0.1 [default] to 13.0.3 [default]

--===============3670236821576692823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.1", added "/usr/lib/libweston-13.so.0.0.3"
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.1 to libweston-13.so.0.0.3
  /usr/lib/libweston-13.so.0.0.1 moved to /usr/lib/libweston-13.so.0.0.3

--===============3670236821576692823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-64 sysroot...done.
Removing 103 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-8f37b9649478796a05cef3db69f4ac5e8f078c92"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8f37b9649478796a05cef3db69f4ac5e8f078c92"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 759 Local 724 Mirrors 0 Missed 35 Current 359 (95% match, 96% complete)
Removing 6 stale sstate objects for arch allarch...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 366 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 367 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 368 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 376 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 380 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 382 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 384 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 398 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 399 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 401 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_deb_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_ipk_setscene)
NOTE: recipe kbd-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 404 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 405 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_rpm_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 407 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 408 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 409 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 410 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.52.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 415 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 425 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 426 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 432 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 437 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 438 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 439 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 443 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 445 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_packagedata_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 449 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 463 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 464 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe seatd-0.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/seatd/seatd_0.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 469 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 471 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 478 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 479 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 482 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 486 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 496 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/harfbuzz/8.5.0/temp/log.do_packagedata_setscene.1650666
NOTE: recipe seatd-0.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 497 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_package_setscene)
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 502 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 503 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 509 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 511 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 515 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 518 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 519 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 528 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 532 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 535 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 536 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 537 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 539 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xwayland-24.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 559 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 562 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 563 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 565 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 569 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-image-0.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 580 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-util-cursor-0.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 581 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 586 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe xcb-util-image-0.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 594 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 599 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-image_0.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 605 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-util-image-0.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 625 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util-renderutil_0.3.10.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 630 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 639 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-renderutil-0.3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 660 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 663 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-util-0.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 665 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xcb-util_0.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-24.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 668 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 670 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe xwayland-24.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 671 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 673 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 674 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 680 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 684 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 686 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-util-0.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 690 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 693 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libevdev-1.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 694 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 695 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 702 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevdev-1.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 825 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 826 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 830 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 831 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libevdev-1.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 847 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevdev-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 873 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 879 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 881 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 883 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 885 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 887 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 888 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 894 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 895 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 897 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 898 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 900 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 901 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 904 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 907 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 978 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 915 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 920 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 922 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 923 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 924 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 926 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 927 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1199 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_write_config)
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1278 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1302 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_fetch)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_write_config: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1355 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 940 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 941 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 943 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 945 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 947 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 948 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 949 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1364 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1371 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1376 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_recipe_qa)
NOTE: Running task 1378 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_write_config)
NOTE: recipe xwayland-24.1.0-r0: task do_fetch: Started
NOTE: Running task 1387 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: recipe xwayland-24.1.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1388 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_unpack)
NOTE: Running setscene task 952 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xwayland-24.1.0-r0: task do_write_config: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: recipe weston-13.0.3-r0: task do_recipe_qa: Started
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 953 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_unpack: Started
NOTE: Running setscene task 954 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 955 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xwayland-24.1.0-r0: task do_write_config: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 956 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 957 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1410 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1436 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: Running task 1446 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 961 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1462 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1502 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 963 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-13.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_unpack: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_fetch: Started
NOTE: Running task 1507 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_fetch)
NOTE: recipe weston-13.0.3-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1508 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_patch)
NOTE: Running task 1510 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe kbd-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 1511 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_unpack)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 965 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 1517 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 970 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_patch: Started
NOTE: recipe kbd-2.6.4-r0: task do_unpack: Started
NOTE: recipe weston-13.0.3-r0: task do_fetch: Started
NOTE: recipe xwayland-24.1.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1525 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe weston-13.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_unpack)
NOTE: recipe libinput-1.25.0-r0: task do_unpack: Succeeded
NOTE: Running task 1527 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_patch)
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 975 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_patch: Started
NOTE: Running task 1540 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe kbd-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1541 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_patch)
NOTE: recipe libinput-1.25.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe kbd-2.6.4-r0: task do_patch: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe weston-13.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1543 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_patch)
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 986 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 987 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 988 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 989 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 993 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe weston-13.0.3-r0: task do_patch: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 995 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 997 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 999 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1003 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1005 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe weston-13.0.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 1007 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1009 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1015 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1017 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1018 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1020 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1022 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1024 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1027 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1031 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1032 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1036 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1038 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1041 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1043 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1044 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1047 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1050 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1053 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1055 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1057 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1059 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1061 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1953 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1954 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1996 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_populate_lic)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_populate_lic: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1063 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1064 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1066 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe weston-13.0.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_populate_lic unihash changed to 1292b160b5a0dd9a38401a293aa9cff63d6e1ef7dfff5e0fb1a5ae267b0ff912
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_deploy_source_date_epoch unihash changed to 58b74a51ff9898a81dc925bb6d551d2ffb3cdc2deade24d6779b4e4fab496931
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1070 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1072 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1074 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1076 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1077 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1079 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1081 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1083 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1084 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1086 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1087 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1089 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1091 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1092 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1093 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1096 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1097 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1099 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 2053 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1107 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1108 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c8afda1b9ad17f0a32fe2282140fb9fbfb6a58c64c5c1f9fe1f3c72112aae711
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2077 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1113 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1114 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1118 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2616 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2783 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.25.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2850 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2868 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata)
NOTE: Running task 2938 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2958 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_collect_spdx_deps)
NOTE: recipe xwayland-24.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2980 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata: Started
NOTE: Running task 2989 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_collect_spdx_deps)
NOTE: recipe kbd-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-24.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.25.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.25.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2996 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_configure)
NOTE: recipe libinput-1.25.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2997 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_configure)
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 84b5de9da03360a64d4498693efe2cfbc1fd74dd8432b0d807425ead25b5c926
NOTE: Running task 3003 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe kbd-2.6.4-r0: task do_configure: Started
NOTE: recipe libinput-1.25.0-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-24.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3004 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_configure)
NOTE: recipe xwayland-24.1.0-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3005 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 3006 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 3007 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe libinput-1.25.0-r0: task do_configure: Succeeded
NOTE: Running task 3009 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3010 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_compile)
NOTE: recipe libinput-1.25.0-r0: task do_compile: Started
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 3011 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata unihash changed to d15f1de3bff845fa07fd3cba849f7e38a14b568e6db148814b2e02435c92242e
NOTE: Setscene tasks completed
NOTE: Running task 3012 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston-init.bb:do_create_spdx)
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Started
NOTE: recipe weston-init-1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_compile)
NOTE: recipe xwayland-24.1.0-r0: task do_compile: Started
NOTE: recipe libinput-1.25.0-r0: task do_compile: Succeeded
NOTE: Running task 3014 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3015 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_install)
NOTE: recipe libinput-1.25.0-r0: task do_install: Started
NOTE: recipe libinput-1.25.0-r0: task do_install: Succeeded
NOTE: Running task 3016 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_install_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3017 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_package)
NOTE: Running task 3018 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_populate_sysroot)
NOTE: recipe libinput-1.25.0-r0: task do_package: Started
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_configure: Succeeded
NOTE: Running task 3019 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_compile)
NOTE: recipe libinput-1.25.0-r0: task do_package: Succeeded
NOTE: Running task 3020 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_packagedata)
NOTE: recipe kbd-2.6.4-r0: task do_compile: Started
NOTE: recipe libinput-1.25.0-r0: task do_packagedata: Started
NOTE: recipe xwayland-24.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3021 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_install)
NOTE: recipe xwayland-24.1.0-r0: task do_install: Started
NOTE: recipe xwayland-24.1.0-r0: task do_install: Succeeded
NOTE: Running task 3022 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package)
NOTE: Running task 3023 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_populate_sysroot)
NOTE: recipe xwayland-24.1.0-r0: task do_package: Started
NOTE: recipe xwayland-24.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-24.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3024 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe weston-13.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 3025 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_install)
NOTE: recipe kbd-2.6.4-r0: task do_install: Started
NOTE: recipe weston-13.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3026 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/weston_13.0.3.bb:do_configure)
NOTE: recipe weston-13.0.3-r0: task do_configure: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package: Succeeded
NOTE: Running task 3027 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_packagedata)
NOTE: recipe kbd-2.6.4-r0: task do_install: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_packagedata: Started
NOTE: Running task 3028 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_package)
NOTE: recipe kbd-2.6.4-r0: task do_package: Started
NOTE: recipe xwayland-24.1.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_packagedata unihash changed to 9cc4dcfa294adbc488d2ab39bb91f84d7f17d8e80b43be37da0161ecae7b39c6
NOTE: Setscene tasks completed
NOTE: Running task 3029 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_create_spdx)
NOTE: Running task 3030 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_ipk)
NOTE: Running task 3031 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_deb)
NOTE: Running task 3032 of 3050 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xwayland/xwayland_24.1.0.bb:do_package_write_rpm)
NOTE: recipe libinput-1.25.0-r0: task do_packagedata: Failed
NOTE: recipe xwayland-24.1.0-r0: task do_create_spdx: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_deb: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe weston-13.0.3-r0: task do_configure: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_package: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xwayland-24.1.0-r0: task do_package_write_deb: Succeeded
NOTE: Tasks Summary: Attempted 3032 tasks of which 2960 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701140353.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701140353.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_packagedata
Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:9.0.0-r0 to 0:8.5.0-r0) [version-going-backwards]
ERROR: harfbuzz-8.5.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libinput-1.25.0-r0 do_packagedata: QA Issue: Package version for package libinput-src went backwards which would break package feeds (from 0:1.26.1-r0 to 0:1.25.0-r0) [version-going-backwards]
ERROR: libinput-1.25.0-r0 do_packagedata: QA Issue: Package version for package libinput-dbg went backwards which would break package feeds (from 0:1.26.1-r0 to 0:1.25.0-r0) [version-going-backwards]
ERROR: libinput-1.25.0-r0 do_packagedata: QA Issue: Package version for package libinput-ptest went backwards which would break package feeds (from 0:1.26.1-r0 to 0:1.25.0-r0) [version-going-backwards]
ERROR: libinput-1.25.0-r0 do_packagedata: QA Issue: Package version for package libinput-staticdev went backwards which would break package feeds (from 0:1.26.1-r0 to 0:1.25.0-r0) [version-going-backwards]
ERROR: libinput-1.25.0-r0 do_packagedata: QA Issue: Package version for package libinput-dev went backwards which would break package feeds (from 0:1.26.1-r0 to 0:1.25.0-r0) [version-going-backwards]
ERROR: libinput-1.25.0-r0 do_packagedata: QA Issue: Package version for package libinput-doc went backwards which would break package feeds (from 0:1.26.1-r0 to 0:1.25.0-r0) [version-going-backwards]
ERROR: libinput-1.25.0-r0 do_packagedata: QA Issue: Package version for package libinput-locale went backwards which would break package feeds (from 0:1.26.1-r0 to 0:1.25.0-r0) [version-going-backwards]
ERROR: libinput-1.25.0-r0 do_packagedata: QA Issue: Package version for package libinput-bin went backwards which would break package feeds (from 0:1.26.1-r0 to 0:1.25.0-r0) [version-going-backwards]
ERROR: libinput-1.25.0-r0 do_packagedata: QA Issue: Package version for package libinput went backwards which would break package feeds (from 0:1.26.1-r0 to 0:1.25.0-r0) [version-going-backwards]
ERROR: libinput-1.25.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libinput/1.25.0/temp/log.do_packagedata.1665963
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_packagedata) failed with exit code '1'

--===============3670236821576692823==--

