Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA735CA9EC8
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:04 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.107417.1682976349017187114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kqWG1hy4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010187d935291c-36cdf09d-aa95-4a91-9de5-b67e6100de4f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2xrIOn7ktdZZYUG4HicjccRaD0WeB/dNcv47m83REFU=;
	b=kqWG1hy4JXwMtxTWvwiWm5VJSImkSnq7aVi+pxmeHqiqgmyWMKLx/obmUAEs5qJl
	7XjNF5KSOKJNDnA95ekrUAATN+qZGywVaYQlQ3IrWsvfLQoCFg6LzwM2YLAkplgqbpR
	83pKMS3K/Qc63YyS3MULJKUPQMvES4SoxInj7a8E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2xrIOn7ktdZZYUG4HicjccRaD0WeB/dNcv47m83REFU=;
	b=bFcfjMfuxyh6cfY/hOlhc3BxKn2HNHgI5cszW2D+hMaOdwF5NxvEcgO4ADdsCi8f
	/N70CWiwu8TaleYb8OMv5GMpO2KF8dYulZfH+/DufGF8HDHdaxjW8A+ZRtLgz66cRIb
	BNpFBCA3rLG/uPGH95Cx5/VvFXacEpszEPO0aHFY=
Content-Type: multipart/mixed; boundary="===============2147508842823491718=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to c39bc6062a373c371d9c8076a66acbb26c661471
 SUCCEEDED
Message-ID: <01010187d935291c-36cdf09d-aa95-4a91-9de5-b67e6100de4f-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180666

--===============2147508842823491718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *c39bc6062a373c371d9c8076a66acbb26c661471* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
--===============2147508842823491718==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBkMmEzMWU0ZmE5YzZmNjY0OGExODE4YTBkMzUzYTYxZGNhOGJiNjgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxODoyNjoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXRfZ2l0LmJiCmluZGV4IDc4YjQ3OTg1YmMuLjFkYWViMzViNTggMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9
ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9bWEKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCi1TUkNSRVYgPSAiMGY0YTg3NWIwNWZlYjQ0NDI2YTJkNDMxNDZmNWUzYzZlYTVmODAzOCIK
K1NSQ1JFViA9ICJjMzliYzYwNjJhMzczYzM3MWQ5YzgwNzZhNjZhY2JiMjZjNjYxNDcxIgogIyAo
d2hlbiBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhlIHRyYWlsaW5nIHIpCiBQViA9ICIxLjAr
Z2l0ciR7U1JDUFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============2147508842823491718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e8dda21ec19514ed1a1d93173f3e2c2dea48c40f"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 23 Mirrors 0 Missed 27 Current 498 (46% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 533 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/mesa/2_23.0.2-r0/temp/log.do_packagedata_setscene.1825622
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 547 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_package_setscene)
NOTE: Running task 1475 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1533 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1618 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1672 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1675 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1676 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1776 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1858 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1873 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: Running task 1874 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: Running task 1880 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1881 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1882 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 1883 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1884 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1885 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1886 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_package_setscene: Started
NOTE: Running task 1890 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: Running task 1891 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1892 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1893 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1894 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1895 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 1896 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: Running task 1908 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1909 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1910 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_unpack: Succeeded
NOTE: Running task 1911 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1912 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_patch: Succeeded
NOTE: Running task 1913 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1914 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1915 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_generate_toolchain_file: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1916 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1917 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to b4b3ffba959272b41ccf603098af5d87c580e5aa4593a60f68aee92c87aa5233
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1918 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1919 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1920 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1921 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: Running task 1922 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1923 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1924 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1925 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1926 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1927 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1928 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1929 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1930 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1931 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1932 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1933 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1934 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1935 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1936 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1937 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1938 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1939 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1940 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1941 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1942 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_configure: Succeeded
NOTE: Running task 1943 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_compile: Succeeded
NOTE: Running task 1944 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_install: Succeeded
NOTE: Running task 1945 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1946 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package: Succeeded
NOTE: Running task 1947 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_packagedata: Succeeded
NOTE: Running task 1948 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1949 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1950 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1950 tasks of which 1883 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 34 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2147508842823491718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e8dda21ec19514ed1a1d93173f3e2c2dea48c40f"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 23 Mirrors 0 Missed 28 Current 493 (45% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 529 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 533 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/mesa/2_23.0.2-r0/temp/log.do_packagedata_setscene.1906509
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 543 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_package_setscene)
NOTE: Running task 1465 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1523 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1607 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1660 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1662 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1663 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 1761 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1854 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1855 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1856 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1857 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1858 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1859 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 1860 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1866 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: Running task 1871 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1874 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1875 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1876 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1877 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1878 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1879 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1880 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1881 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1893 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata)
NOTE: Running task 1894 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1895 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_unpack: Succeeded
NOTE: Running task 1896 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1897 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_patch: Succeeded
NOTE: Running task 1898 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1899 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1900 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1901 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_lic: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to b4b3ffba959272b41ccf603098af5d87c580e5aa4593a60f68aee92c87aa5233
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1902 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1903 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1904 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 1905 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1906 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1907 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1909 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1910 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1911 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1912 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1913 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1914 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1915 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1916 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1917 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1918 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1919 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1920 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1921 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1922 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1923 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1924 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1925 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1926 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1927 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1928 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_configure: Succeeded
NOTE: Running task 1929 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_compile: Succeeded
NOTE: Running task 1930 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_install: Succeeded
NOTE: Running task 1931 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1932 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package: Succeeded
NOTE: Running task 1933 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_packagedata: Succeeded
NOTE: Running task 1934 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1935 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1936 of 1936 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1936 tasks of which 1868 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 34 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2147508842823491718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+c39bc6062a"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+0f4a875b05 [default] to 1.0+gitrAUTOINC+c39bc6062a [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+c39bc6062a"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+c39bc6062a"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+c39bc6062a"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+c39bc6062a"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-doc: PKGSIZE changed from 22588 to 22594 (+0%)
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+c39bc6062a"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+c39bc6062a"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+c39bc6062a"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-i64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uvec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uvec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uvec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint.vert /usr/lib/
 piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-ivec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshi
 ft-u64vec3-ivec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-ivec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint64_t.frag /usr/lib/p
 iglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/gen
 erated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-int64_t-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-u64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-u64vec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-u64vec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64v
 ec3-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-i64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec4-uvec4.shader_tes
 t /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-int.shader_te
 st /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-uint64_t
 .shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64ve
 c2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i
 64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-int64_t-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uint64_t.
 vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-i64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-uvec4.shader_test /
 usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec2-u64vec2.shader_te
 st /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-uint.shader
 _test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generate
 d_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-int.shader_test /usr/lib/piglit
 /generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/gene
 rated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-ivec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-ivec3.frag /usr/lib/piglit/generat
 ed_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-ivec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uvec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uvec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uvec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/executi
 on/built-in-functions/fs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/a
 rb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-ivec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-ivec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-ivec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-fu
 nctions/op-lshift-u64vec2-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op
 -rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functio
 ns/tcs-op-rshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_
 gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-ivec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-ivec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-ivec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-i64vec2
 .frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_t
 ests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-i64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/gen
 erated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-u64vec2.frag /usr/lib/piglit/generated_tests
 /spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-u64vec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-int64_t-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-u64vec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-funct
 ions/fs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_
 int64/compiler/built-in-functions/op-lshift-i64vec2-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int
 64/execution/built-in-functions/cs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_te
 sts/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-ivec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-ivec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-ivec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-ivec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_i
 nt64/compiler/built-in-functions/op-rshift-i64vec3-ivec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-ivec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-int64_t-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i
 64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-
 op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-i64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uvec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uvec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uvec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-int.shader_t
 est /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-l
 shift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/e
 xecution/built-in-functions/tcs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uvec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uvec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compil
 er/built-in-functions/op-rshift-i64vec4-uvec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-u64vec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-u64vec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-u64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tc
 s-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64ve
 c4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rsh
 ift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-u64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-u64vec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-u64vec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-ivec2.shader_tes
 t /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-int.vert /usr/lib/pi
 glit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-uvec3.shader_test 
 /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-i64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-ivec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-ivec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-ivec4.vert /usr/lib/piglit/tests/spec/arb_vertex_attrib_64bit/execution/unused-sub-dvec4-01.shader_test /usr/lib/piglit/tests/spec/arb_vertex_attrib_64bit/execution/unused-sub-dvec4-02.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshi
 ft-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/bu
 ilt-in-functions/vs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uvec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uvec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uvec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-function
 s/tcs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-u64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-u64vec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-u64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-
 i64vec3-u64vec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-u64vec4.frag /usr/lib/piglit/bin/ext_instanced_arrays-vertex-attrib-divisor-index-error /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-u6
 4vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-u64vec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-u64vec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-ivec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-ivec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-ivec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/b
 uilt-in-functions/op-rshift-int64_t-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-ivec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-ivec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-ivec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-ivec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-ivec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-ivec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uvec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uvec3.frag /usr/lib/piglit/generated_tests/
 spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uvec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-int64_t-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-f
 unctions/op-rshift-i64vec3-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uvec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uvec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uvec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-ivec2.s
 hader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-i64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uint.frag
  /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uvec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uvec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uvec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-funct
 ions/op-rshift-i64vec2-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op
 -rshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-u64vec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-f
 unctions/tcs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uvec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uvec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uvec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-i64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64ve
 c3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-r
 shift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-i64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-u64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-u64vec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-u64vec4.vert /usr/lib/piglit/generated_tests/spec/ar
 b_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint.fra
 g /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-u64vec3.shader_
 test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-uint.shader_test /u
 sr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-u64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-u64vec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-u64vec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/ge
 nerated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-int.geom /usr/lib/piglit/bin/ext_instanced_arrays-instanced_arrays /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-in
 t64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-u64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-u64vec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-u64vec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2
 -uvec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uvec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uvec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec4-int.shader_test /usr/lib/pi
 glit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-u64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-u64vec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-u64vec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/
 spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-u64vec3.shader_te
 st /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-uint.sh
 ader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-u64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-u64vec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-u64vec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-uint.shader_test /usr/lib/pi
 glit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec4-u64v
 ec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-i64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-ivec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-ivec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-ivec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/
 built-in-functions/op-lshift-i64vec2-uvec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uvec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uvec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift
 -i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t-uint64_t.frag /usr/lib/piglit/gen
 erated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uvec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uvec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uvec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/e
 xecution/built-in-functions/tcs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/b
 uilt-in-functions/cs-op-rshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-fun
 ctions/op-lshift-i64vec2-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-ls
 hift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execut
 ion/built-in-functions/cs-op-rshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/s
 pec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-i64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-ivec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-ivec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-ivec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-int.frag"
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+0f4a875b05" to "1.0+gitrAUTOINC+c39bc6062a"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2048227971 to 2050579444 (+0%)

--===============2147508842823491718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 71 recipes from the core2-32 sysroot...done.
Removing 80 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e8dda21ec19514ed1a1d93173f3e2c2dea48c40f"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 331 Local 301 Mirrors 0 Missed 30 Current 199 (90% match, 94% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 200 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 206 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package_setscene)
NOTE: Running setscene task 208 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 217 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 241 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 242 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 245 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 248 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 261 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running task 812 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: Running task 817 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 821 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 835 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 854 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 856 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 857 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 267 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running task 897 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 269 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 270 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 275 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 276 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 950 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: Running task 951 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 952 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/mesa/2_23.0.2-r0/temp/log.do_packagedata_setscene.2069725
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 280 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_package_setscene)
NOTE: Running task 953 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_fetch: Succeeded
NOTE: Running task 954 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 955 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 956 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Started
NOTE: Running task 957 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_package_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 966 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: Running setscene task 286 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 971 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 294 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 977 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1013 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 329 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1038 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_unpack: Succeeded
NOTE: Running task 1051 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1056 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-2_23.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 341 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1062 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1063 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1064 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 365 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1090 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_lic: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to b4b3ffba959272b41ccf603098af5d87c580e5aa4593a60f68aee92c87aa5233
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 407 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 456 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 503 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 505 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 517 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1684 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata)
NOTE: Running task 1688 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1691 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1772 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1830 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: Running task 1831 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: Running task 1835 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1839 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1840 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1841 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1842 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1844 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1845 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1846 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1847 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: Running task 1848 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_compile)
NOTE: recipe eudev-3.2.11-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1849 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1850 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1851 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1852 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1853 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1854 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_compile: Succeeded
NOTE: Running task 1855 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1856 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe eudev-3.2.11-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe eudev-3.2.11-r0: task do_install: Succeeded
NOTE: Running task 1857 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot)
NOTE: Running task 1858 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_package)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1859 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1860 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1861 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Succeeded
NOTE: Running task 1862 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1863 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1864 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1865 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1866 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1867 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1868 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1869 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1870 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1871 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1872 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1873 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_configure: Succeeded
NOTE: Running task 1874 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_compile: Succeeded
NOTE: Running task 1875 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_install: Succeeded
NOTE: Running task 1876 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1877 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package: Succeeded
NOTE: Running task 1878 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_packagedata: Succeeded
NOTE: Running task 1879 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1880 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1881 of 1881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1881 tasks of which 1804 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 34 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2147508842823491718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e8dda21ec19514ed1a1d93173f3e2c2dea48c40f"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 23 Mirrors 0 Missed 27 Current 498 (46% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 533 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/mesa/2_23.0.2-r0/temp/log.do_packagedata_setscene.1988606
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 547 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_package_setscene)
NOTE: Running task 1475 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1533 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1618 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1672 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1674 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1675 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1775 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1873 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_fetch: Started
NOTE: Running task 1874 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: Running task 1881 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1882 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 1883 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1884 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1885 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1886 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1889 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_package_setscene: Started
NOTE: Running task 1890 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1891 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1892 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1893 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1894 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1895 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1896 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe mesa-2_23.0.2-r0: task do_package_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1908 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata)
NOTE: Running task 1909 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: Running task 1910 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_unpack: Succeeded
NOTE: Running task 1911 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1912 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_patch: Succeeded
NOTE: Running task 1913 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1914 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1915 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1916 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to b4b3ffba959272b41ccf603098af5d87c580e5aa4593a60f68aee92c87aa5233
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1917 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1918 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1919 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1920 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1921 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1922 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1923 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1924 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1925 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1926 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1927 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1928 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1929 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1930 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1931 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1932 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1933 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1934 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1935 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1936 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1937 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1938 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1939 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1940 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1941 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1942 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_configure: Succeeded
NOTE: Running task 1943 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_compile: Succeeded
NOTE: Running task 1944 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_install: Succeeded
NOTE: Running task 1945 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1946 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package: Succeeded
NOTE: Running task 1947 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_packagedata: Succeeded
NOTE: Running task 1948 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1949 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1950 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1950 tasks of which 1883 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 34 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2147508842823491718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e8dda21ec19514ed1a1d93173f3e2c2dea48c40f"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 22 Mirrors 0 Missed 28 Current 498 (44% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 533 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/mesa/2_23.0.2-r0/temp/log.do_packagedata_setscene.1743634
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 547 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_package_setscene)
NOTE: Running task 1475 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1533 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1618 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1672 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1675 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1676 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1776 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1859 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1866 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1867 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1868 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 1869 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1870 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1871 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1872 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1879 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: Running task 1885 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_package_setscene: Started
NOTE: Running task 1889 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1890 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1891 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1892 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1893 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1894 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1895 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_unpack: Succeeded
NOTE: Running task 1896 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1908 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata)
NOTE: Running task 1909 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_patch: Succeeded
NOTE: Running task 1910 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1911 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: Running task 1912 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1913 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1914 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to b4b3ffba959272b41ccf603098af5d87c580e5aa4593a60f68aee92c87aa5233
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1915 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1916 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1917 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1918 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 1919 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1920 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1921 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1922 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1923 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1924 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1925 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1926 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1927 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1928 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1929 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1930 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1931 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1932 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1933 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1934 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1935 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1936 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1937 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1938 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1939 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1940 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1941 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1942 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_configure: Succeeded
NOTE: Running task 1943 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_compile: Succeeded
NOTE: Running task 1944 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_install: Succeeded
NOTE: Running task 1945 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1946 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package: Succeeded
NOTE: Running task 1947 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_packagedata: Succeeded
NOTE: Running task 1948 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1949 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+c39bc6062a-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1950 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1950 tasks of which 1882 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 34 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.0.3-r0 to 2:23.0.2-r0) [version-going-backwards]
ERROR: mesa-2_23.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2147508842823491718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_sha
 der_int64/execution/built-in-functions/tcs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-i64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/s
 pec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/bin/ext_instanced_arrays-instanced_arrays /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-u64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-u64vec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-u64vec4.vert /usr/lib/piglit/tests/spec/arb_vertex_attrib_64bit/execution/unused-sub-dvec4-01.shader_test /usr/lib/piglit/tests/spec/arb
 _vertex_attrib_64bit/execution/unused-sub-dvec4-02.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-ivec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-ivec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-ivec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-ivec2
 .vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-ivec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-ivec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uvec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-i64vec2.shader_test /usr/l
 ib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-u64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-u64vec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-u64vec4.vert /usr/lib/pig
 lit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-u64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-u64vec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-u64vec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec3-uint64_t.shader_test /usr/lib/pigl
 it/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-ivec4.shader_test /u
 sr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-uint.shader_te
 st /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-uint.shader
 _test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-ivec2.s
 hader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uvec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uvec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uvec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-i64vec2.shader_test /usr/lib/
 piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-int.ve
 rt /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/pig
 lit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uvec2.vert /usr/lib/pig
 lit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uvec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uvec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-uint64_t.shader_test /usr/
 lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uint.geom /usr/lib/piglit/generated_test
 s/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t
 -uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-i64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-u64vec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-u64vec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-u64vec2.frag /usr/lib/piglit/generated_tests
 /spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_te
 sts/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uvec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uvec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uvec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-i64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-ivec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/buil
 t-in-functions/op-lshift-u64vec3-ivec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-ivec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execut
 ion/built-in-functions/cs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shad
 er_int64/execution/built-in-functions/fs-op-rshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_g
 pu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uvec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uvec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uvec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int
 64/execution/built-in-functions/cs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_sha
 der_int64/execution/built-in-functions/fs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-ivec2.frag /usr/lib/piglit/generated_tests/spec
 /arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-ivec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-ivec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-ivec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-ivec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-ivec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uvec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uvec3.frag 
 /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uvec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec2-ivec2.shader_test 
 /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-u64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-u64vec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-u64vec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated
 _tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/genera
 ted_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-uint64_t
 .shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i
 64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uvec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uvec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uvec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-int.vert /usr/lib/piglit/generated_tests/spec/
 arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generate
 d_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-i64vec2.shader_test /usr
 /lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-int.sh
 ader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-ivec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-ivec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-ivec4.geom /usr/lib/piglit/genera
 ted_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-i64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uvec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uvec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uvec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-i64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-ivec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-ivec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-ivec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift
 -u64vec2-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-int64_t-int.vert /usr/lib/piglit/generated_tests/spec
 /arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-
 u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-uint.shader_test 
 /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/ge
 nerated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec4-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec3-uint.shader_
 test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-i64vec2.geom 
 /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-int64_t-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-int64_t-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshi
 ft-u64vec2-uvec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uvec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uvec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-u64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-u64vec3.frag /usr/lib/piglit/generated_tests/spec/a
 rb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-u64vec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-i64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_sha
 der_int64/execution/built-in-functions/vs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_g
 pu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb
 _gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-uint64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-ivec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec4-ivec4.shader_test /usr/lib/piglit/g
 enerated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec4-uvec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-ivec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-ivec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-ivec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_g
 pu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_
 shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/bin/ext_instanced_arrays-vertex-attrib-divisor-index-error /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-u64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-u64vec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-u64vec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-uint64_
 t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/gen
 erated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-int64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-int64_t-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_sha
 der_int64/compiler/built-in-functions/op-lshift-i64vec2-i64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-ivec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-ivec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-ivec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functi
 ons/cs-op-lshift-i64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec2-uint.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-uint64_t-int.shader_test /usr/lib/pig
 lit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_test
 s/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-int64_t-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uvec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uvec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t-int.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i6
 4vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-o
 p-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec3-int.shader_test /usr/li
 b/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec3-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/a
 rb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-i64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/genera
 ted_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-i64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec4-uint64_t.shader_test /
 usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-u64vec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-u64vec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-u64vec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functi
 ons/op-lshift-i64vec2-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-int.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uvec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uvec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec4-u64vec4.shader
 _test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec3-u64vec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-o
 p-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-fun
 ctions/gs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-u64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-u64vec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-u64vec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec4-uint64_t.
 shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-u64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-u64vec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-u64vec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-i64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec4-u64vec4.shader_test /usr
 /lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec4-u64vec4.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-u64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-i64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-uint64_t-
 uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/vs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u
 64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/gs-op-rshift-i64vec2-u64vec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functio
 ns/tcs-op-rshift-i64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-uvec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec2-ivec2.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uvec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uvec3.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uvec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-ivec2.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-ivec3.ver
 t /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-ivec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-ivec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-ivec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-ivec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution
 /built-in-functions/fs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-lshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-i64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/cs-op-rshift-u64vec3-ivec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int6
 4/execution/built-in-functions/cs-op-rshift-u64vec3-uvec3.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-int64_t-uint64_t.vert /usr/lib/pig
 lit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec2-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec3-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec4-u64vec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec2-u64vec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-u64vec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-u64vec3-int.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-i64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-i
 n-functions/op-rshift-u64vec2-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-u64vec2.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-u64vec3.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-u64vec4.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-i64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64ve
 c2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec3-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-u64vec4-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-i64vec2-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint64_t.frag /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-ivec2.g
 eom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-ivec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-ivec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-int64_t-uint64_t.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-int64_t-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec2-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec3-uint64_t.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-lshift-i64vec4-uint64_t.geom /usr/lib/piglit/generated_tests
 /spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-uint64_t-uint64_t.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-i64vec4-uvec4.vert /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec2-uvec2.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec3-uvec3.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/compiler/built-in-functions/op-rshift-u64vec4-uvec4.geom /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-lshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/tcs-op-rshift-uint64_t-int.shader_test /usr/lib/piglit/generated_tests/spec/arb_gpu_shader_int64/execution/built-in-functions/fs-op-lshift-u64vec2-uint64_t.shader_test"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+0f4a875b05 to 1.0+gitr0+c39bc6062a

--===============2147508842823491718==--

