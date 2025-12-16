Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD951D5E150
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:50 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17396.1765872135892522841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VJikAvrv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HONCMhWB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262ee97d-01282786-b1a9-4fe6-9472-5b6dee5dd1ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+F2me/BXfO1q8B2qfCBaA2dn/2ystwqED17lQIkHC9M=;
	b=VJikAvrvjHG5WR+KL4sMJ0uYP3Sc6999Vd0tV1sHJbZt1DVgCs+r7xeGFj/mIt6a
	ROD7wtjIrkSwffTxwwTT3KERKnkQetjqnR7JTkgLbYeOhcz2TucAZ7wvkK9VHx0B/ZD
	XFbA3qYGshz5Os1HmPn2Szpp/2U0GKipAd35wg+w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+F2me/BXfO1q8B2qfCBaA2dn/2ystwqED17lQIkHC9M=;
	b=HONCMhWBt/x6E+CDKHWWBcox+vW9jYi0yeT3sPYfzH1C2gqXW3qevuGuyttAXCfs
	ovcFoOTZFnSnS/VQGmJKK61XDdJXD3TekvsEGYbW4SfaZD7WMnjr78Kq0WHVFZGhMIB
	KJx3oSJNrbC4FV1jWdwJOxBJrjo9V0xxr4QbqSKo=
Content-Type: multipart/mixed; boundary="===============2058935863892567405=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.58.2 FAILED
Message-ID: <0101019b262ee97d-01282786-b1a9-4fe6-9472-5b6dee5dd1ab-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227905

--===============2058935863892567405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *at-spi2-core* to *2.58.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.56.4-2.58.2.patch
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
From 96fa3f5e6cfc7a75a3842a3dcd17c92254682524 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 06:36:21 +0000
Subject: [PATCH] at-spi2-core: upgrade 2.56.4 -> 2.58.2

---
 .../atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.2.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb b/meta/recipes-support/atk/at-spi2-core_2.58.2.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.56.4.bb
rename to meta/recipes-support/atk/at-spi2-core_2.58.2.bb
index a1cbf4b455..a9e4d89840 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.58.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "dbe35b951499e1d6f1fb552c2e0a09cea7cba2adf6c2eba0b2c85b6c094a3a02"
+SRC_URI[archive.sha256sum] = "a2823b962ed16cdd5cb1fc5365029fd218394d852acd4098b321854bd6692f6e"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.1


--===============2058935863892567405==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.56.4-2.58.2.patch"

RnJvbSA5NmZhM2Y1ZTZjZmM3YTc1YTM4NDJhM2RjZDE3YzkyMjU0NjgyNTI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDY6MzY6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
dC1zcGkyLWNvcmU6IHVwZ3JhZGUgMi41Ni40IC0+IDIuNTguMgoKLS0tCiAuLi4vYXRrL3thdC1z
cGkyLWNvcmVfMi41Ni40LmJiID0+IGF0LXNwaTItY29yZV8yLjU4LjIuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsve2F0LXNwaTItY29yZV8yLjU2LjQuYmIgPT4gYXQtc3Bp
Mi1jb3JlXzIuNTguMi5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hdGsvYXQtc3BpMi1jb3JlXzIuNTYuNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi41OC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi41Ni40LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQtc3BpMi1jb3JlXzIuNTguMi5iYgppbmRleCBhMWNi
ZjRiNDU1Li5hOWU0ZDg5ODQwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsv
YXQtc3BpMi1jb3JlXzIuNTYuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQt
c3BpMi1jb3JlXzIuNTguMi5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiAKIENW
RV9QUk9EVUNUICs9ICJhdC1zcGkyLWF0ayIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiZGJlMzViOTUxNDk5ZTFkNmYxZmI1NTJjMmUwYTA5Y2VhN2NiYTJhZGY2YzJlYmEwYjJjODVi
NmMwOTRhM2EwMiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImEyODIzYjk2MmVkMTZj
ZGQ1Y2IxZmM1MzY1MDI5ZmQyMTgzOTRkODUyYWNkNDA5OGIzMjE4NTRiZDY2OTJmNmUiCiAKIERF
UEVORFMgPSAiIFwKIAlkYnVzIFwKLS0gCjIuNDcuMQoK

--===============2058935863892567405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-95ae3d4bd1ace8f22971d651fa99f564551f9df6"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:95ae3d4bd1ace8f22971d651fa99f564551f9df6"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 151 Local 141 Mirrors 0 Missed 10 Current 612 (93% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 627 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 762 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-core-2.58.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 763 of 763 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2001 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_write_config)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2031 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_fetch)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_fetch: Succeeded
NOTE: Running task 2109 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_unpack)
NOTE: Running task 2110 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.58.2-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_unpack: Succeeded
NOTE: Running task 2111 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_patch)
NOTE: Running task 2112 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.2-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.58.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2114 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_configure)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_configure: Succeeded
NOTE: Running task 2116 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_compile)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_compile: Succeeded
NOTE: Running task 2117 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_install)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_install: Succeeded
NOTE: Running task 2118 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_package)
NOTE: Running task 2119 of 2127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.58.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.58.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.2-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2119 tasks of which 2108 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216063556.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216063556.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/at-spi2-core/2.58.2/temp/log.do_package.3286664
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.58.2-r0 do_package: QA Issue: at-spi2-core: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.13
  /usr/lib/python3.13/site-packages
  /usr/lib/python3.13/site-packages/gi
  /usr/lib/python3.13/site-packages/gi/overrides
  /usr/lib/python3.13/site-packages/gi/overrides/Atspi.py
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/Atspi.cpython-313.pyc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
at-spi2-core: 7 installed and not shipped files. [installed-vs-shipped]
ERROR: at-spi2-core-2.58.2-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/at-spi2-core/2.58.2/temp/log.do_package.3286664
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.2.bb:do_package) failed with exit code '1'

--===============2058935863892567405==--

