Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B56EC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.660.1654100325009960271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=S5Drabad;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010181200fefd1-2e51e5b6-9c83-4a30-95f1-f3203b630362-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JRsu4HQtSWNiweVuhF9p0Hb8qTL7HGxTqA6kUUe2EW4=;
	b=S5DrabaddSLO6pGXd31l9Mlcx+gvpWc/SReLj2dYgh+0EXr5mTiZfdLvJuNsTYib
	TtFiZ49Qz9DGK8JyB9qHJdO9JU/ucXBLS3t5BtUhmZ91QGJa5y7a4K8Pi3eJQVyPuRr
	gNGYFALKmYT1dfelSiNwifb2thkBrxi5Uz54Jyas=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JRsu4HQtSWNiweVuhF9p0Hb8qTL7HGxTqA6kUUe2EW4=;
	b=NuDYm0kuMN/PCnLfsArQZqGen3aCnBT8BVjOkshMbwM3BiJsfadD/Cmn1uTYBd0Y
	ITIlfyJp8KFXIjfbWrXQ1Sz85I9ufxfMfUFqzaOQGt3p9MVrdwpco36phzb+fByfVGO
	iDMDL5nxj/Gt38VXnc35861jdarLoocPxdEPP9y4=
Content-Type: multipart/mixed; boundary="===============1068391883389056587=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.7 FAILED
Message-ID: 
 <01010181200fefd1-2e51e5b6-9c83-4a30-95f1-f3203b630362-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:44 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166429

--===============1068391883389056587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-utils* to *1.2.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.6-1.2.7.patch
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
--===============1068391883389056587==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.6-1.2.7.patch"

From 44faef1ac49e061e7381bb5681dbe2fd158866b1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 14:31:10 +0000
Subject: [PATCH] alsa-utils: upgrade 1.2.6 -> 1.2.7

---
 meta/recipes-multimedia/alsa/alsa-utils.inc                     | 2 +-
 .../alsa/{alsa-utils_1.2.6.bb => alsa-utils_1.2.7.bb}           | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.6.bb => alsa-utils_1.2.7.bb} (100%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index bca7cdd3bd..da3bcd6ded 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -25,7 +25,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "6a1efd8a1f1d9d38e489633eaec1fffa5c315663b316cab804be486887e6145d"
+SRC_URI[sha256sum] = "e906bf2404ff04c448eaa3d226d283a62b9a283f12e4fd8457fb24bac274e678"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.6.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.6.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb
-- 
2.31.1


--===============1068391883389056587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (881 cached, 2 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-b3f6b1acb302d2ad3b22bbb70b9ceeb5c49a1a9a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b3f6b1acb302d2ad3b22bbb70b9ceeb5c49a1a9a"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 115 Local 107 Mirrors 0 Missed 8 Current 302 (93% match, 98% complete)
Removing 1 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1293 of 1507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_fetch)
NOTE: recipe alsa-utils-1.2.7-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1493 of 1507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_unpack)
NOTE: Running task 1494 of 1507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.7-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1495 of 1507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_patch)
NOTE: recipe alsa-utils-1.2.7-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 1507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1497 of 1507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_populate_lic)
NOTE: recipe alsa-utils-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.7-r0: task do_populate_lic: Started
NOTE: recipe alsa-utils-1.2.7-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-utils-1.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1498 of 1507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_configure)
NOTE: recipe alsa-utils-1.2.7-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1499 of 1507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_compile)
NOTE: recipe alsa-utils-1.2.7-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1500 of 1507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_install)
NOTE: recipe alsa-utils-1.2.7-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1501 of 1507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_package)
NOTE: Running task 1502 of 1507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-1.2.7-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.7-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1502 tasks of which 1491 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_package
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: alsa-utils-1.2.7-r0 do_package: QA Issue: alsa-utils: Files/directories were installed but not shipped in any package:
  /usr/lib/alsa-topology/libalsatplg_module_nhlt.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
alsa-utils: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: alsa-utils-1.2.7-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.7-r0/temp/log.do_package.3647586
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb:do_package) failed with exit code '1'

--===============1068391883389056587==--

