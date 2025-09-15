Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A20CAC5A2
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.30887.1757937280016281415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2ugZjOLh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oosJjEnD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101994d3a60d0-1e0beb00-0051-4b6f-86eb-e7180349b135-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+oOvJz21g9Pgbt+QeKN/oyBBfMu6zaMNb26dMvg1Wpw=;
	b=2ugZjOLh78cKB/ahjT/SIMa2mi9PYqiJz4JYUucvZ70hf/2dmLfJZBOOSvRzXY5M
	THQk8iZXCnMGiKxjFubD5enZJ/9tLIDGqGSfOmeyAY2g+YCo+fA1CD054F+AtrFWgAp
	EvshcU64nGPHdALK/gEcabOmFwVgHK81+G8Pnvmo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+oOvJz21g9Pgbt+QeKN/oyBBfMu6zaMNb26dMvg1Wpw=;
	b=oosJjEnD5KwP+q0v2+kWK1mTfyNLswetxsmVk0MkYmS8RkuTADZIdrntCN5NWII2
	g8hLym6+SelUSDWzh0a7Hex8rtuNIcxJlOAL5kZd5IUUplYw+aPTtzP1uiKoqn1smNO
	ANpzePyuyU6kz/hDUOU14CcMujOrJdrjm08mAslA=
Content-Type: multipart/mixed; boundary="===============7045261164124481814=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.58.0 FAILED
Message-ID: <010101994d3a60d0-1e0beb00-0051-4b6f-86eb-e7180349b135-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223477

--===============7045261164124481814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *at-spi2-core* to *2.58.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.56.4-2.58.0.patch
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
From 1aacc66106a6d887882435a694a1c4ced83ace65 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 11:22:49 +0000
Subject: [PATCH] at-spi2-core: upgrade 2.56.4 -> 2.58.0

---
 .../atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.0.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb b/meta/recipes-support/atk/at-spi2-core_2.58.0.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.56.4.bb
rename to meta/recipes-support/atk/at-spi2-core_2.58.0.bb
index 90df892461..3a37712fc3 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.58.0.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "dbe35b951499e1d6f1fb552c2e0a09cea7cba2adf6c2eba0b2c85b6c094a3a02"
+SRC_URI[sha256sum] = "dfdd3300da2783a21969ffade2889817fb7c1906a4ef92497eba65969b3dab5a"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.1


--===============7045261164124481814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-cd68492357382fbb750f1d394b0c95de2dccf5b1"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cd68492357382fbb750f1d394b0c95de2dccf5b1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 275 Local 262 Mirrors 0 Missed 13 Current 483 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 574 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 599 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 600 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running task 1268 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_recipe_qa)
NOTE: Running task 1274 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_recipe_qa: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_write_config: Started
NOTE: Running setscene task 643 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 672 of 758 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_recipe_qa: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1946 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_fetch)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_fetch: Succeeded
NOTE: Running task 2095 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_unpack)
NOTE: Running task 2096 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_unpack: Succeeded
NOTE: Running task 2097 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_patch)
NOTE: Running task 2098 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_patch: Succeeded
NOTE: Running task 2099 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2100 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_populate_lic)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_populate_lic: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_populate_lic: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2101 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_configure: Succeeded
NOTE: Running task 2102 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_compile: Succeeded
NOTE: Running task 2103 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_install)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_install: Succeeded
NOTE: Running task 2104 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_package)
NOTE: Running task 2105 of 2113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.58.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.58.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2105 tasks of which 2091 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915112224.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915112224.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/at-spi2-core/2.58.0/temp/log.do_package.1736946
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.58.0-r0 do_package: QA Issue: at-spi2-core: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.13
  /usr/lib/python3.13/site-packages
  /usr/lib/python3.13/site-packages/gi
  /usr/lib/python3.13/site-packages/gi/overrides
  /usr/lib/python3.13/site-packages/gi/overrides/Atspi.py
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/Atspi.cpython-313.pyc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
at-spi2-core: 7 installed and not shipped files. [installed-vs-shipped]
ERROR: at-spi2-core-2.58.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/at-spi2-core/2.58.0/temp/log.do_package.1736946
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.58.0.bb:do_package) failed with exit code '1'

--===============7045261164124481814==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.56.4-2.58.0.patch"

RnJvbSAxYWFjYzY2MTA2YTZkODg3ODgyNDM1YTY5NGExYzRjZWQ4M2FjZTY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTE6MjI6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
dC1zcGkyLWNvcmU6IHVwZ3JhZGUgMi41Ni40IC0+IDIuNTguMAoKLS0tCiAuLi4vYXRrL3thdC1z
cGkyLWNvcmVfMi41Ni40LmJiID0+IGF0LXNwaTItY29yZV8yLjU4LjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsve2F0LXNwaTItY29yZV8yLjU2LjQuYmIgPT4gYXQtc3Bp
Mi1jb3JlXzIuNTguMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hdGsvYXQtc3BpMi1jb3JlXzIuNTYuNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi41OC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi41Ni40LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQtc3BpMi1jb3JlXzIuNTguMC5iYgppbmRleCA5MGRm
ODkyNDYxLi4zYTM3NzEyZmMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsv
YXQtc3BpMi1jb3JlXzIuNTYuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQt
c3BpMi1jb3JlXzIuNTguMC5iYgpAQCAtMTMsNyArMTMsNyBAQCBNQUpfVkVSID0gIiR7QG9lLnV0
aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAyKX0iCiAKIFNSQ19VUkkgPSAiJHtHTk9NRV9NSVJS
T1J9LyR7QlBOfS8ke01BSl9WRVJ9LyR7QlBOfS0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJkYmUzNWI5NTE0OTllMWQ2ZjFmYjU1MmMyZTBhMDljZWE3Y2JhMmFkZjZjMmVi
YTBiMmM4NWI2YzA5NGEzYTAyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRmZGQzMzAwZGEyNzgz
YTIxOTY5ZmZhZGUyODg5ODE3ZmI3YzE5MDZhNGVmOTI0OTdlYmE2NTk2OWIzZGFiNWEiCiAKIERF
UEVORFMgPSAiIFwKIAlkYnVzIFwKLS0gCjIuNDcuMQoK

--===============7045261164124481814==--

