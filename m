Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB662C38A06
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:44 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.10615.1648819420831433197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QEqKnIAT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 0101017fe54bc2e7-8cb3b1eb-6832-4764-bd18-d37518f2b87f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819422;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9QvB98G7v0wbEJVDMixEmdE/Vl62BqzXZBUWA9stfyM=;
	b=QEqKnIATTiCto/GuoukR813UNZd5ED7eDpTYEo0j37MknvjI+2WYN+ZquWvJy86z
	XWz6iVpvQYnAATnu0PXza2lWzqwojmmZxjgz3mt1Hw84sRmqf37V2CQ8fqQgCYu0JYx
	FJGWQbY8fFu5nvQWtpvSVOzVhnoOvyqYjAOzGWpU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819422;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9QvB98G7v0wbEJVDMixEmdE/Vl62BqzXZBUWA9stfyM=;
	b=Zt9/JlghYrY2T1OdRZ80IRvH3wl0TMl8EqdzjAktwrN2oXRmBNkewkszbDWaK13V
	R8Hh8JgNmo5rpYNfK2qyKqjLT6gu4mdznVtRMWSFdgTUndMgiAtH+OtGI51qxnXjKR6
	/fwgTrr97EVgxaNKG2H+OV0H9gUlRwe3XbNC+GQ0=
Content-Type: multipart/mixed; boundary="===============6674440998990430193=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.68.0 SUCCEEDED
Message-ID: 
 <0101017fe54bc2e7-8cb3b1eb-6832-4764-bd18-d37518f2b87f-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163936

--===============6674440998990430193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vte* to *0.68.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vte-upgrade-0.66.2-0.68.0.patch
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
--===============6674440998990430193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/vte: PACKAGES: added "vte-locale-ab"
packages/core2-32-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.6600.2", added "/usr/lib/libvte-2.91.so.0.6800.0"
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.6600.2 to libvte-2.91.so.0.6800.0
  /usr/lib/libvte-2.91.so.0.6600.2 moved to /usr/lib/libvte-2.91.so.0.6800.0
packages/core2-32-poky-linux/vte/vte-locale-be: PKGSIZE changed from 1470 to 1112 (-24%)
packages/core2-32-poky-linux/vte/vte-locale-is: PKGSIZE changed from 1068 to 1253 (+17%)

--===============6674440998990430193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f2d56ca474fd205ed4e5f75fa4de1c8253f342b8"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 27 Mirrors 0 Missed 11 Current 579 (71% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 593 of 617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1949 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_fetch)
NOTE: Running task 2003 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_fetch)
NOTE: Running task 2099 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_write_config)
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_fetch: Started
NOTE: Running task 2109 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_unpack)
NOTE: Running task 2110 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/shared-mime-info/2.1-r0/temp/log.do_packagedata_setscene.358842
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 616 of 617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: recipe vte-0.68.0-r0: task do_fetch: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_write_config: Started
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_write_config: Succeeded
NOTE: Running task 2111 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_unpack)
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_unpack: Started
NOTE: Running task 2112 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_patch)
NOTE: recipe libpcre2-10.39-r0: task do_patch: Started
NOTE: recipe libpcre2-10.39-r0: task do_patch: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2113 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 2114 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_patch)
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.68.0-r0: task do_patch: Started
NOTE: recipe vte-0.68.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2115 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2116 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_lic)
NOTE: Running task 2117 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_configure)
NOTE: recipe vte-0.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_lic: Started
NOTE: recipe libpcre2-10.39-r0: task do_configure: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_lic unihash changed to 55801b516fbf8b5fb62d6d98bc584a27505945d95bdf6d2043560e77d92aee96
NOTE: recipe vte-0.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2141 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_configure: Succeeded
NOTE: Running task 2147 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_compile)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Started
NOTE: recipe libpcre2-10.39-r0: task do_compile: Succeeded
NOTE: Running task 2148 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_install)
NOTE: recipe libpcre2-10.39-r0: task do_install: Started
NOTE: recipe libpcre2-10.39-r0: task do_install: Succeeded
NOTE: Running task 2149 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_populate_sysroot)
NOTE: Running task 2150 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_package)
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Started
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2151 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2152 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_configure)
NOTE: recipe vte-0.68.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Succeeded
NOTE: Running task 2153 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2154 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_compile)
NOTE: recipe vte-0.68.0-r0: task do_compile: Started
NOTE: recipe vte-0.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2155 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_install)
NOTE: recipe vte-0.68.0-r0: task do_install: Started
NOTE: recipe vte-0.68.0-r0: task do_install: Succeeded
NOTE: Running task 2156 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package)
NOTE: Running task 2157 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_package: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_package: Succeeded
NOTE: Running task 2158 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_packagedata)
NOTE: recipe vte-0.68.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2159 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package_write_rpm)
NOTE: Running task 2160 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package_qa)
NOTE: recipe vte-0.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.68.0-r0: task do_package_qa: Started
NOTE: recipe vte-0.68.0-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2161 of 2161 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2161 tasks of which 2133 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 83 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-src went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-dbg went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-data went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-staticdev went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-dev went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-doc went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-af went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ar went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-as went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ast went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-az went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-be went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-be+latin went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-bg went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-bn-in went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ca went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ca+valencia went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-cs went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-cy went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-da went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-de went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-el went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-en-gb went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-eo went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-es went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-et went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-eu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fo went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fur went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ga went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-gl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-gu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-he went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ia went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-id went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-it went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ja went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ka went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-kk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-kn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ko went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ky went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-lt went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-lv went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ml went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-mr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ms went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nb went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-oc went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-or went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pt went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pt-br went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ro went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ru went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-rw went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sq went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sr+latin went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sv went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ta went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-te went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-th went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-tr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-uk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-vi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-wa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-cn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-hk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-tw went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6674440998990430193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vte: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte: SRC_URI changed from "https://download.gnome.org/sources//vte/0.66/vte-0.66.2.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch" to "https://download.gnome.org/sources//vte/0.68/vte-0.68.0.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch"
packages/core2-32-poky-linux/vte: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte: PACKAGES: added "vte-locale-ab"
packages/core2-32-poky-linux/vte/libvte: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/libvte: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.6600.2", added "/usr/lib/libvte-2.91.so.0.6800.0"
packages/core2-32-poky-linux/vte/libvte: PKGSIZE changed from 643115 to 647559 (+1%)
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.6600.2 to libvte-2.91.so.0.6800.0
  /usr/lib/libvte-2.91.so.0.6600.2 moved to /usr/lib/libvte-2.91.so.0.6800.0
packages/core2-32-poky-linux/vte/vte-dbg: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-dbg: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-dbg: FILELIST: removed "/usr/lib/.debug/libvte-2.91.so.0.6600.2", added "/usr/lib/.debug/libvte-2.91.so.0.6800.0"
packages/core2-32-poky-linux/vte/vte-dbg: PKGSIZE changed from 6287824 to 6346608 (+1%)
packages/core2-32-poky-linux/vte/vte-dev: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-dev: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-dev: PKGSIZE changed from 379592 to 384168 (+1%)
packages/core2-32-poky-linux/vte/vte-doc: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-doc: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-am: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-am: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-an: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-an: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ang: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ang: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ar: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ar: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-as: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-as: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ast: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ast: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-az: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-az: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-be: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-be: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-be: PKGSIZE changed from 1470 to 1112 (-24%)
packages/core2-32-poky-linux/vte/vte-locale-bg: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-bg: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-bn: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-bs: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-bs: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ca: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ckb: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-cs: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-cs: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-cy: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-cy: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-da: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-da: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-de: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-de: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-dz: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-dz: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-el: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-el: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-eo: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-eo: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-es: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-es: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-et: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-et: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-eu: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-eu: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-fa: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-fa: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-fi: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-fi: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-fr: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-fr: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-fur: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-fur: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ga: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ga: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-gd: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-gd: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-gl: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-gl: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-gu: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-gu: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-he: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-he: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-hi: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-hi: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-hr: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-hr: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-hu: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-hu: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-id: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-id: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-is: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-is: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-is: PKGSIZE changed from 1068 to 1253 (+17%)
packages/core2-32-poky-linux/vte/vte-locale-it: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-it: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ja: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ja: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ka: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ka: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-kk: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-kk: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-kn: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-kn: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ko: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ko: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ku: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ku: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ky: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ky: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-li: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-li: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-lt: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-lt: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-lv: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-lv: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-mai: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-mai: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-mi: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-mi: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-mjw: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-mk: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-mk: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ml: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ml: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-mn: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-mn: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-mr: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-mr: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ms: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ms: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-nb: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-nb: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-nds: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-nds: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ne: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ne: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-nl: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-nl: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-nn: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-nn: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-oc: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-oc: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-or: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-or: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-pa: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-pa: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-pl: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-pl: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-pt: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ro: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ro: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ru: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ru: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-rw: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-rw: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-si: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-si: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-sk: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-sk: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-sl: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-sl: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-sq: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-sq: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-sr: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-sv: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-sv: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ta: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ta: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-te: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-te: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-tg: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-tg: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-th: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-th: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-tr: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-tr: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-ug: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-ug: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-uk: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-uk: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-vi: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-vi: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-wa: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-wa: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-xh: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-xh: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-prompt: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-prompt: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-src: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-src: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte-src: FILELIST: directory renamed /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vte -> /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vte, directory renamed /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/app -> /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/app, directory renamed /usr/src/debug/vte/0.66.2-r0/build/src/vte -> /usr/src/debug/vte/0.68.0-r0/build/src/vte, directory renamed /usr/src/debug/vte/0.66.2-r0/build/src -> /usr/src/debug/vte/0.68.0-r0/build/src, directory renamed /usr/src/debug/vte/0.66.2-r0/build/src/app -> /usr/src/debug/vte/0.68.0-r0/build/src/app, removed "/usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/keymap.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/refptr.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vte.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vtetypes.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vtespawn.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/cell.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/parser-glue.hh /us
 r/src/debug/vte/0.66.2-r0/vte-0.66.2/src/drawing-cairo.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/reaper.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/widget.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vteregex.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/icu-converter.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/std-glue.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/regex.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/drawing-cairo.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vtegtk.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/spawn.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/gtk-glue.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/pty.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/ring.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/parser-reply.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/fonts-pangocairo.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/ring.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/attr.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/modes.
 hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/pango-glue.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/utf8.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/missing.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/parser-arg.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/chunk.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vterowdata.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/debug.h /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/reaper.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/glib-glue.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/clipboard-gtk.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vteaccess.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/pty.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/fwd.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vteutils.h /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/minifont.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/icu-decoder.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/spawn.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vteaccess.
 h /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/debug.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vteunistr.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/minifont.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/ringview.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/cxx-utils.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/keymap.h /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vteseq.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vteunistr.h /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vtestream-base.h /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vtestream.h /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/missing.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/parser.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vtespawn.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vtestream-file.h /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/bidi.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/buffer.h /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/gobject-glue.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/v
 teregexinternal.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/parser-charset-tables.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vteinternal.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vterowdata.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vtetypes.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/icu-converter.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/pcre2-glue.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/tabstops.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vteptyinternal.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/chunk.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/ringview.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/icu-decoder.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/regex.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/color-triple.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/fonts-pangocairo.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/icu-glue.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/urlencode.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/s
 rc/vtegtk.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/cairo-glue.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vtepty.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/parser.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/icu-glue.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/libc-glue.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/parser-string.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vte-glue.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/vteutils.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/clipboard-gtk.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/bidi.hh /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/widget.cc /usr/src/debug/vte/0.66.2-r0/vte-0.66.2/src/utf8.hh", added "/usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/buffer.h /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vteunistr.h /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/pastify.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/parser-arg.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/color-triple.hh /usr/src/debug/vte/0.6
 8.0-r0/vte-0.68.0/src/vteunistr.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vteptyinternal.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/fonts-pangocairo.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vteaccess.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vtegtk.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/spawn.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/clipboard-gtk.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/ringview.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/regex.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vte-glue.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/bidi.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/drawing-cairo.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vteaccess.h /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vtegtk.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/ringview.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/cairo-glue.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/parser.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/pty.cc /usr
 /src/debug/vte/0.68.0-r0/vte-0.68.0/src/refptr.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/icu-converter.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/libc-glue.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/pcre2-glue.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vtetypes.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/clipboard-gtk.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/icu-converter.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/utf8.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vteregexinternal.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/icu-glue.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vtestream-file.h /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vtespawn.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/spawn.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/modes.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/urlencode.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/ring.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vteregex.cc /usr/src/debug/vte/0.68.0-r0/vte-
 0.68.0/src/widget.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vtepty.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/fonts-pangocairo.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/drawing-cairo.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/minifont.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/reaper.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/missing.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/gtk-glue.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/std-glue.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/pastify.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/debug.h /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/keymap.h /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/widget.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/cxx-utils.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/gobject-glue.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/ring.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vtetypes.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/cell.hh /usr/src/debug/vte/0.68.0-r0/
 vte-0.68.0/src/vteutils.h /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vteinternal.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/attr.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/icu-decoder.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/glib-glue.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vte.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/debug.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/parser-charset-tables.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/icu-glue.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/reaper.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vtestream-base.h /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vteutils.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/regex.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/missing.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/pty.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vtespawn.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/minifont.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/parser.cc /usr/src/debug/vte/
 0.68.0-r0/vte-0.68.0/src/chunk.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/chunk.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/icu-decoder.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/parser-reply.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/tabstops.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vtestream.h /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/keymap.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/utf8.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/bidi.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vteseq.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/fwd.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/parser-glue.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vterowdata.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/vterowdata.cc /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/parser-string.hh /usr/src/debug/vte/0.68.0-r0/vte-0.68.0/src/pango-glue.hh"
packages/core2-32-poky-linux/vte/vte-src: PKGSIZE changed from 2140070 to 2154012 (+1%)
packages/core2-32-poky-linux/vte/vte-staticdev: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte-staticdev: PKGV changed from 0.66.2 [default] to 0.68.0 [default]
packages/core2-32-poky-linux/vte/vte: PV changed from "0.66.2" to "0.68.0"
packages/core2-32-poky-linux/vte/vte: PKGV changed from 0.66.2 [default] to 0.68.0 [default]

--===============6674440998990430193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f2d56ca474fd205ed4e5f75fa4de1c8253f342b8"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 27 Mirrors 0 Missed 11 Current 575 (71% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 589 of 613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1932 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_fetch)
NOTE: Running task 1985 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_fetch)
NOTE: Running task 2081 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_write_config)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/shared-mime-info/2.1-r0/temp/log.do_packagedata_setscene.429423
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 612 of 613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_fetch: Started
NOTE: recipe vte-0.68.0-r0: task do_fetch: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_write_config: Started
NOTE: recipe vte-0.68.0-r0: task do_write_config: Succeeded
NOTE: Running task 2091 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_unpack)
NOTE: Running task 2092 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_unpack)
NOTE: Running task 2093 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_unpack: Started
NOTE: recipe vte-0.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2094 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_patch)
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Succeeded
NOTE: Running task 2095 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_patch)
NOTE: recipe libpcre2-10.39-r0: task do_patch: Started
NOTE: recipe vte-0.68.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_patch: Succeeded
NOTE: Running task 2096 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2097 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 2098 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_lic)
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_lic: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_lic unihash changed to 55801b516fbf8b5fb62d6d98bc584a27505945d95bdf6d2043560e77d92aee96
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2099 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Started
NOTE: recipe libpcre2-10.39-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2123 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_configure: Succeeded
NOTE: Running task 2129 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_compile)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Started
NOTE: recipe libpcre2-10.39-r0: task do_compile: Succeeded
NOTE: Running task 2130 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_install)
NOTE: recipe libpcre2-10.39-r0: task do_install: Started
NOTE: recipe libpcre2-10.39-r0: task do_install: Succeeded
NOTE: Running task 2131 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_populate_sysroot)
NOTE: Running task 2132 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_package)
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Started
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2133 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2134 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_configure)
NOTE: recipe vte-0.68.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Succeeded
NOTE: Running task 2135 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2136 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_compile)
NOTE: recipe vte-0.68.0-r0: task do_compile: Started
NOTE: recipe vte-0.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_install)
NOTE: recipe vte-0.68.0-r0: task do_install: Started
NOTE: recipe vte-0.68.0-r0: task do_install: Succeeded
NOTE: Running task 2138 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package)
NOTE: Running task 2139 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_package: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_package: Succeeded
NOTE: Running task 2140 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_packagedata)
NOTE: recipe vte-0.68.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2141 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package_write_rpm)
NOTE: Running task 2142 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package_qa)
NOTE: recipe vte-0.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.68.0-r0: task do_package_qa: Started
NOTE: recipe vte-0.68.0-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2143 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2143 tasks of which 2115 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 83 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-src went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-dbg went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-data went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-staticdev went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-dev went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-doc went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-af went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ar went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-as went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ast went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-az went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-be went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-be+latin went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-bg went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-bn-in went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ca went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ca+valencia went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-cs went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-cy went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-da went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-de went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-el went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-en-gb went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-eo went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-es went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-et went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-eu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fo went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fur went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ga went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-gl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-gu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-he went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ia went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-id went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-it went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ja went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ka went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-kk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-kn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ko went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ky went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-lt went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-lv went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ml went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-mr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ms went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nb went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-oc went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-or went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pt went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pt-br went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ro went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ru went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-rw went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sq went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sr+latin went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sv went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ta went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-te went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-th went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-tr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-uk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-vi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-wa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-cn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-hk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-tw went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6674440998990430193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f2d56ca474fd205ed4e5f75fa4de1c8253f342b8"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 27 Mirrors 0 Missed 11 Current 575 (71% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 589 of 613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1931 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_fetch)
NOTE: Running task 1985 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_fetch)
NOTE: Running task 2081 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_write_config)
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_fetch: Started
NOTE: Running task 2091 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_unpack)
NOTE: Running task 2092 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 2093 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_unpack)
NOTE: recipe vte-0.68.0-r0: task do_write_config: Started
NOTE: recipe vte-0.68.0-r0: task do_write_config: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/shared-mime-info/2.1-r0/temp/log.do_packagedata_setscene.382413
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 612 of 613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: recipe vte-0.68.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Succeeded
NOTE: Running task 2094 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_patch)
NOTE: Running task 2095 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_patch)
NOTE: recipe libpcre2-10.39-r0: task do_patch: Started
NOTE: recipe vte-0.68.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.39-r0: task do_patch: Succeeded
NOTE: Running task 2096 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2097 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2098 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_lic)
NOTE: recipe vte-0.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_lic: Started
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2099 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_configure)
NOTE: recipe vte-0.68.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_lic unihash changed to 55801b516fbf8b5fb62d6d98bc584a27505945d95bdf6d2043560e77d92aee96
NOTE: recipe libpcre2-10.39-r0: task do_configure: Started
NOTE: recipe vte-0.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2123 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_configure: Succeeded
NOTE: Running task 2129 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_compile)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Started
NOTE: recipe libpcre2-10.39-r0: task do_compile: Succeeded
NOTE: Running task 2130 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_install)
NOTE: recipe libpcre2-10.39-r0: task do_install: Started
NOTE: recipe libpcre2-10.39-r0: task do_install: Succeeded
NOTE: Running task 2131 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_populate_sysroot)
NOTE: Running task 2132 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_package)
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Started
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2133 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2134 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_configure)
NOTE: recipe vte-0.68.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Succeeded
NOTE: Running task 2135 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2136 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_compile)
NOTE: recipe vte-0.68.0-r0: task do_compile: Started
NOTE: recipe vte-0.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_install)
NOTE: recipe vte-0.68.0-r0: task do_install: Started
NOTE: recipe vte-0.68.0-r0: task do_install: Succeeded
NOTE: Running task 2138 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package)
NOTE: Running task 2139 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_package: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_package: Succeeded
NOTE: Running task 2140 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_packagedata)
NOTE: recipe vte-0.68.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2141 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package_write_rpm)
NOTE: Running task 2142 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package_qa)
NOTE: recipe vte-0.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.68.0-r0: task do_package_qa: Started
NOTE: recipe vte-0.68.0-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2143 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2143 tasks of which 2115 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 83 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-src went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-dbg went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-data went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-staticdev went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-dev went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-doc went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-af went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ar went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-as went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ast went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-az went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-be went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-be+latin went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-bg went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-bn-in went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ca went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ca+valencia went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-cs went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-cy went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-da went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-de went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-el went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-en-gb went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-eo went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-es went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-et went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-eu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fo went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fur went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ga went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-gl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-gu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-he went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ia went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-id went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-it went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ja went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ka went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-kk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-kn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ko went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ky went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-lt went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-lv went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ml went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-mr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ms went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nb went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-oc went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-or went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pt went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pt-br went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ro went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ru went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-rw went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sq went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sr+latin went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sv went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ta went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-te went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-th went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-tr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-uk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-vi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-wa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-cn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-hk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-tw went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6674440998990430193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1641 targets, 50 skipped, 0 masked, 0 errors.
Removing 97 recipes from the core2-32 sysroot...done.
Removing 96 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f2d56ca474fd205ed4e5f75fa4de1c8253f342b8"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 400 Local 389 Mirrors 0 Missed 11 Current 192 (97% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 193 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 210 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 915 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_fetch)
NOTE: Running task 916 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_fetch)
NOTE: Running task 919 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.68.0-r0: task do_fetch: Started
NOTE: recipe vte-0.68.0-r0: task do_write_config: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Succeeded
NOTE: Running task 920 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_unpack)
NOTE: recipe vte-0.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 921 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_unpack)
NOTE: recipe vte-0.68.0-r0: task do_write_config: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Started
NOTE: recipe vte-0.68.0-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 226 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 930 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_patch)
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.68.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Succeeded
NOTE: Running task 931 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_patch)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 238 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 240 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_patch: Started
NOTE: Running setscene task 245 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.68.0-r0: task do_patch: Succeeded
NOTE: Running task 948 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 949 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_lic)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.39-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 950 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 248 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 251 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 253 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 257 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_lic: Started
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_lic unihash changed to 55801b516fbf8b5fb62d6d98bc584a27505945d95bdf6d2043560e77d92aee96
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pango/1.50.4-r0/temp/log.do_packagedata_setscene.454388
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 272 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 273 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata_setscene)
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 274 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_package_setscene)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 279 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 282 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 293 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 305 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 309 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/shared-mime-info/2.1-r0/temp/log.do_packagedata_setscene.455900
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 320 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 330 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 340 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_packagedata_setscene)
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_22.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 383 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 392 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 427 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 428 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 475 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 500 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 592 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1994 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2024 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: Running task 2041 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2049 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_configure)
NOTE: recipe libpcre2-10.39-r0: task do_configure: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_configure: Succeeded
NOTE: Running task 2054 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_compile)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Started
NOTE: recipe libpcre2-10.39-r0: task do_compile: Succeeded
NOTE: Running task 2055 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_install)
NOTE: recipe libpcre2-10.39-r0: task do_install: Started
NOTE: recipe libpcre2-10.39-r0: task do_install: Succeeded
NOTE: Running task 2056 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_populate_sysroot)
NOTE: Running task 2057 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_package)
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Started
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2058 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2059 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_configure)
NOTE: recipe vte-0.68.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Succeeded
NOTE: Running task 2060 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2061 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_compile)
NOTE: recipe vte-0.68.0-r0: task do_compile: Started
NOTE: recipe vte-0.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2062 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_install)
NOTE: recipe vte-0.68.0-r0: task do_install: Started
NOTE: recipe vte-0.68.0-r0: task do_install: Succeeded
NOTE: Running task 2063 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package)
NOTE: Running task 2064 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_package: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_package: Succeeded
NOTE: Running task 2065 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_packagedata)
NOTE: recipe vte-0.68.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2066 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package_write_rpm)
NOTE: Running task 2067 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package_qa)
NOTE: recipe vte-0.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.68.0-r0: task do_package_qa: Started
NOTE: recipe vte-0.68.0-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2068 of 2068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2068 tasks of which 2039 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 92 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.6-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.6-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.6-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.6-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.6-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.6-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.6-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.6-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-src went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-dbg went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-data went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-staticdev went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-dev went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-doc went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-af went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ar went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-as went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ast went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-az went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-be went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-be+latin went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-bg went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-bn-in went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ca went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ca+valencia went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-cs went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-cy went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-da went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-de went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-el went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-en-gb went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-eo went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-es went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-et went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-eu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fo went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fur went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ga went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-gl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-gu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-he went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ia went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-id went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-it went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ja went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ka went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-kk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-kn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ko went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ky went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-lt went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-lv went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ml went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-mr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ms went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nb went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-oc went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-or went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pt went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pt-br went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ro went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ru went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-rw went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sq went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sr+latin went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sv went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ta went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-te went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-th went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-tr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-uk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-vi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-wa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-cn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-hk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-tw went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6674440998990430193==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.66.2-0.68.0.patch"

From 74561520ff39cbf3628e6abf39f944619c21818a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 13:23:37 +0000
Subject: [PATCH] vte: upgrade 0.66.2 -> 0.68.0

---
 meta/recipes-support/vte/{vte_0.66.2.bb => vte_0.68.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.66.2.bb => vte_0.68.0.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.66.2.bb b/meta/recipes-support/vte/vte_0.68.0.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.66.2.bb
rename to meta/recipes-support/vte/vte_0.68.0.bb
index af1c47cf80..fc4324872d 100644
--- a/meta/recipes-support/vte/vte_0.66.2.bb
+++ b/meta/recipes-support/vte/vte_0.68.0.bb
@@ -21,7 +21,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch"
-SRC_URI[archive.sha256sum] = "e89974673a72a0a06edac6d17830b82bb124decf0cb3b52cebc92ec3ff04d976"
+SRC_URI[archive.sha256sum] = "13e7d4789ca216a33780030d246c9b13ddbfd04094c6316eea7ff92284dd1749"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.27.0


--===============6674440998990430193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f2d56ca474fd205ed4e5f75fa4de1c8253f342b8"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 27 Mirrors 0 Missed 11 Current 575 (71% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 589 of 613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1927 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_fetch)
NOTE: Running task 1983 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_fetch)
NOTE: Running task 2080 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_write_config)
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_fetch: Started
NOTE: Running task 2091 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_unpack)
NOTE: Running task 2092 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 2093 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_unpack)
NOTE: recipe vte-0.68.0-r0: task do_write_config: Started
NOTE: recipe vte-0.68.0-r0: task do_write_config: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/shared-mime-info/2.1-r0/temp/log.do_packagedata_setscene.405948
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 612 of 613 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: recipe vte-0.68.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Succeeded
NOTE: Running task 2094 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_patch)
NOTE: Running task 2095 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_patch)
NOTE: recipe libpcre2-10.39-r0: task do_patch: Started
NOTE: recipe vte-0.68.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.39-r0: task do_patch: Succeeded
NOTE: Running task 2096 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2097 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2098 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_lic)
NOTE: recipe vte-0.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_lic: Started
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2099 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_configure)
NOTE: recipe vte-0.68.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_lic unihash changed to 55801b516fbf8b5fb62d6d98bc584a27505945d95bdf6d2043560e77d92aee96
NOTE: recipe libpcre2-10.39-r0: task do_configure: Started
NOTE: recipe vte-0.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2123 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_configure: Succeeded
NOTE: Running task 2129 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_compile)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Started
NOTE: recipe libpcre2-10.39-r0: task do_compile: Succeeded
NOTE: Running task 2130 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_install)
NOTE: recipe libpcre2-10.39-r0: task do_install: Started
NOTE: recipe libpcre2-10.39-r0: task do_install: Succeeded
NOTE: Running task 2131 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_populate_sysroot)
NOTE: Running task 2132 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_package)
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Started
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2133 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2134 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_configure)
NOTE: recipe vte-0.68.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Succeeded
NOTE: Running task 2135 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2136 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_compile)
NOTE: recipe vte-0.68.0-r0: task do_compile: Started
NOTE: recipe vte-0.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_install)
NOTE: recipe vte-0.68.0-r0: task do_install: Started
NOTE: recipe vte-0.68.0-r0: task do_install: Succeeded
NOTE: Running task 2138 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package)
NOTE: Running task 2139 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_populate_sysroot)
NOTE: recipe vte-0.68.0-r0: task do_package: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_package: Succeeded
NOTE: Running task 2140 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_packagedata)
NOTE: recipe vte-0.68.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2141 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package_write_rpm)
NOTE: Running task 2142 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_package_qa)
NOTE: recipe vte-0.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.68.0-r0: task do_package_qa: Started
NOTE: recipe vte-0.68.0-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2143 of 2143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.68.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2143 tasks of which 2115 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 83 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-src went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-dbg went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-data went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-staticdev went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-dev went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-doc went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-af went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ar went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-as went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ast went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-az went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-be went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-be+latin went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-bg went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-bn-in went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ca went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ca+valencia went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-cs went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-cy went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-da went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-de went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-el went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-en-gb went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-eo went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-es went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-et went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-eu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fo went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-fur went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ga went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-gl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-gu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-he went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-hu went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ia went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-id went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-it went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ja went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ka went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-kk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-kn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ko went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ky went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-lt went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-lv went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ml went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-mr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ms went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nb went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-nn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-oc went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-or went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pt went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-pt-br went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ro went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ru went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-rw went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sl went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sq went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sr+latin went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-sv went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-ta went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-te went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-th went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-tr went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-uk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-vi went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-wa went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-cn went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-hk went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: QA Issue: Package version for package shared-mime-info-locale-zh-tw went backwards which would break package feeds (from 0:2.2-r0 to 0:2.1-r0) [version-going-backwards]
ERROR: shared-mime-info-2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6674440998990430193==--

