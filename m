Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05981D5C0D1
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17403.1765872146646309370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WpSoofn+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=S7w6hGQN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262ebe34-a177045f-eb3a-4790-995b-a8918eee38e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/e5toCRBc1Ow0cyYSadI+FT3EvexqoccE3oRqcz89pw=;
	b=WpSoofn+JkC5KFQxqYll1hpgzVYPAWTjJ6xUGI+1WAj3ecNF9ouEFG6VPfRrNPaV
	ELQoFibjvlNMNHlf03gzoY8vK1sQ0CYLxeTxlzA8KeEch4DRMWC+NiMCW3vlb7jsdDb
	HQFgy9SGX/RT2yqLZ6BW0Lcpy79YQHfvrolC/TwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872156;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/e5toCRBc1Ow0cyYSadI+FT3EvexqoccE3oRqcz89pw=;
	b=S7w6hGQNrjtF1IBQ+qO5fbsG7YVlehpuQ/5R4xUPde4gniQCNTg5syZDjXRPd3Uh
	tRwY065M9JgpX8Evl8TtB+u3GvsHOU1A6jfv4JSwHmODgmebY3zMP4RAKyrHmHQWm4w
	ryvxgS50MqGuCGPTwlpsiHJj5F/Ldgkfa81yg38M=
Content-Type: multipart/mixed; boundary="===============9027905070198429835=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.21.3 FAILED
Message-ID: <0101019b262ebe34-a177045f-eb3a-4790-995b-a8918eee38e9-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227855

--===============9027905070198429835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.21.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.20.2-4.21.3.patch
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
From cbf10b5b4cb6e66286082d1588553589a7d9b38e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 03:46:46 +0000
Subject: [PATCH] gtk4: upgrade 4.20.2 -> 4.21.3

---
 meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.21.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.21.3.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.21.3.bb
index d04251927f..654b4ed68e 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "5e8240edecafaff2b8baf4663bdceaa668ef10a207bee4d7f90e010e10bddc5c"
+SRC_URI[archive.sha256sum] = "fd943233af9927fe43ef7b753757c85f7933cbd960731ee08e82dafd01e2280e"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============9027905070198429835==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.20.2-4.21.3.patch"

RnJvbSBjYmYxMGI1YjRjYjZlNjYyODYwODJkMTU4ODU1MzU4OWE3ZDliMzhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDM6NDY6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMjAuMiAtPiA0LjIxLjMKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4yMC4yLmJiID0+IGd0azRfNC4yMS4zLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMjAuMi5iYiA9PiBndGs0XzQuMjEuMy5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAuMi5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjEuMy5iYgppbmRleCBkMDQyNTE5MjdmLi42
NTRiNGVkNjhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAu
Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjEuMy5iYgpAQCAtMzMs
NyArMzMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIiBcCiAgICAgZmlsZTovL3Rlc3RzL3Rlc3Rn
dGsuYztlbmRsaW5lPTI1O21kNT00OWQwNjc3MDY4MWI4MzIyNDY2YjUyZWQxOWQyOWZiMiBcCiAi
CiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjVlODI0MGVkZWNhZmFmZjJiOGJhZjQ2
NjNiZGNlYWE2NjhlZjEwYTIwN2JlZTRkN2Y5MGUwMTBlMTBiZGRjNWMiCitTUkNfVVJJW2FyY2hp
dmUuc2hhMjU2c3VtXSA9ICJmZDk0MzIzM2FmOTkyN2ZlNDNlZjdiNzUzNzU3Yzg1Zjc5MzNjYmQ5
NjA3MzFlZTA4ZTgyZGFmZDAxZTIyODBlIgogCiBTID0gIiR7VU5QQUNLRElSfS8ke0dOT01FQk59
LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============9027905070198429835==
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
DISTRO_VERSION       = "5.2.99+snapshot-3e9e1419bace79eecec24939cb9c99eee07e9bf3"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:3e9e1419bace79eecec24939cb9c99eee07e9bf3"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 378 Local 368 Mirrors 0 Missed 10 Current 1230 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1342 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 1550 of 1608 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1566 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk4-4.21.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe gtk4-4.21.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-native-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.21.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk4-4.21.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 1602 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-native-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.21.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.21.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3696 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_fetch)
NOTE: recipe gtk4-4.21.3-r0: task do_fetch: Started
NOTE: Running task 4060 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_write_config)
NOTE: recipe gtk4-4.21.3-r0: task do_fetch: Succeeded
NOTE: Running task 4115 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_unpack)
NOTE: Running task 4116 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.21.3-r0: task do_write_config: Started
NOTE: recipe gtk4-4.21.3-r0: task do_unpack: Started
NOTE: recipe gtk4-4.21.3-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.21.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.21.3-r0: task do_unpack: Succeeded
NOTE: Running task 4386 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_patch)
NOTE: Running task 4387 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.21.3-r0: task do_patch: Started
NOTE: recipe gtk4-4.21.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.21.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.21.3-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.21.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4390 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_configure)
NOTE: recipe gtk4-4.21.3-r0: task do_configure: Started
NOTE: recipe gtk4-4.21.3-r0: task do_configure: Succeeded
NOTE: Running task 4391 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_compile)
NOTE: recipe gtk4-4.21.3-r0: task do_compile: Started
NOTE: recipe gtk4-4.21.3-r0: task do_compile: Succeeded
NOTE: Running task 4392 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_install)
NOTE: recipe gtk4-4.21.3-r0: task do_install: Started
NOTE: recipe gtk4-4.21.3-r0: task do_install: Succeeded
NOTE: Running task 4393 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_package)
NOTE: Running task 4394 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.21.3-r0: task do_package: Started
NOTE: recipe gtk4-4.21.3-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.21.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.21.3-r0: task do_package: Succeeded
NOTE: Running task 4395 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_packagedata)
NOTE: recipe gtk4-4.21.3-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.21.3-r0: task do_packagedata: Succeeded
NOTE: Running task 4396 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_create_spdx)
NOTE: Running task 4397 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_package_write_ipk)
NOTE: Running task 4398 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_package_write_deb)
NOTE: recipe gtk4-4.21.3-r0: task do_create_spdx: Started
NOTE: Running task 4399 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_package_write_rpm)
NOTE: Running task 4400 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_package_qa)
NOTE: recipe gtk4-4.21.3-r0: task do_package_write_ipk: Started
NOTE: recipe gtk4-4.21.3-r0: task do_package_write_deb: Started
NOTE: recipe gtk4-4.21.3-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.21.3-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.21.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4401 of 4402 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_create_package_spdx)
NOTE: recipe gtk4-4.21.3-r0: task do_create_package_spdx: Started
NOTE: recipe gtk4-4.21.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gtk4-4.21.3-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gtk4-4.21.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk4-4.21.3-r0: task do_package_qa: Failed
NOTE: recipe gtk4-4.21.3-r0: task do_package_write_deb: Succeeded
NOTE: Tasks Summary: Attempted 4401 tasks of which 4383 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216034524.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216034524.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gtk4/4.21.3/temp/log.do_package_qa.2067334
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gtk4-4.21.3-r0 do_package_qa: QA Issue: package contains mime types but does not inherit mime: gtk4 path '/usr/share/mime/packages/gtk-mime.xml' [mime]
ERROR: gtk4-4.21.3-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gtk4/4.21.3/temp/log.do_package_qa.2067334
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.21.3.bb:do_package_qa) failed with exit code '1'

--===============9027905070198429835==--

