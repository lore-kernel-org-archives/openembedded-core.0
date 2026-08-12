Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A25C5CFF1
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 06:00:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1831.1786514411361751367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 23:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OYNuEuXz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4iliiCkK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ff48e8cfa-c596e54a-0031-4991-8ccc-108321c7b1fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786514410;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+GAwLRInkA+dJSIXnc2rFquCSZaoM77KL34T7HtH7JY=;
	b=OYNuEuXzvfqjndn+Qf1f8I1uYtORC33sVKDnalHw+UluosckawDd4vwzBS1KFhb9
	wDnID/0HEs1d7FYarLZb/6brzALMUNObcgLgvMYtBZxvX70h+HNmRmcW7CJ8JXUF+U4
	CPJ1SUV0iedlSM/i4VaenpAzLjipH7bAVmGCl5uo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786514410;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+GAwLRInkA+dJSIXnc2rFquCSZaoM77KL34T7HtH7JY=;
	b=4iliiCkK0QQvEZonKrmzEi6BECBBBgJeFmi7khHBSCZiJKqf2lwn9XRJDTdo9m2h
	nCnAfHhmTVDpJXICZyNI+u0zBfacuWakjosfRG/wrjrUUXkhj2N5e5+i3tTfXKLWLIL
	6RS5LQosIuf3t/riPHkLEp0CWQ1bde7wTCfJ7lD0=
Content-Type: multipart/mixed; boundary="===============2650422256575334084=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.48.0 FAILED
Message-ID: <0101019ff48e8cfa-c596e54a-0031-4991-8ccc-108321c7b1fc-000000@us-west-2.amazonses.com>
Date: Wed, 12 Aug 2026 06:00:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.12-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 06:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243240

--===============2650422256575334084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wheel* to *0.48.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-wheel-upgrade-0.47.0-0.48.0.patch
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
From f68d4f73df887084bf90fc2e37f774f5dd1f9602 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 12 Aug 2026 05:28:09 +0000
Subject: [PATCH] python3-wheel: upgrade 0.47.0 -> 0.48.0

Source: docs/news.rst

**0.48.0** (2026-08-12)

- Added a ``--local-version`` option to ``wheel pack`` to add, replace, or remove a
  PEP 440 local version identifier from a wheel
  (`#570 <https://github.com/pypa/wheel/issues/570>`_)
- Fixed ``wheel convert`` unnecessarily upgrading compatible core metadata versions
  (`#643 <https://github.com/pypa/wheel/issues/643>`_)
- Fixed ``wheel tags`` producing invalid archives when retagging wheels whose
  entries use ZIP64, by dropping the central-directory ZIP64 extra field that is
  not valid in a local file header
  (`#692 <https://github.com/pypa/wheel/issues/692>`_)
- Fixed ``wheel convert`` writing the converted wheel outside the destination
  directory when the input archive contained a maliciously crafted project name
  or version with path separators (arbitrary file write / path traversal)
  (`GHSA-vgq5-9859-3mmw <https://github.com/pypa/wheel/security/advisories/GHSA-vgq5-9859-3mmw>`_)
---
 .../python/{python3-wheel_0.47.0.bb => python3-wheel_0.48.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.47.0.bb => python3-wheel_0.48.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.47.0.bb b/meta/recipes-devtools/python/python3-wheel_0.48.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-wheel_0.47.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.48.0.bb
index 4320442729..21c9c7464c 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.47.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.48.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "cc72bd1009ba0cf63922e28f94d9d83b920aa2bb28f798a31d0691b02fa3c9b3"
+SRC_URI[sha256sum] = "94800765601e9171bf5d58d066e640662842bcedcbab982b2c90787a2c987322"
 
 inherit python_flit_core pypi ptest-python-pytest
 
-- 
2.47.1


--===============2650422256575334084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-wheel-changelog.txt"

Changelog for python3-wheel: 0.47.0 -> 0.48.0
Source: docs/news.rst

**0.48.0** (2026-08-12)

- Added a ``--local-version`` option to ``wheel pack`` to add, replace, or remove a
  PEP 440 local version identifier from a wheel
  (`#570 <https://github.com/pypa/wheel/issues/570>`_)
- Fixed ``wheel convert`` unnecessarily upgrading compatible core metadata versions
  (`#643 <https://github.com/pypa/wheel/issues/643>`_)
- Fixed ``wheel tags`` producing invalid archives when retagging wheels whose
  entries use ZIP64, by dropping the central-directory ZIP64 extra field that is
  not valid in a local file header
  (`#692 <https://github.com/pypa/wheel/issues/692>`_)
- Fixed ``wheel convert`` writing the converted wheel outside the destination
  directory when the input archive contained a maliciously crafted project name
  or version with path separators (arbitrary file write / path traversal)
  (`GHSA-vgq5-9859-3mmw <https://github.com/pypa/wheel/security/advisories/GHSA-vgq5-9859-3mmw>`_)

--===============2650422256575334084==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wheel-upgrade-0.47.0-0.48.0.patch"

RnJvbSBmNjhkNGY3M2RmODg3MDg0YmY5MGZjMmUzN2Y3NzRmNWRkMWY5NjAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTIgQXVnIDIwMjYgMDU6Mjg6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdoZWVsOiB1cGdyYWRlIDAuNDcuMCAtPiAwLjQ4LjAKClNvdXJjZTogZG9jcy9uZXdz
LnJzdAoKKiowLjQ4LjAqKiAoMjAyNi0wOC0xMikKCi0gQWRkZWQgYSBgYC0tbG9jYWwtdmVyc2lv
bmBgIG9wdGlvbiB0byBgYHdoZWVsIHBhY2tgYCB0byBhZGQsIHJlcGxhY2UsIG9yIHJlbW92ZSBh
CiAgUEVQIDQ0MCBsb2NhbCB2ZXJzaW9uIGlkZW50aWZpZXIgZnJvbSBhIHdoZWVsCiAgKGAjNTcw
IDxodHRwczovL2dpdGh1Yi5jb20vcHlwYS93aGVlbC9pc3N1ZXMvNTcwPmBfKQotIEZpeGVkIGBg
d2hlZWwgY29udmVydGBgIHVubmVjZXNzYXJpbHkgdXBncmFkaW5nIGNvbXBhdGlibGUgY29yZSBt
ZXRhZGF0YSB2ZXJzaW9ucwogIChgIzY0MyA8aHR0cHM6Ly9naXRodWIuY29tL3B5cGEvd2hlZWwv
aXNzdWVzLzY0Mz5gXykKLSBGaXhlZCBgYHdoZWVsIHRhZ3NgYCBwcm9kdWNpbmcgaW52YWxpZCBh
cmNoaXZlcyB3aGVuIHJldGFnZ2luZyB3aGVlbHMgd2hvc2UKICBlbnRyaWVzIHVzZSBaSVA2NCwg
YnkgZHJvcHBpbmcgdGhlIGNlbnRyYWwtZGlyZWN0b3J5IFpJUDY0IGV4dHJhIGZpZWxkIHRoYXQg
aXMKICBub3QgdmFsaWQgaW4gYSBsb2NhbCBmaWxlIGhlYWRlcgogIChgIzY5MiA8aHR0cHM6Ly9n
aXRodWIuY29tL3B5cGEvd2hlZWwvaXNzdWVzLzY5Mj5gXykKLSBGaXhlZCBgYHdoZWVsIGNvbnZl
cnRgYCB3cml0aW5nIHRoZSBjb252ZXJ0ZWQgd2hlZWwgb3V0c2lkZSB0aGUgZGVzdGluYXRpb24K
ICBkaXJlY3Rvcnkgd2hlbiB0aGUgaW5wdXQgYXJjaGl2ZSBjb250YWluZWQgYSBtYWxpY2lvdXNs
eSBjcmFmdGVkIHByb2plY3QgbmFtZQogIG9yIHZlcnNpb24gd2l0aCBwYXRoIHNlcGFyYXRvcnMg
KGFyYml0cmFyeSBmaWxlIHdyaXRlIC8gcGF0aCB0cmF2ZXJzYWwpCiAgKGBHSFNBLXZncTUtOTg1
OS0zbW13IDxodHRwczovL2dpdGh1Yi5jb20vcHlwYS93aGVlbC9zZWN1cml0eS9hZHZpc29yaWVz
L0dIU0EtdmdxNS05ODU5LTNtbXc+YF8pCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy13aGVlbF8w
LjQ3LjAuYmIgPT4gcHl0aG9uMy13aGVlbF8wLjQ4LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi97cHl0aG9uMy13aGVlbF8wLjQ3LjAuYmIgPT4gcHl0aG9uMy13aGVlbF8w
LjQ4LjAuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXdoZWVsXzAuNDcuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy13aGVlbF8wLjQ4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDcuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDguMC5i
YgppbmRleCA0MzIwNDQyNzI5Li4yMWM5Yzc0NjRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxfMC40Ny4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQ4LjAuYmIKQEAgLTQsNyArNCw3IEBA
IFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9N2ZmYjBkYjA0NTI3Y2ZlMzgwZTRmMjcyNmJk
MDVlYmYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjYzcyYmQxMDA5YmEwY2Y2MzkyMmUyOGY5
NGQ5ZDgzYjkyMGFhMmJiMjhmNzk4YTMxZDA2OTFiMDJmYTNjOWIzIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjk0ODAwNzY1NjAxZTkxNzFiZjVkNThkMDY2ZTY0MDY2Mjg0MmJjZWRjYmFiOTgyYjJj
OTA3ODdhMmM5ODczMjIiCiAKIGluaGVyaXQgcHl0aG9uX2ZsaXRfY29yZSBweXBpIHB0ZXN0LXB5
dGhvbi1weXRlc3QKIAotLSAKMi40Ny4xCgo=

--===============2650422256575334084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-1c9e97156da927fe783fe16db4f88a07641755ee"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:1c9e97156da927fe783fe16db4f88a07641755ee"
meta-yocto-bsp       
meta-poky            = "master:0afedb9b1195525861f9140d6f33e9cd4118b199"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 642 Local 382 Mirrors 0 Missed 260 Current 207 (59% match, 69% complete)
done.
Removing 67 stale sstate objects for arch qemux86_64...done.
Removing 16 stale sstate objects for arch x86_64...done.
Removing 28 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 290 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 301 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 306 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 310 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 327 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 331 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 344 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 349 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 352 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 354 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tzcode-native-2026c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tzdata-2026c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.155.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 356 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe tzdata-2026c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 361 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 365 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pygments-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 370 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 373 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 376 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 379 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-hypothesis-6.155.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-native-4.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 383 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tzcode-native-2026c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 388 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 389 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 393 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ca-certificates-20260601-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tzdata-2026c-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 399 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ca-certificates-20260601-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 400 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygments-2.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 403 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb:do_recipe_qa_setscene)
NOTE: recipe tzdata-2026c-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 404 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 405 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_recipe_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 407 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 412 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 413 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 414 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 415 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.155.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 424 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.155.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 426 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 427 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 428 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 430 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 431 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 432 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 435 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tzcode-native-2026c-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-native-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 448 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 449 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-native-2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 450 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tzcode-native-2026c-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 451 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 452 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20260601-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 454 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 459 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 462 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 470 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 473 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-native-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 476 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 477 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ca-certificates-20260601-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 479 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 480 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 481 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-native-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 483 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 484 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-native-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 488 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 489 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cmake-native-4.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 491 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 492 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 495 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 498 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-native-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 499 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 500 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cmake-native-4.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 506 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 509 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 510 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 513 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 515 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 520 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-native-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 525 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 526 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gettext-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 532 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 533 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-native-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 537 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 539 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 542 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 546 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 547 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 555 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 558 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 559 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-native-6.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 561 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 565 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 567 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 568 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-native-5.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-native-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 570 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 571 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 572 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 573 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 576 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_recipe_qa_setscene)
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 577 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe perl-native-5.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 582 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 586 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 587 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 593 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 594 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 595 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 602 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 605 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 608 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 614 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 621 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 622 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 628 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 634 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 639 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 640 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 641 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 646 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 649 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 651 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_spdx_setscene)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 653 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 655 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 660 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_create_spdx_setscene)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 663 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 667 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-initial-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 668 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 669 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 673 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 679 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 681 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 682 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 684 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 685 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 686 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 687 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 689 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 692 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 693 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 694 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 695 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 699 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 700 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 705 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 711 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe rsync-native-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 712 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 715 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 716 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 718 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 723 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: recipe rsync-native-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 726 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 727 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 729 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 731 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 732 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 733 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 734 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 735 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 737 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 740 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 744 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 746 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 747 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 755 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 756 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 757 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 761 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 763 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 764 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_stash_locale_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 766 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 767 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 770 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 772 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 774 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 775 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 776 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-native-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 779 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Started
NOTE: Running setscene task 780 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 788 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 789 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pkgconf-native-3.0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 790 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 792 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-native-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 793 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rsync-native-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 795 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 798 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 799 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-native-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 801 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 802 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-native-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libarchive-native-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 806 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 810 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-native-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 813 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe p11-kit-native-0.26.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 815 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 816 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe automake-native-1.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-native-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-native-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 820 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 822 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-native-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe automake-native-1.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 825 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 136 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_fetch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-native-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 826 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe rsync-native-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 251 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_recipe_qa)
NOTE: Running noexec task 254 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_fetch)
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 262 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_fetch)
NOTE: Running noexec task 268 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_fetch)
NOTE: Running task 269 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_fetch)
NOTE: Running task 270 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_fetch)
NOTE: Running task 272 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_fetch)
NOTE: Running task 277 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_write_config)
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 281 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe autoconf-native-2.73-r0: task do_create_spdx_setscene: Started
NOTE: Running task 285 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 298 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_fetch)
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe automake-native-1.18.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 299 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Started
NOTE: recipe autoconf-native-2.73-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running setscene task 829 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_recipe_qa: Started
NOTE: recipe meson-native-1.11.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_fetch: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_write_config: Started
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe automake-native-1.18.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 833 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 836 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_spdx_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 840 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 841 of 849 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_recipe_qa_setscene)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe autoconf-native-2.73-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 328 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_unpack)
NOTE: Running task 330 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_fetch)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe autoconf-native-2.73-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 847 of 849 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Started
NOTE: Running task 576 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: Running task 599 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: Running task 600 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 601 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_fetch)
NOTE: recipe gettext-minimal-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 609 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: Running task 610 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_patch)
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Succeeded
NOTE: Running task 611 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_unpack)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 612 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_unpack)
NOTE: recipe libarchive-native-3.8.9-r0: task do_fetch: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_patch: Started
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-native-3.8.13-r0: task do_fetch: Started
NOTE: Running task 613 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 614 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_patch: Succeeded
NOTE: Running task 617 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_unpack: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 618 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_patch)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 619 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_patch)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-1.11.2-r0: task do_fetch: Succeeded
NOTE: Running task 623 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: Running task 624 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_unpack)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_patch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.195-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.195-r0: task do_fetch: Succeeded
NOTE: Running task 636 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Started
NOTE: Running task 645 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_patch: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_patch: Succeeded
NOTE: Running task 647 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: Running task 648 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-native-3.8.13-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_unpack: Succeeded
NOTE: Running task 649 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_patch)
NOTE: recipe meson-native-1.11.2-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 650 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 651 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_configure)
NOTE: recipe meson-native-1.11.2-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_patch: Started
NOTE: Running task 659 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: recipe util-linux-native-2.42.2-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 660 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_unpack)
NOTE: Running task 661 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 669 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.195-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_configure: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_unpack: Started
NOTE: Running task 670 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_compile)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_compile: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 673 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.1.bb:do_patch)
NOTE: recipe gnutls-native-3.8.13-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_patch: Started
NOTE: Running task 675 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe gnutls-native-3.8.13-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 676 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_patch: Succeeded
NOTE: Running task 708 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 710 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 714 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_fetch)
NOTE: recipe util-linux-native-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 715 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe expat-2.8.2-r0: task do_fetch: Started
NOTE: recipe elfutils-native-0.195-r0: task do_unpack: Succeeded
NOTE: Running task 716 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: recipe util-linux-native-2.42.2-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.195-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_compile: Succeeded
NOTE: Running task 717 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_install)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_install: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Succeeded
NOTE: Running task 720 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_fetch)
NOTE: Running task 721 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_patch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Started
NOTE: recipe glibc-2.44+git-r0: task do_patch: Started
NOTE: recipe expat-2.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 723 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_install: Succeeded
NOTE: recipe elfutils-native-0.195-r0: task do_patch: Succeeded
NOTE: Running task 725 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_fetch)
NOTE: Running task 726 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_populate_sysroot)
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 728 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_fetch: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_fetch: Started
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_patch: Succeeded
NOTE: Running task 730 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.1.bb:do_preconfigure)
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_preconfigure: Started
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-native-0.26.5-r0: task do_fetch: Succeeded
NOTE: Running task 735 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 736 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 738 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: Running task 740 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_preconfigure: Succeeded
NOTE: Running task 742 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe glibc-2.44+git-r0: task do_patch: Succeeded
NOTE: Running task 745 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe xz-5.8.3-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 746 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_configure)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_configure: Succeeded
NOTE: Running task 747 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_compile)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_compile: Started
NOTE: recipe xz-5.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 748 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_unpack)
NOTE: recipe expat-2.8.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 749 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: recipe expat-2.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 750 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 751 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe expat-2.8.2-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe expat-2.8.2-r0: task do_patch: Succeeded
NOTE: Running task 766 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_write_config)
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 781 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe p11-kit-native-0.26.5-r0: task do_write_config: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_unpack: Succeeded
NOTE: Running task 782 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_patch)
NOTE: recipe p11-kit-native-0.26.5-r0: task do_write_config: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 784 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_unpack)
NOTE: Running task 785 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe p11-kit-native-0.26.5-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 786 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_unpack)
NOTE: recipe p11-kit-native-0.26.5-r0: task do_patch: Succeeded
NOTE: Running task 789 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 790 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 792 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_unpack)
NOTE: recipe xz-5.8.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 793 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_patch)
NOTE: Running task 794 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_patch)
NOTE: recipe xz-5.8.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_patch: Started
NOTE: recipe xz-5.8.3-r0: task do_patch: Succeeded
NOTE: Running task 819 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_write_config)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_write_config: Started
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: Running task 822 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: recipe openssl-3.5.7-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 825 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_generate_toolchain_file)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_compile: Succeeded
NOTE: Running task 826 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_install)
NOTE: recipe expat-2.8.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.8.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 829 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_install: Started
NOTE: recipe openssl-3.5.7-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: Running task 840 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_patch: Succeeded
NOTE: Running task 843 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_install: Succeeded
NOTE: Running task 844 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 847 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 850 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe meson-native-1.11.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe meson-native-1.11.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 851 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_configure)
NOTE: recipe meson-native-1.11.2-r0: task do_configure: Started
NOTE: recipe meson-native-1.11.2-r0: task do_configure: Succeeded
NOTE: Running task 852 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_compile)
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 853 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_unpack)
NOTE: recipe meson-native-1.11.2-r0: task do_compile: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 854 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_unpack)
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 855 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_patch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Succeeded
NOTE: Running task 860 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Succeeded
NOTE: Running task 861 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Started
NOTE: recipe meson-native-1.11.2-r0: task do_compile: Succeeded
NOTE: Running task 862 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_install)
NOTE: recipe meson-native-1.11.2-r0: task do_install: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Succeeded
NOTE: Running task 863 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Succeeded
NOTE: Running task 866 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 867 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_install: Succeeded
NOTE: Running task 868 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_populate_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 870 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_fetch)
NOTE: recipe meson-native-1.11.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Succeeded
NOTE: Running task 872 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 873 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 874 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 875 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 876 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_configure)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 877 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_configure)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_configure: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 878 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Succeeded
NOTE: Running task 879 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 880 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: Running task 884 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 888 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_configure: Succeeded
NOTE: Running task 889 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_compile)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_compile: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_compile: Succeeded
NOTE: Running task 890 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_fetch)
NOTE: Running task 891 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_install)
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_install: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_install: Succeeded
NOTE: Running task 892 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_populate_sysroot)
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 893 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_fetch)
NOTE: recipe qemu-native-11.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 894 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 896 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: recipe qemu-native-11.0.3-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Succeeded
NOTE: Running task 899 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 900 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe qemu-native-11.0.3-r0: task do_patch: Succeeded
NOTE: Running task 902 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe util-linux-native-2.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running task 905 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 906 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 907 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: Running task 909 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 910 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 911 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_unpack)
NOTE: recipe util-linux-native-2.42.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 912 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Succeeded
NOTE: Running task 913 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 914 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: Running task 918 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Succeeded
NOTE: Running task 920 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 921 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Succeeded
NOTE: Running task 922 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_patch)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 923 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_unpack)
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Started
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 924 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Succeeded
NOTE: Running task 925 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: Running task 926 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_patch: Started
NOTE: recipe libffi-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 928 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 929 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 958 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_fetch)
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 960 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_fetch)
NOTE: recipe curl-8.21.0-r0: task do_fetch: Started
NOTE: recipe curl-8.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 968 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_unpack)
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Succeeded
NOTE: Running task 969 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_patch)
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running task 970 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Succeeded
NOTE: Running task 971 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe curl-8.21.0-r0: task do_unpack: Started
NOTE: recipe curl-8.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 972 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_patch)
NOTE: recipe curl-8.21.0-r0: task do_patch: Started
NOTE: recipe curl-8.21.0-r0: task do_patch: Succeeded
NOTE: Running task 974 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 979 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 982 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 983 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_fetch)
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Succeeded
NOTE: Running task 985 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Succeeded
NOTE: Running task 986 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_configure: Succeeded
NOTE: Running task 987 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_compile)
NOTE: recipe linux-libc-headers-6.18-r0: task do_patch: Succeeded
NOTE: Running noexec task 989 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_configure)
NOTE: Running noexec task 990 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_compile)
NOTE: Running task 991 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_install)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_compile: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_install: Succeeded
NOTE: Running task 1006 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 1007 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_unpack)
NOTE: recipe glibc-2.44+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Started
NOTE: recipe glibc-2.44+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1008 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_configure)
NOTE: recipe glibc-2.44+git-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 1009 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_patch)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1010 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_generate_toolchain_file)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1012 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1013 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1019 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 1020 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1021 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_unpack)
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1022 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: Running task 1023 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1024 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_patch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1025 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 1026 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: Running task 1027 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1029 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1030 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_compile: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1032 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_patch)
NOTE: Running task 1033 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_install)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_install: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1034 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_write_config)
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Started
NOTE: recipe glibc-2.44+git-r0: task do_configure: Succeeded
NOTE: Running task 1035 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_compile)
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: Running task 1048 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: Running task 1062 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_fetch)
NOTE: recipe glibc-2.44+git-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Succeeded
NOTE: Running task 1066 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_recipe_qa)
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1068 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: recipe python3-wheel-0.48.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Succeeded
NOTE: Running task 1070 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1071 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running task 1072 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-native-2.3.8-r0: task do_unpack: Started
NOTE: recipe python3-wheel-0.48.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_install: Succeeded
NOTE: Running task 1074 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_fetch)
NOTE: Running task 1075 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_populate_sysroot)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1076 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe libidn2-native-2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wheel-0.48.0-r0: task do_fetch: Started
NOTE: recipe python3-wheel-0.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 1077 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1078 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1082 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_unpack)
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_patch: Started
NOTE: Running task 1084 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe python3-wheel-0.48.0-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe python3-wheel-0.48.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1085 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_patch)
NOTE: Running task 1086 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: recipe python3-wheel-0.48.0-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1089 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: Running task 1090 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_configure)
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe python3-wheel-0.48.0-r0: task do_patch: Succeeded
NOTE: Running task 1096 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: Running task 1097 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1099 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1102 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_fetch: Started
NOTE: Running task 1103 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe elfutils-0.195-r0: task do_fetch: Succeeded
NOTE: Running task 1105 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_fetch)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: Running task 1111 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1112 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_fetch: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1114 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 1115 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: Running task 1116 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_unpack)
NOTE: recipe qemu-native-11.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_configure)
NOTE: Running task 1124 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Running task 1125 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_unpack: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_configure: Started
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1126 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_patch)
NOTE: recipe elfutils-0.195-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running task 1127 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_patch: Started
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1128 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1129 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_patch)
NOTE: Running task 1130 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: Running task 1136 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_unpack)
NOTE: recipe python3-wheel-0.48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_patch: Started
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1143 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.155.7-r0: task do_fetch: Started
NOTE: recipe python3-wheel-0.48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1144 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.155.7-r0: task do_fetch: Succeeded
NOTE: Running task 1145 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1146 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_fetch)
NOTE: recipe coreutils-9.11-r0: task do_fetch: Started
NOTE: recipe elfutils-0.195-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: recipe elfutils-0.195-r0: task do_patch: Started
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1148 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_patch)
NOTE: recipe shadow-4.20.2-r0: task do_patch: Started
NOTE: recipe shadow-4.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1149 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe elfutils-0.195-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1154 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1157 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1159 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1162 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_prepare_recipe_sysroot)
WARNING: libarchive-native-3.8.9-r0 do_fetch: Failed to fetch URL https://libarchive.org/downloads/libarchive-3.8.9.tar.gz, attempting MIRRORS if available
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1165 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.155.7-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.155.7-r0: task do_unpack: Succeeded
NOTE: Running task 1166 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1167 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb:do_patch)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1168 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_configure)
NOTE: recipe python3-hypothesis-6.155.7-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.155.7-r0: task do_patch: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_configure: Started
NOTE: Running task 1169 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Started
NOTE: Running task 1170 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_compile)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1172 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_compile: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: Running task 1173 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1176 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
WARNING: libarchive-3.8.9-r0 do_fetch: Failed to fetch URL https://libarchive.org/downloads/libarchive-3.8.9.tar.gz, attempting MIRRORS if available
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1177 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_fetch)
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1178 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Started
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1179 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: Running task 1180 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_configure: Succeeded
NOTE: Running task 1181 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_compile)
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: Running task 1188 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1192 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1193 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1195 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: Running task 1201 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_fetch)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1202 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_install)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_fetch: Started
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_install: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1203 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_install: Succeeded
NOTE: Running task 1204 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_populate_sysroot)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1205 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1206 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1207 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1208 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_unpack)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1215 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1216 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1217 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_fetch: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_fetch: Succeeded
NOTE: Running task 1218 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_fetch: Succeeded
NOTE: Running task 1220 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_fetch)
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1223 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1224 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_configure)
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_unpack: Started
NOTE: Running task 1226 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1227 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_patch)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1229 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1230 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_compile)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Succeeded
NOTE: Running task 1233 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_unpack)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_compile: Started
NOTE: Running task 1237 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1238 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_unpack)
NOTE: Running task 1241 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_patch: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1242 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_patch)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1245 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_unpack)
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_patch: Started
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_patch: Succeeded
NOTE: Running task 1246 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_unpack: Succeeded
NOTE: Running task 1248 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb:do_patch)
NOTE: Running task 1252 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_patch: Started
NOTE: recipe python3-hatchling-native-1.31.0-r0: task do_patch: Succeeded
NOTE: Running task 1257 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_unpack: Succeeded
NOTE: Running task 1258 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_patch: Started
NOTE: Running task 1259 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_patch: Succeeded
NOTE: Running task 1278 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_create_recipe_spdx)
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1288 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1289 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.48.0.bb:do_create_spdx)
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_create_spdx: Started
NOTE: recipe meson-native-1.11.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1293 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wheel-native-0.48.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1297 of 2127 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: recipe libarchive-native-3.8.9-r0: task do_fetch: Failed
NOTE: Setscene tasks completed
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_fetch: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_compile: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Failed
NOTE: recipe util-linux-native-2.42.2-r0: task do_compile: Succeeded
NOTE: recipe libtasn1-native-4.21.0-r0: task do_configure: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_configure: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1299 tasks of which 1006 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260812052642.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260812052642.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libarchive-native/3.8.9/temp/log.do_fetch.2217744
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libarchive/3.8.9/temp/log.do_fetch.2232256
Summary: There were 2 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-native-3.8.9-r0 do_fetch: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-3.8.9.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz', '--progress=dot', '--verbose'] failed with exit code 4, see logfile for output
ERROR: libarchive-native-3.8.9-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz')
ERROR: libarchive-3.8.9-r0 do_fetch: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-3.8.9.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz', '--progress=dot', '--verbose'] failed with exit code 4, see logfile for output
ERROR: libarchive-3.8.9-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libarchive-native/3.8.9/temp/log.do_fetch.2217744
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libarchive/3.8.9/temp/log.do_fetch.2232256
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch) failed with exit code '1'

--===============2650422256575334084==--

