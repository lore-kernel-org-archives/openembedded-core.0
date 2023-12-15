Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC36C46CC6
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:49 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.63153.1702649869010377886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LWlFKCzZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PHwlxNL1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018c6dd73060-05addf4e-4d29-4bed-ab75-9fbd3370bfcd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uFzHRaOHzOFzuzfF7BBVU7EoYNinEImitIBOm7Ab0Rw=;
	b=LWlFKCzZI136YmnXqmstnvc9KzwtIJLXV7n7N6m6qW4TnGqU9W3Ki6scgARLBF11
	fVYy6K88WHLXTEdzlO4nnoDSJd0bxYIRq0rglhTpmirCeY75sqXiN84Fs6mIglj5pLZ
	cp8LAd+0Vzo2ZE6hkp9xcxbMUDt5INbl3oVry4fI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uFzHRaOHzOFzuzfF7BBVU7EoYNinEImitIBOm7Ab0Rw=;
	b=PHwlxNL1UoWN6j3I3lHljzBgrNtjBRn26rM1lY/NWwNDXQxFXzYojcKrbQmpji/l
	M96R5qJiXhnEGM/gPt54h448jCOoxgBtksjGPt1PctfRAxs7BdtlBA7P2gc3AV305in
	1e1ZIvhK4WExqe9r5qx58Ra2W+yC4MoyfOXhbscM=
Content-Type: multipart/mixed; boundary="===============2963352929785166966=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.6.4 FAILED
Message-ID: <0101018c6dd73060-05addf4e-4d29-4bed-ab75-9fbd3370bfcd-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192523

--===============2963352929785166966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.6.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.6.2-2.6.4.patch
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
From 6760617256f0ba4e513295d38eb0bea9d0642f5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 13:38:12 +0000
Subject: [PATCH] enchant2: upgrade 2.6.2 -> 2.6.4

---
 .../enchant/{enchant2_2.6.2.bb => enchant2_2.6.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.2.bb => enchant2_2.6.4.bb} (92%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.2.bb b/meta/recipes-support/enchant/enchant2_2.6.4.bb
similarity index 92%
rename from meta/recipes-support/enchant/enchant2_2.6.2.bb
rename to meta/recipes-support/enchant/enchant2_2.6.4.bb
index 38d3245d20..76be283f0c 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.2.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.4.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "6686a728e56e760f8dee09a22f0fb53b46ee9dbe7d64cf9e5bb35a658bff7e1d"
+SRC_URI[sha256sum] = "833b4d5600dbe9ac867e543aac6a7a40ad145351495ca41223d4499d3ddbbd2c"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.42.0


--===============2963352929785166966==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.6.2-2.6.4.patch"

RnJvbSA2NzYwNjE3MjU2ZjBiYTRlNTEzMjk1ZDM4ZWIwYmVhOWQwNjQyZjVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMTM6Mzg6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bmNoYW50MjogdXBncmFkZSAyLjYuMiAtPiAyLjYuNAoKLS0tCiAuLi4vZW5jaGFudC97ZW5jaGFu
dDJfMi42LjIuYmIgPT4gZW5jaGFudDJfMi42LjQuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9lbmNoYW50L3tlbmNoYW50Ml8yLjYuMi5iYiA9PiBlbmNoYW50Ml8yLjYu
NC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2Vu
Y2hhbnQyXzIuNi4yLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8y
LjYuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuNi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuNi40LmJiCmluZGV4IDM4ZDMyNDVkMjAuLjc2YmUyODNm
MGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFudDJfMi42
LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjYuNC5i
YgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdyb2ZmLW5hdGl2ZSIKIGlu
aGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L2VuY2hhbnQtJHtQVn0udGFyLmd6Igot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjY2ODZhNzI4ZTU2ZTc2MGY4ZGVlMDlhMjJmMGZiNTNiNDZl
ZTlkYmU3ZDY0Y2Y5ZTViYjM1YTY1OGJmZjdlMWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODMz
YjRkNTYwMGRiZTlhYzg2N2U1NDNhYWM2YTdhNDBhZDE0NTM1MTQ5NWNhNDEyMjNkNDQ5OWQzZGRi
YmQyYyIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9BYmlXb3JkL2Vu
Y2hhbnQvcmVsZWFzZXMiCiAKLS0gCjIuNDIuMAoK

--===============2963352929785166966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-af7b11ad31f0b6c3c3193c8e6638e0bb5e835633"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:af7b11ad31f0b6c3c3193c8e6638e0bb5e835633"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 158 Local 146 Mirrors 0 Missed 12 Current 315 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 329 of 473 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 473 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.bb:do_create_spdx_setscene)
NOTE: recipe aspell-0.60.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 934 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_recipe_qa)
NOTE: recipe aspell-0.60.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 473 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 449 of 473 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe enchant2-2.6.4-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 451 of 473 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.6.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1067 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 473 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe enchant2-2.6.4-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 1068 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 473 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe enchant2-2.6.4-r0: task do_unpack: Started
NOTE: recipe enchant2-2.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 1076 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.6.4-r0: task do_patch: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe enchant2-2.6.4-r0: task do_patch: Succeeded
NOTE: Running task 1299 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1302 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1342 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_collect_spdx_deps)
NOTE: Running task 1346 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_populate_lic)
NOTE: recipe enchant2-2.6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.6.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.6.4-r0: task do_populate_lic: Started
NOTE: recipe enchant2-2.6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.6.4-r0: task do_populate_lic: Succeeded
NOTE: recipe enchant2-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1347 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_configure)
NOTE: recipe enchant2-2.6.4-r0: task do_configure: Started
NOTE: recipe enchant2-2.6.4-r0: task do_configure: Succeeded
NOTE: Running task 1348 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_compile)
NOTE: recipe enchant2-2.6.4-r0: task do_compile: Started
NOTE: recipe enchant2-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 1349 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_install)
NOTE: recipe enchant2-2.6.4-r0: task do_install: Started
NOTE: recipe enchant2-2.6.4-r0: task do_install: Succeeded
NOTE: Running task 1350 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_package)
NOTE: Running task 1351 of 1359 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.6.4-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.6.4-r0: task do_package: Started
NOTE: recipe enchant2-2.6.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.6.4-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1351 tasks of which 1338 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215133724.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215133724.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: enchant2-2.6.4-r0 do_package: QA Issue: enchant2: Files/directories were installed but not shipped in any package:
  /usr/share/enchant-2-2
  /usr/share/enchant-2-2/enchant.ordering
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
enchant2: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: enchant2-2.6.4-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/enchant2/2.6.4/temp/log.do_package.943293
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.4.bb:do_package) failed with exit code '1'

--===============2963352929785166966==--

