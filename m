Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68AAF013EA
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:11 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28978.1773582123221010482
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VIdbJoF5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=k/CHwf+d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019cf1bb7ea5-fbd0cf8b-f973-422b-9746-92d4d062cb6e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HRj+xeKTmkk1DHy/2FgO5vsiv8DGu0OHuqaD4CYDelE=;
	b=VIdbJoF5wwwn4wJxyqQkt4jCP40nWMnJkz65D8m34HtNLL+MtnijxNzzn2mIqYX4
	NeEObpq8G1aQ8lmT1cceua6DwQvrE8jjz2rjxnj2wH8bUMttqKpVkntagv3E7ccqbQM
	PZ3Roe+Qdn+71OUR/881SE7NusLfRdWzHKNe4Nuk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HRj+xeKTmkk1DHy/2FgO5vsiv8DGu0OHuqaD4CYDelE=;
	b=k/CHwf+dhdu1eAFtCJceJXNc3ZUg/Tg9cvH7JNij7U07IrYXsUSVx/nPzaQGn1ii
	BVApaNiHLtzS3I5wsaa/H6Siy6sPU9SVAA3sIDn/7x2u1GRSbSk/9z/YPBEnM0w85+/
	ED6sPgwiJ9MCXgdNHMBfMkyTH7RftDUy2VG/P/70=
Content-Type: multipart/mixed; boundary="===============5700055947683463448=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.22.1 FAILED
Message-ID: <0101019cf1bb7ea5-fbd0cf8b-f973-422b-9746-92d4d062cb6e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233169

--===============5700055947683463448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.22.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.20.3-4.22.1.patch
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
From 1849a03b865600f33dbc7bc4a8ad5dea3d9fffb8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 10:20:33 +0000
Subject: [PATCH] gtk4: upgrade 4.20.3 -> 4.22.1

---
 meta/recipes-gnome/gtk+/{gtk4_4.20.3.bb => gtk4_4.22.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.20.3.bb => gtk4_4.22.1.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
index ef9a05f7fe..391c6f2508 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "2873f2903088a66c71173ea2ed85ffae266a66b972c3a4842bbb2f6f187ec153"
+SRC_URI[archive.sha256sum] = "cd7b5a9c41127da6fb321c5a842ad73c62e6996f9ce3f1960ca509f6559d55fc"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============5700055947683463448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.3.99+snapshot-e8acc21bae6da88f29055a6042af4b0c6737211a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:e8acc21bae6da88f29055a6042af4b0c6737211a"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 440 Local 427 Mirrors 0 Missed 13 Current 1127 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3607 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_recipe_qa)
NOTE: recipe gtk4-4.22.1-r0: task do_recipe_qa: Started
NOTE: Running task 3963 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_write_config)
NOTE: recipe gtk4-4.22.1-r0: task do_write_config: Started
NOTE: recipe gtk4-4.22.1-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4289 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_fetch)
NOTE: recipe gtk4-4.22.1-r0: task do_fetch: Started
NOTE: recipe gtk4-4.22.1-r0: task do_fetch: Succeeded
NOTE: Running task 4290 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_unpack)
NOTE: Running task 4291 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.22.1-r0: task do_unpack: Started
NOTE: recipe gtk4-4.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 4292 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_patch)
NOTE: Running task 4293 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.22.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.22.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4294 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4295 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_populate_lic)
NOTE: recipe gtk4-4.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.22.1-r0: task do_populate_lic: Started
NOTE: recipe gtk4-4.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 4296 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_configure)
NOTE: recipe gtk4-4.22.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.22.1-r0: task do_configure: Succeeded
NOTE: Running task 4297 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_compile)
NOTE: recipe gtk4-4.22.1-r0: task do_compile: Started
NOTE: recipe gtk4-4.22.1-r0: task do_compile: Succeeded
NOTE: Running task 4298 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_install)
NOTE: recipe gtk4-4.22.1-r0: task do_install: Started
NOTE: recipe gtk4-4.22.1-r0: task do_install: Succeeded
NOTE: Running task 4299 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_package)
NOTE: Running task 4300 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.22.1-r0: task do_package: Started
NOTE: recipe gtk4-4.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_package: Succeeded
NOTE: Running task 4301 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_packagedata)
NOTE: recipe gtk4-4.22.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.22.1-r0: task do_packagedata: Succeeded
NOTE: Running task 4302 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_create_spdx)
NOTE: Running task 4303 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_package_write_ipk)
NOTE: Running task 4304 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_package_write_deb)
NOTE: recipe gtk4-4.22.1-r0: task do_create_spdx: Started
NOTE: Running task 4305 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_package_write_rpm)
NOTE: Running task 4306 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_package_qa)
NOTE: recipe gtk4-4.22.1-r0: task do_package_write_ipk: Started
NOTE: recipe gtk4-4.22.1-r0: task do_package_write_deb: Started
NOTE: recipe gtk4-4.22.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.22.1-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.22.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4307 of 4308 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_create_package_spdx)
NOTE: recipe gtk4-4.22.1-r0: task do_create_package_spdx: Started
NOTE: recipe gtk4-4.22.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_package_qa: Failed
NOTE: recipe gtk4-4.22.1-r0: task do_package_write_deb: Succeeded
NOTE: Tasks Summary: Attempted 4307 tasks of which 4286 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315101847.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315101847.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gtk4/4.22.1/temp/log.do_package_qa.1852714
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gtk4-4.22.1-r0 do_package_qa: QA Issue: package contains mime types but does not inherit mime: gtk4 path '/usr/share/mime/packages/gtk-mime.xml' [mime]
ERROR: gtk4-4.22.1-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gtk4/4.22.1/temp/log.do_package_qa.1852714
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_package_qa) failed with exit code '1'

--===============5700055947683463448==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.20.3-4.22.1.patch"

RnJvbSAxODQ5YTAzYjg2NTYwMGYzM2RiYzdiYzRhOGFkNWRlYTNkOWZmZmI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTA6MjA6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMjAuMyAtPiA0LjIyLjEKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4yMC4zLmJiID0+IGd0azRfNC4yMi4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMjAuMy5iYiA9PiBndGs0XzQuMjIuMS5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAuMy5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4zLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIuMS5iYgppbmRleCBlZjlhMDVmN2ZlLi4z
OTFjNmYyNTA4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAu
My5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIuMS5iYgpAQCAtMzMs
NyArMzMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIiBcCiAgICAgZmlsZTovL3Rlc3RzL3Rlc3Rn
dGsuYztlbmRsaW5lPTI1O21kNT00OWQwNjc3MDY4MWI4MzIyNDY2YjUyZWQxOWQyOWZiMiBcCiAi
CiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjI4NzNmMjkwMzA4OGE2NmM3MTE3M2Vh
MmVkODVmZmFlMjY2YTY2Yjk3MmMzYTQ4NDJiYmIyZjZmMTg3ZWMxNTMiCitTUkNfVVJJW2FyY2hp
dmUuc2hhMjU2c3VtXSA9ICJjZDdiNWE5YzQxMTI3ZGE2ZmIzMjFjNWE4NDJhZDczYzYyZTY5OTZm
OWNlM2YxOTYwY2E1MDlmNjU1OWQ1NWZjIgogCiBTID0gIiR7VU5QQUNLRElSfS8ke0dOT01FQk59
LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============5700055947683463448==--

