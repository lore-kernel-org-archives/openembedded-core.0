Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC66ACA0EED
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:22 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.11338.1755263228377035400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2d3Enifx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Z56HsX+m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010198add78db2-bd748a1a-4fc1-4277-baa9-255ce1318c25-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263241;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=49+/hoXDYidUVlCPbpAWGCEdOzE3JRuGAMkqXMWBEoI=;
	b=2d3EnifxBVgI9/WLjUKQwQJ+Ko3I8ziiAaloq3HJpxCxkrTx9/zc/cQbqBhn3QHf
	24gE6ufdNkdNLEOQc23ABCMMbtqGlcSYd2WXA9rduY6rT1f9ev9TsCSJxS9QeQyTv+L
	rXC2UKrGtTQk9h9VBU3iRI9p94DQK6cYZSMgNaKc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263241;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=49+/hoXDYidUVlCPbpAWGCEdOzE3JRuGAMkqXMWBEoI=;
	b=Z56HsX+mclNUGvjGiRvELytoI7epuZIVNRsGmKr0K0VBNsaqEcOdkNsJAXz/CZj+
	m3oI9Cwb+ApCaH9vRshEPJ91fD0D4dXgH9N9vCuS+5TMdpd2XZVi16zasW60EoMkphn
	5SwCIpCe9vu+TK3DvggVQtUFt/hHp7h9BZIxc5Cg=
Content-Type: multipart/mixed; boundary="===============2988969573529375204=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 303 SUCCEEDED
Message-ID: <01010198add78db2-bd748a1a-4fc1-4277-baa9-255ce1318c25-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221964

--===============2988969573529375204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *303* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-301-303.patch
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
From 863012d1d84b1d93936058f2a826f78750a3a4b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 12:45:21 +0000
Subject: [PATCH] diffoscope: upgrade 301 -> 303

---
 .../diffoscope/{diffoscope_301.bb => diffoscope_303.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_301.bb => diffoscope_303.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_301.bb b/meta/recipes-support/diffoscope/diffoscope_303.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_301.bb
rename to meta/recipes-support/diffoscope/diffoscope_303.bb
index c93ff4f588..604582ed0d 100644
--- a/meta/recipes-support/diffoscope/diffoscope_301.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_303.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2b46b60afe3fbb9ba79946e5196157b272ddad27692ccf5e4839def1ef3019c6"
+SRC_URI[sha256sum] = "eb68c3708df66e314c072724a12fc8180df28d626320178b3c9ac6029f3436bb"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============2988969573529375204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-301.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-303.dist-info

--===============2988969573529375204==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-301-303.patch"

RnJvbSA4NjMwMTJkMWQ4NGIxZDkzOTM2MDU4ZjJhODI2Zjc4NzUwYTNhNGI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTI6NDU6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMwMSAtPiAzMDMKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzAxLmJiID0+IGRpZmZvc2NvcGVfMzAzLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMDEuYmIgPT4gZGlmZm9zY29wZV8z
MDMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMwMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMDMuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMwMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMwMy5iYgppbmRleCBjOTNmZjRm
NTg4Li42MDQ1ODJlZDBkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzAxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMDMuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMmI0NmI2MGFmZTNmYmI5YmE3OTk0NmU1MTk2MTU3YjI3MmRkYWQyNzY5MmNjZjVlNDgz
OWRlZjFlZjMwMTljNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlYjY4YzM3MDhkZjY2ZTMxNGMw
NzI3MjRhMTJmYzgxODBkZjI4ZDYyNjMyMDE3OGIzYzlhYzYwMjlmMzQzNmJiIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============2988969573529375204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "301" to "303"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 301 [default] to 303 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "301" to "303"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 301 [default] to 303 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "301" to "303"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 301 [default] to 303 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "301" to "303"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 301 [default] to 303 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "301" to "303"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 301 [default] to 303 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "301" to "303"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 301 [default] to 303 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "301" to "303"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1387063 to 1387053 (-0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 301 [default] to 303 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-301.tar.gz;downloadfilename=diffoscope-301.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-303.tar.gz;downloadfilename=diffoscope-303.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "301" to "303"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 301 [default] to 303 [default]
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-301.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-303.dist-info

--===============2988969573529375204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1942 targets, 50 skipped, 0 masked, 0 errors.
Removing 119 recipes from the core2-64 sysroot...done.
Removing 133 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a5c7e3f539a134d4802dd0104c68fcdf28c8414f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a5c7e3f539a134d4802dd0104c68fcdf28c8414f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1006 Local 972 Mirrors 0 Missed 34 Current 430 (96% match, 97% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 439 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 440 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 443 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 444 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 452 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 457 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 462 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_populate_lic_setscene)
NOTE: Running setscene task 464 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 472 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_qa_setscene)
NOTE: Running setscene task 473 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 476 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 495 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 506 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 508 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 511 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package_qa_setscene)
NOTE: recipe squashfs-tools-4.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_deb_setscene: Started
NOTE: recipe squashfs-tools-4.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_package_write_deb_setscene: Started
NOTE: recipe squashfs-tools-4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffoscope-303-r0: task do_populate_lic_setscene: Started
NOTE: recipe squashfs-tools-4.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_qa_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe squashfs-tools-4.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_qa_setscene: Started
NOTE: recipe squashfs-tools-4.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe squashfs-tools-4.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 518 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 519 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 527 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe diffoscope-303-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe squashfs-tools-4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx_setscene)
NOTE: Running setscene task 543 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 559 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 560 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_write_ipk_setscene)
NOTE: recipe binutils-2.45-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 561 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 567 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 581 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe binutils-2.45-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 592 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe squashfs-tools-4.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 609 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 611 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx_setscene)
NOTE: recipe squashfs-tools-4.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 621 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe debugedit-5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vim-9.1.1198-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe squashfs-tools-4.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 624 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 625 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe debugedit-5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vim-9.1.1198-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe squashfs-tools-4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xxhash-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe debugedit-5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Started
NOTE: recipe debugedit-5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata_setscene: Started
NOTE: recipe vim-9.1.1198-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vim-9.1.1198-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 689 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_create_spdx_setscene)
NOTE: recipe squashfs-tools-4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xxhash-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe squashfs-tools-4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 735 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_recipe_qa_setscene)
NOTE: recipe xxhash-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 765 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 784 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 804 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.3.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.20.1-r0: task do_package_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 806 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 811 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 817 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.56.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 833 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.56.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 851 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 856 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 857 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 861 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 862 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 863 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-11.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 869 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 874 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 876 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/at-spi2-core/2.56.3/temp/log.do_packagedata_setscene.2069913
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 881 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 886 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 888 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.3.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 893 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 896 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.3-r0: task do_package_setscene: Started
NOTE: Running setscene task 899 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 903 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.8.bb:do_packagedata_setscene)
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 904 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 905 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 906 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 908 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-11.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 912 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 917 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 918 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 922 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 923 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 924 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 925 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 928 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 931 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 933 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 935 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 940 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 946 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe clang-20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 948 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe clang-20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 951 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 953 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 957 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 959 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 966 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 968 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 971 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 972 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 974 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 976 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 977 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 979 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 984 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 986 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 987 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 988 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 991 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 998 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1000 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1003 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1004 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1005 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1007 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1009 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1015 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1016 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1020 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1022 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 1023 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1026 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1035 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1037 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1040 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.45-r0: task do_package_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1043 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1684 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: Running task 1706 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_recipe_qa)
NOTE: Running task 1737 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_fetch)
NOTE: Running task 1789 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe diffoscope-303-r0: task do_recipe_qa: Started
NOTE: Running task 1865 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1892 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: recipe vim-9.1.1198-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: recipe debugedit-5.2-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: recipe debugedit-5.2-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: Running task 1995 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_unpack)
NOTE: recipe diffoscope-303-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1996 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_fetch)
NOTE: recipe debugedit-5.2-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.1.1198-r0: task do_fetch: Succeeded
NOTE: Running task 1997 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_unpack)
NOTE: Running task 1998 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: recipe diffoscope-303-r0: task do_fetch: Started
NOTE: recipe diffoscope-303-r0: task do_fetch: Succeeded
NOTE: Running task 1999 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_unpack)
NOTE: recipe vim-9.1.1198-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe debugedit-5.2-r0: task do_unpack: Succeeded
NOTE: Running task 2000 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_patch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-303-r0: task do_unpack: Started
NOTE: recipe debugedit-5.2-r0: task do_patch: Started
NOTE: recipe binutils-2.45-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1047 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe diffoscope-303-r0: task do_unpack: Succeeded
NOTE: Running task 2002 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_patch)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe debugedit-5.2-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-303-r0: task do_patch: Started
NOTE: recipe diffoscope-303-r0: task do_patch: Succeeded
NOTE: Running task 2004 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_deploy_source_date_epoch)
NOTE: Running task 2005 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_check_backend)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1050 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1052 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1053 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 1054 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 1055 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.56.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1056 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1057 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1059 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1060 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe diffoscope-303-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-303-r0: task do_check_backend: Started
NOTE: recipe diffoscope-303-r0: task do_check_backend: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1062 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1063 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1070 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1071 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1073 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1077 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1079 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1081 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1082 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1084 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe diffoscope-303-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1085 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1086 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1087 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1088 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1091 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1094 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1095 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1097 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1101 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1102 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1103 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe clang-20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1109 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1113 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1115 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1116 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1117 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1118 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1119 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1124 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1125 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1128 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1129 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1133 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1134 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1135 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1136 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1138 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1143 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1144 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1145 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1146 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1147 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1148 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1150 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1154 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1156 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1157 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1159 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1160 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1161 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1164 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1166 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1170 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1171 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1172 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1173 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1174 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1177 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1178 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1180 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1181 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1182 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1184 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1185 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1186 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1187 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1191 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1192 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1193 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1194 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1195 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vim-9.1.1198-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1197 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1199 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1200 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1203 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1204 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1208 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1209 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1210 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1212 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1213 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1214 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1215 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1219 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1220 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1222 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1223 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1225 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1226 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1229 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1231 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1233 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1234 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1236 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1237 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1242 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1243 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1245 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1246 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1247 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1248 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1249 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1250 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1252 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1253 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1255 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1256 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1258 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1259 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1260 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1261 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1264 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1265 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1267 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1268 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1269 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1272 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1273 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1275 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1278 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1280 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1281 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1283 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1285 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1291 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1292 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1294 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1295 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1296 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1297 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1298 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1299 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1301 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1302 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1303 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1304 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1306 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1307 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1308 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1310 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1312 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1314 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1316 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1317 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1319 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1320 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1323 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1324 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1325 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1326 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1328 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1329 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1330 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1331 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1332 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1333 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1334 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1335 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1337 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1338 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1340 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1342 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1343 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1344 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1345 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1348 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1349 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1350 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1355 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1357 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1359 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1363 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1365 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1367 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1369 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1371 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1373 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1375 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1378 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1380 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1382 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1384 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1386 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1388 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1389 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1391 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1392 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2358 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2443 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1394 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1396 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running task 2481 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 2482 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1397 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1399 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe vim-9.1.1198-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2493 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running setscene task 1401 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vim-9.1.1198-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 2497 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1403 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1404 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1406 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2498 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1408 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1409 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1410 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2501 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1411 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1413 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1418 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1419 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1420 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2511 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1425 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1426 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1428 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1431 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1434 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1435 of 1436 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3123 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3470 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3572 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3647 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 3686 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3748 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-303-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 3784 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_collect_spdx_deps)
NOTE: Running task 3813 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package_write_rpm)
NOTE: recipe debugedit-5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-303-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.45-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash d8f779ca430cbdfb8ccd47ce6d7310607b957aa8c8072ed422fc989e627d4f00 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a7d05ec4689a3f2f08fd23b6286f0dd877cb40a1b1d9c060e82e2b53e2c04c5b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd8f779ca430cbdfb8ccd47ce6d7310607b957aa8c8072ed422fc989e627d4f00'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed a7d05ec4689a3f2f08fd23b6286f0dd877cb40a1b1d9c060e82e2b53e2c04c5b -> d8f779ca430cbdfb8ccd47ce6d7310607b957aa8c8072ed422fc989e627d4f00 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash d8f779ca430cbdfb8ccd47ce6d7310607b957aa8c8072ed422fc989e627d4f00 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a68b723229cec4d668af0841eefc78be1bf16997b25b9f9fcdbab06d689ed3df', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd8f779ca430cbdfb8ccd47ce6d7310607b957aa8c8072ed422fc989e627d4f00'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed a68b723229cec4d668af0841eefc78be1bf16997b25b9f9fcdbab06d689ed3df -> d8f779ca430cbdfb8ccd47ce6d7310607b957aa8c8072ed422fc989e627d4f00 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3840 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.3.bb:do_packagedata)
NOTE: recipe debugedit-5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3855 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_configure)
NOTE: recipe at-spi2-core-2.56.3-r0: task do_packagedata: Started
NOTE: recipe diffoscope-303-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-303-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.2-r0: task do_configure: Started
NOTE: Running task 3856 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3857 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe diffoscope-303-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe diffoscope-303-r0: task do_configure: Succeeded
NOTE: Running task 3858 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_compile)
NOTE: recipe diffoscope-303-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.56.3-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-303-r0: task do_compile: Succeeded
NOTE: Running task 3864 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_install)
NOTE: recipe diffoscope-303-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: Running task 3865 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe binutils-2.45-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package_write_rpm unihash changed to d53a70d0260471f0b705994a6a064e8655ef3d09e24ca998a6f49624d1fdbb7a
NOTE: recipe diffoscope-303-r0: task do_install: Succeeded
NOTE: Running task 3866 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_package)
NOTE: Running task 3867 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_populate_sysroot)
NOTE: recipe diffoscope-303-r0: task do_package: Started
NOTE: recipe diffoscope-303-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-303-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: Running task 3868 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: Running task 3869 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: Running task 3870 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3871 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-303-r0: task do_package: Succeeded
NOTE: recipe vim-9.1.1198-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3872 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_packagedata)
NOTE: recipe diffoscope-303-r0: task do_packagedata: Started
NOTE: recipe diffoscope-303-r0: task do_packagedata: Succeeded
NOTE: Running task 3873 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_create_spdx)
NOTE: recipe diffoscope-303-r0: task do_create_spdx: Started
NOTE: recipe debugedit-5.2-r0: task do_configure: Succeeded
NOTE: Running task 3874 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_compile)
NOTE: recipe diffoscope-303-r0: task do_create_spdx: Succeeded
NOTE: recipe debugedit-5.2-r0: task do_compile: Started
NOTE: recipe vim-9.1.1198-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3875 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_configure)
NOTE: recipe vim-9.1.1198-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: Running task 3876 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata unihash changed to da34178df8040d355f4ff1d6ee0bd174c93b59a8de51b9b5d14fc50428568a3a
NOTE: Setscene tasks completed
NOTE: Running task 3877 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Succeeded
NOTE: Running task 3878 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_collect_spdx_deps)
NOTE: recipe vim-9.1.1198-r0: task do_collect_spdx_deps: Started
NOTE: recipe debugedit-5.2-r0: task do_compile: Succeeded
NOTE: Running task 3879 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_install)
NOTE: recipe vim-9.1.1198-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe debugedit-5.2-r0: task do_install: Started
NOTE: recipe debugedit-5.2-r0: task do_install: Succeeded
NOTE: Running task 3880 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_package)
NOTE: recipe debugedit-5.2-r0: task do_package: Started
NOTE: recipe debugedit-5.2-r0: task do_package: Succeeded
NOTE: Running task 3881 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_packagedata)
NOTE: recipe debugedit-5.2-r0: task do_packagedata: Started
NOTE: recipe debugedit-5.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.2.bb:do_packagedata unihash changed to 56e8dbb196d061acaae06be531d408da9950d1b1378a698dafb8932218fc6927
NOTE: Setscene tasks completed
NOTE: Running task 3882 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_write_ipk)
NOTE: Running task 3883 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_write_deb)
NOTE: Running task 3884 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_write_rpm)
NOTE: Running task 3885 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_qa)
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_ipk: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_deb: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_write_ipk unihash changed to 10c31dd8eb834859685c0372262f1fcee8f685fd6aabd3b557616dfa69466b74
NOTE: recipe rpm-1_4.20.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_qa unihash changed to f0c119c5689ccc9f6802a80b35fe65fce76bc3aa090c7ce7c7d883c1c61588b4
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_write_rpm unihash changed to b6f0b3fa473cc9fb84f7044aa24d5464d8092630d36277a4c396097df4dc4c3f
NOTE: recipe rpm-1_4.20.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_package_write_deb unihash changed to 18be62f0b59d195acd89bde9a6693a166be4cd45b053c4414dacdf8b76392a64
NOTE: recipe vim-9.1.1198-r0: task do_configure: Succeeded
NOTE: Running task 3886 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_compile)
NOTE: recipe vim-9.1.1198-r0: task do_compile: Started
NOTE: recipe vim-9.1.1198-r0: task do_compile: Succeeded
NOTE: Running task 3887 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_install)
NOTE: recipe vim-9.1.1198-r0: task do_install: Started
NOTE: recipe vim-9.1.1198-r0: task do_install: Succeeded
NOTE: Running task 3888 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_package)
NOTE: Running task 3889 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_populate_sysroot)
NOTE: recipe vim-9.1.1198-r0: task do_package: Started
NOTE: recipe vim-9.1.1198-r0: task do_populate_sysroot: Started
NOTE: recipe vim-9.1.1198-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vim-9.1.1198-r0: task do_package: Succeeded
NOTE: Running task 3890 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_packagedata)
NOTE: recipe vim-9.1.1198-r0: task do_packagedata: Started
NOTE: recipe vim-9.1.1198-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_packagedata unihash changed to 943a684c7488b26a9306418b8915063b519aaf5adb913f322283841fca9deeae
NOTE: Setscene tasks completed
NOTE: Running task 3891 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_create_spdx)
NOTE: Running task 3892 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_package_write_ipk)
NOTE: Running task 3893 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_package_write_deb)
NOTE: Running task 3894 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_package_write_rpm)
NOTE: recipe vim-9.1.1198-r0: task do_create_spdx: Started
NOTE: Running task 3895 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_package_qa)
NOTE: recipe vim-9.1.1198-r0: task do_package_write_ipk: Started
NOTE: Running task 3896 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_package_write_ipk)
NOTE: Running task 3897 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_package_write_deb)
NOTE: recipe vim-9.1.1198-r0: task do_package_write_deb: Started
NOTE: Running task 3898 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_package_write_rpm)
NOTE: recipe vim-9.1.1198-r0: task do_package_write_rpm: Started
NOTE: Running task 3899 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_package_qa)
NOTE: recipe vim-9.1.1198-r0: task do_package_qa: Started
NOTE: recipe diffoscope-303-r0: task do_package_write_ipk: Started
NOTE: recipe diffoscope-303-r0: task do_package_write_deb: Started
NOTE: recipe diffoscope-303-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-303-r0: task do_package_qa: Started
NOTE: recipe diffoscope-303-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vim-9.1.1198-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_package_write_ipk unihash changed to b29ba356c8c2779192a38ed0e8661df3aebe91c430150dfa0c48e55b10bb2195
NOTE: recipe vim-9.1.1198-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-303-r0: task do_package_qa: Succeeded
NOTE: Running task 3900 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_create_package_spdx)
NOTE: recipe diffoscope-303-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-303-r0: task do_package_write_deb: Succeeded
NOTE: recipe diffoscope-303-r0: task do_create_package_spdx: Started
NOTE: recipe diffoscope-303-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vim-9.1.1198-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_package_qa unihash changed to cec77e4aa931d5fdfc77d1f2a70b928ed9eb35e0cdb236619a8b61919fbf6055
NOTE: recipe vim-9.1.1198-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_package_write_rpm unihash changed to 629c1173ee76f9039da7f399cb47e0b509acd475734568679a60b0acce04bd9c
NOTE: recipe vim-9.1.1198-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vim/vim_9.1.bb:do_package_write_deb unihash changed to d7203a921525c81e6fda05d9260ed118dce0193d46168b45e5d48bc62fddff28
NOTE: Running noexec task 3901 of 3901 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/diffoscope/diffoscope_303.bb:do_build)
NOTE: Tasks Summary: Attempted 3901 tasks of which 3826 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 110 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kab went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.56.4-r0 to 0:2.56.3-r0) [version-going-backwards]
ERROR: at-spi2-core-2.56.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2988969573529375204==--

