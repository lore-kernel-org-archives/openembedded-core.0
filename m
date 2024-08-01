Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550E0C52D7F
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:10 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.75493.1722536827344416306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DXNxlbcR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=iwyZ58JT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101910f321729-edf5390e-da34-4679-b116-563e1dd577b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536826;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bFRf9Zmvpr/s65kq3SAmohXGoiIWyHydd+6nssxUi/k=;
	b=DXNxlbcRuxHZnVbywQ78nrYKl0/s+6nAUQx9bBznW+CJVRyvYrS4eygNpQjczbpw
	yV3SMn9W2GStb6HMGchHImC9KBuXfvHqRTtxr/77T4fOPoyFT1Zk+DO1Hvjs+yAU/jg
	FpjJhGd8yOuKhzHiv1PffYU+oEWbQ++DAE3uGFk8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536826;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bFRf9Zmvpr/s65kq3SAmohXGoiIWyHydd+6nssxUi/k=;
	b=iwyZ58JTW98hU5vXakNqGHJqg1ENFWGOK2oGG/ktGJjPke1Lt1P0eXS5ycau6W+z
	v4B+I83cplnMr5Jg/5xPKZQsXynBpMhltbFgyAaJMAH7IZ05F6sYYYwHVgw5qpT24Dd
	qQ8zi8/g2MtkJdJwu3phlbyPq84LsgVfAV72IYYs=
Content-Type: multipart/mixed; boundary="===============1779434319206712636=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.23.0 SUCCEEDED
Message-ID: <010101910f321729-edf5390e-da34-4679-b116-563e1dd577b4-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202805

--===============1779434319206712636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonschema* to *4.23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.22.0-4.23.0.patch
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
From 94064251fa5930651a410fa9371651d85a90f562 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 10:41:50 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.22.0 -> 4.23.0

---
 ...ython3-jsonschema_4.22.0.bb => python3-jsonschema_4.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.22.0.bb => python3-jsonschema_4.23.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
index 0332b3e9b5..126258255d 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "5b22d434a45935119af990552c862e5d6d564e8f6601206b305a61fdf661a2b7"
+SRC_URI[sha256sum] = "d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4"
 
 inherit pypi python_hatchling
 
-- 
2.44.0


--===============1779434319206712636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.12/site-packages/jsonschema-4.22.0.dist-info moved to /usr/lib/python3.12/site-packages/jsonschema-4.23.0.dist-info

--===============1779434319206712636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1884 targets, 48 skipped, 0 masked, 0 errors.
Removing 34 recipes from the core2-64 sysroot...done.
Removing 71 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-25d0af8be0bb1dd19315f5501b1611e7198b6bf7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:25d0af8be0bb1dd19315f5501b1611e7198b6bf7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 588 Local 576 Mirrors 0 Missed 12 Current 275 (97% match, 98% complete)
Removing 9 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 278 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 279 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 280 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 282 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 283 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 285 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 286 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 288 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 289 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 292 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 293 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 294 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 302 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_populate_lic_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 304 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 306 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 307 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 308 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 309 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.35.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 311 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-idna-3.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 313 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.35.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 317 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.35.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-idna-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.35.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 319 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 320 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 321 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 322 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.105.1.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-referencing-0.35.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.105.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 323 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-referencing-0.35.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 325 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 326 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 327 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 328 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 329 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 330 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.35.1.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 331 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 336 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonpointer-3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 343 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 345 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 349 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-hypothesis/6.105.1/temp/log.do_packagedata_setscene.3765125
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.105.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 350 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.105.1.bb:do_package_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-referencing-0.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rpds-py-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 351 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.19.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-referencing-0.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.19.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 373 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.19.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 374 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 375 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 376 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 377 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 380 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_packagedata_setscene)
NOTE: recipe python3-zipp-3.19.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.19.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 468 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 469 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.19.2.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running task 508 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_fetch)
NOTE: recipe python3-zipp-3.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 547 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_unpack)
NOTE: recipe python3-zipp-3.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-hypothesis-6.105.1-r0: task do_package_setscene: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_unpack: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 582 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 584 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 592 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.105.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 603 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.105.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 619 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.105.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.105.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running task 1293 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1328 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_patch)
NOTE: Running task 1340 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_patch: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 683 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 703 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 707 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 716 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 717 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 734 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 736 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 755 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 759 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 765 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1518 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1557 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1583 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1605 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 814 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 821 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 824 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 826 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 829 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 852 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1649 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 858 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 863 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2108 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2329 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.105.1.bb:do_packagedata)
NOTE: Running task 2337 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.105.1-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.105.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2401 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_configure)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_install)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package)
NOTE: Running task 2405 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_populate_sysroot)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_packagedata unihash changed to 0d91aba949e938713c85f47c36587ab1cc94c5b32fbb14af2bd7248f1506d727
NOTE: Setscene tasks completed
NOTE: Running task 2407 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_create_spdx)
NOTE: Running task 2408 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_write_ipk)
NOTE: Running task 2409 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_write_deb)
NOTE: Running task 2410 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_write_rpm)
NOTE: Running task 2411 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2412 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_create_package_spdx)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_create_package_spdx: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_write_ipk unihash changed to 2e8e6c7cc4c6f3a5f1bb2414e68bf9d45ceb5b15f5408c3424075a500989c7d6
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_qa unihash changed to 13abc5cd7eb27db54d6f2a9f1358dc4d10928eeec78020a86636b74ed3d847ba
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_write_deb unihash changed to 541f8c212c902facd07af8fedc3cd02238d622bd1b96abb976b215499fd57a81
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_write_rpm unihash changed to 698f0911c46f8115aceef4367c0f2109408035f6b92ef34ddabbf2788541b2e0
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2413 of 2413 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2413 tasks of which 2385 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.105.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.108.5-r0 to 0:6.105.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.105.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.108.5-r0 to 0:6.105.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.105.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.108.5-r0 to 0:6.105.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.105.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.108.5-r0 to 0:6.105.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.105.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.108.5-r0 to 0:6.105.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.105.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.108.5-r0 to 0:6.105.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.105.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.108.5-r0 to 0:6.105.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.105.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.108.5-r0 to 0:6.105.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.105.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1779434319206712636==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.22.0-4.23.0.patch"

RnJvbSA5NDA2NDI1MWZhNTkzMDY1MWE0MTBmYTkzNzE2NTFkODVhOTBmNTYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMDo0MTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnNjaGVtYTogdXBncmFkZSA0LjIyLjAgLT4gNC4yMy4wCgotLS0KIC4uLnl0aG9u
My1qc29uc2NoZW1hXzQuMjIuMC5iYiA9PiBweXRob24zLWpzb25zY2hlbWFfNC4yMy4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtanNvbnNjaGVtYV80LjIy
LjAuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuMjMuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjIyLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjIz
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yMi4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjIzLjAuYmIKaW5kZXgg
MDMzMmIzZTliNS4uMTI2MjU4MjU1ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMjMuMC5iYgpAQCAtNCw3ICs0LDcg
QEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT03YTYwYTgxYzE0NmVjMjU1OTlhM2UxZGFiYjg2MTBhOCBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9qc29uL0xJQ0VOU0U7bWQ1PTlkNGRlNDMxMTFkMzM1NzBjOGZlNDliNGNiMGUwMWFm
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWIyMmQ0MzRhNDU5MzUxMTlhZjk5MDU1MmM4NjJl
NWQ2ZDU2NGU4ZjY2MDEyMDZiMzA1YTYxZmRmNjYxYTJiNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJkNzE0OTdmZWYyNjM1MWEzMzI2NTMzN2ZhNzdmZmViODI0MjNmM2VhMjEyODNjZDk0NjdiYjAz
OTk5MjY2YmM0IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ0LjAK
Cg==

--===============1779434319206712636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.22.0.tar.gz;downloadfilename=jsonschema-4.22.0.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.23.0.tar.gz;downloadfilename=jsonschema-4.23.0.tar.gz"
packages/core2-64-poky-linux/python3-jsonschema: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGSIZE changed from 459063 to 460236 (+0%)
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 474915 to 475796 (+0%)
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.22.0" to "4.23.0"
Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.12/site-packages/jsonschema-4.22.0.dist-info moved to /usr/lib/python3.12/site-packages/jsonschema-4.23.0.dist-info

--===============1779434319206712636==--

