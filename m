Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2738CEDD98
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11964.1763224752507546823
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=E0s9mKty;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kHJL+bSy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a88628e0c-7e10d3b1-604c-47f5-bf8d-f2993ccb02fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NdfnIv5aw47VcKB3ebaqdtE6NO+QxTUifAQzdfabWio=;
	b=E0s9mKtyDiASq/pdFe7VHe4IKirJkrieiDzoQvOcaARQr7TKXOe112DHqW1ziuTr
	DUXF9NenFr3Krg3IptBDt+0CrvxlboO6o5hNYbHZ+KIWopyBfy3puPbwR2UwQNvwXyK
	Zc+I1IZIFhWtqBKVTdLyArJ2yJw92AevAxmZe2q0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NdfnIv5aw47VcKB3ebaqdtE6NO+QxTUifAQzdfabWio=;
	b=kHJL+bSyLeirvH8yiGUhHitcsoLbBcGk8VVGH+VyEPOEHyXfhK3sHnMthQsedsHH
	XvDBJXCE5cuaW/W5fSEjhups1HMWjsZqQt90KLAP8bZAEGg3O0lEGSPPJdK63dLO9l5
	idaEKYC3egmvQf2Jnm3j4PJEOghetRIRYrm1Xu4k=
Content-Type: multipart/mixed; boundary="===============5133071398659610293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.58.1 FAILED
Message-ID: <0101019a88628e0c-7e10d3b1-604c-47f5-bf8d-f2993ccb02fe-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226448

--===============5133071398659610293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *at-spi2-core* to *2.58.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.56.4-2.58.1.patch
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
From e1dd2506ed62d7c11348a4f8637389f4dfcb81eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 15:45:09 +0000
Subject: [PATCH] at-spi2-core: upgrade 2.56.4 -> 2.58.1

---
 .../atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.4.bb => at-spi2-core_2.58.1.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb b/meta/recipes-support/atk/at-spi2-core_2.58.1.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.56.4.bb
rename to meta/recipes-support/atk/at-spi2-core_2.58.1.bb
index a1cbf4b455..2887bb54d7 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.58.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "dbe35b951499e1d6f1fb552c2e0a09cea7cba2adf6c2eba0b2c85b6c094a3a02"
+SRC_URI[archive.sha256sum] = "7f374a6a38cd70ff4b32c9d3a0310bfa804d946fed4c9e69a7d49facdcb95e9c"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.1


--===============5133071398659610293==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.56.4-2.58.1.patch"

RnJvbSBlMWRkMjUwNmVkNjJkN2MxMTM0OGE0Zjg2MzczODlmNGRmY2I4MWViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTU6NDU6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
dC1zcGkyLWNvcmU6IHVwZ3JhZGUgMi41Ni40IC0+IDIuNTguMQoKLS0tCiAuLi4vYXRrL3thdC1z
cGkyLWNvcmVfMi41Ni40LmJiID0+IGF0LXNwaTItY29yZV8yLjU4LjEuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsve2F0LXNwaTItY29yZV8yLjU2LjQuYmIgPT4gYXQtc3Bp
Mi1jb3JlXzIuNTguMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hdGsvYXQtc3BpMi1jb3JlXzIuNTYuNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi41OC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi41Ni40LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQtc3BpMi1jb3JlXzIuNTguMS5iYgppbmRleCBhMWNi
ZjRiNDU1Li4yODg3YmI1NGQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsv
YXQtc3BpMi1jb3JlXzIuNTYuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdGsvYXQt
c3BpMi1jb3JlXzIuNTguMS5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiAKIENW
RV9QUk9EVUNUICs9ICJhdC1zcGkyLWF0ayIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiZGJlMzViOTUxNDk5ZTFkNmYxZmI1NTJjMmUwYTA5Y2VhN2NiYTJhZGY2YzJlYmEwYjJjODVi
NmMwOTRhM2EwMiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjdmMzc0YTZhMzhjZDcw
ZmY0YjMyYzlkM2EwMzEwYmZhODA0ZDk0NmZlZDRjOWU2OWE3ZDQ5ZmFjZGNiOTVlOWMiCiAKIERF
UEVORFMgPSAiIFwKIAlkYnVzIFwKLS0gCjIuNDcuMQoK

--===============5133071398659610293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1946 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (946 cached, 1 parsed). 1944 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-97babd72f3fb5091c2c6a0cdcdf16000e63d892e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:97babd72f3fb5091c2c6a0cdcdf16000e63d892e"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 272 Local 261 Mirrors 0 Missed 11 Current 486 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 554 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 610 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 615 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 629 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_populate_lic_setscene: Started
NOTE: Running task 1321 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_write_config)
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.58.1-r0: task do_write_config: Started
NOTE: Running setscene task 646 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 656 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1485 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe at-spi2-core-2.58.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_fetch: Succeeded
NOTE: Running task 1976 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_unpack)
NOTE: Running task 2042 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_unpack: Succeeded
NOTE: Running task 2097 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_patch)
NOTE: Running task 2098 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.58.1-r0: task do_patch: Succeeded
NOTE: Running task 2099 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_deploy_source_date_epoch unihash changed to 59edaed48237f7c888cc350869ad74c6310501aa6d8fc5d370b6217c1cdc33ca
NOTE: Setscene tasks completed
NOTE: Running task 2101 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_configure: Succeeded
NOTE: Running task 2102 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_compile: Succeeded
NOTE: Running task 2103 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_install)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_install: Succeeded
NOTE: Running task 2104 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_package)
NOTE: Running task 2105 of 2113 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.58.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.58.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_populate_sysroot unihash changed to 0ab9a5e89a24e5857651834acdbb8e4b6f3e73ede143fa48be304ee3dc972040
NOTE: Setscene tasks completed
NOTE: recipe at-spi2-core-2.58.1-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2105 tasks of which 2093 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115154443.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115154443.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/at-spi2-core/2.58.1/temp/log.do_package.1101573
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.58.1-r0 do_package: QA Issue: at-spi2-core: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.13
  /usr/lib/python3.13/site-packages
  /usr/lib/python3.13/site-packages/gi
  /usr/lib/python3.13/site-packages/gi/overrides
  /usr/lib/python3.13/site-packages/gi/overrides/Atspi.py
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__
  /usr/lib/python3.13/site-packages/gi/overrides/__pycache__/Atspi.cpython-313.pyc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
at-spi2-core: 7 installed and not shipped files. [installed-vs-shipped]
ERROR: at-spi2-core-2.58.1-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/at-spi2-core/2.58.1/temp/log.do_package.1101573
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.1.bb:do_package) failed with exit code '1'

--===============5133071398659610293==--

